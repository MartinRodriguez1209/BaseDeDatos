-- Crear un stored procedure que liste para un mes determinado (AAAAMM), la cantidad de
-- turnos por persona
CREATE PROCEDURE turnos_mes (@mes INT) AS BEGIN
SELECT
    FORMAT(T.fecha_turno, 'yyyyMM'),
    COUNT(T.numero_turno) AS CANTIDAD
FROM
    TURNOS AS T
WHERE
    MONTH(T.fecha_turno) = @mes
GROUP BY
    FORMAT(T.fecha_turno, 'yyyyMM')
END
SELECT
    FORMAT(T.fecha_turno, 'yyyyMM'),
    COUNT(T.numero_turno) AS CANTIDAD
FROM
    TURNOS AS T
WHERE
    YEAR(T.fecha_turno) = 2005
    AND MONTH(T.fecha_turno) = 10
GROUP BY
    FORMAT(T.fecha_turno, 'yyyyMM')