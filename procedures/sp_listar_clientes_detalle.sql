USE TURISMOPERU_LFCV;
GO

CREATE PROCEDURE sp_listar_clientes_detalle
AS
BEGIN
    SELECT 
        c.id_cliente,
        c.codigo_cliente,
        p.nombres,
        p.apellidos,
        p.dni,
        p.telefono
    FROM cliente c
    INNER JOIN persona p ON c.id_persona = p.id_persona
    ORDER BY p.apellidos ASC;
END
GO