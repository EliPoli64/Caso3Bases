
-- Esto es para borrar datos y reiniciar el Identity -------------------------------------
-- Borrar todos los registros
DELETE FROM [dbo].[pv_usuarios];
-- Reiniciar el contador IDENTITY
DBCC CHECKIDENT ('[dbo].[pv_usuarios]', RESEED, 0);
------------------------------------------------------------------------------------------

-- Llenado de Usuarios
-- BORRAR ESTA PARTE CUANDO ESTE LLENOS PROFESIONES Y LLAVES -----------------------------
ALTER TABLE [dbo].[pv_usuarios] NOCHECK CONSTRAINT [FK_pv_usuarios_pv_profesiones];
ALTER TABLE [dbo].[pv_usuarios] NOCHECK CONSTRAINT [FK_pv_usuarios_pv_llavesUsuarios];
------------------------------------------------------------------------------------------
-- Nombres:
DECLARE @Nombres TABLE (nombre varchar(50));
INSERT INTO @Nombres VALUES
('Juan'), ('Maria'), ('Carlos'), ('Ana'), ('Luis'),
('Sofia'), ('Pedro'), ('Laura'), ('Jorge'), ('Yelena');
-- Apellidos:
DECLARE @PrimerApellido TABLE (apellido varchar(50));
INSERT INTO @PrimerApellido VALUES
('Garcia'), ('Rodriguez'), ('Gonzalez'), ('Fernandez'), ('Lopez'),
('Martinez'), ('Sanchez'), ('Perez'), ('Gomez'), ('Martin');
DECLARE @SegundoApellido TABLE (apellido2 VARCHAR(50));
INSERT INTO @SegundoApellido VALUES 
('Hernandez'), ('Diaz'), ('Moreno'), ('Alvarez'), ('Jimenez'),
('Ruiz'), ('Romero'), ('Sanz'), ('Torres'), ('Vazquez');
DECLARE @NombresCompletos TABLE(id INT IDENTITY(1,1), nom varchar(50), ap1 varchar(50), ap2 varchar(50));
INSERT INTO @NombresCompletos (nom, ap1, ap2)
SELECT 
    n.Nombre,
    a1.apellido,
    a2.apellido2
FROM @Nombres n -- la idea es hacer un todos con todos para generar todas las combinaciones de nombres y apellidos
CROSS JOIN @PrimerApellido a1
CROSS JOIN @SegundoApellido a2
-- Fechas de Nacimiento:
DECLARE @FechaInicio DATE = DATEADD(YEAR, -50, GETDATE()); -- Fecha inicio, hace 50 años
DECLARE @FechaFin DATE = DATEADD(YEAR, -20, GETDATE()); -- Fecha fin, hace 20 años
-- Bucle de llenado:
DECLARE @cont INT = 1;
DECLARE @cantUsuarios INT;
SELECT @cantUsuarios = COUNT(1) FROM @NombresCompletos;
WHILE @cont <= @cantUsuarios
BEGIN
    DECLARE @nom VARCHAR(50), @ap1 VARCHAR(50), @ap2 VARCHAR(50);
    SELECT 
        @nom = nom,
        @ap1 = ap1,
        @ap2 = ap2
    FROM @NombresCompletos
    WHERE id = @cont;
    DECLARE @FechaNacimiento DATE = DATEADD(DAY, RAND() * DATEDIFF(DAY, @FechaInicio, @FechaFin), @FechaInicio);
    -- Cédulas:
    DECLARE @Cedula VARCHAR(9) = RIGHT('000000000' + CAST(100000000 + ((@cont-1)*100) AS VARCHAR(10)), 9); -- El right es para asegurar los 9 digitos
    DECLARE @Checksum VARBINARY(256);
    SET @Checksum = HASHBYTES('SHA2_256', CONCAT(@nom, @ap1, @ap2, @Cedula));
    INSERT INTO [dbo].[pv_usuarios] VALUES (
        @nom,@ap1,@ap2,
        @FechaNacimiento,
        @Cedula,1,
        @Checksum,1
    );
    SET @cont= @cont+ 1;
END


-- BORRAR ESTA PARTE CUANDO ESTE LLENOS PROFESIONES Y LLAVES -----------------------------
ALTER TABLE [dbo].[pv_usuarios] CHECK CONSTRAINT [FK_pv_usuarios_pv_profesiones];
ALTER TABLE [dbo].[pv_usuarios] CHECK CONSTRAINT [FK_pv_usuarios_pv_llavesUsuarios];
------------------------------------------------------------------------------------------