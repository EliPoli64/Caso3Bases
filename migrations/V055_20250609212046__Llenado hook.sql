-- Hooks para el módulo principal de votación
INSERT INTO pv_hook (nombre, descripcion, evento, prioridad) VALUES
( 'pre_validacion_propuesta', 'Hook ejecutado antes de validar una propuesta', 'propuesta.pre_validacion', 10),
('post_validacion_propuesta', 'Hook ejecutado después de validar una propuesta', 'propuesta.post_validacion', 20),
( 'pre_registro_usuario', 'Hook antes del registro de usuario', 'usuario.pre_registro', 5),
( 'post_registro_usuario', 'Hook después del registro exitoso', 'usuario.post_registro', 15),
( 'pre_emision_voto', 'Hook antes de registrar un voto', 'voto.pre_emision', 100),
( 'post_emision_voto', 'Hook después de registrar un voto', 'voto.post_emision', 200),
-- Hooks específicos para el módulo de crowdfunding
('pre_aprobacion_proyecto', 'Hook antes de aprobar un proyecto crowdfunding', 'crowdfunding.pre_aprobacion', 10),
('post_aprobacion_proyecto', 'Hook después de aprobar un proyecto', 'crowdfunding.post_aprobacion', 20),
( 'pre_inversion', 'Hook antes de procesar una inversión', 'crowdfunding.pre_inversion', 50),
( 'post_inversion', 'Hook después de registrar inversión', 'crowdfunding.post_inversion', 60),
( 'pre_desembolso', 'Hook antes de desembolsar fondos', 'crowdfunding.pre_desembolso', 30),
( 'post_desembolso', 'Hook después de desembolsar fondos', 'crowdfunding.post_desembolso', 40),
-- Hooks para integración con IA/validación
( 'validacion_ia_documentos', 'Hook para validación de documentos por IA', 'validacion.ia.documentos', 5),
( 'validacion_ia_comentarios', 'Hook para análisis de comentarios por IA', 'validacion.ia.comentarios', 5),
( 'deteccion_fraude', 'Hook para análisis de patrones de fraude', 'seguridad.deteccion_fraude', 1000),
-- Hooks para notificaciones
( 'notificacion_inicio_votacion', 'Hook para notificar inicio de votación', 'votacion.inicio', 10),
( 'notificacion_cierre_votacion', 'Hook para notificar cierre de votación', 'votacion.cierre', 10),
( 'notificacion_resultados', 'Hook para publicar resultados', 'votacion.resultados', 20);