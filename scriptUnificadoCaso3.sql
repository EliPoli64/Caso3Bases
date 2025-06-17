USE VotoPV01
GO

EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';

-- Borrar datos de todas las tablas y reiniciar identity
DELETE FROM pv_accionesIA; DBCC CHECKIDENT ('pv_accionesIA', RESEED, 0);
DELETE FROM pv_afiliaciones; DBCC CHECKIDENT ('pv_afiliaciones', RESEED, 0);
DELETE FROM pv_afiliacionesUsuario; DBCC CHECKIDENT ('pv_afiliacionesUsuario', RESEED, 0);
DELETE FROM pv_archivosDocumentos; DBCC CHECKIDENT ('pv_archivosDocumentos', RESEED, 0);
DELETE FROM pv_archivosUsuarios; DBCC CHECKIDENT ('pv_archivosUsuarios', RESEED, 0);
DELETE FROM pv_avalGubernamental; DBCC CHECKIDENT ('pv_avalGubernamental', RESEED, 0);
DELETE FROM pv_boletaRequisitosPropuestas; DBCC CHECKIDENT ('pv_boletaRequisitosPropuestas', RESEED, 0);
DELETE FROM pv_cantones; DBCC CHECKIDENT ('pv_cantones', RESEED, 0);
DELETE FROM pv_comentariosPropuesta; DBCC CHECKIDENT ('pv_comentariosPropuesta', RESEED, 0);
DELETE FROM pv_comentariosProyecto; DBCC CHECKIDENT ('pv_comentariosProyecto', RESEED, 0);
DELETE FROM pv_condicionAval; DBCC CHECKIDENT ('pv_condicionAval', RESEED, 0);
DELETE FROM pv_configAPIs; DBCC CHECKIDENT ('pv_configAPIs', RESEED, 0);
DELETE FROM pv_contact; DBCC CHECKIDENT ('pv_contact', RESEED, 0);
DELETE FROM pv_contactType; DBCC CHECKIDENT ('pv_contactType', RESEED, 0);
DELETE FROM pv_contextoIA; DBCC CHECKIDENT ('pv_contextoIA', RESEED, 0);
DELETE FROM pv_criterio; DBCC CHECKIDENT ('pv_criterio', RESEED, 0);
DELETE FROM pv_criteriosExito; DBCC CHECKIDENT ('pv_criteriosExito', RESEED, 0);
DELETE FROM pv_detalleComentarios; DBCC CHECKIDENT ('pv_detalleComentarios', RESEED, 0);
DELETE FROM pv_detalleSegmento; DBCC CHECKIDENT ('pv_detalleSegmento', RESEED, 0);
DELETE FROM pv_detallesHorarios; DBCC CHECKIDENT ('pv_detallesHorarios', RESEED, 0);
DELETE FROM pv_direcciones; DBCC CHECKIDENT ('pv_direcciones', RESEED, 0);
DELETE FROM pv_direccionesUsuarios; DBCC CHECKIDENT ('pv_direccionesUsuarios', RESEED, 0);
DELETE FROM pv_distrito; DBCC CHECKIDENT ('pv_distrito', RESEED, 0);
DELETE FROM pv_documento; DBCC CHECKIDENT ('pv_documento', RESEED, 0);
DELETE FROM pv_documentoProyecto; DBCC CHECKIDENT ('pv_documentoProyecto', RESEED, 0);
DELETE FROM pv_documentosOrgs; DBCC CHECKIDENT ('pv_documentosOrgs', RESEED, 0);
DELETE FROM pv_documentosPropuestas; DBCC CHECKIDENT ('pv_documentosPropuestas', RESEED, 0);
DELETE FROM pv_documentosUsuario; DBCC CHECKIDENT ('pv_documentosUsuario', RESEED, 0);
DELETE FROM pv_educacionUsuario; DBCC CHECKIDENT ('pv_educacionUsuario', RESEED, 0);
DELETE FROM pv_embeddingsIA; DBCC CHECKIDENT ('pv_embeddingsIA', RESEED, 0);
DELETE FROM pv_entidadesIA; DBCC CHECKIDENT ('pv_entidadesIA', RESEED, 0);
DELETE FROM pv_estadoComentarios; DBCC CHECKIDENT ('pv_estadoComentarios', RESEED, 0);
DELETE FROM pv_estadoDocumento; DBCC CHECKIDENT ('pv_estadoDocumento', RESEED, 0);
DELETE FROM pv_estadoIncumplimiento; DBCC CHECKIDENT ('pv_estadoIncumplimiento', RESEED, 0);
DELETE FROM pv_estadoPropuesta; DBCC CHECKIDENT ('pv_estadoPropuesta', RESEED, 0);
DELETE FROM pv_estadoProyecto; DBCC CHECKIDENT ('pv_estadoProyecto', RESEED, 0);
DELETE FROM pv_estadoVotacion; DBCC CHECKIDENT ('pv_estadoVotacion', RESEED, 0);
DELETE FROM pv_etapasProyecto; DBCC CHECKIDENT ('pv_etapasProyecto', RESEED, 0);
DELETE FROM pv_grupoValidador; DBCC CHECKIDENT ('pv_grupoValidador', RESEED, 0);
DELETE FROM pv_grupoVotacion; DBCC CHECKIDENT ('pv_grupoVotacion', RESEED, 0);
DELETE FROM pv_hook; DBCC CHECKIDENT ('pv_hook', RESEED, 0);
DELETE FROM pv_horarios; DBCC CHECKIDENT ('pv_horarios', RESEED, 0);
DELETE FROM pv_iaAnalisis; DBCC CHECKIDENT ('pv_iaAnalisis', RESEED, 0);
DELETE FROM pv_iaEstado; DBCC CHECKIDENT ('pv_iaEstado', RESEED, 0);
DELETE FROM pv_iaModelo; DBCC CHECKIDENT ('pv_iaModelo', RESEED, 0);
DELETE FROM pv_iaPrompts; DBCC CHECKIDENT ('pv_iaPrompts', RESEED, 0);
DELETE FROM pv_identidadDigital; DBCC CHECKIDENT ('pv_identidadDigital', RESEED, 0);
DELETE FROM pv_incumplimiento; DBCC CHECKIDENT ('pv_incumplimiento', RESEED, 0);
DELETE FROM pv_infoIA; DBCC CHECKIDENT ('pv_infoIA', RESEED, 0);
DELETE FROM pv_intentoPago; DBCC CHECKIDENT ('pv_intentoPago', RESEED, 0);
DELETE FROM pv_inversion; DBCC CHECKIDENT ('pv_inversion', RESEED, 0);
DELETE FROM pv_listaBlancaIPs; DBCC CHECKIDENT ('pv_listaBlancaIPs', RESEED, 0);
DELETE FROM pv_llaveOrganizaciones; DBCC CHECKIDENT ('pv_llaveOrganizaciones', RESEED, 0);
DELETE FROM pv_llavesUsuarios; DBCC CHECKIDENT ('pv_llavesUsuarios', RESEED, 0);
DELETE FROM pv_logOrigen; DBCC CHECKIDENT ('pv_logOrigen', RESEED, 0);
DELETE FROM pv_logs; DBCC CHECKIDENT ('pv_logs', RESEED, 0);
DELETE FROM pv_logTipos; DBCC CHECKIDENT ('pv_logTipos', RESEED, 0);
DELETE FROM pv_mediaFiles; DBCC CHECKIDENT ('pv_mediaFiles', RESEED, 0);
DELETE FROM pv_mediaTypes; DBCC CHECKIDENT ('pv_mediaTypes', RESEED, 0);
DELETE FROM pv_metodoLlamadaAPI; DBCC CHECKIDENT ('pv_metodoLlamadaAPI', RESEED, 0);
DELETE FROM pv_metodoPruebas; DBCC CHECKIDENT ('pv_metodoPruebas', RESEED, 0);
DELETE FROM pv_metodosDisponibles; DBCC CHECKIDENT ('pv_metodosDisponibles', RESEED, 0);
DELETE FROM pv_metodosPago; DBCC CHECKIDENT ('pv_metodosPago', RESEED, 0);
DELETE FROM pv_metodosPagoOrgs; DBCC CHECKIDENT ('pv_metodosPagoOrgs', RESEED, 0);
DELETE FROM pv_metodosPagoUsuarios; DBCC CHECKIDENT ('pv_metodosPagoUsuarios', RESEED, 0);
DELETE FROM pv_metodoTrabajo; DBCC CHECKIDENT ('pv_metodoTrabajo', RESEED, 0);
DELETE FROM pv_moduloExtension; DBCC CHECKIDENT ('pv_moduloExtension', RESEED, 0);
DELETE FROM pv_moduloHook; DBCC CHECKIDENT ('pv_moduloHook', RESEED, 0);
DELETE FROM pv_moneda; DBCC CHECKIDENT ('pv_moneda', RESEED, 0);
DELETE FROM pv_nivelEducacion; DBCC CHECKIDENT ('pv_nivelEducacion', RESEED, 0);
DELETE FROM pv_objetivosEtapa; DBCC CHECKIDENT ('pv_objetivosEtapa', RESEED, 0);
DELETE FROM pv_organizaciones; DBCC CHECKIDENT ('pv_organizaciones', RESEED, 0);
DELETE FROM pv_orgUsuariosRegulares; DBCC CHECKIDENT ('pv_orgUsuariosRegulares', RESEED, 0);
DELETE FROM pv_orgUsuariosRepresentantes; DBCC CHECKIDENT ('pv_orgUsuariosRepresentantes', RESEED, 0);
DELETE FROM pv_paises; DBCC CHECKIDENT ('pv_paises', RESEED, 0);
DELETE FROM pv_permissions; DBCC CHECKIDENT ('pv_permissions', RESEED, 0);
DELETE FROM pv_pesoRespuesta; DBCC CHECKIDENT ('pv_pesoRespuesta', RESEED, 0);
DELETE FROM pv_planPagos; DBCC CHECKIDENT ('pv_planPagos', RESEED, 0);
DELETE FROM pv_plataformaAutenticacion; DBCC CHECKIDENT ('pv_plataformaAutenticacion', RESEED, 0);
DELETE FROM pv_preguntas; DBCC CHECKIDENT ('pv_preguntas', RESEED, 0);
DELETE FROM pv_profesiones; DBCC CHECKIDENT ('pv_profesiones', RESEED, 0);
DELETE FROM pv_profesionesUsuarios; DBCC CHECKIDENT ('pv_profesionesUsuarios', RESEED, 0);
DELETE FROM pv_proponente; DBCC CHECKIDENT ('pv_proponente', RESEED, 0);
DELETE FROM pv_propuestaCategoria; DBCC CHECKIDENT ('pv_propuestaCategoria', RESEED, 0);
DELETE FROM pv_propuestas; DBCC CHECKIDENT ('pv_propuestas', RESEED, 0);
DELETE FROM pv_propuestaSegmentosDirigidos; DBCC CHECKIDENT ('pv_propuestaSegmentosDirigidos', RESEED, 0);
DELETE FROM pv_propuestaSegmentosImpacto; DBCC CHECKIDENT ('pv_propuestaSegmentosImpacto', RESEED, 0);
DELETE FROM pv_propuestaVotacion; DBCC CHECKIDENT ('pv_propuestaVotacion', RESEED, 0);
DELETE FROM pv_provincias; DBCC CHECKIDENT ('pv_provincias', RESEED, 0);
DELETE FROM pv_proyecto; DBCC CHECKIDENT ('pv_proyecto', RESEED, 0);
DELETE FROM pv_pruebasVida; DBCC CHECKIDENT ('pv_pruebasVida', RESEED, 0);
DELETE FROM pv_relacionesIA; DBCC CHECKIDENT ('pv_relacionesIA', RESEED, 0);
DELETE FROM pv_requisitosPropuesta; DBCC CHECKIDENT ('pv_requisitosPropuesta', RESEED, 0);
DELETE FROM pv_respuestaParticipante; DBCC CHECKIDENT ('pv_respuestaParticipante', RESEED, 0);
DELETE FROM pv_respuestas; DBCC CHECKIDENT ('pv_respuestas', RESEED, 0);
DELETE FROM pv_resultadosAnalisis; DBCC CHECKIDENT ('pv_resultadosAnalisis', RESEED, 0);
DELETE FROM pv_resultadoVotacion; DBCC CHECKIDENT ('pv_resultadoVotacion', RESEED, 0);
DELETE FROM pv_revisionHumana; DBCC CHECKIDENT ('pv_revisionHumana', RESEED, 0);
DELETE FROM pv_roles; DBCC CHECKIDENT ('pv_roles', RESEED, 0);
DELETE FROM pv_rolesUsuarios; DBCC CHECKIDENT ('pv_rolesUsuarios', RESEED, 0);
DELETE FROM pv_sectorProfesion; DBCC CHECKIDENT ('pv_sectorProfesion', RESEED, 0);
DELETE FROM pv_segmento; DBCC CHECKIDENT ('pv_segmento', RESEED, 0);
DELETE FROM pv_sesiones; DBCC CHECKIDENT ('pv_sesiones', RESEED, 0);
DELETE FROM pv_severidadIncumplimiento; DBCC CHECKIDENT ('pv_severidadIncumplimiento', RESEED, 0);
DELETE FROM pv_severidadLogs; DBCC CHECKIDENT ('pv_severidadLogs', RESEED, 0);
DELETE FROM pv_solicitudCambio; DBCC CHECKIDENT ('pv_solicitudCambio', RESEED, 0);
DELETE FROM pv_statusEtapaProyecto; DBCC CHECKIDENT ('pv_statusEtapaProyecto', RESEED, 0);
DELETE FROM pv_statusRegistro; DBCC CHECKIDENT ('pv_statusRegistro', RESEED, 0);
DELETE FROM pv_statusRegistroOrgs; DBCC CHECKIDENT ('pv_statusRegistroOrgs', RESEED, 0);
DELETE FROM pv_statusRegistroUsuarios; DBCC CHECKIDENT ('pv_statusRegistroUsuarios', RESEED, 0);
DELETE FROM pv_subTipoTransaccion; DBCC CHECKIDENT ('pv_subTipoTransaccion', RESEED, 0);
DELETE FROM pv_tareasEtapa; DBCC CHECKIDENT ('pv_tareasEtapa', RESEED, 0);
DELETE FROM pv_tarifaGrupo; DBCC CHECKIDENT ('pv_tarifaGrupo', RESEED, 0);
DELETE FROM pv_tasaCambio; DBCC CHECKIDENT ('pv_tasaCambio', RESEED, 0);
DELETE FROM pv_tipoAval; DBCC CHECKIDENT ('pv_tipoAval', RESEED, 0);
DELETE FROM pv_tipoDetalle; DBCC CHECKIDENT ('pv_tipoDetalle', RESEED, 0);
DELETE FROM pv_tipoDocumento; DBCC CHECKIDENT ('pv_tipoDocumento', RESEED, 0);
DELETE FROM pv_tipoGrupoValidador; DBCC CHECKIDENT ('pv_tipoGrupoValidador', RESEED, 0);
DELETE FROM pv_tipoIncumplimiento; DBCC CHECKIDENT ('pv_tipoIncumplimiento', RESEED, 0);
DELETE FROM pv_tipoOrganizacion; DBCC CHECKIDENT ('pv_tipoOrganizacion', RESEED, 0);
DELETE FROM pv_tipoPregunta; DBCC CHECKIDENT ('pv_tipoPregunta', RESEED, 0);
DELETE FROM pv_tiposPropuesta; DBCC CHECKIDENT ('pv_tiposPropuesta', RESEED, 0);
DELETE FROM pv_tipoTransaccion; DBCC CHECKIDENT ('pv_tipoTransaccion', RESEED, 0);
DELETE FROM pv_tipoVotacion; DBCC CHECKIDENT ('pv_tipoVotacion', RESEED, 0);
DELETE FROM pv_transaccion; DBCC CHECKIDENT ('pv_transaccion', RESEED, 0);
DELETE FROM pv_ubicaciones; DBCC CHECKIDENT ('pv_ubicaciones', RESEED, 0);
DELETE FROM pv_usuarios; DBCC CHECKIDENT ('pv_usuarios', RESEED, 0);
DELETE FROM pv_usuariosPermisos; DBCC CHECKIDENT ('pv_usuariosPermisos', RESEED, 0);
DELETE FROM pv_usuarioVotacionPublica; DBCC CHECKIDENT ('pv_usuarioVotacionPublica', RESEED, 0);
DELETE FROM pv_validacionIA; DBCC CHECKIDENT ('pv_validacionIA', RESEED, 0);
DELETE FROM pv_validacionPropuesta; DBCC CHECKIDENT ('pv_validacionPropuesta', RESEED, 0);
DELETE FROM pv_versionPropuesta; DBCC CHECKIDENT ('pv_versionPropuesta', RESEED, 0);
DELETE FROM pv_votacion; DBCC CHECKIDENT ('pv_votacion', RESEED, 0);
DELETE FROM pv_votacionesObjetivos; DBCC CHECKIDENT ('pv_votacionesObjetivos', RESEED, 0);
DELETE FROM pv_votacionPregunta; DBCC CHECKIDENT ('pv_votacionPregunta', RESEED, 0);
DELETE FROM pv_votacionSegmento; DBCC CHECKIDENT ('pv_votacionSegmento', RESEED, 0);
DELETE FROM pv_votanteGrupo; DBCC CHECKIDENT ('pv_votanteGrupo', RESEED, 0);
DELETE FROM pv_wfDocumentos; DBCC CHECKIDENT ('pv_wfDocumentos', RESEED, 0);
DELETE FROM pv_wfProceso; DBCC CHECKIDENT ('pv_wfProceso', RESEED, 0);
GO

-- Volver a habilitar restricciones de clave foránea
EXEC sp_MSforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL';


/*---------------------------------------------------------------------------------------------
LLENADO DE DATOS
----------------------------------------------------------------------------------------------*/
INSERT INTO pv_paises(nombre, esPermitido)
VALUES ('Costa Rica', 1),('España', 1),
('México', 1),('Colombia', 1);

INSERT INTO pv_provincias(nombre, paisid)
VALUES ('San José', 1),('Alajuela', 1),('Cartago', 1),('Heredia', 1),('Guanacaste', 1),
('Puntarenas', 1),('Limón', 1),('Madrid', 2),('Barcelona', 2),('Valencia', 2),('Ciudad de México', 3),
('Jalisco', 3),('Nuevo León', 3),('Bogotá D.C.', 4),('Antioquia', 4);

INSERT INTO pv_cantones(nombre, provinciaID)
VALUES ('Central', 1),('Desamparados', 1),('Central', 2),('Liberia', 5),
('Central', 3),('Central', 4),('Central', 6),('Central', 7),('Madrid', 8),
('Barcelona', 9),('Valencia', 10),('Cuauhtémoc', 11),('Guadalajara', 12),
('Monterrey', 13),('Medellín', 15);

INSERT INTO pv_distrito(nombre, cantonID)
VALUES ('Carmen', 1),('Merced', 1),('Desamparados', 2),('Alajuela', 3),
('Liberia', 4),('Oriental', 5),('Heredia', 6),('Puntarenas', 7),
('Centro', 9),('Gótico', 10),('Ciudad Vieja', 11),('Roma', 12),
('Centro', 13),('Centro', 14),('El Poblado', 15);

INSERT INTO pv_ubicaciones(paisID, proviniciaID, cantonID, distritoID)
VALUES (1, 1, 1, 1),(1, 1, 1, 2),(1, 1, 2, 3),(1, 2, 3, 4),
(1, 5, 4, 5),(1, 3, 5, 6),(1, 4, 6, 7),(1, 6, 7, 8),
(2, 8, 9, 9),(2, 9, 10, 10),(2, 10, 11, 11),(3, 11, 12, 12),
(3, 12, 13, 13),(3, 13, 14, 14),(4, 15, 15, 15);

INSERT INTO pv_direcciones (linea1, linea2, distritoid, codigoPostal)
VALUES ('Avenida Central 123', 'Calle 5', 1, '10101'),
('Calle 20, #45-67', 'Frente al parque', 2, '10102'),
('Barrio Escalante 300', 'Casa verde', 3, '10103'),
('Alajuela Centro', 'Costado oeste de la catedral', 4, '20101'),
('Guanacaste, Liberia', 'De la iglesia 200m oeste', 5, '50101'),
('Cartago Centro', 'Diagonal al Banco Nacional', 6, '30101'),
('Heredia Centro', 'Frente al kiosko del parque', 7, '40101'),
('Puntarenas Centro', 'Costado del muelle', 8, '60101'),
('Calle Gran Vía 80', 'Piso 3, Puerta B', 9, '28013'),
('Las Ramblas 99', 'Planta baja', 10, '08002'),
('Calle Colón 27', NULL, 11, '46004'),
('Paseo de la Reforma 505', 'Departamento 1202', 12, '06500'),
('Avenida Vallarta 1250', 'Local 5', 13, '44100'),
('Morelos 500 Ote', NULL, 14, '64000'),
('Carrera 43A #7-50', 'Edificio inteligente', 15, '050022');
GO

INSERT INTO pv_permissions(descripcion, code)
VALUES ('Administrar sistema completo', 'ADMIN_ALL'),
('Gestionar usuarios', 'USR_MNG'), ('Gestionar roles', 'ROLES_MNG'),
('Gestionar permisos', 'PERMS_MNG'), ('Ver reportes', 'VIEW_RPTS'),
('Generar reportes', 'GEN_RPTS'), ('Gestionar elecciones', 'ELECT_MNG'),
('Registrar votantes', 'REG_VOTER'), ('Ver listado votantes', 'VIEW_VOTER'),
('Validar votantes', 'VAL_VOTER'), ('Emitir votos', 'CAST_VOTE'),
('Conteo de votos', 'COUNT_VOTE'), ('Gestionar ubicaciones', 'LOC_MNG'),
('Gestionar candidatos', 'CAND_MNG'), ('Gestionar partidos', 'PARTY_MNG'),
('Acceso API', 'API_ACC'), ('Acceso móvil', 'MOB_ACC'),
('Gestionar configuración', 'CFG_MNG'), ('Ver dashboard', 'VIEW_DASH'),
('Gestionar auditoría', 'AUDIT_MNG');
GO

INSERT INTO pv_nivelEducacion(name)
VALUES ('Secundaria'),('Bachillerato Universitario'), 
('Licenciatura'), ('Maestria'), ('Doctorado'), ('Otros');
GO

INSERT INTO pv_mediaTypes(name, playerType)
VALUES ('PDF', 'Acrobat Reader'), ('Audio', 'Audio Player'), 
('Video', 'Video Player'),('EPUB', 'Calibre');
GO

-- Llenado de Usuarios
-- BORRAR ESTA PARTE CUANDO ESTE LLENOS PROFESIONES Y LLAVES -----------------------------
ALTER TABLE [dbo].[pv_usuarios] NOCHECK CONSTRAINT [FK_pv_usuarios_pv_llavesUsuarios];
------------------------------------------------------------------------------------------
-- Nombres:
DECLARE @Nombres TABLE (nombre varchar(50));
INSERT INTO @Nombres VALUES
('Juan'), ('Maria'), ('Carlos'), ('Ana'), ('Luis'),
('Sofia'), ('Pedro'), ('Laura'), ('Jorge'), ('Yelena');
-- Apellidos:
DECLARE @PrimerApellido TABLE (apellido varchar(50));
INSERT INTO @PrimerApellido VALUES
('Garcia'), ('Rodriguez'), ('Gonzalez'), ('Fernandez'), ('Lopez'),
('Martinez'), ('Sanchez'), ('Perez'), ('Gomez'), ('Martin');
DECLARE @SegundoApellido TABLE (apellido2 VARCHAR(50));
INSERT INTO @SegundoApellido VALUES 
('Hernandez'), ('Diaz'), ('Moreno'), ('Alvarez'), ('Jimenez'),
('Ruiz'), ('Romero'), ('Sanz'), ('Torres'), ('Vazquez');
DECLARE @NombresCompletos TABLE(id INT IDENTITY(1,1), nom varchar(50), ap1 varchar(50), ap2 varchar(50));
INSERT INTO @NombresCompletos (nom, ap1, ap2)
SELECT 
    n.Nombre,
    a1.apellido,
    a2.apellido2
