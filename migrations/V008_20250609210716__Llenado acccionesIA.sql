DECLARE @cont INT = (SELECT COUNT(*) FROM pv_wfProceso)
WHILE @cont > 0 
BEGIN
INSERT INTO pv_accionesIA
VALUES (FLOOR(1+RAND()*50), @cont)
SET @cont = @cont-1
END
