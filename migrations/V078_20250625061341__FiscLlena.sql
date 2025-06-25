-- variables
DECLARE @proyectoID INT;
DECLARE @grupoID INT;
DECLARE @montoGanancia DECIMAL(18,2);
DECLARE @fechaReporte DATETIME;
DECLARE @hashReporte VARBINARY(256);
DECLARE @reporteID INT;
DECLARE @usuario1 INT, @usuario2 INT;

--  Seleccionar proyecto válido (no en estados 4,5,6,9 ___ son como los q son rechazados, aplazados, no validados , etc)
SELECT TOP 1 @proyectoID = proyectoID
FROM pv_proyecto
WHERE estadoID NOT IN (4,5,6,9)
ORDER BY NEWID();

IF @proyectoID IS NULL
BEGIN
    PRINT 'No se encontró un proyecto válido.';
    RETURN;
END

-- Seleccionar grupo validador 
SELECT TOP 1 @grupoID = grupoID FROM pv_grupoValidador ORDER BY NEWID();

-- Crear reporte de ganancia con hash
SET @montoGanancia = ROUND(RAND() * 50000 + 20000, 2);
SET @fechaReporte = GETDATE();
SET @hashReporte = HASHBYTES('SHA2_256', CONCAT(@proyectoID, '|', @montoGanancia, '|', @fechaReporte));

INSERT INTO pv_reporteGanancias (
    proyectoID, fechaReporte, montoGanancia, validado, aprobadoPor, hashReporte
)
VALUES (
    @proyectoID, @fechaReporte, @montoGanancia, 1, NULL, @hashReporte
);

SET @reporteID = SCOPE_IDENTITY();

--  Asociar grupo validador en pv_validacionPropuesta
INSERT INTO pv_validacionPropuesta (
    versionID, grupoID, fechaValidacion, estado, comentarios, fechaCreacion
)
SELECT TOP 1 versionID, @grupoID, GETDATE(), 1, 'Validación de ganancia.', GETDATE()
FROM pv_versionPropuesta
WHERE propuestaID = (
    SELECT propuestaID FROM pv_proyecto WHERE proyectoID = @proyectoID
)
ORDER BY NEWID();

-- Seleccionar usuarios para fiscalización
SELECT TOP 1 @usuario1 = userID FROM pv_usuarios ORDER BY NEWID();
SELECT TOP 1 @usuario2 = userID FROM pv_usuarios WHERE userID <> @usuario1 ORDER BY NEWID();

INSERT INTO pv_fiscalizacionGanancias (
    reporteID, usuarioID, estadoFiscalizacionID, comentarios, hashFiscalizacion
)
VALUES
(@reporteID, @usuario1, 2, 'Fiscalización aprobada.',
 HASHBYTES('SHA2_256', CONCAT(@reporteID, '|', @usuario1, '|', 2))),
(@reporteID, @usuario2, 3, 'Observaciones menores.',
 HASHBYTES('SHA2_256', CONCAT(@reporteID, '|', @usuario2, '|', 3)));

--  Crear tabla temporal de equity
IF OBJECT_ID('tempdb..#Equity') IS NOT NULL DROP TABLE #Equity;

SELECT 
    i.usuarioID,
    i.transaccionID,
    t.monto,
    CAST(t.monto AS FLOAT) / SUM(CAST(t.monto AS FLOAT)) OVER() AS porcentaje,
    ROUND(CAST(t.monto AS FLOAT) / SUM(CAST(t.monto AS FLOAT)) OVER() * @montoGanancia, 2) AS montoDistribuido
INTO #Equity
FROM pv_inversion i
INNER JOIN pv_transaccion t ON i.transaccionID = t.transaccionID
WHERE i.proyectoID = @proyectoID;

-- Insertar dividendos en pv_distribucionDividendos
DECLARE @usuarioID INT, @transaccionID INT, @montoDistribuido DECIMAL(18,2), @fecha DATETIME;

DECLARE cur CURSOR FOR
    SELECT usuarioID, transaccionID, montoDistribuido
    FROM #Equity;

OPEN cur;
FETCH NEXT FROM cur INTO @usuarioID, @transaccionID, @montoDistribuido;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @fecha = GETDATE();

    INSERT INTO pv_distribucionDividendos (
        proyectoID, usuarioID, transaccionID, montoDistribuido, fechaDistribucion, hashVerificacion
    )
    VALUES (
        @proyectoID, @usuarioID, @transaccionID, @montoDistribuido, @fecha,
        HASHBYTES('SHA2_256', CONCAT(@usuarioID, '|', @montoDistribuido, '|', @fecha))
    );

    FETCH NEXT FROM cur INTO @usuarioID, @transaccionID, @montoDistribuido;
END;

CLOSE cur;
DEALLOCATE cur;
DROP TABLE #Equity;

PRINT CONCAT('Distribución realizada para proyecto ', @proyectoID, ' con ganancia ', @montoGanancia);
