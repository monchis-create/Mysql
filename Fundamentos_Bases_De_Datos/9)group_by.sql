-- comence desde el video 32


-- OJO CON ESTA NO ESTA EN EL CURSO DE PLATZI SI NO QUE ME DIO CHAT GPT.
SELECT SUM(CASE WHEN categoria = 'Electrónica' THEN monto ELSE 0 END) AS total_electronica,
       SUM(CASE WHEN categoria = 'Ropa' THEN monto ELSE 0 END) AS total_ropa
FROM ventas;





-- En resumen, en SQL, puedes agrupar por columnas originales de la tabla o por expresiones que representen valores escalares, pero no puedes agrupar por alias que representen el resultado de una función de agregación o cualquier otra expresión compleja.
-- no entiendo esta parte con escalar y todo lo que sigue
-- ChatGPT
-- Mis disculpas por la confusión. Permíteme explicarlo de una manera más clara:

-- En SQL, cuando utilizas la cláusula GROUP BY, puedes agrupar los resultados por:

-- Columnas originales de la tabla: Esto significa que puedes agrupar por las columnas que existen directamente en la tabla de la base de datos.

-- Expresiones que representen valores escalares: Esto incluye cualquier expresión que derive un único valor para cada fila de datos, como funciones que devuelven un único valor, operaciones matemáticas simples, etc.

-- En la primera consulta que proporcionaste, intentaste agrupar por un alias (total_ingresos_por_ciudad) que representa el resultado de una función de agregación (SUM). Esto no está permitido porque el resultado de una función de agregación representa un conjunto de valores, no un valor escalar único para cada fila.

-- En cambio, en la segunda consulta, el alias post_year se asigna al resultado de la función YEAR(), que extrae el año de una fecha. Esto es aceptable porque la función YEAR() devuelve un único valor escalar (el año) para cada fila de la tabla.

-- En resumen, puedes agrupar por valores escalares (como el resultado de funciones que devuelven un único valor), pero no puedes agrupar por conjuntos de valores, como los resultados de funciones de agregación.

-- User
-- osea no me va a dar el resultado de mi suma porque hay muchos valores que sumar mientras que en el año solo es literal el año nada mas sierto????
-- ChatGPT
-- Exactamente, has entendido correctamente. Cuando usas una función de agregación como SUM(), estás calculando una suma sobre un conjunto de valores en la tabla. Por lo tanto, el resultado de SUM() es un valor que representa la suma de todos esos valores en el conjunto.

-- Por otro lado, cuando utilizas una función como YEAR() para extraer el año de una fecha, estás obteniendo un único valor escalar para cada fila de la tabla. En este caso, el valor devuelto por YEAR() es solo el año, un valor único y específico para cada fila.

-- Dado que GROUP BY se utiliza para agrupar filas que tienen el mismo valor, es válido agrupar por el año extraído de una fecha usando YEAR(), ya que cada fila tendrá un solo valor de año asociado. Sin embargo, no es válido agrupar por el resultado de SUM() porque cada grupo tendría muchos valores diferentes que sumar, lo que no tiene sentido en términos de agrupación.

-- User
-- me pudes dar todas las que  son escalares y todas las que son conjunto de valores porfavor para saver cual es cual si porfavor.
-- ChatGPT
-- Por supuesto, aquí tienes algunos ejemplos de funciones y expresiones que pueden ser escalares (devuelven un único valor para cada fila) o conjuntos de valores (devuelven múltiples valores o un conjunto de resultados):

-- Valores escalares:

-- Funciones que operan sobre valores individuales de una fila, como:

-- YEAR(), MONTH(), DAY() para extraer partes de una fecha.
-- CONCAT() para concatenar cadenas.
-- UPPER(), LOWER() para convertir texto a mayúsculas o minúsculas.
-- LEN() o LENGTH() para calcular la longitud de una cadena.
-- Operaciones matemáticas que producen un único resultado, como:

-- Operadores aritméticos (+, -, *, /).
-- Funciones matemáticas simples como ABS(), SQRT(), ROUND().
-- Conjuntos de valores:

-- Funciones de agregación que operan sobre múltiples filas, como:

-- SUM(), COUNT(), AVG(), MAX(), MIN().
-- Estas funciones agregan valores de múltiples filas y devuelven un solo valor resumen.
-- Funciones que devuelven múltiples resultados o conjuntos de resultados, como:

