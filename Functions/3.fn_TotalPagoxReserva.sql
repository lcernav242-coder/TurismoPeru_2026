CREATE OR ALTER FUNCTION lfcv.fn_PagoTotalxReserva
(
    @IdReserva int
)
RETURNS MONEY
AS
BEGIN
    Declare @Total money
    Select
        @Total = sum(monto)
    from lfcv.pago
    where id_reserva = @IdReserva;

    RETURN isnull (@Total,0);
END;
Go
--ejecutar 
select lfcv.fn_PagoTotalxReserva (2) AS MontoPagado,
Getdate() as Fecha_Consulta;