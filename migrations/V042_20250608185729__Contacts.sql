Use VotoPV01
Go

DECLARE @userId INT;
DECLARE @cantContactos INT;
DECLARE @contactTypeId INT;
DECLARE @contactValue NVARCHAR(255);
DECLARE @enabled BIT;
DECLARE @lastUpdate DATETIME;
DECLARE @maxUsers INT = 1000;
DECLARE @i INT = 1;

CREATE TABLE #ValidContactTypes (
    typeId INT,
    name NVARCHAR(255)
);

INSERT INTO #ValidContactTypes (typeId, name)
SELECT typeId, name
FROM dbo.pv_contactType
WHERE name <> 'Dirección de Residencia'; 

WHILE @i <= @maxUsers
BEGIN
    SET @userId = @i;
    SET @cantContactos = FLOOR(RAND() * 2) + 1; -- 1 or 2 contacts per user

    DECLARE @j INT = 1;
    WHILE @j <= @cantContactos
    BEGIN
        SELECT TOP 1 @contactTypeId = typeId
        FROM #ValidContactTypes
        ORDER BY NEWID(); 


        SET @contactValue =
            CASE
                WHEN (SELECT name FROM dbo.pv_contactType WHERE typeId = @contactTypeId) = 'Correo Electrónico' THEN 'user' + CAST(@userId AS NVARCHAR(10)) + '_' + CAST(@j AS NVARCHAR(2)) + '@example.com'
                WHEN (SELECT name FROM dbo.pv_contactType WHERE typeId = @contactTypeId) = 'Teléfono Fijo' THEN '506-2' + RIGHT('000000' + CAST(CAST(RAND() * 999999 AS INT) AS NVARCHAR(6)), 6)
                WHEN (SELECT name FROM dbo.pv_contactType WHERE typeId = @contactTypeId) = 'Teléfono Móvil' THEN '506-8' + RIGHT('000000' + CAST(CAST(RAND() * 999999 AS INT) AS NVARCHAR(6)), 6)
                WHEN (SELECT name FROM dbo.pv_contactType WHERE typeId = @contactTypeId) = 'Red Social' THEN 'https://social.com/user' + CAST(@userId AS NVARCHAR(10)) + '_' + CAST(@j AS NVARCHAR(2))
                WHEN (SELECT name FROM dbo.pv_contactType WHERE typeId = @contactTypeId) = 'Fax' THEN '506-2' + RIGHT('000000' + CAST(CAST(RAND() * 999999 AS INT) AS NVARCHAR(6)), 6)
            END;

			

        SET @enabled = 1;
        SET @lastUpdate = GETDATE();

		 INSERT INTO pv_contact(userid, value, enabled, lastUpdate, typeId)
        VALUES (@userId, @contactValue, @enabled, @lastUpdate, @contactTypeId);


        SET @j = @j + 1;
    END

    SET @i = @i + 1;
END;

DROP TABLE #ValidContactTypes;




