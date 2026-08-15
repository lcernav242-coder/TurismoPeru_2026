CREATE OR ALTER FUNCTION lfcv.fn_MT_ResumenHabitaciones
(
    @IdAlojamiento int
)
RETURNS @Resultado TABLE
(
    TipoHabitacion varchar(100),
    CantidadHabitaciones int,
    PrecioPromedio money
)
AS
BEGIN
    INSERT INTO @Resultado (TipoHabitacion, CantidadHabitaciones, PrecioPromedio)
    SELECT 
        TH.nombrehabitacion,
        COUNT(H.id_habitacion),
        AVG(H.precio_noche)
    FROM lfcv.habitacion H
    INNER JOIN lfcv.tipo_habitacion TH ON H.id_tipo_habitacion = TH.id_tipo_habitacion
    WHERE H.id_alojamiento = @IdAlojamiento
    GROUP BY TH.nombrehabitacion;
    
    RETURN;
END;
GO


-- Ejecutar
SELECT *, 
    GETDATE() as Fecha_Consulta, 
    lfcv.fn_NombreCompletoPersona(105) as Estudiante 
FROM lfcv.fn_MT_ResumenHabitaciones(1);
GO