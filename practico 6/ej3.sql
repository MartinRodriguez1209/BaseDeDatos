--3 Crear los stored procedure básicos que permitan BORRAR, AGREGAR Y
-- MODIFICAR los campos de una tabla con lenguaje DDL, indicando los parámetros
-- necesarios, y en caso de que no se pueda realizar la consulta de edición, muestre un texto explicativo.


CREATE PROCEDURE sp_borrar_por_dni_persona
 (@dni INT)
AS
BEGIN
    DELETE FROM personas WHERE PERSONAS.dni_persona = @dni
END

    EXECUTE sp_borrar_por_dni_persona 18207437