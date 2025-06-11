--Pequeño arreglo
--ALTER TABLE dbo.pv_votacion
--   DROP COLUMN encuestaID;
--   PRINT 'Column encuestaID ha sido eliminada.'


INSERT INTO dbo.pv_votacion (
    tipoVotacionID,
    titulo,
    descripcion,
    fechaInicio,
    fechaFin,
    estadoVotacionID,
    ultimaModificacion,
    privada,
    esSecreta
) VALUES
(1, 'Votación: Mejora de Transporte Público', 'Vota a favor o en contra de la propuesta para la mejora de transporte público.',
 '2025-06-15 09:00:00', '2025-07-15 17:00:00', 2, GETDATE(),0,0),

(4,'Votación: Becas Rurales',
 'Distribuye el presupuesto disponible para la implementación de un programa de becas para estudiantes de bajos recursos en áreas rurales.',
 '2024-06-12 10:00:00','2024-06-20 18:00:00',4, GETDATE(),1,1), 

(6, 'Consulta Pública: Clínicas Móviles', 'Participa en la consulta sobre el establecimiento de clínicas móviles en zonas periurbanas.',
'2024-05-01 08:00:00','2024-05-15 23:59:59',4, GETDATE(),0, 0),

(3, 'Votación: Prioridad de Reforestación', 'Clasifica los mejores árboles con los cuales reforestar.',
 '2024-07-10 11:00:00', '2024-07-30 16:00:00', 4, GETDATE(),0, 0), 

(9, 'Votación: Centros de Innovación',
 'Busca prioridades respecto a que habilidades se deben fomentar','2025-05-15 13:00:00','2025-07-01 15:00:00',2, 
 GETDATE(),0, 0), 

(5, 'Campaña: Apoyo a Artistas Emergentes',
 'Votación vinculada a proyectos de financiamiento colectivo, para apoyar artistas nacionales emergentes.',
 '2024-04-01 09:00:00', '2024-04-30 17:00:00', 5,  GETDATE(), 0, 0);

 INSERT INTO pv_propuestaSegmentosDirigidos(propuestaID, segementoID, usuarioID, deleted, checksum)
 SELECT 
	p.propuestaid, 
	(SELECT TOP 1 segmentoID FROM dbo.pv_segmento ORDER BY NEWID()) AS segmentoID,
	(SELECT TOP 1 userid FROM dbo.pv_usuarios ORDER BY NEWID()) AS usuarioID,
	0 AS deleted,
	HASHBYTES('SHA2_256','Dir') AS [checksum]
from pv_propuestas p

 INSERT INTO pv_propuestaSegmentosImpacto(propuestaID, segmentoID, usuarioID, deleted, checksum)
 SELECT 
	p.propuestaid, 
	(SELECT TOP 1 segmentoID FROM dbo.pv_segmento ORDER BY NEWID()) AS segmentoID,
	(SELECT TOP 1 userid FROM dbo.pv_usuarios ORDER BY NEWID()) AS usuarioID,
	0 AS deleted,
	HASHBYTES('SHA2_256', 'Imp') as checksum
from pv_propuestas p
	
