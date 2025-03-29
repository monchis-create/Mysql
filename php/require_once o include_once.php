<?php
// Incluir el archivo de conexión
require_once 'conexion.php';

// Ejemplo de consulta SQL
$sql = "SELECT * FROM tabla";
$result = $conn->query($sql);

// Verificar si hubo resultados
if ($result->num_rows > 0) {
    // Iterar sobre los resultados
    while ($row = $result->fetch_assoc()) {
        echo "Nombre: " . $row["nombre"] . "<br>";
    }
} else {
    echo "No se encontraron resultados.";
}

// Cerrar la conexión
$conn->close();
?>

