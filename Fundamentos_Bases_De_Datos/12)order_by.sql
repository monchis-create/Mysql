-- comenence desde el video 32


-- Esta sentencia muestra todas las entradas de la tabla "posts" ordenadas de manera ascendente según la fecha de publicación.
SELECT *
FROM posts
ORDER BY fecha_de_publicacion ASC;



-- Esta sentencia muestra todas las entradas de la tabla "posts" ordenadas de manera decendente según la fecha de publicación.
SELECT *
FROM posts
ORDER BY fecha_de_publicacion DESC;



-- Esta sentencia muestra todas las entradas de la tabla "posts", ordenadas en orden alfabético ascendente según el título.
SELECT *
FROM posts
ORDER BY titulo ASC;


-- Esta sentencia muestra todas las entradas de la tabla "posts" ordenadas en orden alfabético descendente según el título
SELECT *
FROM posts
ORDER BY titulo DESC;



-- Esta consulta muestra las primeras cinco entradas de la tabla "posts", ordenadas en orden alfabético ascendente según el título.
SELECT *
FROM posts
ORDER BY titulo ASC
LIMIT 5;


-- Esta consulta muestra las primeras cinco entradas de la tabla "posts", ordenadas en orden alfabético descendente según el título.
SELECT *
FROM posts
ORDER BY titulo DESC
LIMIT 5;


