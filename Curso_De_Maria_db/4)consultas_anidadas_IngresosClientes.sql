USE mi_garaje;

-- Este es el ejemplo que puso el profesor de platzi.
-- SELECT calificacion 
-- FROM `calificaciones`
-- WHERE id_estudiantes = (
--     SELECT id
--     FROM estudiantes
--     WHERE nombre = "pablito"
-- );

-- 1) Este es le voceto de como debo ingresar mi consulta anidada no lo hagas nunca asi.1
-- INSERT INTO `ingresos_clientes` (ingresos_id,clientes_id)
-- VALUES 
-- (
--     9,
--     1
-- );



-- 2) Boceto de como deberia realizar mi consulta anidada 2
-- INSERT INTO `ingresos_clientes` (ingresos_id,clientes_id)
-- VALUES 
-- (
--     (

--     ),
--     1
-- );



-- Esto es para poner los respectivos id en la tabla ingresos clientes,no pongas datos quemados ,los datos quemados son por ejemplo si ingreso directamente el id 9 , id 5 no hagas esto usa las consultas anidadas lo que esta abajo.
-- INSERT INTO `ingresos_clientes` (ingresos_id,clientes_id)
-- VALUES 
-- (
--     (
--         SELECT `ingresos`.`id`
--         FROM `ingresos`
--         WHERE `ingresos`.`gastos` = "10.00"
--         LIMIT 1
--     ),
--     (
--         SELECT `clientes`.`id`
--         FROM `clientes`
--         WHERE `clientes`.`nombre` = "amadeo"
--     )
-- );




-- Esto es para cuando te equivoques de ingresar los datos de la consulta anidada los corrijas.OJITO AHI.
-- UPDATE `ingresos_clientes`
-- SET `ingresos_id` = (
--     SELECT `ingresos`.`id`
--     FROM `ingresos`
--     WHERE `ingresos`.`gastos` = "3.00"
--     LIMIT 1
-- )
-- WHERE `clientes_id` = (
--     SELECT `clientes`.`id`
--     FROM `clientes`
--     WHERE `clientes`.`nombre` = "Tania"
-- );
