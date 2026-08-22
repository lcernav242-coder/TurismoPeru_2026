CREATE OR ALTER VIEW esquema.nombre_vista
AS
SELECT
columna1,
columna2,
columna3
FROM esquema.tabla_particion_1
UNION ALL
SELECT
columna1,
columna2,
columna3
FROM esquema.tabla_particion_2
UNION ALL
SELECT
columna1,
columna2,
columna3
FROM esquema.tabla_particion_3;
GO


--SE DIVIDE EN TRES PARTICIONES

--PRIMERA PARTICION: ENEREO A ABRIL 2026
CREATE TABLE LFCV.reserva_2026_ene_abr
(
id_reserva INT NOT NULL,
codigo_reserva VARCHAR(20) NOT NULL,
id_cliente INT NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_fin DATE NOT NULL,
numero_personas INT NOT NULL,
precio_total DECIMAL(10,2) NOT NULL,
id_estado_reserva INT NOT NULL,
CONSTRAINT PK_reserva_2026_ene_abr
PRIMARY KEY (id_reserva),
CONSTRAINT CK_reserva_2026_ene_abr_fecha
CHECK (
fecha_inicio >= '20260101'
AND fecha_inicio < '20260501'
)
);
GO

-- Segunda partición: mayo a agosto de 2026
CREATE TABLE LFCV.reserva_2026_may_ago
(
id_reserva INT NOT NULL,
codigo_reserva VARCHAR(20) NOT NULL,
id_cliente INT NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_fin DATE NOT NULL,
numero_personas INT NOT NULL,
precio_total DECIMAL(10,2) NOT NULL,
id_estado_reserva INT NOT NULL,
CONSTRAINT PK_reserva_2026_may_ago
PRIMARY KEY (id_reserva),
CONSTRAINT CK_reserva_2026_may_ago_fecha
CHECK (
fecha_inicio >= '20260501'
AND fecha_inicio < '20260901'
)
);
GO

-- Tercera partición: septiembre a diciembre de 2026
CREATE TABLE LFCV.reserva_2026_sep_dic
(
id_reserva INT NOT NULL,
codigo_reserva VARCHAR(20) NOT NULL,
id_cliente INT NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_fin DATE NOT NULL,
numero_personas INT NOT NULL,
precio_total DECIMAL(10,2) NOT NULL,
id_estado_reserva INT NOT NULL,
CONSTRAINT PK_reserva_2026_sep_dic
PRIMARY KEY (id_reserva),
CONSTRAINT CK_reserva_2026_sep_dic_fecha
CHECK (
fecha_inicio >= '20260901'
AND fecha_inicio < '20270101'
)
);
GO

-- Llenar las particiones con los datos existentes de la tabla original
-- 1. Llenar la primera partición (Enero - Abril)
INSERT INTO LFCV.reserva_2026_ene_abr
SELECT id_reserva, codigo_reserva, id_cliente, fecha_inicio, fecha_fin, numero_personas, precio_total, id_estado_reserva
FROM LFCV.reserva
WHERE fecha_inicio >= '20260101' AND fecha_inicio < '20260501';

-- 2. Llenar la segunda partición (Mayo - Agosto)
INSERT INTO LFCV.reserva_2026_may_ago
SELECT id_reserva, codigo_reserva, id_cliente, fecha_inicio, fecha_fin, numero_personas, precio_total, id_estado_reserva
FROM LFCV.reserva
WHERE fecha_inicio >= '20260501' AND fecha_inicio < '20260901';

-- 3. Llenar la tercera partición (Septiembre - Diciembre)
INSERT INTO LFCV.reserva_2026_sep_dic
SELECT id_reserva, codigo_reserva, id_cliente, fecha_inicio, fecha_fin, numero_personas, precio_total, id_estado_reserva
FROM LFCV.reserva
WHERE fecha_inicio >= '20260901' AND fecha_inicio < '20270101';
GO