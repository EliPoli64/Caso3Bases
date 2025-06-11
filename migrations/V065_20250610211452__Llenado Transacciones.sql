/*
IMPORTANTE

LLENAR PRIMERO USERS, PROYECTO, SUBTIPO TRANSACCION, TASA CAMBIO, INTENTO PAGO
*/

IF OBJECT_ID('tempdb..#DescripcionesTransaccion') IS NOT NULL DROP TABLE #DescripcionesTransaccion;
CREATE TABLE #DescripcionesTransaccion (Descripcion NVARCHAR(200));
INSERT INTO #DescripcionesTransaccion (Descripcion) VALUES
('Donación para proyecto social A'),
('Pago de servicio público B'),
('Compra de material educativo'),
('Aporte para infraestructura comunitaria'),
('Recaudación de fondos por evento C'),
('Subsidio para programa de salud D'),
('Transferencia para desarrollo local'),
('Inversión en iniciativa ambiental E'),
('Pago de cuota de membresía F'),
('Contribución voluntaria');
GO

IF OBJECT_ID('tempdb..#ReferenciasTransaccion') IS NOT NULL DROP TABLE #ReferenciasTransaccion;
CREATE TABLE #ReferenciasTransaccion (
    ReferenciaID INT IDENTITY(1,1) PRIMARY KEY,
    Referencia NVARCHAR(50) NOT NULL
);

DECLARE @i INT = 1;
DECLARE @randomNum NVARCHAR(20);
DECLARE @prefix NVARCHAR(10);
DECLARE @referenciaGenerada NVARCHAR(50);

WHILE @i <= 400
BEGIN
    SET @prefix = CASE FLOOR(RAND() * 3)
                      WHEN 0 THEN 'TRX-'
                      WHEN 1 THEN 'INV-'
                      ELSE 'REF-'
                  END;
    
    SET @randomNum = RIGHT('000000' + CAST(FLOOR(RAND() * 999999) + 1 AS NVARCHAR(20)), 6);
    SET @referenciaGenerada = @prefix + @randomNum;

    INSERT INTO #ReferenciasTransaccion (Referencia)
    VALUES (@referenciaGenerada);

    SET @i = @i + 1;
END;

DECLARE @minUsuarioID INT, @maxUsuarioID INT;
DECLARE @minProyectoID INT, @maxProyectoID INT;
DECLARE @minSubTipoTransaccionID INT, @maxSubTipoTransaccionID INT;
DECLARE @minTasaCambioID INT, @maxTasaCambioID INT;
DECLARE @minIntentoPagoID INT, @maxIntentoPagoID INT;

SELECT @minUsuarioID = MIN(userId), @maxUsuarioID = MAX(userId) FROM pv_usuarios;

SELECT @minProyectoID = MIN(proyectoID), @maxProyectoID = MAX(proyectoID) FROM pv_proyecto;

SELECT @minSubTipoTransaccionID = MIN(subTipoTransaccionID), @maxSubTipoTransaccionID = MAX(subTipoTransaccionID) FROM pv_subTipoTransaccion;

SELECT @minTasaCambioID = MIN(tasaCambioID), @maxTasaCambioID = MAX(tasaCambioID) FROM pv_tasaCambio;

SELECT @minIntentoPagoID = MIN(intentoPagoID), @maxIntentoPagoID = MAX(intentoPagoID) FROM pv_intentoPago;

DECLARE @randomUsuarioID INT;
DECLARE @randomProyectoID INT;
DECLARE @randomMonto FLOAT;
DECLARE @randomMontoConvertido FLOAT;
DECLARE @selectedDescripcion NVARCHAR(200);
DECLARE @randomFechaTransaccion DATETIME;
DECLARE @randomFechaRegistro DATETIME;
DECLARE @selectedReferencia NVARCHAR(50);
DECLARE @randomChecksum VARBINARY(256);
DECLARE @randomSubTipoTransaccionID INT;
DECLARE @randomTasaCambioID INT;
DECLARE @randomIntentoPagoID INT;

WHILE @i <= 400
BEGIN
    SET @randomUsuarioID = FLOOR(RAND() * (@maxUsuarioID - @minUsuarioID + 1)) + @minUsuarioID;

    SET @randomProyectoID = NULL;
    IF RAND() > 0.30 SET @randomProyectoID = FLOOR(RAND() * (@maxProyectoID - @minProyectoID + 1)) + @minProyectoID;

    SET @randomMonto = ROUND(RAND() * 1000 + 10, 2);
    
    SET @randomMontoConvertido = NULL;
    IF RAND() > 0.20 SET @randomMontoConvertido = ROUND(@randomMonto * (RAND() * 0.5 + 0.8), 2);

    SELECT TOP 1 @selectedDescripcion = Descripcion FROM #DescripcionesTransaccion ORDER BY RAND();

    SET @randomFechaTransaccion = DATEADD(day, -FLOOR(RAND() * 365), GETDATE());
    SET @randomFechaTransaccion = DATEADD(hour, FLOOR(RAND() * 24), @randomFechaTransaccion);
    SET @randomFechaTransaccion = DATEADD(minute, FLOOR(RAND() * 60), @randomFechaTransaccion);

    SET @randomFechaRegistro = DATEADD(minute, FLOOR(RAND() * 120), @randomFechaTransaccion);

    SELECT TOP 1 @selectedReferencia = Referencia FROM #ReferenciasTransaccion ORDER BY RAND();

    SET @randomChecksum = HASHBYTES('SHA2_256', CAST(@randomUsuarioID AS VARCHAR(10)) + CAST(@randomMonto AS VARCHAR(20)) + CAST(@randomFechaTransaccion AS VARCHAR(50)));

    SET @randomSubTipoTransaccionID = NULL;
    IF RAND() > 0.10 SET @randomSubTipoTransaccionID = FLOOR(RAND() * (@maxSubTipoTransaccionID - @minSubTipoTransaccionID + 1)) + @minSubTipoTransaccionID;

    SET @randomTasaCambioID = NULL;
    IF RAND() > 0.15 SET @randomTasaCambioID = FLOOR(RAND() * (@maxTasaCambioID - @minTasaCambioID + 1)) + @minTasaCambioID;

    SET @randomIntentoPagoID = FLOOR(RAND() * (@maxIntentoPagoID - @minIntentoPagoID + 1)) + @minIntentoPagoID;

    INSERT INTO [dbo].[pv_transaccion] (
        [usuarioID],
        [proyectoID],
        [monto],
        [montoConvertido],
        [descripcion],
        [fechaTransaccion],
        [fechaRegistro],
        [referencia],
        [checksum],
        [subTipoTransaccionID],
        [tasaCambioID],
        [intentoPagoID]
    )
    VALUES (
        @randomUsuarioID,
        @randomProyectoID,
        @randomMonto,
        @randomMontoConvertido,
        @selectedDescripcion,
        @randomFechaTransaccion,
        @randomFechaRegistro,
        @selectedReferencia,
        @randomChecksum,
        @randomSubTipoTransaccionID,
        @randomTasaCambioID,
        @randomIntentoPagoID
    );

    SET @i = @i + 1;
END;

DROP TABLE #DescripcionesTransaccion;
DROP TABLE #ReferenciasTransaccion;
