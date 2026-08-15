CREATE OR ALTER FUNCTION lfcv.fn_HabitacionesAlojamiento
(
@IdAlojamiento int
)
returns table 
return
(
Select 
		H.id_alojamiento,
		H.numero_habitacion,
		TH.nombrehabitacion,
		H.precio_noche,
		H.estado,
		H.descripcion

from lfcv.habitacion H inner join
lfcv.tipo_habitacion TH on
H.id_tipo_habitacion = TH.id_tipo_habitacion
where id_alojamiento = 1 --@Id Alojamiento
);
go

SELECT *,
    GETDATE() as Fecha_Consulta,
    lfcv.fn_NombreCompletoPersona (105) as Estudiante
FROM lfcv.fn_HabitacionesAlojamiento (2);