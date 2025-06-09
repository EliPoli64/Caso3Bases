INSERT INTO dbo.pv_segmento (nombre, descripcion, enabled, deleted, fechaCreacion, usuarioID) VALUES
('General', 'Segmento general', 1, 0, GETDATE(), 456),
('Jóvenes (18-30)', 'Segmento para las personas entre 18 y 30 años', 1, 0, GETDATE(), 789),
('Adultos (31-60)', 'Segmento para las personas entre 30 y 60 años', 1, 0, GETDATE(), 32),
('Adultos Mayores (61+)' , 'Segmento para las personas mayores a 61 años', 1, 0, GETDATE(), 156),
('Heredianas', 'Segmento para las personas nacidas en Heredia', 1, 0, GETDATE(), 950),
('Josefinas', 'Segmento para las personas nacidas en San José', 1, 0, GETDATE(), 950),
('Estudiantes Tec', 'Segmento para los estudiantes del tecnológico de Costa Rica', 1, 0, GETDATE(), 789);
INSERT INTO dbo.pv_tipoPregunta (tipo) VALUES
('Opción Múltiple'),
('Respuesta Abierta'),
('Escala Likert'),
('Sí/No'),
('Numérica');
INSERT INTO dbo.pv_severidadLogs (nombre) VALUES
('Debug'),
('Info'),
('Advertencia'),
('Error'),
('Critico'),
('Grave');
INSERT INTO dbo.pv_tipoDetalle (Nombre) VALUES
('Profesión'),
('Edad'),
('Provincia'),
('Ubicación'),
('Nivel de Educación'),
('Estado Civil'),
('Ingresos Mensuales'),
('Nivel de Satisfacción'),
('Frecuencia de Uso'),
('Motivo de Contacto'),
('Tipo de Servicio'),
('Afiliación'),
('Género');
INSERT INTO dbo.pv_estadoComentarios ( nombre) VALUES
('Pendiente de Revisión'),
('Aprobado'),
('Rechazado'),
('Archivado'),
('Respondido');