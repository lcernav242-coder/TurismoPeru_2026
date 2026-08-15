-- Utilizar la función de reservas en un JOIN
SELECT 
    C.id_persona,
    F.IdReserva,
    F.FechaReserva,
    F.EstadoReserva,
    GETDATE() as Fecha_Consulta,
    lfcv.fn_NombreCompletoPersona(105) as Estudiante
FROM lfcv.cliente C
CROSS APPLY lfcv.fn_MT_ReservasCliente(C.id_persona) F;
GO