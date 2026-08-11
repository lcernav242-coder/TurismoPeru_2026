USE TURISMOPERU_LFCV;
GO

CREATE PROCEDURE sp_actualizar_persona
    @id_persona INT,
    @nombres VARCHAR(100),
    @apellidos VARCHAR(100),
    @telefono VARCHAR(15)
AS
BEGIN
    UPDATE persona
    SET nombres = @nombres,
        apellidos = @apellidos,
        telefono = @telefono
    WHERE id_persona = @id_persona;
    
    PRINT 'Datos de la persona actualizados correctamente.';
END
GO