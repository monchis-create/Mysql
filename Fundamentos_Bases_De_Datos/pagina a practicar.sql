SELECT g.id, g.gasto, i.ingreso, g.primerRegistro 
FROM gastos g 
JOIN ingresos i ON g.ingreso_id = i.id;



-- 7. Consultar todos los gastos con sus respectivos motivos.

SELECT g.id AS gasto_id, g.gasto, m.motivo
FROM gastos g
JOIN gastos_motivos gm ON g.id = gm.gasto_id
JOIN motivos m ON gm.motivo_id = m.id;


-- Obtener el total de ingresos y gastos.
SELECT 
    (SELECT SUM(ingreso) FROM ingresos) AS total_ingresos, 
    (SELECT SUM(gasto) FROM gastos) AS total_gastos;
