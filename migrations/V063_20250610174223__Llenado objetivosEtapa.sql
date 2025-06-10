-- ocupa etapasProyecto y criteriosExito 

DECLARE @minEtapaProyectoID INT, @maxEtapaProyectoID INT;
DECLARE @minCriterioExitoID INT, @maxCriterioExitoID INT;

-- rango etapaProyecto IDs
SELECT @minEtapaProyectoID = MIN(etapaProyectoID), @maxEtapaProyectoID = MAX(etapaProyectoID) 
FROM pv_etapasProyecto;

--  rango criterioExito IDs
SELECT @minCriterioExitoID = MIN(criterioExitoID), @maxCriterioExitoID = MAX(criterioExitoID) 
FROM pv_criteriosExito;

-- tabla temp
CREATE TABLE #ObjetivosDescripciones (
    Descripcion VARCHAR(500)
);

INSERT INTO #ObjetivosDescripciones (Descripcion) VALUES
('Definir alcance y objetivos claros del proyecto con participación comunitaria'),
('Diseñar solución técnica que cumpla con requerimientos legales y de seguridad'),
('Implementar funcionalidades básicas del sistema de votación electrónica'),
('Validar integración entre módulos principales del sistema'),
('Desplegar versión piloto en comunidad seleccionada para pruebas reales'),
('Expandir implementación a nivel nacional con monitoreo constante'),
('Ajustar sistema basado en feedback de usuarios y auditorías'),
('Documentar lecciones aprendidas y cerrar formalmente el proyecto'),
('Evaluar impacto del proyecto 6 meses después de implementación'),
('Recaudar fondos necesarios para financiar todas las etapas del proyecto'),
('Garantizar participación inclusiva de todos los grupos demográficos'),
('Implementar mecanismos de transparencia y rendición de cuentas'),
('Asegurar accesibilidad para personas con discapacidad'),
('Capacitar a usuarios finales en el uso de la plataforma'),
('Establecer alianzas estratégicas con organizaciones locales'),
('Desarrollar materiales educativos sobre el sistema de votación'),
('Crear protocolos de contingencia para posibles fallas'),
('Implementar sistema de monitoreo en tiempo real'),
('Garantizar cumplimiento de normativas de protección de datos'),
('Establecer métricas de éxito para cada fase del proyecto');

-- objetivos random
DECLARE @i INT = 1;
DECLARE @randomEtapaProyectoID INT;
DECLARE @randomCriterioExitoID INT;
DECLARE @descripcion VARCHAR(500);
DECLARE @fechaCreacion DATETIME;

WHILE @i <= 100
BEGIN
    SET @randomEtapaProyectoID = FLOOR(RAND() * (@maxEtapaProyectoID - @minEtapaProyectoID + 1)) + @minEtapaProyectoID;
    
    SET @randomCriterioExitoID = FLOOR(RAND() * (@maxCriterioExitoID - @minCriterioExitoID + 1)) + @minCriterioExitoID;
    
    SELECT TOP 1 @descripcion = Descripcion FROM #ObjetivosDescripciones ORDER BY RAND();
    
    SET @fechaCreacion = DATEADD(day, -CAST(RAND() * 730 AS INT), GETDATE());
    SET @fechaCreacion = DATEADD(hour, CAST(RAND() * 24 AS INT), @fechaCreacion);
    SET @fechaCreacion = DATEADD(minute, CAST(RAND() * 60 AS INT), @fechaCreacion);
    
    INSERT INTO pv_objetivosEtapa (
        [descripcion],
        [etapaProyectoID],
        [fechaCreacion],
        [criterioExitoID]
    )
    VALUES (
        @descripcion,
        @randomEtapaProyectoID,
        @fechaCreacion,
        @randomCriterioExitoID
    );
    
    SET @i = @i + 1;
END;

DROP TABLE #ObjetivosDescripciones;

DECLARE @existingEtapaID INT;
DECLARE @existingCriterioID INT;

SELECT TOP 1 @existingEtapaID = etapaProyectoID FROM pv_etapasProyecto ORDER BY NEWID();
SELECT TOP 1 @existingCriterioID = criterioExitoID FROM pv_criteriosExito ORDER BY NEWID();

INSERT INTO pv_objetivosEtapa (
    [descripcion],
    [etapaProyectoID],
    [fechaCreacion],
    [criterioExitoID]
)
VALUES
('Recaudar el 50% del financiamiento requerido para el proyecto', @existingEtapaID, GETDATE(), @existingCriterioID),
('Validar propuesta con al menos 3 grupos inversores', @existingEtapaID, GETDATE(), @existingCriterioID),
('Obtener aval gubernamental para beneficios fiscales', @existingEtapaID, GETDATE(), @existingCriterioID),
('Alcanzar meta de inversión ciudadana en plazo establecido', @existingEtapaID, GETDATE(), @existingCriterioID),
('Mantener transparencia en el 100% de los desembolsos', @existingEtapaID, GETDATE(), @existingCriterioID),
('Generar reportes financieros mensuales para inversionistas', @existingEtapaID, GETDATE(), @existingCriterioID),
('Implementar sistema de fiscalización comunitaria', @existingEtapaID, GETDATE(), @existingCriterioID),
('Garantizar retorno de inversión según cronograma pactado', @existingEtapaID, GETDATE(), @existingCriterioID);