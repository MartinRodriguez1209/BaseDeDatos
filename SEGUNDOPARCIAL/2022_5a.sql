-- Armar una función que basándose en los parámetros de entrada @fecha, @especialidad,
-- devuelva la cantidad de turnos para esa fecha y especialidad.
CREATE FUNCTION fn_turnos_cantidad2 (@fecha DATE, @especialidad INT) returns int AS BEGIN declare @cantidad INT
SELECT
    @cantidad = COUNT(T.numero_turno)
FROM
    turnos AS T
WHERE
    CONVERT(DATE, T.fecha_turno) = @fecha return @cantidad
end