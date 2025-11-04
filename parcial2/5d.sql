-- d) Armar una función basándose en los parámetros de entrada @dni, @genero, y devuelva la
-- edad de la persona según el género
CREATE FUNCTION fn_rodriguez_diaz_martin_5d_edadsegundnigenero (@dni INT, @genero VARCHAR(30)) RETURNS INT AS BEGIN DECLARE @edad INT DECLARE @fecha_nacimiento DATE
SELECT
    @fecha_nacimiento = P.fecha_nacimiento
FROM
    personas AS P
WHERE
    P.dni_persona = @dni
    AND P.genero_persona = @genero
SELECT
    @edad = DATEDIFF(YEAR, @fecha_nacimiento, GETDATE()) - CASE
        WHEN (MONTH(@fecha_nacimiento) > MONTH(GETDATE()))
        OR (
            MONTH(@fecha_nacimiento) = MONTH(GETDATE())
            AND DAY(@fecha_nacimiento) > DAY(GETDATE())
        ) THEN 1
        ELSE 0
    END RETURN @edad
END