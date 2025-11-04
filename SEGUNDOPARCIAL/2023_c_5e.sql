-- e  Crear un stored procedure que liste para un determinado período (@fecha_desde,
--    @fecha_hasta) la relación de cantidad de turnos del profesional en dicho periodo, con
--    respecto al total de turnos de ese profesional. Formato de salida (Profesional, Cantidad
--    Turnos En Periodo, Cantidad Turnos Total, Porcentaje)
CREATE FUNCTION fn_turnos_pro_dni (@dni INT) RETURNS INT AS BEGIN declare @cantidad INT
SELECT
    @cantidad = COUNT(T.numero_turno)
FROM
    TURNOS AS T
    INNER JOIN profesionales AS P ON T.dni_profesional = P.dni_profesional
WHERE
    P.dni_profesional = @dni RETURN @cantidad
END
GO
    CREATE PROCEDURE sp_turnos_periodo (@fecha_desde DATE, @fecha_hasta DATE, @dni INT) AS BEGIN DECLARE @turnos_periodo INT,
    @nombre_pro VARCHAR(100)
SELECT
    @turnos_periodo = COUNT(T.numero_turno)
FROM
    TURNOS AS T
    INNER JOIN profesionales AS P ON T.dni_profesional = P.dni_profesional
WHERE
    P.dni_profesional = @dni
    and T.fecha_turno BETWEEN @fecha_desde
    and @fecha_hasta
SELECT
    @nombre_pro = P.nombre_profesional
FROM
    profesionales AS P
WHERE
    P.dni_profesional = @dni
select
    @nombre_pro,
    @turnos_periodo AS TURNOS_PERIODO,
    dbo.fn_turnos_pro_dni(@dni) AS TURNOS_TOTAL,
    (
        CAST(@turnos_periodo AS DECIMAL(10, 2)) / dbo.fn_turnos_pro_dni(@dni)
    ) * 100.0 AS PORCENTAJE
END EXEC sp_turnos_periodo '2005-01-01 07:54:56.100',
'2010-07-03 02:42:08.120',
73829099