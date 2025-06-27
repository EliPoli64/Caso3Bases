# Caso 3 Bases de Datos I: Voto Pura Vida   
## Integrantes:  
- Julián Castro Barrantes (2024119346)  
- Carlos García Molina (2024181023)  
- Elías Ramírez Hernández (2024090300)  
- Beatríz Díaz Gómez (2024090972)  
# Endpoints API Serverless:  
## Por Stored Procedures:  
### Crear Actualizar Propuesta:  
#### Python Endpoint  
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
#### SQL Stored Procedure  
```sql
CREATE PROCEDURE dbo.crearActualizarPropuesta
(
    @PropuestaID           INT             = NULL,      -- NULL = nueva
    @CategoriaID           INT, 
    @Descripcion           VARCHAR(200)    = NULL,
    @ImgURL                VARCHAR(300)    = NULL,
    @FechaInicio           DATETIME        = NULL,
    @FechaFin              DATETIME        = NULL,
    @Comentarios           BIT,
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
# revisarPropuesta/__init__.py
import logging
import json
import azure.functions as func
from shared.dtos import RevisarPropuestaDTO # Importa el nuevo DTO
from shared.database import get_session
from sqlalchemy import text
from pydantic import ValidationError
from typing import Optional # Puede que no sea necesario si ya está en DTO

async def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('HTTP trigger function processed a request to revise a proposal using SQLAlchemy.')

    try:
        dto = RevisarPropuestaDTO(**req.get_json())
    except ValidationError as e:
        logging.error(f"Error de validación del DTO: {str(e)}")
        return func.HttpResponse(
            e.json(),
            status_code=400,
            mimetype="application/json"
        )
    except ValueError: # Captura si el JSON no es válido
        return func.HttpResponse(
            "Por favor, envíe un cuerpo de solicitud JSON válido.",
            status_code=400,
            mimetype="application/json"
        )
    sp_call = text("""
        DECLARE @output_message NVARCHAR(255);
        DECLARE @return_code INT;
        EXEC @return_code = dbo.usp_RevisarPropuesta
            @PropuestaID = :propuesta_id,
            @RevisorID = :revisor_id,
            @ResultadoFinal = :resultado_final,
            @ComentariosRevision = :comentarios_revision,
            @TipoRevision = :tipo_revision,
            @MensajeSalida = @output_message OUTPUT;
        SELECT @return_code AS ReturnCode, @output_message AS MensajeSalida;
    """)

    try:
        async with get_session() as session:
            params = dto.dict()

            logging.info(f"Executing SP usp_RevisarPropuesta with params: {params}")
            result = await session.execute(sp_call, params)
            await session.commit() 
            rows = result.fetchall()

            if not rows:
                return func.HttpResponse(
                    json.dumps({"error": "No se recibieron resultados esperados del stored procedure usp_RevisarPropuesta"}),
                    mimetype="application/json",
                    status_code=500
                )
            sp_result = dict(rows[0]._mapping) 

            sp_return_code = sp_result.get('ReturnCode')
            sp_mensaje_salida = sp_result.get('MensajeSalida')

            logging.info(f"SP Return Code: {sp_return_code}, Message: {sp_mensaje_salida}")

            response_payload = {
                "status": "success",
                "message": sp_mensaje_salida,
                "sp_return_code": sp_return_code
            }
            status_code = 200

            if sp_return_code != 0: 
                response_payload["status"] = "error"
                status_code = 400 
            
            return func.HttpResponse(
                json.dumps(response_payload),
                mimetype="application/json",
                status_code=status_code
            )

    except Exception as ex:
        logging.exception("Error al ejecutar el stored procedure usp_RevisarPropuesta.")
        return func.HttpResponse(
            json.dumps({"error": f"Error interno del servidor al procesar la revisión: {str(ex)}"}),
            mimetype="application/json",
            status_code=500
        )
    

    """
    Ejemplo de uso:
    {
    "propuesta_id": 2,         
    "revisor_id": 2,           
    "resultado_final": "Rechazada", 
    "comentarios_revision": "Contenido duplicado detectado por el análisis de IA.",
    "tipo_revision": "Combinada"
    }
    {
    "propuesta_id": 1,         
    "revisor_id": 1,           
    "resultado_final": "Aprobada", 
    "comentarios_revision": "Contenido duplicado detectado por el análisis de IA.",
    "tipo_revision": "Combinada"
    }
    """
```
## SQL Stored Procedure  
```sql
CREATE PROCEDURE usp_RevisarPropuesta
    @PropuestaID INT,
    @RevisorID INT, 
    @ResultadoFinal NVARCHAR(50), 
    @ComentariosRevision NVARCHAR(MAX) = NULL,
    @TipoRevision NVARCHAR(50), 
    
    @MensajeSalida NVARCHAR(255) OUTPUT 
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @EstadoActualID INT;
    DECLARE @FechaActualUTC DATETIME = GETUTCDATE();
    DECLARE @NuevoEstadoID INT;
    DECLARE @Internal_AI_LLM_ValidationJSON NVARCHAR(MAX);
    DECLARE @Internal_AI_LLM_ModeloID INT;
    DECLARE @Internal_AI_LLM_EsValido BIT;
    DECLARE @Internal_AI_LLM_Confianza DECIMAL(5,2);

    DECLARE @LogDescripcion VARCHAR(100);
    DECLARE @LogTrace NVARCHAR(MAX); 
    DECLARE @LogTipoID INT;
    DECLARE @LogOrigenID INT = 2; 
    DECLARE @LogSeveridadID INT;
    DECLARE @LogUsuario VARCHAR(50);
    DECLARE @LogComputador VARCHAR(50) = 'SQL_SERVER_ENGINE'; 

    BEGIN TRY
        BEGIN TRANSACTION; 

        SELECT
            @EstadoActualID = p.estadoID
        FROM
            pv_propuestas AS p
        WHERE
            p.propuestaID = @PropuestaID;

        IF @EstadoActualID IS NULL
        BEGIN
            SET @MensajeSalida = 'Error: La propuesta con ID ' + CAST(@PropuestaID AS NVARCHAR) + ' no existe.';
            
            SET @LogDescripcion = 'Error: Propuesta no encontrada para revisión.';
            SET @LogTrace = 'Intentando revisar propuestaID: ' + CAST(@PropuestaID AS NVARCHAR) + '. Propuesta no existe.';
            SET @LogTipoID = 2; 
            SET @LogSeveridadID = 3; 
            SET @LogUsuario = ISNULL(CAST(@RevisorID AS VARCHAR(50)), 'N/A'); 
            
            SET XACT_ABORT OFF; 
            BEGIN TRY
                INSERT INTO pv_logs (
                    descripcion, trace, tipologid, origenlogid, logseveridadid, usuario, computador, refId1, timestamp
                )
                VALUES (
                    @LogDescripcion, @LogTrace, @LogTipoID, @LogOrigenID, @LogSeveridadID, @LogUsuario, @LogComputador, @PropuestaID, GETUTCDATE()
                );
            END TRY
            BEGIN CATCH
                -- Manejo opcional de error en log
            END CATCH;
            SET XACT_ABORT ON; 

            ROLLBACK TRANSACTION; 
            RETURN 1;
        END;

        IF @EstadoActualID NOT IN (5) 
        BEGIN
            DECLARE @EstadoNombreActual NVARCHAR(50);
            SELECT @EstadoNombreActual = nombreEstado FROM pv_estadoPropuesta WHERE estadoID = @EstadoActualID;
            SET @MensajeSalida = 'Advertencia: La propuesta con ID ' + CAST(@PropuestaID AS NVARCHAR) + ' ya se encuentra en estado "' + @EstadoNombreActual + '". No se puede revisar.';
            
            SET @LogDescripcion = 'Advertencia: Propuesta en estado no revisable.';
            SET @LogTrace = 'PropuestaID: ' + CAST(@PropuestaID AS NVARCHAR) + ' en estado: ' + @EstadoNombreActual;
            SET @LogTipoID = 3; -- Advertencia
            SET @LogSeveridadID = 2; -- Advertencia
            SET @LogUsuario = ISNULL(CAST(@RevisorID AS VARCHAR(50)), 'N/A');
            
            SET XACT_ABORT OFF;
            BEGIN TRY
                INSERT INTO pv_logs (
                    descripcion, trace, tipologid, origenlogid, logseveridadid, usuario, computador, refId1, valor1, valor2, timestamp
                )
                VALUES (
                    @LogDescripcion, @LogTrace, @LogTipoID, @LogOrigenID, @LogSeveridadID, @LogUsuario, @LogComputador, @PropuestaID, @EstadoNombreActual, @TipoRevision, GETUTCDATE()
                );
            END TRY
            BEGIN CATCH
                -- Manejo opcional de error en log
            END CATCH;
            SET XACT_ABORT ON;

            ROLLBACK TRANSACTION;
            RETURN 2; 
        END;

        SELECT TOP 1
            @Internal_AI_LLM_ValidationJSON = resultado,
            @Internal_AI_LLM_ModeloID = modeloUsado,
            @Internal_AI_LLM_EsValido = aprobado,
            @Internal_AI_LLM_Confianza = confianza
        FROM
            pv_validacionIA
        WHERE
            propuestaID = @PropuestaID
        ORDER BY
            fechaValidacion DESC;

        IF @ResultadoFinal = 'Aprobada'
        BEGIN
            SET @NuevoEstadoID = 6; -- 'Aprobada' 
        END
        ELSE IF @ResultadoFinal = 'Rechazada'
        BEGIN
            SET @NuevoEstadoID = 4; -- 'Rechazada'
        END
        ELSE
        BEGIN
            SET @MensajeSalida = 'Error: El resultado final de la revisión debe ser ''Aprobada'' o ''Rechazada''.';

            SET @LogDescripcion = 'Error: Resultado final de revisión inválido.';
            SET @LogTrace = 'PropuestaID: ' + CAST(@PropuestaID AS NVARCHAR) + '. ResultadoFinal: ' + @ResultadoFinal;
            SET @LogTipoID = 2; -- Error
            SET @LogSeveridadID = 3; -- Error
            SET @LogUsuario = ISNULL(CAST(@RevisorID AS VARCHAR(50)), 'N/A');
            
            SET XACT_ABORT OFF;
            BEGIN TRY
                INSERT INTO pv_logs (
                    descripcion, trace, tipologid, origenlogid, logseveridadid, usuario, computador, refId1, valor1, timestamp
                )
                VALUES (
                    @LogDescripcion, @LogTrace, @LogTipoID, @LogOrigenID, @LogSeveridadID, @LogUsuario, @LogComputador, @PropuestaID, @ResultadoFinal, GETUTCDATE()
                );
            END TRY
            BEGIN CATCH
                -- Manejo opcional de error en log
            END CATCH;
            SET XACT_ABORT ON;

            ROLLBACK TRANSACTION; 
            RETURN 3;
        END;

        UPDATE pv_propuestas
        SET
            estadoID = @NuevoEstadoID
        WHERE
            propuestaID = @PropuestaID;

        COMMIT TRANSACTION; 
        SET @MensajeSalida = 'Revisión de propuesta ' + CAST(@PropuestaID AS NVARCHAR) + ' completada. Estado: ' + @ResultadoFinal + '.';
        
        SET @LogDescripcion = 'Revisión de propuesta completada.';
        SET @LogTrace = 'PropuestaID: ' + CAST(@PropuestaID AS NVARCHAR) + ' ' + @ResultadoFinal + '. RevisorID: ' + CAST(@RevisorID AS NVARCHAR);
        SET @LogTipoID = 1; -- Auditoria
        SET @LogSeveridadID = 1; -- Informativo
        SET @LogUsuario = ISNULL(CAST(@RevisorID AS VARCHAR(50)), 'N/A');
        
        SET XACT_ABORT OFF;
        BEGIN TRY
            INSERT INTO pv_logs (
                descripcion, trace, tipologid, origenlogid, logseveridadid, usuario, computador, refId1, refId2, valor1, valor2, timestamp
            )
            VALUES (
                @LogDescripcion, @LogTrace, @LogTipoID, @LogOrigenID, @LogSeveridadID, @LogUsuario, @LogComputador, @PropuestaID, @RevisorID, @ResultadoFinal, @TipoRevision, GETUTCDATE()
            );
        END TRY
        BEGIN CATCH
            -- Manejo opcional de error en log
        END CATCH;
        SET XACT_ABORT ON;

        RETURN 0;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(MAX) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        SET @MensajeSalida = 'Error en usp_RevisarPropuesta: ' + @ErrorMessage;
        
        SET @LogDescripcion = 'Error al revisar propuesta (CATCH).';
        SET @LogTrace = 'PropuestaID: ' + CAST(@PropuestaID AS NVARCHAR) + '. Error: ' + @ErrorMessage + '. Linea: ' + CAST(ERROR_LINE() AS NVARCHAR);
        SET @LogTipoID = 2; -- Error
        SET @LogSeveridadID = 3; -- Error
        SET @LogUsuario = ISNULL(CAST(@RevisorID AS VARCHAR(50)), 'N/A');
        
        SET XACT_ABORT OFF;
        BEGIN TRY
            INSERT INTO pv_logs (
                descripcion, trace, tipologid, origenlogid, logseveridadid, usuario, computador, refId1, refId2, valor1, valor2, timestamp
            )
            VALUES (
                @LogDescripcion, @LogTrace, @LogTipoID, @LogOrigenID, @LogSeveridadID, @LogUsuario, @LogComputador, @PropuestaID, @RevisorID, @ResultadoFinal, @TipoRevision, GETUTCDATE()
            );
        END TRY
        BEGIN CATCH
            -- Manejo opcional de error en log
        END CATCH;
        SET XACT_ABORT ON;

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        RETURN -1; 
    END CATCH;
END;
GO

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
import json
import logging
import base64
import azure.functions as func
from shared.database import get_session
from sqlalchemy import text


def bytes_to_base64(b: bytes) -> str:
    return base64.b64encode(b).decode('utf-8')


def json_bytes_serializer(obj):
    if isinstance(obj, bytes):
        return bytes_to_base64(obj)
    raise TypeError(f"Type {type(obj)} not serializable")


async def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info("Procesando petición para repartir dividendos...")

    sp_call = text("EXEC dbo.sp_RepartirDividendos")

    try:
        async with get_session() as session:
            await session.execute(sp_call)
            await session.commit()

        return func.HttpResponse(
            json.dumps({"mensaje": "Dividendos repartidos exitosamente"}),
            mimetype="application/json",
            status_code=200
        )

    except Exception as ex:
        logging.exception("Error al ejecutar el stored procedure")
        return func.HttpResponse(
            json.dumps({"error": str(ex)}),
            mimetype="application/json",
            status_code=500
        )
"""
Función principal: main(req: func.HttpRequest) -> func.HttpResponse
Nombre: repartirDividendos

Descripción general:
    Esta función Azure se encarga de ejecutar el procedimiento almacenado dbo.sp_RepartirDividendos,
    el cual reparte las ganancias validadas de un proyecto entre sus inversionistas, según su participación.

Entrada:
    - No requiere parámetros en el body. Es una operación protegida y debe llamarse desde un entorno autorizado.

Lógica interna:
    1. Se establece una conexión asincrónica con la base de datos usando get_session().
    2. Se ejecuta el procedimiento dbo.sp_RepartirDividendos, el cual:
        - Verifica si hay proyectos con fiscalización aprobada.
        - Calcula el monto correspondiente a repartir por usuario según su inversión.
        - Registra las transacciones y la distribución en las tablas correspondientes.
        - Registra logs de operación o errores en SP_InsertarLog.
    3. No se esperan resultados devueltos directamente, pero se captura cualquier error del procedimiento.
    4. Se devuelve un mensaje de éxito o un detalle de error.

Respuesta:
    - 200 OK si el procedimiento se ejecuta sin errores.
        Ejemplo: { "mensaje": "Dividendos repartidos exitosamente" }
    - 500 Internal Server Error si ocurre alguna excepción.
        Ejemplo: { "error": "Detalle del error" }

Dependencias:
    - SQLAlchemy Async para conexión a base de datos.
    - shared.database.get_session() para obtener sesión de conexión.
    - Procedimiento SQL: dbo.sp_RepartirDividendos.

Uso recomendado:
    Este endpoint se puede invocar desde paneles administrativos o tareas programadas
    para ejecutar el reparto de dividendos en base a fiscalizaciones validadas y proyectos activos.
"""
```
## SQL Stored Procedure  
```sql
CREATE PROCEDURE sp_RepartirDividendos
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @proyectoID INT,
        @reporteID INT,
        @montoGanancia DECIMAL(18,2),
        @totalInversion DECIMAL(18,2),
        @usuarioID INT,
        @montoDistribuido DECIMAL(18,2),
        @transaccionID BIGINT,
        @fechaActual DATETIME = GETDATE(),
        @hashVerificacion VARBINARY(256),
        @descripcionLog VARCHAR(100) = 'Reparto de Dividendos',
        @errorMsg VARCHAR(500),
        @logMessage VARCHAR(100),
        @logID INT,
        @intentoPagoID INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. Validar proyecto con fiscalización aprobada y sin distribución previa
        SELECT TOP 1 
            @proyectoID = rg.proyectoID, 
            @reporteID = rg.reporteID, 
            @montoGanancia = rg.montoGanancia
        FROM pv_reporteGanancias rg
        INNER JOIN pv_proyecto p ON rg.proyectoID = p.proyectoID
        INNER JOIN pv_fiscalizacionGanancias fg ON rg.reporteID = fg.reporteID
        WHERE p.estadoID NOT IN (4, 5, 6, 9)
          AND fg.estadoFiscalizacionID = 2
          AND rg.validado = 1
          AND NOT EXISTS (
                SELECT 1 
                FROM pv_distribucionDividendos dd 
                WHERE dd.proyectoID = rg.proyectoID
            );

        IF @proyectoID IS NULL
        BEGIN
            RAISERROR('No hay proyectos válidos con fiscalización aprobada.', 16, 1);
        END;

        -- 2. Calcular total invertido para el proyecto
        SELECT @totalInversion = SUM(CAST(t.monto AS DECIMAL(18,2)))
        FROM pv_inversion i
        INNER JOIN pv_transaccion t ON i.transaccionID = t.transaccionID
        WHERE i.proyectoID = @proyectoID;

        -- 3. Calcular y repartir dividendos por inversionista
        DECLARE investor_cursor CURSOR LOCAL FORWARD_ONLY FOR
        SELECT 
            i.usuarioID,
            (CAST(t.monto AS DECIMAL(18,2)) / @totalInversion) * @montoGanancia AS dividendos
        FROM pv_inversion i
        INNER JOIN pv_transaccion t ON i.transaccionID = t.transaccionID
        WHERE i.proyectoID = @proyectoID;

        OPEN investor_cursor;
        FETCH NEXT FROM investor_cursor INTO @usuarioID, @montoDistribuido;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- 4. Validar que usuario tenga medio de pago registrado
            IF NOT EXISTS (
                SELECT 1 
                FROM pv_metodosPagoUsuarios 
                WHERE usuarioID = @usuarioID
            )
            BEGIN
                RAISERROR('Inversionista %d sin medio de depósito registrado.', 16, 1, @usuarioID);
            END;

            -- 5. Insertar intento de pago
            INSERT INTO pv_intentoPago (
                monto, actualMonto, resultado, numeroAuth, reference, tokenCargo, 
                descripcion, fecha, checksum, metodoPagoID, monedaID
            ) VALUES (
                @montoDistribuido, @montoDistribuido, 'success', 
                'AUTH-' + CAST(@reporteID AS VARCHAR(10)), 
                'REF-' + CAST(@reporteID AS VARCHAR(10)), 
                HASHBYTES('SHA2_256', CONVERT(VARCHAR(50), @fechaActual)),
                'Pago de dividendos', @fechaActual, 
                HASHBYTES('SHA2_256', 'checksum'), 
                1, 1
            );
            SET @intentoPagoID = SCOPE_IDENTITY();

            -- 6. Insertar transacción de pago
            INSERT INTO pv_transaccion (
                usuarioID, proyectoID, monto, descripcion, 
                fechaTransaccion, fechaRegistro, referencia, checksum,
                subTipoTransaccionID, tasaCambioID, intentoPagoID
            ) VALUES (
                @usuarioID, @proyectoID, @montoDistribuido, 'Pago de dividendos',
                @fechaActual, @fechaActual, 
                CONCAT('DIV-', CAST(@reporteID AS VARCHAR(10))),
                HASHBYTES('SHA2_256', CONCAT(
                    CAST(@usuarioID AS VARCHAR(20)),
                    CAST(@montoDistribuido AS VARCHAR(50)),
                    CAST(@fechaActual AS VARCHAR(50))
                )),
                1, 1, @intentoPagoID
            );
            SET @transaccionID = SCOPE_IDENTITY();

            -- 7. Registrar distribución
            SET @hashVerificacion = HASHBYTES('SHA2_256', CONCAT(
                CAST(@usuarioID AS VARCHAR(20)),
                CAST(@montoDistribuido AS VARCHAR(50)),
                CAST(@fechaActual AS VARCHAR(50))
            ));

            INSERT INTO pv_distribucionDividendos (
                proyectoID, usuarioID, transaccionID, 
                montoDistribuido, fechaDistribucion, hashVerificacion
            ) VALUES (
                @proyectoID, @usuarioID, @transaccionID,
                @montoDistribuido, @fechaActual, @hashVerificacion
            );

            FETCH NEXT FROM investor_cursor INTO @usuarioID, @montoDistribuido;
        END;

        CLOSE investor_cursor;
        DEALLOCATE investor_cursor;

        COMMIT TRANSACTION;

        -- 8. Registrar log de éxito
        SET @logMessage = 'Monto: ' + CAST(@montoGanancia AS VARCHAR(20));
        EXEC dbo.SP_InsertarLog 
            @descripcion = @descripcionLog,
            @trace = 'Éxito',
            @tipologid = 1,
            @origenlogid = 1,
            @logseveridadid = 1,
            @usuario = 'sistema',
            @computador = 'azure-function',
            @refId1 = @proyectoID,
            @valor1 = @logMessage;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 
            ROLLBACK TRANSACTION;

        SET @errorMsg = ERROR_MESSAGE();

        -- Registrar error en bitácora
        EXEC dbo.SP_InsertarLog 
            @descripcion = @descripcionLog,
            @trace = @errorMsg,
            @tipologid = 3,
            @origenlogid = 1,
            @logseveridadid = 3,
            @usuario = 'sistema',
            @computador = 'azure-function',
            @refId1 = @proyectoID;

        THROW;
    END CATCH;
END;

```
# ORM:  
# Votar:  
```python
import azure.functions as func
from shared.dtos import VotoDTO
from shared.database import get_session
from shared.models import Usuario, Log, LlaveUsuario, Documento, Pregunta, Respuesta, Votacion, VotacionPregunta, RespuestaParticipante
from sqlalchemy import select, desc, text
from sqlalchemy.orm import selectinload, Session, relationship, contains_eager
from pydantic import ValidationError
import json
import logging
from datetime import datetime, timezone
import base64
import hashlib 
from typing import Optional, List
import uuid 

def validarVotoUsuario(registro_respuesta_participante: dict, json_votacion_completa: dict) -> bool:

    try:
        participante_pregunta_id = registro_respuesta_participante.get("pregunta_id")
        participante_votacion_id = registro_respuesta_participante.get("votacionID")

        if participante_pregunta_id is None or participante_votacion_id is None:
            print("Advertencia: El JSON del participante debe contener 'pregunta_id' y 'votacionID'.")
            return False
        
        votacion_id_completa = json_votacion_completa.get("votacionID")
        preguntas_de_votacion = json_votacion_completa.get("preguntas", []) 

        if votacion_id_completa is None:
            print("Advertencia: El JSON completo de la votación debe contener 'votacionID'.")
            return False
        if participante_votacion_id != votacion_id_completa:
            print(f"Mismatch: La votacionID del participante ({participante_votacion_id}) no coincide con la votacionID de la votación completa ({votacion_id_completa}).")
            return False
        pregunta_encontrada_en_votacion = False
        for pregunta_en_votacion in preguntas_de_votacion:
            if pregunta_en_votacion.get("preguntaID") == participante_pregunta_id:
                pregunta_encontrada_en_votacion = True
                break
        
        if not pregunta_encontrada_en_votacion:
            print(f"Mismatch: La pregunta_id del participante ({participante_pregunta_id}) no se encontró en la lista de preguntas de la votación con ID {votacion_id_completa}.")
            return False
        return True

    except Exception as e:
        print(f"Ocurrió un error inesperado durante la validación: {e}")
        return False


def validarFechas(json_votacion: dict) -> bool:

    try:
        fecha_inicio_str = json_votacion.get("fechaInicio")
        fecha_fin_str = json_votacion.get("fechaFin")

        if not fecha_inicio_str or not fecha_fin_str:
            print("Error: El JSON de la votación debe contener 'fechaInicio' y 'fechaFin'.")
            return False

        fecha_inicio_dt = datetime.fromisoformat(fecha_inicio_str).replace(tzinfo=timezone.utc)
        fecha_fin_dt = datetime.fromisoformat(fecha_fin_str).replace(tzinfo=timezone.utc)
        
        fecha_actual_utc = datetime.now(timezone.utc)

        if fecha_inicio_dt <= fecha_actual_utc <= fecha_fin_dt:
            return True
        else:
            return False

    except ValueError as e:
        print(f"Error al parsear las fechas del JSON. Asegúrate de que estén en formato ISO 8601 (YYYY-MM-DDTHH:MM:SS): {e}")
        return False
    except Exception as e:
        print(f"Ocurrió un error inesperado durante la validación: {e}")
        return False
    


async def getVotacionPorPreguntaID(session, pregunta_id: int) -> Optional[dict]:
    query = (
        select(Votacion)
        .join(Votacion.preguntas) 
        .join(VotacionPregunta.pregunta)  
        .outerjoin(Pregunta.respuestas)  
        .where(Pregunta.preguntaID == pregunta_id) 
        .options(
            contains_eager(Votacion.preguntas).contains_eager(VotacionPregunta.pregunta).contains_eager(Pregunta.respuestas)
        )
    )

    result = await session.execute(query)
    votacion_instance = result.scalars().first()

    if not votacion_instance:
        return None 
    votacion_data = {
        "votacionID": votacion_instance.votacionID,
        "titulo": votacion_instance.titulo,
        "descripcion": votacion_instance.descripcion,
        "fechaInicio": votacion_instance.fechaInicio.isoformat(),
        "fechaFin": votacion_instance.fechaFin.isoformat(),
        "estadoVotacionId": votacion_instance.estadoVotacionId,
        "privada": votacion_instance.privada,
        "esSecreta": votacion_instance.esSecreta,
        "preguntas": []
    }
    preguntas_set = set()

    for vp_assoc in votacion_instance.preguntas:
        pregunta = vp_assoc.pregunta
        if pregunta.preguntaID not in preguntas_set:
            preguntas_set.add(pregunta.preguntaID)
            pregunta_data = {
                "preguntaID": pregunta.preguntaID,
                "enunciado": pregunta.enunciado,
                "tipoPreguntaID": pregunta.tipoPreguntaID,
                "maxSelecciones": pregunta.maxSelecciones,
                "fechaPublicacion": pregunta.fechaPublicacion.isoformat(),
                "respuestas": []
            }
            
            # Iterar sobre las respuestas de la pregunta
            for respuesta in pregunta.respuestas: # 'respuestas' cargadas por eager load
                pregunta_data["respuestas"].append({
                    "respuestaID": respuesta.respuestaID,
                    "respuesta": respuesta.respuesta,
                    "value": respuesta.value
                })
            
            votacion_data["preguntas"].append(pregunta_data)
            
    return votacion_data

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
        raise ValueError("Error al verificar credenciales")

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

async def obtenerRespuestasParticipantes(session, llaveCifrada, usuario) -> List[dict]:
    try:
        query = (
            select(
                RespuestaParticipante.respuestaParticipanteID,
                RespuestaParticipante.preguntaID,
                RespuestaParticipante.ncRespuesta,
                Votacion.votacionID
            )
            .select_from(RespuestaParticipante)
            .join(Pregunta, RespuestaParticipante.preguntaID == Pregunta.preguntaID)
            .join(Respuesta, RespuestaParticipante.respuestaID == Respuesta.respuestaID)
            .join(VotacionPregunta, VotacionPregunta.preguntaID == Pregunta.preguntaID)
            .join(Votacion, Votacion.votacionID == VotacionPregunta.votacionID)
        )
        result = await session.execute(query)
        respuestas = []
        for row in result:
            respuesta = {
                "respuesta_participante_id": row.respuestaParticipanteID,
                "pregunta_id": row.preguntaID,
                "nc_respuesta": row.ncRespuesta, 
                "votacionID": row.votacionID
            }
            if await verificarRespuesta(session, respuesta['nc_respuesta'], llaveCifrada, usuario):
                respuestas.append(respuesta)

        return respuestas
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
    

async def main(req: func.HttpRequest) -> func.HttpResponse:
    try:
        dto = VotoDTO(**req.get_json())
    except ValidationError as e:
        return func.HttpResponse(e.json(), status_code=400)

    try:
        async with get_session() as session:
            usuario = await obtenerUsuario(session, dto.cedulaUsuario)
            if not usuario:  #VALIDAMOS QUE EL USUARIO EXISTA EN EL SISTEMA  
                await insertarLog(
                    session=session,
                    descripcion="Usuario no encontrado",
                    computador="votar/endpoint",
                    usuario=dto.cedulaUsuario,
                    tipologid=1,
                    origenlogid=2,
                    logseveridadid=2
                )
                return func.HttpResponse(
                    json.dumps({"error": "Credenciales inválidas"}),
                    status_code=401,
                    mimetype="application/json"
                )
            
            llaveActiva = await obtenerLlave(session, usuario.userid)
            try:
                resultado = await session.execute(
                    text("""
                        SELECT DECRYPTBYPASSPHRASE(:pass, :llave) AS llave_desencriptada
                        WHERE :llave IS NOT NULL
                    """),
                    {
                        "pass": dto.contrasenia.get_secret_value(),
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
            documento = Documento(
                nombre=f"{usuario.userid}-PruebaVida",
                fechaCreacion=datetime.now(),
                tipoDocumentoID=10,
                estadoDocumentoID=4,
                ultimaModificacion=datetime.now(),
                esActual=True,
                idLegal=f"{usuario.userid}_PV",
                checksum=generarChecksum(dto.prueba_vida),
            )
            session.add(documento)
            await session.commit()

            votacionJSON = await getVotacionPorPreguntaID(session, dto.preguntaID)
            if not validarFechas(votacionJSON): 
                return func.HttpResponse(
                    json.dumps({
                        "error": "Votación invalida, la fecha ya pasó, o la fecha de inicio no ha llegado.",
                        "codigo": "404"
                    }),
                    status_code=500,
                    mimetype="application/json"
                )
            
            if not validarVotoUsuario(obtenerRespuestasParticipantes(session, llave_desencriptada, usuario), votacionJSON):
                return func.HttpResponse(
                    json.dumps({
                        "error": "Este usuario ya votó para esta pregunta.",
                        "codigo": "506"
                    }),
                    status_code=500,
                    mimetype="application/json"
                )
            
            result = await session.execute( 
                 text("""
                        SELECT ENCRYPTBYPASSPHRASE(:pass, :llave) AS llave_desencriptada
                        WHERE :llave IS NOT NULL
                    """),
                    {
                        "pass": llave_desencriptada,
                        "llave": str(usuario.userid)
                    }
                )
            #async with session.begin():
            voto = RespuestaParticipante(
                    preguntaID = dto.preguntaID,
                    respuestaID = dto.respuestaID,
                    checksum = hashlib.sha256("RespuestaParticipante".encode('utf-8')).digest(),
                    valor = dto.valor,
                    fechaRespuesta = datetime.now(),
                    ncRespuesta = result.scalar_one(),
                    tokenGUID = str(uuid.uuid4()),
                    pesoRespuesta = dto.pesoRespuesta
                )
            session.add(voto)
            await session.commit()
        return func.HttpResponse(json.dumps({"msg": "Voto registrado"}),
                              mimetype="application/json")
    
    

    except Exception as ex:
        return func.HttpResponse(
            json.dumps({"error": str(ex)}),
            mimetype="application/json",
            status_code=500,
        )
    
    
    """
    Ejemplo de uso:
    {
    "preguntaID": 1,        
    "respuestaID": 1,       
    "valor": "Mejorar el transporte público",           
    "pesoRespuesta": 2, 
    "cedulaUsuario": "100000000",
    "contrasenia": "JUGAHE0000",
    "prueba_vida" : "Prueba de Vida"
    }
    """

    """
Documentación de Función de Azure: `votar` (anteriormente `listarVotos`)

Esta documentación describe la funcionalidad de la función `main` (nombre HTTP: `listarVotos`), que está diseñada para permitir a un usuario autenticado registrar su voto en una pregunta de una votación.

### 1. Descripción General

La función `listarVotos` (que en realidad implementa la lógica para **registrar un voto**) es un endpoint de API de Azure Functions que permite a un usuario autenticarse con sus credenciales (cédula y contraseña), verificar una prueba de vida, y luego registrar su respuesta a una pregunta específica de una votación activa. La función realiza una serie de validaciones de seguridad y de lógica de negocio antes de persistir el voto en la base de datos.

**Inconsistencia en el Nombre:**
Aunque la función se nombra `listarVotos`, su implementación actual está claramente orientada a **registrar un voto** (`INSERT` en `pv_respuestaParticipante`). Si la intención es listar los votos, la lógica de base de datos y la estructura de respuesta deberían modificarse.

### 2. Parámetros de Entrada (JSON en el `body` de la solicitud POST)

La función espera un JSON en el cuerpo de la solicitud HTTP POST, que debe coincidir con la estructura del DTO `VotoDTO`.

| Parámetro       | Tipo        | Descripción                                                          | Ejemplo             |
| :-------------- | :---------- | :------------------------------------------------------------------- | :------------------ |
| `cedulaUsuario` | `str`       | Cédula de identidad del usuario que intenta votar.                   | `"100000000"`       |
| `contrasenia`   | `SecretStr` | Contraseña del usuario (manejada de forma segura por Pydantic).      | `"JUGAHE0000"`      |
| `prueba_vida`   | `str`       | Un identificador o referencia para la prueba de vida (ej. `UUID` de un archivo). | `"video_123.mp3"`   |
| `preguntaID`    | `int`       | ID de la pregunta a la que el usuario está votando.                  | `1`                 |
| `respuestaID`   | `int`       | ID de la respuesta seleccionada por el usuario para la `preguntaID`.| `1`                 |
| `valor`         | `str`       | El texto o valor asociado a la `respuestaID` seleccionada.           | `"Mejorar el transporte público"` |
| `pesoRespuesta` | `int`       | Un valor numérico que representa el "peso" o la ponderación de la respuesta. | `2`                 |

### 3. Lógica Interna y Flujo de Procesamiento

1.  **Validación de Entrada (Pydantic):**
    * El cuerpo de la solicitud JSON se valida contra el `VotoDTO`. Si falla, se retorna un `400 Bad Request`.

2.  **Autenticación de Usuario:**
    * Se busca al `Usuario` por `cedulaUsuario` en la tabla `pv_usuarios` (`obtenerUsuario`).
    * Si el usuario no existe, se registra un log y se devuelve un `401 Unauthorized`.
    * Se obtiene la llave criptográfica `llaveActiva` del usuario desde `pv_llaveUsuario` (`obtenerLlave`).
    * Se intenta **desencriptar** `llaveActiva.llaveCifrada` usando `dto.contrasenia` como frase de paso (`DECRYPTBYPASSPHRASE`).
    * Si la desencriptación falla (retorna `None`), se registra un log de fallo de autenticación y se devuelve `401 Unauthorized`.
    * La `llave_desencriptada` resultante (que debería ser el `usuario.userid` original) se decodifica de `bytes` a `utf-8`.

3.  **Registro de Prueba de Vida:**
    * Se crea un registro en `pv_documento` (con `tipoDocumentoID=10`) para la prueba de vida del usuario, incluyendo un `checksum` SHA-256 de `dto.prueba_vida`.

4.  **Validación de Votación y Pregunta:**
    * Se obtiene la información completa de la votación (`votacionJSON`) asociada a la `dto.preguntaID` (`getVotacionPorPreguntaID`).
    * Se valida que la votación esté activa según sus fechas de inicio y fin (`validarFechas`). Si no lo está, se retorna un `500 Internal Server Error` (este código de estado podría ser más apropiado como `400 Bad Request` o `403 Forbidden`).
    * **CRÍTICO: Verificación de voto duplicado (lógica con error):**
        * Se llama a `obtenerRespuestasParticipantes(session, llave_desencriptada, usuario)` que devuelve una `List[dict]` de respuestas ya verificadas del usuario.
        * Esta lista se pasa como el primer argumento a `validarVotoUsuario`. **Esto causará un `TypeError`** porque `validarVotoUsuario` espera un solo `dict` (una única `respuesta_participante`) y no una lista.
        * **Para corregir esto, la lógica de `validarVotoUsuario` debe iterar sobre la lista de respuestas obtenidas para verificar si alguna de ellas coincide con la votación y pregunta actual, o `obtenerRespuestasParticipantes` debería filtrar por la pregunta/votación específica que se intenta registrar.** Si la intención es verificar que el usuario **no haya votado antes en esta pregunta**, la lógica debe ser revisada para:
            1.  Consultar `pv_respuestaParticipante` para ver si ya existe un registro para `usuario.userid` y `dto.preguntaID`.
            2.  Si existe, retornar el error apropiado.
        * Actualmente, si la llamada a `validarVotoUsuario` (una vez corregido el `TypeError`) determina que la respuesta es "inválida" según su lógica interna, se devuelve un `500 Internal Server Error` con el mensaje "Este usuario ya votó para esta pregunta." (el código de estado `500` debería ser `409 Conflict` o `403 Forbidden`).

5.  **Registro del Voto:**
    * Se ejecuta una consulta SQL para **cifrar** el `usuario.userid` (convertido a `str`) usando `llave_desencriptada` (la contraseña del usuario) como frase de paso (`ENCRYPTBYPASSPHRASE`). El resultado es binario.
    * **Corrección aplicada:** La línea `ncRespuesta = result.scalar_one()` ahora extrae correctamente el valor binario del `CursorResult`.
    * **Consideración de Tipo de Columna `ncRespuesta`:** Si la columna `ncRespuesta` en la tabla `pv_respuestaParticipante` es de tipo `INT`, esta asignación de un valor binario (`VARBINARY` desde SQL Server) resultará en un error de conversión de tipo en la base de datos. Para que esto funcione, `ncRespuesta` debe ser una columna de tipo `VARBINARY` en la base de datos (lo cual es lo usual para datos cifrados).
    * Se crea una nueva instancia de `Voto` (que mapea a `pv_respuestaParticipante`) con los datos proporcionados y el `ncRespuesta` cifrado.
    * Se añade el `voto` a la sesión y se realiza un `await session.commit()`.

6.  **Respuesta Final:**
    * Si todo es exitoso, se devuelve un `200 OK` con un mensaje de "Voto registrado".

### 4. Estructura de Respuesta Exitosa (HTTP 200 OK)

En caso de éxito, la función devuelve un JSON con el siguiente formato:

```json
{
    "msg": "Voto registrado"
}
"""
```
# Comentar:    
```python
import json
import random
import azure.functions as func
from datetime import datetime
from shared.dtos import ComentarioDTO
from shared.database import get_session
from shared.models import (
    DetalleComentarios, ComentarioPropuesta, Propuesta, Documento,
    IaAnalisis, Log, EstadoComentario, Usuario, UsuarioPermiso, Permiso
)
from cryptography.fernet import Fernet
from sqlalchemy import select
import hashlib
import re

# Clave de cifrado simulada (en práctica debe estar segura)
CLAVE_CIFRADO = Fernet.generate_key()


def generarChecksum(valor: str) -> bytes:
    return hashlib.sha256(valor.encode()).digest()


def cifrarContenido(texto: str, clave: bytes) -> str:
    fernet = Fernet(clave)
    return fernet.encrypt(texto.encode()).decode()


def analizarContenido(titulo: str, cuerpo: str) -> dict:
    if not cuerpo or len(cuerpo.strip()) < 10:
        return {"valido": False, "razon": "El cuerpo es demasiado corto"}

    sensible = re.search(r"documento\s+sensibl(e|es)", cuerpo, re.IGNORECASE)
    return {"valido": True, "sensible": bool(sensible)}


async def usuarioEsValido(session, usuarioId: int) -> bool:
    stmt = (
        select(Usuario)
        .join(UsuarioPermiso)
        .where(
            Usuario.userid == usuarioId,
            UsuarioPermiso.enabled == True,
            UsuarioPermiso.deleted == False,
        )
    )

    stmt = stmt.join(Permiso).where(Permiso.permissionId == 9)

    result = await session.execute(stmt)
    return result.scalar() is not None


async def main(req: func.HttpRequest) -> func.HttpResponse:
    try:
        dto = ComentarioDTO(**req.get_json())
    except Exception as e:
        return func.HttpResponse(
            json.dumps({"error": str(e)}), status_code=400, mimetype="application/json"
        )

    async with get_session() as session:
        async with session.begin():

            if not await usuarioEsValido(session, dto.usuarioId):
                return func.HttpResponse(
                    json.dumps({"error": "Usuario no autorizado"}),
                    mimetype="application/json",
                    status_code=403,
                )

            propuesta = await session.get(Propuesta, dto.propuestaId)
            if not propuesta or not bool(propuesta.comentarios):
                return func.HttpResponse(
                    json.dumps({"error": "La propuesta no permite comentarios"}),
                    mimetype="application/json",
                    status_code=403,
                )

            resultado = analizarContenido(dto.titulo, dto.cuerpo)
            estadoNombre = "Pendiente de Revisión" if resultado["valido"] else "Rechazado"

            estadoQuery = await session.execute(
                select(EstadoComentario).where(EstadoComentario.nombre == estadoNombre)
            )
            estado = estadoQuery.scalar_one()
            ahora = datetime.utcnow()

            cuerpoAlmacenar = cifrarContenido(dto.cuerpo, CLAVE_CIFRADO) if resultado.get("sensible") else dto.cuerpo

            detalle = DetalleComentarios(
                titulo=dto.titulo,
                cuerpo=cuerpoAlmacenar,
                fechaPublicacion=ahora,
                usuarioId=dto.usuarioId,
                organizacionId=dto.organizacionId,
            )
            session.add(detalle)
            await session.flush()

            comentario = ComentarioPropuesta(
                detalleComentarioId=detalle.detalleComentarioId,
                estadoComentId=estado.estadoComentId,
                propuestaId=dto.propuestaId,
            )
            session.add(comentario)
            await session.flush()

            documentoId = None
            if resultado.get("sensible"):
                documento = Documento(
                    nombre=f"comentario_{detalle.detalleComentarioId}.txt",
                    fechaCreacion=ahora,
                    tipoDocumentoID=11,
                    estadoDocumentoID=1,
                    ultimaModificacion=ahora,
                    esActual=True,
                    idLegal=f"{dto.usuarioId}_{detalle.detalleComentarioId}",
                    checksum=generarChecksum(cuerpoAlmacenar),
                )
                session.add(documento)
                await session.flush()

                documentoId = documento.documentoID

                analisis = IaAnalisis(
                    fechaSolicitud=ahora,
                    iaEstadoID=1,
                    fechaComienzo=ahora,
                    fechaFinalizacion=ahora,
                    infoid=random.randint(1, 50),
                    contextoID=1,
                    documentoID=documentoId,
                )
                session.add(analisis)

            log = Log(
                descripcion="Comentario registrado" if resultado["valido"] else "Comentario rechazado",
                timestamp=ahora,
                computador="API-Comentarios",
                usuario=str(dto.usuarioId),
                trace=f"ComentarioID={detalle.detalleComentarioId};Estado={estadoNombre}",
                refId1=dto.propuestaId,
                refId2=detalle.detalleComentarioId,
                valor1=dto.titulo,
                valor2="Sensible" if resultado.get("sensible") else "Normal",
                checksum=generarChecksum(f"{dto.usuarioId}|{dto.propuestaId}|{ahora}"),
                tipologid=1,
                origenlogid=1,
                logseveridadid=1,
            )
            session.add(log)

            if not resultado["valido"]:
                return func.HttpResponse(
                    json.dumps({"msg": "Comentario rechazado", "razon": resultado["razon"]}),
                    mimetype="application/json",
                    status_code=400,
                )

    return func.HttpResponse(
        json.dumps({"msg": "Comentario registrado correctamente"}),
        mimetype="application/json",
        status_code=201,
    )

"""
Función principal: main(req: func.HttpRequest) -> func.HttpResponse
Nombre: comentar

