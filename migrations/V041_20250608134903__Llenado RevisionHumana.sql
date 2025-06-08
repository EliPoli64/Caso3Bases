/*
IMPORTANTE

LLENAR USUARIOS Y ANALISIS PRIMERO
*/

CREATE TABLE #RazonesVeredicto (
    Razon VARCHAR(2000),
    Argumento NCHAR(10)
);

INSERT INTO #RazonesVeredicto (Razon, Argumento) VALUES
('Verificación de datos exitosa, todos los campos obligatorios coinciden.', 'APROBADO'),
('Firma digital verificada y autenticidad del documento confirmada.', 'APROBADO'),
('Coincidencia biométrica del 99.8% con la base de datos de referencia.', 'APROBADO'),
('Todos los elementos de seguridad del documento fueron validados correctamente.', 'APROBADO'),
('Fecha de emisión y caducidad dentro del rango permitido y legible.', 'APROBADO'),
('Calidad de imagen baja para biometría facial, requiere verificación manual.', 'PENDIENTE'),
('Algunos caracteres en el número de identificación no se extrajeron con alta confianza.', 'PENDIENTE'),
('Discrepancia menor en el formato de la dirección, necesita revisión de estándar.', 'PENDIENTE'),
('Sello de seguridad parcialmente ilegible, requiere confirmación visual.', 'PENDIENTE'),
('Información de género no detectada o ambigua en el documento.', 'PENDIENTE'),
('Documento marcado como falsificado por el sistema de detección de patrones.', 'RECHAZADO'),
('Número de documento inválido o no existe en los registros oficiales.', 'RECHAZADO'),
('Inconsistencia crítica entre la fotografía y los datos biométricos registrados.', 'RECHAZADO'),
('Caducidad del documento excedida, no es válido para trámites.', 'RECHAZADO'),
('Ausencia de elementos de seguridad esperados para este tipo de documento.', 'RECHAZADO'),
('El código de barras o MRZ no pudo ser escaneado o es erróneo.', 'RECHAZADO'),
(NULL, 'APROBADO'),
(NULL, 'PENDIENTE'),
(NULL, 'RECHAZADO'),
('Datos personales completos y en formato esperado.', 'APROBADO'),
('Documento con ligera deformación, pero información clave legible.', 'PENDIENTE'),
('Diferencia de fuente en un campo específico, posible alteración menor.', 'PENDIENTE'),
('Verificación de la marca de agua incompleta debido a reflejo.', 'PENDIENTE'),
('Fotografía oscura, pero rasgos faciales identificables manualmente.', 'PENDIENTE'),
('El documento presenta signos de manipulación en el área de la fecha.', 'RECHAZADO'),
('Nombre del titular no coincide con el registro principal del sistema.', 'RECHAZADO');

DECLARE @minUserId INT, @maxUserId INT;
DECLARE @minAnalisisId INT, @maxAnalisisId INT;

SELECT @minUserId = MIN(userId), @maxUserId = MAX(userId) FROM pv_usuarios; 

SELECT @minAnalisisId = MIN(analisisId), @maxAnalisisId = MAX(analisisId) FROM [dbo].[pv_iaAnalisis];

SET @maxUserId = IIF(@maxUserId < @minUserId, @minUserId, @maxUserId);
SET @maxAnalisisId = IIF(@maxAnalisisId < @minAnalisisId, @minAnalisisId, @maxAnalisisId);

DECLARE @i INT = 1;

WHILE @i <= 100
BEGIN

    DECLARE @randomUserId INT = FLOOR(RAND() * (@maxUserId - @minUserId + 1)) + @minUserId;
    DECLARE @fechaRevision DATETIME = DATEADD(day, -CAST(RAND() * 365 AS INT), GETDATE());
    SET @fechaRevision = DATEADD(hour, CAST(RAND() * 24 AS INT), @fechaRevision);
    SET @fechaRevision = DATEADD(minute, CAST(RAND() * 60 AS INT), @fechaRevision);
    DECLARE @randomAnalisisId INT = NULL;
    IF RAND() > 0.20 -- 80% de probabilidad de tener un analisisId
    BEGIN
        SET @randomAnalisisId = FLOOR(RAND() * (@maxAnalisisId - @minAnalisisId + 1)) + @minAnalisisId;
    END
    DECLARE @selectedRazon VARCHAR(2000);
    DECLARE @selectedArgumento NCHAR(10);
    SELECT TOP 1 @selectedRazon = Razon, @selectedArgumento = Argumento
    FROM #RazonesVeredicto
    ORDER BY NEWID(); 
    INSERT INTO pv_revisionHumana (
        [userId],
        [fechaRevisionHumana],
        [analisisId],
        [razonVeredicto],
        [argumentoAnalisis]
    )
    VALUES (
        @randomUserId,
        @fechaRevision,
        @randomAnalisisId,
        @selectedRazon,
        @selectedArgumento
    );

    SET @i = @i + 1;
END;

DROP TABLE #RazonesVeredicto;