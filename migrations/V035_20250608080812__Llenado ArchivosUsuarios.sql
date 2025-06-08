/*
OJOOOOO:
porfis llene mediafiles y usuarios primerooo ^^

gracias :3
*/

DECLARE @i INT = 1;
DECLARE @NumberOfRecords INT = 100;

WHILE @i <= 1000
BEGIN
    DECLARE @randomUsuarioID INT;
    DECLARE @randomMediaFileID INT;
    SELECT TOP 1 @randomUsuarioID = userId
    FROM pv_usuarios
    ORDER BY NEWID();
    SELECT TOP 1 @randomMediaFileID = mediaFileID
    FROM pv_mediaFiles
    ORDER BY NEWID();
    IF @randomUsuarioID IS NOT NULL AND @randomMediaFileID IS NOT NULL
    BEGIN

        INSERT INTO pv_archivosUsuarios (
            usuarioID,
            mediaFileID
        )
        VALUES (
            @randomUsuarioID,
            @randomMediaFileID
        );
    END
    ELSE
    BEGIN
        PRINT 'no hay nada en usuarios OR mediafiles';
    END;

    SET @i = @i + 1;
END;
