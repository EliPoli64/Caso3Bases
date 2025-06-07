INSERT INTO dbo.pv_estadoVotacion (nombre, descripción)
VALUES
    ('Pendiente', 'La votación ha sido creada pero aún no ha comenzado.'),
    ('Activa', 'La votación está abierta y los participantes pueden emitir sus votos.'),
    ('Cerrada', 'El periodo de votación ha finalizado y ya no se pueden emitir votos.'),
    ('Resultados Disponibles', 'La votación ha sido cerrada y los resultados finales están publicados.'),
    ('Cancelada', 'La votación fue anulada antes de su finalización por diversas razones.'),
    ('En Recuento', 'La votación ha finalizado y los votos están siendo contados o verificados.');

INSERT INTO dbo.pv_boletaRequisitosPropuestas (nombre, esActual)
VALUES
    ('Requisitos Básicos - General', 1),
    ('Requisitos Detallados - Infraestructura', 0),
    ('Requisitos Legales - Leyes', 1),
    ('Requisitos Financieros - Presupuesto', 1),
    ('Requisitos Simplificados - Iniciativa Ciudadana', 0),
    ('Requisitos Ambientales - Proyectos Verdes', 1),
    ('Requisitos Educativos - Programas', 0),
    ('Requisitos de Salud - Campañas', 1),
    ('Requisitos de Tecnología - Innovación', 1),
    ('Requisitos Administrativos - Nombramientos', 0),
    ('Requisitos de Consulta Popular', 1),
    ('Requisitos Especiales - Proyectos Complejos', 0);

INSERT INTO dbo.pv_tiposPropuesta (nombre, boletaID)
VALUES
    ('Propuesta de Ley', (SELECT boletaID FROM dbo.pv_boletaRequisitosPropuestas WHERE nombre = 'Requisitos Legales - Leyes')),
    ('Proyecto de Infraestructura', (SELECT boletaID FROM dbo.pv_boletaRequisitosPropuestas WHERE nombre = 'Requisitos Detallados - Infraestructura')),
    ('Iniciativa Ciudadana', (SELECT boletaID FROM dbo.pv_boletaRequisitosPropuestas WHERE nombre = 'Requisitos Simplificados - Iniciativa Ciudadana')),
    ('Modificación de Reglamento', (SELECT boletaID FROM dbo.pv_boletaRequisitosPropuestas WHERE nombre = 'Requisitos Básicos - General')),
    ('Presupuesto Comunitario', (SELECT boletaID FROM dbo.pv_boletaRequisitosPropuestas WHERE nombre = 'Requisitos Financieros - Presupuesto')),
    ('Nombramiento de Cargo', (SELECT boletaID FROM dbo.pv_boletaRequisitosPropuestas WHERE nombre = 'Requisitos Administrativos - Nombramientos')),
    ('Consulta Pública', (SELECT boletaID FROM dbo.pv_boletaRequisitosPropuestas WHERE nombre = 'Requisitos de Consulta Popular')),
    ('Propuesta de Educación', (SELECT boletaID FROM dbo.pv_boletaRequisitosPropuestas WHERE nombre = 'Requisitos Educativos - Programas')),
    ('Propuesta de Salud', (SELECT boletaID FROM dbo.pv_boletaRequisitosPropuestas WHERE nombre = 'Requisitos de Salud - Campañas')),
    ('Propuesta Ambiental', (SELECT boletaID FROM dbo.pv_boletaRequisitosPropuestas WHERE nombre = 'Requisitos Ambientales - Proyectos Verdes')),
    ('Propuesta de Innovación', (SELECT boletaID FROM dbo.pv_boletaRequisitosPropuestas WHERE nombre = 'Requisitos de Tecnología - Innovación')),
    ('Proyecto Complejo', (SELECT boletaID FROM dbo.pv_boletaRequisitosPropuestas WHERE nombre = 'Requisitos Especiales - Proyectos Complejos'));