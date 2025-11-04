-- Listar los profesionales que poseen especialidades sin días para atención
SELECT
    P.nombre_profesional,
    P.dni_profesional,
    E.descripcion_especialidad
FROM
    profesionales AS P
    INNER JOIN profesionales_especialidades AS PE ON P.dni_profesional = PE.dni_profesional
    INNER JOIN especialidades AS E ON PE.codigo_especialidad = E.codigo_especialidad
    LEFT JOIN profesionalidades_especialidades_dias_semanales AS PED ON P.dni_profesional = PED.dni_profesional
    AND PED.codigo_especialidad = PE.codigo_especialidad
WHERE
    PED.dni_profesional IS NULL