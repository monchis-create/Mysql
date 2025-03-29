-- https://www.youtube.com/watch?v=4q97uMfhAbk&list=LL&index=22
-- video de youtube de wix studio el de arriba
-- Esto es un generador de colores  para wix : https://coolors.co/





-- Actualizar datos o cambiar datos.

UPDATE people
SET last_name = 'Chavez', city = 'Merida'
WHERE person_id = 1;








-- Esto esta mal porque cambiaria a todos los habitantes de merida se llamarian Juan y eso es indeseable
UPDATE people
SET first_name = 'Juan'
WHERE city = 'Merida';

-- Esto esta bien seleccionar de que id a que id vas a cambiar el nombre a Juan.Aqui cambias de golpe bastantes ids.
UPDATE people
SET first_name = 'Juan'
WHERE city = 'Merida' AND person_id BETWEEN 100 AND 500;

-- Esto esta bien seleccionas los ids que quieres cambiarlos uno por uno.El in es para actualizar multiples valores.
UPDATE people
SET first_name = 'Juan'
WHERE city = 'Merida' AND person_id IN (id_1, id_2, id_3);

-- Aqui solo cambias un solo id pero es lo correcto hacer esto. El igual es para actualizar un solo valor
UPDATE people
SET first_name = 'Juan'
WHERE city = 'Merida' AND person_id = 'ID_de_la_persona_específica';


-- el valor debe estar entre paréntesis después de IN, incluso si es un solo valor.El in es para actualizar multiples valores.
UPDATE people
SET first_name = 'Juan'
WHERE city = 'Merida' AND person_id IN ('ID_de_la_persona_específica');






-- No utilices un UPDATE sin un WHERE. OJO AHI.
-- Esta sentencia actualiza todos los nombres de la columna 'first_name' en la tabla 'people' estableciéndolos como 'Juan', sin ninguna condición WHERE, lo cual afectaría a todos los registros de esa columna sin restricciones, posiblemente causando cambios no deseados en toda la tabla.
UPDATE people
SET first_name = 'Juan';







