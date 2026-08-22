--6.1. sintaxis
SELECT
O.*,
GETDATE() AS FechaConsulta,
LFCV.fn_NombreCompletoPersona(105) AS Estudiante
FROM sys.objects AS O;

--6.2. tablas
SELECT
T.object_id,
T.name,
T.create_date,
T.modify_date,
GETDATE() AS FechaConsulta,
LFCV.fn_NombreCompletoPersona(105) AS Estudiante
FROM sys.tables AS T
ORDER BY T.name;

--6.3. VISTAS
SELECT
V.object_id,
V.name,
V.create_date,
V.modify_date,
GETDATE() AS FechaConsulta,
LFCV.fn_NombreCompletoPersona(105) AS Estudiante
FROM sys.views AS V
ORDER BY V.name;

--6.4. COLUMNAS
SELECT
C.object_id,
C.column_id,
C.name,
C.system_type_id,
C.max_length,
C.is_nullable,
GETDATE() AS FechaConsulta,
LFCV.fn_NombreCompletoPersona(105) AS Estudiante
FROM sys.columns AS C
ORDER BY C.object_id, C.column_id;

--6.5. INDICES
SELECT
I.object_id,
OBJECT_NAME(I.object_id) AS tabla,
I.index_id,
I.name,
I.type_desc,
GETDATE() AS FechaConsulta,
LFCV.fn_NombreCompletoPersona(105) AS Estudiante
FROM sys.indexes AS I
ORDER BY tabla;

--6.6. CLAVES FORANEAS
SELECT
FK.name AS foreign_key,
OBJECT_NAME(FK.parent_object_id) AS tabla,
GETDATE() AS FechaConsulta,
LFCV.fn_NombreCompletoPersona(105) AS Estudiante
FROM sys.foreign_keys AS FK;

--6.7. PROCEDIMIENTOS ALMACENADOS
SELECT
P.object_id,
P.name,
P.create_date,
P.modify_date,
GETDATE() AS FechaConsulta,
LFCV.fn_NombreCompletoPersona(105) AS Estudiante
FROM sys.procedures AS P
ORDER BY P.name;

--6.8. Analizar todas las vistas creadas por el estudiante.
SELECT
SCHEMA_NAME(V.schema_id) AS esquema,
V.name AS vista,
V.create_date,
V.modify_date,
GETDATE() AS FechaConsulta,
LFCV.fn_NombreCompletoPersona(105) AS Estudiante
FROM sys.views AS V
WHERE V.schema_id = SCHEMA_ID('LFCV')
ORDER BY V.name;