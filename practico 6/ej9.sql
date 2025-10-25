--  Definir una función que calcule la edad de una persona, sin utilizar la función DATEDIFF.
CREATE FUNCTION f_calcular_edad_pro (@dni int) RETURNS INT AS BEGIN DECLARE @edad int;

SELECT
    @edad = (YEAR(GETDATE()) - YEAR(P.fecha_nacimiento)) - CASE
        WHEN MONTH(GETDATE()) < MONTH(P.fecha_nacimiento)
        OR (
            MONTH(GETDATE()) = MONTH(P.fecha_nacimiento)
            AND DAY(GETDATE()) < DAY(P.fecha_nacimiento)
        ) THEN 1
        ELSE 0
    END
FROM
    personas AS P
WHERE
    P.dni_persona = @dni;

RETURN @edad
END;