-- Eliminar datos existentes y reiniciar el contador de identidad
DELETE FROM pv_votanteGrupo;
DBCC CHECKIDENT ('pv_votanteGrupo', RESEED, 0);

-- Asignación de usuarios a grupos demográficos, educativos y combinados (grupos 1-30)
INSERT INTO pv_votanteGrupo (grupoVotacionID, usuarioID, organizacionID, fechaIncorporacion)
SELECT 
    g.grupoVotacionID,
    u.userid,
    NULL,
    DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 730, GETDATE())  -- Fecha aleatoria en últimos 2 años
FROM pv_usuarios u
CROSS JOIN (
    SELECT grupoVotacionID 
    FROM pv_grupoVotacion 
    WHERE grupoVotacionID BETWEEN 1 AND 30
) g
WHERE ABS(CHECKSUM(NEWID())) % 100 < 20  -- 20% de probabilidad de asignación

-- Asignación de organizaciones a grupos institucionales/crowdfunding (grupos 31-40)
INSERT INTO pv_votanteGrupo (grupoVotacionID, usuarioID, organizacionID, fechaIncorporacion)
SELECT 
    g.grupoVotacionID,
    NULL,
    o.organizacionid,
    DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 730, GETDATE())  -- Fecha aleatoria en últimos 2 años
FROM pv_organizaciones o
CROSS JOIN (
    SELECT grupoVotacionID 
    FROM pv_grupoVotacion 
    WHERE grupoVotacionID BETWEEN 31 AND 40
) g
WHERE ABS(CHECKSUM(NEWID())) % 100 < 30  -- 30% de probabilidad de asignación

-- Asignación especial: usuarios a grupos de crowdfunding (grupos 31-35)
INSERT INTO pv_votanteGrupo (grupoVotacionID, usuarioID, organizacionID, fechaIncorporacion)
SELECT 
    g.grupoVotacionID,
    u.userid,
    NULL,
    DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 730, GETDATE())
FROM pv_usuarios u
CROSS JOIN (
    SELECT grupoVotacionID 
    FROM pv_grupoVotacion 
    WHERE grupoVotacionID BETWEEN 31 AND 35
) g
WHERE ABS(CHECKSUM(NEWID())) % 100 < 15  -- 15% de probabilidad

-- Asignación especial: usuarios a grupos institucionales (grupos 36-40)
INSERT INTO pv_votanteGrupo (grupoVotacionID, usuarioID, organizacionID, fechaIncorporacion)
SELECT 
    g.grupoVotacionID,
    u.userid,
    NULL,
    DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 730, GETDATE())
FROM pv_usuarios u
CROSS JOIN (
    SELECT grupoVotacionID 
    FROM pv_grupoVotacion 
    WHERE grupoVotacionID BETWEEN 36 AND 40
) g
WHERE ABS(CHECKSUM(NEWID())) % 100 < 10  -- 10% de probabilidad