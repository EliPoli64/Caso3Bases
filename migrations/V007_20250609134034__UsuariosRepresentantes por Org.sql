DECLARE @OrganizacionID INT = 1
DECLARE @UsuarioBase INT = 1
DECLARE @Usuario1 INT
DECLARE @Usuario2 INT
WHILE @OrganizacionID <= 100
BEGIN
    SET @Usuario1 = @UsuarioBase
    SET @Usuario2 = @UsuarioBase + 1
    INSERT INTO [dbo].[pv_orgUsuariosRepresentantes] (usuarioID, organizacionID, esActivo, ultimaModificacion, documentoID)
    VALUES (@Usuario1, @OrganizacionID, 1, GETDATE(), @Usuario1), -- Insertamos el userid actual y el que sigue
    (@Usuario2, @OrganizacionID, 1, GETDATE(), @Usuario2)         -- Insertamos 2 users por Org
    SET @OrganizacionID = @OrganizacionID + 1
    SET @UsuarioBase = @UsuarioBase + 2
END
GO