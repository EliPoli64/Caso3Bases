USE [VotoPV01]
GO
INSERT INTO [dbo].[pv_proponente] ([propuestaID], [usuarioID], [organizacionID], [esPrincipal])
VALUES 
(1, FLOOR(RAND()*1000) + 1, NULL, 1),
(1, FLOOR(RAND()*1000) + 1, NULL, 0),
(1, FLOOR(RAND()*1000) + 1, NULL, 0)
INSERT INTO [dbo].[pv_proponente] ([propuestaID], [usuarioID], [organizacionID], [esPrincipal])
VALUES 
(2, FLOOR(RAND()*1000) + 1, NULL, 1),
(2, FLOOR(RAND()*1000) + 1, NULL, 0)
INSERT INTO [dbo].[pv_proponente] ([propuestaID], [usuarioID], [organizacionID], [esPrincipal])
VALUES 
(3, FLOOR(RAND()*1000) + 1, NULL, 1), 
(3, FLOOR(RAND()*1000) + 1, NULL, 0),
(3, FLOOR(RAND()*1000) + 1, NULL, 0)
INSERT INTO [dbo].[pv_proponente] ([propuestaID], [usuarioID], [organizacionID], [esPrincipal])
VALUES 
(4, FLOOR(RAND()*1000) + 1, NULL, 1), 
(4, FLOOR(RAND()*1000) + 1, NULL, 0)
INSERT INTO [dbo].[pv_proponente] ([propuestaID], [usuarioID], [organizacionID], [esPrincipal])
VALUES 
(5, FLOOR(RAND()*1000) + 1, NULL, 1), 
(5, FLOOR(RAND()*1000) + 1, NULL, 0),
(5, FLOOR(RAND()*1000) + 1, NULL, 0)
INSERT INTO [dbo].[pv_proponente] ([propuestaID], [usuarioID], [organizacionID], [esPrincipal])
VALUES 
(6, FLOOR(RAND()*1000) + 1, NULL, 1), 
(6, FLOOR(RAND()*1000) + 1, NULL, 0)

GO