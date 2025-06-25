CREATE PROCEDURE [dbo].[invertir] 
    @proyecto VARCHAR(50),
    @monto DECIMAL(12,3),
    @moneda VARCHAR(3),
    @cedula VARCHAR(9),
    @contrasenna VARCHAR(50),
    @organizacion VARCHAR(100) = NULL,
    @metodoPago VARCHAR(100)
AS BEGIN
    SET NOCOUNT ON
    -- Obtener valores de logs para los posibles escenarios
    DECLARE @origenLogID INT;
    DECLARE @tipoLogInversion INT;
    DECLARE @tipoLogError INT;
    DECLARE @severidadInfo INT;
    DECLARE @severidadError INT;
    SELECT @origenLogID = origenlogid FROM pv_logOrigen WHERE nombre = 'Web UI';
    SELECT @tipoLogInversion = tipologid FROM pv_logTipos WHERE nombre = 'InversionRegistrada';
    SELECT @tipoLogError = tipologid FROM pv_logTipos WHERE nombre = 'Error';
    SELECT @severidadInfo = logseveridadid FROM pv_severidadLogs WHERE nombre = 'Info';
    SELECT @severidadError = logseveridadid FROM pv_severidadLogs WHERE nombre = 'Error';
    
    -- Variables para la validación y la inserción de los datos
    DECLARE @proyectoID INT;
    DECLARE @usuario INT;
    DECLARE @idAprobado INT;
    DECLARE @llaveCifrada VARBINARY(256);
    DECLARE @montoReal DECIMAL(12,3);
    DECLARE @tasaCambioID INT;
    DECLARE @monedaOrigen INT;
    DECLARE @monedaDestino INT;
    DECLARE @intentoPagoID INT;
    DECLARE @transaccionID INT;
    DECLARE @subTipoTransaccionID INT;
    DECLARE @descripcion NVARCHAR(200);
    DECLARE @referencia NVARCHAR(50);
    DECLARE @numeroAuth VARCHAR(30);
    DECLARE @resultado VARCHAR(500) = 'Pago aprobado';
    DECLARE @organizacionID INT = NULL;
    DECLARE @tokenCargo VARBINARY(256);
    
    -- Variables para manejo de errores
    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT, @ErrorPoc VARCHAR(128)
    DECLARE @Message VARCHAR(200)
    DECLARE @InicieTransaccion BIT
    
    BEGIN TRY
        -- Verificación de usuario
        SELECT @idAprobado = statusRegistroID FROM pv_statusRegistro WHERE nombre like 'Registrado';
        SELECT @usuario = userid FROM pv_usuarios WHERE identificacion = @cedula;
        IF @usuario IS NULL OR (SELECT statusRegistroID FROM pv_StatusRegistroUsuarios WHERE usuarioID = @usuario) <> @idAprobado
        BEGIN
            DECLARE @errorMsg1 NVARCHAR(500) = 'Usuario no encontrado o no aprobado: ' + @cedula;
            EXEC dbo.SP_InsertarLog
                'Intento de inversión con usuario no registrado',
                @errorMsg1,
                @tipoLogError,
                @origenLogID,
                @severidadError,
                @cedula,
                'Sistema',
                NULL,
                NULL,
                @cedula,
                NULL;
            
            RAISERROR('El usuario no se encuentra registrado', 16, 1);
            RETURN -1;
        END
        
        -- Verificación de contraseña
        SELECT @llaveCifrada = llaveCifrada FROM pv_llavesUsuarios WHERE usuarioID = @usuario;
        IF (DECRYPTBYPASSPHRASE(@contrasenna, @llaveCifrada) IS NULL)
        BEGIN 
            DECLARE @errorMsg2 NVARCHAR(500) = 'Usuario: ' + @cedula;
            EXEC dbo.SP_InsertarLog
                'Contraseña incorrecta en intento de inversión',
                @errorMsg2,
                @tipoLogError,
                @origenLogID,
                @severidadError,
                @cedula,
                'Sistema',
                @usuario,
                NULL,
                NULL,
                NULL;
            
            RAISERROR('Contraseña incorrecta', 16, 1);
            RETURN -1;
        END
        
        -- Verificación de organización
        IF @organizacion IS NOT NULL
        BEGIN
            SELECT @organizacionID = organizacionid FROM pv_organizaciones WHERE nombre LIKE @organizacion;
            IF @organizacionID IS NULL
            BEGIN
                DECLARE @errorMsg3 NVARCHAR(500) = 'Organización: ' + @organizacion;
                EXEC dbo.SP_InsertarLog
                    'Organización no encontrada en inversión',
                    @errorMsg3,
                    @tipoLogError,
                    @origenLogID,
                    @severidadError,
                    @cedula,
                    'Sistema',
                    NULL,
                    NULL,
                    @organizacion,
                    NULL;
                
                RAISERROR('La organización especificada no existe', 16, 1);
                RETURN -1;
            END
        END

        -- Verificación de proyecto
        SELECT @proyectoID = proyectoID FROM pv_proyecto WHERE nombre LIKE @proyecto;
        IF @proyectoID IS NULL
        BEGIN
            DECLARE @errorMsg4 NVARCHAR(500) = 'Proyecto: ' + @proyecto;
            EXEC dbo.SP_InsertarLog
                'Proyecto no encontrado en inversión',
                @errorMsg4,
                @tipoLogError,
                @origenLogID,
                @severidadError,
                @cedula,
                'Sistema',
                NULL,
                NULL,
                @proyecto,
                NULL;
            
            RAISERROR('El proyecto especificado no existe', 16, 1);
            RETURN -1;
        END 
        
        -- Conversión de moneda
        IF @moneda <> 'CRC'
        BEGIN
            DECLARE @tasaCambio DECIMAL(19,6);
            SELECT @monedaOrigen = monedaID FROM pv_moneda WHERE codigo LIKE @moneda;
            SELECT @monedaDestino = monedaID FROM pv_moneda WHERE codigo LIKE 'CRC';
            
            SELECT @tasaCambio = tasa, @tasaCambioID = tasaCambioID 
            FROM pv_tasaCambio 
            WHERE monedaOrigen = @monedaOrigen AND monedaDestino = @monedaDestino;
            
            SET @montoReal = ROUND(@monto * @tasaCambio, 3);
        END
        ELSE
        BEGIN 
            SET @montoReal = @monto;
            SET @tasaCambioID = NULL;
            SET @monedaOrigen = (SELECT monedaID FROM pv_moneda WHERE codigo = 'CRC');
        END
        
        -- Validación de monto máximo
        IF (SELECT montoPedido FROM pv_proyecto WHERE proyectoID = @proyectoID) < @montoReal
        BEGIN
            DECLARE @montoRealStr VARCHAR(20) = CAST(@montoReal AS VARCHAR(20));
            DECLARE @errorMsg5 NVARCHAR(500) = 'Proyecto: ' + @proyecto + ' | Monto solicitado: ' + @montoRealStr;
            EXEC dbo.SP_InsertarLog 
                'Monto excede el máximo permitido',
                @errorMsg5,
                @tipoLogError,
                @origenLogID,
                @severidadError,
                @cedula,
                'Sistema',
                @proyectoID,
                NULL,
                @montoRealStr,
                NULL;
            
            RAISERROR('La inversión excede el máximo solicitado', 16, 1);
            RETURN -1;
        END
        
        -- Obtener subtipo de transacción
        SELECT @subTipoTransaccionID = subTipoTransaccionID 
        FROM pv_subTipoTransaccion 
        WHERE nombre LIKE 'Inversión';
        
        -- Generar valores para los campos
        SET @descripcion = 'Inversión en proyecto ' + @proyecto;
        
        DECLARE @proyectoIDStr VARCHAR(10) = CAST(@proyectoID AS VARCHAR(10));
        SET @referencia = 'INV-' + @proyectoIDStr + '-' + FORMAT(GETDATE(), 'yyyyMMddHHmmss');
        
        SET @numeroAuth = RIGHT(NEWID(), 10);
        SET @tokenCargo = CAST(NEWID() AS VARBINARY(256));
        -- Obtener el método de pago
        DECLARE @metodoID INT = (SELECT metodoID FROM pv_metodosPago WHERE nombre LIKE @metodoPago)
        -- Iniciar transacción
        SET @InicieTransaccion = 0;
        IF @@TRANCOUNT = 0 BEGIN
            SET @InicieTransaccion = 1;
            SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
            BEGIN TRANSACTION;
        END
        
        BEGIN TRY
            SET @CustomError = 2001;
            
            -- Inserción del intento de Pago
            DECLARE @checksumPago VARBINARY(256) = HASHBYTES('SHA2_256', 
                CAST(@monto AS VARCHAR(20)) + CAST(@montoReal AS VARCHAR(20)) + @referencia);
            
            INSERT INTO pv_intentoPago (
                monto, actualMonto, resultado, numeroAuth, 
                reference, tokenCargo, descripcion, fecha, 
                checksum, metodoPagoID, monedaID
            ) VALUES (
                @monto, @montoReal, @resultado, @numeroAuth,
                @referencia, @tokenCargo, @descripcion, GETDATE(),
                @checksumPago, 
                @metodoID, @monedaOrigen
            );
            
            SET @intentoPagoID = SCOPE_IDENTITY();
            
            -- Inserción de la transacción
            DECLARE @checksumTrans VARBINARY(256) = HASHBYTES('SHA2_256', 
                CAST(@usuario AS VARCHAR(10)) + CAST(@proyectoID AS VARCHAR(10)) + @referencia);
            
            INSERT INTO pv_transaccion (
                usuarioID, proyectoID, monto, montoConvertido, 
                descripcion, fechaTransaccion, fechaRegistro, 
                referencia, checksum, subTipoTransaccionID,
                tasaCambioID, intentoPagoID
            ) VALUES (
                @usuario, @proyectoID, @monto, 
                CASE WHEN @moneda = 'CRC' THEN NULL ELSE @montoReal END,
                @descripcion, GETDATE(), GETDATE(),
                @referencia, @checksumTrans, 
                @subTipoTransaccionID, @tasaCambioID, @intentoPagoID
            );
            
            SET @transaccionID = SCOPE_IDENTITY();
            
            -- Inserción de la inversión
            INSERT INTO pv_inversion (
                proyectoID, usuarioID, transaccionID, organizacionID
            ) VALUES (
                @proyectoID, @usuario, @transaccionID, @organizacionID
            );
            
            -- Registrar éxito
            DECLARE @montoRealSuccessStr VARCHAR(20) = CAST(@montoReal AS VARCHAR(20));
            EXEC dbo.SP_InsertarLog 
                'Inversión registrada exitosamente',
                @descripcion,
                @tipoLogInversion,
                @origenLogID,
                @severidadInfo,
                @cedula,
                'Sistema',
                @proyectoID,
                @usuario,
                @montoRealSuccessStr,
                NULL;
            
            IF @InicieTransaccion = 1 BEGIN
                COMMIT;
            END
            
            SELECT 
                0 AS Resultado, 
                'Inversión registrada correctamente' AS Mensaje, 
                @transaccionID AS TransaccionID,
                @referencia AS Referencia,
                @montoReal AS MontoInvertido,
                @numeroAuth AS NumeroAutorizacion;
        END TRY
        BEGIN CATCH
            SET @ErrorNumber = ERROR_NUMBER();
            SET @ErrorSeverity = ERROR_SEVERITY();
            SET @ErrorState = ERROR_STATE();
            SET @Message = ERROR_MESSAGE();

            
            -- Registrar error
            DECLARE @errorLineStr VARCHAR(10) = CAST(ERROR_LINE() AS VARCHAR(10));
            DECLARE @errorMsg6 VARCHAR(500) = 'Error: ' + @Message + ' | Línea: ' + @errorLineStr;
            SET @ErrorPoc = ERROR_PROCEDURE()
            EXEC dbo.SP_InsertarLog
                'Error al registrar inversión',
                @errorMsg6,
                @tipoLogError,
                @origenLogID,
                @severidadError,
                @cedula,
                'Sistema',
                @proyectoID,
                NULL,
                @ErrorPoc,
                @errorLineStr;
            
            IF @InicieTransaccion = 1 BEGIN
                ROLLBACK;
            END
            
            RAISERROR('Error al registrar la inversión: %s', @ErrorSeverity, @ErrorState, @Message);
            RETURN -1;
        END CATCH
    END TRY
    BEGIN CATCH
        SET @Message = ERROR_MESSAGE();
        
        -- Registrar error general
        DECLARE @errorLineStr2 VARCHAR(10) = CAST(ERROR_LINE() AS VARCHAR(10));
        DECLARE @errorMsg7 VARCHAR(500) = 'Error: ' + @Message + ' | Línea: ' + @errorLineStr2;
        SET @ErrorPoc = ERROR_PROCEDURE()
        EXEC dbo.SP_InsertarLog
            'Error general en proceso de inversión',
            @errorMsg7,
            @tipoLogError,
            @origenLogID,
            @severidadError,
            @cedula,
            'Sistema',
            NULL,
            NULL,
            @ErrorPoc,
            @errorLineStr2;
        
        RAISERROR('Error en el proceso de inversión: %s', 16, 1, @Message);
        RETURN -1;
    END CATCH
END