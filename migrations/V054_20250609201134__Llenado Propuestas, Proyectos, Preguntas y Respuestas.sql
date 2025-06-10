Use VotoPV01
Go

--Este es el script que debería arreglar propuestas (Estaba un poco mal). Ejecutar una única vez. :D
--IF EXISTS (SELECT * FROM sys.columns WHERE Name = N'eventoID' AND Object_ID = Object_ID(N'dbo.pv_propuestas'))
--BEGIN
--    ALTER TABLE dbo.pv_propuestas
--    DROP COLUMN eventoID;
--    PRINT 'Column eventoID dropped successfully from dbo.pv_propuestas.';
--END
--ELSE
--BEGIN
 --   PRINT 'Column eventoID does not exist or has already been dropped.';
--END;

--IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_pv_propuestas_pv_usuarios_userId')
--BEGIN
--    ALTER TABLE dbo.pv_propuestas
--    ADD CONSTRAINT FK_pv_propuestas_pv_usuarios_userId FOREIGN KEY (userid)
--    REFERENCES pv_usuarios (userid); 
 --   PRINT 'Foreign Key FK_pv_propuestas_pv_usuarios_userId agregado.';
--END
--ELSE
--BEGIN
--    PRINT 'Foreign Key FK_pv_propuestas_pv_usuarios_userId ya existe';
--END;

-- Fin arreglo.


INSERT INTO pv_propuestas (categoriaid,descripcion,imgURL,fechaInicio,userid,fechaFin,checksum,comentarios,tipoPropuestaID,estadoID,organizacionID) 
VALUES
(1, 'Propuesta para la mejora y ampliación de la red de transporte público en la capital, incluyendo nuevas rutas de autobús y carriles exclusivos para bicicletas.', NULL , '2025-06-09 09:00:00', 1, '2026-03-15 17:00:00', HASHBYTES('SHA2_256', 'Propuesta Infraestructura 1'), 1, 2, 1, NULL),
(2, 'Implementación de un programa de becas para estudiantes de bajos recursos en áreas rurales, cubriendo costos de matrícula, materiales y transporte.', NULL, '2024-06-01 10:30:00', 10, NULL, HASHBYTES('SHA2_256', 'Propuesta Educación 2'), 0, 8, 1, NULL),
(3, 'Establecimiento de clínicas móviles en zonas periurbanas para ofrecer servicios de atención primaria y vacunación periódica.', NULL, '2024-04-20 08:00:00', 100, '2025-04-20 18:00:00', HASHBYTES('SHA2_256', 'Propuesta Salud 3'), 1, 9, 2, NULL),
(4, 'Campaña nacional de reforestación en áreas degradadas, con la participación de voluntarios y el uso de especies nativas.', NULL, '2024-07-01 07:00:00', 89, NULL, HASHBYTES('SHA2_256', 'Propuesta Ambiente 4'), 1, 10, 1, NULL),
(5, 'Creación de centros de innovación y tecnología en cada provincia para fomentar el desarrollo de startups locales y la formación en habilidades digitales.', NULL, '2024-05-10 11:00:00', 789, '2025-05-10 16:00:00', HASHBYTES('SHA2_256', 'Propuesta Tecnología 5'), 0, 5, 2, NULL),
(6, 'Programa de apoyo a artistas emergentes, con fondos para la producción de obras y espacios para exposiciones y presentaciones públicas.', NULL, '2024-02-28 14:00:00', 364, NULL, HASHBYTES('SHA2_256', 'Propuesta Cultura 6'), 1, 7, 1, NULL);


