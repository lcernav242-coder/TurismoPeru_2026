
CREATE OR ALTER VIEW esquema.vwc_nombre_vista_compleja
AS
SELECT 
    t1.columna1, 
    t2.columna2,
    SUM(t1.columna3) AS [Total_Agrupado]
FROM esquema.tabla1 t1
INNER JOIN esquema.tabla2 t2 
    ON t1.id = t2.id
WHERE t1.condicion = 'Valor'
GROUP BY 
    t1.columna1, 
    t2.columna2;
GO