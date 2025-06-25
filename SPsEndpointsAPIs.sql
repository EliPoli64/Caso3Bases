CREATE PROCEDURE dbo.crearActualizarPropuesta
(
    @PropuestaID           INT             = NULL,      -- NULL = nueva
    @CategoriaID           INT,
    @Descripcion           VARCHAR(200)    = NULL,
    @ImgURL                VARCHAR(300)    = NULL,
    @FechaInicio           DATETIME        = NULL,
    @FechaFin              DATETIME        = NULL,
    @Comentarios           BIT,
    @TipoPropuestaID       INT,
    @OrganizacionID        INT             = NULL,
    @SegmentosDirigidosJS  NVARCHAR(MAX)   = NULL,      -- ej: [1,2,3]
    @SegmentosImpactoJS    NVARCHAR(MAX)   = NULL,      -- ej: [4,5]
    @AdjuntosJS            NVARCHAR(MAX)   = NULL,      -- ej: [{url:'...',tipo:1},...]
    @UsuarioAccion         INT,                         -- usuario que llama el SP
    @EquipoOrigen          VARCHAR(50)     = NULL
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DECLARE @Ahora DATETIME = SYSUTCDATETIME();
        IF @FechaInicio IS NULL SET @FechaInicio = @Ahora;

        BEGIN TRAN;

        -- valida permisos (solo para UPDATE)
        IF @PropuestaID IS NOT NULL
        BEGIN
            IF NOT EXISTS ( SELECT 1
                            FROM dbo.pv_proponente
                            WHERE propuestaID = @PropuestaID
                              AND usuarioID   = @UsuarioAccion
                              AND esPrincipal = 1 )
            BEGIN
                RAISERROR('El usuario no tiene permiso para modificar esta propuesta.',16,1);
                ROLLBACK; RETURN;
            END
        END

        -- insert/update de pv_propuestas
        DECLARE @EsNueva BIT = IIF(@PropuestaID IS NULL,1,0);

        IF @EsNueva = 1
			BEGIN
				SELECT HASHBYTES('SHA2_256', CONCAT_WS('|',@CategoriaID,@Descripcion,@ImgURL,@FechaInicio,@UsuarioAccion,@FechaFin,@Comentarios,@TipoPropuestaID,@OrganizacionID));
				INSERT dbo.pv_propuestas
				( categoriaid, descripcion, imgURL, fechaInicio,
				  userid, fechaFin, checksum, comentarios,
				  tipoPropuestaID, estadoID, organizacionID )
				VALUES
				( @CategoriaID, @Descripcion, @ImgURL, @FechaInicio,
				  @UsuarioAccion, @FechaFin,
				  HASHBYTES('SHA2_256', CONCAT_WS('|',@CategoriaID,@Descripcion,@ImgURL,@FechaInicio,@UsuarioAccion,@FechaFin,@Comentarios,@TipoPropuestaID,@OrganizacionID)),
				  @Comentarios, @TipoPropuestaID,
				  /* estado pendiente de validación */ (SELECT TOP(1) estadoID
														FROM dbo.pv_estadoPropuesta
														WHERE nombreEstado = N'En Revision' ),
				  @OrganizacionID );

				SET @PropuestaID = SCOPE_IDENTITY();
			END
        ELSE
        BEGIN
            UPDATE dbo.pv_propuestas
              SET categoriaid     = @CategoriaID,
                  descripcion     = @Descripcion,
                  imgURL          = @ImgURL,
                  fechaInicio     = @FechaInicio,
                  fechaFin        = @FechaFin,
                  comentarios     = @Comentarios,
                  tipoPropuestaID = @TipoPropuestaID,
                  organizacionID  = @OrganizacionID,
                  checksum        = HASHBYTES('SHA2_256', CONCAT_WS('|',@CategoriaID,@Descripcion,@ImgURL,@FechaInicio,@UsuarioAccion,@FechaFin,@Comentarios,@TipoPropuestaID,@OrganizacionID))
            WHERE propuestaid = @PropuestaID;
        END

        -- ctrl versiones
        DECLARE @NuevoNumVersion INT;

        SELECT @NuevoNumVersion = ISNULL(MAX(numeroVersion),0)+1
        FROM   dbo.pv_versionPropuesta
        WHERE  propuestaID = @PropuestaID;

        INSERT dbo.pv_versionPropuesta
        (propuestaID, numeroVersion, descripcion, fechaCreacion)
        VALUES
        (@PropuestaID, @NuevoNumVersion, ISNULL(@Descripcion,'‑'), @Ahora);

        DECLARE @VersionID INT = SCOPE_IDENTITY();

        -- guardar segmentos meta
        -- elimina asociaciones previas solo en UPDATE
        IF @EsNueva = 0
		BEGIN
			UPDATE dbo.pv_propuestaSegmentosDirigidos
			   SET deleted   = 1,
				   checksum  = HASHBYTES('SHA2_256',
										 CONCAT_WS('|', propuestaID, segementoID, usuarioID, 1))
			 WHERE propuestaID = @PropuestaID
			   AND deleted     = 0;   -- solo las filas activas
		END

        -- inserta nuevos (json -> tabla)
        IF @SegmentosImpactoJS IS NOT NULL
		BEGIN
			;WITH jsonSeg (segID) AS (
				SELECT value
				  FROM OPENJSON(@SegmentosImpactoJS)
			)
			MERGE dbo.pv_propuestaSegmentosImpacto       AS tgt
			USING jsonSeg                                AS src
				  ON  tgt.propuestaID = @PropuestaID
				  AND tgt.segmentoID = src.segID
			WHEN MATCHED AND tgt.deleted = 1 THEN        -- ya existía pero estaba marcado como eliminado
				UPDATE SET deleted   = 0,
							usuarioID = @UsuarioAccion,
							checksum  = HASHBYTES('SHA2_256',
												  CONCAT_WS('|', @PropuestaID, src.segID, @UsuarioAccion, 0))
			WHEN NOT MATCHED THEN
				INSERT (propuestaID, segmentoID, usuarioID, deleted, checksum)
				VALUES (@PropuestaID,
						src.segID,
						@UsuarioAccion,
						0, -- activo
						HASHBYTES('SHA2_256',
								  CONCAT_WS('|', @PropuestaID, src.segID, @UsuarioAccion, 0)));
		END

        -- adjuntos
        IF @AdjuntosJS IS NOT NULL
        BEGIN
            DECLARE @Doc TABLE (documentoID INT);

            -- crea registros en pv_documento
            INSERT dbo.pv_documento (nombre, fechaCreacion, tipoDocumentoID, estadoDocumentoID,
                                     ultimaModificacion, esActual, idLegal, checksum)
            OUTPUT INSERTED.documentoID INTO @Doc(documentoID)
            SELECT JSON_VALUE(value,'$.nombre'),
                   @Ahora,
                   JSON_VALUE(value,'$.tipoDocumentoID'),
                   (SELECT TOP 1 estadoDocumentoID
                    FROM dbo.pv_estadoDocumento
                    WHERE nombre = N'En revisión'),
                   @Ahora,
                   1,
                   JSON_VALUE(value,'$.idLegal'),
                   HASHBYTES('SHA2_256', JSON_VALUE(value,'$.nombre'))
            FROM OPENJSON(@AdjuntosJS);

            -- asocia a la propuesta
            INSERT dbo.pv_documentosPropuestas (propuestaID, documentoID, esActivo)
            SELECT @PropuestaID, documentoID, 1
            FROM @Doc;
        END
        -- crear registro de validacion interna
        INSERT dbo.pv_validacionPropuesta
        (versionID, grupoID, fechaValidacion, estado, comentarios, fechaCreacion)
        VALUES
        (@VersionID,
         -- validadores genericos 
         (SELECT TOP 1 grupoID FROM dbo.pv_grupoValidador WHERE tipoID = 1 ORDER BY grupoID),
         @Ahora, N'En revisión', NULL, @Ahora);
        -- crear logs
        INSERT dbo.pv_logs
        (descripcion, [timestamp], computador, usuario, trace,
         refId1, refId2, checksum, tipologid, origenlogid, logseveridadid)
        VALUES
        ( IIF(@EsNueva=1,'Creación de propuesta','Actualización de propuesta'),
          @Ahora, @EquipoOrigen, CAST(@UsuarioAccion AS VARCHAR(50)),
          CONCAT('PropuestaID=',@PropuestaID,';Version=',@NuevoNumVersion),
          @PropuestaID, @VersionID,
          HASHBYTES('SHA2_256', CONCAT(@PropuestaID,@Ahora)),
          (SELECT TOP 1 tipologid 
			FROM dbo.pv_logTipos 
			WHERE nombre = IIF(@EsNueva = 1, 'PropuestaCreada', 'PropuestaActualizada')),
          (SELECT TOP 1 origenlogid FROM dbo.pv_logOrigen WHERE nombre='API'),
          (SELECT TOP 1 logseveridadid FROM dbo.pv_severidadLogs WHERE nombre='Info') );

        COMMIT;

        SELECT 'OK'   AS Resultado,
               @PropuestaID     AS PropuestaID,
               @NuevoNumVersion AS VersionCreada;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 ROLLBACK;
        DECLARE @Msg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@Msg,16,1);
    END CATCH
