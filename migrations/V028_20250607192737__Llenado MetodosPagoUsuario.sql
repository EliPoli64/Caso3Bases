-- Asignar métodos de pago a usuarios (ejemplo para 5 usuarios)
INSERT INTO pv_metodosPagoUsuarios (
    metodoDisponibleID,
    usuarioID
)
SELECT
    metodoDisponibleID,
    userid
FROM (
    SELECT 
        userid,
        NTILE(5) OVER (ORDER BY NEWID()) AS grupo  -- Divide usuarios en 5 grupos
    FROM pv_usuarios
) AS usuarios_grupos
CROSS JOIN (
    SELECT metodoDisponibleID 
    FROM pv_metodosDisponibles 
    WHERE esActivo = 1
) AS metodos
WHERE 
    usuarios_grupos.grupo = 1  -- Asigna métodos solo al primer grupo (20% de usuarios)
    AND RAND(CHECKSUM(NEWID())) > 0.5;  -- Aleatoriedad (50% de probabilidad)