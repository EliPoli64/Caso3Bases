INSERT INTO pv_wfDocumentos( wfProcesoID, tipoDocumentoID,enabled, [order])
SELECT
    wp.wfProcesoID,
	(SELECT TOP 1 tipoDocumentoID FROM dbo.pv_tipoDocumento ORDER BY NEWID()) AS tipoDocumentoID,
	1 as enabled, 
	1 + FLOOR(RAND() * 40)
FROM pv_wfProceso wp