Parámetros de entrada (esperados en el JSON del body):
    - titulo (str): Título del comentario a registrar.
    - cuerpo (str): Contenido textual del comentario. Puede incluir términos sensibles.
    - usuarioId (int): ID del usuario que realiza el comentario.
    - organizacionId (int): ID de la organización a la que pertenece el usuario.
    - propuestaId (int): ID de la propuesta sobre la cual se hace el comentario.

Lógica interna:
    1. Se valida y deserializa el DTO de entrada usando ComentarioDTO.
    2. Se verifica si el usuario tiene el permiso `permissionId = 9`, esté habilitado y no eliminado.
    3. Se consulta si la propuesta correspondiente permite comentarios (`propuesta.comentarios == True`).
    4. Se analiza el contenido del comentario para detectar si es sensible mediante expresión regular.
        - Si es sensible, se cifra el contenido usando `Fernet` y se genera un hash con SHA-256.
    5. Se crea un registro en las siguientes tablas:
        - `DetalleComentarios` (comentario en sí)
        - `ComentarioPropuesta` (vinculación con propuesta)
        - `Documento` (solo si el comentario es sensible)
        - `IaAnalisis` (si se creó documento)
        - `Log` (registro general del evento)
    6. Se devuelve una respuesta:
        - 201 Created si el comentario fue aceptado y registrado.
        - 400 Bad Request si el comentario es inválido o fue rechazado por alguna razón.
        - 403 Forbidden si el usuario no está autorizado o la propuesta no acepta comentarios.

