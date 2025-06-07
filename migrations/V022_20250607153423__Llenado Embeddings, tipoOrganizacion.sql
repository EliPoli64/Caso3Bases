SET NOCOUNT ON;
USE VotoPV01;

DECLARE @i INT = 1;
WHILE @i <= 200
BEGIN
    INSERT INTO dbo.pv_embeddingsIA (tipo, embedding, dimensionesVector, modeloEmbedding, fechaCreacion)
    VALUES (
        'texto',
        REPLICATE('0.1 ', 768), -- Simula vector
        768,
        'text-embedding-ada-002',
        GETDATE()
    );
    SET @i += 1;
END;

INSERT INTO dbo.pv_tipoOrganizacion (nombreTipo)
VALUES
    ('Organización Gubernamental'),
    ('Organización No Gubernamental (ONG)'),
    ('Empresa Privada'),
    ('Institución Educativa'),
    ('Asociación Civil'),
    ('Fundación'),
    ('Cooperativa'),
    ('Sindicato'),
    ('Grupo Comunitario'),
    ('Partido Político'),
    ('Organización Internacional'),
    ('Entidad Religiosa');