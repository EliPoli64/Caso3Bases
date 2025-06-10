INSERT INTO pv_documentoProyecto(proyectoID, documentoID, esActivo)
SELECT 
	   p.proyectoID, 
	   (SELECT TOP 1 documentoID FROM dbo.pv_documento ORDER BY NEWID()) AS documentoID,
	   1 as esActivo	
FROM pv_proyecto p 

INSERT INTO pv_documentosOrgs(organizacionID, documentoID, esActivo)
SELECT 
	   o.organizacionid, 
	   (SELECT TOP 1 documentoID FROM dbo.pv_documento ORDER BY NEWID()) AS documentoID,
	   1 as esActivo	
FROM pv_organizaciones o 
INSERT INTO pv_documentosPropuestas(propuestaID, documentoID, esActivo)
SELECT 
	   p.propuestaid, 
	   (SELECT TOP 1 documentoID FROM dbo.pv_documento ORDER BY NEWID()) AS documentoID,
	   1 as esActivo	
FROM pv_propuestas p 