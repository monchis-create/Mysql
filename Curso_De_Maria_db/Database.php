<?php
class Database {
    protected $host = '127.0.0.1';
    protected $db = 'mi_garaje';  // Cambia esto por el nombre de tu base de datos
    protected $name = 'root';
    protected $pass = 'MantisBorrachonTaichi1717.';
    protected $conn;
    private static $settings = array(
        PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'
    );

    public function __construct() {
        try {
            $this->conn = new PDO("mysql:host={$this->host};dbname={$this->db}", $this->name, $this->pass, self::$settings);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo 'Connection failed: ' . $e->getMessage();
        }
    }
}
