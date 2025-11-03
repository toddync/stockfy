<?php

class Database {
    private static $host = 'localhost';
    private static $db_name = 'rosa_db'; // Nome do banco de dados
    private static $username = 'root'; // Usuário do banco de dados
    private static $password = ''; // Senha do banco de dados
    private static $conn = null; // Conexão estática

    public static function getInstance() {
        if (self::$conn === null) {
            try {
                self::$conn = new PDO("mysql:host=" . self::$host . ";dbname=" . self::$db_name, self::$username, self::$password);
                self::$conn->exec("set names utf8");
                self::$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch(PDOException $exception) {
                // Em um ambiente de produção, você registraria o erro em vez de exibi-lo diretamente
                error_log("Connection error: " . $exception->getMessage());
                die("Erro de conexão com o banco de dados.");
            }
        }
        return self::$conn;
    }
}

?>