INSERT INTO dbo.pv_segmento (nombre) VALUES
('General'),
('Jóvenes (18-30)'),
('Adultos (31-60)'),
('Adultos Mayores (61+)'),
('Residentes Urbanos'),
('Residentes Rurales'),
('Padres de Familia'),
('Estudiantes Universitarios');
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
('Tipo de Servicio');
('Afiliación'),
('Género');
INSERT INTO dbo.pv_tipoPregunta (tipo) VALUES
('Opción Múltiple'),
('Respuesta Abierta'),
('Escala Likert'),
('Sí/No'),
('Numérica');
INSERT INTO dbo.pv_estadoComentarios (estadoComentid, nombre) VALUES
(1, 'Pendiente de Revisión'),
(2, 'Aprobado'),
(3, 'Rechazado'),
(4, 'Archivado'),
(5, 'Respondido');