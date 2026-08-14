-- Calcular el IGV de un Pago
CREATE OR ALTER FUNCTION lfcv.fn_CalcularIGVPago
(
	@monto money
)
RETURNS money
as
begin
	return @monto*0.18;
end;
go

--ejecutar
Select lfcv.fn_CalcularIGVPago (459) as IGV,
GETDATE() as Fecha_Consulta;

Select 
monto,
lfcv.fn_CalcularIGVPago(monto) as IGV,
GETDATE() as Fecha_Consulta
from lfcv.pago
where monto >=0