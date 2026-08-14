--Obtener el nombre completo de una persona

CREATE OR ALTER FUNCTION lfcv.fn_NombreCompletoPersona
(
	@IdPersona int
)
RETURNS VARCHAR(200)
AS
BEGIN
	Declare @nombrecompleto Varchar(200);
	Select
		@nombrecompleto =
		nombres + ' ' +
		apaterno + ' ' +
		amaterno
	from lfcv.persona
	where id_persona = @IdPersona;
	--
	Return @nombrecompleto;
END
GO

-- ejecutar
Select lfcv.fn_NombreCompletoPersona(105)
as Persona, getdate() as FechaConsulta