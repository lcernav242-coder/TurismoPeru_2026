USE TURISMOPERU_LFCV;
GO

CREATE PROCEDURE sp_buscar_persona_dni
    @dni VARCHAR(8)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM persona WHERE dni = @dni)
    BEGIN
        SELECT id_persona, nombres, apellidos, dni, telefono 
        FROM persona 
        WHERE dni = @dni;
    END
    ELSE
    BEGIN
        PRINT 'No se encontró ninguna persona con el DNI ingresado.';
    END
END
GO