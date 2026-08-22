CREATE OR ALTER VIEW lfcv.vw_pagosmayores500
AS 
SELECT
	P.id_pago,
	P.id_reserva,
	P.monto,
	MP.nombre AS [Medio de Pago],
	GETDATE() AS Fecha_Consulta,
	lfcv.fn_NombreCompletoPersona(105) AS Nombre_Cliente
FROM lfcv.pago P
INNER JOIN lfcv.medio_pago MP 
	ON P.id_medio_pago = MP.id_medio_pago
WHERE P.monto > 500;
GO

SELECT * FROM lfcv.vw_pagosmayores500;
GO