FROM @Nombres n -- la idea es hacer un todos con todos para generar todas las combinaciones de nombres y apellidos
CROSS JOIN @PrimerApellido a1
CROSS JOIN @SegundoApellido a2
-- Fechas de Nacimiento:
DECLARE @FechaInicio DATE = DATEADD(YEAR, -50, GETDATE()); -- Fecha inicio, hace 50 años
DECLARE @FechaFin DATE = DATEADD(YEAR, -20, GETDATE()); -- Fecha fin, hace 20 años
-- Bucle de llenado:
DECLARE @cont INT = 1;
DECLARE @cantUsuarios INT;
SELECT @cantUsuarios = COUNT(1) FROM @NombresCompletos;
WHILE @cont <= @cantUsuarios
BEGIN
    DECLARE @nom VARCHAR(50), @ap1 VARCHAR(50), @ap2 VARCHAR(50);
    SELECT 
        @nom = nom,
        @ap1 = ap1,
        @ap2 = ap2
    FROM @NombresCompletos
    WHERE id = @cont;
    DECLARE @FechaNacimiento DATE = DATEADD(DAY, RAND() * DATEDIFF(DAY, @FechaInicio, @FechaFin), @FechaInicio);
    -- Cédulas:
    DECLARE @Cedula VARCHAR(9) = RIGHT('000000000' + CAST(100000000 + ((@cont-1)*100) AS VARCHAR(10)), 9); -- El right es para asegurar los 9 digitos, son
                                                                                                           -- cedulas secuenciales para evitar repetidas
    DECLARE @Checksum VARBINARY(256);
    SET @Checksum = HASHBYTES('SHA2_256', CONCAT(@nom, @ap1, @ap2, @Cedula));
    INSERT INTO [dbo].[pv_usuarios] (nombre, primerApellido, segundoApellido, fechaNacimiento, identificacion, nacional, checksum) VALUES (
        @nom,@ap1,@ap2,
        @FechaNacimiento,
        @Cedula,1,
        @Checksum
    );
    SET @cont= @cont+ 1;
END


-- BORRAR ESTA PARTE CUANDO ESTE LLENOS PROFESIONES Y LLAVES -----------------------------
ALTER TABLE [dbo].[pv_usuarios] CHECK CONSTRAINT [FK_pv_usuarios_pv_llavesUsuarios];
------------------------------------------------------------------------------------------
GO
INSERT INTO dbo.pv_segmento (nombre, descripcion, enabled, deleted, fechaCreacion, usuarioID) VALUES
('General', 'Segmento general', 1, 0, GETDATE(), 456), 
('Jóvenes (18-30)', 'Segmento para las personas entre 18 y 30 años', 1, 0, GETDATE(), 789),
('Adultos (31-60)', 'Segmento para las personas entre 30 y 60 años', 1, 0, GETDATE(), 32),
('Adultos Mayores (61+)' , 'Segmento para las personas mayores a 61 años', 1, 0, GETDATE(), 156),
('Heredianas', 'Segmento para las personas nacidas en Heredia', 1, 0, GETDATE(), 950),
('Josefinas', 'Segmento para las personas nacidas en San José', 1, 0, GETDATE(), 950),
('Educación universitaria', 'Segmento para las personas nacidas con educación universitaria completa', 1, 0, GETDATE(), 14),
('Estudiantes Tec', 'Segmento para los estudiantes del tecnológico de Costa Rica', 1, 0, GETDATE(), 789);
INSERT INTO dbo.pv_tipoPregunta (tipo) VALUES
('Opción Múltiple'),
('Respuesta Abierta'),
('Escala Likert'),
('Sí/No'),
('Numérica');
INSERT INTO dbo.pv_severidadLogs (nombre) VALUES
('Debug'),
('Info'),
('Advertencia'),
('Error'),
('Critico'),
('Grave');
INSERT INTO dbo.pv_tipoDetalle (Nombre) VALUES
('Profesión'),
('Edad'),
('Provincia'),
('Ubicación'),
('Nivel de Educación'),
('Estado Civil'),
('Ingresos Mensuales'),
('Nivel de Satisfacción'),
('Frecuencia de Uso'),
('Motivo de Contacto'),
('Tipo de Servicio'),
('Afiliación'),
('Género');
INSERT INTO dbo.pv_estadoComentarios ( nombre) VALUES
('Pendiente de Revisión'),
('Aprobado'),
('Rechazado'),
('Archivado'),
('Respondido');


INSERT INTO dbo.pv_profesiones (nombre) VALUES
('Ingeniero de Software'),
('Analista de Datos'),
('Diseñador Grafico'),
('Consultor Financiero'),
('Educador'),
('Medico'),
('Abogado'),
('Arquitecto'),
('Contador'),
('Periodista'),
('Investigador'),
('Chef'),
('Artista'),
('Gestor de Proyectos'),
('Enfermero'),
('Marketing Digital'),
('Recursos Humanos'),
('Cientifico'),
('Tecnico de Soporte'),
('Agronomo');
GO

INSERT INTO dbo.pv_contactType (name) VALUES
('Correo Electrónico'),
('Teléfono Fijo'),
('Teléfono Móvil'),
('Dirección de Residencia'),
('Red Social'),
('Fax');

INSERT INTO dbo.pv_segmento (nombre, descripcion, enabled, deleted, fechaCreacion, usuarioID) VALUES
('General', 'Segmento general', 1, 0, GETDATE(), 456), 
('Jóvenes (18-30)', 'Segmento para las personas entre 18 y 30 años', 1, 0, GETDATE(), 789),
('Adultos (31-60)', 'Segmento para las personas entre 30 y 60 años', 1, 0, GETDATE(), 32),
('Adultos Mayores (61+)' , 'Segmento para las personas mayores a 61 años', 1, 0, GETDATE(), 156),
('Heredianas', 'Segmento para las personas nacidas en Heredia', 1, 0, GETDATE(), 950),
('Josefinas', 'Segmento para las personas nacidas en San José', 1, 0, GETDATE(), 950),
('Educación universitaria', 'Segmento para las personas nacidas con educación universitaria completa', 1, 0, GETDATE(), 14),
('Estudiantes Tec', 'Segmento para los estudiantes del tecnológico de Costa Rica', 1, 0, GETDATE(), 789);

INSERT INTO pv_detalleSegmento(segmentoID, tipoDetalleID, tabla, campo)
VALUES
(2,2, 'pv_usuarios', 'fechaNacimiento - Realizar conversión'),
(3,2, 'pv_usuarios', 'fechaNacimiento - Realizar conversión'),
(4,2, 'pv_usuarios', 'fechaNacimiento - Realizar conversión'),
(5,3, 'pv_provincias', 'provinciaid'),
(6,3, 'pv_provincias', 'provinciaid'),
(7,5, 'pv_nivelEducacion', 'nivelID'),
(8,12, 'pv_afiliaciones', 'afiliacionID')
;

INSERT INTO dbo.pv_criterio (nombre, comparador, valor, detalleID) VALUES
('Mayor a 18', '>=', 18, 1),
('Menor a 30', '<=', 30, 1),
('Mayor a 30', '>', 30, 2),
('Menor a 60', '<=', 60, 2),
('Mayor a 60', '>', 60, 3),
('Heredianas', '=', 4, 4),
('Josefinas', '=', 1, 5),
('Universitarios', '>', 2, 6),
('Estudiantes TEC', '=', 2,7);
GO

INSERT INTO dbo.pv_horarios (name, recurrentType, repetition, endType, endDate) VALUES
('Diario', 'Diario', 1, 'Never', NULL),
('Semanal Martes', 'Semanal', 1, 'After', '2026-12-31 00:00:00'),
('Mensual Primer Lunes', 'Mensual', 1, 'Never', NULL),
('Anual Enero', 'Anual', 1, 'Never', NULL),
('Cada 3 Días', 'Diario', 3, 'After', '2025-12-31 00:00:00');
GO

INSERT INTO dbo.pv_logOrigen (nombre) VALUES
('Web UI'),
('API REST'),
('Batch Job'),
('Workflow'),
('PropuestaService'),
('AuthService'),
('PaymentGateway');
GO

INSERT INTO dbo.pv_logTipos (nombre, descRef1, descRef2, descVal1, descVal2) VALUES
('LoginExitoso', 'UserID', 'SessionID', 'IPAddress', NULL),
('LoginFallido', 'Username', 'IPAddress', 'Reason', NULL),
('PropuestaCreada', 'PropuestaID', NULL, 'Descripcion', NULL),
('PropuestaActualizada', 'PropuestaID', NULL, 'Descripcion', 'Version'),
('AnalisisIASolicitado', 'PropuestaID', 'AnalisisID', 'Estado', NULL),
('DocumentoGuardado', 'MediaFileID', NULL, 'URL', NULL),
('TransaccionPago', 'TransactionID', 'UserID', 'Amount', 'Status'),
('Error', 'ErrorCode', 'StackTrace', 'Message', NULL),
('AuditoriaCambio', 'Table', 'RecordID', 'OldValue', 'NewValue'),
('PropuestaPublicada', 'PropuestaID', NULL, 'FechaPublicacion', NULL),
('PropuestaDenegada', 'PropuestaID', NULL, 'Razon', NULL),
('InversionRegistrada', 'PropuestaID', 'UserID', 'Monto', NULL),
('LogicAppRunSucceeded', 'WorkflowName', 'RunID', 'DurationMs', NULL),
('LogicAppRunFailed', 'WorkflowName', 'RunID', 'ErrorCode', 'ErrorMessage'),
('LogicAppActionCompleted', 'WorkflowName', 'ActionName', 'Status', 'DurationMs'),
('LogicAppActionFailed', 'WorkflowName', 'ActionName', 'ErrorCode', 'ErrorMessage'),
('FunctionInvocationStarted', 'FunctionName', 'InvocationID', 'TriggerType', NULL),
('FunctionInvocationSucceeded', 'FunctionName', 'InvocationID', 'DurationMs', NULL),
('FunctionInvocationFailed', 'FunctionName', 'InvocationID', 'ErrorMessage', 'StackTrace'),
('DataFactoryPipelineStarted', 'PipelineName', 'RunID', 'TriggerType', NULL),
('DataFactoryPipelineSucceeded', 'PipelineName', 'RunID', 'DurationMs', NULL),
('DataFactoryPipelineFailed', 'PipelineName', 'RunID', 'ErrorCode', 'ErrorMessage'),
('DataFactoryActivityCompleted', 'PipelineName', 'ActivityName', 'Status', 'DurationMs'),
('DataFactoryActivityFailed', 'PipelineName', 'ActivityName', 'ErrorCode', 'ErrorMessage'),
('EventGridEventPublished', 'Topic', 'EventType', 'Subject', NULL),
('EventGridDeliveryAttempt', 'Subscription', 'EventID', 'DeliveryStatus', 'StatusCode'),
('AzureResourceCreated', 'ResourceType', 'ResourceName', 'SubscriptionID', 'ResourceGroup'),
('AzureResourceDeleted', 'ResourceType', 'ResourceName', 'SubscriptionID', 'ResourceGroup'),
('AzureLoginAttempt', 'UserID', 'IPAddress', 'Result', NULL),
('AzureLoginSuccess', 'UserID', 'IPAddress', 'ClientApp', NULL),
('AzureLoginFailure', 'UserID', 'IPAddress', 'Reason', NULL);
GO

INSERT INTO dbo.pv_plataformaAutenticacion (nombre, llaveSecreta, llave, logoURL) VALUES
('Sistema Interno', 0x1A2B3C4D5E6F7A8B9C0D1E2F3A4B5C6D, 0x9F8E7D6C5B4A39281706F5E4D3C2B1A0, 'https://example.com/logos/internal.png'),
('Google OAuth', 0x2A3B4C5D6E7F8A9B0C1D2E3F4A5B6C7D, 0xA0B1C2D3E4F5A6B7C8D9E0F1A2B3C4D5, 'https://example.com/logos/google.png'),
('Facebook Login', 0x3A4B5C6D7E8F9A0B1C2D3E4F5A6B7C8D, 0xB1C2D3E4F5A6B7C8D9E0F1A2B3C4D5E6, 'https://example.com/logos/facebook.png');
GO

-- Llenado MediaFiles
DECLARE @pdfTypeId INT = (SELECT mediaTypeId FROM dbo.pv_mediaTypes WHERE name = 'PDF');
DECLARE @audioTypeId INT = (SELECT mediaTypeId FROM dbo.pv_mediaTypes WHERE name = 'Audio');
DECLARE @videoTypeId INT = (SELECT mediaTypeId FROM dbo.pv_mediaTypes WHERE name = 'Video');
DECLARE @epubTypeId INT = (SELECT mediaTypeId FROM dbo.pv_mediaTypes WHERE name = 'EPUB');
IF @pdfTypeId IS NULL OR @audioTypeId IS NULL OR @videoTypeId IS NULL OR @epubTypeId IS NULL
BEGIN
    PRINT 'error, no se ha insertado algo';
END
ELSE
BEGIN
    DECLARE @i INT = 1;
    WHILE @i <= 100
    BEGIN
        DECLARE @currentMediaTypeId INT;
        DECLARE @documentURL VARCHAR(300);
        DECLARE @deletedStatus BIT = 0; 
        -- nombres aleatorios para cada file
        IF @i % 4 = 1
        BEGIN
            SET @currentMediaTypeId = @pdfTypeId;
            SET @documentURL = 'https://docs.example.com/proposal-doc-' + RIGHT('00' + CAST(@i AS VARCHAR(2)), 2) + '.pdf';
        END
        ELSE IF @i % 4 = 2
        BEGIN
            SET @currentMediaTypeId = @audioTypeId;
            SET @documentURL = 'https://audio.example.com/meeting-summary-' + RIGHT('00' + CAST(@i AS VARCHAR(2)), 2) + '.mp3';
        END
        ELSE IF @i % 4 = 3
        BEGIN
            SET @currentMediaTypeId = @videoTypeId;
            SET @documentURL = 'https://videos.example.com/project-intro-' + RIGHT('00' + CAST(@i AS VARCHAR(2)), 2) + '.mp4';
        END
        ELSE 
        BEGIN
            SET @currentMediaTypeId = @epubTypeId;
            SET @documentURL = 'https://books.example.com/annual-report-' + RIGHT('00' + CAST(@i AS VARCHAR(2)), 2) + '.epub';
        END
        IF @i % 5 = 0 SET @deletedStatus = 1;
        INSERT INTO dbo.pv_mediaFiles (documentURL, lastUpdate, deleted, mediaTypeId)
        VALUES
        (
            @documentURL,
            DATEADD(day, -(@i * 2), GETDATE()), -- formula para fechas
            @deletedStatus,
            @currentMediaTypeId
        );
        SET @i = @i + 1;
    END;
END
GO

INSERT INTO dbo.pv_roles (name, enabled) VALUES
('Administrador', 1),
('Ciudadano', 1),
('Proponente', 1),
('Validador', 1),
('Inversionista', 1),
('EditorContenido', 1),
('PropuestaCreator', 1),
('PropuestaEditor', 1);

INSERT INTO dbo.pv_propuestaCategoria (nombre) VALUES
('Infraestructura'),
('Educación'),
('Salud'),
('Medio Ambiente'),
('Tecnología'),
('Cultura y Arte'),
('Desarrollo Social'),
('Deporte y Recreación'),
('Seguridad Ciudadana'),
('Innovación');

INSERT INTO dbo.pv_iaModelo (nombre, parametrosJSON)
VALUES
    ('GPT-4o', '{"temperature": 0.7, "max_tokens": 4096, "top_p": 1.0, "frequency_penalty": 0.0, "presence_penalty": 0.0}'),
    ('Claude 3 Opus', '{"temperature": 0.5, "max_tokens": 8192, "top_p": 0.9, "stop_sequences": ["\n\nHuman:"], "stream": false}'),
    ('Gemini 1.5 Pro', '{"temperature": 0.9, "max_output_tokens": 32768, "top_p": 0.8, "top_k": 40}'),
    ('Mistral Large', '{"temperature": 0.6, "max_tokens": 32768, "random_seed": 1234}'),
    ('Llama 3 70B', '{"temperature": 0.8, "max_new_tokens": 8192, "do_sample": true}'),
    ('DALL-E 3', '{"size": "1024x1024", "quality": "standard", "n": 1}'),
    ('Whisper Large v3', '{"response_format": "json", "language": "es", "temperature": 0.0}'),
    ('Stable Diffusion XL', '{"steps": 20, "cfg_scale": 7.5, "sampler": "Euler a"}'),
    ('Cohere Command R+', '{"max_tokens": 128000, "p": 0.75, "k": 0, "stop_sequences": ["<|END_OF_TURN|>"]}'),
    ('Titan Text Express', '{"textGenerationConfig": {"maxTokenCount": 8192, "temperature": 0.7, "topP": 0.9}}');

INSERT INTO dbo.pv_iaPrompts (prompt, contextoID)
VALUES
    ('Resume el siguiente documento en 3 puntos clave.', NULL),
    ('Analiza el sentimiento del siguiente comentario: ', NULL),
    ('Extrae las 5 palabras clave de este texto.', NULL),
    ('Genera una respuesta amigable para el siguiente mensaje de soporte: ', NULL),
    ('Crea un breve anuncio para el siguiente producto: ', NULL),
    ('Traduce el siguiente texto al inglés: ', NULL),
    ('Revisa la siguiente propuesta y sugiere mejoras en la claridad.', NULL),
    ('Dada la siguiente descripción, genera un título conciso y atractivo.', NULL),
    ('Clasifica el siguiente texto en una de estas categorías: A, B, C.', NULL),
    ('Genera una lista de 5 preguntas frecuentes basadas en la siguiente información.', NULL),
    ('Proporciona una breve descripción de la siguiente imagen.', NULL),
    ('Transcribe el siguiente audio y resume los puntos principales.', NULL),
    ('Identifica cualquier inconsistencia en la siguiente base de datos de hechos.', NULL),
    ('Completa la siguiente oración de manera lógica: "La inversión en tecnología..."', NULL),
    ('Escribe un poema corto sobre la naturaleza.', NULL);

INSERT INTO dbo.pv_metodoLlamadaAPI (nombre) VALUES
('GET'),
('POST'),
('PUT'),
('DELETE'),
('PATCH');

INSERT INTO dbo.pv_iaEstado (nombre)
VALUES ('Pendiente'), ('Procesando'), ('Completado'), ('Error');
GO

DECLARE @i INT = 1;
WHILE @i <= 50
BEGIN
    DECLARE @metodoID INT = (SELECT TOP 1 metodoLlamadaID FROM pv_metodoLlamadaAPI ORDER BY NEWID());

    INSERT INTO dbo.pv_configAPIs (
        nombre,
        apiURL,
        rutaEndpoint,
        metodoLlamadaID,
        esActiva,
        ultimaModificacion,
        fechaCreacion
    )
    VALUES (
        CONCAT('API_', @i),
        CONCAT('https://api', @i, '.votopuravida.cr'),
        CONCAT('/endpoint_', @i),
        @metodoID,
        IIF(@i % 2 = 0, 1, 0),
        GETDATE(),
        GETDATE()
    );

    SET @i += 1;
END

SET @i = 1;
WHILE @i <= 50
BEGIN
    DECLARE @modeloID INT = (SELECT TOP 1 iaModeloID FROM pv_iaModelo ORDER BY NEWID());
    DECLARE @apiID INT = (SELECT TOP 1 configAPIID FROM pv_configAPIs ORDER BY NEWID());

    INSERT INTO dbo.pv_infoIA (iaModeloID, configAPIID)
    VALUES (@modeloID, @apiID);

    SET @i += 1;
END
GO

INSERT INTO dbo.pv_moneda  (codigo, nombre, simbolo, esPredeterminada)
VALUES
    ('CRC', 'Colón Costarricense', '₡', 0),
    ('COP', 'Peso Colombiano', '$', 0),
    ('MXN', 'Peso Mexicano', '$', 0),
	('EUR', 'Euro', '€', 0),
	('USD', 'Dolar Estadounidense', '$', 1);

INSERT INTO dbo.pv_tasaCambio (monedaOrigen,monedaDestino,fechaInicio,fechaFin,tasa,activa,fechaCreacion) VALUES
-- De Dólar a Colones (USD to CRC)
(5, 1, '2025-01-01 00:00:00', NULL, 530.00, 1, GETDATE()),
(5, 1, '2025-01-01 00:00:00', NULL, 520.50, 1, GETDATE()),
-- De Colones a Dólar (CRC to USD)
(1, 5, '2025-01-01 00:00:00', NULL, 0.001886, 1, GETDATE()),
(1, 5, '2025-01-01 00:00:00', NULL, 0.001921, 1, GETDATE()), 
-- De Dólar a Pesos Colombianos 
(5, 2, '2025-01-01 00:00:00', NULL, 3900.00, 1, GETDATE()),
(5, 2, '2025-01-01 00:00:00', NULL, 3850.00, 1, GETDATE()),
-- De PesosColombianos a Dólar
(2, 5, '2025-01-01 00:00:00', NULL, 0.000256, 1, GETDATE()),
(2, 5, '2025-01-01 00:00:00', NULL, 0.000260, 1, GETDATE()), 
-- De Dólar a Pesos Mexicanos
(5, 3, '2025-01-01 00:00:00', NULL, 17.00, 1, GETDATE()),
(5, 3, '2025-01-01 00:00:00', NULL, 16.50, 1, GETDATE()),
-- De Pesos Mexicanos a Dólar
(3, 5, '2025-01-01 00:00:00', NULL, 0.05882, 1, GETDATE()),
(3, 5, '2025-01-01 00:00:00', NULL, 0.06060, 1, GETDATE()),
-- De Dólar a Euros
(5, 4, '2025-01-01 00:00:00', NULL, 0.92, 1, GETDATE()),
(5, 4, '2025-01-01 00:00:00', NULL, 0.91, 1, GETDATE()),
-- De Euros a Dólar
(4, 5, '2025-01-01 00:00:00', NULL, 1.0869, 1, GETDATE()), 
(4, 5, '2025-01-01 00:00:00', NULL, 1.0989, 1, GETDATE()), 
-- De Euros a Colones
(4, 1, '2025-01-01 00:00:00', NULL, 575.00, 1, GETDATE()),
(4, 1, '2025-01-01 00:00:00', NULL, 565.00, 1, GETDATE()),
-- De Colones a Euros
(1, 4, '2025-01-01 00:00:00', NULL, 0.001739, 1, GETDATE()), 
(1, 4, '2025-01-01 00:00:00', NULL, 0.001769, 1, GETDATE());

DECLARE @i INT = 1;
WHILE @i <= 200
BEGIN
    INSERT INTO dbo.pv_embeddingsIA (tipo, embedding, dimensionesVector, modeloEmbedding, fechaCreacion)
    VALUES (
        'texto',
        REPLICATE('0.1 ', 768), -- Simula vector
        768,
        'text-embedding-ada-002',
        GETDATE()
    );
    SET @i += 1;
END;

INSERT INTO dbo.pv_tipoOrganizacion (nombreTipo)
VALUES
    ('Organización Gubernamental'),
    ('Organización No Gubernamental (ONG)'),
    ('Empresa Privada'),
    ('Institución Educativa'),
    ('Asociación Civil'),
    ('Fundación'),
    ('Cooperativa'),
    ('Sindicato'),
    ('Grupo Comunitario'),
    ('Partido Político'),
    ('Organización Internacional'),
    ('Entidad Religiosa');

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

