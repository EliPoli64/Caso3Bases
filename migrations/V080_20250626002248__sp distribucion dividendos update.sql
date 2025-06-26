CREATE OR ALTER PROCEDURE dbo.sp_RepartirDividendos
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE 
        @proyectoID INT,
        @reporteID INT,
        @montoGanancia DECIMAL(18,2),
        @totalInversion DECIMAL(18,2),
        @usuarioID INT,
        @montoDistribuido DECIMAL(18,2),
        @transaccionID BIGINT,
        @fechaActual DATETIME = GETDATE(),
        @hashVerificacion VARBINARY(256),
        @descripcionLog VARCHAR(100) = 'Reparto de Dividendos',
        @errorMsg VARCHAR(500),
        @logMessage VARCHAR(100),
        @logID INT,
        @intentoPagoID INT;  -- Declarado aquí para evitar duplicados

    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. Validar proyecto con fiscalización aprobada
        SELECT TOP 1 
            @proyectoID = rg.proyectoID, 
            @reporteID = rg.reporteID, 
            @montoGanancia = rg.montoGanancia
        FROM pv_reporteGanancias rg
        INNER JOIN pv_proyecto p ON rg.proyectoID = p.proyectoID
        INNER JOIN pv_fiscalizacionGanancias fg ON rg.reporteID = fg.reporteID
        WHERE p.estadoID NOT IN (4, 5, 6, 9)
          AND fg.estadoFiscalizacionID = 2
          AND rg.validado = 1
          AND NOT EXISTS (
                SELECT 1 
                FROM pv_distribucionDividendos dd 
                WHERE dd.proyectoID = rg.proyectoID
            );

        IF @proyectoID IS NULL
        BEGIN
            SET @errorMsg = 'No hay proyectos válidos con fiscalización aprobada.';
            RAISERROR(@errorMsg, 16, 1);
        END;

        -- 2. Calcular total invertido
        SELECT @totalInversion = SUM(CAST(t.monto AS DECIMAL(18,2)))
        FROM pv_inversion i
        INNER JOIN pv_transaccion t ON i.transaccionID = t.transaccionID
        WHERE i.proyectoID = @proyectoID;

        -- 3. Calcular equity por inversionista
        DECLARE investor_cursor CURSOR LOCAL FORWARD_ONLY FOR
        SELECT 
            i.usuarioID,
            (CAST(t.monto AS DECIMAL(18,2)) / @totalInversion) * @montoGanancia
        FROM pv_inversion i
        INNER JOIN pv_transaccion t ON i.transaccionID = t.transaccionID
        WHERE i.proyectoID = @proyectoID;

        OPEN investor_cursor;
        FETCH NEXT FROM investor_cursor INTO @usuarioID, @montoDistribuido;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- 4. Validar medio de depósito
            IF NOT EXISTS (
                SELECT 1 
                FROM pv_metodosPagoUsuarios 
                WHERE usuarioID = @usuarioID
            )
            BEGIN
                SET @errorMsg = CONCAT('Inversionista ', @usuarioID, ' sin medio de depósito registrado.');
                RAISERROR(@errorMsg, 16, 1);
            END;

            -- 5. Insertar intento de pago 
            INSERT INTO pv_intentoPago (
                monto, actualMonto, resultado, numeroAuth, reference, tokenCargo, 
                descripcion, fecha, checksum, metodoPagoID, monedaID
            ) VALUES (
                @montoDistribuido, @montoDistribuido, 'success', 
                'AUTH-' + CAST(@reporteID AS VARCHAR(10)), 
                'REF-' + CAST(@reporteID AS VARCHAR(10)), 
                HASHBYTES('SHA2_256', CONVERT(VARCHAR(50), @fechaActual)),
                'Pago de dividendos', @fechaActual, 
                HASHBYTES('SHA2_256', 'checksum'), 
                1, 1
            );
            SET @intentoPagoID = SCOPE_IDENTITY();  -- Asignación sin DECLARE

            -- 6. Insertar transacción de pago 
            INSERT INTO pv_transaccion (
                usuarioID, proyectoID, monto, descripcion, 
                fechaTransaccion, fechaRegistro, referencia, checksum,
                subTipoTransaccionID, tasaCambioID, intentoPagoID
            ) VALUES (
                @usuarioID, @proyectoID, @montoDistribuido, 'Pago de dividendos',
                @fechaActual, @fechaActual, 
                CONCAT('DIV-', CAST(@reporteID AS VARCHAR(10))),
                HASHBYTES('SHA2_256', CONCAT(
                    CAST(@usuarioID AS VARCHAR(20)),
                    CAST(@montoDistribuido AS VARCHAR(50)),
                    CAST(@fechaActual AS VARCHAR(50))
                )),
                1, 1, @intentoPagoID
            );
            SET @transaccionID = SCOPE_IDENTITY();  -- Asignación sin DECLARE

            -- 7. Registrar distribución
            SET @hashVerificacion = HASHBYTES('SHA2_256', CONCAT(
                CAST(@usuarioID AS VARCHAR(20)),
                CAST(@montoDistribuido AS VARCHAR(50)),
                CAST(@fechaActual AS VARCHAR(50))
            ));
            INSERT INTO pv_distribucionDividendos (
                proyectoID, usuarioID, transaccionID, 
                montoDistribuido, fechaDistribucion, hashVerificacion --checksum
            ) VALUES (
                @proyectoID, @usuarioID, @transaccionID,
                @montoDistribuido, @fechaActual, @hashVerificacion
            );

            FETCH NEXT FROM investor_cursor INTO @usuarioID, @montoDistribuido;
        END;

        CLOSE investor_cursor;
        DEALLOCATE investor_cursor;

        COMMIT TRANSACTION;

        -- 8. Preparar y registrar log
        SET @logMessage = 'Monto: ' + CAST(@montoGanancia AS VARCHAR(20));
        EXEC @logID = dbo.SP_InsertarLog 
            @descripcion = @descripcionLog,
            @trace = 'Éxito',
            @tipologid = 1,
            @origenlogid = 1,
            @logseveridadid = 1,
            @usuario = 'sistema',
            @computador = 'azure-function',
            @refId1 = @proyectoID,
            @valor1 = @logMessage;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        SET @errorMsg = ERROR_MESSAGE();

        -- Registrar error en bitácora
        EXEC dbo.SP_InsertarLog 
            @descripcion = @descripcionLog,
            @trace = @errorMsg,
            @tipologid = 3,
            @origenlogid = 1,
            @logseveridadid = 3,
            @usuario = 'sistema',
            @computador = 'azure-function',
            @refId1 = @proyectoID;

        THROW;
    END CATCH;
