INSERT INTO pv_estadoDocumento
VALUES ('Aprobado'), ('Rechazado'),('En revisión'), ('En espera')

INSERT INTO pv_estadoIncumplimiento
VALUES ('Aprobado'), ('Rechazado'),('En revisión'), ('En espera')

INSERT INTO pv_estadoPropuesta (nombreEstado, descripcion)
VALUES 
('Publicada', 'Propuesta abierta a votaciones'),
('Cerrada', 'Propuesta sin votaciones activas'),
('Cancelada', 'Propuesta no aprobada'),
('Rechazada', 'Propuesta cerrada por el público')