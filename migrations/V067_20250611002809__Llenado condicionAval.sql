INSERT INTO pv_condicionAval (avalID, tipoCondicion, valorCondicion)
VALUES
-- Condiciones para el aval de transporte público (avalID 1)
(1, 'Presupuesto mínimo', '5000000000'), -- 5 mil millones de colones
(1, 'Plazo máximo ejecución', '24'), -- 24 meses
(1, 'Cobertura mínima', '80% GAM'),

-- Condiciones para el aval de becas rurales (avalID 2)
(2, 'Beneficiarios mínimos', '1000'),
(2, 'Regiones objetivo', 'Brunca, Huetar Caribe, Chorotega'),
(2, 'Presupuesto asignado', '2000000000'), -- 2 mil millones
(2, 'Periodicidad informes', 'Trimestral'),

-- Condiciones para el aval de clínicas móviles (avalID 3)
(3, 'Cobertura geográfica', 'Zonas con IDH < 0.7'),
(3, 'Frecuencia atención', 'Mínimo 1 visita mensual'),
(3, 'Personal calificado', 'Médico general y enfermera por equipo'),

-- Condiciones para el aval de reforestación (avalID 4)
(4, 'Especies nativas', 'Mínimo 80%'),
(4, 'Supervivencia plantas', 'Mínimo 70% al año'),
(4, 'Participación comunitaria', 'Mínimo 30% voluntarios locales'),

-- Condiciones para el aval de centros de innovación (avalID 5)
(5, 'Provincias cubiertas', '7'),
(5, 'Capacitaciones anuales', '100'),
(5, 'Startups apoyadas', '50 por año'),
(5, 'Presupuesto mínimo', '3000000000'), -- 3 mil millones

-- Condiciones para el aval de apoyo a artistas (avalID 6)
(6, 'Diversidad regional', 'Artistas de al menos 5 provincias'),
(6, 'Exposiciones públicas', 'Mínimo 2 por año'),
(6, 'Presupuesto ejecución', '80% destinado directamente a artistas');