Use VotoPV01
Go


INSERT INTO pv_direccionesUsuarios(userid, direccionNacimientoid, direccionViviendaid, activa)
SELECT
    u.userid,
    (ABS(CHECKSUM(NEWID())) % 15) + 1 AS direccionNacimientoid,
	(ABS(CHECKSUM(NEWID())) % 15) + 1 AS direccionViviendaid,
	1 as activa
FROM
    pv_usuarios u
