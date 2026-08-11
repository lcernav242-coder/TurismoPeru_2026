CREATE OR ALTER PROCEDURE lfcv.sp_actualizar_persona
    @id_persona INT,
    @nombres VARCHAR(100),
    @apaterno VARCHAR(100),
    @amaterno VARCHAR(100),
    @telefono VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM lfcv.persona WHERE id_persona = @id_persona)
    BEGIN
        UPDATE lfcv.persona
        SET nombres = @nombres,
            apaterno = @apaterno,
            amaterno = @amaterno,
            telefono = @telefono
        WHERE id_persona = @id_persona;
        
        PRINT 'Datos de la persona actualizados correctamente.';
    END
    ELSE
    BEGIN
        PRINT 'No se encontró el ID de la persona para actualizar.';
    END
END
GO