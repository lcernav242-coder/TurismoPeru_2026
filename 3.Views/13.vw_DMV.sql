--7.1. sintaxis
SELECT
columnas,
GETDATE() AS FechaConsulta,
LFCV.fn_NombreCompletoPersona(108) AS Estudiante
FROM sys.nombre_de_la_dmv
WHERE condicion;

--consulta a una DMV existente
use TURISMOPERU_LFCV
SELECT
S.session_id AS IdSesion,
S.login_name AS Usuario,
S.host_name AS Equipo,
S.program_name AS Programa,
S.status AS Estado,
S.login_time AS FechaConexion,
GETDATE() AS FechaConsulta,
LFCV.fn_NombreCompletoPersona(108) AS Estudiante
FROM sys.dm_exec_sessions AS S
WHERE S.session_id = @@SPID;