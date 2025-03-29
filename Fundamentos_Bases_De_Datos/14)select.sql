

-- Comence desde el video 32 de fundamentos de bases de datos en platzi.





-- osea la posicion de having no importa siempre y cuando este despues de group by ???
-- Mostrar versiones

-- Sí, la posición de HAVING no importa, siempre y cuando esté inmediatamente después de la cláusula GROUP BY.

-- En la mayoría de los casos, colocar HAVING al final de la consulta es una buena práctica, ya que facilita la lectura y el mantenimiento del código.

-- Aquí hay algunos ejemplos:

-- Ejemplo 1:

-- SQL
-- SELECT city, COUNT(*) AS total
-- FROM people
-- GROUP BY city
-- HAVING total >= 2
-- ORDER BY total DESC;
-- Usa el código con precaución.
-- Ejemplo 2:



-- Esta mal porque order by va al final.
-- SQL
-- SELECT city, COUNT(*) AS total
-- FROM people
-- GROUP BY city
-- ORDER BY total DESC
-- HAVING total >= 2;
-- Usa el código con precaución.
-- Ambos ejemplos son válidos y devolverán el mismo resultado. La única diferencia es que el primer ejemplo es más conciso, mientras que el segundo ejemplo es más explícito.

-- En resumen:

-- HAVING debe ir inmediatamente después de GROUP BY.
-- En la mayoría de los casos, colocar HAVING al final de la consulta es una buena práctica.
-- La posición de HAVING no afecta al resultado de la consulta, siempre y cuando se coloque después de GROUP BY.
-- Espero que esta información te ayude a comprender mejor cómo funciona HAVING.






SELECT city, count(*) AS total
FROM people
WHERE active = true
GROUP BY city
ORDER BY total DESC
HAVING total >= 2;


SELECT *
FROM post
WHERE fecha_de_publicacion > '2024' ; --WHERE fecha_de_publicacion < '2024'; 



SELECT titulo,fecha_de_publicacion,estatus
FROM posts;

-- Esto es para hacer en conteo total de los ids que tengo en mi tabla.
SELECT count(*) AS numero_de_ids
FROM posts;



