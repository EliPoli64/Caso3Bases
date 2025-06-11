--  Limpieza inicial
DELETE FROM [dbo].[pv_identidadDigital];
DBCC CHECKIDENT ('[dbo].[pv_identidadDigital]', RESEED, 0);

INSERT INTO [dbo].[pv_identidadDigital] (
    [userID],
    [fotoCedulaURL],
    [fotoPasaporteURL],
    [fechaValidacion],
    [horarioID]
)
SELECT 
    
    u.[userid],
    -- Foto cédula
    '/identidad/cedulas/' + CAST(u.[userid] AS VARCHAR(10)) + '.jpg',
    
    -- Foto pasaporte 
    '/identidad/pasaportes/' + CAST(u.[userid] AS VARCHAR(10)) + '.jpg',
    
    -- Fecha de validación
    CASE 
        WHEN u.[userid] % 5 = 0 THEN DATEADD(DAY, -30, GETDATE()) -- Validación reciente (30 días)
        WHEN u.[userid] % 3 = 0 THEN DATEADD(DAY, -180, GETDATE()) -- Validación intermedia (6 meses)
        ELSE DATEADD(DAY, -365, GETDATE()) -- Validación antigua (1 año)
    END,
    
    -- Horario de validación 
    (SELECT TOP 1 [horarioId] FROM [dbo].[pv_horarios] ORDER BY NEWID())
FROM 
    [dbo].[pv_usuarios] u
WHERE 
    u.[userid] <= 100; -- Limitar a los primeros 100 usuarios

--  Actualización para simular diferentes estados 
-- algunas validaciones como "por expirar" (próximos 15 días)
UPDATE TOP (20) PERCENT [dbo].[pv_identidadDigital]
SET [fechaValidacion] = DATEADD(DAY, 10, GETDATE()) -- 10 días en el futuro
WHERE [userID] % 4 = 0;

--  Verificación final
SELECT 
    COUNT(*) AS TotalIdentidades,
    SUM(CASE WHEN [fechaValidacion] > GETDATE() THEN 1 ELSE 0 END) AS PorExpirar,
    MIN([fechaValidacion]) AS ValidacionMasAntigua,
    MAX([fechaValidacion]) AS ValidacionMasReciente
FROM [dbo].[pv_identidadDigital];

-- Muestra de datos /*
SELECT TOP 10 
    identidadID,
    userID,
    LEFT(fotoCedulaURL, 20) + '...' AS fotoCedula,
    LEFT(fotoPasaporteURL, 20) + '...' AS fotoPasaporte,
    fechaValidacion,
    horarioID
FROM [dbo].[pv_identidadDigital];*/