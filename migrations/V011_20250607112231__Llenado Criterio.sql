INSERT INTO pv_detalleSegmento(segmentoID, tipoDetalleID, tabla, campo)
VALUES
(2,2, 'pv_usuarios', 'fechaNacimiento - Realizar conversión'),
(3,2, 'pv_usuarios', 'fechaNacimiento - Realizar conversión'),
(4,2, 'pv_usuarios', 'fechaNacimiento - Realizar conversión'),
(5,3, 'pv_provincias', 'provinciaid'),
(6,3, 'pv_provincias', 'provinciaid'),
(7,5, 'pv_nivelEducacion', 'nivelID'),
(8,12, 'pv_afiliaciones', 'afiliacionID')
;

INSERT INTO dbo.pv_criterio (nombre, comparador, valor, detalleID) VALUES
('Mayor a 18', '>=', 18, 1),
('Menor a 30', '<=', 30, 1),
('Mayor a 30', '>', 30, 2),
('Menor a 60', '<=', 60, 2),
('Mayor a 60', '>', 60, 3),
('Heredianas', '=', 4, 4),
('Josefinas', '=', 1, 5),
('Universitarios', '>', 2, 6),
('Estudiantes TEC', '=', 2,7)
;

