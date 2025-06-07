INSERT INTO dbo.pv_iaModelo (nombre, parametrosJSON)
VALUES
    ('GPT-4o', '{"temperature": 0.7, "max_tokens": 4096, "top_p": 1.0, "frequency_penalty": 0.0, "presence_penalty": 0.0}'),
    ('Claude 3 Opus', '{"temperature": 0.5, "max_tokens": 8192, "top_p": 0.9, "stop_sequences": ["\n\nHuman:"], "stream": false}'),
    ('Gemini 1.5 Pro', '{"temperature": 0.9, "max_output_tokens": 32768, "top_p": 0.8, "top_k": 40}'),
    ('Mistral Large', '{"temperature": 0.6, "max_tokens": 32768, "random_seed": 1234}'),
    ('Llama 3 70B', '{"temperature": 0.8, "max_new_tokens": 8192, "do_sample": true}'),
    ('DALL-E 3', '{"size": "1024x1024", "quality": "standard", "n": 1}'),
    ('Whisper Large v3', '{"response_format": "json", "language": "es", "temperature": 0.0}'),
    ('Stable Diffusion XL', '{"steps": 20, "cfg_scale": 7.5, "sampler": "Euler a"}'),
    ('Cohere Command R+', '{"max_tokens": 128000, "p": 0.75, "k": 0, "stop_sequences": ["<|END_OF_TURN|>"]}'),
    ('Titan Text Express', '{"textGenerationConfig": {"maxTokenCount": 8192, "temperature": 0.7, "topP": 0.9}}');

INSERT INTO dbo.pv_iaPrompts (prompt, contextoID)
VALUES
    ('Resume el siguiente documento en 3 puntos clave.', NULL),
    ('Analiza el sentimiento del siguiente comentario: ', NULL),
    ('Extrae las 5 palabras clave de este texto.', NULL),
    ('Genera una respuesta amigable para el siguiente mensaje de soporte: ', NULL),
    ('Crea un breve anuncio para el siguiente producto: ', NULL),
    ('Traduce el siguiente texto al inglés: ', NULL),
    ('Revisa la siguiente propuesta y sugiere mejoras en la claridad.', NULL),
    ('Dada la siguiente descripción, genera un título conciso y atractivo.', NULL),
    ('Clasifica el siguiente texto en una de estas categorías: A, B, C.', NULL),
    ('Genera una lista de 5 preguntas frecuentes basadas en la siguiente información.', NULL),
    ('Proporciona una breve descripción de la siguiente imagen.', NULL),
    ('Transcribe el siguiente audio y resume los puntos principales.', NULL),
    ('Identifica cualquier inconsistencia en la siguiente base de datos de hechos.', NULL),
    ('Completa la siguiente oración de manera lógica: "La inversión en tecnología..."', NULL),
    ('Escribe un poema corto sobre la naturaleza.', NULL);

INSERT INTO dbo.pv_metodoLlamadaAPI (nombre) VALUES
('GET'),
('POST'),
('PUT'),
('DELETE'),
('PATCH');