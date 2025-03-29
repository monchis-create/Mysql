-- video 32 comenze


-- Min te da la fecha mas antigua
SELECT MIN(fecha) AS min
FROM ingresos;

-- Max te da la fecha de hoy, la fecha mas reciente
SELECT max(fecha) AS max
FROM ingresos;



-- esto se utiliza cuando tengo la fecha y hora juntas y quiero que solo me amuestre el año.
SELECT YEAR(MIN(primerRegistro))
FROM ingresos;


-- esto se utiliza cuando tengo la fecha y hora juntas y quiero que solo me amuestre la fecha
SELECT DATE(MIN(primerRegistro))
FROM ingresos;

-- Esto es para que me muestre solo la hora cuando tengo la fecha y hora juntas.
SELECT TIME(MAX(primerRegistro))
FROM ingresos;



-- La función DATE en SQL se utiliza para extraer solo la parte de fecha de un valor de fecha y hora. Cuando se aplica a una expresión como "MIN(fecha_de_publicacion)", donde "MIN" devuelve la fecha más antigua entre todas las fechas de publicación, "DATE(MIN(fecha_de_publicacion))" devolverá únicamente la fecha más antigua, sin incluir la hora del día.

-- Entonces, "DATE" está simplemente asegurando que solo se extraiga la parte de fecha de la expresión "MIN(fecha_de_publicacion)". Esto es útil si solo estás interesado en la fecha y no en la hora en tus resultados.
-- si quiero que mi query escale no lo haga de esta manera.
SELECT new_table_projection.fecha, COUNT(*) AS post_count
FROM (
    SELECT DATE(MIN(fecha_de_publicacion)) AS fecha, YEAR(fecha_de_publicacion) AS post_year
    FROM posts
    GROUP BY post_year
) AS new_table_projection
GROUP BY new_table_projection.fecha
ORDER BY new_table_projection.fecha;









-- Esto es lo mismo que lo de abajo que la siguiente sentencia, pero esta no es anidada y la otra si.
-- La consulta selecciona todas las columnas de la tabla "posts" donde la fecha de publicación es igual a '2025-04-05'.
SELECT *
FROM posts
WHERE fecha_de_publicacion = '2025-04-05';


-- si quiero que mi query escale no lo haga de esta manera
-- La consulta selecciona todas las columnas de la tabla "posts" donde la fecha de publicación es igual a la fecha más reciente registrada en la misma tabla
SELECT *
FROM posts
WHERE fecha_de_publicacion = (
    SELECT MAX(fecha_de_publicacion)
    FROM posts
);
