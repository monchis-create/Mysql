
CALL obtener_suma_ingresos_y_gastos_entre_fechas('2024-01-01 00:00:00', '2024-01-31 23:59:59', @ingresos, @gastos);
SELECT @ingresos AS total_ingresos, @gastos AS total_gastos;



DELIMITER //

CREATE PROCEDURE obtener_suma_ingresos_y_gastos_entre_fechas(
    IN fecha_inicio TIMESTAMP,
    IN fecha_fin TIMESTAMP,
    OUT suma_ingresos DECIMAL(10, 2),
    OUT suma_gastos DECIMAL(10, 2)
)
BEGIN
    -- Declarar variables para almacenar la suma de los ingresos y los gastos
    DECLARE total_ingresos DECIMAL(10, 2) DEFAULT 0.00;
    DECLARE total_gastos DECIMAL(10, 2) DEFAULT 0.00;

    -- Calcular la suma de los ingresos
    SELECT IFNULL(SUM(monto), 0) INTO total_ingresos
    FROM transacciones
    WHERE tipo = 'ingreso'
    AND (primerRegistro BETWEEN fecha_inicio AND fecha_fin OR ultimoRegistro BETWEEN fecha_inicio AND fecha_fin);

    -- Calcular la suma de los gastos
    SELECT IFNULL(SUM(monto), 0) INTO total_gastos
    FROM transacciones
    WHERE tipo = 'gasto'
    AND (primerRegistro BETWEEN fecha_inicio AND fecha_fin OR ultimoRegistro BETWEEN fecha_inicio AND fecha_fin);

    -- Asignar los valores de salida
    SET suma_ingresos = total_ingresos;
    SET suma_gastos = total_gastos;
END //

DELIMITER ;
