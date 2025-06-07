-- Script llenado monedas y tazas de cambio


-- Hubo un pequeño error de diseño, donde tasaCambio tenía unos errores, esta es la corrección:
--Use VotoPV01
--go
--EXEC sp_rename 'dbo.pv_tasaCambio.monedaID', 'monedaOrigen', 'COLUMN';
--ALTER TABLE dbo.pv_tasaCambio
--ADD monedaDestino INT NOT NULL
--CONSTRAINT FK_pv_tasaCambio_py_moneda_Destino FOREIGN KEY REFERENCES dbo.pv_moneda(monedaID);
-- Fin de Corrección -> Ejecutar una única vez.

INSERT INTO dbo.pv_moneda  (codigo, nombre, simbolo, esPredeterminada)
VALUES
    ('CRC', 'Colón Costarricense', '₡', 0),
    ('COP', 'Peso Colombiano', '$', 0),
    ('MXN', 'Peso Mexicano', '$', 0),
	('EUR', 'Euro', '€', 0),
	('USD', 'Dolar Estadounidense', '$', 1);

INSERT INTO dbo.pv_tasaCambio (monedaOrigen,monedaDestino,fechaInicio,fechaFin,tasa,activa,fechaCreacion) VALUES
-- De Dólar a Colones (USD to CRC)
(5, 1, '2025-01-01 00:00:00', NULL, 530.00, 1, GETDATE()),
(5, 1, '2025-01-01 00:00:00', NULL, 520.50, 1, GETDATE()),
-- De Colones a Dólar (CRC to USD)
(1, 5, '2025-01-01 00:00:00', NULL, 0.001886, 1, GETDATE()),
(1, 5, '2025-01-01 00:00:00', NULL, 0.001921, 1, GETDATE()), 
-- De Dólar a Pesos Colombianos 
(5, 2, '2025-01-01 00:00:00', NULL, 3900.00, 1, GETDATE()),
(5, 2, '2025-01-01 00:00:00', NULL, 3850.00, 1, GETDATE()),
-- De PesosColombianos a Dólar
(2, 5, '2025-01-01 00:00:00', NULL, 0.000256, 1, GETDATE()),
(2, 5, '2025-01-01 00:00:00', NULL, 0.000260, 1, GETDATE()), 
-- De Dólar a Pesos Mexicanos
(5, 3, '2025-01-01 00:00:00', NULL, 17.00, 1, GETDATE()),
(5, 3, '2025-01-01 00:00:00', NULL, 16.50, 1, GETDATE()),
-- De Pesos Mexicanos a Dólar
(3, 5, '2025-01-01 00:00:00', NULL, 0.05882, 1, GETDATE()),
(3, 5, '2025-01-01 00:00:00', NULL, 0.06060, 1, GETDATE()),
-- De Dólar a Euros
(5, 4, '2025-01-01 00:00:00', NULL, 0.92, 1, GETDATE()),
(5, 4, '2025-01-01 00:00:00', NULL, 0.91, 1, GETDATE()),
-- De Euros a Dólar
(4, 5, '2025-01-01 00:00:00', NULL, 1.0869, 1, GETDATE()), 
(4, 5, '2025-01-01 00:00:00', NULL, 1.0989, 1, GETDATE()), 
-- De Euros a Colones
(4, 1, '2025-01-01 00:00:00', NULL, 575.00, 1, GETDATE()),
(4, 1, '2025-01-01 00:00:00', NULL, 565.00, 1, GETDATE()),
-- De Colones a Euros
(1, 4, '2025-01-01 00:00:00', NULL, 0.001739, 1, GETDATE()), 
(1, 4, '2025-01-01 00:00:00', NULL, 0.001769, 1, GETDATE());