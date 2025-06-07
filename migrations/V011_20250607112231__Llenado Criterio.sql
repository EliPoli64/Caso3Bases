INSERT INTO dbo.pv_criterio (nombre, comparador, valor) VALUES
('Edad Mínima', '>=', 18),
('Edad Máxima', '<=', 65),
('Ingreso Anual Mínimo', '>=', 25000),
('Educación Mínima', '>=', 3), -- 3 es universitario o mayor
('Género Masculino', '=', 1),
('Género Femenino', '=', 0),
('Nacionalidad Costarricense', '=', 1),
('Participaciones en Eventos', '>=', 2);