CREATE OR ALTER FUNCTION lfcv.fn_ClasificacionCliente
(
    @IdCliente int
)
RETURNS varchar(50)
AS
BEGIN
    DECLARE @Cantidad int;
    DECLARE @Clasificacion varchar(50);
    
    -- Reutilizamos la función escalar anterior
    SET @Cantidad = lfcv.fn_CantidadReservasCliente(@IdCliente);
    
    IF @Cantidad >= 10 
        SET @Clasificacion = 'VIP';
    ELSE IF @Cantidad >= 5 
        SET @Clasificacion = 'Frecuente';
    ELSE 
        SET @Clasificacion = 'Regular';
        
    RETURN @Clasificacion;
END;
GO

-- Ejecutar
SELECT 
    lfcv.fn_ClasificacionCliente(2) as Clasificacion,
    GETDATE() as Fecha_Consulta,
    lfcv.fn_NombreCompletoPersona(105) as Estudiante;
GO