INSERT INTO pv_proyecto(propuestaID, estadoID, fechaInicio, fechaEstimadaFin, fechaCreacion, metodoTrabajoID, montoPedido, porcentaje)
VALUES
(1, 2, '2025-07-10', '2027-07-10', GETDATE(), 3, 100000, 10),
(2, 2, '2025-08-04', NULL, GETDATE(), 8, 300000, 2),
(3, 3, '2027-01-01', NULL, GETDATE(), 6, 400000, 7),
(4, 2, '2026-08-01', '2028-08-01', GETDATE(),11, 900000, 1),
(5, 2, '2025-07-01', '2025-12-31', GETDATE(), 12,700000, 3.5),
(6, 2, '2026-01-01', NULL, GETDATE(), 6, 100000, 50);



INSERT INTO dbo.pv_preguntas (
    enunciado,
    tipoPreguntaID,
    maxSelecciones,
    fechaPublicacion,
    deleted,
    [order],
    checksum
) VALUES
('¿Cuál es la principal prioridad en la mejora del transporte público?', 1, 1, '2025-07-10', 0, 1, HASHBYTES('SHA2_256', 'P1Q1')),
('¿Qué tan importante considera la creación de carriles exclusivos para bicicletas?', 3, 1,'2025-07-10', 0, 3, HASHBYTES('SHA2_256', 'P1Q2')),
('¿El programa de becas debe incluir apoyo psicológico?', 4, 1, '2024-06-08 10:15:00', 0, 1, HASHBYTES('SHA2_256', 'P2Q1')),
('En una escala del 1 al 5, ¿cuál es la urgencia de implementar este programa?', 3, 1, '2024-06-08 10:25:00', 0, 3, HASHBYTES('SHA2_256', 'P2Q2')),
('¿Qué tipo de materiales educativos adicionales se necesitan?', 2, 1, '2024-06-08 10:30:00', 0, 4, HASHBYTES('SHA2_256', 'P2Q3')),
('¿Cuál es el principal desafío de las clínicas móviles en zonas periurbanas?', 1, 1, '2024-06-08 10:35:00', 0, 1, HASHBYTES('SHA2_256', 'P3Q1')),
('¿Considera que la vacunación periódica es suficiente para prevenir enfermedades?', 4, 1, '2024-06-08 10:40:00', 0, 2, HASHBYTES('SHA2_256', 'P3Q2')),
('Describa cómo las clínicas móviles pueden mejorar el acceso a la salud.', 2, 1, '2024-06-08 10:45:00', 0, 3, HASHBYTES('SHA2_256', 'P3Q3')),
('¿Cuántas clínicas móviles son necesarias para cubrir todas las zonas periurbanas?', 5, 1, '2024-06-08 10:50:00', 0, 4, HASHBYTES('SHA2_256', 'P3Q4')),
('En una escala de 1 a 5, ¿cuán efectiva es la atención primaria brindada por las clínicas móviles?', 3, 5, '2024-06-08 10:55:00', 0, 5, HASHBYTES('SHA2_256', 'P3Q5')),
('¿Cuáles son las especies nativas más adecuadas para la reforestación?', 1, 5, '2024-06-08 11:00:00', 0, 1, HASHBYTES('SHA2_256', 'P4Q1')),
('¿Debería involucrarse a la comunidad en la campaña de reforestación?', 4, 1, '2024-06-08 11:05:00', 0, 2, HASHBYTES('SHA2_256', 'P4Q2')),
('Describa el impacto a largo plazo de la reforestación en el ecosistema local.', 2, 1, '2024-06-08 11:10:00', 0, 3, HASHBYTES('SHA2_256', 'P4Q3')),
('¿Qué tipo de habilidades digitales son más demandadas en el mercado actual?', 1, 3, '2024-06-08 11:15:00', 0, 1, HASHBYTES('SHA2_256', 'P5Q1')),
('¿La creación de centros de innovación debe ser una prioridad nacional?', 4, 1, '2024-06-08 11:20:00', 0, 2, HASHBYTES('SHA2_256', 'P5Q2')),
('En una escala del 1 al 5, ¿cuál es el potencial de crecimiento de startups en su provincia?', 3, 5, '2024-06-08 11:25:00', 0, 3, HASHBYTES('SHA2_256', 'P5Q3')),
('Mencione tres áreas tecnológicas que considera cruciales para el desarrollo.', 2, 1, '2024-06-08 11:30:00', 0, 4, HASHBYTES('SHA2_256', 'P5Q4')),
('¿Qué tipo de apoyo es más beneficioso para artistas emergentes?', 1, 1, '2024-06-08 11:35:00', 0, 1, HASHBYTES('SHA2_256', 'P6Q1')),
('¿Deberían los fondos para producción ser reembolsables?', 4, 1, '2024-06-08 11:40:00', 0, 2, HASHBYTES('SHA2_256', 'P6Q2')),
('Describa cómo un programa de apoyo puede impactar la escena artística local.', 2, 1, '2024-06-08 11:45:00', 0, 3, HASHBYTES('SHA2_256', 'P6Q3')),
('¿Cuántos espacios para exposiciones son necesarios en su ciudad?', 5, 1, '2024-06-08 11:50:00', 0, 4, HASHBYTES('SHA2_256', 'P6Q4')),
('En una escala del 1 al 5, ¿cuán accesible es el arte y la cultura en su comunidad?', 3, 1, '2024-06-08 11:55:00', 0, 5, HASHBYTES('SHA2_256', 'P6Q5'));