-- Funciones de tabla, que devuelven un conjunto de filas como resultado.
-- Subconsultas que devuelven múltiples filas o columnas.
-- Es importante entender la distinción entre valores escalares y conjuntos de valores al escribir consultas SQL y al usar la cláusula GROUP BY, ya que solo puedes agrupar por valores escalares.



-- User
-- -- No puedo usar este alias total_ingresos_por_ciudad porque no existe en mi tabla
-- -- Esta consulta calculará la suma de los ingresos por ciudad desde la tabla informe_ventas, mostrando el total de ingresos para cada ciudad presente en la tabla.
-- SELECT ciudad, SUM(ingresos) AS total_ingresos_por_ciudad
-- FROM informe_ventas
-- GROUP BY total_ingresos_por_ciudad;



-- -- Esta sentencia cuenta la cantidad de publicaciones por año, extrayendo el año de la fecha de publicación y luego agrupando los resultados por año.
-- SELECT YEAR(fecha_de_publicacion) AS post_year, COUNT(*) AS post_quanty
-- FROM posts
-- GROUP BY post_year;
-- osea puedo usar el alias cuando son valores escalares mientras si son un conjunto de valores no puedo usar el alias sierto verdad???? contestame si o no ggg

-- ChatGPT
-- Sí, eso es correcto. Puedes usar un alias cuando estás agrupando por valores escalares, como en el caso de la segunda consulta donde agrupas por el alias "post_year" que se deriva de la función YEAR(). En cambio, no puedes usar un alias cuando estás agrupando por un conjunto de valores, como en la primera consulta donde intentas agrupar por el alias "total_ingresos_por_ciudad", que representa el resultado de la función de agregación SUM() y es un conjunto de valores.











-- Se puede poner el AS en el SELECT como no se puede poner el AS para poner el alias.
-- Me agrupa el estatus y me cuenta cuantos activos y cuantos inactivos tengo en mi columna estatus.
SELECT estatus, COUNT(*) post_quanty
FROM posts
GROUP BY estatus;

-- Se puede poner el AS en el SELECT como no se puede poner el AS para poner el alias.
-- Me agrupa el estatus y me cuenta cuantos activos y cuantos inactivos tengo en mi columna estatus.
SELECT estatus, COUNT(*) AS post_quanty
FROM posts
GROUP BY estatus;


-- esta , está mal en el group by deberia ser ciudad y no total_ingresos_por_ciudad porque total_ingresos_por_ciudad es una columna que no existe y tambien por ser un conjunto de valores y no es escalar, cuando es escalar si puedo usar el alias.
-- No puedo usar este alias total_ingresos_por_ciudad porque no existe en mi tabla y por que es conjunto de valores osea que se tiene que sumar varios valores y no son valores escalares osea que solo es un valor.
-- Esta consulta calculará la suma de los ingresos por ciudad desde la tabla informe_ventas, mostrando el total de ingresos para cada ciudad presente en la tabla.
SELECT ciudad, SUM(ingresos) AS total_ingresos_por_ciudad
FROM informe_ventas
GROUP BY total_ingresos_por_ciudad;



-- Esta sentencia cuenta la cantidad de publicaciones por año, extrayendo el año de la fecha de publicación y luego agrupando los resultados por año.
SELECT YEAR(fecha_de_publicacion) AS post_year, COUNT(*) AS post_quanty
FROM posts
GROUP BY post_year;



-- La sentencia cuenta la cantidad de publicaciones por mes, mostrando el nombre del mes extraído de la fecha de publicación y agrupando los resultados por mes.
SELECT MONTHNAME(fecha_de_publicacion) AS post_month, COUNT(*) AS post_quanty
FROM posts
GROUP BY post_month;



-- Esta sentencia cuenta la cantidad de publicaciones por mes y estado (estatus), mostrando el nombre del mes extraído de la fecha de publicación, agrupando los resultados por estado y mes.
SELECT estatus,MONTHNAME(fecha_de_publicacion) AS post_month, COUNT(*) AS post_quanty
FROM posts
GROUP BY estatus,post_month;






SELECT COURSOSID, COUNT(STUDENTID)
FROM STUDENT_COURSE
GROUP BY COURSOSID
HAVING COUNT(STUDENTID) > 1





