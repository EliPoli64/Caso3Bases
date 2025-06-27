# Caso 3 Bases de Datos I: Voto Pura Vida   
## Integrantes:  
- Julián Castro Barrantes (2024119346)  
- Carlos García Molina (2024181023)  
- Elías Ramírez Hernández (2024090300)  
- Beatríz Díaz Gómez (2024090972)  
## Diseño General de la Base de Datos:    
## Endpoints API Serverless:  
## Stored Procedures:  
# Crear Actualizar Propuesta:  
## Python Endpoint  
```python
import json
import logging
import base64
import azure.functions as func
from shared.dtos import CrearActualizarPropuestaDTO
from shared.database import get_session
from sqlalchemy import text
from pydantic import ValidationError

def bytesAString(b: bytes) -> str:
    return base64.b64encode(b).decode('utf-8')

def json_bytes_serializer(obj):
    if isinstance(obj, bytes):
        return base64.b64encode(obj).decode('utf-8')
    raise TypeError(f"Type {type(obj)} not serializable")

async def main(req: func.HttpRequest) -> func.HttpResponse:
    try:
        dto = CrearActualizarPropuestaDTO(**req.get_json())
    except ValidationError as e:
        return func.HttpResponse(e.json(), status_code=400, mimetype="application/json")

    sp_call = text("""
        EXEC dbo.crearActualizarPropuesta
            @PropuestaID = :PropuestaID,
            @CategoriaID = :CategoriaID,
            @Descripcion = :Descripcion,
            @ImgURL = :ImgURL,
            @FechaInicio = :FechaInicio,
            @FechaFin = :FechaFin,
            @Comentarios = :Comentarios,
            @TipoPropuestaID = :TipoPropuestaID,
            @OrganizacionID = :OrganizacionID,
            @SegmentosDirigidosJS = :SegmentosDirigidosJS,
            @SegmentosImpactoJS = :SegmentosImpactoJS,
            @AdjuntosJS = :AdjuntosJS,
            @UsuarioAccion = :UsuarioAccion,
            @EquipoOrigen = :EquipoOrigen
    """)

    try:
        async with get_session() as session:
            params = dto.dict()
            params['Comentarios'] = int(params['Comentarios'])
            result = await session.execute(sp_call, params)
            await session.commit()
            rows = result.fetchall()
            print(f"Rows returned: {len(rows)}")

            resultList = []
            for row in rows:
                rowDict = dict(row._mapping)
                # Convierte checksum si existe
                if 'checksum' in rowDict and isinstance(rowDict['checksum'], bytes): # para debug solamente
                    rowDict['checksum'] = bytesAString(rowDict['checksum'])
                resultList.append(rowDict)
        logging.info(f"Result from SP: {resultList}")
        return func.HttpResponse(
            json.dumps({"result": resultList}, default=json_bytes_serializer),
            mimetype="application/json",
            status_code=200,
        )

    except Exception as ex:
        return func.HttpResponse(
            json.dumps({"error": str(ex)}),
            mimetype="application/json",
            status_code=500,
        )

"""
Función principal: main(req: func.HttpRequest) -> func.HttpResponse
Nombre: crearActualizarPropuesta

Parámetros de entrada (esperados en el JSON del body):
    - PropuestaID (int | null): ID de la propuesta (null si es nueva).
    - CategoriaID (int): ID de la categoría de la propuesta.
    - Descripcion (str): Texto descriptivo de la propuesta.
    - ImgURL (str): URL de la imagen representativa.
    - FechaInicio (str | null): Fecha de inicio en formato ISO 8601 (opcional).
    - FechaFin (str): Fecha de finalización en formato ISO 8601.
    - Comentarios (bool): Indica si se permiten comentarios en la propuesta.
    - TipoPropuestaID (int): Tipo de propuesta según clasificación.
    - OrganizacionID (int): ID de la organización que crea la propuesta.
    - SegmentosDirigidosJS (str): JSON serializado de IDs de segmentos dirigidos.
    - SegmentosImpactoJS (str): JSON serializado de IDs de segmentos de impacto.
    - AdjuntosJS (str): JSON serializado de documentos adjuntos.
    - UsuarioAccion (int): ID del usuario que realiza la acción.
    - EquipoOrigen (str): Nombre del equipo o servidor de origen.

Lógica interna:
    1. Si la propuesta es nueva (`PropuestaID` es null), se inserta un nuevo registro en `pv_propuestas`.
       - Se calcula el `checksum` con SHA-256.
       - Se asigna estado inicial “En Revisión”.
    2. Si la propuesta existe, se valida que el `UsuarioAccion` sea un proponente principal de la propuesta.
       - Si no lo es, se lanza un error.
       - Se actualiza la propuesta con los campos nuevos y se recalcula el `checksum`.
    3. Se calcula el número de versión siguiente y se inserta en `pv_versionPropuesta`.
    4. Si es una actualización, se marcan como eliminados (`deleted = 1`) los segmentos dirigidos anteriores.
    5. Si se recibe `SegmentosImpactoJS`, se actualizan o insertan los segmentos en `pv_propuestaSegmentosImpacto` con `MERGE`.
    6. Si se reciben `AdjuntosJS`, se insertan los documentos en `pv_documento`, se calcula `checksum`, y se vinculan a la propuesta.
    7. Se crea una entrada en `pv_validacionPropuesta` asociando la nueva versión a un grupo validador.
    8. Se registra en `pv_logs` el evento: creación o actualización de propuesta.
    9. La transacción se confirma; si ocurre error, se revierte todo y se retorna mensaje de error.


Ejemplo de uso (varía con cada llenado de la BD, hay que seleccionar un usuario que tenga permisos de
modificar esa propuesta si no es nula, esto se puede verificar con un simple SELECT en la BD):
{
  "PropuestaID": 1,
  "CategoriaID": 3,
  "Descripcion": "Propuesta para mejorar la infraestructura",
  "ImgURL": "https://example.com/imagen.jpg",
  "FechaInicio": null,
  "FechaFin": "2025-12-31T23:59:59",
  "Comentarios": true,
  "TipoPropuestaID": 2,
  "OrganizacionID": 62,
  "SegmentosDirigidosJS": "[1,2,3]",
  "SegmentosImpactoJS": "[4,5]",
  "AdjuntosJS": "[{\"nombre\": \"documento1.pdf\", \"tipoDocumentoID\": 1, \"idLegal\": \"123456789\"}, {\"nombre\": \"documento2.pdf\", \"tipoDocumentoID\": 2, \"idLegal\": \"987654321\"}]",
  "UsuarioAccion": 672,
  "EquipoOrigen": "ServidorApp01"
}

SELECT para verificar usuarios:
select * from pv_propuestas

Bitácora de lo acontecido:
- Se implementó la ejecución del procedimiento almacenado `crearActualizarPropuesta` usando `sqlalchemy.text`.
- Se incluyó soporte para codificación Base64 en campos tipo `bytes` para compatibilidad con JSON.
- Se validan los campos usando Pydantic (`CrearActualizarPropuestaDTO`), retornando errores de validación detallados.
- Se controla la transacción con `await session.commit()` y se captura cualquier excepción del proceso.
- Se utiliza `get_session` para obtener una sesión `AsyncSession` con contexto seguro.
"""
```
## SQL Stored Procedure  
```sql
CREATE PROCEDURE dbo.crearActualizarPropuesta
(
    @PropuestaID           INT             = NULL,      -- NULL = nueva
    @CategoriaID           INT, 
    @Descripcion           VARCHAR(200)    = NULL,
    @ImgURL                VARCHAR(300)    = NULL,
    @FechaInicio           DATETIME        = NULL,
    @FechaFin              DATETIME        = NULL,
    @Comentarios           BIT, -- AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    @TipoPropuestaID       INT,
    @OrganizacionID        INT             = NULL,
    @SegmentosDirigidosJS  NVARCHAR(MAX)   = NULL,      -- ej: [1,2,3]
    @SegmentosImpactoJS    NVARCHAR(MAX)   = NULL,      -- ej: [4,5]
    @AdjuntosJS            NVARCHAR(MAX)   = NULL,      -- ej: [{url:'...',tipo:1},...]
    @UsuarioAccion         INT,                         -- usuario que llama el SP
    @EquipoOrigen          VARCHAR(50)     = NULL
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DECLARE @Ahora DATETIME = SYSUTCDATETIME();
        IF @FechaInicio IS NULL SET @FechaInicio = @Ahora;

        BEGIN TRAN;

        -- valida permisos (solo para UPDATE)
        IF @PropuestaID IS NOT NULL
        BEGIN
            IF NOT EXISTS ( SELECT 1
                            FROM dbo.pv_proponente
                            WHERE propuestaID = @PropuestaID
                              AND usuarioID   = @UsuarioAccion
                              AND esPrincipal = 1 )
            BEGIN
                RAISERROR('El usuario no tiene permiso para modificar esta propuesta.',16,1);
                ROLLBACK; RETURN;
            END
        END

        -- insert/update de pv_propuestas
        DECLARE @EsNueva BIT = IIF(@PropuestaID IS NULL,1,0);

        IF @EsNueva = 1
			BEGIN
				INSERT dbo.pv_propuestas
				( categoriaid, descripcion, imgURL, fechaInicio,
				  userid, fechaFin, checksum, comentarios,
				  tipoPropuestaID, estadoID, organizacionID )
				VALUES
				( @CategoriaID, @Descripcion, @ImgURL, @FechaInicio,
				  @UsuarioAccion, @FechaFin,
				  HASHBYTES('SHA2_256', CONCAT_WS('|',@CategoriaID,@Descripcion,@ImgURL,@FechaInicio,@UsuarioAccion,@FechaFin,@Comentarios,@TipoPropuestaID,@OrganizacionID)),
				  @Comentarios, @TipoPropuestaID,
				  /* estado pendiente de validación */ (SELECT TOP(1) estadoID
														FROM dbo.pv_estadoPropuesta
														WHERE nombreEstado = N'En Revision' ),
				  @OrganizacionID );
				SELECT 'Propuesta creada.';

				SET @PropuestaID = SCOPE_IDENTITY();
			END
        ELSE
        BEGIN
            UPDATE dbo.pv_propuestas
              SET categoriaid     = @CategoriaID,
                  descripcion     = @Descripcion,
                  imgURL          = @ImgURL,
                  fechaInicio     = @FechaInicio,
                  fechaFin        = @FechaFin,
                  comentarios     = @Comentarios,
                  tipoPropuestaID = @TipoPropuestaID,
                  organizacionID  = @OrganizacionID,
                  checksum        = HASHBYTES('SHA2_256', CONCAT_WS('|',@CategoriaID,@Descripcion,@ImgURL,@FechaInicio,@UsuarioAccion,@FechaFin,@Comentarios,@TipoPropuestaID,@OrganizacionID))
            WHERE propuestaid = @PropuestaID;
        END

        -- ctrl versiones
        DECLARE @NuevoNumVersion INT;

        SELECT @NuevoNumVersion = ISNULL(MAX(numeroVersion),0)+1
        FROM   dbo.pv_versionPropuesta
        WHERE  propuestaID = @PropuestaID;

        INSERT dbo.pv_versionPropuesta
        (propuestaID, numeroVersion, descripcion, fechaCreacion)
        VALUES
        (@PropuestaID, @NuevoNumVersion, ISNULL(@Descripcion,'‑'), @Ahora);

        DECLARE @VersionID INT = SCOPE_IDENTITY();

        -- guardar segmentos meta
        -- elimina asociaciones previas solo en UPDATE
        IF @EsNueva = 0
		BEGIN
			UPDATE dbo.pv_propuestaSegmentosDirigidos
			   SET deleted   = 1,
				   checksum  = HASHBYTES('SHA2_256',
										 CONCAT_WS('|', propuestaID, segementoID, usuarioID, 1))
			 WHERE propuestaID = @PropuestaID
			   AND deleted     = 0;   -- solo las filas activas
		END

        -- inserta nuevos (json -> tabla)
        IF @SegmentosImpactoJS IS NOT NULL
		BEGIN
			;WITH jsonSeg (segID) AS (
				SELECT value
				  FROM OPENJSON(@SegmentosImpactoJS)
			)
			MERGE dbo.pv_propuestaSegmentosImpacto       AS tgt
			USING jsonSeg                                AS src
				  ON  tgt.propuestaID = @PropuestaID
				  AND tgt.segmentoID = src.segID
			WHEN MATCHED AND tgt.deleted = 1 THEN        -- ya existía pero estaba marcado como eliminado
				UPDATE SET deleted   = 0,
							usuarioID = @UsuarioAccion,
							checksum  = HASHBYTES('SHA2_256',
												  CONCAT_WS('|', @PropuestaID, src.segID, @UsuarioAccion, 0))
			WHEN NOT MATCHED THEN
				INSERT (propuestaID, segmentoID, usuarioID, deleted, checksum)
				VALUES (@PropuestaID,
						src.segID,
						@UsuarioAccion,
						0, -- activo
						HASHBYTES('SHA2_256',
								  CONCAT_WS('|', @PropuestaID, src.segID, @UsuarioAccion, 0)));
		END

        -- adjuntos
        IF @AdjuntosJS IS NOT NULL
        BEGIN
            DECLARE @Doc TABLE (documentoID INT);

            -- crea registros en pv_documento
            INSERT dbo.pv_documento (nombre, fechaCreacion, tipoDocumentoID, estadoDocumentoID,
                                     ultimaModificacion, esActual, idLegal, checksum)
            OUTPUT INSERTED.documentoID INTO @Doc(documentoID)
            SELECT JSON_VALUE(value,'$.nombre'),
                   @Ahora,
                   JSON_VALUE(value,'$.tipoDocumentoID'),
                   (SELECT TOP 1 estadoDocumentoID
                    FROM dbo.pv_estadoDocumento
                    WHERE nombre = N'En revisión'),
                   @Ahora,
                   1,
                   JSON_VALUE(value,'$.idLegal'),
                   HASHBYTES('SHA2_256', JSON_VALUE(value,'$.nombre'))
            FROM OPENJSON(@AdjuntosJS);

            -- asocia a la propuesta
            INSERT dbo.pv_documentosPropuestas (propuestaID, documentoID, esActivo)
            SELECT @PropuestaID, documentoID, 1
            FROM @Doc;
        END
        -- crear registro de validacion interna
        INSERT dbo.pv_validacionPropuesta
        (versionID, grupoID, fechaValidacion, estado, comentarios, fechaCreacion)
        VALUES
        (@VersionID,
         -- validadores genericos 
         (SELECT TOP 1 grupoID FROM dbo.pv_grupoValidador WHERE tipoID = 1 ORDER BY grupoID),
         @Ahora, N'En revisión', NULL, @Ahora);
        -- crear logs
        INSERT dbo.pv_logs
        (descripcion, [timestamp], computador, usuario, trace,
         refId1, refId2, checksum, tipologid, origenlogid, logseveridadid)
        VALUES
        ( IIF(@EsNueva=1,'Creación de propuesta','Actualización de propuesta'),
          @Ahora, @EquipoOrigen, CAST(@UsuarioAccion AS VARCHAR(50)),
          CONCAT('PropuestaID=',@PropuestaID,';Version=',@NuevoNumVersion),
          @PropuestaID, @VersionID,
          HASHBYTES('SHA2_256', CONCAT(@PropuestaID,@Ahora)),
          (SELECT TOP 1 tipologid 
			FROM dbo.pv_logTipos 
			WHERE nombre = IIF(@EsNueva = 1, 'PropuestaCreada', 'PropuestaActualizada')),
			2, -- api rest
            2); -- info

        COMMIT;

        SELECT 'OK'   AS Resultado,
               @PropuestaID     AS PropuestaID,
               @NuevoNumVersion AS VersionCreada;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 ROLLBACK;
        DECLARE @Msg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@Msg,16,1);
    END CATCH
END
GO
```
# Revisar Propuesta:  
## Python Endpoint  
```python
```
## SQL Stored Procedure  
```sql
```
# Invertir:  
## Python Endpoint  
```python
import json
import logging
import base64
import azure.functions as func
from shared.dtos import InversionDTO
from shared.database import get_session
from sqlalchemy import text
from pydantic import ValidationError
from typing import Optional

def bytes_to_base64(b: bytes) -> str:
    return base64.b64encode(b).decode('utf-8')

def json_bytes_serializer(obj):
    if isinstance(obj, bytes):
        return bytes_to_base64(obj)
    raise TypeError(f"Type {type(obj)} not serializable")

async def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')
    try:
        dto = InversionDTO(**req.get_json())
    except ValidationError as e:
        logging.error(f"Error de validación: {str(e)}")
        return func.HttpResponse(
            e.json(),
            status_code=400,
            mimetype="application/json"
        )
    sp_call = text("""
        EXEC dbo.invertir
            @proyecto = :proyecto,
            @monto = :monto,
            @moneda = :moneda,
            @cedula = :cedula,
            @contrasenna = :contrasenna,
            @organizacion = :organizacion,
            @metodoPago = :metodoPago
    """)

    try:
        async with get_session() as session:
            params = dto.dict()
            if params['organizacion'] is None:
                params['organizacion'] = None  
            result = await session.execute(sp_call, params)
            await session.commit()
            rows = result.fetchall()

            if not rows:
                return func.HttpResponse(
                    json.dumps({"error": "No se recibieron resultados del stored procedure"}),
                    mimetype="application/json",
                    status_code=500
                )
            
            result_list = []
            for row in rows:
                row_dict = dict(row._mapping)
                for key in row_dict:
                    if isinstance(row_dict[key], bytes):
                        row_dict[key] = bytes_to_base64(row_dict[key])
                result_list.append(row_dict)

            sp_result = result_list[0]
            
            if sp_result.get('Resultado') == 0:
                return func.HttpResponse(
                    json.dumps({
                        "mensaje": sp_result.get('Mensaje'),
                        "transaccion_id": sp_result.get('TransaccionID'),
                        "referencia": sp_result.get('Referencia'),
                        "monto_invertido": float(sp_result.get('MontoInvertido')) if sp_result.get('MontoInvertido') else None,
                        "numero_autorizacion": sp_result.get('NumeroAutorizacion')
                    }, default=json_bytes_serializer),
                    mimetype="application/json",
                    status_code=201
                )
            else:
                return func.HttpResponse(
                    json.dumps({"error": sp_result.get('Mensaje')}),
                    mimetype="application/json",
                    status_code=400
                )

    except Exception as ex:
        logging.error(f"Error al ejecutar el stored procedure: {str(ex)}")
        return func.HttpResponse(
            json.dumps({"error": "Error interno al procesar la inversión"}),
            mimetype="application/json",
            status_code=500
        )
```
## SQL Stored Procedure  
```sql
CREATE PROCEDURE [dbo].[invertir] 
    @proyecto VARCHAR(50),
    @monto DECIMAL(12,3),
    @moneda VARCHAR(3),
    @cedula VARCHAR(9),
    @contrasenna VARCHAR(50),
    @organizacion VARCHAR(100) = NULL,
    @metodoPago VARCHAR(100)
AS BEGIN
    SET NOCOUNT ON
    -- Obtener valores de logs para los posibles escenarios
    DECLARE @origenLogID INT;
    DECLARE @tipoLogInversion INT;
    DECLARE @tipoLogError INT;
    DECLARE @severidadInfo INT;
    DECLARE @severidadError INT;
    SELECT @origenLogID = origenlogid FROM pv_logOrigen WHERE nombre = 'Web UI';
    SELECT @tipoLogInversion = tipologid FROM pv_logTipos WHERE nombre = 'InversionRegistrada';
    SELECT @tipoLogError = tipologid FROM pv_logTipos WHERE nombre = 'Error';
    SELECT @severidadInfo = logseveridadid FROM pv_severidadLogs WHERE nombre = 'Info';
    SELECT @severidadError = logseveridadid FROM pv_severidadLogs WHERE nombre = 'Error';
    
    -- Variables para la validación y la inserción de los datos
    DECLARE @proyectoID INT;
    DECLARE @usuario INT;
    DECLARE @idAprobado INT;
    DECLARE @llaveCifrada VARBINARY(256);
    DECLARE @montoReal DECIMAL(12,3);
    DECLARE @tasaCambioID INT;
    DECLARE @monedaOrigen INT;
    DECLARE @monedaDestino INT;
    DECLARE @intentoPagoID INT;
    DECLARE @transaccionID INT;
    DECLARE @subTipoTransaccionID INT;
    DECLARE @descripcion NVARCHAR(200);
    DECLARE @referencia NVARCHAR(50);
    DECLARE @numeroAuth VARCHAR(30);
    DECLARE @resultado VARCHAR(500) = 'Pago aprobado';
    DECLARE @organizacionID INT = NULL;
    DECLARE @tokenCargo VARBINARY(256);
    
    -- Variables para manejo de errores
    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT, @ErrorPoc VARCHAR(128)
    DECLARE @Message VARCHAR(200)
    DECLARE @InicieTransaccion BIT
    
    BEGIN TRY
        -- Verificación de usuario
        SELECT @idAprobado = statusRegistroID FROM pv_statusRegistro WHERE nombre like 'Registrado';
        SELECT @usuario = userid FROM pv_usuarios WHERE identificacion = @cedula;
        IF @usuario IS NULL OR (SELECT statusRegistroID FROM pv_StatusRegistroUsuarios WHERE usuarioID = @usuario) <> @idAprobado
        BEGIN
            DECLARE @errorMsg1 NVARCHAR(500) = 'Usuario no encontrado o no aprobado: ' + @cedula;
            EXEC dbo.SP_InsertarLog
                'Intento de inversión con usuario no registrado',
                @errorMsg1,
                @tipoLogError,
                @origenLogID,
                @severidadError,
                @cedula,
                'Sistema',
                NULL,
                NULL,
                @cedula,
                NULL;
            
            RAISERROR('El usuario no se encuentra registrado', 16, 1);
            RETURN -1;
        END
        
        -- Verificación de contraseña
        SELECT @llaveCifrada = llaveCifrada FROM pv_llavesUsuarios WHERE usuarioID = @usuario;
        IF (DECRYPTBYPASSPHRASE(@contrasenna, @llaveCifrada) IS NULL)
        BEGIN 
            DECLARE @errorMsg2 NVARCHAR(500) = 'Usuario: ' + @cedula;
            EXEC dbo.SP_InsertarLog
                'Contraseña incorrecta en intento de inversión',
                @errorMsg2,
                @tipoLogError,
                @origenLogID,
                @severidadError,
                @cedula,
                'Sistema',
                @usuario,
                NULL,
                NULL,
                NULL;
            
            RAISERROR('Contraseña incorrecta', 16, 1);
            RETURN -1;
        END
        
        -- Verificación de organización
        IF @organizacion IS NOT NULL
        BEGIN
            SELECT @organizacionID = organizacionid FROM pv_organizaciones WHERE nombre LIKE @organizacion;
            IF @organizacionID IS NULL
            BEGIN
                DECLARE @errorMsg3 NVARCHAR(500) = 'Organización: ' + @organizacion;
                EXEC dbo.SP_InsertarLog
                    'Organización no encontrada en inversión',
                    @errorMsg3,
                    @tipoLogError,
                    @origenLogID,
                    @severidadError,
                    @cedula,
                    'Sistema',
                    NULL,
                    NULL,
                    @organizacion,
                    NULL;
                
                RAISERROR('La organización especificada no existe', 16, 1);
                RETURN -1;
            END
        END

        -- Verificación de proyecto
        SELECT @proyectoID = proyectoID FROM pv_proyecto WHERE nombre LIKE @proyecto;
        IF @proyectoID IS NULL
        BEGIN
            DECLARE @errorMsg4 NVARCHAR(500) = 'Proyecto: ' + @proyecto;
            EXEC dbo.SP_InsertarLog
                'Proyecto no encontrado en inversión',
                @errorMsg4,
                @tipoLogError,
                @origenLogID,
                @severidadError,
                @cedula,
                'Sistema',
                NULL,
                NULL,
                @proyecto,
                NULL;
            
            RAISERROR('El proyecto especificado no existe', 16, 1);
            RETURN -1;
        END 
        
        -- Conversión de moneda
        IF @moneda <> 'CRC'
        BEGIN
            DECLARE @tasaCambio DECIMAL(19,6);
            SELECT @monedaOrigen = monedaID FROM pv_moneda WHERE codigo LIKE @moneda;
            SELECT @monedaDestino = monedaID FROM pv_moneda WHERE codigo LIKE 'CRC';
            
            SELECT @tasaCambio = tasa, @tasaCambioID = tasaCambioID 
            FROM pv_tasaCambio 
            WHERE monedaOrigen = @monedaOrigen AND monedaDestino = @monedaDestino;
            
            SET @montoReal = ROUND(@monto * @tasaCambio, 3);
        END
        ELSE
        BEGIN 
            SET @montoReal = @monto;
            SET @tasaCambioID = NULL;
            SET @monedaOrigen = (SELECT monedaID FROM pv_moneda WHERE codigo = 'CRC');
        END
        
        -- Validación de monto máximo
        IF (SELECT montoPedido FROM pv_proyecto WHERE proyectoID = @proyectoID) < @montoReal
        BEGIN
            DECLARE @montoRealStr VARCHAR(20) = CAST(@montoReal AS VARCHAR(20));
            DECLARE @errorMsg5 NVARCHAR(500) = 'Proyecto: ' + @proyecto + ' | Monto solicitado: ' + @montoRealStr;
            EXEC dbo.SP_InsertarLog 
                'Monto excede el máximo permitido',
                @errorMsg5,
                @tipoLogError,
                @origenLogID,
                @severidadError,
                @cedula,
                'Sistema',
                @proyectoID,
                NULL,
                @montoRealStr,
                NULL;
            
            RAISERROR('La inversión excede el máximo solicitado', 16, 1);
            RETURN -1;
        END
        
        -- Obtener subtipo de transacción
        SELECT @subTipoTransaccionID = subTipoTransaccionID 
        FROM pv_subTipoTransaccion 
        WHERE nombre LIKE 'Inversión';
        
        -- Generar valores para los campos
        SET @descripcion = 'Inversión en proyecto ' + @proyecto;
        
        DECLARE @proyectoIDStr VARCHAR(10) = CAST(@proyectoID AS VARCHAR(10));
        SET @referencia = 'INV-' + @proyectoIDStr + '-' + FORMAT(GETDATE(), 'yyyyMMddHHmmss');
        
        SET @numeroAuth = RIGHT(NEWID(), 10);
        SET @tokenCargo = CAST(NEWID() AS VARBINARY(256));
        -- Obtener el método de pago
        DECLARE @metodoID INT = (SELECT metodoID FROM pv_metodosPago WHERE nombre LIKE @metodoPago)
        -- Iniciar transacción
        SET @InicieTransaccion = 0;
        IF @@TRANCOUNT = 0 BEGIN
            SET @InicieTransaccion = 1;
            SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
            BEGIN TRANSACTION;
        END
        
        BEGIN TRY
            SET @CustomError = 2001;
            
            -- Inserción del intento de Pago
            DECLARE @checksumPago VARBINARY(256) = HASHBYTES('SHA2_256', 
                CAST(@monto AS VARCHAR(20)) + CAST(@montoReal AS VARCHAR(20)) + @referencia);
            
            INSERT INTO pv_intentoPago (
                monto, actualMonto, resultado, numeroAuth, 
                reference, tokenCargo, descripcion, fecha, 
                checksum, metodoPagoID, monedaID
            ) VALUES (
                @monto, @montoReal, @resultado, @numeroAuth,
                @referencia, @tokenCargo, @descripcion, GETDATE(),
                @checksumPago, 
                @metodoID, @monedaOrigen
            );
            
            SET @intentoPagoID = SCOPE_IDENTITY();
            
            -- Inserción de la transacción
            DECLARE @checksumTrans VARBINARY(256) = HASHBYTES('SHA2_256', 
                CAST(@usuario AS VARCHAR(10)) + CAST(@proyectoID AS VARCHAR(10)) + @referencia);
            
            INSERT INTO pv_transaccion (
                usuarioID, proyectoID, monto, montoConvertido, 
                descripcion, fechaTransaccion, fechaRegistro, 
                referencia, checksum, subTipoTransaccionID,
                tasaCambioID, intentoPagoID
            ) VALUES (
                @usuario, @proyectoID, @monto, 
                CASE WHEN @moneda = 'CRC' THEN NULL ELSE @montoReal END,
                @descripcion, GETDATE(), GETDATE(),
                @referencia, @checksumTrans, 
                @subTipoTransaccionID, @tasaCambioID, @intentoPagoID
            );
            
            SET @transaccionID = SCOPE_IDENTITY();
            
            -- Inserción de la inversión
            INSERT INTO pv_inversion (
                proyectoID, usuarioID, transaccionID, organizacionID
            ) VALUES (
                @proyectoID, @usuario, @transaccionID, @organizacionID
            );
            
            -- Registrar éxito
            DECLARE @montoRealSuccessStr VARCHAR(20) = CAST(@montoReal AS VARCHAR(20));
            EXEC dbo.SP_InsertarLog 
                'Inversión registrada exitosamente',
                @descripcion,
                @tipoLogInversion,
                @origenLogID,
                @severidadInfo,
                @cedula,
                'Sistema',
                @proyectoID,
                @usuario,
                @montoRealSuccessStr,
                NULL;
            
            IF @InicieTransaccion = 1 BEGIN
                COMMIT;
            END
            
            SELECT 
                0 AS Resultado, 
                'Inversión registrada correctamente' AS Mensaje, 
                @transaccionID AS TransaccionID,
                @referencia AS Referencia,
                @montoReal AS MontoInvertido,
                @numeroAuth AS NumeroAutorizacion;
        END TRY
        BEGIN CATCH
            SET @ErrorNumber = ERROR_NUMBER();
            SET @ErrorSeverity = ERROR_SEVERITY();
            SET @ErrorState = ERROR_STATE();
            SET @Message = ERROR_MESSAGE();

            
            -- Registrar error
            DECLARE @errorLineStr VARCHAR(10) = CAST(ERROR_LINE() AS VARCHAR(10));
            DECLARE @errorMsg6 VARCHAR(500) = 'Error: ' + @Message + ' | Línea: ' + @errorLineStr;
            SET @ErrorPoc = ERROR_PROCEDURE()
            EXEC dbo.SP_InsertarLog
                'Error al registrar inversión',
                @errorMsg6,
                @tipoLogError,
                @origenLogID,
                @severidadError,
                @cedula,
                'Sistema',
                @proyectoID,
                NULL,
                @ErrorPoc,
                @errorLineStr;
            
            IF @InicieTransaccion = 1 BEGIN
                ROLLBACK;
            END
            
            RAISERROR('Error al registrar la inversión: %s', @ErrorSeverity, @ErrorState, @Message);
            RETURN -1;
        END CATCH
    END TRY
    BEGIN CATCH
        SET @Message = ERROR_MESSAGE();
        
        -- Registrar error general
        DECLARE @errorLineStr2 VARCHAR(10) = CAST(ERROR_LINE() AS VARCHAR(10));
        DECLARE @errorMsg7 VARCHAR(500) = 'Error: ' + @Message + ' | Línea: ' + @errorLineStr2;
        SET @ErrorPoc = ERROR_PROCEDURE()
        EXEC dbo.SP_InsertarLog
            'Error general en proceso de inversión',
            @errorMsg7,
            @tipoLogError,
            @origenLogID,
            @severidadError,
            @cedula,
            'Sistema',
            NULL,
            NULL,
            @ErrorPoc,
            @errorLineStr2;
        
        RAISERROR('Error en el proceso de inversión: %s', 16, 1, @Message);
        RETURN -1;
    END CATCH
END
```
# Repartir Dividendos:  
## Python Endpoint  
```python
```
## SQL Stored Procedure  
```sql
```
# ORM:  
# Votar:  
```python
```
# Comentar:    
```python
```
# Listar Votos:  
```python
from datetime import datetime
from typing import List
from pydantic import BaseModel, SecretStr
from pydantic import ValidationError
from datetime import datetime
from sqlalchemy.orm import Session
from sqlalchemy import select, desc, text
from sqlalchemy.orm import selectinload, joinedload
from shared.database import get_session
from shared.dtos import ListaVotosInputDTO
import json
import logging
import hashlib
import azure.functions as func
from shared.models import (
    Usuario, 
    LlaveUsuario,
    PropuestaVotacion,
    Propuesta,
    Votacion,
    UsuarioVotacionPublica,
    Respuesta,
    RespuestaParticipante,
    Pregunta,
    VotacionPregunta,
    Log,
    Documento
)

async def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info("Iniciando procesamiento de listaVotos")
    ahora = datetime.now()
    try:
        auth_data = ListaVotosInputDTO(**req.get_json())
        logging.info(f"Solicitud recibida para cédula: {auth_data.cedula[:3]}******")
        async with get_session() as session:
            usuario = await obtenerUsuario(session, auth_data.cedula) 
            if not usuario:
                await insertarLog(
                    session=session,
                    descripcion="Usuario no encontrado en autenticación",
                    computador="listarVotos/endpoint",
                    usuario=auth_data.cedula,
                    tipologid=1,
                    origenlogid=2,
                    logseveridadid=2
                )
                logging.warning(f"Usuario no encontrado: {auth_data.cedula[:3]}******")
                return func.HttpResponse(
                    json.dumps({"error": "Credenciales inválidas"}),
                    status_code=401,
                    mimetype="application/json"
                )
                logging.info(f"Usuario encontrado: ID {usuario.userid}")
            logging.info(f"Usuario encontrado: ID {usuario.userid}")
            llaveActiva = await obtenerLlave(session, usuario.userid)
            documento = Documento(
                    nombre=f"{usuario.userid}-PruebaVida",
                    fechaCreacion=ahora,
                    tipoDocumentoID=10,
                    estadoDocumentoID=4,
                    ultimaModificacion=ahora,
                    esActual=True,
                    idLegal=f"{usuario.userid}_PV",
                    checksum=generarChecksum(auth_data.prueba_vida),
                )
            session.add(documento)
            await session.commit()
            await insertarLog(
                    session=session,
                    descripcion="Insercion Prueba de Vida",
                    computador="listarVotos/endpoint",
                    usuario=str(usuario.userid),
                    tipologid=1,
                    origenlogid=2,
                    logseveridadid=2
                )
            try:
                resultado = await session.execute(
                    text("""
                        SELECT DECRYPTBYPASSPHRASE(:pass, :llave) AS llave_desencriptada
                        WHERE :llave IS NOT NULL
                    """),
                    {
                        "pass": auth_data.contrasenna.get_secret_value(),
                        "llave": llaveActiva.llaveCifrada
                    }
                )
                llave_desencriptada = resultado.scalar_one_or_none()
                if llave_desencriptada is None:
                    await insertarLog(
                        session=session,
                        descripcion="Fallo de descifrado de llave",
                        computador="listarVotos/endpoint",
                        usuario=str(usuario.userid),
                        refId1=usuario.userid,
                        tipologid=2,
                        origenlogid=2,
                        logseveridadid=3
                    )
                    logging.warning(f"Fallo de descifrado para usuario ID: {usuario.userid}")
                    return func.HttpResponse(
                        json.dumps({
                            "error": "Credenciales inválidas",
                            "codigo": "AUTH_FAILED"
                        }),
                        status_code=401,
                        mimetype="application/json"
                    )
                llave_desencriptada = llave_desencriptada.decode('utf-8')
                logging.info(f"Autenticación exitosa para usuario ID: {usuario.userid}")
            except Exception as e:
                await insertarLog(
                    session=session,
                    descripcion="Error técnico en verificación de contraseña",
                    computador="listarVotos/endpoint",
                    usuario=str(usuario.userid),
                    refId1=usuario.userid,
                    trace=str(e),
                    tipologid=2,
                    origenlogid=2,
                    logseveridadid=5
                )
                logging.error(f"Error técnico al verificar contraseña: {str(e)}", exc_info=True)
                return func.HttpResponse(
                    json.dumps({
                        "error": "Error interno en verificación",
                        "codigo": "INTERNAL_ERROR"
                    }),
                    status_code=500,
                    mimetype="application/json"
                )        
            respuestas = await obtenerRespuestasParticipantes(session, llave_desencriptada, usuario.userid)
            response_data = {
                "user_id": usuario.userid,
                "nombre" : usuario.nombre,
                "primerApellido": usuario.primerApellido,
                "segundoApellido": usuario.segundoApellido,
                "respuestas": respuestas
            }
            await insertarLog(
                session=session,
                descripcion="Respuestas obtenidas exitosamente",
                computador="listarVotos/endpoint",
                usuario=str(usuario.userid),
                refId1=usuario.userid,
                tipologid=3,
                origenlogid=2,
                logseveridadid=1,
            )
            return func.HttpResponse(
                json.dumps(response_data, default=str),
                status_code=200,
                mimetype="application/json"
            )
    except ValidationError as e:
        logging.error(f"Error de validación: {str(e)}")
        return func.HttpResponse(
            e.json(),
            status_code=400,
            mimetype="application/json"
        )
    except Exception as e:
        logging.error(f"Error inesperado: {str(e)}", exc_info=True)
        return func.HttpResponse(
            json.dumps({"error": "Error interno del servidor"}),
            status_code=500,
            mimetype="application/json"
        )

async def obtenerUsuario(session, cedula) -> Usuario | None:
    try:
        result = await session.execute(
            select(Usuario)
            .where(Usuario.identificacion == cedula)
            .options(selectinload(Usuario.llaves))
        )
        return result.scalar_one_or_none()
    except Exception as e:
        logging.error(f"Error en consulta de usuario: {str(e)}", exc_info=True)
        raise ValueError("Error al consultar usuario en la base de datos")

async def obtenerRespuestasParticipantes(session, llaveCifrada, usuario) -> List[dict]:
    try:
        query = (
            select(
                RespuestaParticipante.respuestaParticipanteID,
                RespuestaParticipante.preguntaID,
                RespuestaParticipante.respuestaID,
                RespuestaParticipante.valor,
                RespuestaParticipante.fechaRespuesta,
                RespuestaParticipante.ncRespuesta,
                RespuestaParticipante.tokenGUID,
                RespuestaParticipante.pesoRespuesta,
                Pregunta.enunciado,
                Respuesta.respuesta,
                Respuesta.value,
                Votacion.titulo.label("titulo_votacion")
            )
            .select_from(RespuestaParticipante)
            .join(Pregunta, RespuestaParticipante.preguntaID == Pregunta.preguntaID)
            .join(Respuesta, RespuestaParticipante.respuestaID == Respuesta.respuestaID)
            .join(VotacionPregunta, VotacionPregunta.preguntaID == Pregunta.preguntaID)
            .join(Votacion, Votacion.votacionId == VotacionPregunta.votacionID)
        )
        result = await session.execute(query)
        respuestas = []
        for row in result:
            respuesta = {
                "respuesta_participante_id": row.respuestaParticipanteID,
                "pregunta_id": row.preguntaID,
                "respuesta_id": row.respuestaID,
                "fecha_respuesta": row.fechaRespuesta,
                "nc_respuesta": row.ncRespuesta, 
                "titulo_votacion": row.titulo_votacion,
                "enunciado_pregunta": row.enunciado,
                "texto_respuesta": row.respuesta
            }
            if await verificarRespuesta(session, respuesta['nc_respuesta'], llaveCifrada, usuario):
                respuestas.append(respuesta)
        respuestas_recientes = sorted(
            respuestas,
            key=lambda x: x['fecha_respuesta'],
            reverse=True
        )[:5]
        for respuesta in respuestas_recientes:
            respuesta['fecha_respuesta'] = respuesta['fecha_respuesta'].isoformat()
            del respuesta['nc_respuesta']
        return respuestas_recientes
    except Exception as e:
        logging.error(f"Error al consultar respuestas de participantes: {str(e)}", exc_info=True)
        raise ValueError("Error al obtener respuestas de participantes")

async def verificarRespuesta(session, ncRespuesta, llaveCifrada, usuario) -> bool:
    try:
        if not ncRespuesta:
            return False
        result = await session.execute(
            text("""
                SELECT DECRYPTBYPASSPHRASE(:llaveCifrada, :nc_respuesta) AS nc_desencriptado
            """),
            {
                "llaveCifrada": llaveCifrada,
                "nc_respuesta": ncRespuesta
            }
        )
        nc_desencriptado = result.scalar_one_or_none()
        if nc_desencriptado != None:
            logging.info(nc_desencriptado)
            logging.info(usuario)
            return nc_desencriptado.decode('utf-8') == str(usuario)
        return False
    except Exception as e:
        logging.error(f"Error desencriptando ncRespuesta: {str(e)}")
        return False

async def obtenerLlave(session, usuario_id: int) -> LlaveUsuario:
    try:
        result = await session.execute(
            select(LlaveUsuario)
            .where(
                LlaveUsuario.usuarioID == usuario_id,
                LlaveUsuario.esActiva == True 
            )
            .order_by(desc(LlaveUsuario.ultimaModificacion))
        )
        
        llave = result.scalar_one_or_none()
        if not llave:
            logging.warning(f"No hay llave activa para usuario ID: {usuario_id}")
            raise ValueError("No se encontró llave criptográfica activa")
        logging.info(f"Llave encontrada para usuario ID: {usuario_id}")
        return llave
    except Exception as e:
        logging.error(f"Error al consultar llave: {str(e)}", exc_info=True)
        raise ValueError("Error al verificar credenciales")


def generarChecksum(valor: str) -> bytes:
    return hashlib.sha256(valor.encode()).digest()

async def insertarLog(
    session: Session,
    descripcion: str,
    computador: str,
    usuario: str,
    trace: str = "API/ENDPOINT/listarVotos",  
    refId1: int = None,
    refId2: int = None,
    valor1: str = None,
    valor2: str = None,
    checksum: str = "2025API/20END25OINT06/listarVotos26",  
    tipologid: int = 1,     
    origenlogid: int = 1,   
    logseveridadid: int = 1 ):
    log_entry = Log(
        descripcion=descripcion,
        timestamp=datetime.utcnow(),
        computador=computador,
        usuario=usuario,
        trace=trace,
        refId1=refId1,
        refId2=refId2,
        valor1=valor1,
        valor2=valor2,
        checksum=generarChecksum(checksum),
        tipologid=tipologid,
        origenlogid=origenlogid,
        logseveridadid=logseveridadid
    )
    session.add(log_entry)
    await session.commit()


"""
Función principal: main(req: func.HttpRequest) -> func.HttpResponse
Nombre: listarVotos

Parámetros de entrada (JSON en el body):
    - cedula (str): Cédula de identidad del usuario
    - contrasenna (SecretStr): Contraseña del usuario
    - prueba_vida (str): Texto de prueba de vida para verificación

Lógica interna:
    1. Autenticación:
       - Valida credenciales usando ListaVotosInputDTO
       - Verifica usuario en pv_usuarios
       - Obtiene llave criptográfica activa del usuario
       - Registra prueba de vida en pv_documento (tipoDocumentoID=10)
    
    2. Verificación:
       - Desencripta llave usando DECRYPTBYPASSPHRASE
       - Valida coincidencia de credenciales
    
    3. Consulta:
       - Obtiene respuestas de votaciones públicas del usuario
       - Filtra las 5 más recientes por fecha
       - Verifica pertenencia mediante desencriptación de ncRespuesta
    
    4. Respuesta:
       - Devuelve datos básicos del usuario
       - Lista de respuestas válidas (sin campo nc_respuesta)
       - Registra logs en cada etapa crítica

Flujo de respuesta:
    - 200 OK: Datos de usuario y respuestas válidas
    - 401 Unauthorized: Credenciales inválidas
    - 400 Bad Request: Error en validación de datos
    - 500 Internal Server Error: Error inesperado

Estructura de respuesta exitosa (200):
{
    "user_id": int,
    "nombre": str,
    "primerApellido": str,
    "segundoApellido": str,
    "respuestas": [
        {
            "respuesta_participante_id": int,
            "pregunta_id": int,
            "respuesta_id": int,
            "fecha_respuesta": str (ISO format),
            "titulo_votacion": str,
            "enunciado_pregunta": str,
            "texto_respuesta": str
        },
        (máximo 5)
    ]
}

Ejemplo de uso:
POST /api/listarVotos
{
    "cedula": "100000000",
    "contrasenna": "JUGAHE0000",
    "prueba_vida": "video_123.mp3"
}

Tablas relacionadas:
    - pv_usuarios
    - pv_llaveUsuario
    - pv_respuestaParticipante
    - pv_preguntas
    - pv_respuestas
    - pv_votacionPregunta
    - pv_votacion
    - pv_documento
    - pv_logs

Seguridad:
    - Todos los accesos quedan registrados en logs
    - Las contraseñas se manejan como SecretStr
    - Los datos sensibles (ncRespuesta) no se exponen
    - Se verifica pertenencia de cada respuesta
    - Se genera checksum SHA-256 para prueba de vida

Consideraciones:
    - Requiere llave criptográfica activa
    - Las fechas se devuelven en formato ISO 8601
    - Máximo 5 respuestas recientes
"""
```
# Configurar Votación:   
```python
```



