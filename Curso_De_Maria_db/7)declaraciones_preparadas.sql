USE mi_garaje;

-- -- Vamos a empezar a crear un procedimiento almacenado ,usando consultas preparadas.

-- -- Cada vez que ocurra un error tengo que eliminar mi procedimiento almacenado con el paso que esta a continuacion.

-- -- Para eliminar un procedimiento almacenado pongo DROP PROCEDURE get_line_stations;     get_line_stations es el nombre de mi procedimiento almacenado de CREATE PROCEDURE get_line_station.

-- -- Para llamar a una declaracion preparada , primero inicio secion con mi usuario y contraseña,despues pongo USE mi_garaje; despues pongo CALL get_line_stations("Linea 9");
-- CALL obtener_el_resultado("Lunes");
-- CALL ingresos_de_cada_semana('Lunes');


-- ESTO ES EL EJEMPLO QUE HACE EL PROFESOR DE PLATZI
-- ESTO ES EL EJEMPLO QUE HACE EL PROFESOR DE PLATZI
-- DELIMITER //
-- CREATE PROCEDURE get_line_stations(
--     IN line_name VARCHAR(15)
-- )
-- BEGIN

--     -- Esta es una forma de guardar valores de una consulta dentro de una variable
--     DECLARE line_id BIGINT(20);

--     SELECT id
--     INTO line_id
--     FROM `lines`
--     WHERE name = line_name
--     COLLATE utf8mb4_unicode_ci;

--     -- Esto es otra forma de guardar valores de una consulta dentro de una variable

