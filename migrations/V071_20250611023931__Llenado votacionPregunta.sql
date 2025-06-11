-- ocupa pv_votacion y pv_preguntas
INSERT INTO pv_votacionPregunta (
    votacionID,
    preguntaID
) VALUES
-- Preguntas para la votación de Mejora de Transporte Público (votacionID = 1)
( 1, 1),  -- ¿Está de acuerdo con la propuesta de mejora del transporte público?
( 1, 2),  -- ¿Qué aspecto del transporte público considera más urgente mejorar?
( 1, 3),  -- ¿Qué tan satisfecho está con el transporte público actual? (1-5)
( 1, 4),  -- ¿Qué tan dispuesto estaría a pagar un 10% más por mejor servicio?

-- Preguntas para la votación de Becas Rurales (votacionID = 2)
( 2, 5),  -- ¿Qué porcentaje del presupuesto debería asignarse a primaria?
( 2, 6),  -- ¿Qué porcentaje del presupuesto debería asignarse a secundaria?
( 2, 7),  -- ¿Qué porcentaje del presupuesto debería asignarse a educación técnica?
( 2, 8),  -- ¿Qué porcentaje del presupuesto debería asignarse a universidad?

-- Preguntas para la Consulta Pública: Clínicas Móviles (votacionID = 3)
( 3, 9),   -- ¿Con qué frecuencia deberían visitar las clínicas móviles su comunidad?
( 3, 10), -- ¿Qué servicios de salud son más necesarios en su zona?
( 3, 11), -- ¿Estaría dispuesto a contribuir con un pequeño porcentaje municipal para este programa?

-- Preguntas para la Votación: Prioridad de Reforestación (votacionID = 4)
( 4, 12), -- Clasifique las especies de árboles preferidas para reforestar (1-5)
( 4, 13), -- ¿Qué beneficios ecológicos prioriza en la reforestación?
( 4, 14), -- ¿Qué tan importante es incluir especies frutales en la reforestación?

-- Preguntas para la Votación: Centros de Innovación (votacionID = 5)
(5, 15), -- ¿Qué áreas de innovación deberían priorizarse en su provincia?
( 5, 16), -- ¿Qué tan accesibles son los centros de innovación actuales? (1-5)
(5, 17), -- ¿Qué tipo de programas de capacitación serían más útiles?

-- Preguntas para la Campaña: Apoyo a Artistas Emergentes (votacionID = 6)
(6, 18), -- ¿Qué tipo de apoyo es más beneficioso para artistas emergentes?
( 6, 19), -- ¿Deberían los fondos para producción ser reembolsables?
( 6, 20), -- Describa cómo un programa de apoyo puede impactar la escena artística local.
( 6, 21), -- ¿Cuántos espacios para exposiciones son necesarios en su ciudad?
( 6, 22), -- ¿Cuán accesible es el arte y la cultura en su comunidad? (1-5)

-- Preguntas adicionales para votaciones futuras relacionadas con Costa Rica
( 1, 23), -- ¿Cómo calificaría el estado de las carreteras en su provincia? (1-5)
( 2, 24), -- ¿Qué porcentaje del presupuesto debería destinarse a transporte de estudiantes?
( 3, 25), -- ¿Qué tan satisfecho está con los servicios de salud pública en su zona? (1-5)
(4, 26), -- ¿Con qué frecuencia participa en actividades de reforestación?
( 5, 27), -- ¿Qué tan importante es para usted que existan centros de innovación tecnológica?
( 6, 28), -- ¿Con qué frecuencia asiste a eventos culturales en su comunidad?

-- Preguntas específicas para proyectos de crowdfunding en Costa Rica
( 2, 29), -- ¿Qué tan importante es para usted que los proyectos tengan impacto ambiental positivo?
( 5, 30), -- ¿Qué sector tecnológico considera más prometedor para invertir en Costa Rica?
( 6, 31), -- ¿Qué tipo de proyectos artísticos le interesaría apoyar financieramente?
( 3, 32), -- ¿Estaría dispuesto a invertir en un proyecto de salud comunitaria?
( 4, 33), -- ¿Qué tan importante es para usted que los proyectos de reforestación incluyan educación ambiental?
( 1, 34), -- ¿Qué tan dispuesto estaría a usar transporte público si mejorara significativamente?

-- Preguntas sobre participación ciudadana
( 1, 35), -- ¿Con qué frecuencia participa en consultas públicas o votaciones?
( 2, 36), -- ¿Qué tan informado se siente sobre los proyectos de desarrollo en su comunidad?
( 3, 37), -- ¿Qué canales prefiere para recibir información sobre consultas públicas?
( 4, 38), -- ¿Qué tan efectivas cree que son las consultas públicas para influir en decisiones?
( 5, 39), -- ¿Qué tan accesibles son los mecanismos de participación ciudadana en su zona?
( 6, 40); -- ¿Qué tan satisfecho está con los resultados de procesos participativos anteriores?