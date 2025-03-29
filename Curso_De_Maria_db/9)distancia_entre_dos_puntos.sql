USE mi_garaje;


-- Esto se usa iniciando sesion en mi base de datos y no con el operador de entrada <

-- En la terminal no funciona si hay acentos igual funciona si no le pongo acento eso es lo que dice el profe de PLATZI.En workbeanch no hay problema con los acentos pero en la terminal si.





-- Para medir la distancia en google maps doy clic derecho encima del punto en el que quiero estar y despues selecciono medir la distancia y despues hago clic en el otro punto en el que quiero medir la distancia y listo me da la listancia entre los dos puntos.Y para quitar la medicion hago clic en el segundo punto que hice clic para quitar la linea del mapa. o aplasto la x en el rectangulo donde esta la medida.


-- En mi tabla de clientes tengo guardados mis puntos geograficos por eso no debo usar datos quemados osea que ya estan o ya existen para buscarlo debo usar consultas anidadas. 


-- Esto es para calcular la distancia entre dos puntos pero esta forma no es la correcta de hacerlo.
-- Esto es para calcular en metros en metros. Esto no es lo correcto.
-- Se inicia secion con usuario y contraseña uso mi base de datos y de ahi pongo en la terminal todo esto.
SELECT 
ST_Distance_Sphere(
    POINT(-78.4924096,-0.2179171),
    POINT(-78.4883072 ,-0.2146885)
) AS distance;



-- Esto es para calcular la distancia entre dos puntos pero esta forma no es la correcta de hacerlo.
-- Esto es para calcularar en kilometros. Esto no es lo correcto.
-- Se inicia secion con usuario y contraseña uso mi base de datos y de ahi pongo en la terminal todo esto.
SELECT 
ST_Distance_Sphere(
    POINT(-78.4924096,-0.2179171),
    POINT(-78.4883072 ,-0.2146885)
) / 1000 AS distance;








-- es para calcular la distancia entre dos puntos pero de datos que tengo en mi base de datos mas no si quiero calcular distancia de otras ubicaciones que no existen en mi base de datos.
-- esta es la consulta de que solo funciona si tengo registrados en mi base de datos las ubicaciones 











-- En la terminal no funciona si hay acentos igual funaciona si no le pongo acento eso es lo que dice el profe de PLATZI.
-- Como no tengo el nombre de la estacion el location debo hacer un INNER JOIN , entonces la junto con la tabla station.
-- Esto el lo correcto de hacer consultas anidadas sin el point. Este es el ejemplo del profe de platzi
-- Se inicia secion con usuario y contraseña ,uso mi base de datos y despues va esta consultota en la terminal.
-- SELECT
-- ST_Distance_Sphere(
--     (
--         SELECT `locations`.`locations`
--         FROM `locations`
--         INNER JOIN `stations`
--         ON `station`.`id` = `locations`.`station_id`
--         WHERE `stations`.`name` = "Balderas"
--     ),
--     (
--         SELECT `locations`.`locations`
--         FROM `locations`
--         INNER JOIN `stations`
--         ON `station`.`id` = `locations`.`station_id`
--         WHERE `stations`.`name` = "Pino Suares"
--     )
-- ) / 1000 AS distance;



-- Funciona tanto por el id como por registroDelPrimerAbono.
-- -- Se inicia secion con usuario y contraseña ,uso mi base de datos y despues va esta consultota en la terminal.
-- -- Esto el lo correcto de hacer consultas anidadas sin el point
-- SELECT
-- ST_Distance_Sphere(
--     (
--         SELECT `clientes`.`direccion`
--         FROM `clientes`
--         WHERE `clientes`.`registroDelPrimerAbono` = "2023-12-28 18:06:08"
--         LIMIT 1  -- Limitar la subconsulta a un resultado
--     ),
--     (
--         SELECT `clientes`.`direccion`
--         FROM `clientes`
--         WHERE `clientes`.`registroDelPrimerAbono` = "2023-12-28 18:06:08"
--         ORDER BY id DESC
--         LIMIT 1  -- Limitar la subconsulta a un resultado
--     )
-- ) / 1000 AS distance;





-- Funciona tanto por el id como por registroDelPrimerAbono.
-- Se inicia secion con usuario y contraseña ,uso mi base de datos y despues va esta consultota en la terminal.
-- Esto es en kilometros.
-- Esto el lo correcto de hacer consultas anidadas sin el point
SELECT
ST_Distance_Sphere(
    (
        SELECT `clientes`.`direccion`
        FROM `clientes`
        WHERE `clientes`.`id` = 1 
        LIMIT 1  -- Limitar la subconsulta a un resultado
    ),
    (
        SELECT `clientes`.`direccion`
        FROM `clientes`
        WHERE `clientes`.`id` = 2
        ORDER BY id DESC
        LIMIT 1  -- Limitar la subconsulta a un resultado
    )
) / 1000 AS kilometros;


-- Funciona tanto por el id como por registroDelPrimerAbono.
-- Se inicia secion con usuario y contraseña ,uso mi base de datos y despues va esta consultota en la terminal.
-- Esto es en metros
-- Esto el lo correcto de hacer consultas anidadas sin el point
SELECT
ST_Distance_Sphere(
    (
        SELECT `clientes`.`direccion`
        FROM `clientes`
        WHERE `clientes`.`id` = 1 
        LIMIT 1  -- Limitar la subconsulta a un resultado
    ),
    (
        SELECT `clientes`.`direccion`
        FROM `clientes`
        WHERE `clientes`.`id` = 2
        ORDER BY id DESC
        LIMIT 1  -- Limitar la subconsulta a un resultado
    )
) AS metros;