INSERT INTO dbo.pv_tipoDocumento (nombre)
VALUES
    ('Cédula de Identidad'),
    ('Pasaporte'),
    ('Licencia de Conducir'),
    ('Documento Legal'),
    ('Acta de Nacimiento'),
    ('Certificado de Votación'),
    ('Factura'),
    ('Contrato'),
    ('Recibo'),
    ('Comprobante');
GO

INSERT INTO pv_estadoDocumento
VALUES ('Aprobado'), ('Rechazado'),('En revisión'), ('En espera')

INSERT INTO pv_estadoIncumplimiento
VALUES ('Aprobado'), ('Rechazado'),('En revisión'), ('En espera')

INSERT INTO pv_estadoPropuesta (nombreEstado, descripcion)
VALUES 
('Publicada', 'Propuesta abierta a votaciones'),
('Cerrada', 'Propuesta sin votaciones activas'),
('Cancelada', 'Propuesta no aprobada'),
('Rechazada', 'Propuesta cerrada por el público')

DECLARE @i INT = 1;
DECLARE @numRecords INT = 2500; 
DECLARE @nombre NVARCHAR(30);
DECLARE @fechaCreacion DATETIME;
DECLARE @tipoDocumentoID INT;
DECLARE @estadoDocumentoID INT = 1;
DECLARE @ultimaModificacion DATETIME;
DECLARE @esActual BIT;
DECLARE @idLegal NVARCHAR(15);
DECLARE @checksum VARBINARY(256);


CREATE TABLE #TempTipoDocumento (
    TipoDocID INT
);

INSERT INTO #TempTipoDocumento (TipoDocID)
SELECT tipoDocumentoID
FROM dbo.pv_tipoDocumento;

IF NOT EXISTS (SELECT 1 FROM #TempTipoDocumento)
BEGIN
    PRINT 'ERROR: No document types found in dbo.pv_tipoDocumento. Please populate it first.';
    DROP TABLE #TempTipoDocumento;
    RETURN;
END;

IF NOT EXISTS (SELECT 1 FROM dbo.pv_estadoDocumento WHERE estadoDocumentoID = @estadoDocumentoID)
BEGIN
    PRINT 'WARNING: The default estadoDocumentoID = ' + CAST(@estadoDocumentoID AS NVARCHAR(10)) + ' does not exist in dbo.pv_estadoDocumento.';
    PRINT 'Please ensure dbo.pv_estadoDocumento is populated or adjust the @estadoDocumentoID variable.';
END;

WHILE @i <= @numRecords
BEGIN
    -- Get a random tipoDocumentoID
    SELECT TOP 1 @tipoDocumentoID = TipoDocID
    FROM #TempTipoDocumento
    ORDER BY NEWID();

    SET @fechaCreacion = DATEADD(day, -CAST(RAND() * 365 * 5 AS INT), GETDATE());
    SET @ultimaModificacion = DATEADD(day, CAST(RAND() * 365 AS INT), @fechaCreacion);
    IF @ultimaModificacion > GETDATE() SET @ultimaModificacion = GETDATE(); 

    SELECT @nombre =
        CASE @tipoDocumentoID
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Cédula de Identidad') THEN 'Cédula ' + RIGHT('0000000000' + CAST(@i * 1000 + (ABS(CHECKSUM(NEWID())) % 999) AS NVARCHAR(10)), 10)
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Pasaporte') THEN 'Pasaporte P-' + RIGHT('00000000' + CAST(@i * 1000 + (ABS(CHECKSUM(NEWID())) % 999) AS NVARCHAR(8)), 8)
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Licencia de Conducir') THEN 'Licencia ' + RIGHT('0000000' + CAST(@i * 1000 + (ABS(CHECKSUM(NEWID())) % 999) AS NVARCHAR(7)), 7)
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Documento Legal') THEN 'Doc. Legal #' + CAST(@i AS NVARCHAR(10)) + '-' + CAST(ABS(CHECKSUM(NEWID())) % 99 AS NVARCHAR(2))
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Acta de Nacimiento') THEN 'Acta Nacimiento ' + CAST(YEAR(@fechaCreacion) AS NVARCHAR(4)) + '-' + CAST(@i AS NVARCHAR(10))
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Certificado de Votación') THEN 'Certificado ' + CAST(YEAR(@fechaCreacion) AS NVARCHAR(4)) + '-Vot'
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Factura') THEN 'Factura INV-' + CAST(ABS(CHECKSUM(NEWID())) % 99999 AS NVARCHAR(5))
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Contrato') THEN 'Contrato C-' + RIGHT('00000' + CAST(@i * 10 + (ABS(CHECKSUM(NEWID())) % 9) AS NVARCHAR(5)), 5)
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Recibo') THEN 'Recibo REC-' + CAST(ABS(CHECKSUM(NEWID())) % 99999 AS NVARCHAR(5))
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Comprobante') THEN 'Comprobante CMP-' + CAST(ABS(CHECKSUM(NEWID())) % 99999 AS NVARCHAR(5))
            ELSE 'Documento Genérico ' + CAST(@i AS NVARCHAR(10))
        END;

    SET @idLegal = LEFT(NEWID(), 8) + CAST(ABS(CHECKSUM(NEWID())) % 999 AS NVARCHAR(3));

    SET @esActual = CAST(ROUND(RAND(), 0) AS BIT);

    SET @checksum = HASHBYTES('SHA2_256', @nombre + CAST(@fechaCreacion AS NVARCHAR(50)) + @idLegal);

	SET @estadoDocumentoID = (ABS(CHECKSUM(NEWID())) % 2) + 1;
	IF (@estadoDocumentoID % 2) = 0 
		BEGIN
			SET @estadoDocumentoID = (ABS(CHECKSUM(NEWID())) % 3) + 2;
		END
		ELSE 
		BEGIN
			SET @estadoDocumentoID = 1;
		END;

    INSERT INTO dbo.pv_documento (
        nombre,
        fechaCreacion,
        tipoDocumentoID,
        estadoDocumentoID,
        ultimaModificacion,
        esActual,
        idLegal,
        checksum
    )
    VALUES (
        @nombre,
        @fechaCreacion,
        @tipoDocumentoID,
        @estadoDocumentoID,
        @ultimaModificacion,
        @esActual,
        @idLegal,
        @checksum
    );

    SET @i = @i + 1;
END;


DROP TABLE #TempTipoDocumento;
GO

--LLENADO DOCUMENTOS USUARIO

DECLARE @i INT = 1;
DECLARE @numUsers INT = 1000;
DECLARE @documentoID INT;
DECLARE @usuarioID INT;
DECLARE @esActivo BIT;
DECLARE @numAdditionalDocs INT;
DECLARE @j INT;

CREATE TABLE #ApprovedDocumentIDsPool (DocumentoID INT PRIMARY KEY);
CREATE TABLE #AllDocumentIDs (DocumentoID INT);
CREATE TABLE #UserIDs (UserID INT PRIMARY KEY); 
INSERT INTO #ApprovedDocumentIDsPool (DocumentoID)
SELECT documentoID
FROM dbo.pv_documento
WHERE estadoDocumentoID = 1; 
INSERT INTO #AllDocumentIDs (DocumentoID)
SELECT documentoID
FROM dbo.pv_documento;
INSERT INTO #UserIDs (UserID)
SELECT userid
FROM dbo.pv_usuarios
ORDER BY userid
OFFSET 0 ROWS FETCH NEXT @numUsers ROWS ONLY; 
DECLARE @countApprovedDocs INT;
DECLARE @countUsers INT;

SELECT @countApprovedDocs = COUNT(*) FROM #ApprovedDocumentIDsPool;
SELECT @countUsers = COUNT(*) FROM #UserIDs;

IF @countUsers < @numUsers
BEGIN
    PRINT 'ERROR: Not enough users found in dbo.pv_usuarios. Found ' + CAST(@countUsers AS NVARCHAR(10)) + ' users. Need at least ' + CAST(@numUsers AS NVARCHAR(10)) + '.';
    DROP TABLE #ApprovedDocumentIDsPool;
    DROP TABLE #AllDocumentIDs;
    DROP TABLE #UserIDs;
    RETURN;
END;

IF @countApprovedDocs < @numUsers
BEGIN
    PRINT 'ERROR: Not enough *unique approved documents* found in dbo.pv_documento for ' + CAST(@numUsers AS NVARCHAR(10)) + ' users.';
    PRINT 'Found ' + CAST(@countApprovedDocs AS NVARCHAR(10)) + ' approved documents (estadoDocumentoID = 1). Need at least ' + CAST(@numUsers AS NVARCHAR(10)) + '.';
    PRINT 'Please ensure you have enough unique approved documents before running this script.';
    DROP TABLE #ApprovedDocumentIDsPool;
    DROP TABLE #AllDocumentIDs;
    DROP TABLE #UserIDs;
    RETURN;
END;

IF NOT EXISTS (SELECT 1 FROM #AllDocumentIDs)
BEGIN
    PRINT 'ERROR: No documents found in dbo.pv_documento. Please populate it first.';
    DROP TABLE #ApprovedDocumentIDsPool;
    DROP TABLE #AllDocumentIDs;
    DROP TABLE #UserIDs;
    RETURN;
END;


PRINT 'Starting data generation for ' + CAST(@numUsers AS NVARCHAR(10)) + ' users...';
WHILE @i <= @numUsers
BEGIN
    SELECT TOP 1 @usuarioID = UserID FROM #UserIDs ORDER BY NEWID();
    DELETE FROM #UserIDs WHERE UserID = @usuarioID;
    SELECT TOP 1 @documentoID = DocumentoID
    FROM #ApprovedDocumentIDsPool
    ORDER BY NEWID();
    DELETE FROM #ApprovedDocumentIDsPool WHERE DocumentoID = @documentoID; 
    SET @esActivo = 1; 
    INSERT INTO dbo.pv_documentosUsuario (documentoID, usuarioID, esActivo)
    VALUES (@documentoID, @usuarioID, @esActivo);
    SET @numAdditionalDocs = FLOOR(RAND() * 4);
    SET @j = 0;
    WHILE @j < @numAdditionalDocs
    BEGIN
        SELECT TOP 1 @documentoID = DocumentoID
        FROM #AllDocumentIDs
        ORDER BY NEWID();

        SET @esActivo = CAST(ROUND(RAND(), 0) AS BIT); 
		IF NOT EXISTS (SELECT 1 FROM dbo.pv_documentosUsuario WHERE documentoID = @documentoID AND usuarioID = @usuarioID)
        BEGIN
            INSERT INTO dbo.pv_documentosUsuario (documentoID, usuarioID, esActivo)
            VALUES (@documentoID, @usuarioID, @esActivo);
        END
        SET @j = @j + 1;
    END;

    SET @i = @i + 1;
END;

DROP TABLE #ApprovedDocumentIDsPool;
DROP TABLE #AllDocumentIDs;
DROP TABLE #UserIDs;

PRINT 'Data generation complete.';
GO

-- 1. pv_tipoTransaccion (Tipos de transacción)
INSERT INTO pv_tipoTransaccion (nombre, descripcion, fechaCreacion)
VALUES 
('Inversión', 'Transacciones de inversión en proyectos', GETDATE()),
('Dividendos', 'Distribución de ganancias a inversionistas', GETDATE()),
('Reembolso', 'Devolución de fondos a inversionistas', GETDATE()),
('Pago Proveedores', 'Pagos a proveedores del proyecto', GETDATE()),
('Gastos Operativos', 'Gastos administrativos del proyecto', GETDATE());

-- 2. pv_subTipoTransaccion (Subtipos específicos)
INSERT INTO pv_subTipoTransaccion (tipoTransaccionID, nombre, descripcion, fechaCreacion)
SELECT 
    tt.tipoTransaccionID,
    sub.nombre,
    sub.descripcion,
    GETDATE()
FROM pv_tipoTransaccion tt
CROSS JOIN (
    VALUES 
    ('Inicial', 'Inversión inicial en proyecto'),
    ('Adicional', 'Inversión adicional en proyecto'),
    ('Mensual', 'Dividendo mensual'),
    ('Final', 'Dividendo final de liquidación'),
    ('Parcial', 'Reembolso parcial'),
    ('Total', 'Reembolso total')
) AS sub(nombre, descripcion)
WHERE tt.nombre IN ('Inversión', 'Dividendos', 'Reembolso');

-- Insertar métodos de pago generales
INSERT INTO pv_metodosPago (nombre, esActivo, configuracionJSON, logoURL) 
VALUES 
('SINPE Móvil', 1, '{"tipo":"qr", "monedas":["CRC"], "requiereValidacion":true}', 'https://sinpemovil.cr/media/logo.png'),
('Transferencia BCR', 1, '{"tipo":"transferencia", "monedas":["CRC","USD"], "requiereCuenta":true}', 'https://plazareal.co.cr/wp-content/uploads/2015/11/Logos-PR-BCR.png'),
('Transferencia BAC', 1, '{"tipo":"transferencia", "monedas":["CRC","USD"], "requiereCuenta":true}', 'https://www.aedcr.com/sites/default/files/2022-05/logo_bacredomatic.png'),
('Transferencia Scotiabank', 1, '{"tipo":"transferencia", "monedas":["CRC","USD"], "requiereCuenta":true}', 'https://amcham.cr/wp-content/uploads/2019/02/scotiabnk.jpg'),
('Tarjeta Visa', 1, '{"tipo":"tarjeta", "monedas":["CRC","USD"], "procesador":"Stripe"}', 'https://sterling.ng/wp-content/uploads/2024/12/Visa-Logo-2006.png'),
('Tarjeta Mastercard', 1, '{"tipo":"tarjeta", "monedas":["CRC","USD"], "procesador":"Stripe"}', 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg');

-- Insertar métodos disponibles para bancos costarricenses
INSERT INTO pv_metodosDisponibles (
    nombre,
    JSONconfigurado,
    refreshToken,
    token,
    expToken,
    maskAccount,
    metodoID,
    esActivo
)
VALUES
-- SINPE Móvil
(
    'SINPE Móvil',
    '{"moneda":"CRC","requiereValidacion":true,"tipo":"QR"}',
    HASHBYTES('SHA2_256', 'refreshtoken_sinpe_1'),  -- Binario directo
    HASHBYTES('SHA2_256', 'token_sinpe_1'),         -- Binario directo
    DATEADD(MONTH, 6, GETDATE()),
    '****8943',
    1,
    1
),
-- Banco de Costa Rica (BCR)
(
    'Cuenta BCR Ahorros',
    '{"moneda":"CRC","requiereCuenta":true,"tipo":"transferencia"}',
    HASHBYTES('SHA2_256', 'refreshtoken_bcr_1'),
    HASHBYTES('SHA2_256', 'token_bcr_1'),
    DATEADD(YEAR, 1, GETDATE()),
    '****5678',
    2,
    1
),
-- BAC Credomatic
(
    'Cuenta BAC Dollar',
    '{"moneda":"USD","requiereCuenta":true,"tipo":"transferencia"}',
    HASHBYTES('SHA2_256', 'refreshtoken_bac_1'),
    HASHBYTES('SHA2_256', 'token_bac_1'),
    DATEADD(YEAR, 1, GETDATE()),
    '****9012',
    3,
    1
),
-- Scotiabank
(
    'Cuenta Scotiabank Corriente',
    '{"moneda":"CRC","requiereCuenta":true,"tipo":"transferencia"}',
    HASHBYTES('SHA2_256', 'refreshtoken_scotia_1'),
    HASHBYTES('SHA2_256', 'token_scotia_1'),
    DATEADD(YEAR, 1, GETDATE()),
    '****3456',
    4,
    1
),
-- Visa (Tarjeta)
(
    'Visa Platinum',
    '{"moneda":"USD","procesador":"Stripe","tipo":"tarjeta"}',
    HASHBYTES('SHA2_256', 'refreshtoken_visa_1'),
    HASHBYTES('SHA2_256', 'token_visa_1'),
    DATEADD(MONTH, 12, GETDATE()),
    '****7890',
    5,
    1
);
GO

DECLARE @i INT = 1;
DECLARE @minTipoOrganizacionId INT;
DECLARE @maxTipoOrganizacionId INT;
DECLARE @randomTipoOrganizacionId INT;
DECLARE @nombreBase VARCHAR(30);
DECLARE @esNacional BIT;
DECLARE @tienePermiso BIT;
DECLARE @identificacionTributaria VARCHAR(10);
DECLARE @Prefijo CHAR(1)
DECLARE @NumeroRestante VARCHAR(9)

SELECT @minTipoOrganizacionId = MIN(tipoOrganizacionID), @maxTipoOrganizacionId = MAX(tipoOrganizacionID)
FROM dbo.pv_tipoOrganizacion;
IF @minTipoOrganizacionId IS NULL OR @maxTipoOrganizacionId IS NULL
BEGIN
    PRINT 'error, faltan registros';
END
ELSE
BEGIN
    WHILE @i <= 100
    BEGIN
        SET @randomTipoOrganizacionId = FLOOR(RAND() * (@maxTipoOrganizacionId - @minTipoOrganizacionId + 1)) + @minTipoOrganizacionId;

        SET @nombreBase = CASE
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Organización Gubernamental') THEN 'Ministerio de '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Organización No Gubernamental (ONG)') THEN 'Fundación Pro '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Empresa Privada') THEN 'Soluciones '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Institución Educativa') THEN 'Escuela Superior de '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Asociación Civil') THEN 'Asociación de '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Fundación') THEN 'Fondo para '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Cooperativa') THEN 'Coop. de '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Sindicato') THEN 'Sindicato de '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Grupo Comunitario') THEN 'Vecinos de '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Partido Político') THEN 'Partido '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Organización Internacional') THEN 'ONU '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Entidad Religiosa') THEN 'Iglesia '
                            ELSE 'Org Gen '
                        END;
        SET @esNacional = CASE WHEN RAND() < 0.8 THEN 1 ELSE 0 END;
        SET @tienePermiso = CASE WHEN RAND() < 0.9 THEN 1 ELSE 0 END;

        SET @Prefijo = 
			CASE FLOOR(RAND() * 4)
				WHEN 0 THEN '1'
				WHEN 1 THEN '3'
				WHEN 2 THEN '4'
				ELSE '7'
			END

		
		SET @NumeroRestante = RIGHT('000000000' + CAST(FLOOR(RAND() * 1000000000) AS VARCHAR), 9)

		SET @identificacionTributaria = @Prefijo + @NumeroRestante
        INSERT INTO dbo.pv_organizaciones (nombre, esNacional, logoUrl, tienePermiso, tipoOrganizacionID, identificacionTributaria)
        VALUES
        (
            @nombreBase +
            CASE
                WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Organización Gubernamental') THEN 'Hacienda ' + CAST(@i AS VARCHAR(3))
                WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Organización No Gubernamental (ONG)') THEN 'Bienestar ' + CAST(@i AS VARCHAR(3))
                WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Empresa Privada') THEN 'Tecno ' + CAST(@i AS VARCHAR(3))
                WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Institución Educativa') THEN 'Estudios ' + CAST(@i AS VARCHAR(3))
                ELSE 'XYZ ' + CAST(@i AS VARCHAR(3))
            END,
            @esNacional,
            'https://example.com/logos/org_' + CAST(@i AS VARCHAR(3)) + '.png',
            @tienePermiso,
            @randomTipoOrganizacionId,
            @identificacionTributaria
        );
        SET @i = @i + 1;
    END;
END
GO
-- Asignar métodos de pago a usuarios (ejemplo para 5 usuarios)
INSERT INTO pv_metodosPagoUsuarios (
    metodoDisponibleID,
    usuarioID
)
SELECT
    metodoDisponibleID,
    userid
FROM (
    SELECT 
        userid,
        NTILE(5) OVER (ORDER BY NEWID()) AS grupo  -- Divide usuarios en 5 grupos
    FROM pv_usuarios
) AS usuarios_grupos
CROSS JOIN (
    SELECT metodoDisponibleID 
    FROM pv_metodosDisponibles 
    WHERE esActivo = 1
) AS metodos
WHERE 
    usuarios_grupos.grupo = 1  -- Asigna métodos solo al primer grupo (20% de usuarios)
    AND RAND(CHECKSUM(NEWID())) > 0.5;  -- Aleatoriedad (50% de probabilidad)
GO

INSERT INTO pv_afiliaciones (nombre)
VALUES
('Universidad de Costa Rica'),
('Instituto Tecnológico de Costa Rica'),
('Universidad Nacional de Costa Rica'),
('Universidad Estatal a Distancia'),
('Universidad Técnica Nacional'),
('Universidad Latina de Costa Rica'),
('Universidad Hispanoamericana'),
('Universidad Fidélitas'),
('Universidad Internacional de las Américas'),
('Universidad Autónoma de Centro América'),
('Universidad San Marcos'),
('INCAE Business School'),
('Universidad de Ciencias Médicas'),
('Universidad EARTH'),
('Universidad para la Paz'),
('Universidad Creativa'),
('Universidad Juan Pablo II'),
('Universidad Adventista de Centroamérica'),
('Universidad Federada San Judas Tadeo'),
('Facultad Autónoma de Ciencias Odontológicas'),
('Universidad Federada de Costa Rica'),
('Universidad Libre de Costa Rica'),
('Universidad Santa Lucía'),
('Universidad La Salle'),
('Universidad Politécnica Internacional'),
('Lead University'),
('Universidad Braulio Carrillo'),
('Universidad Castro Carazo'),
('Universidad Central de Costa Rica'),
('Universidad de San José'),
('CENFOTEC'),
('Universidad de Iberoamérica'),
('Escuela Libre de Derecho'),
('Colegio Universitario de Cartago'),
('Colegio Universitario Limón'),
('Universidad Veritas'),
('Florida Ice and Farm Company'),
('Cooperativa de Productores de Leche Dos Pinos'),
('BAC Credomatic'),
('Grupo Purdy'),
('Coca-Cola FEMSA'),
('Intel Costa Rica'),
('Auto Mercado'),
('Procter & Gamble'),
('Kimberly Clark'),
('Walmart Centroamérica'),
('Bridgestone Firestone Costa Rica'),
('Microsoft'),
('Banco Nacional de Costa Rica'),
('DHL'),
('Apple'),
('Grupo ICE'),
('Amazon'),
('Hewlett-Packard -- HP'),
('Ad Astra Rocket Company'),
('Café Britt'),
('Grupo El Ángel'),
('Durman Esquivel'),
('Grupo Monge'),
('Bayer'),
('Hospital Clínica Bíblica'),
('Tiendas Universal'),
('Teletica (Televisora de Costa Rica)'),
('Marriott International'),
('IBM'),
('Cisco Systems'),
('Grupo INS'),
('Banco de Costa Rica'),
('Cargill'),
('Pfizer'),
('Grupo Q'),
('Grupo Danissa - Nissan'),
('Grupo Bimbo'),
('Farmacias La Bomba'),
('Scotiabank'),
('Samsung Electronics'),
('Davivienda Costa Rica'),
('Hospital CIMA San José'),
('SC Johnson'),
('Holcim'),
('Grupo Irex'),
('McDonalds'),
('Avianca'),
('Grupo Sur'),
('Nestlé'),
('Unilever'),
('Banco Popular'),
('Abbott Laboratories'),
('Grupo Nación'),
('El Pelón de la Bajura'),
('Sanofi'),
('Alimentos Prosalud'),
('Roche'),
('Florex'),
('Liberty Latin America'),
('AstraZeneca'),
('3M Costa Rica'),
('Novartis'),
('Deloitte Costa Rica'),
('GSK'),
('Del Monte Fresh Produce'),
('Grupo Promerica'),
('Baxter'),
('Sykes Enterprises'),
('Cemex'),
('Claro Costa Rica'),
('Constructora Meco'),
('Compañía de Galletas Pozuelo'),
('Cuestamoras'),
('SCA Corporate'),
('Mondelēz International'),
('Smith & Nephew'),
('Boston Scientific'),
('Garnier & Garnier Desarrollos Inmobiliarios'),
('Constructora Volio & Trejos'),
('Schneider Electric'),
('Globalvia Ruta 27'),
('Constructora Van der Laat y Jiménez'),
('Palacio de Modas'),
('Kirebe'),
('Grupo Poma'),
('Grupo Unicomer'),
('Western Union'),
('Mesoamérica'),
('DEMASA'),
('PwC'),
('PriceSmart'),
('Banco Lafise'),
('Tigo Costa Rica'),
('Starbucks Costa Rica'),
('Coope Ande'),
('Coopealianza'),
('Coopelesca'),
('Grupo Mutual'),
('PROCOMER'),
('EPA'),
('Almacenes El Rey'),
('Tiendas Pequeño Mundo'),
('Telecable'),
('Colgate-Palmolive'),
('Grupo Numar'),
('Mayca Food Service'),
('Gutis Farmacéutica'),
('Nacascolo Holdings'),
('Metalco'),
('Bacardi');


