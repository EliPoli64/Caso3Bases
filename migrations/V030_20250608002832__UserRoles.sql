USE VotoPV01;
GO


INSERT INTO pv_rolesUsuarios (
    userId,
    rolId,
    lastUpdate,
    enabled,
    checksum,
    deleted
)
SELECT
    u.userid,
    CASE
        WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 1 
        ELSE 2 
    END AS rolId,
    GETDATE() AS lastUpdate,
    1 AS enabled,
    CONVERT(VARCHAR(250), HASHBYTES('MD5', CONVERT(NVARCHAR(MAX), u.userid) + 
						  CONVERT(NVARCHAR(MAX), CASE WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 1 ELSE 2 END))) 
						  AS checksum,
    0 AS deleted
FROM
    pv_usuarios u
WHERE NOT EXISTS ( 
    SELECT 1
    FROM dbo.pv_rolesUsuarios pru
    WHERE pru.userId = u.userid
      AND pru.rolId IN (1, 2)
); --Esta parte rellena con admins y ciudadanos
GO


INSERT INTO dbo.pv_rolesUsuarios (
    userId,
    rolId,
    lastUpdate,
    enabled,
    checksum,
    deleted
)
SELECT TOP 500 
    u.userid,
    r.rolId,
    GETDATE() AS lastUpdate,
    1 AS enabled,
    CONVERT(VARCHAR(250), HASHBYTES('MD5', CONVERT(NVARCHAR(MAX), u.userid) + CONVERT(NVARCHAR(MAX), r.rolId))) AS checksum,
    0 AS deleted
FROM
    pv_usuarios u
CROSS JOIN
    pv_roles r
WHERE
    r.rolId BETWEEN 3 AND 8 -- Solo roles del 3 al 8 -> Excluyendo admin y ciudadano
    AND NOT EXISTS ( -- Evitar duplicados (un usuario no puede tener el mismo rol dos veces)
        SELECT 1
        FROM dbo.pv_rolesUsuarios pru
        WHERE pru.userId = u.userid
          AND pru.rolId = r.rolId
    )
ORDER BY
    NEWID();
GO --Esta segunda parte, agrega aleatoriamente a 500 usuarios algun otro rol aleatorio. 