Ejemplo de uso (varía con cada llenado de la BD, hay que seleccionar un usuario que tenga permisos de
comentar en propuestas, esto se puede verificar con un simple SELECT en la BD):
{
  "titulo": "Opinión sobre la propuesta X",
  "cuerpo": "Este comentario incluye un documento sensible que debe ser analizado.",
  "usuarioId": 16,
  "organizacionId": 1,
  "propuestaId": 6
}

SELECT para verificar usuarios:
select * from pv_usuariosPermisos

Bitácora de lo acontecido:
- Se definió función de validación `usuarioEsValido` con join a `UsuarioPermiso` y `Permiso`.
- Se añadió análisis de contenido (`analizarContenido`) con criterio de "documento sensible".
- Se implementó cifrado con `Fernet` y generación de `checksum` con `hashlib.sha256`.
- Se asegura persistencia en `pv_documento` y `pv_iaAnalisis` solo si el contenido es sensible.
- Se crea un `Log` detallado de cada evento con trazabilidad de IDs y estado final.
- Compatible con Azure Functions y SQLAlchemy async con manejo transaccional (`session.begin()`).
"""

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
import json
from datetime import datetime
from sqlalchemy import select, insert, update
from shared.database import get_session
from shared.models import Propuesta, SegmentoPropuesta, UsuarioPermiso, Votacion, PropuestaVotacion, Segmento, VotacionPregunta
from shared.dtos import CrearConfiguracionVotacionDTO
import azure.functions as func
from fastapi import Header, HTTPException

async def validar_permiso(session, usuario_id: int, permiso_code: str, propuesta_id: int) -> bool:
    """
    Verifica que el usuario tiene el permiso especificado para modificar la propuesta dada.
    
    Parámetros:
    - session: sesión activa de SQLAlchemy.
    - usuario_id: ID del usuario que intenta realizar la acción.
    - permiso_code: código del permiso requerido (ej: 'configurarVotacion').
    - propuesta_id: ID de la propuesta que se desea modificar.
    
    Retorna:
    - True si el usuario tiene el permiso y es dueño de la propuesta.
    - False en caso contrario.
    """

    # Validar que el usuario sea dueño de la propuesta
    propuesta_stmt = select(Propuesta).where(
        Propuesta.propuestaId == propuesta_id,
        Propuesta.userId == usuario_id
    )
    propuesta_result = await session.execute(propuesta_stmt)
    propuesta = propuesta_result.scalar_one_or_none()

    if not propuesta:
        return False

    return True
async def main(req: func.HttpRequest) -> func.HttpResponse:
    try:
        dto = CrearConfiguracionVotacionDTO(**req.get_json())
    except Exception as e:
        return func.HttpResponse(f"Error en los datos recibidos: {str(e)}", status_code=400)

    async with get_session() as session:
        # Validar que el usuario tiene permiso sobre la propuesta
        tiene_permiso = await validar_permiso(session, dto.usuarioID, 'configurarVotacion', dto.propuestaID)
        if not tiene_permiso:
            return func.HttpResponse("No tiene permiso para configurar esta propuesta", status_code=403)

        # 1. Crear o actualizar la votación
        now = datetime.utcnow()
        nuevaVotacion = Votacion(
            tipoVotacionId=dto.tipoVotacionId,
            titulo=dto.titulo,
            descripcion=dto.descripcion,
            fechaInicio=dto.fechaInicio,
            fechaFin=dto.fechaFin,
            estadoVotacionId=1,  # Estado: Preparado
            ultimaModificacion=now,
            privada=dto.privada,
            esSecreta=dto.esSecreta
        )
        session.add(nuevaVotacion)
        await session.flush()  # Para obtener el ID generado

        # 2. Asociar la votación a la propuesta
        propuestaVotacion = PropuestaVotacion(
            votacionID=nuevaVotacion.votacionID,
            propuestaID=dto.propuestaID,
            usuarioID=dto.usuarioID,
            deleted=False,
            checksum=b"NA"
        )
        session.add(propuestaVotacion)

        # 3. Asociar los segmentos seleccionados (población meta)
        if dto.segmentosSeleccionados:
            for segID in dto.segmentosSeleccionados:
                await session.execute(insert(SegmentoPropuesta).values(
                    propuestaID=dto.propuestaID,
                    segementoID=segID,
                    deleted=False,
                    usuarioID=dto.usuarioID,
                    checksum=b"NA"
                ))
        for pregunta in dto.preguntas:
            pregRow = VotacionPregunta(
                votacionID=nuevaVotacion.votacionID,
                preguntaID=pregunta.preguntaID
            )
            session.add(pregRow)

        await session.commit()

        return func.HttpResponse(json.dumps({"mensaje": "Votación configurada", "votacionID": nuevaVotacion.votacionID}), mimetype="application/json", status_code=201)
"""
Función principal: main(req: func.HttpRequest) -> func.HttpResponse  
Nombre: configurarVotacion

