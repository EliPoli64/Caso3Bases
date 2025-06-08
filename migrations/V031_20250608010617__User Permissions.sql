Use VotoPV01
Go

INSERT INTO pv_usuariosPermisos(userid, permisoId, enabled, deleted, lastUpdate, checksum)
SELECT
    u.userid,
    (ABS(CHECKSUM(NEWID())) % 8) + 1 AS permisoId,
    1 AS enabled,
    0 AS deleted,
    GETDATE() AS lastUpdate,
    CONVERT(VARCHAR(250), HASHBYTES('MD5',
        CONVERT(NVARCHAR(MAX), u.userid) +
        CONVERT(NVARCHAR(MAX), (ABS(CHECKSUM(NEWID())) % 8) + 1) -- El cálculo aleatorio debe ser el mismo aquí
    )) AS checksum
FROM
    pv_usuarios u
INNER JOIN
    pv_rolesUsuarios ru ON u.userid = ru.userId 
WHERE
    ru.rolId = 1 
    AND ru.enabled = 1 
    AND ru.deleted = 0 ;

