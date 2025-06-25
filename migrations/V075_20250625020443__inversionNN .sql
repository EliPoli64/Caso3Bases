--inversiones, era dificl y necesario

/*
IMPORTANTE

LLENAR PRIMERO USERS, PROYECTO, TRANSACCION, ORGANIZACIONES
*/

-- Verificar que existan suficientes transacciones
DECLARE @numTransacciones INT;
SELECT @numTransacciones = COUNT(*) FROM pv_transaccion;

IF @numTransacciones < 100
BEGIN
    PRINT 'Error: Se necesitan al menos 100 registros en pv_transaccion para continuar.';
    PRINT 'Actual: ' + CAST(@numTransacciones AS VARCHAR) + ' registros encontrados.';
    RETURN;
END

-- Crear tablas temporales para datos de referencia
IF OBJECT_ID('tempdb..#DescripcionesInversion') IS NOT NULL DROP TABLE #DescripcionesInversion;
CREATE TABLE #DescripcionesInversion (Descripcion NVARCHAR(200));
INSERT INTO #DescripcionesInversion (Descripcion) VALUES
('Inversión inicial para proyecto comunitario'),
('Fondos para desarrollo de infraestructura'),
('Capital semilla para emprendimiento local'),
('Aporte ciudadano para iniciativa ambiental'),
('Financiamiento colectivo para proyecto educativo'),
('Inversión en innovación tecnológica'),
('Patrocinio para programa cultural'),
('Fondos para investigación científica'),
('Capital de riesgo para startup'),
('Donación para proyecto social');

-- Obtener rangos de IDs de tablas relacionadas
DECLARE @minUsuarioID INT, @maxUsuarioID INT;
DECLARE @minProyectoID INT, @maxProyectoID INT;
DECLARE @minOrganizacionID INT, @maxOrganizacionID INT;

SELECT @minUsuarioID = MIN(userId), @maxUsuarioID = MAX(userId) FROM pv_usuarios;
SELECT @minProyectoID = MIN(proyectoID), @maxProyectoID = MAX(proyectoID) FROM pv_proyecto;
SELECT @minOrganizacionID = MIN(organizacionid), @maxOrganizacionID = MAX(organizacionid) FROM pv_organizaciones;

-- Obtener lista de transacciones disponibles
DECLARE @TransaccionesDisponibles TABLE (RowNum INT IDENTITY(1,1), transaccionID INT);
INSERT INTO @TransaccionesDisponibles (transaccionID)
SELECT transaccionID FROM pv_transaccion ORDER BY transaccionID;

-- Variables para datos aleatorios
DECLARE @randomUsuarioID INT;
DECLARE @randomProyectoID INT;
DECLARE @randomOrganizacionID INT;
DECLARE @selectedDescripcion NVARCHAR(200);
DECLARE @i INT = 1;
DECLARE @numRegistros INT = 100; -- Número de registros a insertar
DECLARE @transaccionIndex INT;

-- Insertar datos en pv_inversion
WHILE @i <= @numRegistros
BEGIN
    -- Seleccionar ids aleatorios de las tablas relacionadas
    SET @randomUsuarioID = FLOOR(RAND() * (@maxUsuarioID - @minUsuarioID + 1)) + @minUsuarioID;
    SET @randomProyectoID = FLOOR(RAND() * (@maxProyectoID - @minProyectoID + 1)) + @minProyectoID;
    
    -- 30% de probabilidad de tener organización (no todos los inversores son organizaciones, pueden ser usuarios equis)
    SET @randomOrganizacionID = NULL;
    IF RAND() > 0.7 
        SET @randomOrganizacionID = FLOOR(RAND() * (@maxOrganizacionID - @minOrganizacionID + 1)) + @minOrganizacionID;
    
    -- Seleccionar una descripción aleatoria
    SELECT TOP 1 @selectedDescripcion = Descripcion FROM #DescripcionesInversion ORDER BY RAND();
    
    -- Obtener transaccionID secuencialmente para asegurar que no se repitan
    SET @transaccionIndex = @i;
    IF @transaccionIndex > @numTransacciones
        SET @transaccionIndex = @transaccionIndex % @numTransacciones + 1;
    
    -- Insertar registro
    INSERT INTO [dbo].[pv_inversion] (
        [proyectoID],
        [usuarioID],
        [transaccionID],
        [organizacionID]
    )
    SELECT
        @randomProyectoID,
        @randomUsuarioID,
        transaccionID,
        @randomOrganizacionID
    FROM @TransaccionesDisponibles
    WHERE RowNum = @transaccionIndex;
    
    SET @i = @i + 1;
END;

-- Limpiar tablas temporales
DROP TABLE #DescripcionesInversion;