--     SET @sql = CONCAT("
--         SELECT
--             `lines_stations`.`id` AS relation_id,
--             `lines`.`name` AS lines_name,
--             `stations`.name` AS station_name
--         FROM `lines_stations`
--         INNER JOIN `stations`
--         ON `stations`.`id` = `lines_stations`.`station_id`
--         INNER JOIN `lines`
--         ON `lines`.`id` = `lines_stations`.`line_id`
--         WHERE `lines_stations`.`line_id` = ", line_id);


--     PREPARE stmt FROM @sql;
--     EXECUTE stmt;
--     DEALLOCATE PREPARE stmt;
-- END //

-- DELIMITER ;









-- Obtener resultados hay que revisar si se tiene que volver a cargar OJITO AHI.
-- -- Asi se llama a esta consulta : CALL obtener_el_resultado("Lunes");
-- -- Este procedimiento almacenado me da el resultado de los ingresos que tengo de mis clientes
DELIMITER //

CREATE PROCEDURE obtener_el_resultado(
    IN valor_ingresos CHAR(25)
)
BEGIN
    -- Crear una tabla temporal para almacenar los IDs de ingresos
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_ingresos_id (
        id INT
    );

    -- Insertar los IDs de ingresos que cumplen con la condición en la tabla temporal
    INSERT INTO tmp_ingresos_id (id)
    SELECT id
    FROM `ingresos`
    WHERE dia = valor_ingresos 
    COLLATE utf8mb4_unicode_ci;

    -- Construir la consulta dinámica utilizando la tabla temporal
    SET @moi = CONCAT("
        SELECT
            `ingresos_clientes`.`id` AS ids,
            `ingresos`.`dia` AS resultado,`ingresos`.`ingresos` AS ingresos,`ingresos`.`gastos` AS gastos,
            `clientes`.`nombre` AS nombre
        FROM `ingresos_clientes`
        INNER JOIN `clientes`
        ON `clientes`.`id` = `ingresos_clientes`.`clientes_id`
        INNER JOIN `ingresos`
        ON `ingresos`.`id` = `ingresos_clientes`.`ingresos_id`
        WHERE `ingresos`.`id` IN (SELECT id FROM tmp_ingresos_id)
    ");

    -- Preparar y ejecutar la consulta dinámica
    PREPARE stmt FROM @moi;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Eliminar la tabla temporal después de usarla
    DROP TEMPORARY TABLE IF EXISTS tmp_ingresos_id;
END //

DELIMITER ;







-- -- Asi se llama a esta consulta : CALL ingresos_de_cada_semana('Lunes');
-- -- Me da los ingresos que tengo para un dia en especifico, por ejemplo para todos los lunes que tuve ingresos en el año.
DELIMITER //

CREATE PROCEDURE ingresos_de_cada_semana(
    IN valor_ingresos CHAR(25)
)
BEGIN
    -- Crear una tabla temporal para almacenar los IDs de ingresos
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_ingresos_id (
        id INT
    );

    -- Insertar los IDs de ingresos que cumplen con la condición en la tabla temporal
    INSERT INTO tmp_ingresos_id (id)
    SELECT id
    FROM `ingresos`
    WHERE dia = valor_ingresos 
    COLLATE utf8mb4_unicode_ci;

    -- Construir la consulta dinámica utilizando la tabla temporal para la tabla 'ingresos' solamente
    SET @moi = CONCAT("
        SELECT
            `ingresos`.`id` AS ingreso_id,
            `ingresos`.`dia` AS dia,
            `ingresos`.`ingresos` AS ingresos,
            `ingresos`.`gastos` AS gastos
        FROM `ingresos`
        WHERE `ingresos`.`id` IN (SELECT id FROM tmp_ingresos_id)
    ");

    -- Preparar y ejecutar la consulta dinámica
    PREPARE stmt FROM @moi;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Eliminar la tabla temporal después de usarla
    DROP TEMPORARY TABLE IF EXISTS tmp_ingresos_id;
END //

DELIMITER ;





-- -- Asi se llama a esta consulta : CALL obtener_ingresos_entre_fechas('2023-12-31', '2024-01-01');
-- Aqui me da la fecha de inicio y la fecha de fin de una consulta   
DELIMITER //

CREATE PROCEDURE obtener_ingresos_entre_fechas(
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    -- Crear una tabla temporal para almacenar los IDs de ingresos
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_ingresos_id (
        id INT
    );

    -- Insertar los IDs de ingresos que cumplen con el rango de fechas en la tabla temporal
    INSERT INTO tmp_ingresos_id (id)
    SELECT id
    FROM `ingresos`
    WHERE `ingresos`.`fecha` BETWEEN fecha_inicio AND fecha_fin;

    -- Construir la consulta para obtener los ingresos entre las fechas especificadas
    SELECT
        `ingresos`.`id` AS ingreso_id,
        `ingresos`.`dia` AS dia,
        `ingresos`.`ingresos` AS ingresos,
        `ingresos`.`gastos` AS gastos,
        `ingresos`.`Fecha` AS fecha
    FROM `ingresos`
    WHERE `ingresos`.`id` IN (SELECT id FROM tmp_ingresos_id);

    -- Eliminar la tabla temporal después de usarla
    DROP TEMPORARY TABLE IF EXISTS tmp_ingresos_id;
END //

DELIMITER ;




















-- Esto procedimiento almacenado me da la sumatoria de los ingresos y gastos, me da dos comandos para ejecutar primero ejecuto el call y despues ejecuto el select.
-- d

DELIMITER //

CREATE PROCEDURE obtener_suma_ingresos_y_gastos_entre_fechas(
    IN fecha_inicio DATE,
    IN fecha_fin DATE,
    OUT suma_ingresos DECIMAL(10, 2),
    OUT suma_gastos DECIMAL(10, 2)
)
BEGIN
    -- Declarar variables para almacenar la suma de los ingresos y los gastos
    DECLARE total_ingresos DECIMAL(10, 2);
    DECLARE total_gastos DECIMAL(10, 2);

    -- Calcular la suma de los ingresos entre las fechas especificadas
    SELECT SUM(ingresos) INTO total_ingresos
    FROM `ingresos`
    WHERE `fecha` BETWEEN fecha_inicio AND fecha_fin;

    -- Calcular la suma de los gastos entre las fechas especificadas
    SELECT SUM(gastos) INTO total_gastos
    FROM `ingresos`
    WHERE `fecha` BETWEEN fecha_inicio AND fecha_fin;

    -- Asignar el valor de la suma de los ingresos a la variable de salida
    SET suma_ingresos = total_ingresos;

    -- Asignar el valor de la suma de los gastos a la variable de salida
    SET suma_gastos = total_gastos;
END //

DELIMITER ;
