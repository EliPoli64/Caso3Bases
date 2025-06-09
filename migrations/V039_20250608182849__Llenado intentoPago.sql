-- Insertar intentos de pago para el sistema de crowdfunding
INSERT INTO dbo.pv_intentoPago (
    monto, 
    actualMonto, 
    resultado, 
    numeroAuth, 
    reference, 
    tokenCargo, 
    descripcion, 
    fecha, 
    checksum, 
    metodoPagoID, 
    monedaID
)
VALUES
    -- Pago 1: Aprobado (SINPE Móvil, CRC) - DEBE tener numeroAuth
    (
        500000.00, 
        500000.00, 
        'Aprobado', 
        'AUTH123456',  -- Número de autorización para transacción aprobada
        'REF78901', 
        HASHBYTES('SHA2_256', 'TOKEN_500K_' + CONVERT(VARCHAR(36), NEWID())), 
        'Inversión en proyecto de energía solar', 
        DATEADD(DAY, -10, GETDATE()), 
        HASHBYTES('SHA2_256', '500000.00AprobadoREF78901' + CONVERT(VARCHAR(36), NEWID())), 
        1,  -- SINPE Móvil
        1   -- CRC
    ),
    -- Pago 2: Aprobado (Tarjeta Visa, USD) - DEBE tener numeroAuth
    (
        250000.00, 
        250000.00, 
        'Aprobado', 
        'AUTH654321',  -- Número de autorización para transacción aprobada
        'REF78902', 
        HASHBYTES('SHA2_256', 'TOKEN_250K_' + CONVERT(VARCHAR(36), NEWID())), 
        'Inversión en proyecto de turismo rural', 
        DATEADD(DAY, -8, GETDATE()), 
        HASHBYTES('SHA2_256', '250000.00AprobadoREF78902' + CONVERT(VARCHAR(36), NEWID())), 
        5,  -- Tarjeta Visa
        5   -- USD
    ),
    -- Pago 3: Aprobado (Transferencia BAC, CRC) - DEBE tener numeroAuth
    (
        1000000.00, 
        1000000.00, 
        'Aprobado', 
        'AUTH987654',  -- Número de autorización para transacción aprobada
        'REF78903', 
        HASHBYTES('SHA2_256', 'TOKEN_1M_' + CONVERT(VARCHAR(36), NEWID())), 
        'Inversión en proyecto de agricultura sostenible', 
        DATEADD(DAY, -5, GETDATE()), 
        HASHBYTES('SHA2_256', '1000000.00AprobadoREF78903' + CONVERT(VARCHAR(36), NEWID())), 
        3,  -- Transferencia BAC
        1   -- CRC
    ),
    -- Pago 4: Pendiente (Transferencia BCR, CRC) - Si no permite NULL, usar un valor por defecto
    (
        750000.00, 
        0.00, 
        'Pendiente', 
        'PENDING_AUTH',  -- Valor por defecto para transacciones pendientes
        'REF78904', 
        HASHBYTES('SHA2_256', 'TOKEN_750K_' + CONVERT(VARCHAR(36), NEWID())), 
        'Inversión en proyecto de tecnología educativa', 
        DATEADD(DAY, -2, GETDATE()), 
        HASHBYTES('SHA2_256', '750000.00PendienteREF78904' + CONVERT(VARCHAR(36), NEWID())), 
        2,  -- Transferencia BCR
        1   -- CRC
    ),
    -- Pago 5: Rechazado (Tarjeta Mastercard, USD) - Si no permite NULL, usar un valor por defecto
    (
        300000.00, 
        0.00, 
        'Rechazado', 
        'DECLINED_AUTH',  -- Valor por defecto para transacciones rechazadas
        'REF78905', 
        HASHBYTES('SHA2_256', 'TOKEN_300K_' + CONVERT(VARCHAR(36), NEWID())), 
        'Inversión en proyecto de reciclaje comunitario - Fondos insuficientes', 
        DATEADD(DAY, -7, GETDATE()), 
        HASHBYTES('SHA2_256', '300000.00RechazadoREF78905' + CONVERT(VARCHAR(36), NEWID())), 
        6,  -- Tarjeta Mastercard
        5   -- USD
    );