INSERT INTO dbo.pv_respuestas (
    preguntaID,
    respuesta,
    url,
    value,
    [order], 
    deleted,
    checksum
) VALUES

(1, 'Mejorar el transporte público', NULL, 'Mejorar el transporte público', 1, 0, HASHBYTES('SHA2_256', 'P1Q1_R1')),
(1, 'Reducir el tráfico', NULL, 'Reducir el tráfico', 2, 0, HASHBYTES('SHA2_256', 'P1Q1_R2')),
(1, 'Promover la movilidad sostenible', NULL, 'Promover la movilidad sostenible', 3, 0, HASHBYTES('SHA2_256', 'P1Q1_R3')),
(2, 'Muy importante', NULL, 'Muy importante', 1, 0, HASHBYTES('SHA2_256', 'R1Q2')),
(2, 'Importante', NULL, 'Importante', 2, 0, HASHBYTES('SHA2_256', 'R2Q2')),
(2, 'Regular', NULL, 'Regular', 3, 0, HASHBYTES('SHA2_256', 'R3Q2')),
(2, 'Poco Importante', NULL, 'Poco Importante', 4, 0, HASHBYTES('SHA2_256', 'R4Q2')),
(2, 'Nada Importante', NULL, 'Nada Importante', 5, 0, HASHBYTES('SHA2_256', 'R5Q2')),
(3, 'Sí', NULL, 'Sí', 1, 0, HASHBYTES('SHA2_256', 'P2Q1_R1')),
(3, 'No', NULL, 'No', 2, 0, HASHBYTES('SHA2_256', 'P2Q1_R1')),
(4, 'Muy urgente', NULL, 'Muy urgente', 1, 0, HASHBYTES('SHA2_256', 'R1Q2')),
(4, 'Urgente', NULL, 'Urgente', 2, 0, HASHBYTES('SHA2_256', 'R2Q2')),
(4, 'Regular', NULL, 'Regular', 3, 0, HASHBYTES('SHA2_256', 'R3Q2')),
(4, 'Poco Urgente', NULL, 'Poco Urgente', 4, 0, HASHBYTES('SHA2_256', 'R4Q2')),
(4, 'Nada Urgente', NULL, 'Nada Urgente', 5, 0, HASHBYTES('SHA2_256', 'R5Q2')),

(5, 'Libros de texto actualizados', NULL, 'Respuesta Abierta', 1, 0, HASHBYTES('SHA2_256', 'P2Q4_R1')),

