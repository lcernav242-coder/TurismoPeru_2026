CREATE OR ALTER FUNCTION lfcv.fn_ClientesReservasActivas()
RETURNS TABLE
RETURN
(
    SELECT DISTINCT 
        R.id_cliente,
        ER.nombre as EstadoReserva
    FROM lfcv.reserva R
    INNER JOIN lfcv.estado_reserva ER ON R.id_estado_reserva = ER.id_estado_reserva
    WHERE ER.nombre = 'Activa' -- o 'En Proceso' según tu tabla
);
GO

-- Ejecutar
SELECT *, 
    GETDATE() as Fecha_Consulta, 
    lfcv.fn_NombreCompletoPersona(105) as Estudiante 
FROM lfcv.fn_ClientesReservasActivas();
GO