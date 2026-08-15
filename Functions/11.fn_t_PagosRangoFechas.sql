CREATE OR ALTER FUNCTION lfcv.fn_PagosRangoFechas
(
    @FechaInicio date,
    @FechaFin date
)
RETURNS TABLE
RETURN
(
    SELECT 
        id_pago,
        id_reserva,
        monto,
        fecha_pago
    FROM lfcv.pago
    WHERE fecha_pago BETWEEN @FechaInicio AND @FechaFin
);
GO

-- Ejecutar
SELECT *, 
    GETDATE() as Fecha_Consulta, 
    lfcv.fn_NombreCompletoPersona(105) as Estudiante 
FROM lfcv.fn_PagosRangoFechas('2026-01-01', '2026-12-31');
GO