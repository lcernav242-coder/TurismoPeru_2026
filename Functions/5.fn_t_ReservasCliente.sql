t_Res--Reserva de un cliente
CREATE OR ALTER FUNCTION lfcv.fn_ReservaCliente
(
	@IdCliente int
)
RETURNS TABLE
RETURN
(
	SELECT
		id_reserva,
		fecha_reserva,
		ER.nombre as [Estado Reserva]
	FROM lfcv.reserva R inner join
	lfcv.estado_reserva ER on
	ER.id_estado_reserva = R.id_estado_reserva
	WHERE R.id_Cliente=@IdCliente
);
GO
--Ejecutar
SELECT * , getdate() as Fecha_Consulta, lfcv.fn_NombreCompletoPersona(105)as Estudiane 
FROM lfcv.fn_ReservaCliente(2);