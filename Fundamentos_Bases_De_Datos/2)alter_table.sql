

-- Es para agregar columnas.
ALTER TABLE people
ADD date_of_birth DATE;

-- Esto es para agregar una columna seguida de otra.
ALTER TABLE `platziblog`.`people`
ADD COLUMN `date_of_birth` DATETIME NULL AFTER `city`;

-- Esto es para modificar una columna seguida de otra.
-- Para que funcione este codigo, debo poner los contrains y despues el after. porque si no pongo los contrains no me va a funcionar y me va a dar error.
ALTER TABLE platziblog.people
MODIFY COLUMN date_of_birth DATETIME NULL AFTER city;
-- Cuando es not null en php my admin aparece un no debajo de nulo y cuando es un null en php my admin me parece un si debajo de nulo.
-- En phpMyAdmin:
-- Cuando una columna es NOT NULL, aparece un "No" debajo de la opción Nulo.
-- Cuando una columna permite NULL, aparece un "Sí" debajo de la opción Nulo.




------------------------------------------------------------------------------------------
-- No asi sin los contrains
ALTER TABLE people
MODIFY COLUMN `1000` AFTER `GB4`;

-- SINO ASI con los contrains.
ALTER TABLE people
MODIFY COLUMN `1000` INT AFTER `GB4`;

------------------------------------------------------------------------------------------






-- Esto es para cambiar el nombre de una columna junto con los contrains seguido de una columna en especifico por eso el AFTER.
ALTER TABLE platziblog.people
CHANGE COLUMN date_of_birth plan_b DATETIME NULL AFTER city;


-- Esto es lo mismo que el de arriba pero sin el AFTER
-- Esto es para cambiar el nombre de la columna o constrains
ALTER TABLE `platziblog`.`people`
CHANGE COLUMN `date_of_birth` `date_of_birth` VARCHAR(30) NULL DEFAULT NULL AFTER nombre;


-- Esto es para cambiar el nombre de la columna o constrains
-- Ya lo probe con un ejercicio y si funciono.
ALTER TABLE `platziblog`.`people`
CHANGE COLUMN `date_of_birth` `fecha` VARCHAR(30) NULL DEFAULT NULL AFTER nombre;


-- Esto es para cambiar el nombre de la columna o constrains
-- Ya lo probe con un ejercicio y si funciono.
ALTER TABLE `platziblog`.`people`
CHANGE COLUMN `date_of_birth` `fecha` VARCHAR(30) NULL DEFAULT NULL;




ALTER TABLE `Mi Garaje`.`copiasdellaves`
CHANGE COLUMN `1510` `1510` INT AFTER `107`;









-- La consulta que proporcionaste está destinada a alterar la definición de una columna en la tabla "people". En particular, está alterando la columna "date_of_birth" para que sea del tipo de dato YEAR.

--Chat gpt dice que no use esta sentencia de alter column
ALTER TABLE people
ALTER COLUMN date_of_birth YEAR;

-- esta esta mal y la de abajo esta bien.
ALTER TABLE `platziblog`.`people`
DROP `COLUMN date_of_birth`;

-- Esta esta bien y la de arriba esta mal.
ALTER TABLE `platziblog`.`people`
DROP COLUMN `date_of_birth`;


-- Esta tambien esta bien.
ALTER TABLE people
DROP COLUMN date_of_birth;






-- PARA AGREGAR LLAVES FORANEAS, DEBE TENER LOS MISMO CONTRAINS EL INGRESOS_iD  CON LOS IDS DE de las llaves primarias de las tablas.
ALTER TABLE registrodecompras
ADD CONSTRAINT ingresos_registrodecompras
FOREIGN KEY (ingresos_id) 
REFERENCES ingresos(id);

-- Para eliminar llaves foraneas
ALTER TABLE mi_garaje.registrodecompras DROP FOREIGN KEY ingresos_registrodecompras;


-- Luego de ejecutar la sentencia de arriba , biene esta.
ALTER TABLE registrodecompras
DROP COLUMN ingresos_id;