END
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
        SELECT 0 AS Codigo, 'Inversion registrada', @Equity AS EquityAsignado;
    END TRY
    BEGIN CATCH
        IF @tranStarted = 1 ROLLBACK;
        SELECT ERROR_NUMBER() AS Codigo, ERROR_MESSAGE() AS Mensaje;
    END CATCH
END;
GO

CREATE PROCEDURE sp_repartirDividendos
    @proyectoID INT,
    @montoGanancia DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validar que el proyecto esté activo (excluyendo estados no válidos)
        IF NOT EXISTS (
            SELECT 1
            FROM pv_proyecto
            WHERE proyectoID = @proyectoID AND estadoID NOT IN (4, 5, 6, 9) -- Cancelado, Rechazado, Revisión, Postergado
        )
        BEGIN
            RAISERROR('El proyecto no está activo.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Verificar que tiene al menos una fiscalización aprobada
        IF NOT EXISTS (
            SELECT 1 FROM pv_etapasProyecto
            WHERE proyectoID = @proyectoID
            AND statusEtapaProyID IN (
                SELECT statusEtapaProyID FROM pv_statusEtapaProyecto WHERE nombre = 'Aprobada'
            )
        )
        BEGIN
            RAISERROR('No hay fiscalizaciones aprobadas.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Verificar que haya un reporte de ganancia aprobado
        IF NOT EXISTS (
            SELECT 1 FROM pv_reporteGanancias
            WHERE proyectoID = @proyectoID AND validado = 1
        )
        BEGIN
            RAISERROR('No hay reporte de ganancias aprobado para este proyecto.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Consulta de inversionistas con equity
        SELECT i.usuarioID, i.transaccionID, t.monto,
               t.monto / SUM(t.monto) OVER(PARTITION BY i.proyectoID) AS porcentajeParticipacion
        INTO #Inversionistas
        FROM pv_inversion i
        INNER JOIN pv_transaccion t ON i.transaccionID = t.transaccionID
        WHERE i.proyectoID = @proyectoID;

        -- Validar que todos tengan métodos de pago
        IF EXISTS (
            SELECT 1 FROM #Inversionistas inv
            WHERE NOT EXISTS (
                SELECT 1 FROM pv_metodosPagoUsuarios mpu
                WHERE mpu.usuarioID = inv.usuarioID
            )
        )
        BEGIN
            RAISERROR('Algunos inversionistas no tienen método de pago.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Variables para iteración
        DECLARE @usuarioID INT, @montoDistribuido DECIMAL(18,2), @transaccionID INT, @referencia NVARCHAR(50);
        DECLARE @hashVerificacion VARBINARY(32);

        -- Cursor para distribuir dividendos
        DECLARE cur CURSOR FOR
            SELECT usuarioID,
                   ROUND(porcentajeParticipacion * @montoGanancia, 2) AS montoDistribuido
            FROM #Inversionistas;

        OPEN cur;
        FETCH NEXT FROM cur INTO @usuarioID, @montoDistribuido;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @referencia = CONCAT('DIV-', NEWID());

            -- Insertar transacción
            INSERT INTO pv_transaccion (
                usuarioID, proyectoID, monto, descripcion,
                fechaTransaccion, fechaRegistro, referencia
            )
            VALUES (
                @usuarioID, @proyectoID, @montoDistribuido,
                'Distribución de dividendos',
                GETDATE(), GETDATE(), @referencia
            );

            -- Obtener ID de la transacción generada
            SET @transaccionID = SCOPE_IDENTITY();

            -- Generar hash de verificación (SHA-256 simulado con HASHBYTES)
            SET @hashVerificacion = HASHBYTES('SHA2_256', 
                CONVERT(NVARCHAR, @proyectoID) + '-' +
                CONVERT(NVARCHAR, @usuarioID) + '-' +
                CONVERT(NVARCHAR, @transaccionID) + '-' +
                CONVERT(NVARCHAR, @montoDistribuido) + '-' +
                CONVERT(NVARCHAR, GETDATE(), 126)
            );

            -- Insertar ciclo de distribución
            INSERT INTO pv_distribucionDividendos (
                proyectoID, usuarioID, transaccionID,
                montoDistribuido, fechaDistribucion, hashVerificacion
            )
            VALUES (
                @proyectoID, @usuarioID, @transaccionID,
                @montoDistribuido, GETDATE(), @hashVerificacion
            );

            FETCH NEXT FROM cur INTO @usuarioID, @montoDistribuido;
        END

        CLOSE cur;
        DEALLOCATE cur;

        COMMIT TRANSACTION;
        PRINT CONCAT('Distribución realizada para proyecto ', @proyectoID, ' con ganancia ', @montoGanancia);
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @msg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@msg, 16, 1);
    END CATCH
SELECT * FROM pv_transaccion WHERE descripcion = 'Distribución de dividendos' AND proyectoID = @proyectoID;

SELECT * FROM pv_distribucionDividendos WHERE proyectoID = @proyectoID;
END;
