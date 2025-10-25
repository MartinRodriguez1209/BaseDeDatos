--1 Crear un Stored Procedure (Sp) que seleccione el nombre y la fecha nacimiento de la tabla ‘personas’
CREATE PROCEDURE sp_nombre_fechanac_personas AS BEGIN
SELECT
    P.nombre_persona,
    P.fecha_nacimiento
FROM
    personas AS P END EXECUTE sp_nombre_fechanac_personas
    --3 Crear los stored procedure básicos que permitan BORRAR, AGREGAR Y
    -- MODIFICAR los campos de una tabla con lenguaje DDL, indicando los parámetros
    -- necesarios, y en caso de que no se pueda realizar la consulta de edición, muestre un texto explicativo.
select
    *
from
    personas