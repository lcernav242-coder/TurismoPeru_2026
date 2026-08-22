SET NUMERIC_ROUNDABORT OFF;
SET ANSI_NULLS ON;
SET ANSI_PADDING ON;
SET ANSI_WARNINGS ON;
SET ARITHABORT ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET QUOTED_IDENTIFIER ON;
GO
CREATE OR ALTER VIEW LFCV.vw_IX_ResumenPagosReserva
WITH SCHEMABINDING
AS
SELECT
P.id_reserva AS IdReserva,
COUNT_BIG(*) AS CantidadPagos,
SUM(P.monto) AS TotalPagado
FROM LFCV.pago AS P
GROUP BY P.id_reserva;
GO
CREATE UNIQUE CLUSTERED INDEX IX_vw_ResumenPagosReserva
ON LFCV.vw_IX_ResumenPagosReserva(IdReserva);
GO
----
SELECT
V.*,
GETDATE() AS FechaConsulta,
LFCV.fn_NombreCompletoPersona(108) AS Estudiante
FROM LFCV.vw_IX_ResumenPagosReserva AS V
WITH (NOEXPAND)
ORDER BY V.TotalPagado DESC;

--COMPROBAR EL ÍNDICE
SELECT
I.name AS NombreIndice,
I.type_desc AS TipoIndice,
I.is_unique AS EsUnico
FROM sys.indexes AS I
WHERE I.object_id =
OBJECT_ID('LFCV.vw_IX_ResumenPagosReserva')
AND I.index_id > 0;