INSERT INTO pv_afiliacionesUsuario(usarioID, afiliacionID)
SELECT TOP 1000 
    u.userid,
    a.afiliacionID
FROM
    pv_usuarios u
CROSS JOIN
    pv_afiliaciones a
ORDER BY
    NEWID(); -- NEWID() para obtener un orden aleatorio y así seleccionar IDs aleatorios

INSERT INTO pv_rolesUsuarios (
    userId,
    rolId,
    lastUpdate,
    enabled,
    checksum,
    deleted
)
SELECT
    u.userid,
    CASE
        WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 1 
        ELSE 2 
    END AS rolId,
    GETDATE() AS lastUpdate,
    1 AS enabled,
    CONVERT(VARCHAR(250), HASHBYTES('MD5', CONVERT(NVARCHAR(MAX), u.userid) + 
						  CONVERT(NVARCHAR(MAX), CASE WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 1 ELSE 2 END))) 
						  AS checksum,
    0 AS deleted
FROM
    pv_usuarios u
WHERE NOT EXISTS ( 
    SELECT 1
    FROM dbo.pv_rolesUsuarios pru
    WHERE pru.userId = u.userid
      AND pru.rolId IN (1, 2)
); --Esta parte rellena con admins y ciudadanos
GO


INSERT INTO dbo.pv_rolesUsuarios (
    userId,
    rolId,
    lastUpdate,
    enabled,
    checksum,
    deleted
)
SELECT TOP 500 
    u.userid,
    r.rolId,
    GETDATE() AS lastUpdate,
    1 AS enabled,
    CONVERT(VARCHAR(250), HASHBYTES('MD5', CONVERT(NVARCHAR(MAX), u.userid) + CONVERT(NVARCHAR(MAX), r.rolId))) AS checksum,
    0 AS deleted
FROM
    pv_usuarios u
CROSS JOIN
    pv_roles r
WHERE
    r.rolId BETWEEN 3 AND 8 -- Solo roles del 3 al 8 -> Excluyendo admin y ciudadano
    AND NOT EXISTS ( -- Evitar duplicados (un usuario no puede tener el mismo rol dos veces)
        SELECT 1
        FROM dbo.pv_rolesUsuarios pru
        WHERE pru.userId = u.userid
          AND pru.rolId = r.rolId
    )
ORDER BY
    NEWID();
GO --Esta segunda parte, agrega aleatoriamente a 500 usuarios algun otro rol aleatorio. 

INSERT INTO pv_usuariosPermisos(userid, permisoId, enabled, deleted, lastUpdate, checksum)
SELECT
    u.userid,
    (ABS(CHECKSUM(NEWID())) % 8) + 1 AS permisoId,
    1 AS enabled,
    0 AS deleted,
    GETDATE() AS lastUpdate,
    CONVERT(VARCHAR(250), HASHBYTES('MD5',
        CONVERT(NVARCHAR(MAX), u.userid) +
        CONVERT(NVARCHAR(MAX), (ABS(CHECKSUM(NEWID())) % 8) + 1) -- El cálculo aleatorio debe ser el mismo aquí
    )) AS checksum
FROM
    pv_usuarios u
INNER JOIN
    pv_rolesUsuarios ru ON u.userid = ru.userId 
WHERE
    ru.rolId = 1 
    AND ru.enabled = 1 
    AND ru.deleted = 0 ;


INSERT INTO dbo.pv_metodosPagoOrgs (metodoDisponibleID, organizacionID)
SELECT 
    md.metodoDisponibleID,
    o.organizacionid
FROM 
    dbo.pv_organizaciones o
CROSS APPLY (
    SELECT TOP (1 + ABS(CHECKSUM(NEWID())) % 3) 
        metodoDisponibleID
    FROM dbo.pv_metodosDisponibles
    ORDER BY NEWID()
) md;

-- Activar IDENTITY_INSERT para la tabla
SET IDENTITY_INSERT pv_grupoVotacion ON;
-- Grupos basados en edad
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(1, 'Jóvenes 18-25 años', 'Ciudadanos entre 18 y 25 años de edad', 'Demográfico', 1),
(2, 'Adultos 26-40 años', 'Ciudadanos entre 26 y 40 años de edad', 'Demográfico', 1),
(3, 'Adultos 41-60 años', 'Ciudadanos entre 41 y 60 años de edad', 'Demográfico', 1),
(4, 'Adultos mayores 61+ años', 'Ciudadanos de 61 años en adelante', 'Demográfico', 1);

-- Grupos basados en género
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(5, 'Mujeres', 'Ciudadanas de género femenino', 'Demográfico', 1),
(6, 'Hombres', 'Ciudadanos de género masculino', 'Demográfico', 1),
(7, 'Otros géneros', 'Ciudadanos con identidad de género diversa', 'Demográfico', 1);

-- Grupos basados en educación
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(8, 'Educación primaria', 'Ciudadanos con educación primaria completa', 'Educativo', 1),
(9, 'Educación secundaria', 'Ciudadanos con educación secundaria completa', 'Educativo', 1),
(10, 'Educación universitaria', 'Ciudadanos con educación universitaria completa', 'Educativo', 1),
(11, 'Posgrado', 'Ciudadanos con estudios de posgrado', 'Educativo', 1);

-- Grupos basados en ubicación geográfica
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(12, 'San José Central', 'Ciudadanos residentes en el cantón central de San José', 'Geográfico', 1),
(13, 'Heredia Centro', 'Ciudadanos residentes en el cantón central de Heredia', 'Geográfico', 1),
(14, 'Alajuela Central', 'Ciudadanos residentes en el cantón central de Alajuela', 'Geográfico', 1),
(15, 'Cartago Centro', 'Ciudadanos residentes en el cantón central de Cartago', 'Geográfico', 1),
(16, 'Turrialba', 'Ciudadanos residentes en el cantón de Turrialba', 'Geográfico', 1),
(17, 'Puntarenas Centro', 'Ciudadanos residentes en el cantón central de Puntarenas', 'Geográfico', 1),
(18, 'Limón Central', 'Ciudadanos residentes en el cantón central de Limón', 'Geográfico', 1),
(19, 'Zona Norte', 'Ciudadanos residentes en la zona norte del país', 'Geográfico', 1),
(20, 'Zona Sur', 'Ciudadanos residentes en la zona sur del país', 'Geográfico', 1);

-- Grupos basados en situación laboral
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(21, 'Empleados formales', 'Ciudadanos con empleo formal registrado', 'Laboral', 1),
(22, 'Empleados informales', 'Ciudadanos con empleo no registrado', 'Laboral', 1),
(23, 'Desempleados', 'Ciudadanos en búsqueda activa de empleo', 'Laboral', 1),
(24, 'Emprendedores', 'Ciudadanos con negocios propios registrados', 'Laboral', 1),
(25, 'Estudiantes', 'Ciudadanos matriculados en el sistema educativo', 'Laboral', 1),
(26, 'Jubilados', 'Ciudadanos pensionados', 'Laboral', 1);

-- Grupos combinados (como el ejemplo solicitado)
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(27, 'Adultos mayores emprendedores de Turrialba', 'Ciudadanos de 61+ años con negocios propios en Turrialba', 'Combinado', 1),
(28, 'Jóvenes estudiantes universitarios', 'Ciudadanos entre 18-25 años matriculados en universidad', 'Combinado', 1),
(29, 'Mujeres emprendedoras 26-40 años', 'Mujeres entre 26-40 años con negocios propios', 'Combinado', 1),
(30, 'Hombres técnicos zona norte', 'Hombres con educación técnica en la zona norte del país', 'Combinado', 1);

-- Grupos especiales para crowdfunding
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(31, 'Inversionistas pequeños', 'Ciudadanos con historial de pequeñas inversiones', 'Crowdfunding', 1),
(32, 'Inversionistas medianos', 'Ciudadanos con historial de inversiones medianas', 'Crowdfunding', 1),
(33, 'Fiscalizadores activos', 'Ciudadanos con historial de participación en fiscalización', 'Crowdfunding', 1),
(34, 'Emprendedores tecnológicos', 'Ciudadanos con emprendimientos en el área tecnológica', 'Crowdfunding', 1),
(35, 'Emprendedores turísticos', 'Ciudadanos con emprendimientos en el área turística', 'Crowdfunding', 1);

-- Grupos institucionales
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(36, 'Funcionarios públicos', 'Empleados del sector público', 'Institucional', 1),
(37, 'Miembros de cámaras', 'Afiliados a cámaras empresariales', 'Institucional', 1),
(38, 'Asociaciones comunales', 'Miembros de asociaciones de desarrollo comunal', 'Institucional', 1),
(39, 'Organizaciones ambientales', 'Miembros de organizaciones ambientalistas', 'Institucional', 1),
(40, 'Colegios profesionales', 'Miembros de colegios profesionales', 'Institucional', 1);
-- Desactivar IDENTITY_INSERT al finalizar
SET IDENTITY_INSERT pv_grupoVotacion OFF;


DECLARE @i INT = 1;
DECLARE @randomDocumentoID INT;
DECLARE @randomMediaFileID INT;
DECLARE @randomAprobado BIT;
DECLARE @maxDocumentoID INT;
DECLARE @maxMediaFileID INT;
SELECT @maxDocumentoID = MAX(documentoID) FROM [dbo].[pv_documento];
SET @maxDocumentoID = ISNULL(@maxDocumentoID, 1000); 
SELECT @maxMediaFileID = MAX(mediaFileID) FROM [dbo].[pv_mediaFiles];
SET @maxMediaFileID = ISNULL(@maxMediaFileID, 500); 
SET @maxDocumentoID = IIF(@maxDocumentoID < 1, 1, @maxDocumentoID);
SET @maxMediaFileID = IIF(@maxMediaFileID < 1, 1, @maxMediaFileID);
WHILE @i <= 200
BEGIN
    SET @randomDocumentoID = FLOOR(RAND() * @maxDocumentoID) + 1;
    SET @randomMediaFileID = FLOOR(RAND() * @maxMediaFileID) + 1;
    SET @randomAprobado = CAST(FLOOR(RAND() * 2) AS BIT);
    INSERT INTO [dbo].[pv_archivosDocumentos] (
        [documentoID],
        [mediaFileID],
        [aprobado]
    )
    VALUES (
        @randomDocumentoID,
        @randomMediaFileID,
        @randomAprobado
    );
    SET @i = @i + 1;
END;
GO

-- Asignación de usuarios a grupos demográficos, educativos y combinados (grupos 1-30)
INSERT INTO pv_votanteGrupo (grupoVotacionID, usuarioID, organizacionID, fechaIncorporacion)
SELECT 
    g.grupoVotacionID,
    u.userid,
    NULL,
    DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 730, GETDATE())  -- Fecha aleatoria en últimos 2 años
FROM pv_usuarios u
CROSS JOIN (
    SELECT grupoVotacionID 
    FROM pv_grupoVotacion 
    WHERE grupoVotacionID BETWEEN 1 AND 30
) g
WHERE ABS(CHECKSUM(NEWID())) % 100 < 20  -- 20% de probabilidad de asignación

-- Asignación de organizaciones a grupos institucionales/crowdfunding (grupos 31-40)
INSERT INTO pv_votanteGrupo (grupoVotacionID, usuarioID, organizacionID, fechaIncorporacion)
SELECT 
    g.grupoVotacionID,
    NULL,
    o.organizacionid,
    DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 730, GETDATE())  -- Fecha aleatoria en últimos 2 años
FROM pv_organizaciones o
CROSS JOIN (
    SELECT grupoVotacionID 
    FROM pv_grupoVotacion 
    WHERE grupoVotacionID BETWEEN 31 AND 40
) g
WHERE ABS(CHECKSUM(NEWID())) % 100 < 30  -- 30% de probabilidad de asignación

-- Asignación especial: usuarios a grupos de crowdfunding (grupos 31-35)
INSERT INTO pv_votanteGrupo (grupoVotacionID, usuarioID, organizacionID, fechaIncorporacion)
SELECT 
    g.grupoVotacionID,
    u.userid,
    NULL,
    DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 730, GETDATE())
FROM pv_usuarios u
CROSS JOIN (
    SELECT grupoVotacionID 
    FROM pv_grupoVotacion 
    WHERE grupoVotacionID BETWEEN 31 AND 35
) g
WHERE ABS(CHECKSUM(NEWID())) % 100 < 15  -- 15% de probabilidad

-- Asignación especial: usuarios a grupos institucionales (grupos 36-40)
INSERT INTO pv_votanteGrupo (grupoVotacionID, usuarioID, organizacionID, fechaIncorporacion)
SELECT 
    g.grupoVotacionID,
    u.userid,
    NULL,
    DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 730, GETDATE())
FROM pv_usuarios u
CROSS JOIN (
    SELECT grupoVotacionID 
    FROM pv_grupoVotacion 
    WHERE grupoVotacionID BETWEEN 36 AND 40
) g
WHERE ABS(CHECKSUM(NEWID())) % 100 < 10  -- 10% de probabilidad
GO

DECLARE @i INT = 1;
DECLARE @NumberOfRecords INT = 100;

WHILE @i <= 1000
BEGIN
    DECLARE @randomUsuarioID INT;
    DECLARE @randomMediaFileID INT;
    SELECT TOP 1 @randomUsuarioID = userId
    FROM pv_usuarios
    ORDER BY NEWID();
    SELECT TOP 1 @randomMediaFileID = mediaFileID
    FROM pv_mediaFiles
    ORDER BY NEWID();
    IF @randomUsuarioID IS NOT NULL AND @randomMediaFileID IS NOT NULL
    BEGIN

        INSERT INTO pv_archivosUsuarios (
            usuarioID,
            mediaFileID
        )
        VALUES (
            @randomUsuarioID,
            @randomMediaFileID
        );
    END
    ELSE
    BEGIN
        PRINT 'no hay nada en usuarios OR mediafiles';
    END;

    SET @i = @i + 1;
END;

INSERT INTO pv_entidadesIA (tipo, texto, confianza, posicionInicial, posicionFin) VALUES
('LEY', 'El Artículo 3 de la Constitución garantiza los derechos fundamentales del ciudadano.', 0.85, 4, 13),
('INSTITUCION_LEGAL', 'La demanda fue presentada ante el Juzgado de Primera Instancia de Madrid.', 0.92, 33, 64),
('PARTE_LEGAL', 'El demandante solicitó una indemnización por los daños y perjuicios sufridos.', 0.78, 4, 16),
('PARTE_LEGAL', 'La defensa del acusado presentó nuevas pruebas al tribunal.', 0.89, 15, 24),
('INSTITUCION_LEGAL', 'El tribunal dictará sentencia en los próximos días hábiles.', 0.95, 4, 13),
('DOCUMENTO_LEGAL', 'Las cláusulas del contrato de arrendamiento establecen las obligaciones de ambas partes.', 0.81, 19, 44),
('CONCEPTO_LEGAL', 'La resolución debe ajustarse a la legislación vigente en materia de propiedad intelectual.', 0.88, 28, 47),
('CONCEPTO_LEGAL', 'El caso se enmarca dentro del ámbito del derecho civil, específicamente en contratos.', 0.93, 30, 42),
('CONCEPTO_LEGAL', 'La decisión se basó en la jurisprudencia reciente sobre casos similares de negligencia.', 0.76, 26, 38),
('LEY', 'El Código Penal establece las sanciones para los delitos contra el patrimonio.', 0.84, 4, 15),
('TERMINO_LEGAL', 'Se considera un acto jurídico válido toda manifestación de voluntad que produce efectos de derecho.', 0.87, 15, 27),
('PARTE_LEGAL', 'Las partes acordaron someter la disputa a arbitraje internacional.', 0.91, 4, 11),
('DOCUMENTO_LEGAL', 'Se requirió un poder notarial para la representación legal en el extranjero.', 0.79, 13, 28),
('CONTRATO', 'Este acuerdo contiene una cláusula de confidencialidad que prohíbe la divulgación de información sensible.', 0.94, 27, 56),
('REGULACION', 'El Real Decreto 123/2023 modifica la normativa sobre protección de datos personales.', 0.86, 4, 26),
('INSTITUCION_LEGAL', 'La investigación fue remitida a la Audiencia Nacional por su complejidad.', 0.90, 31, 48),
('PARTE_LEGAL', 'El heredero legítimo ha aceptado la sucesión sin reservas.', 0.75, 4, 14),
('DOCUMENTO_LEGAL', 'El testamento fue redactado en presencia de tres testigos cualificados.', 0.82, 4, 14),
('CONCEPTO_LEGAL', 'La prescripción de delitos graves se interrumpe con la interposición de una querella.', 0.83, 4, 26),
('ROL_LEGAL', 'El fiscal solicitó la pena máxima para el imputado por reincidencia.', 0.96, 4, 12),
('PROCEDIMIENTO_LEGAL', 'Se interpuso un recurso de apelación contra la sentencia del juzgado de primera instancia.', 0.77, 15, 34),
('CONCEPTO_LEGAL', 'El trabajador tiene derecho a una indemnización por despido improcedente según la legislación laboral.', 0.91, 28, 56),
('LEY', 'Los plazos procesales se rigen por la Ley de Enjuiciamiento Civil.', 0.88, 30, 57),
('LUGAR_LEGAL', 'La última instancia en este tipo de casos es el Tribunal Supremo.', 0.93, 40, 55),
('PARTE_LEGAL', 'El letrado de la defensa argumentó la inocencia de su cliente.', 0.80, 4, 12),
('CONTRATO', 'El pago de las arras confirmatorias se realizó al firmar el precontrato.', 0.85, 14, 33),
('DOCUMENTO_LEGAL', 'La venta del inmueble se formalizó mediante escritura pública ante notario.', 0.90, 32, 50),
('CONCEPTO_LEGAL', 'La cuantificación de los daños incluyó el daño emergente y el lucro cesante.', 0.79, 30, 43),
('REGULACION', 'La nueva directiva europea obliga a los estados miembros a adaptar sus leyes de consumo.', 0.92, 4, 22),
('INSTITUCION_LEGAL', 'La fiscalía abrió diligencias de investigación preliminares.', 0.84, 4, 13),
('PARTE_LEGAL', 'La declaración de la víctima fue crucial para el desarrollo del juicio.', 0.87, 24, 33),
('PROCEDIMIENTO_LEGAL', 'El juicio oral se celebrará la próxima semana con la presentación de pruebas.', 0.95, 4, 14),
('CONCEPTO_LEGAL', 'Todo ciudadano tiene derecho a la tutela judicial efectiva, sin indefensión.', 0.77, 30, 52),
('LEY', 'Las sociedades mercantiles se constituyen conforme al Código de Comercio.', 0.89, 44, 62),
('TERMINO_LEGAL', 'Se determinó la responsabilidad civil subsidiaria de la empresa.', 0.91, 15, 34),
('DOCUMENTO_LEGAL', 'Se ha presentado una demanda ejecutiva para el cobro de la deuda.', 0.81, 24, 42),
('ROL_LEGAL', 'El perito presentó su informe técnico ante la corte.', 0.86, 4, 11),
('CONCEPTO_LEGAL', 'La extinción de la pena se produce por cumplimiento o por indulto.', 0.90, 4, 21),
('INSTITUCION_LEGAL', 'Se solicitó una nota simple en el Registro de la Propiedad para verificar la titularidad.', 0.78, 29, 52),
('CONTRATO', 'El incumplimiento contractual puede dar lugar a la rescisión del acuerdo.', 0.93, 4, 28),
('LEY', 'La Ley Orgánica 1/2015 endurece las penas por determinados delitos económicos.', 0.85, 4, 25),
('PROCEDIMIENTO_LEGAL', 'El auto judicial ordenó el embargo de los bienes del deudor.', 0.92, 4, 17),
('TERMINO_LEGAL', 'La resolución adquirió firmeza y tiene valor de cosa juzgada.', 0.80, 42, 54),
('LUGAR_LEGAL', 'El caso fue remitido a la Sala de lo Contencioso-Administrativo.', 0.88, 28, 64),
('CONCEPTO_LEGAL', 'La reincidencia es un agravante en el cálculo de la pena.', 0.94, 4, 16),
('DOCUMENTO_LEGAL', 'El convenio regulador estableció las medidas relativas a la custodia de los hijos.', 0.76, 4, 23),
('ROL_LEGAL', 'El notario certificó la autenticidad de las firmas en el documento.', 0.87, 4, 12),
('LEY', 'El Reglamento General de Protección de Datos (RGPD) entró en vigor en 2018.', 0.91, 4, 48),
('DOCUMENTO_LEGAL', 'La sentencia es firme y ha adquirido carácter de cosa juzgada.', 0.89, 4, 13),
('PARTE_LEGAL', 'Ambas partes firmaron el acuerdo transaccional sin objeciones.', 0.82, 6, 17),
('CONCEPTO_LEGAL', 'La nulidad de pleno derecho fue declarada por el juez.', 0.93, 4, 25);

INSERT INTO [dbo].[pv_relacionesIA] ([entidadId], [verbo], [objeto], [confianza]) VALUES
(1, 'garantiza', 'derechos fundamentales', 0.93),
(10, 'establece', 'sanciones', 0.95),
(23, 'rigen', 'plazos procesales', 0.91),
(41, 'endurece', 'penas', 0.88),
(48, 'entró en vigor', 'en 2018', 0.94),
(2, 'recibe', 'demanda', 0.90),
(5, 'dictará', 'sentencia', 0.96),
(16, 'fue remitida a', 'por su complejidad', 0.87),
(30, 'abrió', 'diligencias', 0.92),
(39, 'verifica', 'titularidad', 0.89),
(44, 'fue remitido a', 'por complejidad', 0.90),
(3, 'solicitó', 'indemnización', 0.85),
(4, 'presentó', 'pruebas', 0.84),
(12, 'acordaron', 'arbitraje', 0.92),
(17, 'ha aceptado', 'sucesión', 0.81),
(25, 'argumentó', 'inocencia', 0.86),
(32, 'fue crucial para', 'desarrollo del juicio', 0.93),
(50, 'firmaron', 'acuerdo transaccional', 0.91),
(6, 'establecen', 'obligaciones', 0.88),
(13, 'requirió', 'representación legal', 0.83),
(14, 'contiene', 'prohíbe la divulgación', 0.95),
(18, 'fue redactado en', 'presencia de testigos', 0.87),
(27, 'se formalizó mediante', 'ante notario', 0.90),
(40, 'puede dar lugar a', 'rescisión del acuerdo', 0.86),
(46, 'estableció', 'medidas relativas a la custodia', 0.89),
(7, 'debe ajustarse a', 'en materia de propiedad intelectual', 0.84),
(8, 'se enmarca dentro de', 'en contratos', 0.92),
(9, 'se basó en', 'sobre casos similares', 0.80),
(15, 'modifica', 'normativa', 0.89),
(19, 'se interrumpe con', 'interposición de una querella', 0.85),
(28, 'incluyó', 'lucro cesante', 0.79),
(34, 'se constituyen conforme a', 'Código de Comercio', 0.86),
(35, 'determinó', 'de la empresa', 0.93),
(21, 'se interpuso contra', 'sentencia del juzgado', 0.81),
(22, 'tiene derecho a', 'según la legislación laboral', 0.94),
(33, 'tiene derecho a', 'sin indefensión', 0.87),
(37, 'presentó', 'informe técnico', 0.90),
(47, 'certificó', 'autenticidad de las firmas', 0.88),
(45, 'es un agravante en', 'cálculo de la pena', 0.91),
(49, 'es firme y ha adquirido', 'carácter de cosa juzgada', 0.96);
GO



