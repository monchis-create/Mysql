<?php
$servername = "localhost";
$username = "root";
$password = "MantisBorrachonTaichi1717."; // por defecto, XAMPP no tiene contraseña para el usuario root
$dbname = "mi_garaje";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
echo "Conexión exitosa";
?>
