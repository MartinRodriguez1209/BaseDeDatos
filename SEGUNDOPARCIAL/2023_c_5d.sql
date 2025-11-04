-- d Armar una función que basándose en el parámetro de entrada @dni_profesional, devuelva
--   la cantidad de turnos del profesional.
CREATE FUNCTION fn_turnos_pro_dni (@dni INT) RETURNS INT AS BEGIN declare @cantidad INT
SELECT
    @cantidad = COUNT(T.numero_turno)
FROM
    TURNOS AS T
    INNER JOIN profesionales AS P ON T.dni_profesional = P.dni_profesional
WHERE
    P.dni_profesional = @dni RETURN @cantidad
END