WITH Averagesalaries AS (
    SELECT d.DepartamentName , AVG(e.Salary) AS Avgsalaries
    FROM employes e
    JOIN Departaments d ON e.DepartamentsID = d.DepartamentsID
    GROUP BY d.DepartamentName
)
SELECT DepartamentName, Avgsalaries
FROM Averagesalaries
WHERE Avgsalaries > 65000;


-- Este código SQL se utiliza en la vida real para analizar y comparar salarios promedio en diferentes departamentos de una empresa. Ayuda a identificar áreas donde los salarios están por encima de un umbral específico (en este caso, $65,000). Esto puede ser útil para:

-- Gestión empresarial: Comparar departamentos para ajustar políticas salariales.
-- Presupuesto: Identificar departamentos con mayores costos salariales.
-- Decisiones estratégicas: Detectar posibles desigualdades o áreas con alta inversión en talento.
-- Es clave para tomar decisiones informadas en recursos humanos y administración financiera.






WITH cte_name AS (
    -- subconsulta
    SELECT colunmna 1 , columana 2
    FROM name_table
    WHERE condicion
)
-- consulta principal que utilizas en la cte
SELECT columna 1 , columna 2 
FROM cte_name
WHERE condicion;