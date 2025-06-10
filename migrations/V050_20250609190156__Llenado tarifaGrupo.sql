-- Insertar tarifas para grupos validadores
SET IDENTITY_INSERT pv_tarifaGrupo ON;
INSERT INTO pv_tarifaGrupo (tarifaID, grupoID, tipoTarifa, porcentaje, montoFijo, monedaID) VALUES
-- Tarifas para Comités Ciudadanos (sin costo)
(1, 1, 'Voluntario', 0, 0, 5), -- CRC
(2, 2, 'Voluntario', 0, 0, 5),
(3, 3, 'Voluntario', 0, 0, 5),

-- Tarifas para Aceleradoras (porcentaje sobre fondos recaudados)
(4, 4, 'Porcentaje', 5.0, 0, 5), -- 5% del total recaudado
(5, 5, 'Porcentaje', 4.5, 0, 5),
(6, 6, 'Porcentaje', 6.0, 0, 5),

-- Tarifas para Incubadoras (monto fijo + porcentaje)
(7, 7, 'Mixta', 2.0, 500, 5), -- 2% + $500 fijos
(8, 8, 'Mixta', 3.0, 300, 5),
(9, 9, 'Mixta', 1.5, 750, 5),

-- Tarifas para Grupos Inversores (solo porcentaje de equity)
(10, 10, 'Equity', 7.0, 0, 5), -- 7% de equity
(11, 11, 'Equity', 5.0, 0, 5),
(12, 12, 'Equity', 4.0, 0, 5),

-- Tarifas para Comités Técnicos (monto fijo por proyecto)
(13, 13, 'Fija', 0, 1200, 5), -- $1200 por proyecto
(14, 14, 'Fija', 0, 1000, 5),

-- Tarifas para Evaluadores de Hacienda (monto fijo)
(15, 15, 'Fija', 0, 800, 5), -- $800 por evaluación

-- Tarifas para Consejo Social (sin costo)
(16, 16, 'Voluntario', 0, 0, 5),

-- Tarifas para Comité Ambiental (monto fijo)
(17, 17, 'Fija', 0, 600, 5), -- $600 por evaluación

-- Tarifas para Validadores Documentales (monto por documento)
(18, 18, 'Fija', 0, 50, 5), -- $50 por documento

-- Tarifas para Fiscalizadores (monto mensual)
(19, 19, 'Fija', 0, 300, 5), -- $300/mes por proyecto

-- Tarifas para Comité Ético (sin costo)
(20, 20, 'Voluntario', 0, 0, 5);
SET IDENTITY_INSERT pv_tarifaGrupo OFF;
