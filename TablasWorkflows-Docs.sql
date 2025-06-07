use VotoPV;

CREATE TABLE pv_documento (
    documentoId       INT IDENTITY PRIMARY KEY,
    usuarioId         INT NOT NULL,
	mediaFileId		  INT NOT NULL,
    tipoDocumento     VARCHAR(50) NOT NULL,
    numeroDocumento   VARCHAR(100) NULL,
    fechaSubida       DATETIME DEFAULT SYSDATETIME(),
    estado            VARCHAR(30) DEFAULT 'pendiente',
    hashContenido     VARBINARY(64),
    validadoPor       INT NULL,
    fechaValidacion   DATETIME NULL,
    comentarioValidacion VARCHAR(500) NULL
);

ALTER TABLE pv_documento
    ADD CONSTRAINT FK_Documento_MediaFiles
    FOREIGN KEY (mediaFileId) REFERENCES pv_mediaFiles (mediaFileId)
    ON DELETE CASCADE;

CREATE TABLE pv_documentoLog (
    logId            INT IDENTITY PRIMARY KEY,
    documentoId      INT NOT NULL,
    usuarioId        INT NOT NULL,
    accion           VARCHAR(100),                -- 'subido', 'editado', 'validado', 'rechazado' etc
    detalle          VARCHAR(1000) NULL,
    timestamp        DATETIME DEFAULT SYSDATETIME(),
    ipOrigen         VARCHAR(45) NULL,            -- Para trazabilidad externa
    dispositivo      VARCHAR(100) NULL
);

ALTER TABLE pv_documentoLog
    ADD CONSTRAINT FK_DocumentoLog_Documento
    FOREIGN KEY (documentoId) REFERENCES pv_documento (documentoId)
    ON DELETE CASCADE;

CREATE TABLE pv_documentoVisual (
    visualId         INT IDENTITY PRIMARY KEY,
    documentoId      INT NOT NULL,
    verificadoPorIA  BIT DEFAULT 0,
    coincidencia     DECIMAL(5,2),
    tecnicaUsada     VARCHAR(100),
    resultadoJson    VARCHAR(MAX),
    fechaEvaluacion  DATETIME DEFAULT SYSDATETIME()
);

ALTER TABLE pv_documentoVisual
    ADD CONSTRAINT FK_DocumentoVisual_Documento
    FOREIGN KEY (documentoId) REFERENCES pv_documento (documentoId)
    ON DELETE CASCADE;


-- EVENTOS DEL SISTEMA (registro general)

CREATE TABLE pv_eventoSistema (
    eventoId         INT IDENTITY PRIMARY KEY,
    fechaEvento      DATETIME DEFAULT SYSDATETIME(),
    tipoEvento       VARCHAR(100) NOT NULL,
    entidad          VARCHAR(100) NOT NULL,
    entidadId        INT NOT NULL,
    payload          VARCHAR(MAX),
    procesado        BIT NOT NULL DEFAULT 0,
    fechaProcesado   DATETIME NULL
);

-- indices
CREATE INDEX IX_EventoSistema_Procesado ON pv_eventoSistema (procesado);
CREATE INDEX IX_EventoSistema_Entidad ON pv_eventoSistema (entidad, entidadId);



-- HISTORIAL DE WORKFLOWS

CREATE TABLE pv_workflowHistorial (
    workflowId       UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    tipoWorkflow     VARCHAR(100) NOT NULL,
    entidad          VARCHAR(100) NOT NULL, 
    entidadId        INT NOT NULL,
    fechaInicio      DATETIME DEFAULT SYSDATETIME(),
    estado           VARCHAR(50) NOT NULL DEFAULT 'pendiente',
    resultado        VARCHAR(MAX) NULL,
    fechaFin         DATETIME NULL
);

CREATE INDEX IX_Workflow_Entidad ON pv_workflowHistorial (entidad, entidadId);
CREATE INDEX IX_Workflow_Estado ON pv_workflowHistorial (estado);

-- VALIDACION POR IA

CREATE TABLE pv_validacionIA (
    validacionId     INT IDENTITY PRIMARY KEY,
    propuestaId      INT NOT NULL,
    modeloUsado      VARCHAR(100),
    fechaValidacion  DATETIME DEFAULT SYSDATETIME(),
    resultado        VARCHAR(MAX),
    confianza        DECIMAL(5,2),
    aprobado         BIT,
    observaciones    NVARCHAR(500),

    CONSTRAINT FK_ValidacionIA_Propuesta FOREIGN KEY (propuestaId)
        REFERENCES pv_propuestas (propuestaID)
        ON DELETE CASCADE
);

CREATE INDEX IX_ValidacionIA_Propuesta ON pv_validacionIA (propuestaId);

-- NOTIFICACIONES PENDIENTES

CREATE TABLE pv_notificacionPendiente (
    notificacionId   INT IDENTITY PRIMARY KEY,
    tipoNotificacion VARCHAR(100) NOT NULL,
    destinoEmail     VARCHAR(200) NOT NULL,
    asunto           VARCHAR(200),
    cuerpo           VARCHAR(MAX),
    enviada          BIT DEFAULT 0,
    fechaCreada      DATETIME DEFAULT SYSDATETIME(),
    fechaEnviada     DATETIME NULL
);

CREATE INDEX IX_NotifPendiente_Enviada ON pv_notificacionPendiente (enviada);

-- TAREAS MANUALES ASOCIADAS A WORKFLOWS

CREATE TABLE pv_tareaManualPendiente (
    tareaId          INT IDENTITY PRIMARY KEY,
    tipoTarea        VARCHAR(100) NOT NULL,
    entidad          VARCHAR(100) NOT NULL,
    entidadId        INT NOT NULL,
    asignadoA        VARCHAR(100) NOT NULL, 
    estado           VARCHAR(50) DEFAULT 'pendiente',
    fechaAsignada    DATETIME DEFAULT SYSDATETIME(),
    fechaResuelta    DATETIME NULL,
    resolucion       VARCHAR(MAX) NULL
);

CREATE INDEX IX_TareaManual_Estado ON pv_tareaManualPendiente (estado);
CREATE INDEX IX_TareaManual_Entidad ON pv_tareaManualPendiente (entidad, entidadId);
