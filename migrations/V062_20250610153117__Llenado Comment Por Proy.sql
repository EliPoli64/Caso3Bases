
DECLARE @proyectoCount INT = 6;
DECLARE @comentariosPorProyecto INT = 8;
DECLARE @detalleComentarioID INT = 51;
DECLARE @proyectoID INT = 1;
WHILE @detalleComentarioID <= 100
BEGIN
    INSERT INTO [dbo].[pv_comentariosProyecto] 
    ([detalleComentarioID], [estadoCommentid], [proyectoID])
    VALUES (@detalleComentarioID, 2, @proyectoID);
    SET @detalleComentarioID = @detalleComentarioID + 1;
    IF (@detalleComentarioID - 50) % 8 = 0 AND @proyectoID < @proyectoCount
        SET @proyectoID = @proyectoID + 1;
END
UPDATE [dbo].[pv_comentariosProyecto] SET [proyectoID] = 1 
WHERE [detalleComentarioID] BETWEEN 51 AND 58;
UPDATE [dbo].[pv_comentariosProyecto] SET [proyectoID] = 2 
WHERE [detalleComentarioID] BETWEEN 59 AND 66;
UPDATE [dbo].[pv_comentariosProyecto] SET [proyectoID] = 3 
WHERE [detalleComentarioID] BETWEEN 67 AND 74;
UPDATE [dbo].[pv_comentariosProyecto] SET [proyectoID] = 4 
WHERE [detalleComentarioID] BETWEEN 75 AND 83;
UPDATE [dbo].[pv_comentariosProyecto] SET [proyectoID] = 5 
WHERE [detalleComentarioID] BETWEEN 84 AND 91;
UPDATE [dbo].[pv_comentariosProyecto] SET [proyectoID] = 6 
WHERE [detalleComentarioID] BETWEEN 92 AND 100;