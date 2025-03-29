-- Empece desde el video 32 de platzi

-- Esto no incluye el #50
SELECT *
FROM posts
WHERE id<50 ; -- WHERE id>50 ;

-- Esto si incluye el #50
SELECT *
FROM posts
WHERE id<=50 ; -- WHERE id>=50 ;


-- Me trae solamente los posts que esten activos.
SELECT *
FROM posts
WHERE estatus = 'activo';


-- Me trae lo contrario a activo
SELECT *
FROM posts
WHERE estatus != 'activo';


-- Me trae todos los ids menos el 50 en este ejemplo
SELECT *
FROM posts
WHERE id != 50;



-- ✅ Esta consulta te mostrará todos los registros excepto los que tienen id 3, 4 o 5. 🚀
SELECT * 
FROM `motivos`
WHERE id NOT IN (3,4,5);





-- Me trae una cadena que tenga lo que sea antes y lo que sea despues pero que tenga la palabra escandalo
SELECT *
FROM posts
WHERE titulo LIKE '%escandalo%';



-- Me trae una palabra que empieze con la palabra escandalo por ejemplo(sin el % al inicio).
SELECT *
FROM posts
WHERE titulo LIKE 'escandalo%';



-- Me trae una palabra que termine con la palabra escandolo por ejemplo(sin el % al final).
SELECT *
FROM posts
WHERE titulo LIKE '%escandalo';


-- trae fechas mayores o menores a por ejemplo 2025-01-01.
SELECT *
FROM posts
WHERE fecha_de_publicacion < '2025-01-01'; -- WHERE fecha_de_publicacion > '2025-01-01';



-- Trae fechas que esten entre por ejemplo 2025-01-01 , 2028-12-31
SELECT *
FROM posts
WHERE fecha_de_publicacion BETWEEN '2025-01-01' AND '2028-12-31';



-- Aqui ya no me va a tomar la fecha completa , me va a tomar nada mas el año que este por ejemplo entre 2025 y 2028.
SELECT *
FROM posts
WHERE YEAR(fecha_de_publicacion) BETWEEN '2025' AND '2028';


-- Aqui ya no me va a tomar la fecha completa , me va a tomar nada mas el mes que este por ejemplo entre 01 y 06.
SELECT *
FROM posts
WHERE MONTH(fecha_de_publicacion) BETWEEN '01' AND '06';



-- Me trae todos los post que tiene fecha en el mes de junio solo el mes de junio.
SELECT *
FROM posts
WHERE MONTH(fecha_de_publicacion)='06';



-- Me trae el id que este entre 50 y 60, aqui si considera el 50 y 60 porque between si considera el rango completo.
SELECT *
FROM posts
WHERE id BETWEEN 50 AND 60 ;




SELECT * 
FROM INSTRUCTORS
WHERE INSTRUCTOR_ID IN (3,4,5,6);


SELECT * 
FROM INSTRUCTORS
WHERE INSTRUCTOR_ID = 3 ;

-- Esto es para ver las filas donde la columna 'firstname' tiene valores nulos
SELECT *
FROM STUDENTS
WHERE FIRSNAME IS NULL;


-- Esto es para ver las filas donde la columna 'firstname' no tiene valores nulos
SELECT *
FROM STUDENTS
WHERE FIRSNAME IS NOT NULL;

-- eSTO es para especifar que me arroje todas las edades menos los que tienen 20 años de edad.
SELECT *
FROM STUDENTS
WHERE AGE NOT IN (20);




SELECT monto, tipo, 
       CASE 
         WHEN monto BETWEEN 1 AND 3 THEN 'Group A' 
         ELSE 'Group B' 
       END AS grupo
FROM transacciones
WHERE tipo = 'ingreso'
GROUP BY monto, tipo;





-- Este codigo es para saber cuanto se gasto en cada ingreso y ordenarlos de mayor a menor.
SELECT ingresos.id AS ingreso_id, SUM(gastos.gasto) AS total_gastos
FROM ingresos
JOIN gastos ON ingresos.id = gastos.ingreso_id
GROUP BY ingresos.id
HAVING COUNT(gastos.id) >= 2
ORDER BY total_gastos DESC;


-- Esta consulta se hace para saber cuanto se gasto en el ingreso_id 4 individualmente, arriba es grupalmente y aqui abajo individualmente.
SELECT * FROM gastos WHERE ingreso_id = 4;









-- Esta consulta es para saber cuanto se gasto en cada ingreso y ordenarlos de mayor a menor , uno por uno.
SELECT 
    ingresos.id AS ingreso_id, 
    ingresos.ingreso AS total_ingreso, 
    COALESCE(SUM(gastos.gasto), 0) AS total_gastos, 
    (ingresos.ingreso - COALESCE(SUM(gastos.gasto), 0)) AS saldo_restante
FROM ingresos
LEFT JOIN gastos ON ingresos.id = gastos.ingreso_id
GROUP BY ingresos.id
ORDER BY saldo_restante DESC;





-- Si quieres saber el total general de todos los ingresos y el total general de todos los gastos, puedes usar esta consulta:
SELECT 
    (SELECT COALESCE(SUM(ingreso), 0) FROM ingresos) AS total_ingresos,
    (SELECT COALESCE(SUM(gasto), 0) FROM gastos) AS total_gastos,
    ((SELECT COALESCE(SUM(ingreso), 0) FROM ingresos) - 
     (SELECT COALESCE(SUM(gasto), 0) FROM gastos)) AS saldo_total;