DECLARE	@maxEmbeddingId INT;
DECLARE @maxRelacionId INT;
SELECT @maxRelacionId = MAX(relacionId) FROM pv_relacionesIA;
SELECT @maxEmbeddingId = MAX(embeddingId) FROM pv_embeddingsIA;

INSERT INTO pv_contextoIA (embeddingId, relacionId, nombreContexto, config) VALUES
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Análisis de Contratos Legales', '{"modelo":"LegalBERT","version":"1.0"}'),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Revisión de Expedientes Judiciales', '{"idioma":"es","modo":"rapido"}'),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Detección de Cláusulas Abusivas', '{"umbral_riesgo":0.7}'),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Clasificación de Normativa Laboral', NULL),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Extracción de Partes en Litigios', '{"campos":["demandante","demandado"]}'),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Resumen de Sentencias Importantes', '{"longitud_max":300,"formato":"conciso"}'),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Monitoreo de Cambios Legislativos', '{"frecuencia":"semanal"}'),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Evaluación de Cumplimiento Normativo', '{"norma":"GDPR"}'),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Generación Automatizada de Poderes', '{"plantilla":"general"}'),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Análisis de Cláusulas de Confidencialidad', '{"tipo_contrato":"NDA"}'),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Identificación de Jurisprudencia Relevante', '{"palabras_clave":["fraude","bancario"]}'),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Contexto para Solicitudes de Amparo', '{"corte":"Suprema"}'),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Detección de Conflicto de Intereses', NULL),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Revisión de Actas Notariales', '{"formato":"PDF","ocr":"true"}'),
(CAST(RAND() * @maxEmbeddingId + 1 AS INT), CAST(RAND() * @maxRelacionId + 1 AS INT), 'Contexto de Propiedad Intelectual', '{"tipo":"patente"}');

DECLARE @minIaEstadoID INT, @maxIaEstadoID INT;
DECLARE @minInfoid INT, @maxInfoid INT;
DECLARE @minContextoID INT, @maxContextoID INT;
DECLARE @minDocumentoID INT, @maxDocumentoID INT;


SELECT @minIaEstadoID = MIN(iaEstadoID), @maxIaEstadoID = MAX(iaEstadoID) FROM [dbo].[pv_iaEstado];
SELECT @minInfoid = MIN(infoId), @maxInfoid = MAX(infoId) FROM [dbo].[pv_infoIA];
SELECT @minContextoID = MIN(contextoID), @maxContextoID = MAX(contextoID) FROM [dbo].[pv_contextoIA];
SELECT @minDocumentoID = MIN(documentoID), @maxDocumentoID = MAX(documentoID) FROM [dbo].[pv_documento]; 
DECLARE @i INT = 1;

DECLARE @fechaSolicitud DATETIME;
DECLARE @fechaComienzo DATETIME;
DECLARE @fechaFinalizacion DATETIME;
DECLARE @randomContextoID INT;
DECLARE @randomIaEstadoID INT;
DECLARE @randomInfoid INT;
DECLARE @randomDocumentoID INT;
WHILE @i <= 100
BEGIN
	-- añade cantidad aleatoria de dias, horas y minutos
    SET @fechaSolicitud = DATEADD(day, -CAST(RAND() * 365 AS INT), GETDATE());
    SET @fechaSolicitud = DATEADD(hour, CAST(RAND() * 24 AS INT), @fechaSolicitud);
    SET @fechaSolicitud = DATEADD(minute, CAST(RAND() * 60 AS INT), @fechaSolicitud);

    SET @fechaComienzo = DATEADD(minute, CAST(RAND() * (7*24*60) + 1 AS INT), @fechaSolicitud);
    SET @fechaFinalizacion = DATEADD(minute, CAST(RAND() * (5*24*60) + 1 AS INT), @fechaComienzo);
    SET @randomIaEstadoID = FLOOR(RAND() * @maxIaEstadoID) + 1;
    SET @randomInfoid = FLOOR(RAND() * @maxInfoid) + 1;
    SET @randomContextoID = FLOOR(RAND() * @maxContextoID) + 1;
	print @randomContextoID;
    SET @randomDocumentoID = FLOOR(RAND() * @maxDocumentoID) + 1;
    INSERT INTO pv_iaAnalisis (
        [fechaSolicitud],
        [iaEstadoID],
        [fechaComienzo],
        [fechaFinalizacion],
        [infoid],
        [contextoID],
        [documentoID]
    )
    VALUES (
        @fechaSolicitud,
        @randomIaEstadoID,
        @fechaComienzo,
        @fechaFinalizacion,
        @randomInfoid,
        @randomContextoID,
        @randomDocumentoID
    );

    SET @i = @i + 1;
END;
GO

INSERT INTO pv_educacionUsuario(userid, nivelID)
SELECT
    u.userid,
    (ABS(CHECKSUM(NEWID())) % 6) + 1 AS nivelID
FROM
    pv_usuarios u
GO

DECLARE @minContextoID INT, @maxContextoID INT;

SELECT @minContextoID = MIN(contextoId), @maxContextoID = MAX(contextoId) FROM pv_contextoIA;

CREATE TABLE #promptsTemp ( -- tabla temporal de prompts, hace mas facil la insercion
    IDk INT IDENTITY(1,1),
    muchoTexto VARCHAR(500)
);

INSERT INTO #promptsTemp (muchoTexto) VALUES
('Genera un resumen ejecutivo del contrato de compraventa.'),
('Identifica todas las cláusulas de confidencialidad en el documento.'),
('¿Cuáles son las responsabilidades del arrendatario según este contrato de arrendamiento?'),
('Analiza el alcance del Artículo 5 del Código Civil.'),
('Extrae los nombres completos de todas las partes mencionadas en el expediente judicial.'),
('Determina la validez de la escritura pública de la propiedad.'),
('Clasifica este documento como sentencia, auto o providencia.'),
('Busca precedentes legales relacionados con la negligencia médica en casos similares.'),
('¿Qué acciones legales se derivan del incumplimiento contractual de la cláusula 7?'),
('Explica la diferencia entre daño emergente y lucro cesante.'),
('Prepara una lista de todos los testigos citados en el juicio oral.'),
('Evalúa si este convenio regulador cumple con la legislación familiar vigente.'),
('Identifica cualquier inconsistencia entre la ley X y el reglamento Y.'),
('Resume los puntos clave de la nueva directiva europea sobre protección de datos.'),
('¿Cuál es la pena máxima para el delito de fraude según el Código Penal?'),
('Extrae todas las fechas importantes mencionadas en este testamento.'),
('Analiza la jurisprudencia reciente sobre propiedad intelectual.'),
('Determina la responsabilidad civil del demandado en este caso.'),
('Genera un borrador de poder notarial para actos de administración.'),
('¿Cuáles son los pasos para interponer un recurso de apelación?'),
('Identifica cualquier disposición legal que afecte a la privacidad en este contexto.'),
('Clasifica los documentos adjuntos según su relevancia legal.'),
('¿Qué implicaciones tiene la Ley de Enjuiciamiento Civil para los plazos procesales?'),
('Extrae los detalles de contacto de los abogados de las partes.'),
('Resume el procedimiento de embargo de bienes según la normativa actual.'),
('Identifica si existe cosa juzgada en este expediente.'),
('¿Cómo afecta la reincidencia a la sentencia en casos penales?'),
('Genera un texto con las obligaciones de las partes en un contrato de servicios.'),
('Analiza la validez de las firmas digitales en este documento.'),
('Explica los requisitos para la extinción de la pena.'),
('Busca referencias al Tribunal Supremo en este caso.'),
('Identifica todas las leyes mencionadas en el informe.'),
('¿Cuál es la interpretación legal de "fuerza mayor" en este contrato?'),
('Genera un resumen de los hechos probados en la sentencia.'),
('Analiza la viabilidad de una demanda ejecutiva para esta deuda.'),
('¿Cuáles son los derechos del consumidor según la legislación actual?'),
('Determina si este acuerdo es vinculante legalmente.'),
('Identifica las partes en este litigio y sus roles.'),
('Resume los puntos principales del acta de la junta de propietarios.'),
('Clasifica los artículos del Código de Comercio relevantes para este tipo de sociedad.'),
('Explica el concepto de "debida diligencia" en contratos.'),
('Genera una cláusula de exclusividad para un contrato mercantil.'),
('¿Qué sanciones se aplican por incumplimiento de la Ley de Protección de Datos?'),
('Analiza los efectos de una sentencia absolutoria.'),
('Busca información sobre el Registro de la Propiedad en esta jurisdicción.');

DECLARE @i INT = 1;
WHILE @i <= 45
BEGIN
    DECLARE @randomPromptText VARCHAR(500);
    SELECT TOP 1 @randomPromptText =  muchoTexto
    FROM #promptsTemp
    ORDER BY NEWID();
    DECLARE @randomContextoID INT = FLOOR(RAND() * (@maxContextoID - @minContextoID + 1)) + @minContextoID;
    INSERT INTO pv_iaPrompts (
        [prompt],
        [contextoID]
    )
    VALUES (
        @randomPromptText,
        @randomContextoID
    );
    SET @i = @i + 1;
END;

DROP TABLE #promptsTemp;

INSERT INTO dbo.pv_intentoPago (
    monto, 
    actualMonto, 
    resultado, 
    numeroAuth, 
    reference, 
    tokenCargo, 
    descripcion, 
    fecha, 
    checksum, 
    metodoPagoID, 
    monedaID
)
VALUES
    -- Pago 1: Aprobado (SINPE Móvil, CRC) - DEBE tener numeroAuth
    (
        500000.00, 
        500000.00, 
        'Aprobado', 
        'AUTH123456',  -- Número de autorización para transacción aprobada
        'REF78901', 
        HASHBYTES('SHA2_256', 'TOKEN_500K_' + CONVERT(VARCHAR(36), NEWID())), 
        'Inversión en proyecto de energía solar', 
        DATEADD(DAY, -10, GETDATE()), 
        HASHBYTES('SHA2_256', '500000.00AprobadoREF78901' + CONVERT(VARCHAR(36), NEWID())), 
        1,  -- SINPE Móvil
        1   -- CRC
    ),
    -- Pago 2: Aprobado (Tarjeta Visa, USD) - DEBE tener numeroAuth
    (
        250000.00, 
        250000.00, 
        'Aprobado', 
        'AUTH654321',  -- Número de autorización para transacción aprobada
        'REF78902', 
        HASHBYTES('SHA2_256', 'TOKEN_250K_' + CONVERT(VARCHAR(36), NEWID())), 
        'Inversión en proyecto de turismo rural', 
        DATEADD(DAY, -8, GETDATE()), 
        HASHBYTES('SHA2_256', '250000.00AprobadoREF78902' + CONVERT(VARCHAR(36), NEWID())), 
        5,  -- Tarjeta Visa
        5   -- USD
    ),
    -- Pago 3: Aprobado (Transferencia BAC, CRC) - DEBE tener numeroAuth
    (
        1000000.00, 
        1000000.00, 
        'Aprobado', 
        'AUTH987654',  -- Número de autorización para transacción aprobada
        'REF78903', 
        HASHBYTES('SHA2_256', 'TOKEN_1M_' + CONVERT(VARCHAR(36), NEWID())), 
        'Inversión en proyecto de agricultura sostenible', 
        DATEADD(DAY, -5, GETDATE()), 
        HASHBYTES('SHA2_256', '1000000.00AprobadoREF78903' + CONVERT(VARCHAR(36), NEWID())), 
        3,  -- Transferencia BAC
        1   -- CRC
    ),
    -- Pago 4: Pendiente (Transferencia BCR, CRC) - Si no permite NULL, usar un valor por defecto
    (
        750000.00, 
        0.00, 
        'Pendiente', 
        'PENDING_AUTH',  -- Valor por defecto para transacciones pendientes
        'REF78904', 
        HASHBYTES('SHA2_256', 'TOKEN_750K_' + CONVERT(VARCHAR(36), NEWID())), 
        'Inversión en proyecto de tecnología educativa', 
        DATEADD(DAY, -2, GETDATE()), 
        HASHBYTES('SHA2_256', '750000.00PendienteREF78904' + CONVERT(VARCHAR(36), NEWID())), 
        2,  -- Transferencia BCR
        1   -- CRC
    ),
    -- Pago 5: Rechazado (Tarjeta Mastercard, USD) - Si no permite NULL, usar un valor por defecto
    (
        300000.00, 
        0.00, 
        'Rechazado', 
        'DECLINED_AUTH',  -- Valor por defecto para transacciones rechazadas
        'REF78905', 
        HASHBYTES('SHA2_256', 'TOKEN_300K_' + CONVERT(VARCHAR(36), NEWID())), 
        'Inversión en proyecto de reciclaje comunitario - Fondos insuficientes', 
        DATEADD(DAY, -7, GETDATE()), 
        HASHBYTES('SHA2_256', '300000.00RechazadoREF78905' + CONVERT(VARCHAR(36), NEWID())), 
        6,  -- Tarjeta Mastercard
        5   -- USD
    );
GO

INSERT INTO pv_criteriosExito ([titulo], [descripcion]) VALUES
('Asistencia Eventos >80%', 'Alcanzar una asistencia del 80% o más en los eventos comunitarios planificados por el proyecto.'),
('Reducción Burocracia 20%', 'Reducir los tiempos de espera en trámites públicos relacionados con el proyecto en un 20% mediante optimización de procesos.'),
('Aumento Reciclaje 15%', 'Incrementar la tasa de reciclaje en la comunidad objetivo en un 15% medida trimestralmente.'),
('Nuevas Empresas Locales +10', 'Fomentar la creación de al menos 10 nuevas microempresas o emprendimientos locales al finalizar el proyecto.'),
('Mejora Calidad Aire 10%', 'Demostrar una mejora del 10% en la calidad del aire local, verificada por datos de monitoreo ambiental.'),
('Capacitación Completada 95%', 'Lograr que el 95% de los participantes inscritos completen los programas de capacitación ofrecidos.'),
('Acceso Agua Potable 98%', 'Ampliar el acceso a agua potable segura al 98% de los hogares en la zona de intervención.'),
('Reducción Accidentes 5%', 'Disminuir el número de accidentes o incidentes críticos en áreas públicas en un 5% anualmente.'),
('Uso Espacios Públicos +30%', 'Incrementar el uso de los espacios públicos revitalizados en un 30% medido por conteo de usuarios.'),
('Satisfacción Servicios 88%', 'Alcanzar un 88% de satisfacción con los nuevos servicios públicos implementados, según encuestas.'),
('Conciencia Salud +20%', 'Aumentar el nivel de conocimiento sobre prácticas de salud preventivas en un 20% en la población objetivo.'),
('Particip. Volunt. +50%', 'Incrementar la participación en actividades de voluntariado comunitario en un 50% en el año del proyecto.'),
('Proyectos Vecinales +5', 'Impulsar al menos 5 proyectos vecinales autogestionados y sostenibles con apoyo del programa.'),
('Reducción Morbilidad 3%', 'Reducir la morbilidad de una enfermedad específica en un 3% en el grupo demográfico objetivo.'),
('Acceso Digital 75%', 'Garantizar el acceso a herramientas digitales para al menos el 75% de los adultos mayores de la comunidad.'),
('Viviendas Rehabilitadas 50', 'Rehabilitar y mejorar las condiciones de al menos 50 viviendas en áreas prioritarias.'),
('Generación Empleo Local 15%', 'Aumentar la generación de empleo local en un 15% para los beneficiarios del proyecto.'),
('Índice Seguridad +15%', 'Mejorar el índice de percepción de seguridad ciudadana en un 15% en la comunidad intervenida.'),
('Aumento Oferta Cultural 40%', 'Incrementar la oferta de actividades culturales y recreativas en un 40% en el área de influencia.'),
('Cumplimiento Plazos 90%', 'El 90% de las fases clave del proyecto se completarán dentro de los plazos establecidos, verificable por cronograma.');


CREATE TABLE #RazonesVeredicto (
    Razon VARCHAR(2000),
    Argumento NCHAR(10)
);

INSERT INTO #RazonesVeredicto (Razon, Argumento) VALUES
('Verificación de datos exitosa, todos los campos obligatorios coinciden.', 'APROBADO'),
('Firma digital verificada y autenticidad del documento confirmada.', 'APROBADO'),
('Coincidencia biométrica del 99.8% con la base de datos de referencia.', 'APROBADO'),
('Todos los elementos de seguridad del documento fueron validados correctamente.', 'APROBADO'),
('Fecha de emisión y caducidad dentro del rango permitido y legible.', 'APROBADO'),
('Calidad de imagen baja para biometría facial, requiere verificación manual.', 'PENDIENTE'),
('Algunos caracteres en el número de identificación no se extrajeron con alta confianza.', 'PENDIENTE'),
('Discrepancia menor en el formato de la dirección, necesita revisión de estándar.', 'PENDIENTE'),
('Sello de seguridad parcialmente ilegible, requiere confirmación visual.', 'PENDIENTE'),
('Información de género no detectada o ambigua en el documento.', 'PENDIENTE'),
('Documento marcado como falsificado por el sistema de detección de patrones.', 'RECHAZADO'),
('Número de documento inválido o no existe en los registros oficiales.', 'RECHAZADO'),
('Inconsistencia crítica entre la fotografía y los datos biométricos registrados.', 'RECHAZADO'),
('Caducidad del documento excedida, no es válido para trámites.', 'RECHAZADO'),
('Ausencia de elementos de seguridad esperados para este tipo de documento.', 'RECHAZADO'),
('El código de barras o MRZ no pudo ser escaneado o es erróneo.', 'RECHAZADO'),
(NULL, 'APROBADO'),
(NULL, 'PENDIENTE'),
(NULL, 'RECHAZADO'),
('Datos personales completos y en formato esperado.', 'APROBADO'),
('Documento con ligera deformación, pero información clave legible.', 'PENDIENTE'),
('Diferencia de fuente en un campo específico, posible alteración menor.', 'PENDIENTE'),
('Verificación de la marca de agua incompleta debido a reflejo.', 'PENDIENTE'),
('Fotografía oscura, pero rasgos faciales identificables manualmente.', 'PENDIENTE'),
('El documento presenta signos de manipulación en el área de la fecha.', 'RECHAZADO'),
('Nombre del titular no coincide con el registro principal del sistema.', 'RECHAZADO');

DECLARE @minUserId INT, @maxUserId INT;
DECLARE @minAnalisisId INT, @maxAnalisisId INT;

SELECT @minUserId = MIN(userId), @maxUserId = MAX(userId) FROM pv_usuarios; 

SELECT @minAnalisisId = MIN(analisisId), @maxAnalisisId = MAX(analisisId) FROM [dbo].[pv_iaAnalisis];

SET @maxUserId = IIF(@maxUserId < @minUserId, @minUserId, @maxUserId);
SET @maxAnalisisId = IIF(@maxAnalisisId < @minAnalisisId, @minAnalisisId, @maxAnalisisId);

DECLARE @i INT = 1;

WHILE @i <= 100
BEGIN

    DECLARE @randomUserId INT = FLOOR(RAND() * (@maxUserId - @minUserId + 1)) + @minUserId;
    DECLARE @fechaRevision DATETIME = DATEADD(day, -CAST(RAND() * 365 AS INT), GETDATE());
    SET @fechaRevision = DATEADD(hour, CAST(RAND() * 24 AS INT), @fechaRevision);
    SET @fechaRevision = DATEADD(minute, CAST(RAND() * 60 AS INT), @fechaRevision);
    DECLARE @randomAnalisisId INT = NULL;
    IF RAND() > 0.20 -- 80% de probabilidad de tener un analisisId
    BEGIN
        SET @randomAnalisisId = FLOOR(RAND() * (@maxAnalisisId - @minAnalisisId + 1)) + @minAnalisisId;
    END
    DECLARE @selectedRazon VARCHAR(2000);
    DECLARE @selectedArgumento NCHAR(10);
    SELECT TOP 1 @selectedRazon = Razon, @selectedArgumento = Argumento
    FROM #RazonesVeredicto
    ORDER BY NEWID(); 
    INSERT INTO pv_revisionHumana (
        [userId],
        [fechaRevisionHumana],
        [analisisId],
        [razonVeredicto],
        [argumentoAnalisis]
    )
    VALUES (
        @randomUserId,
        @fechaRevision,
        @randomAnalisisId,
        @selectedRazon,
        @selectedArgumento
    );

    SET @i = @i + 1;
END;

DROP TABLE #RazonesVeredicto;
GO

DECLARE @userId INT;
DECLARE @cantContactos INT;
DECLARE @contactTypeId INT;
DECLARE @contactValue NVARCHAR(255);
DECLARE @enabled BIT;
DECLARE @lastUpdate DATETIME;
DECLARE @maxUsers INT = 1000;
DECLARE @i INT = 1;

CREATE TABLE #ValidContactTypes (
    typeId INT,
    name NVARCHAR(255)
);

INSERT INTO #ValidContactTypes (typeId, name)
SELECT typeId, name
FROM dbo.pv_contactType
WHERE name <> 'Dirección de Residencia'; 

WHILE @i <= @maxUsers
BEGIN
    SET @userId = @i;
    SET @cantContactos = FLOOR(RAND() * 2) + 1; -- 1 or 2 contacts per user

    DECLARE @j INT = 1;
    WHILE @j <= @cantContactos
    BEGIN
        SELECT TOP 1 @contactTypeId = typeId
        FROM #ValidContactTypes
        ORDER BY NEWID(); 


        SET @contactValue =
            CASE
                WHEN (SELECT name FROM dbo.pv_contactType WHERE typeId = @contactTypeId) = 'Correo Electrónico' THEN 'user' + CAST(@userId AS NVARCHAR(10)) + '_' + CAST(@j AS NVARCHAR(2)) + '@example.com'
                WHEN (SELECT name FROM dbo.pv_contactType WHERE typeId = @contactTypeId) = 'Teléfono Fijo' THEN '506-2' + RIGHT('000000' + CAST(CAST(RAND() * 999999 AS INT) AS NVARCHAR(6)), 6)
                WHEN (SELECT name FROM dbo.pv_contactType WHERE typeId = @contactTypeId) = 'Teléfono Móvil' THEN '506-8' + RIGHT('000000' + CAST(CAST(RAND() * 999999 AS INT) AS NVARCHAR(6)), 6)
                WHEN (SELECT name FROM dbo.pv_contactType WHERE typeId = @contactTypeId) = 'Red Social' THEN 'https://social.com/user' + CAST(@userId AS NVARCHAR(10)) + '_' + CAST(@j AS NVARCHAR(2))
                WHEN (SELECT name FROM dbo.pv_contactType WHERE typeId = @contactTypeId) = 'Fax' THEN '506-2' + RIGHT('000000' + CAST(CAST(RAND() * 999999 AS INT) AS NVARCHAR(6)), 6)
            END;

			

        SET @enabled = 1;
        SET @lastUpdate = GETDATE();

		 INSERT INTO pv_contact(userid, value, enabled, lastUpdate, typeId)
        VALUES (@userId, @contactValue, @enabled, @lastUpdate, @contactTypeId);


        SET @j = @j + 1;
    END

    SET @i = @i + 1;
