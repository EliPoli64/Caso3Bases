-- Módulos de extensión para funcionalidades específicas
INSERT INTO pv_moduloExtension (
    nombre, 
    descripcion, 
    version, 
    fechaInstalacion, 
    activo, 
    configuracion
) VALUES
-- Módulo de verificación biométrica avanzada
(
    'Biometría Multifactor', 
    'Integración con sistemas biométricos para autenticación con huella, rostro y voz', 
    '2.1.3', 
    '2025-03-15 14:30:00', 
    1, 
    '{"proveedores": ["BioAuth", "SecureFace"], "intentos_fallidos": 3, "nivel_confianza": 0.92}'
),

-- Módulo de geofencing para votaciones regionales
(
    'Geolocalización Segura', 
    'Restricción de votación por ubicación geográfica con validación de coordenadas', 
    '1.5.7', 
    '2025-04-22 10:15:00', 
    1, 
    '{"radio_maximo_km": 50, "nivel_precision": "alto", "provincias_habilitadas": [1,2,3]}'
),

-- Módulo de firma digital para propuestas
(
    'Firma Electrónica Avanzada', 
    'Sistema de firmas digitales con validez legal para propuestas ciudadanas', 
    '3.0.2', 
    '2025-01-30 08:45:00', 
    1, 
    '{"formato": "XAdES", "algoritmo": "RSA-2048", "entidades_certificadoras": ["FNMT", "AUTENTIA"]}'
),

-- Módulo de notificaciones push personalizadas
(
    'Alertas Ciudadanas', 
    'Sistema de notificaciones en tiempo real para eventos de votación', 
    '1.2.9', 
    '2025-05-18 16:20:00', 
    1, 
    '{"canales": ["SMS", "email", "push"], "plantillas": 12, "horario_notificaciones": "8:00-20:00"}'
),

-- Módulo de analítica de participación
(
    'Dashboard de Participación', 
    'Herramientas avanzadas para análisis de patrones de votación', 
    '2.3.0', 
    '2025-02-14 11:10:00', 
    1, 
    '{"intervalo_actualizacion": "15m", "metricas": ["participacion_historica", "comparativa_regional"]}'
),

-- Módulo de accesibilidad universal
(
    'Acceso Universal', 
    'Adaptaciones para usuarios con discapacidad visual, auditiva y motriz', 
    '1.8.4', 
    '2025-06-05 09:30:00', 
    1, 
    '{"lector_pantalla": true, "tamanio_fuente": [100,150,200], "navegacion_teclado": true}'
),

-- Módulo de auditoría forense
(
    'Auditoría Criptográfica', 
    'Registro inmutable de eventos con blockchain para trazabilidad forense', 
    '1.0.0', 
    '2025-03-01 13:00:00', 
    1, 
    '{"blockchain": "Hyperledger", "frecuencia_hasheo": "5m", "nodos_validacion": 7}'
),

-- Módulo de votación presencial asistida
(
    'Puntos de Votación', 
    'Integración con terminales físicas para votación asistida en centros autorizados', 
    '1.4.6', 
    '2025-04-10 15:45:00', 
    1, 
    '{"dispositivos_compatibles": ["VP-3000", "T1000"], "autenticacion_local": true}'
),

-- Módulo de educación cívica
(
    'Aula Democrática', 
    'Contenidos interactivos para formación ciudadana sobre procesos democráticos', 
    '0.9.8', 
    '2025-05-29 10:00:00', 
    1, 
    '{"modulos_educativos": 15, "idiomas": ["es", "en", "bribri"], "certificacion": true}'
),

-- Módulo de integración con redes sociales
(
    'Compartir Participación', 
    'Herramientas para difusión controlada en redes sociales (sin revelar voto)', 
    '1.1.2', 
    '2025-06-08 12:30:00', 
    1, 
    '{"redes_soportadas": ["FB", "TW", "IG"], "plantillas_compartir": 5, "modo_privacidad": true}'
);

-- Conexiones entre módulos y hooks para funcionalidades extendidas
INSERT INTO pv_moduloHook (
    moduloID, 
    hookID, 
    metodo, 
    activo
) VALUES
-- Para el módulo de Biometría Multifactor (ID:1)
(1, 3, 'validarIdentidadBiometrica', 1),       -- Antes del registro
(1, 5, 'verificarVotantePresencial', 1),       -- Antes de emitir voto

-- Para el módulo de Geolocalización (ID:2)
(2, 1, 'validarUbicacionPropuesta', 1),        -- Validación geográfica de propuestas
(2, 5, 'verificarZonaVotacion', 1),            -- Restricción por ubicación

-- Para el módulo de Firma Digital (ID:3)
(3, 1, 'firmarPropuestaDigitalmente', 1),      -- Firma de propuestas
(3, 7, 'validarFirmaAvaladores', 1),           -- Para crowdfunding

-- Para el módulo de Alertas (ID:4)
(4, 16, 'notificarInicioPersonalizado', 1),    -- Notificación de votación
(4, 18, 'enviarResultadosSegmentados', 1),     -- Resultados por perfil

-- Para el módulo de Analítica (ID:5)
(5, 2, 'registrarMetricasValidacion', 1),      -- Post-validación
(5, 6, 'analizarPatronVoto', 1),               -- Post-voto

-- Para el módulo de Accesibilidad (ID:6)
(6, 3, 'adaptarInterfazRegistro', 1),          -- Registro accesible
(6, 5, 'activarAyudasVotacion', 1),            -- Durante voto

-- Para el módulo de Auditoría (ID:7)
(7, 5, 'registrarHashVoto', 1),                -- Blockchain pre-voto
(7, 6, 'certificarTransaccion', 1),            -- Post-voto

-- Para el módulo de Votación Presencial (ID:8)
(8, 3, 'generarQRTerminal', 1),                -- Registro en terminal
(8, 5, 'validarDispositivoFisico', 1),         -- Autenticación física

-- Para el módulo de Educación Cívica (ID:9)
(9, 1, 'sugerirContenidoPropuesta', 1),        -- Educación contextual
(9, 16, 'notificarMaterialEducativo', 1),      -- Con notificaciones

-- Para el módulo de Redes Sociales (ID:10)
(10, 2, 'compartirPropuestaValidada', 1),      -- Post-validación
(10, 6, 'generarBadgeParticipacion', 1);       -- Post-voto