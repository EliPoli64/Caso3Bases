-- tablas pv_usuarios y pv_organizaciones ya están pobladas
DELETE FROM [dbo].[pv_orgUsuariosRegulares];
DBCC CHECKIDENT ('[dbo].[pv_orgUsuariosRegulares]', RESEED, 0);

-- Variables para controlar el llenado
DECLARE @totalUsuarios INT, @totalOrganizaciones INT;
DECLARE @usuarioID INT, @organizacionID INT;
DECLARE @contador INT = 1;
DECLARE @maxRelaciones INT = 300; -- Número total de relaciones a crear
DECLARE @esActivo BIT, @rolInterno VARCHAR(50);

-- Obtener conteos de tablas relacionadas
SELECT @totalUsuarios = COUNT(*) FROM [dbo].[pv_usuarios];
SELECT @totalOrganizaciones = COUNT(*) FROM [dbo].[pv_organizaciones];

-- Verificar que hay datos en las tablas relacionadas
IF @totalUsuarios = 0 OR @totalOrganizaciones = 0
BEGIN
    PRINT 'Error: Las tablas pv_usuarios y/o pv_organizaciones están vacías.';
    RETURN;
END

-- Crear tabla temporal para evitar duplicados
CREATE TABLE #RelacionesTemp (
    usuarioID INT,
    organizacionID INT,
    PRIMARY KEY (usuarioID, organizacionID)
);

-- Llenar la tabla con relaciones aleatorias
WHILE @contador <= @maxRelaciones
BEGIN
    -- Seleccionar usuario y organización aleatorios
    SELECT @usuarioID = userid FROM (
        SELECT userid, ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn 
        FROM [dbo].[pv_usuarios]
    ) AS temp WHERE rn = 1 + FLOOR(RAND() * @totalUsuarios);
    
    SELECT @organizacionID = organizacionid FROM (
        SELECT organizacionid, ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn 
        FROM [dbo].[pv_organizaciones]
    ) AS temp WHERE rn = 1 + FLOOR(RAND() * @totalOrganizaciones);
    
    -- Verificar si la relación ya existe
    IF NOT EXISTS (
        SELECT 1 FROM #RelacionesTemp 
        WHERE usuarioID = @usuarioID AND organizacionID = @organizacionID
    )
    BEGIN
        -- Insertar en tabla temporal para control
        INSERT INTO #RelacionesTemp VALUES (@usuarioID, @organizacionID);
        
        -- Determinar valores aleatorios para otros campos
        SET @esActivo = CASE WHEN RAND() > 0.1 THEN 1 ELSE 0 END; -- 90% activos
        
        SET @rolInterno = CASE FLOOR(RAND() * 6)
            WHEN 0 THEN 'Miembro'
            WHEN 1 THEN 'Colaborador'
            WHEN 2 THEN 'Voluntario'
            WHEN 3 THEN 'Asociado'
            WHEN 4 THEN 'Afiliado'
            ELSE 'Beneficiario'
        END;
        
        -- Insertar registro en la tabla principal
        INSERT INTO [dbo].[pv_orgUsuariosRegulares] (
            usuarioID, 
            organizacionid, 
            esActivo, 
            rolInterno
        ) VALUES (
            @usuarioID,
            @organizacionID,
            @esActivo,
            @rolInterno
        );
        
        SET @contador = @contador + 1;
    END
END

-- Limpiar tabla temporal
DROP TABLE #RelacionesTemp;

