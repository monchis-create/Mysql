


-- Esta esta bien , porque tengo las sentencia WHERE
DELETE FROM people
WHERE person_id = 1;

-- DANGER : No ejecutes este DELETE sin utilizar el WHERE . Huye de esta sentencia no lo hagas,no lo ejecutes este tipo de codigo, porque me va a borrar toda mi tabla absolutamente toda mi tabla.
DELETE FROM people;


-- Esto parece ser un respaldo porsi algo sale mal.
-- DELETE FROM Usuarios WHERE id = 3;
BEGIN TRANSACTION;
DELETE FROM usuarios WHERE id = 3;
-- Si algo sale mal, puedes deshacer con:
ROLLBACK;
-- Si todo está bien, confirma con:
COMMIT;
