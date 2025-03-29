USE mi_garaje;

-- SELECT * FROM `ingresos`;

-- SELECT id, ingresos, fecha FROM `ingresos`;

-- -- Operaciones matematicas con select
-- SELECT (9+7.5+11) AS resumen;

-- SELECT SUM(ingresos) FROM `ingresos`;
-- SELECT AVG(ingresos) FROM `ingresos`;


SELECT 
`clientes`.`nombre`,
`ingresos`.`ingresos`
FROM `clientes`
LEFT JOIN `ingresos` ON `clientes`.`id` = `ingresos`.`id`;


SELECT *
FROM `clientes`
LEFT JOIN `ingresos` ON `clientes`.`id` = `ingresos`.`id`;