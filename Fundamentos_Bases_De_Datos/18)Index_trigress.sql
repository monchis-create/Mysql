-- CREATE INDEX:
-- CREATE INDEX se utiliza para crear un índice en una tabla de una base de datos. Los índices son estructuras de datos que mejoran la velocidad de las consultas al permitir un acceso más rápido a los registros de una tabla. Cuando se ejecuta una consulta que busca registros basados en los valores de ciertas columnas, el motor de la base de datos puede utilizar un índice asociado a esas columnas para buscar y recuperar los registros de manera más eficiente.

-- Un ejemplo simple de CREATE INDEX sería:

CREATE INDEX idx_lastname ON STUDENTS (LASTNAME);

-- Este comando crea un índice llamado idx_lastname en la tabla STUDENTS, utilizando la columna LASTNAME. Esto sería útil si la tabla tiene un gran número de registros y se ejecutan consultas frecuentes que buscan estudiantes por su apellido.

-- TRIGGER:
-- Un trigger en SQL es un tipo de procedimiento almacenado que se ejecuta automáticamente cuando se produce un evento en una tabla o vista. Los eventos que pueden activar un trigger incluyen inserciones, actualizaciones o eliminaciones de registros en la tabla a la que está asociado el trigger.

-- Los triggers son útiles para aplicar reglas de negocio, mantener la integridad de los datos o realizar acciones adicionales en la base de datos cuando se realizan ciertas operaciones.

-- Aquí hay un ejemplo de cómo crear un trigger en SQL:

CREATE TRIGGER update_salary
AFTER UPDATE ON EMPLOYEES
FOR EACH ROW
BEGIN
    IF NEW.SALARY > OLD.SALARY THEN
        INSERT INTO SALARY_HISTORY (EMPLOYEE_ID, OLD_SALARY, NEW_SALARY, CHANGE_DATE)
        VALUES (NEW.EMPLOYEE_ID, OLD.SALARY, NEW.SALARY, NOW());
    END IF;
END;
-- En este ejemplo, se crea un trigger llamado update_salary que se activa después de que se actualiza una fila en la tabla EMPLOYEES. Cuando el salario de un empleado se actualiza a un valor mayor que el salario anterior, este trigger registra la información relevante en una tabla llamada SALARY_HISTORY.

-- Ambos CREATE INDEX y TRIGGER son herramientas poderosas en SQL que permiten mejorar el rendimiento y la funcionalidad de una base de datos, respectivamente.