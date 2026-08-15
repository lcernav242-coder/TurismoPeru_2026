-- Reserva Cliente
CREATE OR ALTER FUNCTION lfcv.fn_MT_ReservasCliente
(
	@IdCliente int
)
RETURNS @Resultado TABLE
(
	IdReserva int,
	FechaReserva date,
	EstadoReserva varchar(100),
	TotalPagado money
)
AS
BEGIN
	INSERT INTO @Resultado
	(
		IdReserva,
		FechaReserva,
		EstadoReserva,
		TotalPagado
	)
	SELECT
		R.id_reserva,
		R.fecha_reserva,
		ER.nombre, -- Estado Reserva
		isnull (SUM(P.monto), 0) -- Pagos
	FROM lfcv.reserva R 
	INNER JOIN
		lfcv.estado_reserva ER on
		er.id_estado_reserva = r.id_estado_reserva

	LEFT JOIN
		lfcv.pago P on
		R.id_reserva = P.id_reserva
	where R.id_cliente = @IdCliente

	GROUP BY
		R.id_reserva,
		R.fecha_reserva,
		ER.nombre; -- Estado Reserva
	
	RETURN;
END;
GO

SELECT 
	*,
	GETDATE() as Fecha_Consulta,
	lfcv.fn_NombreCompletoPersona (104) as Estudiante
FROM lfcv.fn_MT_ReservasCliente (10);