INSERT INTO pv_statusEtapaProyecto(nombre, descripcion) VALUES
('Planificada', 'Etapa que todavía no está en ejecución pero ya está confirmada'),
('Borrador', 'Etapa que está en periodo de preplanificación, sometida a cambios y puede variar drásticamente'),
('Desarrollo', 'Etapa que está actualmente en ejecución'),
('Finalizada', 'Etapa que ya finalizó y cumplió todos sus objetivos'),
('Revisión', 'Etapa donde el proyecto está sometido a evaluación de cumplimiento')

INSERT INTO pv_statusRegistro(nombre) VALUES
('Pendiente'),
('Registrado'),
('Rechazado'),
('En Proceso')

DECLARE @cont INT = 1
DECLARE @contMax INT = (SELECT COUNT(1) FROM pv_usuarios)
WHILE @cont <= @contMax
BEGIN
	INSERT INTO pv_statusRegistroUsuarios (usuarioID, statusRegistroID, ultimaModificacion) VALUES
	(@cont, 2, DATEADD(DAY, RAND() * DATEDIFF(DAY, '2020/01/01 00:00:00', GETDATE()), '2020/01/01 00:00:00'))
	SET @cont = @cont+1
END
SET @cont = 1
WHILE @cont <= 100 -- Cambiamos algunos registros para que no todos estén registrados
BEGIN 
    UPDATE pv_statusRegistroUsuarios
    SET statusRegistroID = 1 + FLOOR(RAND() * 4), -- número random entre 1 y 4
        ultimaModificacion = GETDATE() 
    WHERE usuarioID = 1 + FLOOR(RAND() * @contMax) -- número random entre 1 y 1000 (@contMax)
    SET @cont = @cont + 1
END