-- Asigna profesiones aleatorias a los usuarios existentes

-- Primero verificamos que existan usuarios y profesiones
IF EXISTS (SELECT 1 FROM dbo.pv_usuarios) AND EXISTS (SELECT 1 FROM dbo.pv_profesiones)
BEGIN
    -- Insertar registros en pv_profesionesUsuarios
    INSERT INTO dbo.pv_profesionesUsuarios (usuarioID, profesionID, loEjerce)
    SELECT 
        u.userid, 
        p.profesionID,
        CASE 
            WHEN RAND(CHECKSUM(NEWID())) > 0.3 THEN 1 -- 70% de probabilidad de que ejerza
            ELSE 0 -- 30% de probabilidad de que no ejerza
        END AS loEjerce
    FROM 
        dbo.pv_usuarios u
    CROSS APPLY (
        SELECT TOP 1 profesionID 
        FROM dbo.pv_profesiones 
        ORDER BY NEWID() -- Selecciona una profesión aleatoria para cada usuario
    ) p
    WHERE NOT EXISTS (
        SELECT 1 
        FROM dbo.pv_profesionesUsuarios pu 
        WHERE pu.usuarioID = u.userid
    ); -- Solo inserta si el usuario no tiene ya una profesión asignada

    -- Para algunos usuarios (20%), asignar una segunda profesión
    INSERT INTO dbo.pv_profesionesUsuarios (usuarioID, profesionID, loEjerce)
    SELECT 
        u.userid, 
        p.profesionID,
        CASE 
            WHEN RAND(CHECKSUM(NEWID())) > 0.4 THEN 1 -- 60% de probabilidad de que ejerza
            ELSE 0 -- 40% de probabilidad de que no ejerza
        END AS loEjerce
    FROM 
        dbo.pv_usuarios u
    CROSS APPLY (
        SELECT TOP 1 profesionID 
        FROM dbo.pv_profesiones 
        WHERE profesionID NOT IN (
            SELECT profesionID 
            FROM dbo.pv_profesionesUsuarios 
            WHERE usuarioID = u.userid
        )
        ORDER BY NEWID()
    ) p
    WHERE 
        RAND(CHECKSUM(NEWID(), u.userid)) > 0.8 -- 20% de usuarios tendrán 2 profesiones
        AND EXISTS (
            SELECT 1 
            FROM dbo.pv_profesiones 
            WHERE profesionID NOT IN (
                SELECT profesionID 
                FROM dbo.pv_profesionesUsuarios 
                WHERE usuarioID = u.userid
            )
        );

    PRINT 'Se han insertado ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros en pv_profesionesUsuarios';
END
ELSE
BEGIN
    PRINT 'No se pueden insertar datos en pv_profesionesUsuarios porque faltan usuarios o profesiones';
END