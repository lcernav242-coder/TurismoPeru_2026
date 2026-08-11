CREATE OR ALTER PROCEDURE lfcv.sp_eliminar_persona
    @id_persona INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM lfcv.persona WHERE id_persona = @id_persona)
    BEGIN
        DELETE FROM lfcv.persona
        WHERE id_persona = @id_persona;
        
        PRINT 'Registro eliminado correctamente del sistema.';
    END
    ELSE
    BEGIN
        PRINT 'No se encontró el ID de la persona para eliminar.';
    END
END
GO