/*
IMPORTANTE

LLENAR USERS, ORGS PRIMERO
*/
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