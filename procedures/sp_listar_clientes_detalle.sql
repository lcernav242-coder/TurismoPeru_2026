CREATE OR ALTER PROCEDURE lfcv.sp_listar_clientes_detalle
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        c.id_cliente,
        p.nombres,
        p.apaterno,
        p.amaterno,
        p.numero_documento AS dni,
        p.telefono
    FROM lfcv.cliente c
    INNER JOIN lfcv.persona p ON c.id_persona = p.id_persona
    ORDER BY p.apaterno ASC;
END
GO