(6, 'Falta de personal médico especializado', NULL, 'Falta de personal médico especializado', 1, 0, HASHBYTES('SHA2_256', 'P3Q1_R1')),
(6, 'Problemas de logística y acceso a zonas remotas', NULL, 'Problemas de logística y acceso a zonas remotas', 2, 0, HASHBYTES('SHA2_256', 'P3Q1_R2')),
(6, 'Financiamiento y sostenibilidad del proyecto', NULL, 'Financiamiento y sostenibilidad del proyecto', 3, 0, HASHBYTES('SHA2_256', 'P3Q1_R3')),

(7, 'Sí', NULL, 'Sí', 1, 0, HASHBYTES('SHA2_256', 'P2Q1_R1')),
(7, 'No', NULL, 'No', 2, 0, HASHBYTES('SHA2_256', 'P2Q1_R1')),

(8, 'Acercan los servicios médicos esenciales.', NULL, 'Respuesta Abierta', 1, 0, HASHBYTES('SHA2_256', 'P3Q3_R1')),

(9, '10', NULL, '10', 1, 0, HASHBYTES('SHA2_256', 'P3Q4_R1')),
(9, '25', NULL, '25', 2, 0, HASHBYTES('SHA2_256', 'P3Q4_R1')),
(9, '789', NULL, '789', 3, 0, HASHBYTES('SHA2_256', 'P3Q4_R1')),
(9, '45', NULL, '45', 4, 0, HASHBYTES('SHA2_256', 'P3Q4_R1')),
(9, '3', NULL, '3', 5, 0, HASHBYTES('SHA2_256', 'P3Q4_R1')),

(10, 'Muy efectiva', NULL, 'Muy efectiva', 1, 0, HASHBYTES('SHA2_256', 'R1Q2')),
(10, 'Efectiva', NULL, 'Efectiva', 2, 0, HASHBYTES('SHA2_256', 'R2Q2')),
(10, 'Regular', NULL, 'Regular', 3, 0, HASHBYTES('SHA2_256', 'R3Q2')),
(10, 'Poco efectiva', NULL, 'Poco efectiva', 4, 0, HASHBYTES('SHA2_256', 'R4Q2')),
(10, 'Nada efectiva', NULL, 'Nada efectiva', 5, 0, HASHBYTES('SHA2_256', 'R5Q2')),

(11, 'Roble', NULL, 'Roble', 1, 0, HASHBYTES('SHA2_256', 'P4Q1_R1')),
(11, 'Almendro', NULL, 'Almendro', 2, 0, HASHBYTES('SHA2_256', 'P4Q1_R2')),
(11, 'Cedro', NULL, 'Cedro', 3, 0, HASHBYTES('SHA2_256', 'P4Q1_R1')),
(11, 'Guanacaste', NULL, 'Guanacaste', 4, 0, HASHBYTES('SHA2_256', 'P4Q1_R2')),
(11, 'Ceiba', NULL, 'Ceiba', 5, 0, HASHBYTES('SHA2_256', 'P4Q1_R1')),
(11, 'Pino', NULL, 'Pino', 6, 0, HASHBYTES('SHA2_256', 'P4Q1_R2')),

(12, 'Sí', NULL, 'Sí', 1, 0, HASHBYTES('SHA2_256', 'P2Q1_R1')),
(12, 'No', NULL, 'No', 2, 0, HASHBYTES('SHA2_256', 'P2Q1_R1')),

(13, 'Aumenta la biodiversidad.', NULL, 'Respuesta - Abierta', 1, 0, HASHBYTES('SHA2_256', 'P4Q3_R1')),


