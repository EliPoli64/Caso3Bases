DECLARE @propuestaCount INT = 6;
DECLARE @comentariosPorPropuesta INT = 8; -- 50/6 es casi 8 
DECLARE @detalleComentarioID INT = 1;
DECLARE @propuestaID INT = 1;

WHILE @detalleComentarioID <= 50
BEGIN
    INSERT INTO [dbo].[pv_comentariosPropuesta] 
    ([detalleComentarioID], [estadoComentid], [propuestaid])
    VALUES (@detalleComentarioID, 2, @propuestaID);
    SET @detalleComentarioID = @detalleComentarioID + 1;
    IF @detalleComentarioID % 8 = 0 AND @propuestaID < @propuestaCount -- esto es para cambiar de propuesta cada 8 comments para distribucion uniforme
        SET @propuestaID = @propuestaID + 1;
END
UPDATE [dbo].[pv_comentariosPropuesta] SET [propuestaid] = 1 
WHERE [comentarioid] BETWEEN 1 AND 8;
UPDATE [dbo].[pv_comentariosPropuesta] SET [propuestaid] = 2 
WHERE [comentarioid] BETWEEN 9 AND 16;
UPDATE [dbo].[pv_comentariosPropuesta] SET [propuestaid] = 3 
WHERE [comentarioid] BETWEEN 17 AND 24;
UPDATE [dbo].[pv_comentariosPropuesta] SET [propuestaid] = 4 
WHERE [comentarioid] BETWEEN 25 AND 33;
UPDATE [dbo].[pv_comentariosPropuesta] SET [propuestaid] = 5 
WHERE [comentarioid] BETWEEN 34 AND 42;
UPDATE [dbo].[pv_comentariosPropuesta] SET [propuestaid] = 6 
WHERE [comentarioid] BETWEEN 43 AND 50;