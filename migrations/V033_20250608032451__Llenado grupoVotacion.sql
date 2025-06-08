-- Activar IDENTITY_INSERT para la tabla
SET IDENTITY_INSERT pv_grupoVotacion ON;
-- Grupos basados en edad
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(1, 'Jóvenes 18-25 años', 'Ciudadanos entre 18 y 25 años de edad', 'Demográfico', 1),
(2, 'Adultos 26-40 años', 'Ciudadanos entre 26 y 40 años de edad', 'Demográfico', 1),
(3, 'Adultos 41-60 años', 'Ciudadanos entre 41 y 60 años de edad', 'Demográfico', 1),
(4, 'Adultos mayores 61+ años', 'Ciudadanos de 61 años en adelante', 'Demográfico', 1);

-- Grupos basados en género
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(5, 'Mujeres', 'Ciudadanas de género femenino', 'Demográfico', 1),
(6, 'Hombres', 'Ciudadanos de género masculino', 'Demográfico', 1),
(7, 'Otros géneros', 'Ciudadanos con identidad de género diversa', 'Demográfico', 1);

-- Grupos basados en educación
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(8, 'Educación primaria', 'Ciudadanos con educación primaria completa', 'Educativo', 1),
(9, 'Educación secundaria', 'Ciudadanos con educación secundaria completa', 'Educativo', 1),
(10, 'Educación universitaria', 'Ciudadanos con educación universitaria completa', 'Educativo', 1),
(11, 'Posgrado', 'Ciudadanos con estudios de posgrado', 'Educativo', 1);

-- Grupos basados en ubicación geográfica
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(12, 'San José Central', 'Ciudadanos residentes en el cantón central de San José', 'Geográfico', 1),
(13, 'Heredia Centro', 'Ciudadanos residentes en el cantón central de Heredia', 'Geográfico', 1),
(14, 'Alajuela Central', 'Ciudadanos residentes en el cantón central de Alajuela', 'Geográfico', 1),
(15, 'Cartago Centro', 'Ciudadanos residentes en el cantón central de Cartago', 'Geográfico', 1),
(16, 'Turrialba', 'Ciudadanos residentes en el cantón de Turrialba', 'Geográfico', 1),
(17, 'Puntarenas Centro', 'Ciudadanos residentes en el cantón central de Puntarenas', 'Geográfico', 1),
(18, 'Limón Central', 'Ciudadanos residentes en el cantón central de Limón', 'Geográfico', 1),
(19, 'Zona Norte', 'Ciudadanos residentes en la zona norte del país', 'Geográfico', 1),
(20, 'Zona Sur', 'Ciudadanos residentes en la zona sur del país', 'Geográfico', 1);

-- Grupos basados en situación laboral
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(21, 'Empleados formales', 'Ciudadanos con empleo formal registrado', 'Laboral', 1),
(22, 'Empleados informales', 'Ciudadanos con empleo no registrado', 'Laboral', 1),
(23, 'Desempleados', 'Ciudadanos en búsqueda activa de empleo', 'Laboral', 1),
(24, 'Emprendedores', 'Ciudadanos con negocios propios registrados', 'Laboral', 1),
(25, 'Estudiantes', 'Ciudadanos matriculados en el sistema educativo', 'Laboral', 1),
(26, 'Jubilados', 'Ciudadanos pensionados', 'Laboral', 1);

-- Grupos combinados (como el ejemplo solicitado)
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(27, 'Adultos mayores emprendedores de Turrialba', 'Ciudadanos de 61+ años con negocios propios en Turrialba', 'Combinado', 1),
(28, 'Jóvenes estudiantes universitarios', 'Ciudadanos entre 18-25 años matriculados en universidad', 'Combinado', 1),
(29, 'Mujeres emprendedoras 26-40 años', 'Mujeres entre 26-40 años con negocios propios', 'Combinado', 1),
(30, 'Hombres técnicos zona norte', 'Hombres con educación técnica en la zona norte del país', 'Combinado', 1);

-- Grupos especiales para crowdfunding
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(31, 'Inversionistas pequeños', 'Ciudadanos con historial de pequeñas inversiones', 'Crowdfunding', 1),
(32, 'Inversionistas medianos', 'Ciudadanos con historial de inversiones medianas', 'Crowdfunding', 1),
(33, 'Fiscalizadores activos', 'Ciudadanos con historial de participación en fiscalización', 'Crowdfunding', 1),
(34, 'Emprendedores tecnológicos', 'Ciudadanos con emprendimientos en el área tecnológica', 'Crowdfunding', 1),
(35, 'Emprendedores turísticos', 'Ciudadanos con emprendimientos en el área turística', 'Crowdfunding', 1);

-- Grupos institucionales
INSERT INTO pv_grupoVotacion (grupoVotacionID, nombre, descripcion, tipoGrupo, esSegmentado) VALUES
(36, 'Funcionarios públicos', 'Empleados del sector público', 'Institucional', 1),
(37, 'Miembros de cámaras', 'Afiliados a cámaras empresariales', 'Institucional', 1),
(38, 'Asociaciones comunales', 'Miembros de asociaciones de desarrollo comunal', 'Institucional', 1),
(39, 'Organizaciones ambientales', 'Miembros de organizaciones ambientalistas', 'Institucional', 1),
(40, 'Colegios profesionales', 'Miembros de colegios profesionales', 'Institucional', 1);
-- Desactivar IDENTITY_INSERT al finalizar
SET IDENTITY_INSERT pv_grupoVotacion OFF;