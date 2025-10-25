-- 4  Crear un stored procedure que liste todos los horarios de los profesionales masculinos por especialidad.
SELECT
    P.nombre_profesional,
    h.hora_desde,
    E.descripcion_especialidad
FROM
    profesionales AS P
    INNER JOIN profesionales_especialidades AS PE ON P.dni_profesional = PE.dni_profesional
    INNER JOIN especialidades AS E ON PE.codigo_especialidad = E.codigo_especialidad
    INNER JOIN generos_sexuales AS G ON P.genero_profesional = G.genero_sexual
    INNER JOIN horarios AS H ON P.dni_profesional = H.dni_profesional
WHERE
    G.genero_sexual = 'Masculino'
ORDER BY
    H.hora_desde