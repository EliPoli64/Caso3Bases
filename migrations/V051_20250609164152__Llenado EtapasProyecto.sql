/*
IMPORTANTE
LLENAR ETAPAS PROYECTO, PROYECTO Y MONEDA PRIMERO
*/

DECLARE @minProyectoID INT, @maxProyectoID INT;
DECLARE @minStatusEtapaProyID INT, @maxStatusEtapaProyID INT;
DECLARE @minMonedaID INT, @maxMonedaID INT;

SELECT @minProyectoID = MIN(proyectoID), @maxProyectoID = MAX(proyectoID) FROM pv_proyecto;

SELECT @minStatusEtapaProyID = MIN(statusEtapaProyID), @maxStatusEtapaProyID = MAX(statusEtapaProyID) FROM pv_statusEtapaProyecto;

SELECT @minMonedaID = MIN(monedaID), @maxMonedaID = MAX(monedaID) FROM pv_moneda;

CREATE TABLE #NombresEtapas (
    NombreEtapa VARCHAR(50)
);

INSERT INTO #NombresEtapas (NombreEtapa) VALUES
('Planificación Inicial'),
('Diseño de Solución'),
('Desarrollo y Codificación'),
('Pruebas de Integración'),
('Implementación Piloto'),
('Lanzamiento a Gran Escala'),
('Monitoreo y Ajustes'),
('Cierre del Proyecto'),
('Evaluación Post-Implementación'),
('Captación de Fondos');

DECLARE @i INT = 1;


DECLARE @fechaInicio DATETIME;
DECLARE @fechaFin DATETIME;
DECLARE @duracion FLOAT;
DECLARE @nombreEtapa VARCHAR(50);
DECLARE @inversion DECIMAL(18, 2);
DECLARE @randomProyectoID INT;
DECLARE @randomStatusEtapaProyID INT;
DECLARE @randomMonedaID INT;
DECLARE @checksum VARBINARY(256);

WHILE @i <= 50
BEGIN
    SET @randomProyectoID = FLOOR(RAND() * (@maxProyectoID - @minProyectoID + 1)) + @minProyectoID;
    SET @randomStatusEtapaProyID = FLOOR(RAND() * (@maxStatusEtapaProyID - @minStatusEtapaProyID + 1)) + @minStatusEtapaProyID;
    SET @randomMonedaID = FLOOR(RAND() * (@maxMonedaID - @minMonedaID + 1)) + @minMonedaID;

    SET @fechaInicio = DATEADD(day, -CAST(RAND() * 730 AS INT), GETDATE()); -- ultimos 2 años
    SET @fechaInicio = DATEADD(hour, CAST(RAND() * 24 AS INT), @fechaInicio);
    SET @fechaInicio = DATEADD(minute, CAST(RAND() * 60 AS INT), @fechaInicio);

    SET @duracion = FLOOR(RAND() * 174) + 7;
    SET @fechaFin = DATEADD(day, @duracion, @fechaInicio);
    SELECT TOP 1 @nombreEtapa = NombreEtapa FROM #NombresEtapas ORDER BY RAND();

    -- inversion estimada aleatoria entre mil y un millon
    SET @inversion = ROUND(RAND() * 999000 + 1000, 2);

    -- checksum
    SET @checksum = HASHBYTES('SHA2_256', CAST(@fechaInicio AS VARCHAR(50)) + @nombreEtapa + CAST(@i AS VARCHAR(10)));

    INSERT INTO pv_etapasProyecto (
        [proyectoID],
        [nombre],
        [fechaInicio],
        [fechaFin],
        [statusEtapaProyID],
        [inversionEstimada],
        [monedaID],
        [checksum],
        [duracion]
    )
    VALUES (
        @randomProyectoID,
        @nombreEtapa,
        @fechaInicio,
        @fechaFin,
        @randomStatusEtapaProyID,
        @inversion,
        @randomMonedaID,
        @checksum,
        @duracion
    );

    SET @i = @i + 1;
END;
DROP TABLE #NombresEtapas;
