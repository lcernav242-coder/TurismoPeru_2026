USE TURISMOPERU_LFCV;
GO

-- Creación de la Vista Particionada
CREATE OR ALTER VIEW LFCV.vw_ReservasParticionadas2026
AS
SELECT
    id_reserva,
    codigo_reserva,
    id_cliente,
    fecha_inicio,
    fecha_fin,
    numero_personas,
    precio_total,
    id_estado_reserva
FROM LFCV.reserva_2026_ene_abr

UNION ALL

SELECT
    id_reserva,
    codigo_reserva,
    id_cliente,
    fecha_inicio,
    fecha_fin,
    numero_personas,
    precio_total,
    id_estado_reserva
FROM LFCV.reserva_2026_may_ago

UNION ALL

SELECT
    id_reserva,
    codigo_reserva,
    id_cliente,
    fecha_inicio,
    fecha_fin,
    numero_personas,
    precio_total,
    id_estado_reserva
FROM LFCV.reserva_2026_sep_dic;
GO

SELECT *,
    GETDATE() AS FechaConsulta,
    LFCV.fn_NombreCompletoPersona(105) AS Estudiante
FROM LFCV.vw_ReservasParticionadas2026
ORDER BY fecha_inicio;
GO