-- video 32

-- La consulta cuenta el número de etiquetas por título de publicación, mostrando el resultado ordenado por cantidad de etiquetas de forma descendente.
SELECT posts.titulo, COUNT(*)num_etiquetas
FROM posts
    INNER JOIN posts_etiqueta ON posts.id = posts_etiquetas.post_id
    INNER JOIN etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
GROUP BY posts.id
ORDER BY num_etiquetas DESC;




-- La función GROUP_CONCAT se usa para unir (o combinar) varios valores de una columna en una sola cadena de texto. Por ejemplo, si tienes múltiples filas con nombres (como "Juan", "María", "Pedro"), GROUP_CONCAT te permitirá combinar esos nombres en una única cadena, como "Juan, María, Pedro".
SELECT posts.titulo, GROUP_CONCAT(nombre_etiqueta)
FROM posts
    INNER JOIN posts_etiqueta ON posts.id = posts_etiquetas.post_id
    INNER JOIN etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
GROUP BY posts.id;




-- Esta consulta busca todas las filas de la tabla "etiquetas" que no tienen correspondencia en la tabla "posts_etiquetas" a través de la columna "etiqueta_id".
SELECT *
FROM etiquetas
    LEFT JOIN posts_etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
WHERE posts_etiquetas.etiqueta_id IS NULL;




-- Esta consulta muestra el nombre de cada categoría y la cantidad de publicaciones asociadas a cada una, ordenadas de manera descendente por la cantidad de publicaciones
SELECT c.nombre_categoria, COUNT(*) AS cant_posts
FROM categoria AS c
    INNER JOIN posts AS p ON c.id = p.categoria_id
GROUP BY c.id
ORDER BY cant_posts DESC;




-- Esta consulta devuelve el nombre de la categoría con la mayor cantidad de publicaciones y muestra la cantidad de publicaciones asociadas a esa categoría, limitando los resultados a una sola fila, que es la categoría con el mayor número de publicaciones.
SELECT c.nombre_categoria, COUNT(*) AS cant_posts
FROM categoria AS c
    INNER JOIN posts AS p ON c.id = p.categoria_id
GROUP BY c.id
ORDER BY cant_posts DESC
LIMIT 1;





-- Esta consulta muestra el apodo (nickname) de cada usuario junto con la cantidad de publicaciones que han realizado, ordenadas de manera descendente por la cantidad de publicaciones de cada usuario.
SELECT u.nickname, COUNT(*)cant_posts
FROM usuarios AS u 
    INNER JOIN posts AS p ON u.id = p.usuario_id
GROUP BY u.id
ORDER BY cant_posts DESC;




-- nombre_categoria sale de la tabla categoria
-- La función GROUP_CONCAT en esta consulta específica concatena los nombres de las categorías asociadas a las publicaciones de cada usuario en una sola cadena de texto. Por ejemplo, si un usuario ha publicado en múltiples categorías (por ejemplo, "Tecnología", "Deportes"), GROUP_CONCAT agrupará y mostrará esos nombres de categorías en una cadena de texto, separados por comas (por ejemplo, "Tecnología, Deportes").
SELECT u.nickname, COUNT(*)cant_posts, GROUP_CONCAT(nombre_categoria)
FROM usuarios AS u 
    INNER JOIN posts AS p ON u.id = p.usuario_id
    INNER JOIN categoria AS c ON c.id = p.categoria_id
GROUP BY u.id
ORDER BY cant_posts DESC;




SELECT *
FROM usuarios AS u
    LEFT JOIN posts ON u.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;