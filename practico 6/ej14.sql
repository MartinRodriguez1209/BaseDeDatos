-- Crear un stored procedure que para dado un profesional determinado se pueda
-- seleccionar todos sus turnos realizados, y utilizando el procedimiento del ejercicio 6 se
-- puedan calcular las horas trabajadas por día.
CREATE PROCEDURE sp_contar_todos_turnos (@dni int) as BEGIN
END;

SELECT
    P.nombre_profesional,
    T.fecha_turno
FROM
    profesionales as P
    INNER JOIN profesionales_especialidades AS PE ON P.dni_profesional = PE.dni_profesional
    INNER JOIN horarios AS H ON P.dni_profesional = H.dni_profesional
    AND H.codigo_especialidad = PE.codigo_especialidad
    INNER JOIN turnos AS T ON P.dni_profesional = T.dni_profesional
    AND T.codigo_especialidad = PE.codigo_especialidad
    AND T.hora_desde = H.hora_desde
    AND T.codigo_dia_semana = H.codigo_dia_semana
WHERE
    P.dni_profesional = 77063940