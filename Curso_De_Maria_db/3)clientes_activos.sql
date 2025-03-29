USE mi_garaje;

-- Esto ya esta funcionando no es necesario volver a cargar este archivo desde la terminal.


-- Todo esto se hace desde la terminal o asi tambien : moises@DESKTOP-4VFVA58:/mnt/c/xampp/htdocs/BasesDeDatos$ mysql -u monchis -p < clientes_activos.sql 
-- Esto es para actualizar(ACTIVAR) a mis clientes activos : UPDATE `clientes` SET status = 1 WHERE id=372;
-- Esto es para actualizar(DESACTIVAR) a mis clientes activos : UPDATE `clientes` SET status = 0 WHERE id=372;





DELIMITER // 
CREATE TRIGGER actualizar_a_los_clientes_activos
AFTER UPDATE 
ON `clientes`
FOR EACH ROW 
BEGIN

    IF NEW.status = 1 THEN 
        INSERT INTO `clientes_activos` (clientes_id) VALUES (NEW.id);
    ELSE
        DELETE FROM `clientes_activos` WHERE clientes_id = NEW.id;
    END IF;

END; //
 
DELIMITER ;


-- UPDATE `clientes` SET status = 0 WHERE id=5;
-- UPDATE `clientes` SET status = 0 WHERE id=6;






-- Esta es la version correcta de este archivo despues de la normalizacion de la base de datos.
DELIMITER // 
CREATE TRIGGER actualizar_a_los_clientes_activos
AFTER UPDATE 
ON `clientes`
FOR EACH ROW 
BEGIN

    IF NEW.status = 1 THEN 
        INSERT INTO `clientes_activos` (cliente_id) VALUES (NEW.cliente_id);
    ELSE
        DELETE FROM `clientes_activos` WHERE cliente_id = NEW.cliente_id;
    END IF;

END; //
 
DELIMITER ;


-- UPDATE `clientes` SET status = 0 WHERE id=5;
-- UPDATE `clientes` SET status = 0 WHERE id=6;




-- Esto es para que al actualizar mi tabla clientes no se borre la direccion de mis clientes , si no que se mantenga la direccion anterior.
-- Este trigger es para que no se pueda actualizar la direccion de un cliente a NULL, si se intenta hacer eso, se mantendra la direccion anterior.

CREATE TRIGGER before_update_clientes
BEFORE UPDATE ON clientes
FOR EACH ROW
SET NEW.direccion = IFNULL(NEW.direccion, OLD.direccion);
