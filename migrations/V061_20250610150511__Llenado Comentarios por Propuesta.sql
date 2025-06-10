USE [VotoPV01]
GO
INSERT INTO [dbo].[pv_versionPropuesta] 
([propuestaID], [numeroVersion], [descripcion], [fechaCreacion])
VALUES
(1, 1, 'Versión inicial de la propuesta de mejora del transporte público. Incluye 5 nuevas rutas de autobús y 20 km de carriles bici en zonas centrales.', '2025-01-15 10:00:00'),
(1, 2, 'Segunda versión con ajustes según feedback ciudadano. Se amplía la cobertura a 8 rutas de autobús y 30 km de carriles bici, incluyendo conexiones con áreas periféricas.', '2025-02-20 14:30:00'),
(1, 3, 'Versión final aprobada. Incluye 10 rutas de autobús, 35 km de carriles bici y estaciones de intercambio modal. Presupuesto detallado y cronograma de 18 meses.', '2025-03-10 09:15:00');
INSERT INTO [dbo].[pv_versionPropuesta] 
([propuestaID], [numeroVersion], [descripcion], [fechaCreacion])
VALUES 
(2, 1, 'Propuesta inicial de programa de becas para 500 estudiantes en 20 comunidades rurales. Cobertura: matrícula y materiales.', '2024-01-10 11:20:00'),
(2, 2, 'Versión ampliada a 750 becas incluyendo transporte. Se añaden criterios de selección detallados y proceso de aplicación.', '2024-02-05 16:45:00');
INSERT INTO [dbo].[pv_versionPropuesta] 
([propuestaID], [numeroVersion], [descripcion], [fechaCreacion])
VALUES 
(3, 1, 'Plan inicial para 5 clínicas móviles con servicio semanal en 15 comunidades periurbanas. Servicios básicos y vacunación.', '2024-01-20 08:00:00'),
(3, 2, 'Versión revisada con 8 clínicas móviles y cobertura quincenal. Se añaden servicios de salud materna y pediátrica.', '2024-03-15 10:30:00'),
(3, 3, 'Versión final con 10 clínicas, cronograma detallado por zona y protocolos de atención estandarizados.', '2024-04-05 14:00:00');
INSERT INTO [dbo].[pv_versionPropuesta] 
([propuestaID], [numeroVersion], [descripcion], [fechaCreacion])
VALUES 
(4, 1, 'Propuesta inicial de reforestación en 5 áreas prioritarias con 10,000 árboles nativos anuales.', '2024-03-01 09:00:00'),
(4, 2, 'Versión ampliada a 8 áreas y 15,000 árboles. Incluye programa de capacitación para voluntarios y monitoreo a 3 años.', '2024-05-20 11:45:00');
INSERT INTO [dbo].[pv_versionPropuesta] 
([propuestaID], [numeroVersion], [descripcion], [fechaCreacion])
VALUES 
(5, 1, 'Plan piloto para 3 centros de innovación provinciales con programas básicos de formación tecnológica.', '2024-02-15 13:00:00'),
(5, 2, 'Versión extendida a 5 centros con programas avanzados y fondos semilla para startups. Incluye alianzas con universidades.', '2024-04-01 15:30:00'),
(5, 3, 'Versión final con 8 centros, cronograma de implementación escalonada y métricas de evaluación de impacto.', '2024-04-25 10:15:00');
INSERT INTO [dbo].[pv_versionPropuesta] 
([propuestaID], [numeroVersion], [descripcion], [fechaCreacion])
VALUES 
(6, 1, 'Programa inicial de apoyo a 50 artistas emergentes con fondos para producción y 5 exposiciones anuales.', '2024-01-05 16:00:00'),
(6, 2, 'Versión ampliada a 80 artistas y 10 exposiciones. Se añaden talleres de formación y mentorías con artistas consagrados.', '2024-02-10 14:20:00'),
(6, 3, 'Versión final con 100 artistas, fondos incrementados y circuito nacional de exposiciones en espacios culturales.', '2024-02-20 11:10:00'),
(6, 4, 'Ajustes finales según presupuesto aprobado. Redistribución de fondos y calendario de actividades detallado.', '2024-02-25 09:45:00');