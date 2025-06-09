/*
IMPORTANTEE 

LLENAR EMBEDDINGS, RELACIONESIA, DOCUMENTO, ESTADO PRIMERO

*/

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