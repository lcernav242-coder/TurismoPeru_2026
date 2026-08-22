CREATE OR ALTER VIEW lfcv.vw_alojamientos
AS
SELECT 
	A.nombre,
	TA.Nombre_Tipo,
	TA.Descripcion,
	GETDATE() AS Fecha_Consulta,
	lfcv.fn_NombreCompletoPersona(105) AS Estudiante
FROM lfcv.alojamiento A
INNER JOIN LFCV.tipo_alojamiento TA 
	ON A.id_tipoalojamiento = TA.id_tipoalojamiento;
GO

SELECT * FROM lfcv.vw_alojamientos;
GO