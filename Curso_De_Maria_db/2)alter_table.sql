USE mi_garaje;




-- Esto es para agregar estas tres columnas que faltaban en la tabla ingreso , pero ya las inclui en la tabla  original no ejecutes este codigo , solo tenlo por si las moscas jejeje.
-- ALTER TABLE ingresos
-- ADD COLUMN `70 % Nec.Basic` DECIMAL(5,2) NOT NULL AFTER `id`,
-- ADD COLUMN `10 % invertir` DECIMAL(5,2) NOT NULL AFTER `70 % Nec.Basic`,
-- ADD COLUMN `20 % deudas` DECIMAL(5,2) NOT NULL AFTER `10 % invertir`;






-- Para borrar llaves foraneas
-- Primero en borrar
-- ALTER TABLE clientes
-- DROP FOREIGN KEY ingresos_clientes_clientes;

-- Segundo en borrar
-- ALTER TABLE clientes
-- DROP `clientes_id`;


ALTER TABLE copiasdellaves
DROP `copiasDeLlaves_id`;












--la columna ingresos debe tener los mismos contrains que la columna ingresos_id de la llave primaria 
ALTER TABLE copiasdellaves 
ADD COLUMN ingresos_id BIGINT UNSIGNED;

ALTER TABLE copiasdellaves 
ADD CONSTRAINT fk_ingresos_id 
--la columna ingresos debe tener los mismos contrains que la columna ingresos_id de la llave primaria 
FOREIGN KEY (ingresos_id) REFERENCES ingresos(id);





















-- Modify , change
-- osea change sirve para cambiar el nombre de  la columna y tambien los constrains o restricciones mientras que modify no se puede cambiar el nombre de la columna pero si los constrains o restricciones, ahi esta mas acertado sierto. contesta si o no
-- Mostrar versiones
-- Sí, esa afirmación es más precisa.

-- Resumen:

-- CHANGE:
-- Cambiar el nombre de la columna.
-- Modificar algunos aspectos de la definición de la columna:
-- Tipo de dato
-- Valores NULL
-- Valores por defecto
-- MODIFY:
-- Realizar cambios específicos en la definición de la columna:
-- Agregar o eliminar restricciones
-- Cambiar el tamaño del campo
-- Cambiar la posición de la columna
-- No se puede cambiar el nombre de la columna.
-- Ejemplos:

-- Cambiar el nombre y el tipo de dato de una columna:
-- SQL
-- ALTER TABLE clientes 
-- CHANGE direccion ruta VARCHAR(255) NOT NULL;
-- Usa el código con precaución.
-- Agregar una restricción UNIQUE a una columna:
-- SQL
-- ALTER TABLE clientes 
-- MODIFY ruta ADD UNIQUE;
-- Usa el código con precaución.
-- Cambiar el tamaño de un campo de tipo string:
-- SQL
-- ALTER TABLE clientes 
-- MODIFY nombre VARCHAR(50);
-- Usa el código con precaución.
-- En resumen:

-- CHANGE y MODIFY se usan para modificar la definición de una columna.
-- CHANGE se usa para cambios generales, incluyendo el nombre de la columna.
-- MODIFY se usa para cambios específicos, sin poder cambiar el nombre de la columna.
-- Espero que esta información te ayude a comprender mejor la diferencia entre CHANGE y MODIFY.













-- Cuando quiero usar el MODIFY tienen que ser compatibles los constrains como por ejemplo VARCHAR puedo cambiarle a CHAR o VARCHAR(100) puedo cambiarle a VARCHAR(50) O CHAR(50) y en este caso,  MODIFY Soyelmejor VARCHAR(50) NOT NULL DEFAULT '100.00'; , el default puedo poner cualquiera por ejemplo '100.00' etc
-- Pero no puedo Modificar por ejemplo de VARCHAR cambiarle a TIMESTAMP eso no se puede porque no son compatibles
-- ALTER TABLE copiasdellaves
-- DROP Soyelmejor;
-- MODIFY Soyelmejor VARCHAR(50) NOT NULL DEFAULT '100.00';
-- ADD Soyelmejor VARCHAR(100) NULL DEFAULT '0.00';

-- Esto es para modificar la columna.
-- MODIFY direccion POINT NULL AFTER numeroDeTelefono;
-- Esto es para agregar una columna
-- ADD COLUMN `70 % Necesidades Basicas` DECIMAL(5,2) NOT NULL AFTER `id`



















ALTER TABLE `registrodecompras`
MODIFY `productosComprados` VARCHAR(255),
ADD `perroso` INT DEFAULT NULL
DROP `perroso`;
ADD PRIMARY KEY (id),
ADD CONSTRAINT `registroDeCompras_clientes`
FOREIGN KEY (`registroDeCompras_id`) REFERENCES `registrodecompras` (`id`)







-- Para crear llaves foraneas.
ALTER TABLE `clientes`
ADD CONSTRAINT `electrodomesticos_clientes`
FOREIGN KEY (`electrodomesticos_id`) REFERENCES `electrodomesticos` (`id`);














-- Esto es para agregar una columna seguida de la columna que yo quiero por eso esta el AFTER
-- ALTER TABLE `ingresos`
-- ADD COLUMN `70 % Necesidades Basicas` DECIMAL(5,2) NOT NULL AFTER `id`,
-- ADD COLUMN `10 % Para invertir` DECIMAL(5,2) NOT NULL AFTER `70 % Necesidades Basicas`,
-- ADD COLUMN `20 % Para pagar deudas` DECIMAL(5,2) NOT NULL AFTER `10 % Para invertir`;







-- Esto es para cambiar el nombre de una columna, antes de cambiar ve a la columna que quieres cambiar y colocales todos los datos que tiene en esa tabla osea los constrains y eso
-- ALTER TABLE `ingresos`
-- CHANGE `fechaYhora` `primerRegistro` TIMESTAMP,
-- CHANGE `actualizacionDeFecha` `ultimoRegistro` TIMESTAMP;



-- ALTER TABLE `clientes`
-- CHANGE `status` `statuss` TINYINT NOT NULL DEFAULT '0';


-- ALTER TABLE `clientes`
-- MODIFY `direccion` POINT DEFAULT NULL AFTER `numeroDeTelefono`;







-- ALTER TABLE `ingresos`
-- MODIFY `primerRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
-- MODIFY `ultimoRegistro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

