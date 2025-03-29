USE mi_garaje;

-- el codigo que tengo que ejecutar antes que nada esta de la linea 24 hasta la linea 72
-- Esto es para borrar un TRIGGER : DROP TRIGGER actualizar_Fecha_ingresos;
-- Esto ya esta funcionando no es necesario volver a cargar este archivo desde la terminal


-- Primero inicio secion usuario y contraseña , uso mi base de datos, despues selecciono esto con su respectivo id , esto es para la tabla clientes : 
-- SELECT id,nombre,apellido,numeroDeTelefono,registroDelPrimerAbono,registroDelSegundoAbono,primerAbono,segundoAbono,saldoTotal,status,registroDeCompras_id FROM `clientes` WHERE id = 372;
-- despues va lo que esta abajo
-- Esto es para actualizar datos desde la terminal : UPDATE `clientes` SET segundoAbono = 154.00 WHERE id = 372;
-- Cuando son numeros es sin comillas y cuando son letras va con comillas.


-- Esto es el resumen del comentario de arriba
-- Consulto datos de un cliente con el ID 372.
-- SELECT * FROM `clientes` WHERE id = 372;

-- Actualizo el segundo abono del cliente con ID 372 a 154.00.
-- UPDATE `clientes` SET segundoAbono = 154.00 WHERE id = 372;



-- el codigo que tengo que ejecutar antes que nada esta de la linea 24 hasta la linea 72
-- Para ejecutar estos tiggers tengo que crear primero la columna ultimo registro en todas estas tablas de cada tigger y el codigo que tengo que ejecutar y agregar la columna que necesito ultimoRegistro esta en 2)alter_table.sql
-- Este codigo ya no es necesario utilizarlo dejalo ahi por si a caso no lo borres.
-- CREATE TRIGGER actualizar_clientes
-- BEFORE UPDATE
-- ON `clientes`
-- FOR EACH ROW
-- SET NEW.ultimoRegistro = NOW();


-- Este codigo ya no es necesario utilizarlo dejalo ahi por si a caso no lo borres.
-- CREATE TRIGGER actualizar_Fecha_De_Entrega
-- BEFORE UPDATE
-- ON `electrodomesticos`
-- FOR EACH ROW
-- SET NEW.ultimoRegistro = NOW();


-- Este codigo ya no es necesario utilizarlo dejalo ahi por si a caso no lo borres.
-- CREATE TRIGGER actualizar_Fecha_ingresos
-- BEFORE UPDATE
-- ON `ingresos`
-- FOR EACH ROW
-- SET NEW.ultimoRegistro = NOW();


-- Este codigo ya no es necesario utilizarlo dejalo ahi por si a caso no lo borres.
-- CREATE TRIGGER actualizar_Fecha_ingresos_clientes
-- BEFORE UPDATE
-- ON `ingresos_clientes`
-- FOR EACH ROW
-- SET NEW.ultimoRegistro = NOW();


-- Este codigo ya no es necesario utilizarlo dejalo ahi por si a caso no lo borres.
-- CREATE TRIGGER actualizar_Fecha_registro_de_compras
-- BEFORE UPDATE
-- ON `registrodecompras`
-- FOR EACH ROW
-- SET NEW.ultimoRegistro = NOW();



-- Este codigo ya no es necesario utilizarlo dejalo ahi por si a caso no lo borres.
-- CREATE TRIGGER actualizar_Fecha_copias_de_llaves
-- BEFORE UPDATE
-- ON `copiasdellaves`
-- FOR EACH ROW
-- SET NEW.ultimoRegistro = NOW();




-- Este codigo ya no es necesario utilizarlo dejalo ahi por si a caso no lo borres.
-- CREATE TRIGGER actualizar_metas_semanales
-- BEFORE UPDATE
-- ON `metas_semanales`
-- FOR EACH ROW
-- SET NEW.ultimoRegistro = NOW();


-- Este codigo ya no es necesario utilizarlo dejalo ahi por si a caso no lo borres.
CREATE TRIGGER actualizar_clientes_activos
BEFORE UPDATE
ON `clientes_activos`
FOR EACH ROW
SET NEW.segundaActualizacion = NOW();





-- -- Esta consulta es para ingresar los datos en php my admin y se me ingrese mi direccion.En sql de php my admin.
-- UPDATE clientes
-- SET direccion = ST_GeomFromText('POINT(-78.4920744 -0.215139)')
-- WHERE id = 1;

-- -- Esto es para consultar la latitud y la longitud osea la direccion
c


-- EJEMPLO:
-- UPDATE clientes
-- SET nombre = 'papanatas', apellido = 'soyunganador', primerAbono = 67 , segundoAbono = 96, numeroDeTelefono = '222 695 6544'
-- WHERE id = 5;


-- UPDATE `ingresos`
-- SET gastos = 999.99
-- WHERE id = 38;



-- UPDATE `copiasdellaves`
-- SET  `1000` = 5
-- WHERE id = 32;




-- UPDATE `electrodomesticos`
-- SET tipoDeElectrodomestico = 'Batidora'
-- WHERE id = 6;




-- UPDATE `registrodecompras`
-- SET comentarios = "Yo soy mejor que el mejor perra maldita pelea chuchetumadre hasta ganar."
-- WHERE id = 8;




-- UPDATE `metas_semanales`
-- SET banco = 36.42
-- WHERE id = 1;









