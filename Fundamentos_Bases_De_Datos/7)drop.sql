



-- Para crear una base de datos.
CREATE DATABASE test_db;
-- Para borrar una base de datos.
DROP DATABASE test_db;
-- Para borrar una base de datos.
DROP SCHEMA test_db;




USE DATABASE test_db;



-- Para borrar una tabla
DROP TABLE `platziblog` `people`;
-- Esto es lo correcto utilizando el punto.
DROP TABLE `platziblog`.`people`;
-- este el lo correcto utilizando el punto.
DROP TABLE platziblog.people;




-- Para borrar una tabla.
DROP TABLE `people`;