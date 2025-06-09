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


INSERT INTO dbo.pv_listaBlancaIPs (ipPermitido) VALUES
(62369638),   -- 37.132.10.1
(13606708),  -- 81.46.0.100
(31557081),  -- 188.76.5.20
(31499530),  -- 187.188.0.10
(31853616),  -- 189.192.1.20
(33784926),  -- 201.140.10.30
(30474634),  -- 181.196.2.10
(31230812),  -- 186.80.0.20
(32014026);  -- 190.254.3.30