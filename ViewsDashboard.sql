/*

EJECUTAR UNO POR UNO
VISTAS PARA POWERBI

*/

CREATE VIEW dbo.vw_votacionesRecientes
AS
SELECT V.titulo, V.descripcion, V.nombre AS tipoPropuesta, V.fechaInicio, V.fechaFin, EV.nombre AS estado, P.enunciado AS pregunta, RP.valor, COUNT(RP.valor) AS CantidadVotos
FROM     (SELECT TOP (5) VT.votacionID, VT.titulo, VT.descripcion, VT.fechaInicio, VT.fechaFin, VT.estadoVotacionID, TV.nombre
                  FROM      dbo.pv_votacion AS VT INNER JOIN
                                    dbo.pv_tipoVotacion AS TV ON TV.tipoVotacionID = VT.tipoVotacionID
                  ORDER BY VT.fechaInicio DESC) AS V INNER JOIN
                  dbo.pv_estadoVotacion AS EV ON EV.estadoVotacionID = V.estadoVotacionID INNER JOIN
                  dbo.pv_votacionPregunta AS VP ON VP.votacionID = V.votacionID INNER JOIN
                  dbo.pv_preguntas AS P ON P.preguntaID = VP.preguntaID INNER JOIN
                  dbo.pv_respuestaParticipante AS RP ON RP.preguntaID = P.preguntaID INNER JOIN
                  dbo.pv_propuestaVotacion AS PV ON PV.votacionID = V.votacionID INNER JOIN
                  dbo.pv_propuestas AS PS ON PS.propuestaid = PV.propuestaID
WHERE  (P.deleted = 0)
GROUP BY V.titulo, V.descripcion, V.nombre, V.fechaInicio, V.fechaFin, EV.nombre, P.enunciado, RP.valor

CREATE VIEW dbo.vw_verInversiones
AS
SELECT 
    V.votacionID,
    PY.proyectoID,
    PY.montoPedido,  -- monto total solicitado
    ISNULL(SUM(DISTINCT I.montoInvertido), 0) AS montoInvertido, -- monto recibido por inversión ciudadana
    ISNULL(SUM(D.monto), 0) AS montoEjecutado -- monto ejecutado según plan de desembolsos
FROM dbo.pv_proyecto PY
LEFT JOIN (
    SELECT I.proyectoID, SUM(ISNULL(T.montoConvertido, T.monto)) AS montoInvertido
    FROM dbo.pv_inversion I
    INNER JOIN dbo.pv_transaccion T ON T.transaccionID = I.transaccionID
    GROUP BY I.proyectoID
) I ON I.proyectoID = PY.proyectoID
LEFT JOIN dbo.pv_planPagos D ON D.proyectoID = PY.proyectoID
INNER JOIN dbo.pv_propuestas P ON P.propuestaid = PY.propuestaID
INNER JOIN dbo.pv_propuestaVotacion PV ON PV.propuestaID = P.propuestaid
INNER JOIN dbo.pv_votacion V ON V.votacionID = PV.votacionID
GROUP BY V.votacionID, PY.proyectoID, PY.montoPedido;

CREATE VIEW dbo.vw_dashboardVotacionesPublicas
AS
SELECT
    V.votacionID,
    V.titulo AS tituloVotacion,
    V.descripcion AS descripcionVotacion,
    TV.nombre AS tipoVotacion,
    V.fechaInicio,
    V.fechaFin,
    EV.nombre AS estadoVotacion,
    
    P.preguntaID,
    P.enunciado AS pregunta,
    RP.valor AS valorRespuesta,
    
    U.userid,
    CASE WHEN U.sexo = 1 THEN 'Mujer' WHEN U.sexo = 0 THEN 'Hombre' ELSE 'Otro' END AS sexo,
    DATEDIFF(YEAR, U.fechaNacimiento, GETDATE()) AS edad,
    
    PVS.nombre AS provincia,
    PS.nombre AS pais,
    A.nombre AS afiliacion,
    
    COUNT(*) OVER (PARTITION BY P.preguntaID, RP.valor) AS cantidadVotosPorRespuesta

FROM dbo.pv_usuarioVotacionPublica UVP
INNER JOIN dbo.pv_votacion V ON V.votacionID = UVP.votacionID
INNER JOIN dbo.pv_estadoVotacion EV ON EV.estadoVotacionID = V.estadoVotacionID
INNER JOIN dbo.pv_tipoVotacion TV ON TV.tipoVotacionID = V.tipoVotacionID
INNER JOIN dbo.pv_respuestaParticipante RP ON RP.respuestaParticipanteID = UVP.respuestaParticipanteID
INNER JOIN dbo.pv_preguntas P ON P.preguntaID = RP.preguntaID AND P.deleted = 0

-- Usuario y datos personales
INNER JOIN dbo.pv_usuarios U ON U.userid = UVP.usuarioID
INNER JOIN dbo.pv_direccionesUsuarios DU ON DU.userid = U.userid
INNER JOIN dbo.pv_ubicaciones UB ON UB.ubicacionID = DU.direccionViviendaid
INNER JOIN dbo.pv_provincias PVS ON PVS.provinciaid = UB.proviniciaID
INNER JOIN dbo.pv_paises PS ON PS.paisid = UB.paisID

-- Afiliación del usuario
INNER JOIN dbo.pv_afiliacionesUsuario AU ON AU.usarioID = U.userid
INNER JOIN dbo.pv_afiliaciones A ON A.afiliacionID = AU.afiliacionID;