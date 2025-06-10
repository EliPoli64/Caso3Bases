/*
IMPORTANTEEEE
LLENAR ANALISIS ANTES DE ESTA VARA

gracias lqm
*/

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