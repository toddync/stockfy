<?php
class Database {
    private $host = "localhost";
    private $db_name = "rosa_db"; // Substitua pelo nome do seu banco de dados
    private $username = "root"; // Substitua pelo seu usuário do banco de dados
    private $password = ""; // Substitua pela sua senha do banco de dados
    public $conn;

    public function getConnection() {
        $this->conn = null;

        try {
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->exec("set names utf8");
        } catch (PDOException $exception) {
            echo "Connection error: " . $exception->getMessage();
        }

        return $this->conn;
    }
}
?>