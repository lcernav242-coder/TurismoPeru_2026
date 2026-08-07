USE TurismoPeru_2026;
GO

CREATE PROCEDURE sp_listar_clientes
AS
BEGIN
    SELECT * FROM cliente;
END
GO