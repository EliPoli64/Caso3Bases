-- Insertar métodos disponibles para bancos costarricenses
INSERT INTO pv_metodosDisponibles (
    nombre,
    JSONconfigurado,
    refreshToken,
    token,
    expToken,
    maskAccount,
    metodoID,
    esActivo
)
VALUES
-- SINPE Móvil
(
    'SINPE Móvil',
    '{"moneda":"CRC","requiereValidacion":true,"tipo":"QR"}',
    CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', 'refreshtoken_sinpe_1'), 2),
    CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', 'token_sinpe_1'), 2),
    DATEADD(MONTH, 6, GETDATE()),
    '****8943',
    1, -- ID de SINPE Móvil en pv_metodosPago
    1
),
-- Banco de Costa Rica (BCR)
(
    'Cuenta BCR Ahorros',
    '{"moneda":"CRC","requiereCuenta":true,"tipo":"transferencia"}',
    CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', 'refreshtoken_bcr_1'), 2),
    CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', 'token_bcr_1'), 2),
    DATEADD(YEAR, 1, GETDATE()),
    '****5678',
    2, -- ID de Transferencia BCR
    1
),
-- BAC Credomatic
(
    'Cuenta BAC Dollar',
    '{"moneda":"USD","requiereCuenta":true,"tipo":"transferencia"}',
    CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', 'refreshtoken_bac_1'), 2),
    CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', 'token_bac_1'), 2),
    DATEADD(YEAR, 1, GETDATE()),
    '****9012',
    3, -- ID de Transferencia BAC
    1
),
-- Scotiabank
(
    'Cuenta Scotiabank Corriente',
    '{"moneda":"CRC","requiereCuenta":true,"tipo":"transferencia"}',
    CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', 'refreshtoken_scotia_1'), 2),
    CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', 'token_scotia_1'), 2),
    DATEADD(YEAR, 1, GETDATE()),
    '****3456',
    4, -- ID de Transferencia Scotiabank
    1
),
-- Visa (Tarjeta)
(
    'Visa Platinum',
    '{"moneda":"USD","procesador":"Stripe","tipo":"tarjeta"}',
    CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', 'refreshtoken_visa_1'), 2),
    CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', 'token_visa_1'), 2),
    DATEADD(MONTH, 12, GETDATE()),
    '****7890',
    5, -- ID de Tarjeta Visa
    1
);