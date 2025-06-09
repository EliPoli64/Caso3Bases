INSERT INTO dbo.pv_tipoDocumento (nombre)
VALUES
    ('Cédula de Identidad'),
    ('Pasaporte'),
    ('Licencia de Conducir'),
    ('Documento Legal'),
    ('Acta de Nacimiento'),
    ('Certificado de Votación'),
    ('Factura'),
    ('Contrato'),
    ('Recibo'),
    ('Comprobante');


DECLARE @i INT = 1;
DECLARE @numRecords INT = 2500; 
DECLARE @nombre NVARCHAR(30);
DECLARE @fechaCreacion DATETIME;
DECLARE @tipoDocumentoID INT;
DECLARE @estadoDocumentoID INT = 1;
DECLARE @ultimaModificacion DATETIME;
DECLARE @esActual BIT;
DECLARE @idLegal NVARCHAR(15);
DECLARE @checksum VARBINARY(256);


CREATE TABLE #TempTipoDocumento (
    TipoDocID INT
);

INSERT INTO #TempTipoDocumento (TipoDocID)
SELECT tipoDocumentoID
FROM dbo.pv_tipoDocumento;

IF NOT EXISTS (SELECT 1 FROM #TempTipoDocumento)
BEGIN
    PRINT 'ERROR: No document types found in dbo.pv_tipoDocumento. Please populate it first.';
    DROP TABLE #TempTipoDocumento;
    RETURN;
END;

IF NOT EXISTS (SELECT 1 FROM dbo.pv_estadoDocumento WHERE estadoDocumentoID = @estadoDocumentoID)
BEGIN
    PRINT 'WARNING: The default estadoDocumentoID = ' + CAST(@estadoDocumentoID AS NVARCHAR(10)) + ' does not exist in dbo.pv_estadoDocumento.';
    PRINT 'Please ensure dbo.pv_estadoDocumento is populated or adjust the @estadoDocumentoID variable.';
END;

WHILE @i <= @numRecords
BEGIN
    -- Get a random tipoDocumentoID
    SELECT TOP 1 @tipoDocumentoID = TipoDocID
    FROM #TempTipoDocumento
    ORDER BY NEWID();

    SET @fechaCreacion = DATEADD(day, -CAST(RAND() * 365 * 5 AS INT), GETDATE());
    SET @ultimaModificacion = DATEADD(day, CAST(RAND() * 365 AS INT), @fechaCreacion);
    IF @ultimaModificacion > GETDATE() SET @ultimaModificacion = GETDATE(); 

    SELECT @nombre =
        CASE @tipoDocumentoID
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Cédula de Identidad') THEN 'Cédula ' + RIGHT('0000000000' + CAST(@i * 1000 + (ABS(CHECKSUM(NEWID())) % 999) AS NVARCHAR(10)), 10)
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Pasaporte') THEN 'Pasaporte P-' + RIGHT('00000000' + CAST(@i * 1000 + (ABS(CHECKSUM(NEWID())) % 999) AS NVARCHAR(8)), 8)
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Licencia de Conducir') THEN 'Licencia ' + RIGHT('0000000' + CAST(@i * 1000 + (ABS(CHECKSUM(NEWID())) % 999) AS NVARCHAR(7)), 7)
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Documento Legal') THEN 'Doc. Legal #' + CAST(@i AS NVARCHAR(10)) + '-' + CAST(ABS(CHECKSUM(NEWID())) % 99 AS NVARCHAR(2))
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Acta de Nacimiento') THEN 'Acta Nacimiento ' + CAST(YEAR(@fechaCreacion) AS NVARCHAR(4)) + '-' + CAST(@i AS NVARCHAR(10))
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Certificado de Votación') THEN 'Certificado ' + CAST(YEAR(@fechaCreacion) AS NVARCHAR(4)) + '-Vot'
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Factura') THEN 'Factura INV-' + CAST(ABS(CHECKSUM(NEWID())) % 99999 AS NVARCHAR(5))
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Contrato') THEN 'Contrato C-' + RIGHT('00000' + CAST(@i * 10 + (ABS(CHECKSUM(NEWID())) % 9) AS NVARCHAR(5)), 5)
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Recibo') THEN 'Recibo REC-' + CAST(ABS(CHECKSUM(NEWID())) % 99999 AS NVARCHAR(5))
            WHEN (SELECT tipoDocumentoID FROM dbo.pv_tipoDocumento WHERE nombre = 'Comprobante') THEN 'Comprobante CMP-' + CAST(ABS(CHECKSUM(NEWID())) % 99999 AS NVARCHAR(5))
            ELSE 'Documento Genérico ' + CAST(@i AS NVARCHAR(10))
        END;

    SET @idLegal = LEFT(NEWID(), 8) + CAST(ABS(CHECKSUM(NEWID())) % 999 AS NVARCHAR(3));

    SET @esActual = CAST(ROUND(RAND(), 0) AS BIT);

    SET @checksum = HASHBYTES('SHA2_256', @nombre + CAST(@fechaCreacion AS NVARCHAR(50)) + @idLegal);

	SET @estadoDocumentoID = (ABS(CHECKSUM(NEWID())) % 2) + 1;
	IF (@estadoDocumentoID % 2) = 0 
		BEGIN
			SET @estadoDocumentoID = (ABS(CHECKSUM(NEWID())) % 3) + 2;
		END
		ELSE 
		BEGIN
			SET @estadoDocumentoID = 1;
		END;

    INSERT INTO dbo.pv_documento (
        nombre,
        fechaCreacion,
        tipoDocumentoID,
        estadoDocumentoID,
        ultimaModificacion,
        esActual,
        idLegal,
        checksum
    )
    VALUES (
        @nombre,
        @fechaCreacion,
        @tipoDocumentoID,
        @estadoDocumentoID,
        @ultimaModificacion,
        @esActual,
        @idLegal,
        @checksum
    );

    SET @i = @i + 1;
END;


DROP TABLE #TempTipoDocumento;


--LLENADO DOCUMENTOS USUARIO

DECLARE @i INT = 1;
DECLARE @numUsers INT = 1000;
DECLARE @documentoID INT;
DECLARE @usuarioID INT;
DECLARE @esActivo BIT;
DECLARE @numAdditionalDocs INT;
DECLARE @j INT;

CREATE TABLE #ApprovedDocumentIDsPool (DocumentoID INT PRIMARY KEY);
CREATE TABLE #AllDocumentIDs (DocumentoID INT);
CREATE TABLE #UserIDs (UserID INT PRIMARY KEY); 
INSERT INTO #ApprovedDocumentIDsPool (DocumentoID)
SELECT documentoID
FROM dbo.pv_documento
WHERE estadoDocumentoID = 1; 
INSERT INTO #AllDocumentIDs (DocumentoID)
SELECT documentoID
FROM dbo.pv_documento;
INSERT INTO #UserIDs (UserID)
SELECT userid
FROM dbo.pv_usuarios
ORDER BY userid
OFFSET 0 ROWS FETCH NEXT @numUsers ROWS ONLY; 
DECLARE @countApprovedDocs INT;
DECLARE @countUsers INT;

SELECT @countApprovedDocs = COUNT(*) FROM #ApprovedDocumentIDsPool;
SELECT @countUsers = COUNT(*) FROM #UserIDs;

IF @countUsers < @numUsers
BEGIN
    PRINT 'ERROR: Not enough users found in dbo.pv_usuarios. Found ' + CAST(@countUsers AS NVARCHAR(10)) + ' users. Need at least ' + CAST(@numUsers AS NVARCHAR(10)) + '.';
    DROP TABLE #ApprovedDocumentIDsPool;
    DROP TABLE #AllDocumentIDs;
    DROP TABLE #UserIDs;
    RETURN;
END;

IF @countApprovedDocs < @numUsers
BEGIN
    PRINT 'ERROR: Not enough *unique approved documents* found in dbo.pv_documento for ' + CAST(@numUsers AS NVARCHAR(10)) + ' users.';
    PRINT 'Found ' + CAST(@countApprovedDocs AS NVARCHAR(10)) + ' approved documents (estadoDocumentoID = 1). Need at least ' + CAST(@numUsers AS NVARCHAR(10)) + '.';
    PRINT 'Please ensure you have enough unique approved documents before running this script.';
    DROP TABLE #ApprovedDocumentIDsPool;
    DROP TABLE #AllDocumentIDs;
    DROP TABLE #UserIDs;
    RETURN;
END;

IF NOT EXISTS (SELECT 1 FROM #AllDocumentIDs)
BEGIN
    PRINT 'ERROR: No documents found in dbo.pv_documento. Please populate it first.';
    DROP TABLE #ApprovedDocumentIDsPool;
    DROP TABLE #AllDocumentIDs;
    DROP TABLE #UserIDs;
    RETURN;
END;


PRINT 'Starting data generation for ' + CAST(@numUsers AS NVARCHAR(10)) + ' users...';
WHILE @i <= @numUsers
BEGIN
    SELECT TOP 1 @usuarioID = UserID FROM #UserIDs ORDER BY NEWID();
    DELETE FROM #UserIDs WHERE UserID = @usuarioID;
    SELECT TOP 1 @documentoID = DocumentoID
    FROM #ApprovedDocumentIDsPool
    ORDER BY NEWID();
    DELETE FROM #ApprovedDocumentIDsPool WHERE DocumentoID = @documentoID; 
    SET @esActivo = 1; 
    INSERT INTO dbo.pv_documentosUsuario (documentoID, usuarioID, esActivo)
    VALUES (@documentoID, @usuarioID, @esActivo);
    SET @numAdditionalDocs = FLOOR(RAND() * 4);
    SET @j = 0;
    WHILE @j < @numAdditionalDocs
    BEGIN
        SELECT TOP 1 @documentoID = DocumentoID
        FROM #AllDocumentIDs
        ORDER BY NEWID();

        SET @esActivo = CAST(ROUND(RAND(), 0) AS BIT); 
		IF NOT EXISTS (SELECT 1 FROM dbo.pv_documentosUsuario WHERE documentoID = @documentoID AND usuarioID = @usuarioID)
        BEGIN
            INSERT INTO dbo.pv_documentosUsuario (documentoID, usuarioID, esActivo)
            VALUES (@documentoID, @usuarioID, @esActivo);
        END
        SET @j = @j + 1;
    END;

    SET @i = @i + 1;
END;

DROP TABLE #ApprovedDocumentIDsPool;
DROP TABLE #AllDocumentIDs;
DROP TABLE #UserIDs;

PRINT 'Data generation complete.';

SELECT
    u.userid,
    COUNT(DISTINCT du.documentoID) AS UniqueApprovedDocumentsCount
FROM dbo.pv_usuarios u
JOIN dbo.pv_documentosUsuario du ON u.userid = du.usuarioID
JOIN dbo.pv_documento d ON du.documentoID = d.documentoID
WHERE d.estadoDocumentoID = 1 AND u.userid BETWEEN 1 AND @numUsers
GROUP BY u.userid
HAVING COUNT(DISTINCT du.documentoID) = 1 -- Each user should have exactly ONE unique approved document
ORDER BY u.userid;




