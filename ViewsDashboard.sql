/*
OJO
EJECUTAR CREATES UNO POR UNO
SINO NO SIRVE
gracias
*/


CREATE VIEW vw_PermisosUsuario AS
SELECT 
    u.userid,
    u.nombre + ' ' + u.primerApellido AS nombreCompleto,
    r.name AS rol,
    p.descripcion AS permiso,
    p.code AS codigoPermiso
FROM 
    pv_usuarios u
JOIN 
    pv_rolesUsuarios ru ON u.userid = ru.userId
JOIN 
    pv_roles r ON ru.rolId = r.rolId
LEFT JOIN 
    pv_usuariosPermisos up ON u.userid = up.userid
LEFT JOIN 
    pv_permissions p ON up.permisoId = p.permissionId
WHERE 
    ru.enabled = 1 
    AND ru.deleted = 0
    AND (up.enabled = 1 OR up.enabled IS NULL)
    AND (up.deleted = 0 OR up.deleted IS NULL);

CREATE VIEW vw_ResultadosVotacionRecientes AS
SELECT TOP 5
    v.votacionID,
    v.titulo AS nombreVotacion,
    v.fechaInicio,
    v.fechaFin,
    pv.propuestaID,
    p.descripcion AS descripcionPropuesta,
    tp.nombre AS tipoPropuesta,
    (SELECT COUNT(*) FROM pv_resultadoVotacion WHERE votacionID = v.votacionID) AS totalVotos,
    CASE 
        WHEN v.fechaFin > GETDATE() THEN 'Activa'
        WHEN v.fechaFin <= GETDATE() THEN 'Cerrada'
        ELSE 'Pendiente'
    END AS estadoVotacion,
    ev.nombre AS estadoVotacionNombre
FROM 
    pv_votacion v
JOIN 
    pv_propuestaVotacion pv ON v.votacionID = pv.votacionID
JOIN 
    pv_propuestas p ON pv.propuestaID = p.propuestaID
JOIN 
    pv_tiposPropuesta tp ON p.tipoPropuestaID = tp.tipoPropuestaID
JOIN 
    pv_estadoVotacion ev ON v.estadoVotacionID = ev.estadoVotacionID
ORDER BY 
    v.fechaInicio DESC;

CREATE VIEW vw_ResultadosPorPregunta AS
SELECT 
    v.votacionID,
    v.titulo AS nombreVotacion,
    vpq.preguntaID,
    pq.enunciado AS pregunta,
    r.respuestaID,
    r.respuesta AS respuesta,
    (SELECT COUNT(DISTINCT rp2.respuestaParticipanteID)
     FROM pv_respuestaParticipante rp2
     JOIN pv_votacionPregunta vpq2 ON rp2.preguntaID = vpq2.preguntaID
     WHERE vpq2.votacionID = v.votacionID) AS totalRespuestas
FROM 
    pv_votacion v
JOIN 
    pv_votacionPregunta vpq ON v.votacionID = vpq.votacionID
JOIN 
    pv_preguntas pq ON vpq.preguntaID = pq.preguntaID
JOIN 
    pv_respuestas r ON pq.preguntaID = r.preguntaID
LEFT JOIN 
    pv_respuestaParticipante rp ON r.preguntaID = rp.preguntaID AND r.respuestaID = rp.respuestaID
GROUP BY 
    v.votacionID, v.titulo, vpq.preguntaID, pq.enunciado, r.respuestaID, r.respuesta;

