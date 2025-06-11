INSERT INTO pv_propuestaVotacion (
	propuestaVotacionID,
    votacionID,
    propuestaID,
    usuarioID,
    deleted,
    checksum
) VALUES
-- Votación 1: Mejora de Transporte Público (propuesta 1)
(1,1, 1, 1, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion1-1-1')),
(1,1, 1, 10, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion1-1-10')),
(1,1, 1, 100, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion1-1-100')),

-- Votación 2: Becas Rurales (propuesta 2)
(2,2, 2, 89, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion2-2-89')),
(2,2, 2, 789, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion2-2-789')),
(2,2, 2, 364, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion2-2-364')),

-- Votación 3: Clínicas Móviles (propuesta 3)
(3,3, 3, 1, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion3-3-1')),
(3,3, 3, 10, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion3-3-10')),
(3, 3,3, 100, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion3-3-100')),

-- Votación 4: Reforestación (propuesta 4)
(4,4, 4, 89, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion4-4-89')),
(4,4, 4, 789, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion4-4-789')),
(4, 4,4, 364, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion4-4-364')),

-- Votación 5: Centros de Innovación (propuesta 5)
(5, 5, 5,1, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion5-5-1')),
(5, 5, 5,10, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion5-5-10')),
(5, 5, 5,100, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion5-5-100')),

-- Votación 6: Apoyo a Artistas (propuesta 6)
(6, 6, 6,89, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion6-6-89')),
(6, 6,6, 789, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion6-6-789')),
(6, 6, 6,364, 0, HASHBYTES('SHA2_256', 'PropuestaVotacion6-6-364'));
