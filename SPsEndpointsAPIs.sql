
CREATE OR ALTER PROCEDURE dbo.sp_CrearActualizarPropuesta
    @PropuestaId      INT          = 0          OUTPUT,   -- 0 = nueva
    @CategoriaId      INT,
    @Descripcion      VARCHAR(200),
    @ImgUrl           VARCHAR(300) = NULL,
    @FechaFin         DATETIME     = NULL,
    @UserId           INT,
    @EventoId         INT,
    @BoletaId         INT          = NULL,
    @PermiteComentarios BIT        = 0
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @tranStarted BIT = 0;
    BEGIN TRY
        IF @@TRANCOUNT = 0
        BEGIN TRAN; 
        SET @tranStarted = 1;

        IF NOT EXISTS (SELECT 1
                       FROM pv_permissions p
                       JOIN pv_orgUsuarios ou ON ou.userid = @UserId
                       WHERE p.code = 'PROP_WRITE')
        BEGIN
            RAISERROR ('El usuario no tiene permisos para crear/editar propuestas', 16, 1);
        END

        DECLARE @EstadoPendiente INT;
        SELECT @EstadoPendiente = estadoID 
        FROM pv_estadoPropuesta 
        WHERE nombreEstado = 'pendiente_de_validacion';

        IF @PropuestaId = 0
        BEGIN
            INSERT INTO pv_propuestas
            (categoriaid, descripcion, imgURL, publicada, fechaInicio, userid,
             fechaFin, checksum, comentarios, eventoID, boletaID, estadoID)
            VALUES
            (@CategoriaId, @Descripcion, @ImgUrl, 0, SYSDATETIME(), @UserId,
             @FechaFin, HASHBYTES('SHA2_256', @Descripcion), @PermiteComentarios,
             @EventoId, @BoletaId, @EstadoPendiente);

            SET @PropuestaId = SCOPE_IDENTITY();

            -- Proponente principal
            INSERT INTO pv_proponente (propuestaID, usuarioID, esPrincipal)
            VALUES (@PropuestaId, @UserId, 1);
        END
        ELSE
        BEGIN
            UPDATE pv_propuestas
            SET categoriaid   = @CategoriaId,
                descripcion   = @Descripcion,
                imgURL        = @ImgUrl,
                fechaFin      = @FechaFin,
                comentarios   = @PermiteComentarios,
                boletaID      = @BoletaId,
                checksum      = HASHBYTES('SHA2_256', @Descripcion),
                estadoID      = @EstadoPendiente
            WHERE propuestaid = @PropuestaId
              AND userid      = @UserId;           -- Control de autoria
        END

        INSERT INTO pv_logs
        (descripcion, [timestamp], computador, usuario, trace, tipologid, origenlogid, logseveridadid)
        VALUES ('Cambios en propuesta', SYSDATETIME(), HOST_NAME(), SYSTEM_USER,
                CONCAT('PropuestaId=',@PropuestaId), 1, 1, 1);

        COMMIT;
        INSERT INTO pv_eventoSistema (tipoEvento, entidad, entidadId, payload)
        VALUES (
          'PropuestaCreada',
          'Propuesta',
          @PropuestaId,
          JSON_QUERY(
          CONCAT(
            '{"descripcion":"', @Descripcion, '", "categoriaId":', @CategoriaId, ', "userId":', @UserId, '}'
          )
          )
        );
        SELECT 0 AS Codigo, 'Propuesta procesada', @PropuestaId AS PropuestaId;
    END TRY
    BEGIN CATCH
        IF @tranStarted = 1 ROLLBACK;
        SELECT ERROR_NUMBER() AS Codigo, ERROR_MESSAGE() AS Mensaje;
    END CATCH
END;
GO


CREATE OR ALTER PROCEDURE dbo.sp_RevisarPropuesta
    @PropuestaId INT,
    @RevisorId   INT,
    @EsAprobada  BIT,
    @Comentario  VARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @tranStarted BIT = 0;
    BEGIN TRY
        IF @@TRANCOUNT = 0
        BEGIN TRAN; SET @tranStarted = 1;

        DECLARE @NuevoEstado INT;
        SELECT @NuevoEstado = estadoID
        FROM pv_estadoPropuesta
        WHERE nombreEstado = CASE WHEN @EsAprobada = 1 THEN 'publicada' ELSE 'rechazada' END;

        UPDATE pv_propuestas
        SET estadoID  = @NuevoEstado
        WHERE propuestaid = @PropuestaId;

        INSERT INTO pv_logs
            (descripcion, [timestamp], computador, usuario, trace,
             tipologid, origenlogid, logseveridadid)
        VALUES
            ('Revision de propuesta', SYSDATETIME(), HOST_NAME(), SYSTEM_USER,
             CONCAT('PropuestaId=',@PropuestaId,';Aprobada=',@EsAprobada),
             2, 1, 1);

        COMMIT;
        INSERT INTO pv_eventoSistema (tipoEvento, entidad, entidadId, payload)
        VALUES (
          'PropuestaRevisada',
          'Propuesta',
          @PropuestaId,
          JSON_QUERY(
          CONCAT('{"aprobada":', @EsAprobada, ', "comentario":"', ISNULL(@Comentario, ''), '"}')
          )
        );
        SELECT 0 AS Codigo, 'Propuesta revisada';
    END TRY
    BEGIN CATCH
        IF @tranStarted = 1 ROLLBACK;
        SELECT ERROR_NUMBER() AS Codigo, ERROR_MESSAGE() AS Mensaje;
    END CATCH
END;
GO


