INSERT INTO dbo.pv_horarios (name, recurrentType, repetition, endType, endDate) VALUES
('Diario', 'Diario', 1, 'Never', NULL),
('Semanal Martes', 'Semanal', 1, 'After', '2026-12-31 00:00:00'),
('Mensual Primer Lunes', 'Mensual', 1, 'Never', NULL),
('Anual Enero', 'Anual', 1, 'Never', NULL),
('Cada 3 Días', 'Diario', 3, 'After', '2025-12-31 00:00:00');