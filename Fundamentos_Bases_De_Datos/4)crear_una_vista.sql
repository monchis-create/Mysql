


-- Esto es para borrar una vista.
DROP VIEW ingresos_gastos;

-- Esto es para ver una vista que yo cree
SELECT * FROM total_ingresos_gastos;



-- Esta sentencia SQL crea una vista llamada "v_brasil_customers", la cual contiene los nombres de cliente y nombres de contacto de la tabla "customers" donde el país es "Brasil". Esta vista proporciona una forma de acceder y visualizar fácilmente esta información específica sobre clientes de Brasil sin necesidad de repetir la consulta original.
CREATE VIEW v_brasil_customers AS 
    SELECT custormer_name,contact_name
    FROM customers
    WHERE country = "Brasil";






-- Una vista sirve para hacer una consulta que quieres hacerla varias veces ya no lo hagas porque va esta alli cuando la necesites, tambien sirve para ocultar informacion que no quieren que veas osea en select solo pones las columnas que quieres y las que no no lo pones para asi ocultarlo.
-- Ya no ejecutes esto que ya tengo mi vista.
CREATE VIEW total_ingresos_gastos AS 
SELECT SUM(ingresos) AS total_ingresos, SUM(gastos) AS total_gastos
FROM ingresos;




-- Ya no ejecutes esto que ya tengo mi vista.
CREATE VIEW vista_total_ingresos_gastos AS 
SELECT total_ingresos, total_gastos
FROM total_ingresos_gastos;




-- osea aqui esta dando los permisos de quien puede ver la vista.
-- La cláusula ALGORITHM = UNDEFINED en la creación de una vista indica que el motor de la base de datos seleccionará el algoritmo de procesamiento más adecuado automáticamente. Esto significa que el motor de la base de datos decidirá el método más eficiente para ejecutar la vista según las circunstancias, la estructura de la consulta y otros factores internos.
-- DEFINER = 'root'@'localhost' establece quién es el definer, es decir, el usuario que crea la vista. En este caso, la vista se crea con los permisos del usuario 'root' que se conecta desde el host 'localhost'.
-- SQL SECURITY DEFINER indica que la vista se ejecutará con los permisos del usuario definido (en este caso, 'root'@'localhost'). Esto significa que cualquier usuario que tenga permiso para acceder a la vista podrá hacerlo con los permisos del usuario definido ('root' en este caso), independientemente de sus propios permisos.
CREATE 
    ALGORITHM = UNDEFINED
    DEFINER = `root`@`localhost`
    SQL SECURITY DEFINER
VIEW `platzi_people` AS 
    SELECT
        `people`.`person_id` AS `person_id`,
        `people`.`last_name` AS `last_name`,
        `people`.`first_name` AS `first_name`,
        `people`.`adress` AS `adress`,
        `people`.`city` AS `city`
    FROM
        `people`







-- ESTO ES PARA CREAR UNA VISTA
-- si quiero visualizar todo lo de mi tabla absolutamente todas las columnas ejecuto esto
USE `platziblog`;
CREATE OR REPLACE VIEW `platzi_people` AS
SELECT * FROM platziblog.people;

-- pero si quiero ver , columnas en especifico ejecuto esto
CREATE 
    ALGORITHM = UNDEFINED
    DEFINER = `root`@`localhost`
    SQL SECURITY DEFINER
VIEW `platzi_people` AS 
    SELECT
        `people`.`person_id` AS `person_id`,
        `people`.`last_name` AS `last_name`,
        `people`.`first_name` AS `first_name`,
        `people`.`adress` AS `adress`,
        `people`.`city` AS `city`
    FROM
        `people`;