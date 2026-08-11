CREATE OR ALTER PROCEDURE lfcv.sp_ListarClientes
AS
BEGIN
    Select p.id_persona, p.tipo_persona,nombres, apaterno,amaterno, estado
    From lfcv.persona p
    inner join lfcv.cliente c
    on p.id_persona = c.id_persona
END
GO
