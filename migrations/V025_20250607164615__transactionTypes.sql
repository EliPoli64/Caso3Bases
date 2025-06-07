BEGIN TRANSACTION;

-- 1. pv_tipoTransaccion (Tipos de transacción)
INSERT INTO pv_tipoTransaccion (nombre, descripcion, fechaCreacion)
VALUES 
('Inversión', 'Transacciones de inversión en proyectos', GETDATE()),
('Dividendos', 'Distribución de ganancias a inversionistas', GETDATE()),
('Reembolso', 'Devolución de fondos a inversionistas', GETDATE()),
('Pago Proveedores', 'Pagos a proveedores del proyecto', GETDATE()),
('Gastos Operativos', 'Gastos administrativos del proyecto', GETDATE());

-- 2. pv_subTipoTransaccion (Subtipos específicos)
INSERT INTO pv_subTipoTransaccion (tipoTransaccionID, nombre, descripcion, fechaCreacion)
SELECT 
    tt.tipoTransaccionID,
    sub.nombre,
    sub.descripcion,
    GETDATE()
FROM pv_tipoTransaccion tt
CROSS JOIN (
    VALUES 
    ('Inicial', 'Inversión inicial en proyecto'),
    ('Adicional', 'Inversión adicional en proyecto'),
    ('Mensual', 'Dividendo mensual'),
    ('Final', 'Dividendo final de liquidación'),
    ('Parcial', 'Reembolso parcial'),
    ('Total', 'Reembolso total')
) AS sub(nombre, descripcion)
WHERE tt.nombre IN ('Inversión', 'Dividendos', 'Reembolso');