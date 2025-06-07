INSERT INTO dbo.pv_iaEstado (nombre)
VALUES ('Pendiente'), ('Procesando'), ('Completado'), ('Error');

DECLARE @i INT = 1;
WHILE @i <= 50
BEGIN
    DECLARE @metodoID INT = (SELECT TOP 1 metodoLlamadaID FROM pv_metodoLlamadaAPI ORDER BY NEWID());

    INSERT INTO dbo.pv_configAPIs (
        nombre,
        apiURL,
        rutaEndpoint,
        metodoLlamadaID,
        esActiva,
        ultimaModificacion,
        fechaCreacion
    )
    VALUES (
        CONCAT('API_', @i),
        CONCAT('https://api', @i, '.votopuravida.cr'),
        CONCAT('/endpoint_', @i),
        @metodoID,
        IIF(@i % 2 = 0, 1, 0),
        GETDATE(),
        GETDATE()
    );

    SET @i += 1;
END

SET @i = 1;
WHILE @i <= 50
BEGIN
    DECLARE @modeloID INT = (SELECT TOP 1 iaModeloID FROM pv_iaModelo ORDER BY NEWID());
    DECLARE @apiID INT = (SELECT TOP 1 configAPIID FROM pv_configAPIs ORDER BY NEWID());

    INSERT INTO dbo.pv_infoIA (iaModeloID, configAPIID)
    VALUES (@modeloID, @apiID);

    SET @i += 1;
END