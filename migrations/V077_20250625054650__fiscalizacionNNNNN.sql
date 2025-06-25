--que importante

CREATE TABLE pv_estadoFiscalizacion (
    estadoFiscalizacionID INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL
);
INSERT INTO pv_estadoFiscalizacion (nombre)
VALUES ('Pendiente'), ('Aprobado'), ('Rechazado');

CREATE TABLE pv_reporteGanancias (
    reporteID INT IDENTITY(1,1) PRIMARY KEY,
    proyectoID INT NOT NULL,
    fechaReporte DATETIME NOT NULL DEFAULT GETDATE(),
    montoGanancia DECIMAL(18,2) NOT NULL,
    validado BIT NOT NULL DEFAULT 0,
    aprobadoPor INT NULL,
    hashReporte VARBINARY(256) NOT NULL
);

CREATE TABLE pv_fiscalizacionGanancias (
    fiscalizacionID INT IDENTITY(1,1) PRIMARY KEY,
    reporteID INT NOT NULL,
    usuarioID INT NOT NULL,
    fechaFiscalizacion DATETIME NOT NULL DEFAULT GETDATE(),
    estadoFiscalizacionID INT NOT NULL,
    comentarios NVARCHAR(500),
    hashFiscalizacion VARBINARY(256) NOT NULL
);

--las fksssss
ALTER TABLE pv_reporteGanancias
ADD CONSTRAINT FK_ReGan_Proyecto FOREIGN KEY (proyectoID) REFERENCES pv_proyecto(proyectoID);

ALTER TABLE pv_reporteGanancias
ADD CONSTRAINT FK_ReGan_UsuarioAprob FOREIGN KEY (aprobadoPor) REFERENCES pv_usuarios(userID);

ALTER TABLE pv_fiscalizacionGanancias
ADD CONSTRAINT FK_FisGan_Reporte FOREIGN KEY (reporteID) REFERENCES pv_reporteGanancias(reporteID);

ALTER TABLE pv_fiscalizacionGanancias
ADD CONSTRAINT FK_FisGan_Usuario FOREIGN KEY (usuarioID) REFERENCES pv_usuarios(userID);

ALTER TABLE pv_fiscalizacionGanancias
ADD CONSTRAINT FK_FisGan_Estado FOREIGN KEY (estadoFiscalizacionID) REFERENCES pv_estadoFiscalizacion(estadoFiscalizacionID);
