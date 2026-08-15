CREATE OR ALTER FUNCTION lfcv.fn_MT_ClasificarReservasClienteCantidad
(
    @IdCliente int
)
RETURNS @Resultado TABLE
(
    IdCliente int,
    TotalReservas int,
    Clasificacion varchar(50)
)
AS
BEGIN
    DECLARE @Total int;
    DECLARE @Nivel varchar(50);
    
    SELECT @Total = count(id_reserva) 
    FROM lfcv.reserva 
    WHERE id_cliente = @IdCliente;
    
    IF @Total >= 15 
        SET @Nivel = 'Alta Demanda';
    ELSE IF @Total >= 5 
        SET @Nivel = 'Demanda Regular';
    ELSE 
        SET @Nivel = 'Baja Demanda';
        
    INSERT INTO @Resultado (IdCliente, TotalReservas, Clasificacion)
    VALUES (@IdCliente, isnull(@Total,0), @Nivel);
    
    RETURN;
END;
GO

-- Ejecutar
SELECT *, 
    GETDATE() as Fecha_Consulta, 
    lfcv.fn_NombreCompletoPersona(105) as Estudiante 
FROM lfcv.fn_MT_ClasificarReservasClienteCantidad(2);
GO