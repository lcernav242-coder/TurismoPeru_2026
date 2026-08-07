USE TurismoPeru_2026;
GO

CREATE PROCEDURE sp_listar_personas
AS
BEGIN
    SELECT * FROM persona;
END
GO