END;
GO
/* 

pruebita

-- 0. Crear tipo de transacción si no existe
IF NOT EXISTS (SELECT 1 FROM pv_tipoTransaccion WHERE tipoTransaccionID = 1)
BEGIN
    SET IDENTITY_INSERT pv_tipoTransaccion ON;
    INSERT INTO pv_tipoTransaccion (tipoTransaccionID, nombre, descripcion, fechaCreacion)
    VALUES (1, 'Pagos', 'Transacciones de pago', GETDATE());
    SET IDENTITY_INSERT pv_tipoTransaccion OFF;
END

-- 1. Crear subtipo de transacción si no existe
IF NOT EXISTS (SELECT 1 FROM pv_subTipoTransaccion WHERE subTipoTransaccionID = 1)
BEGIN
    SET IDENTITY_INSERT pv_subTipoTransaccion ON;
    INSERT INTO pv_subTipoTransaccion (subTipoTransaccionID, tipoTransaccionID, nombre, descripcion, fechaCreacion)
    VALUES (1, 1, 'Dividendos', 'Pago de dividendos a inversionistas', GETDATE());
    SET IDENTITY_INSERT pv_subTipoTransaccion OFF;
END

-- 2. Crear método de pago si no existe
IF NOT EXISTS (SELECT 1 FROM pv_metodosPago WHERE metodoID = 1)
BEGIN
    SET IDENTITY_INSERT pv_metodosPago ON;
    INSERT INTO pv_metodosPago (metodoID, nombre, esActivo, configuracionJSON, logoURL)
    VALUES (1, 'Transferencia Bancaria', 1, '{"tipo":"transferencia"}', 'https://ejemplo.com/logo.png');
    SET IDENTITY_INSERT pv_metodosPago OFF;
END

-- 3. Crear moneda si no existe
IF NOT EXISTS (SELECT 1 FROM pv_moneda WHERE monedaID = 1)
BEGIN
    SET IDENTITY_INSERT pv_moneda ON;
    INSERT INTO pv_moneda (monedaID, codigo, nombre, simbolo, esPredeterminada)
    VALUES (1, 'CRC', 'Colón Costarricense', '₡', 1);
    SET IDENTITY_INSERT pv_moneda OFF;
END

-- 4. Crear propuesta necesaria para el proyecto
INSERT INTO pv_propuestas (categoriaid, descripcion, imgURL, fechaInicio, userid, fechaFin, checksum, comentarios, tipoPropuestaID, estadoID, organizacionID)
VALUES (1, 'Propuesta de prueba', 'https://ejemplo.com/img.jpg', GETDATE(), 1, DATEADD(MONTH, 1, GETDATE()), HASHBYTES('SHA2_256', 'propuesta-test'), 1, 1, 1, NULL);
DECLARE @propuestaID INT = SCOPE_IDENTITY();

-- 5. Insertar proyecto con todos los campos requeridos
INSERT INTO pv_proyecto (propuestaID, estadoID, fechaInicio, fechaEstimadaFin, fechaCreacion, metodoTrabajoID, montoPedido, porcentaje)
VALUES (@propuestaID, 2, GETDATE(), DATEADD(MONTH, 6, GETDATE()), GETDATE(), 1, 100000.00, 10.00);
DECLARE @proyectoID INT = SCOPE_IDENTITY();

-- 6. Crear usuario si no existe
IF NOT EXISTS (SELECT 1 FROM pv_usuarios WHERE userId = 1)
BEGIN
    SET IDENTITY_INSERT pv_usuarios ON;
    INSERT INTO pv_usuarios (userid, nombre, primerApellido, segundoApellido, fechaNacimiento, identificacion, nacional, checksum)
    VALUES (1, 'Usuario', 'Prueba', 'Sistema', '1990-01-01', '123456789', 1, HASHBYTES('SHA2_256', 'usuario-test'));
    SET IDENTITY_INSERT pv_usuarios OFF;
END

-- 7. Crear método disponible si no existe
IF NOT EXISTS (SELECT 1 FROM pv_metodosDisponibles WHERE metodoDisponibleID = 1)
BEGIN
    SET IDENTITY_INSERT pv_metodosDisponibles ON;
    INSERT INTO pv_metodosDisponibles (metodoDisponibleID, nombre, JSONconfigurado, refreshToken, token, expToken, maskAccount, metodoID, esActivo)
    VALUES (1, 'Método Prueba', '{}', NULL, NULL, NULL, '****1234', 1, 1);
    SET IDENTITY_INSERT pv_metodosDisponibles OFF;
END

-- 8. Insertar método de pago usuario
INSERT INTO pv_metodosPagoUsuarios (usuarioID, metodoDisponibleID)
VALUES (1, 1);

-- 9. Crear tasa de cambio si no existe
IF NOT EXISTS (SELECT 1 FROM pv_tasaCambio WHERE tasaCambioID = 1)
BEGIN
    SET IDENTITY_INSERT pv_tasaCambio ON;
    INSERT INTO pv_tasaCambio (tasaCambioID, monedaOrigen, fechaInicio, fechaFin, tasa, activa, fechaCreacion, monedaDestino)
    VALUES (1, 1, GETDATE(), DATEADD(YEAR, 1, GETDATE()), 1.0, 1, GETDATE(), 1);
    SET IDENTITY_INSERT pv_tasaCambio OFF;
END

-- 10. Insertar intento de pago
INSERT INTO pv_intentoPago (monto, actualMonto, resultado, numeroAuth, reference, tokenCargo, descripcion, fecha, checksum, metodoPagoID, monedaID)
VALUES (50000.00, 50000.00, 'success', 'AUTH123', 'REF123', HASHBYTES('SHA2_256', 'token'), 'Inversión inicial', GETDATE(), HASHBYTES('SHA2_256', 'checksum'), 1, 1);
DECLARE @intentoPagoID INT = SCOPE_IDENTITY();

-- 11. Insertar transacción
INSERT INTO pv_transaccion (usuarioID, proyectoID, monto, montoConvertido, descripcion, fechaTransaccion, fechaRegistro, referencia, checksum, subTipoTransaccionID, tasaCambioID, intentoPagoID)
VALUES (1, @proyectoID, 50000.00, 50000.00, 'Inversión inicial', GETDATE(), GETDATE(), 'INV-001', HASHBYTES('SHA2_256', 'test'), 1, 1, @intentoPagoID);
DECLARE @transaccionID BIGINT = SCOPE_IDENTITY();

-- 12. Insertar inversión
INSERT INTO pv_inversion (proyectoID, usuarioID, transaccionID)
VALUES (@proyectoID, 1, @transaccionID);

-- 13. Insertar reporte de ganancias
DECLARE @hashReporte VARBINARY(256) = HASHBYTES('SHA2_256', 'reporte');
INSERT INTO pv_reporteGanancias (proyectoID, fechaReporte, montoGanancia, validado, aprobadoPor, hashReporte)
VALUES (@proyectoID, GETDATE(), 10000.00, 1, NULL, @hashReporte);
DECLARE @reporteID INT = SCOPE_IDENTITY();

-- 14. Insertar fiscalización
DECLARE @hashFiscal VARBINARY(256) = HASHBYTES('SHA2_256', 'fiscalizacion');
INSERT INTO pv_fiscalizacionGanancias (reporteID, usuarioID, fechaFiscalizacion, estadoFiscalizacionID, comentarios, hashFiscalizacion)
VALUES (@reporteID, 1, GETDATE(), 2, 'Fiscalización aprobada', @hashFiscal);

-- 15. Ejecutar SP
EXEC dbo.sp_RepartirDividendos;

-- 16. Verificar resultados
SELECT * FROM pv_distribucionDividendos;
SELECT * FROM pv_transaccion WHERE descripcion = 'Pago de dividendos';/*