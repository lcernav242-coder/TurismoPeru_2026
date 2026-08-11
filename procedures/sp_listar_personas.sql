CREATE OR ALTER PROCEDURE lfcv.sp_ListarPersonas
AS
BEGIN
    Select id_persona, tipo_persona,nombres, apaterno,amaterno, estado
    From lfcv.persona
END
GO
