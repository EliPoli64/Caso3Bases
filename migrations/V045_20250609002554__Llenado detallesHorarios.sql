INSERT INTO dbo.pv_detallesHorarios (deleted, baseDate, datePart, lastExecution, nextExecution, horarioId) VALUES
-- Horario diario para actualización de estados de propuestas
(0, '2025-01-01 00:00:00', 1, '2025-06-08 23:59:59', '2025-06-09 23:59:59', 1),

-- Horario semanal (martes) para procesos de validación de identidad
(0, '2025-01-06 00:00:00', 2, '2025-06-03 09:00:00', '2025-06-10 09:00:00', 2),

-- Horario mensual (primer lunes) para distribución de dividendos
(0, '2025-01-05 00:00:00', 3, '2025-06-02 10:00:00', '2025-07-07 10:00:00', 3),

-- Horario anual (enero) para renovación de credenciales
(0, '2025-01-01 00:00:00', 4, '2025-01-01 00:00:00', '2026-01-01 00:00:00', 4),

-- Horario cada 3 días para notificaciones de votaciones próximas
(0, '2025-01-01 00:00:00', 1, '2025-06-07 18:00:00', '2025-06-10 18:00:00', 5),

-- Detalle adicional para horario diario (ejecución matutina)
(0, '2025-01-01 08:00:00', 1, '2025-06-08 08:00:00', '2025-06-09 08:00:00', 1),

-- Detalle adicional para horario semanal (ejecución vespertina)
(0, '2025-01-06 15:00:00', 2, '2025-06-03 15:00:00', '2025-06-10 15:00:00', 2),

-- Detalle para proceso de backup (horario diario pero diferente hora)
(0, '2025-01-01 02:00:00', 1, '2025-06-09 02:00:00', '2025-06-10 02:00:00', 1),

-- Detalle para generación de reportes (horario mensual, diferente día)
(0, '2025-01-15 00:00:00', 3, '2025-05-15 00:00:00', '2025-06-15 00:00:00', 3),

-- Detalle para limpieza de logs (horario cada 3 días, noche)
(0, '2025-01-01 23:00:00', 1, '2025-06-07 23:00:00', '2025-06-10 23:00:00', 5);