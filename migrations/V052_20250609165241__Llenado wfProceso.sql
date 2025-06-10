DECLARE @minWorkFlowID INT, @maxWorkFlowID INT;

-- CORRER 1 VEZ SOLAMENTE
ALTER TABLE pv_wfProceso
DROP COLUMN [workFlowID];
-- FIN DEL CORRER UNA VEZ

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