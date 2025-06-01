USE VotoPV
INSERT INTO pv_paises(nombre, esPermitido)
VALUES ('Costa Rica', 1),('España', 1),
('México', 1),('Colombia', 1);

INSERT INTO pv_provincias(nombre, paisid)
VALUES ('San José', 1),('Alajuela', 1),('Cartago', 1),('Heredia', 1),('Guanacaste', 1),
('Puntarenas', 1),('Limón', 1),('Madrid', 2),('Barcelona', 2),('Valencia', 2),('Ciudad de México', 3),
('Jalisco', 3),('Nuevo León', 3),('Bogotá D.C.', 4),('Antioquia', 4);

INSERT INTO pv_cantones(nombre, provinciaID)
VALUES ('Central', 1),('Desamparados', 1),('Central', 2),('Liberia', 5),
('Central', 3),('Central', 4),('Central', 6),('Central', 7),('Madrid', 8),
('Barcelona', 9),('Valencia', 10),('Cuauhtémoc', 11),('Guadalajara', 12),
('Monterrey', 13),('Medellín', 15);

INSERT INTO pv_distrito(nombre, cantonID)
VALUES ('Carmen', 1),('Merced', 1),('Desamparados', 2),('Alajuela', 3),
('Liberia', 4),('Oriental', 5),('Heredia', 6),('Puntarenas', 7),
('Centro', 9),('Gótico', 10),('Ciudad Vieja', 11),('Roma', 12),
('Centro', 13),('Centro', 14),('El Poblado', 15);

INSERT INTO pv_ubicaciones(paisID, proviniciaID, cantonID, distritoID)
VALUES (1, 1, 1, 1),(1, 1, 1, 2),(1, 1, 2, 3),(1, 2, 3, 4),
(1, 5, 4, 5),(1, 3, 5, 6),(1, 4, 6, 7),(1, 6, 7, 8),
(2, 8, 9, 9),(2, 9, 10, 10),(2, 10, 11, 11),(3, 11, 12, 12),
(3, 12, 13, 13),(3, 13, 14, 14),(4, 15, 15, 15);

INSERT INTO pv_direcciones (linea1, linea2, distritoid, codigoPostal)
VALUES ('Avenida Central 123', 'Calle 5', 1, '10101'),
('Calle 20, #45-67', 'Frente al parque', 2, '10102'),
('Barrio Escalante 300', 'Casa verde', 3, '10103'),
('Alajuela Centro', 'Costado oeste de la catedral', 4, '20101'),
('Guanacaste, Liberia', 'De la iglesia 200m oeste', 5, '50101'),
('Cartago Centro', 'Diagonal al Banco Nacional', 6, '30101'),
('Heredia Centro', 'Frente al kiosko del parque', 7, '40101'),
('Puntarenas Centro', 'Costado del muelle', 8, '60101'),
('Calle Gran Vía 80', 'Piso 3, Puerta B', 9, '28013'),
('Las Ramblas 99', 'Planta baja', 10, '08002'),
('Calle Colón 27', NULL, 11, '46004'),
('Paseo de la Reforma 505', 'Departamento 1202', 12, '06500'),
('Avenida Vallarta 1250', 'Local 5', 13, '44100'),
('Morelos 500 Ote', NULL, 14, '64000'),
('Carrera 43A #7-50', 'Edificio inteligente', 15, '050022');