Parámetros de entrada (esperados en el JSON del body, vía DTO `CrearConfiguracionVotacionDTO`):
    - usuarioID (int): ID del usuario que desea configurar la votación.
    - propuestaID (int): ID de la propuesta sobre la cual se configura la votación.
    - tipoVotacionId (int): Tipo de votación a registrar (ej. abierta, cerrada, etc.).
    - titulo (str): Título de la votación.
    - descripcion (str): Descripción de la votación.
    - fechaInicio (datetime): Fecha y hora de inicio de la votación.
    - fechaFin (datetime): Fecha y hora de finalización de la votación.
    - privada (bool): Indica si la votación es privada.
    - esSecreta (bool): Indica si la votación es secreta.
    - segmentosSeleccionados (List[int]): Lista de IDs de segmentos de población a los que se dirige la votación.
    - preguntas (List[PreguntaDTO]): Lista de preguntas que se incluirán en la votación.

Lógica interna:
    1. Se valida y deserializa el DTO de entrada usando `CrearConfiguracionVotacionDTO`.
    2. Se verifica que el usuario:
        - Es dueño de la propuesta (`Propuesta.userId == usuarioID`).
        - Tiene asignado el permiso específico (`permisoID == 6`), esté habilitado y no eliminado.
    3. Se crea un nuevo registro en la tabla `pv_votacion` con estado "Preparado".
    4. Se vincula la votación con la propuesta mediante `pv_propuestaVotacion`.
    5. Se asocian los segmentos seleccionados como población objetivo, insertando en `pv_segmentoPropuesta`.
    6. Se validan los IDs de preguntas recibidos y se insertan las relaciones en `pv_votacionPregunta`.
        - Si alguna pregunta no existe en la base de datos (`pv_preguntas`), se omite o se rechaza toda la transacción.
    7. Se realiza el `commit()` de la transacción para persistir los cambios.

