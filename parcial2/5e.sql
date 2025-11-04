-- Crear un stored procedure que liste por mes en formato (AAAAMM), la cantidad de turnos
-- de mujeres cuya edad esté entre 40 y 45 años
CREATE PROCEDURE sp_rodriguez_diaz_martin_5e_cantidadturnosmujeresentre40y45 AS BEGIN
SELECT
    FORMAT(T.fecha_turno, 'yyyyMM') FECHA_AAAAMM,
    COUNT(T.numero_turno) as CANTIDADTURNOS
FROM
    TURNOS AS T
    INNER JOIN personas AS P ON T.dni_persona = P.dni_persona
WHERE
    P.genero_persona = 'Femenino'
    AND dbo.fn_rodriguez_diaz_martin_5d_edadsegundnigenero(P.dni_persona, P.genero_persona) BETWEEN 40
    AND 45
GROUP BY
    FORMAT(T.fecha_turno, 'yyyyMM')
ORDER BY
    FECHA_AAAAMM
END