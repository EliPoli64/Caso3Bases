Use VotoPV01
Go


INSERT INTO pv_educacionUsuario(userid, nivelID)
SELECT
    u.userid,
    (ABS(CHECKSUM(NEWID())) % 6) + 1 AS nivelID
FROM
    pv_usuarios u