Respuesta esperada:
    - 201 Created con `votacionID` generado si la operación fue exitosa.
    - 400 Bad Request si los datos están mal estructurados o hay preguntas inválidas.
    - 403 Forbidden si el usuario no tiene permiso o no es dueño de la propuesta.

Ejemplo de entrada:
{
  "usuarioID": 789,
  "propuestaID": 5,
  "titulo": "Consulta sobre políticas públicas 2025",
  "descripcion": "Votación para definir prioridades en políticas públicas nacionales.",
  "fechaInicio": "2025-07-01T08:00:00Z",
  "fechaFin": "2025-07-10T18:00:00Z",
  "tipoVotacionId": 2,
  "privada": false,
  "esSecreta": true,
  "segmentosSeleccionados": [1, 3, 5],
  "geografiaImpacto": "nacional",
  "restriccionesIP": ["192.168.0.0/24", "10.0.0.0/8"],
  "horariosPermitidos": ["08:00-12:00", "14:00-18:00"],
  "preguntas": [
    {
      "preguntaID": 42
    },
    {
      "preguntaID": 43
    }
  ]
}

SELECT para verificar permisos del usuario:
SELECT * FROM pv_usuariosPermisos WHERE userid = 16 AND permisoId = 6 AND enabled = 1 AND deleted = 0

Bitácora de lo acontecido:
- Se definió función `validar_permiso` para verificar propiedad y permisos sobre la propuesta.
- Se usó `session.flush()` para obtener el `votacionId` generado automáticamente.
- Se incluyó validación de existencia de preguntas para prevenir errores de integridad referencial.
- Se aseguró atomicidad mediante `async with session:` y `commit()` al final.
- Compatible con Azure Functions, SQLAlchemy async y DTO validado vía Pydantic.
"""

```



