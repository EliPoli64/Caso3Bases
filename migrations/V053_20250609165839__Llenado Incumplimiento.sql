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
