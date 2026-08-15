CREATE OR ALTER FUNCTION lfcv.fn_MT_ConsultarReservasEstado
(
    @IdCliente int,
    @Estado varchar(100) = NULL
)
RETURNS @Resultado TABLE
(
    IdReserva int,
    FechaReserva date,
    EstadoReserva varchar(100)
)
AS
BEGIN
    IF @Estado IS NULL
    BEGIN
        -- Si no envían estado, se traen todas las del cliente
        INSERT INTO @Resultado (IdReserva, FechaReserva, EstadoReserva)
        SELECT R.id_reserva, R.fecha_reserva, ER.nombre
        FROM lfcv.reserva R
        INNER JOIN lfcv.estado_reserva ER ON R.id_estado_reserva = ER.id_estado_reserva
        WHERE R.id_cliente = @IdCliente;
    END
    ELSE
    BEGIN
        -- Si envían estado, filtramos por cliente y estado
        INSERT INTO @Resultado (IdReserva, FechaReserva, EstadoReserva)
        SELECT R.id_reserva, R.fecha_reserva, ER.nombre
        FROM lfcv.reserva R
        INNER JOIN lfcv.estado_reserva ER ON R.id_estado_reserva = ER.id_estado_reserva
        WHERE R.id_cliente = @IdCliente AND ER.nombre = @Estado;
    END
    
    RETURN;
END;
GO


-- Ejecutar 1: Sin mandar estado (Trae todas)
SELECT *, 
    GETDATE() as Fecha_Consulta, 
    lfcv.fn_NombreCompletoPersona(105) as Estudiante 
FROM lfcv.fn_MT_ConsultarReservasEstado(2, NULL);

-- Ejecutar 2: Mandando un estado específico
SELECT *, 
    GETDATE() as Fecha_Consulta, 
    lfcv.fn_NombreCompletoPersona(105) as Estudiante 
FROM lfcv.fn_MT_ConsultarReservasEstado(2, 'Completada');
GO