END;

DROP TABLE #ValidContactTypes;
GO

-- Asigna profesiones aleatorias a los usuarios existentes

-- Primero verificamos que existan usuarios y profesiones
IF EXISTS (SELECT 1 FROM dbo.pv_usuarios) AND EXISTS (SELECT 1 FROM dbo.pv_profesiones)
BEGIN
    -- Insertar registros en pv_profesionesUsuarios
    INSERT INTO dbo.pv_profesionesUsuarios (usuarioID, profesionID, loEjerce)
    SELECT 
        u.userid, 
        p.profesionID,
        CASE 
            WHEN RAND(CHECKSUM(NEWID())) > 0.3 THEN 1 -- 70% de probabilidad de que ejerza
            ELSE 0 -- 30% de probabilidad de que no ejerza
        END AS loEjerce
    FROM 
        dbo.pv_usuarios u
    CROSS APPLY (
        SELECT TOP 1 profesionID 
        FROM dbo.pv_profesiones 
        ORDER BY NEWID() -- Selecciona una profesión aleatoria para cada usuario
    ) p
    WHERE NOT EXISTS (
        SELECT 1 
        FROM dbo.pv_profesionesUsuarios pu 
        WHERE pu.usuarioID = u.userid
    ); -- Solo inserta si el usuario no tiene ya una profesión asignada

    -- Para algunos usuarios (20%), asignar una segunda profesión
    INSERT INTO dbo.pv_profesionesUsuarios (usuarioID, profesionID, loEjerce)
    SELECT 
        u.userid, 
        p.profesionID,
        CASE 
            WHEN RAND(CHECKSUM(NEWID())) > 0.4 THEN 1 -- 60% de probabilidad de que ejerza
            ELSE 0 -- 40% de probabilidad de que no ejerza
        END AS loEjerce
    FROM 
        dbo.pv_usuarios u
    CROSS APPLY (
        SELECT TOP 1 profesionID 
        FROM dbo.pv_profesiones 
        WHERE profesionID NOT IN (
            SELECT profesionID 
            FROM dbo.pv_profesionesUsuarios 
            WHERE usuarioID = u.userid
        )
        ORDER BY NEWID()
    ) p
    WHERE 
        RAND(CHECKSUM(NEWID(), u.userid)) > 0.8 -- 20% de usuarios tendrán 2 profesiones
        AND EXISTS (
            SELECT 1 
            FROM dbo.pv_profesiones 
            WHERE profesionID NOT IN (
                SELECT profesionID 
                FROM dbo.pv_profesionesUsuarios 
                WHERE usuarioID = u.userid
            )
        );

    PRINT 'Se han insertado ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros en pv_profesionesUsuarios';
END
ELSE
BEGIN
    PRINT 'No se pueden insertar datos en pv_profesionesUsuarios porque faltan usuarios o profesiones';
END
GO

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

INSERT INTO pv_direccionesUsuarios(userid, direccionNacimientoid, direccionViviendaid, activa)
SELECT
    u.userid,
    (ABS(CHECKSUM(NEWID())) % 15) + 1 AS direccionNacimientoid,
	(ABS(CHECKSUM(NEWID())) % 15) + 1 AS direccionViviendaid,
	1 as activa
FROM
    pv_usuarios u


INSERT INTO dbo.pv_listaBlancaIPs (ipPermitido) VALUES
(62369638),   -- 37.132.10.1
(13606708),  -- 81.46.0.100
(31557081),  -- 188.76.5.20
(31499530),  -- 187.188.0.10
(31853616),  -- 189.192.1.20
(33784926),  -- 201.140.10.30
(30474634),  -- 181.196.2.10
(31230812),  -- 186.80.0.20
(32014026);  -- 190.254.3.30

INSERT INTO dbo.pv_detallesHorarios (deleted, baseDate, datePart, lastExecution, nextExecution, horarioId) VALUES
-- Horario diario para actualización de estados de propuestas
(0, '2025-01-01 00:00:00', 1, '2025-06-08 23:59:59', '2025-06-09 23:59:59', 1),

-- Horario semanal (martes) para procesos de validación de identidad
(0, '2025-01-06 00:00:00', 2, '2025-06-03 09:00:00', '2025-06-10 09:00:00', 2),

-- Horario mensual (primer lunes) para distribución de dividendos
(0, '2025-01-05 00:00:00', 3, '2025-06-02 10:00:00', '2025-07-07 10:00:00', 3),

-- Horario anual (enero) para renovación de credenciales
(0, '2025-01-01 00:00:00', 4, '2025-01-01 00:00:00', '2026-01-01 00:00:00', 4),

-- Horario cada 3 días para notificaciones de votaciones próximas
(0, '2025-01-01 00:00:00', 1, '2025-06-07 18:00:00', '2025-06-10 18:00:00', 5),

-- Detalle adicional para horario diario (ejecución matutina)
(0, '2025-01-01 08:00:00', 1, '2025-06-08 08:00:00', '2025-06-09 08:00:00', 1),

-- Detalle adicional para horario semanal (ejecución vespertina)
(0, '2025-01-06 15:00:00', 2, '2025-06-03 15:00:00', '2025-06-10 15:00:00', 2),

-- Detalle para proceso de backup (horario diario pero diferente hora)
(0, '2025-01-01 02:00:00', 1, '2025-06-09 02:00:00', '2025-06-10 02:00:00', 1),

-- Detalle para generación de reportes (horario mensual, diferente día)
(0, '2025-01-15 00:00:00', 3, '2025-05-15 00:00:00', '2025-06-15 00:00:00', 3),

-- Detalle para limpieza de logs (horario cada 3 días, noche)
(0, '2025-01-01 23:00:00', 1, '2025-06-07 23:00:00', '2025-06-10 23:00:00', 5);

INSERT INTO pv_tipoVotacion (nombre, descripcion) 
VALUES 
('Aprobación Simple', 'Votación binaria donde los participantes eligen entre aprobar o rechazar una propuesta'),
('Selección Múltiple', 'Votación donde los participantes pueden seleccionar entre varias opciones no excluyentes'),
('Clasificación', 'Votación donde los participantes ordenan o clasifican las opciones según preferencia'),
('Presupuesto Participativo', 'Votación donde los participantes distribuyen un presupuesto entre diferentes opciones'),
('Crowdfunding', 'Votación vinculada a proyectos de financiamiento colectivo con opciones de inversión'),
('Consulta Pública', 'Votación para recoger opinión ciudadana sobre temas específicos sin carácter vinculante'),
('Validación Institucional', 'Votación restringida a miembros de una organización para decisiones internas'),
('Elección Representativa', 'Votación para seleccionar representantes o delegados entre un grupo de candidatos'),
('Priorización', 'Votación para establecer prioridades entre varias opciones o proyectos'),
('Evaluación Continua', 'Votación abierta por tiempo indefinido para evaluación permanente de servicios o proyectos');
GO

INSERT INTO pv_tipoGrupoValidador (nombreTipo) VALUES
('Validadores Ciudadanos'),
('Aceleradoras'),
('Incubadoras'),
('Grupos Inversores'),
('Comité Técnico MICITT'),
('Evaluadores Hacienda'),
('Consejo Social'),
('Comité Ambiental'),
('Validadores Documentación'),
('Fiscalizadores Ejecución'),
('Comité Ético');
GO 

-- Variables para controlar el llenado
DECLARE @totalUsuarios INT, @totalOrganizaciones INT;
DECLARE @usuarioID INT, @organizacionID INT;
DECLARE @contador INT = 1;
DECLARE @maxRelaciones INT = 300; -- Número total de relaciones a crear
DECLARE @esActivo BIT, @rolInterno VARCHAR(50);

-- Obtener conteos de tablas relacionadas
SELECT @totalUsuarios = COUNT(*) FROM [dbo].[pv_usuarios];
SELECT @totalOrganizaciones = COUNT(*) FROM [dbo].[pv_organizaciones];

-- Verificar que hay datos en las tablas relacionadas
IF @totalUsuarios = 0 OR @totalOrganizaciones = 0
BEGIN
    PRINT 'Error: Las tablas pv_usuarios y/o pv_organizaciones están vacías.';
    RETURN;
END

-- Crear tabla temporal para evitar duplicados
CREATE TABLE #RelacionesTemp (
    usuarioID INT,
    organizacionID INT,
    PRIMARY KEY (usuarioID, organizacionID)
);

-- Llenar la tabla con relaciones aleatorias
WHILE @contador <= @maxRelaciones
BEGIN
    -- Seleccionar usuario y organización aleatorios
    SELECT @usuarioID = userid FROM (
        SELECT userid, ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn 
        FROM [dbo].[pv_usuarios]
    ) AS temp WHERE rn = 1 + FLOOR(RAND() * @totalUsuarios);
    
    SELECT @organizacionID = organizacionid FROM (
        SELECT organizacionid, ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn 
        FROM [dbo].[pv_organizaciones]
    ) AS temp WHERE rn = 1 + FLOOR(RAND() * @totalOrganizaciones);
    
    -- Verificar si la relación ya existe
    IF NOT EXISTS (
        SELECT 1 FROM #RelacionesTemp 
        WHERE usuarioID = @usuarioID AND organizacionID = @organizacionID
    )
    BEGIN
        -- Insertar en tabla temporal para control
        INSERT INTO #RelacionesTemp VALUES (@usuarioID, @organizacionID);
        
        -- Determinar valores aleatorios para otros campos
        SET @esActivo = CASE WHEN RAND() > 0.1 THEN 1 ELSE 0 END; -- 90% activos
        
        SET @rolInterno = CASE FLOOR(RAND() * 6)
            WHEN 0 THEN 'Miembro'
            WHEN 1 THEN 'Colaborador'
            WHEN 2 THEN 'Voluntario'
            WHEN 3 THEN 'Asociado'
            WHEN 4 THEN 'Afiliado'
            ELSE 'Beneficiario'
        END;
        
        -- Insertar registro en la tabla principal
        INSERT INTO [dbo].[pv_orgUsuariosRegulares] (
            usuarioID, 
            organizacionid, 
            esActivo, 
            rolInterno
        ) VALUES (
            @usuarioID,
            @organizacionID,
            @esActivo,
            @rolInterno
        );
        
        SET @contador = @contador + 1;
    END
END

-- Limpiar tabla temporal
DROP TABLE #RelacionesTemp;
GO

DECLARE @minAnalisisId INT, @maxAnalisisId INT;

SELECT @minAnalisisId = MIN(analisisId), @maxAnalisisId = MAX(analisisId) FROM [dbo].[pv_iaAnalisis];

CREATE TABLE #ResultadosData (
    OutputText VARCHAR(5000),
    RazonVeredictoText VARCHAR(2000),
    EsAceptado BIT -- indica si esta razon suele ir con un aceptado
);

INSERT INTO #ResultadosData (OutputText, RazonVeredictoText, EsAceptado) VALUES
('{"document_type":"cedula","fields":{"nombre":"Juan Perez","apellido":"Gonzalez","numero_identificacion":"12345678","fecha_nacimiento":"1980-05-15","caducidad":"2030-05-15"},"biometria_facial":"coincide"}', 'Verificación de datos exitosa: todos los campos obligatorios coinciden con alta confianza. Documento válido y vigente.', 1),
('{"document_type":"pasaporte","fields":{"nombre":"Maria Lopez","numero_pasaporte":"P1234567","nacionalidad":"MEX","fecha_emision":"2020-01-20","caducidad":"2030-01-20"},"mrz_status":"OK"}', 'Análisis completo: MRZ y campos principales validados. Coincidencia de seguridad. Documento apto.', 1),
('{"document_type":"cedula","fields":{"nombre":"ERROR","apellido":"ERROR","numero_identificacion":"12345678","caducidad":"2022-03-01"},"biometria_facial":"no_evaluada"}', 'Documento caducado. La fecha de caducidad (01/03/2022) ha sido superada. No es un documento válido.', 0),
('{"document_type":"pasaporte","fields":{"nombre":"Ana Garcia","numero_pasaporte":"P8765432","caducidad":"2028-11-20"},"mrz_status":"ERROR"}', 'Error en la lectura del MRZ (Machine Readable Zone). El sistema detecta una anomalía en la estructura.', 0),
('{"document_type":"cedula","fields":{"nombre":"Carlos Ruiz","apellido":"Diaz","numero_identificacion":"98765432"},"biometria_facial":"baja_confianza"}', 'La confianza en la coincidencia biométrica facial es baja (55%). Se recomienda verificación manual.', 0),
('{"document_type":"cedula","fields":{"nombre":"Pedro Gomez","apellido":"Martinez","numero_identificacion":"11223344"},"biometria_facial":"no_aplica"}', 'Documento con calidad de imagen insuficiente para evaluación biométrica. Campos de texto legibles. Pendiente de verificación manual para biometría.', 0),
('{"document_type":"pasaporte","fields":{"nombre":"Laura Blanco","numero_pasaporte":"P5566778"},"mrz_status":"parcial","seguridad_elements":"no_detectado"}', 'Elementos de seguridad clave (hologramas, tintas UV) no detectados o ilegibles. Potencial manipulación.', 0),
('{"document_type":"cedula","fields":{"nombre":"Fernanda Soto","numero_identificacion":"56789012","caducidad":"2035-01-01"}}', 'Todos los datos legibles y coherentes. Campos de seguridad primaria OK. Listo para aprobación.', 1),
('{"document_type":"pasaporte","fields":{"nombre":"Miguel Torres","numero_pasaporte":"P9988776","nacionalidad":"COL","fecha_emision":"2023-04-10"}}', 'Documento en proceso de análisis de segundo nivel por inconsistencia de formato menor. No es un rechazo final.', 0),
('{"document_type":"cedula","fields":{"nombre":"Isabel Castro","numero_identificacion":"22334455"},"biometria_facial":"pendiente_carga"}', 'Procesamiento pausado: la imagen biométrica aún no ha sido cargada o procesada. Reintentar.', 0),
('{"document_type":"cedula","fields":{"nombre":"Lucas Vidal","apellido":"Romero","numero_identificacion":"33445566","caducidad":"2029-10-20"},"biometria_facial":"coincide_limite"}', 'Coincidencia biométrica en el límite aceptable (70%). Marcar para auditoría ocasional.', 1),
('{"document_type":"pasaporte","fields":{"nombre":"Sofia Herrera","numero_pasaporte":"P1010101","nacionalidad":"PER"},"mrz_status":"OK","seguridad_elements":"OK"}', 'Verificación completa del pasaporte. Sin anomalías detectadas. Aprobado para uso.', 1),
('{"document_type":"cedula","fields":{"nombre":"Daniela Chavez","numero_identificacion":"44556677","caducidad":"2032-06-30"}}', 'Datos del documento extraídos con alta precisión. Ausencia de marcas de agua claras, verificar manualmente.', 0),
('{"document_type":"pasaporte","fields":{"nombre":"Javier Soto","numero_pasaporte":"P2020202","nacionalidad":"CHI"},"mrz_status":"OK"}', 'Análisis superficial OK. Requiere escaneo de chip RFID para validación completa.', 0),
('{"document_type":"cedula","fields":{"nombre":"Paula Gomez","numero_identificacion":"55667788","caducidad":"2031-09-15"}}', 'Documento digitalizado correctamente. Veredicto preliminar positivo.', 1);


DECLARE @i INT = 1;

WHILE @i <= 100
BEGIN
    DECLARE @randomAnalisisId INT = FLOOR(RAND() * (@maxAnalisisId - @minAnalisisId + 1)) + @minAnalisisId;

    DECLARE @selectedOutputText VARCHAR(5000);
    DECLARE @selectedRazonVeredictoText VARCHAR(2000);
    DECLARE @selectedEsAceptado BIT;

    SELECT TOP 1
        @selectedOutputText = OutputText,
        @selectedRazonVeredictoText = RazonVeredictoText,
        @selectedEsAceptado = EsAceptado
    FROM #ResultadosData
    ORDER BY RAND();
    DECLARE @randomPuntajeConfianza DECIMAL(5, 2) = ROUND(0.60 + (RAND() * (0.99 - 0.60)), 2);

    INSERT INTO pv_resultadosAnalisis (
        [analisisId],
        [outputAnalisis],
        [puntajeConfianza],
        [aceptado],
        [razonVeredicto]
    )
    VALUES (
        @randomAnalisisId,
        @selectedOutputText,
        @randomPuntajeConfianza,
        @selectedEsAceptado,
        @selectedRazonVeredictoText
    );

    SET @i = @i + 1;
END;

DROP TABLE #ResultadosData;
GO

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

DECLARE @minUsuarioID INT, @maxUsuarioID INT;
DECLARE @minOrganizacionID INT, @maxOrganizacionID INT;

SELECT @minUsuarioID = MIN(userId), @maxUsuarioID = MAX(userId) FROM pv_usuarios;
SET @minUsuarioID = ISNULL(@minUsuarioID, 1); 
SET @maxUsuarioID = ISNULL(@maxUsuarioID, 50);

SELECT @minOrganizacionID = MIN(organizacionID), @maxOrganizacionID = MAX(organizacionID) FROM pv_organizaciones;
SET @minOrganizacionID = ISNULL(@minOrganizacionID, 1);
SET @maxOrganizacionID = ISNULL(@maxOrganizacionID, 20);  

SET @maxUsuarioID = IIF(@maxUsuarioID < @minUsuarioID, @minUsuarioID, @maxUsuarioID);
SET @maxOrganizacionID = IIF(@maxOrganizacionID < @minOrganizacionID, @minOrganizacionID, @maxOrganizacionID);

CREATE TABLE #ComentariosData (
    TituloText VARCHAR(100),
    CuerpoText VARCHAR(MAX)
);

INSERT INTO #ComentariosData (TituloText, CuerpoText) VALUES
('Consulta sobre propuesta', '¿Podríamos clarificar el punto 3.1 de la propuesta sobre participación ciudadana? Necesitamos más detalles sobre los mecanismos de feedback.'),
('Revisión de documento legal', 'He revisado el borrador del contrato. Propongo un cambio en la cláusula de indemnización para mayor claridad. Adjunto sugerencias.'),
('Agradecimiento por sesión', 'Excelente sesión informativa sobre el nuevo programa. Muy agradecidos por la claridad de la exposición y la resolución de dudas.'),
('Reporte de Incidencia', 'Se ha detectado una anomalía en el registro de beneficiarios. Parece que faltan algunos campos obligatorios en el formulario digital.'),
('Sugerencia de Mejora', 'Considero que la plataforma podría ser más intuitiva para usuarios de edad avanzada. Quizás un modo de alto contraste ayudaría.'),
('Pregunta sobre proyecto', '¿Cuál es el cronograma estimado para la fase de implementación del proyecto de acceso a servicios esenciales?'),
('Felicitaciones al equipo', 'Quiero felicitar al equipo por el excelente trabajo en la campaña de difusión. El alcance ha sido impresionante.'),
('Duda técnica', 'Tengo una duda sobre la integración de los datos del padrón con el nuevo sistema. ¿Podemos agendar una reunión técnica?'),
('Aviso importante', 'Recordatorio: La fecha límite para la entrega de documentación complementaria es el 15 de julio. Por favor, asegúrense de cumplirla.'),
('Comentario general', 'Es un proyecto ambicioso pero necesario para el desarrollo de la comunidad. Espero ver pronto los primeros resultados.'),
('Problema de acceso', 'No puedo acceder a la sección de descargas del portal. Recibo un error de autenticación.'),
('Solicitud de apoyo', 'Necesitamos apoyo adicional para la logística del evento de lanzamiento el próximo mes.'),
('Propuesta de colaboración', 'Nuestra organización está interesada en colaborar en el área de sostenibilidad ambiental. ¿Hay algún canal para propuestas?'),
('Análisis inicial', 'El análisis preliminar de los datos muestra una tendencia positiva en la participación. Buenos indicios.'),
('Observación sobre informe', 'En el informe mensual, la métrica de "Empoderamiento Local" no parece estar reflejando completamente las actividades realizadas.'),
('Duda sobre directriz', 'No entiendo bien la directriz sobre la recopilación de datos sensibles. ¿Podrían especificar qué datos entran en esa categoría?'),
('Retroalimentación positiva', 'Muy buena iniciativa. Los criterios de éxito son claros y alcanzables. ¡Ánimo!'),
('Solicitud de aclaración', 'La definición de "Impacto Social Positivo" en el criterio de éxito necesita una aclaración. ¿Qué tipo de cambio se espera exactamente?');

DECLARE @i INT = 1;

WHILE @i <= 100
BEGIN
    DECLARE @randomUsuarioID INT = FLOOR(RAND() * (@maxUsuarioID - @minUsuarioID + 1)) + @minUsuarioID;
    DECLARE @fechaPublicacion DATETIME = DATEADD(day, -CAST(RAND() * 365 AS INT), GETDATE());
    SET @fechaPublicacion = DATEADD(hour, CAST(RAND() * 24 AS INT), @fechaPublicacion);
    SET @fechaPublicacion = DATEADD(minute, CAST(RAND() * 60 AS INT), @fechaPublicacion);
    DECLARE @selectedTitulo VARCHAR(100);
    DECLARE @selectedCuerpo VARCHAR(MAX);
    SELECT TOP 1 @selectedTitulo = TituloText, @selectedCuerpo = CuerpoText
    FROM #ComentariosData
    ORDER BY RAND();
    DECLARE @randomOrganizacionID INT = NULL;
    IF RAND() > 0.20 -- 80% de probabilidad de tener un organizacionID
    BEGIN
        SET @randomOrganizacionID = FLOOR(RAND() * (@maxOrganizacionID - @minOrganizacionID + 1)) + @minOrganizacionID;
    END
    INSERT INTO pv_detalleComentarios (
        [titulo],
        [cuerpo],
        [fechaPublicacion],
        [usuarioID],
        [organizacionID]
    )
    VALUES (
        @selectedTitulo,
        @selectedCuerpo,
        @fechaPublicacion,
        @randomUsuarioID,
        @randomOrganizacionID
    );
    SET @i = @i + 1;
END;

DROP TABLE #ComentariosData;
GO

-- Insertar tarifas para grupos validadores
SET IDENTITY_INSERT pv_tarifaGrupo ON;
INSERT INTO pv_tarifaGrupo (tarifaID, grupoID, tipoTarifa, porcentaje, montoFijo, monedaID) VALUES
-- Tarifas para Comités Ciudadanos (sin costo)
(1, 1, 'Voluntario', 0, 0, 5), -- CRC
(2, 2, 'Voluntario', 0, 0, 5),
(3, 3, 'Voluntario', 0, 0, 5),
-- Tarifas para Aceleradoras (porcentaje sobre fondos recaudados)
(4, 4, 'Porcentaje', 5.0, 0, 5), -- 5% del total recaudado
(5, 5, 'Porcentaje', 4.5, 0, 5),
(6, 6, 'Porcentaje', 6.0, 0, 5),
-- Tarifas para Incubadoras (monto fijo + porcentaje)
(7, 7, 'Mixta', 2.0, 500, 5), -- 2% + $500 fijos
(8, 8, 'Mixta', 3.0, 300, 5),
(9, 9, 'Mixta', 1.5, 750, 5),
-- Tarifas para Grupos Inversores (solo porcentaje de equity)
(10, 10, 'Equity', 7.0, 0, 5), -- 7% de equity
(11, 11, 'Equity', 5.0, 0, 5),
(12, 12, 'Equity', 4.0, 0, 5),
-- Tarifas para Comités Técnicos (monto fijo por proyecto)
(13, 13, 'Fija', 0, 1200, 5), -- $1200 por proyecto
(14, 14, 'Fija', 0, 1000, 5),
-- Tarifas para Evaluadores de Hacienda (monto fijo)
(15, 15, 'Fija', 0, 800, 5), -- $800 por evaluación
-- Tarifas para Consejo Social (sin costo)
(16, 16, 'Voluntario', 0, 0, 5),
-- Tarifas para Comité Ambiental (monto fijo)
(17, 17, 'Fija', 0, 600, 5), -- $600 por evaluación
-- Tarifas para Validadores Documentales (monto por documento)
(18, 18, 'Fija', 0, 50, 5), -- $50 por documento
-- Tarifas para Fiscalizadores (monto mensual)
(19, 19, 'Fija', 0, 300, 5), -- $300/mes por proyecto
-- Tarifas para Comité Ético (sin costo)
(20, 20, 'Voluntario', 0, 0, 5);
SET IDENTITY_INSERT pv_tarifaGrupo OFF;
GO

