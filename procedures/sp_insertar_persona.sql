USE TurismoPeru_2026;
GO

CREATE PROCEDURE sp_insertar_persona
    @nombres VARCHAR(100),
    @apellidos VARCHAR(100),
    @dni VARCHAR(8),
    @telefono VARCHAR(15)
AS
BEGIN
    INSERT INTO persona (nombres, apellidos, dni, telefono)
    VALUES (@nombres, @apellidos, @dni, @telefono);
END
GO