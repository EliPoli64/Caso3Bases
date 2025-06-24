CREATE PROCEDURE [dbo].[invertir] 
	@proyecto VARCHAR(50),
	@monto DECIMAL(12,3),
	@moneda VARCHAR(3),
	@cedula VARCHAR(9),
	@contrasenna VARCHAR(50)
AS BEGIN
	SET NOCOUNT ON
	-- Variables a Utilizar --
	DECLARE @proyectoID INT;
    DECLARE @existeProyecto BIT = 0;
	DECLARE @maximaInversion INT;
	DECLARE @usuario INT;
	DECLARE @idAprobado INT;
	DECLARE @llaveCifrada VARBINARY(256);
	DECLARE @montoReal DECIMAL(12,3);
	DECLARE @tasaCambioID INT;
	DECLARE @monedaOrigen INT;
	DECLARE @monedaDestino INT;
	---------------------------
	SELECT @idAprobado = statusRegistroID FROM pv_statusRegistro WHERE nombre like 'Registrado' 
	
	-- Verfificación de la identidad --
	SELECT @usuario = userid FROM pv_usuarios WHERE identificacion = @cedula;
	IF ((SELECT statusRegistroID FROM pv_StatusRegistroUsuarios WHERE @usuario = usuarioID) <> @idAprobado)
	BEGIN
		RAISERROR('El usuario no se encuentra registrado', 16, 1);
        RETURN -1;
	END
	SELECT @llaveCifrada = llaveCifrada FROM pv_llavesUsuarios WHERE usuarioID = @usuario;
	IF (DECRYPTBYPASSPHRASE(@contrasenna, @llaveCifrada) IS NULL)
	BEGIN 
		RAISERROR('Contraseña incorrecta', 16, 1);
		RETURN -1
	END
	
	-- Verificación del proyecto --
	SELECT @proyectoID = proyectoID FROM pv_proyecto WHERE nombre LIKE @proyecto;
	IF @proyectoID IS NULL
    BEGIN
        RAISERROR('El proyecto especificado no existe', 16, 1);
        RETURN -1;
    END 
	IF (@moneda <> 'CRC')
	BEGIN
		DECLARE @tasaCambio DECIMAL(19,6);
		SELECT @monedaOrigen = monedaID FROM pv_moneda WHERE codigo LIKE @moneda;
		SELECT @monedaDestino = monedaID FROM pv_moneda WHERE codigo LIKE 'CRC';
		SELECT @tasaCambio = tasa, @tasaCambioID = tasaCambioID FROM pv_tasaCambio WHERE monedaOrigen = @monedaOrigen AND monedaDestino = @monedaDestino;
		SET @montoReal = ROUND(@monto * @tasaCambio, 3);
	END
	ELSE
	BEGIN 
		SET @montoReal = @monto;
	END
	IF ((SELECT montoPedido FROM pv_proyecto WHERE proyectoID = @proyectoID) < @montoReal)
	BEGIN
		RAISERROR('La inversión excede el máximo solicitado', 16, 1);
        RETURN -1
	END
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
	BEGIN TRANSACTION
	-- Inserción del intento de Pago --
	INSERT INTO pv_intentoPago (monto, actualMonto, resultado, numeroAuth, reference, tokenCargo,
	descripcion, fecha, checksum, metodoPagoID, monedaID) VALUES ();
	-- Inserción de la transacción --
	INSERT INTO pv_transaccion 
	(usuarioID, proyectoID, monto, montoConvertido, descripcion, 
	fechaTransaccion, fechaRegistro, referencia, checksum, subTipoTransaccionID,
	tasaCambioID, intentoPagoID) VALUES ();
	-- Inserción de la inversión --
	INSERT INTO pv_inversion (proyectoID, usuarioID, transaccionID, organizacionID)
	VALUES ();


END