INSERT INTO pv_estadoProyecto
VALUES ('Propuesta'), 
('Aprobado'),('En Pausa'), 
('Cancelado'),('Rechazado'), 
('Revisión'),('Pruebas'), 
('Implementación'),('Postergado'), 
('Esperando Aprobación'), 
('Archivado');

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

INSERT INTO pv_statusEtapaProyecto(nombre, descripcion) VALUES
('Planificada', 'Etapa que todavía no está en ejecución pero ya está confirmada'),
('Borrador', 'Etapa que está en periodo de preplanificación, sometida a cambios y puede variar drásticamente'),
('Desarrollo', 'Etapa que está actualmente en ejecución'),
('Finalizada', 'Etapa que ya finalizó y cumplió todos sus objetivos'),
('Revisión', 'Etapa donde el proyecto está sometido a evaluación de cumplimiento')

INSERT INTO pv_statusRegistro(nombre) VALUES
('Pendiente'),
('Registrado'),
('Rechazado'),
('En Proceso')
-- statusRegistroUsuarios
DECLARE @cont INT = 1
DECLARE @contMax INT = (SELECT COUNT(1) FROM pv_usuarios)
WHILE @cont <= @contMax
BEGIN
	INSERT INTO pv_statusRegistroUsuarios (usuarioID, statusRegistroID, ultimaModificacion) VALUES
	(@cont, 2, DATEADD(DAY, RAND() * DATEDIFF(DAY, '2020/01/01 00:00:00', GETDATE()), '2020/01/01 00:00:00'))
	SET @cont = @cont+1
END
SET @cont = 1
WHILE @cont <= 100 -- Cambiamos algunos registros para que no todos estén registrados
BEGIN 
    UPDATE pv_statusRegistroUsuarios
    SET statusRegistroID = 1 + FLOOR(RAND() * 4), -- número random entre 1 y 4
        ultimaModificacion = GETDATE() 
    WHERE usuarioID = 1 + FLOOR(RAND() * @contMax) -- número random entre 1 y 1000 (@contMax)
    SET @cont = @cont + 1
END
GO
-- statusRegistroUsuariosOrgs
DECLARE @cont INT = 1
DECLARE @contMax INT = (SELECT COUNT(1) FROM pv_organizaciones)
WHILE @cont <= @contMax
BEGIN
	INSERT INTO pv_statusRegistroOrgs(organizacionID, statusRegistroID, ultimaModificacion) VALUES
	(@cont, 2, DATEADD(DAY, RAND() * DATEDIFF(DAY, '2020/01/01 00:00:00', GETDATE()), '2020/01/01 00:00:00'))
	SET @cont = @cont+1
END
SET @cont = 1
WHILE @cont <= 100 -- Cambiamos algunos registros para que no todos estén registrados
BEGIN 
    UPDATE pv_statusRegistroUsuarios
    SET statusRegistroID = 1 + FLOOR(RAND() * 4), -- número random entre 1 y 4
        ultimaModificacion = GETDATE() 
    WHERE usuarioID = 1 + FLOOR(RAND() * @contMax) -- número random entre 1 y 1000 (@contMax)
    SET @cont = @cont + 1
END
GO

DECLARE @minProyectoID INT, @maxProyectoID INT;
DECLARE @minStatusEtapaProyID INT, @maxStatusEtapaProyID INT;
DECLARE @minMonedaID INT, @maxMonedaID INT;

SELECT @minProyectoID = MIN(proyectoID), @maxProyectoID = MAX(proyectoID) FROM pv_proyecto;

SELECT @minStatusEtapaProyID = MIN(statusEtapaProyID), @maxStatusEtapaProyID = MAX(statusEtapaProyID) FROM pv_statusEtapaProyecto;

SELECT @minMonedaID = MIN(monedaID), @maxMonedaID = MAX(monedaID) FROM pv_moneda;

CREATE TABLE #NombresEtapas (
    NombreEtapa VARCHAR(50)
);

INSERT INTO #NombresEtapas (NombreEtapa) VALUES
('Planificación Inicial'),
('Diseño de Solución'),
('Desarrollo y Codificación'),
('Pruebas de Integración'),
('Implementación Piloto'),
('Lanzamiento a Gran Escala'),
('Monitoreo y Ajustes'),
('Cierre del Proyecto'),
('Evaluación Post-Implementación'),
('Captación de Fondos');

DECLARE @i INT = 1;


DECLARE @fechaInicio DATETIME;
DECLARE @fechaFin DATETIME;
DECLARE @duracion FLOAT;
DECLARE @nombreEtapa VARCHAR(50);
DECLARE @inversion DECIMAL(18, 2);
DECLARE @randomProyectoID INT;
DECLARE @randomStatusEtapaProyID INT;
DECLARE @randomMonedaID INT;
DECLARE @checksum VARBINARY(256);

WHILE @i <= 50
BEGIN
    SET @randomProyectoID = FLOOR(RAND() * (@maxProyectoID - @minProyectoID + 1)) + @minProyectoID;
    SET @randomStatusEtapaProyID = FLOOR(RAND() * (@maxStatusEtapaProyID - @minStatusEtapaProyID + 1)) + @minStatusEtapaProyID;
    SET @randomMonedaID = FLOOR(RAND() * (@maxMonedaID - @minMonedaID + 1)) + @minMonedaID;

    SET @fechaInicio = DATEADD(day, -CAST(RAND() * 730 AS INT), GETDATE()); -- ultimos 2 años
    SET @fechaInicio = DATEADD(hour, CAST(RAND() * 24 AS INT), @fechaInicio);
    SET @fechaInicio = DATEADD(minute, CAST(RAND() * 60 AS INT), @fechaInicio);

    SET @duracion = FLOOR(RAND() * 174) + 7;
    SET @fechaFin = DATEADD(day, @duracion, @fechaInicio);
    SELECT TOP 1 @nombreEtapa = NombreEtapa FROM #NombresEtapas ORDER BY RAND();

    -- inversion estimada aleatoria entre mil y un millon
    SET @inversion = ROUND(RAND() * 999000 + 1000, 2);

    -- checksum
    SET @checksum = HASHBYTES('SHA2_256', CAST(@fechaInicio AS VARCHAR(50)) + @nombreEtapa + CAST(@i AS VARCHAR(10)));

    INSERT INTO pv_etapasProyecto (
        [proyectoID],
        [nombre],
        [fechaInicio],
        [fechaFin],
        [statusEtapaProyID],
        [inversionEstimada],
        [monedaID],
        [checksum],
        [duracion]
    )
    VALUES (
        @randomProyectoID,
        @nombreEtapa,
        @fechaInicio,
        @fechaFin,
        @randomStatusEtapaProyID,
        @inversion,
        @randomMonedaID,
        @checksum,
        @duracion
    );

    SET @i = @i + 1;
END;
DROP TABLE #NombresEtapas;
GO

DECLARE @minWorkFlowID INT, @maxWorkFlowID INT;
CREATE TABLE #Nombres (NombreProceso VARCHAR(50));
INSERT INTO #Nombres (NombreProceso) VALUES
('Verificación de Identidad'),
('Aprobación de Solicitudes'),
('Gestión de Quejas Ciudadanas'),
('Procesamiento de Pagos'),
('Análisis de Cumplimiento'),
('Registro de Nuevo Usuario'),
('Monitoreo de Documentos'),
('Automatización de Informes'),
('Revisión de Expedientes'),
('Validación de Contratos');

CREATE TABLE #URLs (URL VARCHAR(200));
INSERT INTO #URLs (URL) VALUES
('https://workflow.example.com/id_verify_flow'),
('https://workflow.example.com/approval_service'),
('https://workflow.example.com/complaint_process'),
('https://workflow.example.com/payment_gateway'),
('https://workflow.example.com/compliance_check'),
('https://workflow.example.com/user_onboarding'),
('https://workflow.example.com/doc_monitor_api'),
('https://workflow.example.com/report_automation'),
('https://workflow.example.com/exp_review_engine'),
('https://workflow.example.com/contract_validator');

CREATE TABLE #Configs (Config VARCHAR(3000));
INSERT INTO #Configs (Config) VALUES
('{"version": "1.0", "steps": ["validate_id", "cross_check_db", "notify_user"]}'),
('{"timeout": 300, "retry_count": 3, "notify_admin_on_fail": true}'),
('{"queue": "citizenship_queue", "priority": "high", "escalation_level": "L2"}'),
('{"payment_provider": "stripe", "currency": "USD", "callback_url": "https://myapp.com/payment_status"}'),
('{"ruleset": "GDPR_2024_v1", "audit_log_enabled": true}'),
('{"welcome_email_template": "welcome_v2", "initial_role": "basic_user"}'),
('{"doc_type": "passport", "scan_interval_hours": 24, "alert_threshold": 0.95}'),
('{"report_format": "PDF", "recipients": ["manager@example.com"], "schedule": "monthly"}'),
('{"review_criteria": ["legal_compliance", "data_accuracy"], "reviewer_group": "legal_team"}'),
('{"validation_model": "contract_v3", "deviation_threshold": 0.05}');

DECLARE @i INT = 1;

DECLARE @randomNombre VARCHAR(50);
DECLARE @randomURL VARCHAR(200);
DECLARE @randomConfigJSON VARCHAR(3000);
DECLARE @randomUltimaActualizacion DATETIME;
DECLARE @randomEnabled BIT;

WHILE @i <= 100
BEGIN
    SELECT TOP 1 @randomNombre = NombreProceso FROM #Nombres ORDER BY RAND();
    SELECT TOP 1 @randomURL = URL FROM #URLs ORDER BY RAND();
    SELECT TOP 1 @randomConfigJSON = Config FROM #Configs ORDER BY RAND();

    SET @randomUltimaActualizacion = DATEADD(day, -CAST(RAND() * 365 AS INT), GETDATE());
    SET @randomUltimaActualizacion = DATEADD(hour, CAST(RAND() * 24 AS INT), @randomUltimaActualizacion);
    SET @randomUltimaActualizacion = DATEADD(minute, CAST(RAND() * 60 AS INT), @randomUltimaActualizacion);

    SET @randomEnabled = CAST(FLOOR(RAND() * 2) AS BIT);

    INSERT INTO [dbo].[pv_wfProceso] (
        [nombre],
        [wfURL],
        [configJSON],
        [ultimaActualizacion],
        [enabled]
    )
    VALUES (
        @randomNombre,
        @randomURL,
        @randomConfigJSON,
        @randomUltimaActualizacion,
        @randomEnabled
    );

    SET @i = @i + 1;
END;

DROP TABLE #Nombres;
DROP TABLE #URLs;
DROP TABLE #Configs;
GO

INSERT INTO pv_sectorProfesion (nombre) VALUES
('Ingeniería'),('Derecho'),
('Finanzas'),('Construcción'),
('Agricultura'),('Gastronomía'),
('Medios de Comunicación'),('Diseño Gráfico'),
('Recursos Humanos'),('Logística'),
('Biotecnología'),('Energías Renovables'),
('Turismo'),('Moda'),
('Consultoría'),('Seguros'),
('Arquitectura'),('Farmacéutica'),
('Automotriz'),('Aeroespacial'),
('Videojuegos'),('Inteligencia Artificial'),
('Ciberseguridad'),('Economía'),
('Psicología'),('Veterinaria'),
('Medio Ambiente'),('Deportes'),
('Música'),('Cine y Televisión'),
('Relaciones Públicas'),('Comercio Electrónico'),
('Blockchain'),('Nanotecnología'),
('Robótica');

INSERT INTO pv_severidadIncumplimiento VALUES
('Leve'),('Moderado'),('Grave')

INSERT INTO pv_tipoIncumplimiento (nombre, severidadIncumplimientoID) VALUES
-- Incumplimientos en entregables de sprints
('Retraso en entrega de sprint (1-3 días)', 1),
('Retraso en entrega de sprint (4-7 días)', 2),
('Retraso en entrega de sprint (+8 días)', 3),
('Entrega incompleta de sprint', 2),
('Entrega falsa de objetivos de sprint', 3),
('No presentación de avances de sprint', 3),
('Justificación insuficiente de retraso', 1),

-- Incumplimientos en reportes financieros
('Retraso en reporte financiero (1-7 días)', 1),
('Retraso en reporte financiero (+7 días)', 2),
('Reporte financiero incompleto', 2),
('Reporte financiero con errores graves', 3),
('Falsificación de reporte financiero', 3),
('Omisión de gastos en reporte', 3),

-- Incumplimientos en uso de fondos
('Desvío menor de fondos (<10% presupuesto)', 2),
('Desvío mayor de fondos (10-30% presupuesto)', 3),
('Desvío crítico de fondos (>30% presupuesto)', 3),
('Uso de fondos para ítems no aprobados', 3),
('Falta de comprobantes de gastos', 2),


-- Incumplimientos en comunicación
('Falta de comunicación (1 semana)', 1),
('Falta de comunicación (2-3 semanas)', 2),
('Falta de comunicación (+1 mes)', 3),
('Información engañosa a inversionistas', 3),
('Ocultamiento de problemas del proyecto', 3),

-- Incumplimientos en calidad
('Baja calidad en entregables', 2),
('Entregables no funcionales', 3),
('Incumplimiento de especificaciones', 2),
('Uso de materiales no aprobados', 2),
('Reducción no autorizada de calidad', 3),

-- Incumplimientos en transparencia
('Limitación de acceso a fiscalizadores', 2),
('Ocultamiento de información clave', 3),
('Falsificación de evidencias de avance', 3),
('Manipulación de datos de progreso', 3);

-- ocupa etapasProyecto y criteriosExito 

DECLARE @minEtapaProyectoID INT, @maxEtapaProyectoID INT;
DECLARE @minCriterioExitoID INT, @maxCriterioExitoID INT;

-- rango etapaProyecto IDs
SELECT @minEtapaProyectoID = MIN(etapaProyectoID), @maxEtapaProyectoID = MAX(etapaProyectoID) 
FROM pv_etapasProyecto;

--  rango criterioExito IDs
SELECT @minCriterioExitoID = MIN(criterioExitoID), @maxCriterioExitoID = MAX(criterioExitoID) 
FROM pv_criteriosExito;

-- tabla temp
CREATE TABLE #ObjetivosDescripciones (
    Descripcion VARCHAR(500)
);

INSERT INTO #ObjetivosDescripciones (Descripcion) VALUES
('Definir alcance y objetivos claros del proyecto con participación comunitaria'),
('Diseñar solución técnica que cumpla con requerimientos legales y de seguridad'),
('Implementar funcionalidades básicas del sistema de votación electrónica'),
('Validar integración entre módulos principales del sistema'),
('Desplegar versión piloto en comunidad seleccionada para pruebas reales'),
('Expandir implementación a nivel nacional con monitoreo constante'),
('Ajustar sistema basado en feedback de usuarios y auditorías'),
('Documentar lecciones aprendidas y cerrar formalmente el proyecto'),
('Evaluar impacto del proyecto 6 meses después de implementación'),
('Recaudar fondos necesarios para financiar todas las etapas del proyecto'),
('Garantizar participación inclusiva de todos los grupos demográficos'),
('Implementar mecanismos de transparencia y rendición de cuentas'),
('Asegurar accesibilidad para personas con discapacidad'),
('Capacitar a usuarios finales en el uso de la plataforma'),
('Establecer alianzas estratégicas con organizaciones locales'),
('Desarrollar materiales educativos sobre el sistema de votación'),
('Crear protocolos de contingencia para posibles fallas'),
('Implementar sistema de monitoreo en tiempo real'),
('Garantizar cumplimiento de normativas de protección de datos'),
('Establecer métricas de éxito para cada fase del proyecto');

-- objetivos random
DECLARE @i INT = 1;
DECLARE @randomEtapaProyectoID INT;
DECLARE @randomCriterioExitoID INT;
DECLARE @descripcion VARCHAR(500);
DECLARE @fechaCreacion DATETIME;

WHILE @i <= 100
BEGIN
    SET @randomEtapaProyectoID = FLOOR(RAND() * (@maxEtapaProyectoID - @minEtapaProyectoID + 1)) + @minEtapaProyectoID;
    
    SET @randomCriterioExitoID = FLOOR(RAND() * (@maxCriterioExitoID - @minCriterioExitoID + 1)) + @minCriterioExitoID;
    
    SELECT TOP 1 @descripcion = Descripcion FROM #ObjetivosDescripciones ORDER BY RAND();
    
    SET @fechaCreacion = DATEADD(day, -CAST(RAND() * 730 AS INT), GETDATE());
    SET @fechaCreacion = DATEADD(hour, CAST(RAND() * 24 AS INT), @fechaCreacion);
    SET @fechaCreacion = DATEADD(minute, CAST(RAND() * 60 AS INT), @fechaCreacion);
    
    INSERT INTO pv_objetivosEtapa (
        [descripcion],
        [etapaProyectoID],
        [fechaCreacion],
        [criterioExitoID]
    )
    VALUES (
        @descripcion,
        @randomEtapaProyectoID,
        @fechaCreacion,
        @randomCriterioExitoID
    );
    
    SET @i = @i + 1;
END;

DROP TABLE #ObjetivosDescripciones;

DECLARE @existingEtapaID INT;
DECLARE @existingCriterioID INT;

SELECT TOP 1 @existingEtapaID = etapaProyectoID FROM pv_etapasProyecto ORDER BY NEWID();
SELECT TOP 1 @existingCriterioID = criterioExitoID FROM pv_criteriosExito ORDER BY NEWID();

INSERT INTO pv_objetivosEtapa (
    [descripcion],
    [etapaProyectoID],
    [fechaCreacion],
    [criterioExitoID]
)
VALUES
('Recaudar el 50% del financiamiento requerido para el proyecto', @existingEtapaID, GETDATE(), @existingCriterioID),
('Validar propuesta con al menos 3 grupos inversores', @existingEtapaID, GETDATE(), @existingCriterioID),
('Obtener aval gubernamental para beneficios fiscales', @existingEtapaID, GETDATE(), @existingCriterioID),
('Alcanzar meta de inversión ciudadana en plazo establecido', @existingEtapaID, GETDATE(), @existingCriterioID),
('Mantener transparencia en el 100% de los desembolsos', @existingEtapaID, GETDATE(), @existingCriterioID),
('Generar reportes financieros mensuales para inversionistas', @existingEtapaID, GETDATE(), @existingCriterioID),
('Implementar sistema de fiscalización comunitaria', @existingEtapaID, GETDATE(), @existingCriterioID),
('Garantizar retorno de inversión según cronograma pactado', @existingEtapaID, GETDATE(), @existingCriterioID);
GO

IF OBJECT_ID('tempdb..#DescripcionesIncumplimiento') IS NOT NULL DROP TABLE #DescripcionesIncumplimiento;
CREATE TABLE #DescripcionesIncumplimiento (Descripcion NVARCHAR(MAX));
INSERT INTO #DescripcionesIncumplimiento (Descripcion) VALUES
('Retraso en la entrega de la documentación de la fase de planificación.'),
('El presupuesto de la fase de diseño excedió en un 15% lo estimado inicialmente.'),
('Funcionalidad crítica del módulo de registro de usuarios no operativa tras las pruebas iniciales.'),
('La calidad del entregable A no cumple con los estándares mínimos definidos en el alcance del proyecto.'),
('Baja participación en las encuestas de satisfacción de la etapa piloto del proyecto social.'),
('El nivel de adopción del nuevo sistema por parte de los beneficiarios está por debajo del 50%.'),
('No se logró el ROI esperado para la fase de implementación inicial.'),
('Los costos operativos no se redujeron como se había proyectado en la etapa de análisis.'),
('La eficiencia del proceso clave X disminuyó un 5% en lugar de aumentar.'),
('Incumplimiento parcial de la normativa Z debido a un error en la implementación del control.'),
('El sistema experimentó una caída inesperada del 5% del tiempo de actividad en la última semana.'),
('Se detectaron 12 defectos críticos en la fase de pruebas de integración, superando el límite de 5.'),
('La arquitectura actual no permite la escalabilidad proyectada para el próximo año.'),
('El 20% del personal clave no ha completado la capacitación requerida para la nueva solución.'),
('Fallo en la auditoría de seguridad de datos por vulnerabilidades detectadas en la fase de desarrollo.'),
('La recolección de datos de participación comunitaria es insuficiente para verificar el criterio.'),
('No se observó mejora en los indicadores de calidad de vida específicos de la comunidad.'),
('Un 10% de los grupos vulnerables aún no tienen acceso a los servicios esenciales del proyecto.'),
('El impacto social positivo no es medible en las tres áreas clave definidas.'),
('Los mecanismos de sostenibilidad a largo plazo no fueron establecidos al finalizar la fase de financiación.'),
('Retraso en la publicación de los informes financieros del proyecto, afectando la transparencia.'),
('El índice de satisfacción de beneficiarios no alcanzó el 80% esperado.'),
('El proyecto se desvió de las necesidades prioritarias identificadas por la comunidad.'),
('La información del proyecto no llegó al 90% de la población objetivo.'),
('El sistema de retroalimentación ciudadana no se implementó correctamente.'),
('La brecha social no se redujo según lo proyectado en el plan inicial.'),
('No se establecieron alianzas estratégicas con las organizaciones comunitarias clave.'),
('La inversión no se justificó con los beneficios sociales obtenidos en la fase piloto.'),
('Los líderes comunitarios formados no alcanzaron el número mínimo esperado.'),
('Falta de un plan de contingencia claro para riesgos inesperados en la fase de ejecución.');
GO

DECLARE @i INT = 1;

DECLARE @randomTipoIncumplimiento INT;
DECLARE @randomEstadoIncumplimientoID INT;
DECLARE @randomObjetivoEtapaID INT;
DECLARE @randomFechaReporte DATETIME;
DECLARE @selectedDescripcion NVARCHAR(MAX);
DECLARE @minObjetivoEtapaID INT, @maxObjetivoEtapaID INT;
SELECT @minObjetivoEtapaID = MIN(etapaProyectoID), @maxObjetivoEtapaID = MAX(etapaProyectoID) FROM pv_etapasProyecto;
WHILE @i <= 100
BEGIN
    SET @randomTipoIncumplimiento = FLOOR(RAND() * 5) + 1;
    SET @randomEstadoIncumplimientoID = FLOOR(RAND() * 3) + 1;
	
    SET @randomObjetivoEtapaID = FLOOR(RAND() * (@maxObjetivoEtapaID - @minObjetivoEtapaID + 1)) + @minObjetivoEtapaID;

    SET @randomFechaReporte = DATEADD(day, -FLOOR(RAND() * 365), GETDATE());
    SET @randomFechaReporte = DATEADD(hour, FLOOR(RAND() * 24), @randomFechaReporte);
    SET @randomFechaReporte = DATEADD(minute, FLOOR(RAND() * 60), @randomFechaReporte);

    SELECT TOP 1 @selectedDescripcion = Descripcion FROM #DescripcionesIncumplimiento ORDER BY RAND();

    INSERT INTO [dbo].[pv_incumplimiento] (
        [tipoIncumplimiento],
        [descripcion],
        [fechaReporte],
        [estadoIncumplimientoID],
        [objetivoEtapaID]
    )
    VALUES (
        @randomTipoIncumplimiento,
        @selectedDescripcion,
        @randomFechaReporte,
        @randomEstadoIncumplimientoID,
        @randomObjetivoEtapaID
    );

    SET @i = @i + 1;
