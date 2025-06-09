
SET IDENTITY_INSERT pv_metodoTrabajo ON;
-- Inserción de datos
INSERT INTO pv_metodoTrabajo (metodoTrabajoID, nombre, descripcion)
VALUES
(1, 'Democracia Participativa', 'Método para propuestas ciudadanas con votación directa. Incluye validación por IA, segmentación por perfil y resultados públicos. Requiere MFA para votar.'),
(2, 'Crowdfunding Colaborativo', 'Proceso para emprendimientos: validación por incubadoras, inversión colectiva y desembolsos por hitos. Fiscalización comunitaria con votación correctiva.'),
(3, 'Proyecto Comunitario', 'Enfoque para iniciativas locales (ej: parques, infraestructura básica). Votación segmentada geográficamente y revisión de impacto social.'),
(4, 'Iniciativa Provincial', 'Para proyectos de alcance regional (ej: transporte, educación pública). Requiere aval gubernamental y votación ponderada por cantones.'),
(5, 'Reforma Legal', 'Proceso para cambios normativos: revisión por expertos, consulta pública escalonada y quórums específicos. Documentación cifrada.'),
(6, 'Innovación Pública', 'Proyectos tecnológicos/sociales. Combina crowdfunding con validación por sectores profesionales y votación por competencia.'),
(7, 'Fiscalización Ciudadana', 'Método de auditoría continua. Ciudadanos reportan evidencias y votan para continuar/detener proyectos en ejecución.'),
(8, 'Presupuesto Participativo', 'Asignación de fondos públicos mediante votación. Segmentación por distritos con reglas de equidad territorial.'),
(9, 'Emergencia Local', 'Proceso ágil para crisis comunitarias (ej: desastres naturales). Votación rápida con umbral mínimo de participación.'),
(10, 'Consulta Técnica', 'Para propuestas especializadas (ej: ingeniería, salud). Votación restringida a profesionales certificados en el área.'),
-- Inserción de ejemplos específicos para crowdfunding (caso #3)
(11, 'Emprendimiento Verde', 'Proyectos ambientales. Requiere aval del MINAE y votación con peso extra para comunidades afectadas.'),
(12, 'Tech Comunitario', 'Soluciones tecnológicas locales. Validación por colegios profesionales y votación abierta con pruebas de concepto.');
    SET IDENTITY_INSERT pv_metodoTrabajo OFF;
GO