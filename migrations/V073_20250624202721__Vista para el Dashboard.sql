CREATE VIEW [dbo].[vw_votacionesRecientes]
AS
SELECT 
    V.titulo, 
    V.descripcion, 
    V.nombre AS tipoPropuesta,
    V.fechaInicio, 
    V.fechaFin, 
    EV.nombre AS estado,
    P.enunciado AS pregunta,
    RP.valor,
    COUNT(RP.valor) AS CantidadVotos
FROM (
    SELECT TOP 5 votacionID, titulo, VT.descripcion, fechaInicio, fechaFin, estadoVotacionID, TV.nombre
    FROM pv_votacion VT
    INNER JOIN pv_tipoVotacion TV ON TV.tipoVotacionID = VT.tipoVotacionID
    ORDER BY fechaInicio DESC
) V
INNER JOIN pv_estadoVotacion EV ON EV.estadoVotacionID = V.estadoVotacionID
INNER JOIN pv_votacionPregunta VP ON VP.votacionID = V.votacionID
INNER JOIN pv_preguntas P ON P.preguntaID = VP.preguntaID
INNER JOIN pv_respuestaParticipante RP ON RP.preguntaID = P.preguntaID
INNER JOIN pv_propuestaVotacion PV ON PV.votacionID = V.votacionID
INNER JOIN pv_propuestas PS ON PS.propuestaid = PV.propuestaID
WHERE P.deleted = 0
GROUP BY V.titulo, V.descripcion, V.nombre, V.fechaInicio, V.fechaFin, EV.nombre, P.enunciado, RP.valor;