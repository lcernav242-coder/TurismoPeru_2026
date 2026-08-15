CREATE OR ALTER FUNCTION lfcv.fn_CantidadReservasCliente
(
    @IdCliente int
)
RETURNS int
AS
BEGIN
    DECLARE @Cantidad int;
    
    SELECT @Cantidad = count(id_reserva)
    FROM lfcv.reserva
    WHERE id_cliente = @IdCliente;
    
    RETURN isnull(@Cantidad, 0);
END;
GO

-- Ejecutar
SELECT 
    lfcv.fn_CantidadReservasCliente(2) as CantidadReservas,
    GETDATE() as Fecha_Consulta,
    lfcv.fn_NombreCompletoPersona(105) as Estudiante;
GO