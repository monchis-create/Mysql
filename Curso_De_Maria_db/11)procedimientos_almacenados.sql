USE mi_garaje;

-- Estaba : procedimientos_almacenados.sql , en esa cosa amarilla con tres discos
-- Este archivo ya esta cargado no es necesario volver a cargar desde la terminal.


-- Para eliminar un procedimiento almacenado, primero inicio sesion con mi usuario y contraseña, despues uso mi base de datos con el USE mi_garaje,despues pongo DROP PROCEDURE calcular_la_distancia_entre_lineas; osea el nombre del procedimiento que se habia creado antes ,doy enter y se a eliminado mi procedimiento almacenado y por ultimo pongo exit; o control + D para salirme y de ahi puedo volver a crear otro procedimiento almacenado.

-- Para llamar a un procedimiento almacenado inicio secion con mi usuario y contraseña, despues uso mi base de datos con el USE mi_garaje; despues que estoy dentro pongo (esto es para kilometros) CALL calcular_la_distancia_entre_lineas(POINT(-78.4924096,-0.2179171),POINT(-78.4883072 ,-0.2146885),false);  o (esto es para calcular en metros) CALL calcular_la_distancia_entre_lineas(POINT(-78.4924096,-0.2179171),POINT(-78.4883072 ,-0.2146885),true); , con el nombre de mi procedimiento almacenado


-- Primero se pone la longitud y despues la latitud, cuando llamo al CALL o cuando llamo al procedimiento almacenado que es lo mismo.


-- -- Esto es para consultar la latitud y la longitud osea la direccion
-- SELECT ST_X(direccion) AS latitud, ST_Y(direccion) AS longitud
-- FROM clientes
-- WHERE id = 1;









-- Este procedimiento almacenado te permite calcular la distancia entre dos puntos, incluso si no están registrados en tu base de datos. Puedes proporcionar coordenadas directamente como parámetros y obtener la distancia en metros o kilómetros según lo especifiques.

DELIMITER //
CREATE PROCEDURE calcular_la_distancia_entre_lineas(
    IN linea_uno POINT,
    IN linea_dos POINT,
    IN metros_o_kilometros BOOLEAN
)
BEGIN 

    IF metros_o_kilometros THEN
        
        -- Esto es para calcular en Metros.
        SELECT 
        ST_Distance_Sphere(linea_uno ,linea_dos) AS metros;

    ELSE
        -- Esto es para calcular en Kilometros.
        SELECT 
        ST_Distance_Sphere(linea_uno ,linea_dos) / 1000 AS kilometros;

    END IF;

END //

DELIMITER ;



-- ABERIGUAR PORQUE EL PROFE DE PLATZI DIJO QUE PRIMERO VA LA LONGITUD Y DESPUES LA LATITUD SI ES ALREVEZ


-- el profe de platzi dice que primero es la longitud y despues la latitud por eso me daba diferente resultado
--                                              longitud  latitud
-- CALL calcular_la_distancia_entre_lineas(POINT(-0.20359,-78.501948),POINT(-25.3039042 ,-57.6359655),true);



-- longitut latitud esta es la correcta.
-- CALL calcular_la_distancia_entre_lineas(POINT(-78.75798, -1.83011), POINT(-78.78874 ,-1.69376),false);
-- latitud longitud
-- CALL calcular_la_distancia_entre_lineas(POINT(-1.83011,-78.75798), POINT(-1.69376,-78.78874), false);
















-- CALL lista(1000.50, 500.25, '2024-12-20', 'Compra de insumos');


DELIMITER $$

CREATE PROCEDURE lista(
    IN ingresos DECIMAL(5,2),
    IN gastos DECIMAL(5,2),
    IN dia CHAR(25),
    IN motivoDeMisGastos TEXT
)
BEGIN
    INSERT INTO ingresos ( ingresos, gastos, dia, motivoDeMisGastos)
    VALUES ( ingresos, gastos, dia, motivoDeMisGastos);
END$$

DELIMITER ;












































-- Llamadas al procedimiento
CALL PromedioDeIngresosYGastos(100.50, 50.25, 'MARTES', 'Compra de equipo', @PromedioIngresos1, @PromedioGastos1);
CALL PromedioDeIngresosYGastos(130.50, 60.25, 'MARTES', 'Compra de equipo', @PromedioIngresos2, @PromedioGastos2);
CALL PromedioDeIngresosYGastos(140.50, 70.25, 'MARTES', 'Compra de equipo', @PromedioIngresos3, @PromedioGastos3);

-- Unifica los promedios en una sola variable
SET @PromedioIngresosUnificado = (@PromedioIngresos1 + @PromedioIngresos2 + @PromedioIngresos3) / 3;
SET @PromedioGastosUnificado = (@PromedioGastos1 + @PromedioGastos2 + @PromedioGastos3) / 3;

-- Muestra los resultados
SELECT 
    @PromedioIngresosUnificado AS PromedioGeneralIngresos,
    @PromedioGastosUnificado AS PromedioGeneralGastos;



DELIMITER $$

CREATE PROCEDURE PromedioDeIngresosYGastos(
    IN p_ingresos DECIMAL(5,2),
    IN p_gastos DECIMAL(5,2),
    IN p_dia CHAR(25),
    IN p_motivoDeMisGastos TEXT,
    OUT p_promedioIngresos DECIMAL(5,2),
    OUT p_promedioGastos DECIMAL(5,2)
)
BEGIN
    DECLARE tempPromedioIngresos DECIMAL(5,2);
    DECLARE tempPromedioGastos DECIMAL(5,2);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Error en la transacción' AS ErrorMessage;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Inserta los datos en la tabla ingresos
    INSERT INTO ingresos (ingresos, gastos, dia, motivoDeMisGastos)
    VALUES (p_ingresos, p_gastos, p_dia, p_motivoDeMisGastos);

    -- Calcula el promedio de los ingresos
    SELECT AVG(ingresos) INTO tempPromedioIngresos
    FROM ingresos
    WHERE ingresos = p_ingresos;

    -- Calcula el promedio de los gastos
    SELECT AVG(gastos) INTO tempPromedioGastos
    FROM ingresos
    WHERE gastos = p_gastos;

    -- Asigna los resultados a las variables de salida
    SET p_promedioIngresos = tempPromedioIngresos;
    SET p_promedioGastos = tempPromedioGastos;

    COMMIT;
END$$

DELIMITER ;
