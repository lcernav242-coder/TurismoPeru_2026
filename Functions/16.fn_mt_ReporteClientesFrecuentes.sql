CREATE OR ALTER FUNCTION lfcv.fn_MT_ReporteClientesFrecuentes()
RETURNS @Reporte TABLE
(
    IdCliente int,
    CantidadReservas int,
    TotalPagado money,
    Categoria varchar(50)
)
AS
BEGIN
    -- 1. Obtenemos las reservas por cliente
    INSERT INTO @Reporte (IdCliente, CantidadReservas, TotalPagado)
    SELECT 
        id_cliente, 
        COUNT(id_reserva),
        0 
    FROM lfcv.reserva
    GROUP BY id_cliente;

    -- 2. Calculamos y actualizamos los pagos sobre la misma tabla
    UPDATE R
    SET R.TotalPagado = ISNULL((
        SELECT SUM(P.monto)
        FROM lfcv.reserva Res
        INNER JOIN lfcv.pago P ON Res.id_reserva = P.id_reserva
        WHERE Res.id_cliente = R.IdCliente
    ), 0)
    FROM @Reporte R;

    -- 3. Clasificamos al cliente
    UPDATE @Reporte
    SET Categoria = 
        CASE 
            WHEN CantidadReservas >= 10 OR TotalPagado >= 5000 THEN 'VIP'
            WHEN CantidadReservas >= 5 OR TotalPagado >= 2000 THEN 'Frecuente'
            ELSE 'Regular'
        END;

    RETURN;
END;
GO

-- Ejecutar
SELECT *, 
    GETDATE() as Fecha_Consulta, 
    lfcv.fn_NombreCompletoPersona(105) as Estudiante 
FROM lfcv.fn_MT_ReporteClientesFrecuentes();
GO