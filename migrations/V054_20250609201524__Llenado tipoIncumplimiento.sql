INSERT INTO pv_tipoIncumplimiento (nombre, severidadIncumplimientoID) VALUES
-- Incumplimientos en entregables de sprints
('Retraso en entrega de sprint (1-3 días)', 1),
('Retraso en entrega de sprint (4-7 días)', 2),
('Retraso en entrega de sprint (+8 días)', 3),
('Entrega incompleta de sprint', 2),
('Entrega falsa de objetivos de sprint', 3),
('No presentación de avances de sprint', 3),
('Justificación insuficiente de retraso', 1),

-- Incumplimientos en reportes financieros
('Retraso en reporte financiero (1-7 días)', 1),
('Retraso en reporte financiero (+7 días)', 2),
('Reporte financiero incompleto', 2),
('Reporte financiero con errores graves', 3),
('Falsificación de reporte financiero', 3),
('Omisión de gastos en reporte', 3),

-- Incumplimientos en uso de fondos
('Desvío menor de fondos (<10% presupuesto)', 2),
('Desvío mayor de fondos (10-30% presupuesto)', 3),
('Desvío crítico de fondos (>30% presupuesto)', 3),
('Uso de fondos para ítems no aprobados', 3),
('Falta de comprobantes de gastos', 2),


-- Incumplimientos en comunicación
('Falta de comunicación (1 semana)', 1),
('Falta de comunicación (2-3 semanas)', 2),
('Falta de comunicación (+1 mes)', 3),
('Información engañosa a inversionistas', 3),
('Ocultamiento de problemas del proyecto', 3),

-- Incumplimientos en calidad
('Baja calidad en entregables', 2),
('Entregables no funcionales', 3),
('Incumplimiento de especificaciones', 2),
('Uso de materiales no aprobados', 2),
('Reducción no autorizada de calidad', 3),

-- Incumplimientos en transparencia
('Limitación de acceso a fiscalizadores', 2),
('Ocultamiento de información clave', 3),
('Falsificación de evidencias de avance', 3),
('Manipulación de datos de progreso', 3);