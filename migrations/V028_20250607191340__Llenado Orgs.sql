DECLARE @i INT = 1;
DECLARE @minTipoOrganizacionId INT;
DECLARE @maxTipoOrganizacionId INT;
DECLARE @randomTipoOrganizacionId INT;
DECLARE @nombreBase VARCHAR(30);
DECLARE @esNacional BIT;
DECLARE @tienePermiso BIT;
DECLARE @identificacionTributaria VARCHAR(10);
DECLARE @Prefijo CHAR(1)
DECLARE @NumeroRestante VARCHAR(9)

SELECT @minTipoOrganizacionId = MIN(tipoOrganizacionID), @maxTipoOrganizacionId = MAX(tipoOrganizacionID)
FROM dbo.pv_tipoOrganizacion;
IF @minTipoOrganizacionId IS NULL OR @maxTipoOrganizacionId IS NULL
BEGIN
    PRINT 'error, faltan registros';
END
ELSE
BEGIN
    WHILE @i <= 100
    BEGIN
        SET @randomTipoOrganizacionId = FLOOR(RAND() * (@maxTipoOrganizacionId - @minTipoOrganizacionId + 1)) + @minTipoOrganizacionId;

        SET @nombreBase = CASE
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Organización Gubernamental') THEN 'Ministerio de '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Organización No Gubernamental (ONG)') THEN 'Fundación Pro '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Empresa Privada') THEN 'Soluciones '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Institución Educativa') THEN 'Escuela Superior de '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Asociación Civil') THEN 'Asociación de '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Fundación') THEN 'Fondo para '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Cooperativa') THEN 'Coop. de '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Sindicato') THEN 'Sindicato de '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Grupo Comunitario') THEN 'Vecinos de '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Partido Político') THEN 'Partido '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Organización Internacional') THEN 'ONU '
                            WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Entidad Religiosa') THEN 'Iglesia '
                            ELSE 'Org Gen '
                        END;
        SET @esNacional = CASE WHEN RAND() < 0.8 THEN 1 ELSE 0 END;
        SET @tienePermiso = CASE WHEN RAND() < 0.9 THEN 1 ELSE 0 END;

        SET @Prefijo = 
			CASE FLOOR(RAND() * 4)
				WHEN 0 THEN '1'
				WHEN 1 THEN '3'
				WHEN 2 THEN '4'
				ELSE '7'
			END

		
		SET @NumeroRestante = RIGHT('000000000' + CAST(FLOOR(RAND() * 1000000000) AS VARCHAR), 9)

		SET @identificacionTributaria = @Prefijo + @NumeroRestante
        INSERT INTO dbo.pv_organizaciones (nombre, esNacional, logoUrl, tienePermiso, tipoOrganizacionID, identificacionTributaria)
        VALUES
        (
            @nombreBase +
            CASE
                WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Organización Gubernamental') THEN 'Hacienda ' + CAST(@i AS VARCHAR(3))
                WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Organización No Gubernamental (ONG)') THEN 'Bienestar ' + CAST(@i AS VARCHAR(3))
                WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Empresa Privada') THEN 'Tecno ' + CAST(@i AS VARCHAR(3))
                WHEN @randomTipoOrganizacionId = (SELECT tipoOrganizacionID FROM dbo.pv_tipoOrganizacion WHERE nombreTipo = 'Institución Educativa') THEN 'Estudios ' + CAST(@i AS VARCHAR(3))
                ELSE 'XYZ ' + CAST(@i AS VARCHAR(3))
            END,
            @esNacional,
            'https://example.com/logos/org_' + CAST(@i AS VARCHAR(3)) + '.png',
            @tienePermiso,
            @randomTipoOrganizacionId,
            @identificacionTributaria
        );
        SET @i = @i + 1;
    END;
END