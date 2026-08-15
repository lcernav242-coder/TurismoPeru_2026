-- Sintaxis Funcion Tabla Multiples Sentencias

CREATE OR ALTER FUNCTION lfcv.fn_nombrefuncion
(
	--@parametro1 TipoDato
	@edad int
)
RETURNS @Resultado TABLE
(
	columna1 tipodato,
	columna2 tipodato,
	columna3 tipodato
)
AS
BEGIN
	-- Instrucciones SQL
	RETURN;
END;
GO