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
    HASHBYTES('SHA2_256', 'refreshtoken_sinpe_1'),  -- Binario directo
    HASHBYTES('SHA2_256', 'token_sinpe_1'),         -- Binario directo
    DATEADD(MONTH, 6, GETDATE()),
    '****8943',
    1,
    1
),
-- Banco de Costa Rica (BCR)
(
    'Cuenta BCR Ahorros',
    '{"moneda":"CRC","requiereCuenta":true,"tipo":"transferencia"}',
    HASHBYTES('SHA2_256', 'refreshtoken_bcr_1'),
    HASHBYTES('SHA2_256', 'token_bcr_1'),
    DATEADD(YEAR, 1, GETDATE()),
    '****5678',
    2,
    1
),
-- BAC Credomatic
(
    'Cuenta BAC Dollar',
    '{"moneda":"USD","requiereCuenta":true,"tipo":"transferencia"}',
    HASHBYTES('SHA2_256', 'refreshtoken_bac_1'),
    HASHBYTES('SHA2_256', 'token_bac_1'),
    DATEADD(YEAR, 1, GETDATE()),
    '****9012',
    3,
    1
),
-- Scotiabank
(
    'Cuenta Scotiabank Corriente',
    '{"moneda":"CRC","requiereCuenta":true,"tipo":"transferencia"}',
    HASHBYTES('SHA2_256', 'refreshtoken_scotia_1'),
    HASHBYTES('SHA2_256', 'token_scotia_1'),
    DATEADD(YEAR, 1, GETDATE()),
    '****3456',
    4,
    1
),
-- Visa (Tarjeta)
(
    'Visa Platinum',
    '{"moneda":"USD","procesador":"Stripe","tipo":"tarjeta"}',
    HASHBYTES('SHA2_256', 'refreshtoken_visa_1'),
    HASHBYTES('SHA2_256', 'token_visa_1'),
    DATEADD(MONTH, 12, GETDATE()),
    '****7890',
    5,
    1
);