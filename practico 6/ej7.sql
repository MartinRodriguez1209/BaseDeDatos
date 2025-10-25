-- Crear un stored procedure que calcule el total de horas trabajadas para un
-- determinado profesional, realizando la sumatoria las horas/minutos para una
-- determinada fecha, y devolviendo un parámetro de entrada/salida llamado ‘@horas.
-- Tener en cuenta que el stored procedure debe tener dos parámetros de entrada
-- ‘@dni_profesional’ y ‘@fecha_consulta’
CREATE PROCEDURE sp_contar_horas_profesional (@dni int, @anio int, @mes int) as BEGIN
SELECT
    P.nombre_profesional,
    SUM(H.duracion)
FROM
    profesionales AS P
    INNER JOIN profesionales_especialidades AS PE ON P.dni_profesional = PE.dni_profesional
    INNER JOIN turnos AS T ON P.dni_profesional = T.dni_profesional
    INNER JOIN dias_semanales AS DS ON T.codigo_dia_semana = DS.codigo_dia_semana
    INNER JOIN horarios AS H ON T.hora_desde = H.hora_desde
    AND H.dni_profesional = P.dni_profesional
    AND H.codigo_dia_semana = DS.codigo_dia_semana
    AND H.codigo_especialidad = PE.codigo_especialidad
WHERE
    YEAR(T.fecha_turno) = @anio
    AND MONTH(T.fecha_turno) = @mes
    AND P.dni_profesional = @dni
GROUP BY
    P.nombre_profesional
end
SELECT
    P.nombre_profesional,
    SUM(H.duracion)
FROM
    profesionales AS P
    INNER JOIN turnos AS T ON P.dni_profesional = T.dni_profesional
    INNER JOIN horarios AS H ON T.hora_desde = H.hora_desde
WHERE
    YEAR(T.fecha_turno) = 2006
    AND MONTH(T.fecha_turno) = 05
    AND P.nombre_profesional = 'Gilberto'
GROUP BY
    P.nombre_profesional
SELECT
    *
FROM
    profesionales AS P
    INNER JOIN turnos AS T ON P.dni_profesional = T.dni_profesional
    INNER JOIN horarios AS H ON T.hora_desde = H.hora_desde
WHERE
    YEAR(T.fecha_turno) = 2006
    AND MONTH(T.fecha_turno) = 05
    AND P.nombre_profesional = 'Gilberto'
SELECT
    P.nombre_profesional,
    SUM(H.duracion)
FROM
    profesionales AS P
    INNER JOIN profesionales_especialidades AS PE ON P.dni_profesional = PE.dni_profesional
    INNER JOIN turnos AS T ON P.dni_profesional = T.dni_profesional
    INNER JOIN dias_semanales AS DS ON T.codigo_dia_semana = DS.codigo_dia_semana
    INNER JOIN horarios AS H ON T.hora_desde = H.hora_desde
    AND H.dni_profesional = P.dni_profesional
    AND H.codigo_dia_semana = DS.codigo_dia_semana
    AND H.codigo_especialidad = PE.codigo_especialidad
WHERE
    YEAR(T.fecha_turno) = 2006
    AND MONTH(T.fecha_turno) = 05
    AND P.nombre_profesional = 'Gilberto'
GROUP BY
    P.nombre_profesional