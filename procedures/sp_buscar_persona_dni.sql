CREATE OR ALTER PROCEDURE lfcv.sp_buscar_persona_dni
    @dni VARCHAR(8)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM lfcv.persona WHERE numero_documento = @dni)
    BEGIN
        SELECT 
            id_persona, 
            nombres, 
            apaterno, 
            amaterno, 
            numero_documento AS dni, 
            telefono 
        FROM lfcv.persona 
        WHERE numero_documento = @dni;
    END
    ELSE
    BEGIN
        PRINT 'No se encontró ninguna persona con el DNI ingresado.';
    END
END
GO