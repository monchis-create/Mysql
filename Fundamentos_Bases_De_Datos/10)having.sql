-- comence en el video 32


-- cuando hago una seleccion de columnas lo hago con WHERE, Pero si quiero hacer una seleccion de unas columnas agrupadas lo hago con HAVING.

-- Esta consulta cuenta la cantidad de publicaciones por mes y estado (estatus), mostrando el nombre del mes extraído de la fecha de publicación. Luego, filtra los resultados para mostrar solo aquellos con más de una publicación, ordenados por mes.
SELECT MONTHNAME(fecha_de_publicacion) AS post_month, estatus, COUNT(*) AS post_quanty
FROM posts
GROUP BY estatus,post_month
HAVING post_quanty > 1
ORDER BY post_month;




-- ESTO ESTA MAL NO LO HAGAS LO PUSE PARA TENERLO EN CLARO (cuando se agrupa no se usa el WHERE).
-- La sentencia está incorrecta debido a que el alias "post_quanty" usado en la cláusula WHERE no se puede utilizar directamente; en su lugar, debería emplearse la función de agregación COUNT en la cláusula HAVING para filtrar el resultado basado en la cantidad de publicaciones.
SELECT MONTHNAME(fecha_de_publicacion) AS post_month, estatus, COUNT(*) AS post_quanty
FROM posts
WHERE post_quanty > 1
GROUP BY estatus,post_month
ORDER BY post_month;




-- ESTO ESTA MAL NO LO HAGAS LO PUSE PARA TENERLO EN CLARO (having en posicion equivocada).
-- La sentencia está incorrecta porque el alias "post_quanty" utilizado en la cláusula HAVING no puede ser usado directamente; se necesita usar la función de agregación COUNT() en la cláusula HAVING antes del order by  para filtrar el resultado basado en la cantidad de publicaciones.
SELECT MONTHNAME(fecha_de_publicacion) AS post_month, estatus, COUNT(*) AS post_quanty
FROM posts
GROUP BY estatus,post_month
ORDER BY post_month
HAVING post_quanty > 1;









-- Para contar cuántas veces se repiten los valores en una columna específica de tu tabla ingresos, puedes usar la consulta SQL con GROUP BY y COUNT. Aquí tienes un ejemplo básico:
SELECT categoria, COUNT(*) AS cantidad
FROM ingresos
GROUP BY categoria
ORDER BY cantidad DESC;
