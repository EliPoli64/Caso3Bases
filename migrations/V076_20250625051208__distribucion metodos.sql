use VotoPV01
-- DistribucionMetodos 
CREATE TABLE pv_distribucionDividendos (
    distribucionID INT IDENTITY(1,1) PRIMARY KEY,
    proyectoID INT NOT NULL,                      
    usuarioID INT NOT NULL,                       
    transaccionID BIGINT NOT NULL,                   
    montoDistribuido DECIMAL(18, 2) NOT NULL,     
    fechaDistribucion DATETIME NOT NULL DEFAULT GETDATE(), 
    hashVerificacion VARBINARY(256) NOT NULL    
);
-- FK a pv_proyecto


ALTER TABLE pv_distribucionDividendos
ADD CONSTRAINT FK_Distribucion_Proyecto
FOREIGN KEY (proyectoID) REFERENCES pv_proyecto(proyectoID);

-- FK a pv_usuarios


ALTER TABLE pv_distribucionDividendos
ADD CONSTRAINT FK_Distribucion_Usuario FOREIGN KEY (usuarioID)
    REFERENCES pv_usuarios(userID);

-- FK a pv_transaccion

ALTER TABLE pv_distribucionDividendos
ADD CONSTRAINT FK_Distribucion_Transaccion FOREIGN KEY (transaccionID)
    REFERENCES pv_transaccion(transaccionID);