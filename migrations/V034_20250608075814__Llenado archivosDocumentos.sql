/*
IMPORTANTEEEEEEEEEE
ESTO REQUIERE LLENAR MEDIAFILES Y DOCUMENTOS
A la hora en la que subo esto (8:00) no está documentos, entonces no lo he probado, pero en teoría funciona
*/

DECLARE @i INT = 1;
DECLARE @randomDocumentoID INT;
DECLARE @randomMediaFileID INT;
DECLARE @randomAprobado BIT;
DECLARE @maxDocumentoID INT;
DECLARE @maxMediaFileID INT;
SELECT @maxDocumentoID = MAX(documentoID) FROM [dbo].[pv_documento];
SET @maxDocumentoID = ISNULL(@maxDocumentoID, 1000); 
SELECT @maxMediaFileID = MAX(mediaFileID) FROM [dbo].[pv_mediaFiles];
SET @maxMediaFileID = ISNULL(@maxMediaFileID, 500); 
SET @maxDocumentoID = IIF(@maxDocumentoID < 1, 1, @maxDocumentoID);
SET @maxMediaFileID = IIF(@maxMediaFileID < 1, 1, @maxMediaFileID);
WHILE @i <= 200
BEGIN
    SET @randomDocumentoID = FLOOR(RAND() * @maxDocumentoID) + 1;
    SET @randomMediaFileID = FLOOR(RAND() * @maxMediaFileID) + 1;
    SET @randomAprobado = CAST(FLOOR(RAND() * 2) AS BIT);
    INSERT INTO [dbo].[pv_archivosDocumentos] (
        [documentoID],
        [mediaFileID],
        [aprobado]
    )
    VALUES (
        @randomDocumentoID,
        @randomMediaFileID,
        @randomAprobado
    );
    SET @i = @i + 1;
END;