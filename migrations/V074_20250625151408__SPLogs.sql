CREATE PROCEDURE [dbo].[SP_InsertarLog]
    @descripcion VARCHAR(100),
    @trace TEXT,
    @tipologid INT,
    @origenlogid INT,
    @logseveridadid INT,
    @usuario VARCHAR(50),
    @computador VARCHAR(50),
    @refId1 BIGINT = NULL,
    @refId2 BIGINT = NULL,
    @valor1 VARCHAR(100) = NULL,
    @valor2 VARCHAR(100) = NULL
AS 
BEGIN
    SET NOCOUNT ON
    
    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
    DECLARE @Message VARCHAR(200)
    DECLARE @InicieTransaccion BIT
    
    SET @InicieTransaccion = 0
    IF @@TRANCOUNT = 0 BEGIN
        SET @InicieTransaccion = 1
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED
        BEGIN TRANSACTION        
    END
    
    BEGIN TRY
        SET @CustomError = 2001
        -- Insertar registro de log
        INSERT INTO pv_logs (
            descripcion, timestamp, 
            computador, usuario, 
            trace, refId1, 
            refId2, valor1, 
            valor2, checksum, 
            tipologid, origenlogid, 
            logseveridadid
        ) VALUES (
            @descripcion, 
            GETDATE(), 
            @computador, 
            @usuario,
            @trace, 
            @refId1, 
            @refId2, 
            @valor1, 
            @valor2,
            HASHBYTES('SHA2_256', 
                CONCAT(
                    @descripcion, 
                    @trace, 
                    CAST(@tipologid AS VARCHAR),
                    CAST(@origenlogid AS VARCHAR),
                    CAST(@logseveridadid AS VARCHAR),
                    @usuario,
                    @computador,
                    COALESCE(CAST(@refId1 AS VARCHAR), 'NULL'),
                    COALESCE(CAST(@refId2 AS VARCHAR), 'NULL'),
                    COALESCE(@valor1, 'NULL'),
                    COALESCE(@valor2, 'NULL')
                )
            ), 
            @tipologid, 
            @origenlogid, 
            @logseveridadid
        );
        IF @InicieTransaccion = 1 BEGIN
            COMMIT
        END
        RETURN SCOPE_IDENTITY()
    END TRY
    BEGIN CATCH
        SET @ErrorNumber = ERROR_NUMBER()
        SET @ErrorSeverity = ERROR_SEVERITY()
        SET @ErrorState = ERROR_STATE()
        SET @Message = ERROR_MESSAGE()
        IF @InicieTransaccion = 1 BEGIN
            ROLLBACK
        END
        RAISERROR('Error al insertar registro de log - Código: %i', 
            @ErrorSeverity, @ErrorState, @CustomError)
        RETURN -1
    END CATCH
END
GO