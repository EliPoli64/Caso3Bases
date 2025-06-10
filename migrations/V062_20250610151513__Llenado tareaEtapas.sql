-- Declaración de variables para rangos de IDs
DECLARE @minEtapaProyectoID INT, @maxEtapaProyectoID INT;

-- Obtener los rangos de IDs de etapas de proyecto
SELECT @minEtapaProyectoID = MIN(etapaProyectoID), @maxEtapaProyectoID = MAX(etapaProyectoID) FROM pv_etapasProyecto;

-- Tabla temporal con nombres de tareas comunes
CREATE TABLE #NombresTareas (
    Titulo VARCHAR(100),
    Descripcion VARCHAR(500)
);

-- Insertar ejemplos de tareas con sus descripciones
INSERT INTO #NombresTareas (Titulo, Descripcion) VALUES
('Reunión de planificación', 'Definir objetivos y alcance de la etapa'),
('Diseño de arquitectura', 'Crear diagramas y especificaciones técnicas'),
('Desarrollo de prototipo', 'Implementar versión inicial para validación'),
('Pruebas unitarias', 'Verificar funcionamiento de componentes individuales'),
('Integración continua', 'Configurar pipeline de integración y despliegue'),
('Documentación técnica', 'Elaborar manuales y guías para desarrolladores'),
('Capacitación de equipo', 'Entrenar al personal en nuevas tecnologías'),
('Revisión de código', 'Analizar calidad y estándares de implementación'),
('Pruebas de rendimiento', 'Evaluar capacidad de respuesta bajo carga'),
('Optimización', 'Ajustar parámetros para mejorar eficiencia'),
('Preparación de entorno', 'Configurar servidores y servicios necesarios'),
('Migración de datos', 'Transferir información de sistemas anteriores'),
('Monitoreo inicial', 'Establecer métricas y sistemas de alerta'),
('Retroalimentación usuarios', 'Recopilar opiniones de usuarios piloto'),
('Ajustes post-implementación', 'Corregir problemas identificados después del lanzamiento'),
('Plan de contingencia', 'Elaborar estrategias para manejo de riesgos'),
('Presupuesto detallado', 'Desglosar costos por áreas y recursos'),
('Cronograma de actividades', 'Definir fechas clave y dependencias'),
('Evaluación de proveedores', 'Seleccionar socios tecnológicos adecuados'),
('Plan de comunicación', 'Establecer canales y frecuencia de reportes');

-- Variables para el loop
DECLARE @i INT = 1;
DECLARE @randomEtapaProyectoID INT;
DECLARE @titulo VARCHAR(100);
DECLARE @descripcion VARCHAR(500);

-- Generar 100 tareas aleatorias
WHILE @i <= 100
BEGIN
    -- Seleccionar una etapa de proyecto aleatoria
    SET @randomEtapaProyectoID = FLOOR(RAND() * (@maxEtapaProyectoID - @minEtapaProyectoID + 1)) + @minEtapaProyectoID;
    
    -- Seleccionar un nombre y descripción de tarea aleatorios
    SELECT TOP 1 @titulo = Titulo, @descripcion = Descripcion 
    FROM #NombresTareas 
    ORDER BY RAND();
    
    -- Insertar la tarea en la tabla
    INSERT INTO pv_tareasEtapa (
        
        [titulo],
        [descripcion],
        [etapaProyectoID]
    )
    VALUES (
        @titulo,
        @descripcion,
        @randomEtapaProyectoID
    );
    
    SET @i = @i + 1;
END;

-- Limpiar tabla temporal
DROP TABLE #NombresTareas;