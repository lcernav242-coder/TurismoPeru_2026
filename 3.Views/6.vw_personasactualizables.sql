CREATE OR ALTER VIEW LFCV.vw_PersonasActualizables
AS
SELECT
id_persona,
nombres,
apaterno,
amaterno,
telefono,
email,
estado
FROM lfcv.persona;
GO


SELECT *
FROM lfcv.vw_PersonasActualizables
WHERE id_persona = 105;

--
BEGIN TRANSACTION;
-- Actualización temporal mediante la vista.
UPDATE lfcv.vw_PersonasActualizables
SET telefono = '999999999'
WHERE id_persona = 105;
-- Debe mostrar 999999999.
SELECT
'Durante la prueba' AS Momento,
*
FROM lfcv.vw_PersonasActualizables
WHERE id_persona = 105;
-- Deshacer la actualización.
ROLLBACK TRANSACTION;
-- Debe volver a mostrar tu número original.
SELECT
'Despues del rollback' AS Momento,
*
FROM lfcv.vw_PersonasActualizables
WHERE id_persona = 105;