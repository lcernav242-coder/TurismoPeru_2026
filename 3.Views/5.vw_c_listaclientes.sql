
CREATE OR ALTER VIEW lfcv.vw_ListaClientes
AS
SELECT
C.id_persona AS IdCliente,
P.apaterno AS ApellidoPaterno,
P.amaterno AS ApellidoMaterno,
P.nombres AS Nombres,
CASE
WHEN P.tipo_persona = 'N' THEN 'Natural'
WHEN P.tipo_persona = 'J' THEN 'Juridica'
ELSE 'No especificado'
END AS TipoPersona,
N.nombrenacionalidad AS Nacionalidad,
C.fecha_nacimiento AS FechaNacimiento,
P.estado AS Estado,
GETDATE() AS FechaConsulta,
lfcv.fn_NombreCompletoPersona(105) AS Estudiante
FROM lfcv.cliente AS C
INNER JOIN lfcv.persona AS P
ON C.id_persona = P.id_persona
INNER JOIN lfcv.nacionalidad AS N
ON P.id_nacionalidad = N.id_nacionalidad;
GO

SELECT *
FROM lfcv.vw_ListaClientes
WHERE Estado = 'Activo';