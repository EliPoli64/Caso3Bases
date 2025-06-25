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
