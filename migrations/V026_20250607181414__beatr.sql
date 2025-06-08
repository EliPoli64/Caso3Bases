-- Insertar métodos de pago generales
INSERT INTO pv_metodosPago (nombre, esActivo, configuracionJSON, logoURL) 
VALUES 
('SINPE Móvil', 1, '{"tipo":"qr", "monedas":["CRC"], "requiereValidacion":true}', 'https://sinpemovil.cr/media/logo.png'),
('Transferencia BCR', 1, '{"tipo":"transferencia", "monedas":["CRC","USD"], "requiereCuenta":true}', 'https://plazareal.co.cr/wp-content/uploads/2015/11/Logos-PR-BCR.png'),
('Transferencia BAC', 1, '{"tipo":"transferencia", "monedas":["CRC","USD"], "requiereCuenta":true}', 'https://www.aedcr.com/sites/default/files/2022-05/logo_bacredomatic.png'),
('Transferencia Scotiabank', 1, '{"tipo":"transferencia", "monedas":["CRC","USD"], "requiereCuenta":true}', 'https://amcham.cr/wp-content/uploads/2019/02/scotiabnk.jpg'),
('Tarjeta Visa', 1, '{"tipo":"tarjeta", "monedas":["CRC","USD"], "procesador":"Stripe"}', 'https://sterling.ng/wp-content/uploads/2024/12/Visa-Logo-2006.png'),
('Tarjeta Mastercard', 1, '{"tipo":"tarjeta", "monedas":["CRC","USD"], "procesador":"Stripe"}', 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg');