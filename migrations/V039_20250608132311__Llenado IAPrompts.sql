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