CREATE OR ALTER PROCEDURE dbo.sp_Invertir
    @ProyectoId INT,
    @InversorId INT,
    @Monto      DECIMAL(18,2),
    @MonedaId   INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @tranStarted BIT = 0;
    BEGIN TRY
        IF @@TRANCOUNT = 0
        BEGIN TRAN; SET @tranStarted = 1;

        /* 1. Validar estado del proyecto */
        DECLARE @EstadoAprobado INT;
        SELECT @EstadoAprobado = estadoID
        FROM pv_estadoProyecto
        WHERE nombreEstado = 'aprobado_para_inversion';

        IF NOT EXISTS (SELECT 1 FROM pv_proyectos WHERE proyectoID = @ProyectoId AND estadoID = @EstadoAprobado)
        BEGIN RAISERROR('El proyecto no esta aprobado para inversion', 16, 1); END

        /* 2. Calcular equity */
        DECLARE @ValorTotal DECIMAL(18,2) = (SELECT valorMeta FROM pv_proyectos WHERE proyectoID = @ProyectoId);
        DECLARE @Equity DECIMAL(10,5) = @Monto / @ValorTotal;

        /* 3. Validar overflow */
        DECLARE @Acumulado DECIMAL(18,2) = ISNULL((SELECT SUM(monto) FROM pv_inversion WHERE proyectoID = @ProyectoId),0);
        IF @Acumulado + @Monto > @ValorTotal
        BEGIN RAISERROR('La inversion excede el monto requerido', 16, 1); END

        /* 4. Insertar inversion */
        INSERT INTO pv_inversion (proyectoID, inversorID, monto, monedaID, fechaInversion)
        VALUES (@ProyectoId, @InversorId, @Monto, @MonedaId, SYSDATETIME());

        /* 5. Calendario de revision (ejemplo simple, 12 tramos mensuales) */
        DECLARE @i INT = 1;
        WHILE @i <= 12
        BEGIN
            INSERT INTO pv_planDesembolso (proyectoID, numeroCuota, fechaProgramada,
                                           monto, monedaID)
            VALUES (@ProyectoId, @i, DATEADD(MONTH,@i,SYSDATETIME()),
                    @Monto/12, @MonedaId);
            SET @i += 1;
        END

        COMMIT;
        INSERT INTO pv_eventoSistema (tipoEvento, entidad, entidadId, payload)
        VALUES (
          'InversionRegistrada',
          'Proyecto',
          @ProyectoId,
          JSON_QUERY(
          CONCAT('{"usuarioId":', @InversorId, ', "monto":', @Monto, '}')
          )
        );
        SELECT 0 AS Codigo, 'Inversion registrada', @Equity AS EquityAsignado;
    END TRY
    BEGIN CATCH
        IF @tranStarted = 1 ROLLBACK;
        SELECT ERROR_NUMBER() AS Codigo, ERROR_MESSAGE() AS Mensaje;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_RepartirDividendos
    @ProyectoId   INT,
    @MontoGanancia DECIMAL(18,2),
    @MonedaId     INT,
    @FechaPago    DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @FechaPago IS NULL SET @FechaPago = SYSDATETIME();

    DECLARE @tranStarted BIT = 0;
    BEGIN TRY
        IF @@TRANCOUNT = 0
        BEGIN TRAN; SET @tranStarted = 1;

        /* 1. Validar estado del proyecto */
        DECLARE @EstadoEjec INT;
        SELECT @EstadoEjec = estadoID FROM pv_estadoProyecto WHERE nombreEstado = 'ejecutando';

        IF NOT EXISTS (SELECT 1 FROM pv_proyectos WHERE proyectoID = @ProyectoId AND estadoID = @EstadoEjec)
        BEGIN RAISERROR('El proyecto no esta en ejecucion', 16, 1); END

        /* 2. Total invertido */
        DECLARE @TotalInvertido DECIMAL(18,2) =
            (SELECT SUM(monto) FROM pv_inversion WHERE proyectoID = @ProyectoId);

        IF @TotalInvertido = 0
        BEGIN RAISERROR('No existen inversiones para este proyecto', 16, 1); END

        /* 3. Distribuci�n */
        DECLARE c CURSOR LOCAL FOR
            SELECT inversionID, inversorID, monto
            FROM pv_inversion
            WHERE proyectoID = @ProyectoId;

        DECLARE @InversionId INT, @InversorId INT, @MontoInversion DECIMAL(18,2);
        OPEN c;
        FETCH NEXT FROM c INTO @InversionId, @InversorId, @MontoInversion;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            DECLARE @Pago DECIMAL(18,2) = ROUND(@MontoGanancia * (@MontoInversion / @TotalInvertido), 2);

            INSERT INTO pv_pagoInversor
                (proyectoID, inversorID, monto, monedaID, fechaProgramada, estado)
            VALUES
                (@ProyectoId, @InversorId, @Pago, @MonedaId, @FechaPago, 'pendiente');

            FETCH NEXT FROM c INTO @InversionId, @InversorId, @MontoInversion;
        END
        CLOSE c; DEALLOCATE c;

        COMMIT;
        INSERT INTO pv_eventoSistema (tipoEvento, entidad, entidadId, payload)
        VALUES (
          'DividendosDistribuidos',
          'Proyecto',
          @ProyectoId,
          JSON_QUERY(
          CONCAT('{"montoTotal":', @MontoGanancia, ', "monedaId":', @MonedaId, '}')
          )
        );
        SELECT 0 AS Codigo, 'Dividendos generados';
    END TRY
    BEGIN CATCH
        IF @tranStarted = 1 ROLLBACK;
        SELECT ERROR_NUMBER() AS Codigo, ERROR_MESSAGE() AS Mensaje;
    END CATCH
END;
GO