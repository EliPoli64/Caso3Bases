--correr esto comentado una vez cuz hubo problemas de como hicimos la tabla

/*
-- 1. First, drop the incorrect foreign key constraint
ALTER TABLE dbo.pv_metodosPagoOrgs 
DROP CONSTRAINT FK_pv_metodosPagoOrgs_pv_metodosDisponibles;

-- 2. Verify table structure to confirm correct columns
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'pv_metodosPagoOrgs';

-- 3. Create the correct foreign key constraint
ALTER TABLE dbo.pv_metodosPagoOrgs
ADD CONSTRAINT FK_pv_metodosPagoOrgs_pv_metodosDisponibles
FOREIGN KEY (metodoDisponibleID) 
REFERENCES dbo.pv_metodosDisponibles(metodoDisponibleID);

-- 4. Now insert data with the correct relationship
DELETE FROM dbo.pv_metodosPagoOrgs;

INSERT INTO dbo.pv_metodosPagoOrgs (metodoDisponibleID, organizacionID)
SELECT 
    md.metodoDisponibleID,
    o.organizacionid
FROM 
    dbo.pv_organizaciones o
CROSS APPLY (
    SELECT TOP (1 + ABS(CHECKSUM(NEWID())) % 3) 
        metodoDisponibleID
    FROM dbo.pv_metodosDisponibles
    WHERE esActivo = 1
    ORDER BY NEWID()
) md;

-- 5. Verify the results
SELECT 
    mpo.metodoPagoOrgs,
    mpo.metodoDisponibleID,
    md.nombre AS MetodoNombre,
    mpo.organizacionID,
    o.nombre AS OrganizacionNombre
FROM 
    dbo.pv_metodosPagoOrgs mpo
JOIN 
    dbo.pv_metodosDisponibles md ON mpo.metodoDisponibleID = md.metodoDisponibleID
JOIN 
    dbo.pv_organizaciones o ON mpo.organizacionID = o.organizacionid;*/

	-- Eliminar datos existentes en pv_metodosPagoOrgs (si es necesario)
DELETE FROM dbo.pv_metodosPagoOrgs;

-- Insertar asignaciones aleatorias de métodos de pago a organizaciones
INSERT INTO dbo.pv_metodosPagoOrgs (metodoDisponibleID, organizacionID)
SELECT 
    md.metodoDisponibleID,
    o.organizacionid
FROM 
    dbo.pv_organizaciones o
CROSS APPLY (
    SELECT TOP (1 + ABS(CHECKSUM(NEWID())) % 3) 
        metodoDisponibleID
    FROM dbo.pv_metodosDisponibles
    ORDER BY NEWID()
) md;