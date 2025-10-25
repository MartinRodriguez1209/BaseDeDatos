--5  Crear un stored procedure que dado un parámetro de entrada ‘@dni_persona’ seleccione los turnos de dicha persona para la especialidad ‘Infectologia’.
CREATE PROCEDURE sp_turnos_infecto_pordni (@dni INT) as BEGIN
SELECT
    *
FROM
    PERSONAS AS P
    INNER JOIN TURNOS AS T ON P.dni_persona = T.dni_persona
    INNER JOIN especialidades AS E ON T.codigo_especialidad = E.codigo_especialidad
WHERE
    @dni = p.dni_persona
    and e.descripcion_especialidad = 'Infectologia'
END;

exec sp_turnos_infecto_pordni 19115808
select
    *
from
    personas as p
    inner join turnos as t on p.dni_persona = t.dni_persona
    inner join especialidades as e on t.codigo_especialidad = e.codigo_especialidad
where
    e.descripcion_especialidad = 'Infectologia';