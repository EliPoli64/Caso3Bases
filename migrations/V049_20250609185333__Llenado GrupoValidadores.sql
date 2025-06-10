-- Insertar grupos validadores para el sistema de votación y crowdfunding
INSERT INTO pv_grupoValidador ( nombreGrupo, tipoID, descripcion, fechaCreacion) VALUES
-- Grupos de validación ciudadana (tipoID 1)
( 'Comité Ciudadano de Validación Nacional', 1, 'Grupo de ciudadanos seleccionados para validar propuestas a nivel nacional', '2024-01-15'),
( 'Validadores Comunitarios GAM', 1, 'Ciudadanos encargados de validar propuestas en la Gran Área Metropolitana', '2024-02-10'),
( 'Fiscalizadores Costeros', 1, 'Grupo de validación para propuestas en zonas costeras', '2024-01-20'),

-- Aceleradoras (tipoID 2)
( 'Aceleradora Pura Vida Startups', 2, 'Aceleradora especializada en emprendimientos tecnológicos', '2023-11-05'),
( 'CR Innova Accelerator', 2, 'Programa de aceleración para proyectos innovadores', '2023-12-01'),
( 'GreenTech Aceleradora', 2, 'Especializada en proyectos de tecnología verde', '2024-01-08'),

-- Incubadoras (tipoID 3)
( 'Incubadora UCR Emprende', 3, 'Incubadora de la Universidad de Costa Rica', '2023-10-15'),
( 'TEC Ventures', 3, 'Incubadora del Tecnológico de Costa Rica', '2023-11-20'),
( 'Impact Hub San José', 3, 'Espacio de coworking e incubación para proyectos sociales', '2024-02-05'),

-- Grupos inversores (tipoID 4)
( 'Costa Rica Venture Capital', 4, 'Grupo de inversionistas ángeles', '2023-09-12'),
( 'CR Tech Investors', 4, 'Consorcio de inversionistas en tecnología', '2023-10-30'),
( 'Impact Investors Network', 4, 'Inversionistas enfocados en impacto social', '2024-01-25'),

-- Comités técnicos (tipoID 5)
( 'Comité Técnico MICITT - Tecnología', 5, 'Evaluadores técnicos del MICITT para proyectos tecnológicos', '2023-12-15'),
( 'Comité Técnico MICITT - Innovación', 5, 'Evaluadores de innovación del MICITT', '2024-01-10'),

-- Evaluadores de Hacienda (tipoID 6)
( 'Comité Fiscal MICITT', 6, 'Evaluadores de aspectos fiscales y financieros', '2023-11-28'),

-- Consejo Social (tipoID 7)
( 'Consejo Social para Desarrollo Comunitario', 7, 'Evaluadores de impacto social de las propuestas', '2024-02-01'),

-- Comité Ambiental (tipoID 8)
( 'Comité Ambiental Sostenible', 8, 'Evaluadores de impacto ambiental de proyectos', '2023-12-20'),

-- Validadores de documentación (tipoID 9)
( 'Unidad de Verificación Documental', 9, 'Especialistas en validación de documentos legales', '2024-01-05'),

-- Fiscalizadores de ejecución (tipoID 10)
( 'Fiscalizadores de Proyectos en Ejecución', 10, 'Supervisores del avance de proyectos financiados', '2024-02-15'),

-- Comité Ético (tipoID 11)
( 'Comité Ético de Voto Pura Vida', 11, 'Evaluadores de aspectos éticos de propuestas y procesos', '2023-12-01');