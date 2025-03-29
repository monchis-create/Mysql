USE mi_garaje;


-- No hagas lo que esta abajo esta muy mal va a dejar los datos huerfanos y no se va a poder recuperar los datos  
ALTER TABLE ingresos.gastos_motivos DROP FOREIGN KEY gastos_motivos_ibfk_1;
TRUNCATE TABLE gastos;
ALTER TABLE ingresos.gastos_motivos ADD CONSTRAINT gastos_motivos_ibfk_1 FOREIGN KEY (gasto_id) REFERENCES ingresos.gastos (id);








-- No hagas esto esta muy mal 
-- Esto es para truncar una tabla sin llaves foraneas
-- TRUNCATE TABLE `clientes`;


-- Esto es para truncar la tabla desabilitando las llaves foraneas
SET FOREIGN_KEY_CHECKS = 0; -- Deshabilitar temporalmente las comprobaciones de clave foránea
TRUNCATE TABLE clientes; -- Truncar la tabla ingresos
SET FOREIGN_KEY_CHECKS = 1; -- Volver a habilitar las comprobaciones de clave foránea


-- Esto es para truncar la tabla desabilitando las llaves foraneas
SET FOREIGN_KEY_CHECKS = 0; -- Deshabilitar temporalmente las comprobaciones de clave foránea
TRUNCATE TABLE ingresos; -- Truncar la tabla ingresos
SET FOREIGN_KEY_CHECKS = 1; -- Volver a habilitar las comprobaciones de clave foránea


-- Esto es para truncar la tabla desabilitando las llaves foraneas
SET FOREIGN_KEY_CHECKS = 0; -- Deshabilitar temporalmente las comprobaciones de clave foránea
TRUNCATE TABLE copiasdellaves; -- Truncar la tabla ingresos
SET FOREIGN_KEY_CHECKS = 1; -- Volver a habilitar las comprobaciones de clave foránea


-- Esto es para truncar la tabla desabilitando las llaves foraneas
SET FOREIGN_KEY_CHECKS = 0; -- Deshabilitar temporalmente las comprobaciones de clave foránea
TRUNCATE TABLE electrodomesticos; -- Truncar la tabla ingresos
SET FOREIGN_KEY_CHECKS = 1; -- Volver a habilitar las comprobaciones de clave foránea


-- Esto es para truncar la tabla desabilitando las llaves foraneas
SET FOREIGN_KEY_CHECKS = 0; -- Deshabilitar temporalmente las comprobaciones de clave foránea
TRUNCATE TABLE registrodecompras; -- Truncar la tabla ingresos
SET FOREIGN_KEY_CHECKS = 1; -- Volver a habilitar las comprobaciones de clave foránea


-- Esto es para truncar la tabla desabilitando las llaves foraneas
SET FOREIGN_KEY_CHECKS = 0; -- Deshabilitar temporalmente las comprobaciones de clave foránea
TRUNCATE TABLE clientes_activos; -- Truncar la tabla ingresos
SET FOREIGN_KEY_CHECKS = 1; -- Volver a habilitar las comprobaciones de clave foránea


-- Esto es para truncar la tabla desabilitando las llaves foraneas
SET FOREIGN_KEY_CHECKS = 0; -- Deshabilitar temporalmente las comprobaciones de clave foránea
TRUNCATE TABLE ingresos_clientes; -- Truncar la tabla ingresos
SET FOREIGN_KEY_CHECKS = 1; -- Volver a habilitar las comprobaciones de clave foránea



-- Esto es para truncar la tabla desabilitando las llaves foraneas
SET FOREIGN_KEY_CHECKS = 0; -- Deshabilitar temporalmente las comprobaciones de clave foránea
TRUNCATE TABLE metas_semanales; -- Truncar la tabla ingresos
SET FOREIGN_KEY_CHECKS = 1; -- Volver a habilitar las comprobaciones de clave foránea




-- Esto es para eliminar todos los datos de la tabla sin utilzar el WHERE , PERO SIEMPRE QUE QUIERAS BORRAR ALGO SIEMPRE UTILIZA EL WHERE.
-- DELETE FROM `clientes` ;
-- DELETE FROM `ingresos` ;




























-- si quieres eliminitar varios ids de golpe utiliza esto
-- Mejor opción para eliminar un rango de IDs en la tabla `clientes`
-- Esto es para borrar varios a la vez ids
-- DELETE FROM `clientes`
-- WHERE id BETWEEN 556 AND 625;


-- Mejor opción para eliminar varios IDs específicos en la tabla `ingresos`
-- DELETE FROM `ingresos`
-- WHERE id IN (2, 3, 4, 5, 6, 13);






-- y no esto, no utilices esto

-- Se puede borrar tanto por ID como tambien por nombres de la columna
-- DELETE FROM `ingresos`
-- WHERE id = 2 OR id = 3  OR id = 4  OR id = 5  OR id = 6  OR id = 13 ;


-- Y esto tampoco usar 

-- Esto es para borras varios registro
-- DELETE FROM `ingresos`
-- WHERE id = 14;
-- DELETE FROM `ingresos`
-- WHERE id = 15;
-- DELETE FROM `ingresos`
-- WHERE id = 22;
-- DELETE FROM `ingresos`
-- WHERE id = 23;
























-- Se puedo borras tanto por ID como nombres de la columna
-- id    ingresos   gastos       fecha            dia          motivoDeMisGastos
-- 21 |    16.00 |   8.20 | 2023-12-21 19:13:14 | LUNES     | ochenta mil almuerzos(2.50), 20 panes (.40), one two cola (.25), chocolate(.35),guitig fria(.70) |              NULL
-- DELETE FROM `ingresos`
-- WHERE dia = "MARTES";






