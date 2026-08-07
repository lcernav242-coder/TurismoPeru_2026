USE TurismoPeru_2026;
GO

CREATE PROCEDURE sp_insertar_cliente
    @id_persona INT,
    @codigo_cliente VARCHAR(20)
AS
BEGIN
    INSERT INTO cliente (id_persona, codigo_cliente)
    VALUES (@id_persona, @codigo_cliente);
END
GO