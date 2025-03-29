USE mi_garaje;

-- Esto biene de mi archivo geolocalizacion.sql
-- Esto es para insertar la coordenada geografica.Nota: pon todas las variables de tu tabla para ingresar esto de una vez
-- Despues del @ esta la latitud y la longitud y 17z es el ZOOM puedo cambiarlo siquiero el zoom.Mientras mayor sea el numero del zoom mas se hace grande el mapa o mas se acerca a mi ubicacion.
-- https://www.google.com/maps/place/Solano+846,+Quito+170136/@-0.2177536,-78.4943237,17z/data=!3m1!4b1!4m6!3m5!1s0x91d59a1dd31ae94d:0xdbd88bf2bd593042!8m2!3d-0.217759!4d-78.4917488!16s%2Fg%2F11hbqc7nvl?entry=ttu
-- Esto es para insertar la coordenada geografica.Nota: pon todas las variables de tu tabla para ingresar esto de una vez .Primero es la longitud y despues la latitud, en google maps esta al revez la cual ingresarlo asi no seria lo correcto.
-- INSERT INTO `clientes` (id, direccion, saldoTotal)
-- VALUES 
-- (382, POINT(-78.4924096,-0.2179171), 405.00), 
-- (383, POINT(-78.4883072 ,-0.2146885), 650.00); 




-- Pagina de funciones para la geolocalizacion : https://mariadb.com/kb/en/geographic-functions/
-- Entro a Geometry Constructors
-- LINESTRING nos permite guardar una linea en la base de datos
-- 	MULTILINESTRING nos permite guardar multiples lineas
-- MULTIPOINT nos permite guardar multiples puntos.
-- Ahora entro a Geometry Relations
-- ST_CONTAINS nos dice si una figura geometrica esta dentro de otra figura geometrica
-- ST_DISTANCE es para calcular la distancia entre dos puntos.





-- Esto es para consultar la latitud y la longitud osea la direccion
-- SELECT ST_X(direccion) AS latitud, ST_Y(direccion) AS longitud
-- FROM clientes
-- WHERE id = 1;















-- INSERT INTO `ingresos` (`id`,`70 % Nec.Basic`,`10 % invertir`,`20 % deudas`,`ingresos`,`gastos`,`Fecha`,`dia`,`motivoDeMisGastos`)
-- VALUES 
-- (38,"5.00","13.00","52.00", "130.00","170.00","2024-05-12","LUNES","Soy el mejor");


-- 70 % Nec.Basic
-- 10 % invertir
-- 20 % deudas





-- INSERT INTO `clientes` (id, nombre, apellido, numeroDeTelefono, direccion, primerAbono,segundoAbono, saldoTotal, comentarios)
-- VALUES 
-- (6, 'amadeo', 'llados', '099 987 ', POINT(-78.48636, -0.20548), 4.37, 4.50, 9.50, 'perra maldita si puedes');




-- No ingreses datos aqui anda a consulatas_anidadas_IngresosClientes.sql y ahi si ingresa los datos aqui no ingreses nada.
-- INSERT INTO `ingresos_clientes` (id, ingresos_id, clientes_id)
-- VALUES (1,1,1)



-- INSERT INTO `electrodomesticos` (id,tipoDeElectrodomestico,estadoDelElectrodomestico,precioDeLaReparacion,color,numeroDeSerie,clientes_id)
-- VALUES
-- (7,"Licuadora","Cambiar el embrague",8.50,"verde", "PN:135863-04",6);









-- INSERT INTO `registrodecompras` (id,productosComprados,totalCompra,comentarios)
-- VALUES 
-- (8,"cuadros de licuadora", 35.5 , "PERRA MALDITA SI PUEDES CABRON");









-- INSERT INTO `copiasdellaves` (id,`1510`,`1000`, numeroDeCopias)
-- VALUES (32,6,7,13);




INSERT INTO `metas_semanales` (id , objetivos_diarios , objetivos_semanales , comentarios , objetivos_mensuales , banco)
VALUES (2, 6.50 ,20 , 'miercoles 26/06/2024 a Miercoles 03/07/2024
 objetivos semanales' ,80 ,36.42);






-- normailazacion de la base de datos
INSERT INTO direcciones (direccion, ciudad, codigo_postal)
SELECT direccion, ciudad, codigo_postal FROM tabla_original;

INSERT INTO clientes (nombre, direccion_id)
SELECT nombre, direccion_id FROM tabla_original;
-- esto es para transferir todos los datos que tenia en la tabla sin normalizar a la tabla ya normalizada verdad

-- ChatGPT Plus
-- ChatGPT
-- ¡Exactamente, mi amor! 😊



