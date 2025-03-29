-- Comenze desde el video 32 de platzi de fundamentos a las bases de datos.


-- right es derecha.
-- left es izquierda.



-- Explicame lo que es left join y right join en pocas palabras
-- ChatGPT
-- Claro, aquí tienes:

-- left es izquierda.
-- Cuando esta con el from es izquierda , FROM ingresos
-- LEFT JOIN: Devuelve todos los registros de la tabla de la izquierda (la primera tabla mencionada en la consulta) y los registros coincidentes de la tabla de la derecha (la segunda tabla mencionada en la consulta). Si no hay coincidencias en la tabla de la derecha, los campos correspondientes serán NULL.

-- right es derecha.
-- Cuando esta con el JOIN es derecha
-- RIGHT JOIN: Es similar al LEFT JOIN pero al revés. Devuelve todos los registros de la tabla de la derecha y los registros coincidentes de la tabla de la izquierda. Si no hay coincidencias en la tabla de la izquierda, los campos correspondientes serán NULL.

-- User
-- SELECT *
-- FROM ingresos
-- 	RIGHT JOIN clientes ON ingresos.id = clientes.id
-- cual es la tabla de la derecha. solo responde eso nada mas y no me des explicaciones
-- ChatGPT
-- La tabla de la derecha en esta consulta es "clientes".

-- User
-- SELECT *
-- FROM ingresos
-- 	LEFT JOIN clientes ON ingresos.id = clientes.id
-- Y AQUI CUAL es la tabla de la izquierda. solo responde eso nada mas
-- ChatGPT
-- La tabla de la izquierda en esta consulta es "ingresos".

-- User
-- osea cuando es left osea izquierda es siempre la tabla que esta en el FROM y cuando es right osea derecha es siempre  la que esta con el JOIN sierto. contestame si o no punto nada mas 
-- ChatGPT
-- Sí.

















-- Me trae todos los datos de la tabla A esten o no esten en la tabla B 
-- LEFT es izquierda
SELECT *
FROM usuarios
    LEFT JOIN posts ON usuarios.id = posts.usuarios_id;


-- Me trae todo lo que esta en la tabla A ,osea me excluye su interseccion 
SELECT *
FROM usuarios
    LEFT JOIN posts ON usuarios.id = posts.usuarios_id
WHERE posts.usuarios_id IS NULL; -- Me trae todos los usuarios que solo tengan el valor nulo


--------------------------------------------------------------------------------------------------------


-- Me trae todos los datos de la tabla B esten o no esten en la tabla A
-- LEFT es izquierda
SELECT *
FROM usuarios
    RIGHT JOIN posts ON usuarios.id = posts.usuarios_id;


-- Me trae todo lo que esta en la tabla B ,osea me excluye su interseccion 
SELECT *
FROM usuarios
    RIGHT JOIN posts ON usuarios.id = posts.usuarios_id
WHERE posts.usuarios_id IS NULL; -- Me trae todos los usuarios que solo tengan el valor nulo


-------------------------------------------------------------------------------------------------------

-- El INNER JOIN muestra registros que tengan coincidencia en ambas tablas
SELECT *
FROM usuarios
    INNER JOIN posts ON usuarios.id = posts.usuarios_id;


--------------------------------------------------------------------------------------------------------



-- Muestra abasolutamente las dos tablas tanto la tabla A como la tabla B
-- Pero el FULL OUTER JOIN no funciona para todas las bases de datos no es estandar, abajo te dejo lo que si funciona para mi base de datos de My SQL Workbeanch.
SELECT *
FROM usuarios
    FULL OUTER JOIN posts ON usuarios.id = posts.usuarios_id;






-- Este si es estandar para unir las dos tablas completas, tanto la tabla A como la tabla B.
SELECT *
FROM usuarios
    LEFT JOIN posts ON usuarios.id = posts.usuarios_id
UNION
SELECT *
FROM usuarios
    RIGHT JOIN posts ON usuarios.id = posts.usuarios_id;


----------------------------------------------------------------------------------------------------------




-- Esta consulta selecciona todos los usuarios que no tienen publicaciones y todas las publicaciones que no tienen usuarios asociados.
-- Me trae lo que esta en un lado pero no en el otro de cada lado, es lo contrario al INNER JOIN.
SELECT *
FROM usuarios
    LEFT JOIN posts ON usuarios.id = posts.usuarios_id
WHERE posts.usuarios_id IS NULL; -- Me trae todos los usuarios que solo tengan el valor nulo
UNION
SELECT *
FROM usuarios
    RIGHT JOIN posts ON usuarios.id = posts.usuarios_id;
WHERE posts.usuarios_id IS NULL; -- Me trae todos los usuarios que solo tengan el valor nulo







-- si le pongo NOT NULL en el where no me marca error mientras que si pongo NULL en las clausula Where de las en las dos si me va a dar error.
-- SELECT *
-- FROM ingresos
-- 	RIGHT JOIN clientes ON ingresos.id = clientes.id
-- WHERE clientes.id IS NULL
-- UNION
-- SELECT *
-- FROM ingresos
-- 	LEFT JOIN clientes ON ingresos.id = clientes.id
-- WHERE ingresos.id IS NULL;
-- esto me va a marcar error porque el la clausula where de right y left no existe informacion para mostrar del lado de ninguna de las dos tablas sierto ??? 

-- ChatGPT
-- Exacto. La consulta podría dar lugar a un error porque las condiciones en las cláusulas WHERE podrían ser mutuamente excluyentes. Cuando realizas un RIGHT JOIN, la condición WHERE clientes.id IS NULL filtra los registros donde no hay coincidencia en la tabla "clientes", lo que significa que solo se devolverán las filas de la tabla "ingresos" que no tienen una coincidencia en la tabla "clientes". Del mismo modo, cuando realizas un LEFT JOIN, la condición WHERE ingresos.id IS NULL filtra los registros donde no hay coincidencia en la tabla "ingresos", lo que significa que solo se devolverán las filas de la tabla "clientes" que no tienen una coincidencia en la tabla "ingresos".

-- Dado que estás utilizando un UNION entre las dos consultas, los resultados de ambas partes se combinan. Sin embargo, debido a las condiciones de filtrado en las cláusulas WHERE, es posible que una de las partes de la consulta no devuelva ningún resultado. Esto puede provocar un error o un conjunto de resultados inesperado.

-- Para evitar esto, es recomendable revisar las condiciones de filtrado y asegurarse de que ambas partes de la consulta produzcan resultados válidos o reestructurar la consulta según sea necesario para obtener el resultado deseado.