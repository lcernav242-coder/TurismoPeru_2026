USE TURISMOPERU_LFCV;
GO

CREATE PROCEDURE sp_eliminar_persona
    @id_persona INT
AS
BEGIN
    DELETE FROM persona
    WHERE id_persona = @id_persona;
    
    PRINT 'Registro eliminado correctamente del sistema.';
END
GO