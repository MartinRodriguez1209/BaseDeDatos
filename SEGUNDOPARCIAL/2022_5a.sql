-- Armar una función que basándose en los parámetros de entrada @fecha, @especialidad,
-- devuelva la cantidad de turnos para esa fecha y especialidad.
CREATE FUNCTION fn_turnos_cantidad (@fecha DATE, @especialidad INT) returns int AS BEGIN declare @cantidad INT
SELECT
    @cantidad = COUNT(T.numero_turno)
FROM
    profesionales AS P
    INNER JOIN TURNOS AS T ON P.dni_profesional = T.dni_profesional
    INNER JOIN profesionales_especialidades AS PE ON PE.dni_profesional = P.dni_profesional
    AND T.codigo_especialidad = PE.codigo_especialidad
    INNER JOIN HORARIOS AS H ON H.codigo_dia_semana = T.codigo_dia_semana
    AND H.hora_desde = T.hora_desde
WHERE
    CONVERT(DATE, T.fecha_turno) = @fecha
    AND PE.codigo_especialidad = @especialidad;

return @cantidad
end