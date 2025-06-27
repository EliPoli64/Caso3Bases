-- Debe tener lleno la tabla de users y AUTHPlatforms
DECLARE @cont INT = 1000
WHILE @cont > 0
BEGIN
	INSERT INTO pv_sesiones VALUES
	(LOWER(CONVERT(VARCHAR(36), NEWID())),-- el NEWID genera un id único como tipo una cadena random pero única
	HASHBYTES('SHA2_256', CAST(@cont AS VARCHAR(10))),
	HASHBYTES('SHA2_256', CAST(@cont+1 AS VARCHAR(10))),
	GETDATE(),
	DATEADD(MINUTE, 30, GETDATE()),
	@cont,
	1 + FLOOR(RAND() * 3)) -- Número random entre 1 y 3
	SET @cont = @cont-1
END
