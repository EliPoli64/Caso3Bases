-- Declarar variables para rangos de IDs
DECLARE @minVotacionID INT, @maxVotacionID INT;
DECLARE @minObjetivoID INT, @maxObjetivoID INT;

-- Obtener rangos de IDs existentes
SELECT @minVotacionID = MIN(votacionID), @maxVotacionID = MAX(votacionID) 
FROM pv_votacion;

SELECT @minObjetivoID = MIN(objetivoEtapaID), @maxObjetivoID = MAX(objetivoEtapaID) 
FROM pv_objetivosEtapa;

-- Tabla temporal con posibles objetivos de votación en Costa Rica
CREATE TABLE #ObjetivosVotacion (
    Descripcion VARCHAR(500)
);

INSERT INTO #ObjetivosVotacion (Descripcion) VALUES
('Aprobar propuesta de mejora de transporte público en el GAM'),
('Validar presupuesto participativo para proyectos comunales'),
('Seleccionar prioridades de inversión en infraestructura educativa'),
('Definir áreas prioritarias para reforestación nacional'),
('Aprobar creación de nuevos parques nacionales'),
('Validar estrategia de reducción de emisiones de carbono'),
('Seleccionar proyectos de innovación tecnológica a financiar'),
('Aprobar plan de acción contra el cambio climático'),
('Validar programa de becas para educación técnica'),
('Seleccionar zonas para instalación de clínicas móviles'),
('Aprobar plan de desarrollo urbano sostenible'),
('Validar estrategia de seguridad ciudadana'),
('Seleccionar prioridades para turismo sostenible'),
('Aprobar programa de apoyo a emprendedores rurales'),
('Validar plan de modernización del sistema de salud'),
('Seleccionar proyectos culturales a financiar'),
('Aprobar estrategia de reactivación económica post-pandemia'),
('Validar plan de acción contra la pobreza'),
('Seleccionar prioridades para infraestructura deportiva'),
('Aprobar programa de capacitación digital para adultos mayores');

-- Insertar datos aleatorios en pv_votacionesObjetivos
DECLARE @i INT = 1;
DECLARE @randomVotacionID INT;
DECLARE @randomObjetivoID INT;
DECLARE @descripcion VARCHAR(500);
DECLARE @fechaModificacion DATETIME;
DECLARE @deleted BIT;

WHILE @i <= 50
BEGIN
    -- Seleccionar votación y objetivo existentes al azar
    SET @randomVotacionID = FLOOR(RAND() * (@maxVotacionID - @minVotacionID + 1)) + @minVotacionID;
    SET @randomObjetivoID = FLOOR(RAND() * (@maxObjetivoID - @minObjetivoID + 1)) + @minObjetivoID;
    
    -- Seleccionar descripción al azar
    SELECT TOP 1 @descripcion = Descripcion FROM #ObjetivosVotacion ORDER BY RAND();
    
    -- Generar fecha aleatoria en los últimos 2 años
    SET @fechaModificacion = DATEADD(day, -CAST(RAND() * 730 AS INT), GETDATE());
    SET @fechaModificacion = DATEADD(hour, CAST(RAND() * 24 AS INT), @fechaModificacion);
    SET @fechaModificacion = DATEADD(minute, CAST(RAND() * 60 AS INT), @fechaModificacion);
    
    -- 10% de probabilidad de que esté marcado como eliminado
    SET @deleted = CASE WHEN RAND() > 0.9 THEN 1 ELSE 0 END;
    
    INSERT INTO pv_votacionesObjetivos (
        objetivoProyectoID,
        votacionID,
        deleted,
        fechaModificacion,
        [checksum(256)]
    )
    VALUES (
        @randomObjetivoID,
        @randomVotacionID,
        @deleted,
        @fechaModificacion,
        HASHBYTES('SHA2_256', @descripcion + CAST(@i AS VARCHAR(10)))
    );
    
    SET @i = @i + 1;
END;

-- Insertar datos específicos para Costa Rica con relaciones válidas
-- Primero obtenemos IDs existentes que sabemos que están relacionados
DECLARE @votacionTransporteID INT, @votacionBecasID INT, @votacionClinicasID INT;
DECLARE @objetivoFinanciamientoID INT, @objetivoAvalID INT, @objetivoTransparenciaID INT;

SELECT @votacionTransporteID = votacionID FROM pv_votacion WHERE titulo LIKE '%Transporte Público%';
SELECT @votacionBecasID = votacionID FROM pv_votacion WHERE titulo LIKE '%Becas Rurales%';
SELECT @votacionClinicasID = votacionID FROM pv_votacion WHERE titulo LIKE '%Clínicas Móviles%';

SELECT @objetivoFinanciamientoID = objetivoEtapaID FROM pv_objetivosEtapa WHERE descripcion LIKE '%financiamiento requerido%';
SELECT @objetivoAvalID = objetivoEtapaID FROM pv_objetivosEtapa WHERE descripcion LIKE '%aval gubernamental%';
SELECT @objetivoTransparenciaID = objetivoEtapaID FROM pv_objetivosEtapa WHERE descripcion LIKE '%transparencia en el 100%';

-- Insertar relaciones específicas con sentido
INSERT INTO pv_votacionesObjetivos (
    
    objetivoProyectoID,
    votacionID,
    deleted,
    fechaModificacion,
    [checksum(256)]
)
VALUES
( @objetivoFinanciamientoID, @votacionBecasID, 0, GETDATE(), HASHBYTES('SHA2_256', 'Financiamiento becas rurales')),
( @objetivoAvalID, @votacionTransporteID, 0, GETDATE(), HASHBYTES('SHA2_256', 'Aval transporte público')),
( @objetivoTransparenciaID, @votacionClinicasID, 0, GETDATE(), HASHBYTES('SHA2_256', 'Transparencia clínicas móviles')),
((SELECT TOP 1 objetivoEtapaID FROM pv_objetivosEtapa WHERE descripcion LIKE '%inversión ciudadana%' ORDER BY NEWID()), 
    @votacionBecasID, 
    0, 
    GETDATE(), 
    HASHBYTES('SHA2_256', 'Inversión becas rurales')),
( 
    (SELECT TOP 1 objetivoEtapaID FROM pv_objetivosEtapa WHERE descripcion LIKE '%reportes financieros%' ORDER BY NEWID()), 
    @votacionTransporteID, 
    0, 
    GETDATE(), 
    HASHBYTES('SHA2_256', 'Reportes transporte'));

-- Limpiar tabla temporal
DROP TABLE #ObjetivosVotacion;

-- Verificar que todas las relaciones insertadas son válidas
SELECT 
    vo.votacionObjetivoID,
    vo.objetivoProyectoID,
    oe.descripcion AS objetivo,
    vo.votacionID,
    v.titulo AS votacion,
    vo.deleted,
    vo.fechaModificacion
FROM 
    pv_votacionesObjetivos vo
    JOIN pv_objetivosEtapa oe ON vo.objetivoProyectoID = oe.objetivoEtapaID
    JOIN pv_votacion v ON vo.votacionID = v.votacionID
ORDER BY 
    vo.votacionObjetivoID;
	select * from pv_objetivosEtapa
/*	DELETE FROM pv_votacionesObjetivos;
DBCC CHECKIDENT ('pv_votacionesObjetivos', RESEED, 0);

	select * from pv_votacionesObjetivos*/