(14, 'Programación', NULL, 'Programación', 1, 0, HASHBYTES('SHA2_256', 'P5Q1_R1')),
(14, 'Inteligencia Artificial', NULL, 'Inteligencia Artificial', 2, 0, HASHBYTES('SHA2_256', 'P5Q1_R2')),
(14, 'Ciberseguridad', NULL, 'Ciberseguridad', 3, 0, HASHBYTES('SHA2_256', 'P5Q1_R3')),
(14, 'Desarrollo Web', NULL, 'Desarrollo Web', 4, 0, HASHBYTES('SHA2_256', 'P5Q1_R1')),
(14, 'Machine Learning', NULL, 'Machine Learning', 5, 0, HASHBYTES('SHA2_256', 'P5Q1_R2')),
(14, 'Análisis de Datos', NULL, 'Análisis de Datos', 6, 0, HASHBYTES('SHA2_256', 'P5Q1_R3')),

(15, 'Sí', NULL, 'Sí', 1, 0, HASHBYTES('SHA2_256', 'P2Q1_R1')),
(15, 'No', NULL, 'No', 2, 0, HASHBYTES('SHA2_256', 'P2Q1_R1')),

(16, 'Muy efectiva', NULL, 'Muy efectiva', 1, 0, HASHBYTES('SHA2_256', 'R1Q2')),
(16, 'Efectiva', NULL, 'Efectiva', 2, 0, HASHBYTES('SHA2_256', 'R2Q2')),
(16, 'Regular', NULL, 'Regular', 3, 0, HASHBYTES('SHA2_256', 'R3Q2')),
(16, 'Poco efectiva', NULL, 'Poco efectiva', 4, 0, HASHBYTES('SHA2_256', 'R4Q2')),
(16, 'Nada efectiva', NULL, 'Nada efectiva', 5, 0, HASHBYTES('SHA2_256', 'R5Q2')),

(17, 'Inteligencia Artificial.', NULL, 'Respuesta Abierta', 1, 0, HASHBYTES('SHA2_256', 'P5Q4_R1')),


(18, 'Financiación de proyectos y becas', NULL, 'Financiación de proyectos y becas', 1, 0, HASHBYTES('SHA2_256', 'P6Q1_R1')),
(18, 'Espacios para exposiciones y difusión', NULL, 'Espacios para exposiciones y difusión', 2, 0, HASHBYTES('SHA2_256', 'P6Q1_R2')),

(19, 'Sí', NULL, 'Sí', 1, 0, HASHBYTES('SHA2_256', 'P2Q1_R1')),
(19, 'No', NULL, 'No', 2, 0, HASHBYTES('SHA2_256', 'P2Q1_R1')),

(20, 'Impulsa el talento local.', NULL, 'Respuesta Abierta', 1, 0, HASHBYTES('SHA2_256', 'P6Q3_R1')),

(21, '5', NULL, '5', 1, 0, HASHBYTES('SHA2_256', 'P6Q4_R1')),
(21, '6', NULL, '6', 2, 0, HASHBYTES('SHA2_256', 'P6Q4_R1')),
(21, '5', NULL, '5', 3, 0, HASHBYTES('SHA2_256', 'P6Q4_R1')),
(21, '48', NULL, '48', 5, 0, HASHBYTES('SHA2_256', 'P6Q4_R1')),
(21, '16', NULL, '16', 4, 0, HASHBYTES('SHA2_256', 'P6Q4_R1')),
(21, '32', NULL, '32', 6, 0, HASHBYTES('SHA2_256', 'P6Q4_R1')),
(21, '3', NULL, '3', 7, 0, HASHBYTES('SHA2_256', 'P6Q4_R1')),

(22, 'Muy accesible', NULL, 'Muy efectiva', 1, 0, HASHBYTES('SHA2_256', 'R1Q2')),
(22, 'Accesible', NULL, 'Accesible', 2, 0, HASHBYTES('SHA2_256', 'R2Q2')),
(22, 'Regular', NULL, 'Regular', 3, 0, HASHBYTES('SHA2_256', 'R3Q2')),
(22, 'Poco accesible', NULL, 'Poco accesible', 4, 0, HASHBYTES('SHA2_256', 'R4Q2')),
(22, 'Nada accesible', NULL, 'Nada accesible', 5, 0, HASHBYTES('SHA2_256', 'R5Q2'));