END;

DROP TABLE #DescripcionesIncumplimiento;
GO

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
GO

INSERT INTO pv_documentoProyecto(proyectoID, documentoID, esActivo)
SELECT 
	   p.proyectoID, 
	   (SELECT TOP 1 documentoID FROM dbo.pv_documento ORDER BY NEWID()) AS documentoID,
	   1 as esActivo	
FROM pv_proyecto p 

INSERT INTO pv_documentosOrgs(organizacionID, documentoID, esActivo)
SELECT 
	   o.organizacionid, 
	   (SELECT TOP 1 documentoID FROM dbo.pv_documento ORDER BY NEWID()) AS documentoID,
	   1 as esActivo	
FROM pv_organizaciones o 
INSERT INTO pv_documentosPropuestas(propuestaID, documentoID, esActivo)
SELECT 
	   p.propuestaid, 
	   (SELECT TOP 1 documentoID FROM dbo.pv_documento ORDER BY NEWID()) AS documentoID,
	   1 as esActivo	
FROM pv_propuestas p 

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

INSERT INTO dbo.pv_pesoRespuesta (nombre, multiplicador) VALUES
('Doble', 2.00),
('Normal', 1.00),
('No Válido', 0.00),
('Triple', 3.00),
('Uno y medio', 1.50),
('Un cuarto', 0.25),
('Un medio', 0.50),
('Tres cuartos', 0.75),
('Por 10', 10.00);

INSERT INTO pv_tipoaval (nombreTipo) VALUES
('Aval de Viabilidad Técnica'),
('Aval de Impacto Social'),
('Aval de Sostenibilidad Ambiental'),
('Aval de Alineamiento con Políticas Públicas'),
('Aval de Innovación y Desarrollo Tecnológico'),
('Aval de Beneficio Económico Regional'),
('Aval de Creación de Empleo'),
('Aval de Interés Nacional'),
('Aval de Prioridad Estratégica'),
('Aval de Cumplimiento Regulatorio'),
('Aval de Inclusión Social'),
('Aval de Desarrollo Territorial'),
('Aval de Sostenibilidad Financiera'),
('Aval de Transferencia Tecnológica'),
('Aval de Protección de Datos y Privacidad');

INSERT INTO pv_solicitudCambio (propuestaid, cambioPlanteado, fechaSolicitud) 
VALUES
-- Cambios solicitados para la propuesta de transporte (ID 5)
(1, 'Ampliar la propuesta para incluir estaciones de carga para buses eléctricos en las nuevas rutas propuestas.', '2025-06-15 10:30:00'),
(1, 'Modificar el diseño de los carriles para bicicletas para hacerlos más seguros, con separación física del tráfico vehicular.', '2025-06-20 14:15:00'),

-- Cambios solicitados para la propuesta de becas (ID 6)
(2, 'Extender el programa de becas para incluir también a estudiantes de colegios técnicos profesionales.', '2025-06-18 09:45:00'),
(2, 'Aumentar el monto asignado para materiales educativos en un 20% debido al incremento en los precios.', '2025-06-22 16:20:00'),

-- Cambios solicitados para la propuesta de clínicas móviles (ID 7)
(3, 'Incluir servicios de salud mental en las clínicas móviles, con al menos un psicólogo por equipo.', '2025-06-10 11:10:00'),
(3, 'Extender el horario de atención hasta las 8 pm para facilitar el acceso a trabajadores.', '2025-06-25 13:30:00'),

-- Cambios solicitados para la propuesta de reforestación (ID 8)
(4, 'Priorizar áreas cercanas a fuentes de agua en el plan de reforestación.', '2025-06-12 10:00:00'),
(4, 'Incluir un programa educativo paralelo sobre conservación ambiental en las comunidades participantes.', '2025-06-28 15:45:00'),

-- Cambios solicitados para la propuesta de centros de innovación (ID 9)
(5, 'Añadir un programa de mentoría con empresarios exitosos locales en cada centro.', '2025-06-14 12:20:00'),
(5, 'Incluir equipamiento especializado para desarrollo de inteligencia artificial en los centros.', '2025-06-30 10:00:00'),

-- Cambios solicitados para la propuesta de apoyo a artistas (ID 10)
(6, 'Ampliar los criterios de selección para incluir artistas de disciplinas menos tradicionales.', '2025-06-16 14:00:00'),
(6, 'Crear un fondo adicional para la promoción internacional de los artistas seleccionados.', '2025-07-01 11:30:00');
GO

DECLARE @propuestaCount INT = 6;
DECLARE @comentariosPorPropuesta INT = 8; -- 50/6 es casi 8 
DECLARE @detalleComentarioID INT = 1;
DECLARE @propuestaID INT = 1;

WHILE @detalleComentarioID <= 50
BEGIN
    INSERT INTO [dbo].[pv_comentariosPropuesta] 
    ([detalleComentarioID], [estadoComentid], [propuestaid])
    VALUES (@detalleComentarioID, 2, @propuestaID);
    SET @detalleComentarioID = @detalleComentarioID + 1;
    IF @detalleComentarioID % 8 = 0 AND @propuestaID < @propuestaCount -- esto es para cambiar de propuesta cada 8 comments para distribucion uniforme
        SET @propuestaID = @propuestaID + 1;
END
UPDATE [dbo].[pv_comentariosPropuesta] SET [propuestaid] = 1 
WHERE [comentarioid] BETWEEN 1 AND 8;
UPDATE [dbo].[pv_comentariosPropuesta] SET [propuestaid] = 2 
WHERE [comentarioid] BETWEEN 9 AND 16;
UPDATE [dbo].[pv_comentariosPropuesta] SET [propuestaid] = 3 
WHERE [comentarioid] BETWEEN 17 AND 24;
UPDATE [dbo].[pv_comentariosPropuesta] SET [propuestaid] = 4 
WHERE [comentarioid] BETWEEN 25 AND 33;
UPDATE [dbo].[pv_comentariosPropuesta] SET [propuestaid] = 5 
WHERE [comentarioid] BETWEEN 34 AND 42;
UPDATE [dbo].[pv_comentariosPropuesta] SET [propuestaid] = 6 
WHERE [comentarioid] BETWEEN 43 AND 50;
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
GO

DECLARE @proyectoCount INT = 6;
DECLARE @comentariosPorProyecto INT = 8;
DECLARE @detalleComentarioID INT = 51;
DECLARE @proyectoID INT = 1;
WHILE @detalleComentarioID <= 100
BEGIN
    INSERT INTO [dbo].[pv_comentariosProyecto] 
    ([detalleComentarioID], [estadoCommentid], [proyectoID])
    VALUES (@detalleComentarioID, 2, @proyectoID);
    SET @detalleComentarioID = @detalleComentarioID + 1;
    IF (@detalleComentarioID - 50) % 8 = 0 AND @proyectoID < @proyectoCount
        SET @proyectoID = @proyectoID + 1;
END
UPDATE [dbo].[pv_comentariosProyecto] SET [proyectoID] = 1 
WHERE [detalleComentarioID] BETWEEN 51 AND 58;
UPDATE [dbo].[pv_comentariosProyecto] SET [proyectoID] = 2 
WHERE [detalleComentarioID] BETWEEN 59 AND 66;
UPDATE [dbo].[pv_comentariosProyecto] SET [proyectoID] = 3 
WHERE [detalleComentarioID] BETWEEN 67 AND 74;
UPDATE [dbo].[pv_comentariosProyecto] SET [proyectoID] = 4 
WHERE [detalleComentarioID] BETWEEN 75 AND 83;
UPDATE [dbo].[pv_comentariosProyecto] SET [proyectoID] = 5 
WHERE [detalleComentarioID] BETWEEN 84 AND 91;
UPDATE [dbo].[pv_comentariosProyecto] SET [proyectoID] = 6 
WHERE [detalleComentarioID] BETWEEN 92 AND 100;
GO

INSERT INTO pv_metodoPruebas
VALUES ('Huella digital', '{}', 1),
('FaceID', '{}', 2),
('Reconocimiento de Voz', '{}', 3),
('Video', '{}', 4)

DECLARE @cont INT = 1000
WHILE @cont > 0
BEGIN
	INSERT INTO pv_sesiones VALUES
	(LOWER(CONVERT(VARCHAR(36), NEWID())),-- el NEWID genera un id único como tipo una cadena random pero única
	HASHBYTES('SHA2_256', CAST(@cont AS VARCHAR(10))),
	HASHBYTES('SHA2_256', CAST(@cont+1 AS VARCHAR(10))),
	GETDATE(),
	DATEADD(MINUTE, 30, GETDATE()),
	@cont,
	1 + FLOOR(RAND() * 3)) -- Número random entre 1 y 3
	SET @cont = @cont-1
END

DECLARE @OrganizacionID INT = 1
DECLARE @UsuarioBase INT = 1
DECLARE @Usuario1 INT
DECLARE @Usuario2 INT
WHILE @OrganizacionID <= 100
BEGIN
    SET @Usuario1 = @UsuarioBase
    SET @Usuario2 = @UsuarioBase + 1
    INSERT INTO [dbo].[pv_orgUsuariosRepresentantes] (usuarioID, organizacionID, esActivo, ultimaModificacion, documentoID)
    VALUES (@Usuario1, @OrganizacionID, 1, GETDATE(), @Usuario1), -- Insertamos el userid actual y el que sigue
    (@Usuario2, @OrganizacionID, 1, GETDATE(), @Usuario2)         -- Insertamos 2 users por Org
    SET @OrganizacionID = @OrganizacionID + 1
    SET @UsuarioBase = @UsuarioBase + 2
END
GO

DECLARE @cont INT = (SELECT COUNT(*) FROM pv_wfProceso)
WHILE @cont > 0 
BEGIN
INSERT INTO pv_accionesIA
VALUES (FLOOR(1+RAND()*50), @cont)
SET @cont = @cont-1
END

INSERT INTO [dbo].[pv_proponente] ([propuestaID], [usuarioID], [organizacionID], [esPrincipal])
VALUES 
(1, FLOOR(RAND()*1000) + 1, NULL, 1),
(1, FLOOR(RAND()*1000) + 1, NULL, 0),
(1, FLOOR(RAND()*1000) + 1, NULL, 0)
INSERT INTO [dbo].[pv_proponente] ([propuestaID], [usuarioID], [organizacionID], [esPrincipal])
VALUES 
(2, FLOOR(RAND()*1000) + 1, NULL, 1),
(2, FLOOR(RAND()*1000) + 1, NULL, 0)
INSERT INTO [dbo].[pv_proponente] ([propuestaID], [usuarioID], [organizacionID], [esPrincipal])
VALUES 
(3, FLOOR(RAND()*1000) + 1, NULL, 1), 
(3, FLOOR(RAND()*1000) + 1, NULL, 0),
(3, FLOOR(RAND()*1000) + 1, NULL, 0)
INSERT INTO [dbo].[pv_proponente] ([propuestaID], [usuarioID], [organizacionID], [esPrincipal])
VALUES 
(4, FLOOR(RAND()*1000) + 1, NULL, 1), 
(4, FLOOR(RAND()*1000) + 1, NULL, 0)
INSERT INTO [dbo].[pv_proponente] ([propuestaID], [usuarioID], [organizacionID], [esPrincipal])
VALUES 
(5, FLOOR(RAND()*1000) + 1, NULL, 1), 
(5, FLOOR(RAND()*1000) + 1, NULL, 0),
(5, FLOOR(RAND()*1000) + 1, NULL, 0)
INSERT INTO [dbo].[pv_proponente] ([propuestaID], [usuarioID], [organizacionID], [esPrincipal])
VALUES 
(6, FLOOR(RAND()*1000) + 1, NULL, 1), 
(6, FLOOR(RAND()*1000) + 1, NULL, 0)
GO


-- Declaración de variables para rangos de IDs
DECLARE @minEtapaProyectoID INT, @maxEtapaProyectoID INT;

-- Obtener los rangos de IDs de etapas de proyecto
SELECT @minEtapaProyectoID = MIN(etapaProyectoID), @maxEtapaProyectoID = MAX(etapaProyectoID) FROM pv_etapasProyecto;

-- Tabla temporal con nombres de tareas comunes
CREATE TABLE #NombresTareas (
    Titulo VARCHAR(100),
    Descripcion VARCHAR(500)
);

-- Insertar ejemplos de tareas con sus descripciones
INSERT INTO #NombresTareas (Titulo, Descripcion) VALUES
('Reunión de planificación', 'Definir objetivos y alcance de la etapa'),
('Diseño de arquitectura', 'Crear diagramas y especificaciones técnicas'),
('Desarrollo de prototipo', 'Implementar versión inicial para validación'),
('Pruebas unitarias', 'Verificar funcionamiento de componentes individuales'),
('Integración continua', 'Configurar pipeline de integración y despliegue'),
('Documentación técnica', 'Elaborar manuales y guías para desarrolladores'),
('Capacitación de equipo', 'Entrenar al personal en nuevas tecnologías'),
('Revisión de código', 'Analizar calidad y estándares de implementación'),
('Pruebas de rendimiento', 'Evaluar capacidad de respuesta bajo carga'),
('Optimización', 'Ajustar parámetros para mejorar eficiencia'),
('Preparación de entorno', 'Configurar servidores y servicios necesarios'),
('Migración de datos', 'Transferir información de sistemas anteriores'),
('Monitoreo inicial', 'Establecer métricas y sistemas de alerta'),
('Retroalimentación usuarios', 'Recopilar opiniones de usuarios piloto'),
('Ajustes post-implementación', 'Corregir problemas identificados después del lanzamiento'),
('Plan de contingencia', 'Elaborar estrategias para manejo de riesgos'),
('Presupuesto detallado', 'Desglosar costos por áreas y recursos'),
('Cronograma de actividades', 'Definir fechas clave y dependencias'),
('Evaluación de proveedores', 'Seleccionar socios tecnológicos adecuados'),
('Plan de comunicación', 'Establecer canales y frecuencia de reportes');

-- Variables para el loop
DECLARE @i INT = 1;
DECLARE @randomEtapaProyectoID INT;
DECLARE @titulo VARCHAR(100);
DECLARE @descripcion VARCHAR(500);

-- Generar 100 tareas aleatorias
WHILE @i <= 100
BEGIN
    -- Seleccionar una etapa de proyecto aleatoria
    SET @randomEtapaProyectoID = FLOOR(RAND() * (@maxEtapaProyectoID - @minEtapaProyectoID + 1)) + @minEtapaProyectoID;
    
    -- Seleccionar un nombre y descripción de tarea aleatorios
    SELECT TOP 1 @titulo = Titulo, @descripcion = Descripcion 
    FROM #NombresTareas 
    ORDER BY RAND();
    
    -- Insertar la tarea en la tabla
    INSERT INTO pv_tareasEtapa (
        
        [titulo],
        [descripcion],
        [etapaProyectoID]
    )
    VALUES (
        @titulo,
        @descripcion,
        @randomEtapaProyectoID
    );
    
    SET @i = @i + 1;
END;

-- Limpiar tabla temporal
DROP TABLE #NombresTareas;
SET IDENTITY_INSERT [dbo].[pv_llavesUsuarios] OFF;
DECLARE @usuarioID INT = 1;
DECLARE @maxUsuarioID INT = (SELECT COUNT(*) FROM pv_usuarios); -- Aqui se puede ajustar segun el max cantidad de users
DECLARE @S1 VARCHAR(50);
DECLARE @S2 VARCHAR(100);
DECLARE @ncKEY VARBINARY(256);

WHILE @usuarioID <= @maxUsuarioID
BEGIN
    SET @S1 = (     -- S1 representa la contraseña y todas siguen el patrón 2 letras del Nombre, 2 de cada apellido y los últimos 4 de la cédula
        SELECT TOP 1 
            UPPER(LEFT(nombre, 2)) + 
            UPPER(LEFT(primerApellido, 2)) + 
            UPPER(LEFT(segundoApellido, 2)) + 
            RIGHT(identificacion, 4) 
        FROM pv_usuarios 
        WHERE userid = @usuarioID
    );
   
    SET @S2 = NEWID(); -- NEWID() nos genera un string único y aleatorio, lo podemos usar como llave
    
    -- Encriptar la llave
    SET @ncKEY = ENCRYPTBYPASSPHRASE(@S1, @S2); -- Encriptamos según la contraseña
    
    -- Insertar el registro en la tabla
    INSERT INTO [dbo].[pv_llavesUsuarios] (
        [llaveCifrada],
        [usuarioID],
        [esActiva],
        [ultimaModificacion]
    ) VALUES (
        @ncKEY,
        @usuarioID,
        1,  
        GETDATE() 
    );
    
    SET @usuarioID = @usuarioID + 1;
END
DECLARE @num_usuarios INT = 1000;
DECLARE @num_preguntas INT = 22;
DECLARE @current_user INT = 1;
DECLARE @current_pregunta INT;
DECLARE @respuestaID INT;
DECLARE @checksum VARBINARY(500);
DECLARE @valor VARCHAR(500);
DECLARE @fechaRespuesta DATETIME;
DECLARE @ncRespuesta VARBINARY(256);
DECLARE @tokenGUID UNIQUEIDENTIFIER;
DECLARE @pesoRespuesta INT;
DECLARE @contrasenia VARCHAR(50);
DECLARE @llaveUsuario VARCHAR(100);


CREATE TABLE #MapeoRespuestasPreguntas (
    RespuestaID INT PRIMARY KEY,
    PreguntaID INT,
	TextoRespuesta varchar(500)
);
INSERT INTO #MapeoRespuestasPreguntas (RespuestaID, PreguntaID, TextoRespuesta) VALUES
(1, 1, 'Mejorar el transporte público'),
(2, 1, 'Reducir el tráfico'),
(3, 1, 'Promover la movilidad sostenible'),
(4, 2, 'Muy importante'),
(5, 2, 'Importante'),
(6, 2, 'Regular'),
(7, 2, 'Poco Importante'),
(8, 2, 'Nada Importante'),
(9, 3, 'Sí'),
(10, 3, 'No'),
(11, 4, 'Muy urgente'),
(12, 4, 'Urgente'),
(13, 4, 'Regular'),
(14, 4, 'Poco Urgente'),
(15, 4, 'Nada Urgente'),
(16, 5, 'Libros de texto actualizados'),
(17, 6, 'Falta de personal médico especializado'),
(18, 6, 'Problemas de logística y acceso a zonas remotas'),
(19, 6, 'Financiamiento y sostenibilidad del proyecto'),
(20, 7, 'Sí'),
(21, 7, 'No'),
(22, 8, 'Acercan los servicios médicos esenciales.'),
(23, 9, '10'), 
(24, 9, '25'),
(25, 9, '789'),
(26, 9, '45'),
(27, 9, '3'),
(28, 10, 'Muy efectiva'),
(29, 10, 'Efectiva'),
(30, 10, 'Regular'),
(31, 10, 'Poco efectiva'),
(32, 10, 'Nada efectiva'),
(33, 11, 'Roble'),
(34, 11, 'Almendro'),
(35, 11, 'Cedro'),
(36, 11, 'Guanacaste'),
(37, 11, 'Ceiba'),
(38, 11, 'Pino'),
(39, 12, 'Sí'),
(40, 12, 'No'),
(41, 13, 'Aumenta la biodiversidad.'),
(42, 14, 'Programación'),
(43, 14, 'Inteligencia Artificial'),
(44, 14, 'Ciberseguridad'),
(45, 14, 'Desarrollo Web'),
(46, 14, 'Machine Learning'),
(47, 14, 'Análisis de Datos'),
(48, 15, 'Sí'),
(49, 15, 'No'),
(50, 16, 'Muy efectiva'),
(51, 16, 'Efectiva'),
(52, 16, 'Regular'),
(53, 16, 'Poco efectiva'),
(54, 16, 'Nada efectiva'),
(55, 17, 'Inteligencia Artificial.'),
(56, 18, 'Financiación de proyectos y becas'),
(57, 18, 'Espacios para exposiciones y difusión'),
(58, 19, 'Sí'),
(59, 19, 'No'),
(60, 20, 'Impulsa el talento local.'),
(61, 21, '5'), 
(62, 21, '6'),
(63, 21, '5'),
(64, 21, '48'),
(65, 21, '16'),
(66, 21, '32'),
(67, 21, '3'),
(68, 22, 'Muy accesible'),
(69, 22, 'Accesible'),
(70, 22, 'Regular'),
(71, 22, 'Poco accesible'),
(72, 22, 'Nada accesible');

-- Bucle para cada usuario, de manera que cada usuario haya contestado las 22 preguntas.
WHILE @current_user <= @num_usuarios
BEGIN
    SET @current_pregunta = 1;
    SET @tokenGUID = NEWID(); 

    WHILE @current_pregunta <= @num_preguntas
    BEGIN
        -- Seleccionar una respuesta aleatoria que pertenezca a la pregunta actual
        SELECT TOP 1 @respuestaID = mrp.RespuestaID
        FROM #MapeoRespuestasPreguntas mrp
        WHERE mrp.PreguntaID = @current_pregunta
        ORDER BY NEWID();

        SET @checksum = CONVERT(VARBINARY(500), HASHBYTES('SHA2_256', CONVERT(VARCHAR(MAX), NEWID())));

        SELECT TOP 1
            @respuestaID = mrp.RespuestaID,
            @valor = mrp.TextoRespuesta
        FROM #MapeoRespuestasPreguntas mrp
        WHERE mrp.PreguntaID = @current_pregunta
        ORDER BY NEWID();

        SET @fechaRespuesta = GETDATE();
        
		DECLARE @aa VARBINARY(255) = 
		(SELECT lo.llaveCifrada FROM pv_llavesUsuarios lo where usuarioID = @current_user);

		SET @contrasenia = (SELECT TOP 1 
            UPPER(LEFT(nombre, 2)) + 
            UPPER(LEFT(primerApellido, 2)) + 
            UPPER(LEFT(segundoApellido, 2)) + 
            RIGHT(identificacion, 4) 
        FROM pv_usuarios 
        WHERE userid = @current_user
		);

		SET @llaveUsuario = DECRYPTBYPASSPHRASE(@contrasenia, @aa)

		SET @ncRespuesta = ENCRYPTBYPASSPHRASE(@llaveUsuario, CAST(@current_user AS VARCHAR(5)) ) --ENCRIPTA LA LLAVE DEL USUARIO CON SU USER ID
        
		SELECT TOP 1 @pesoRespuesta = p.pesoID 
        FROM dbo.pv_pesoRespuesta p
        ORDER BY NEWID();

        INSERT INTO dbo.pv_respuestaParticipante (
            preguntaID,
            respuestaID,
            checksum,
            valor,
            fechaRespuesta,
            ncRespuesta,
            tokenGUID,
            pesoRespuesta
        )
        VALUES (
            @current_pregunta,
            @respuestaID,
            @checksum,
            @valor,
            @fechaRespuesta,
            @ncRespuesta,
            @tokenGUID,
            @pesoRespuesta
        );

        SET @current_pregunta = @current_pregunta + 1;
    END;

    SET @current_user = @current_user + 1;
END;
DROP TABLE #MapeoRespuestasPreguntas;
GO