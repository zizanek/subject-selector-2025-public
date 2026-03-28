<?php
require_once 'config.php';

class Database {
    private $pdo;

    public function __construct() {
        $dsn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=utf8mb4";
        try {
            $this->pdo = new PDO($dsn, DB_USER, DB_PASS);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Chyba připojení k databázi: " . $e->getMessage());
        }
    }

    public function query($sql, $params = []) {
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt;
    }

    // public function tableExists($tableName) {
    //     try {
    //         $stmt = $this->pdo->query("SHOW TABLES LIKE " . $this->pdo->quote($tableName));
    //         return $stmt->rowCount() > 0;
    //     } catch (PDOException $e) {
    //         return false;
    //     }
    // }

    public function tableExists($tableName) {
        try {
            $result = $this->pdo->query("SHOW TABLES LIKE " . $this->pdo->quote($tableName));
            return $result !== false && $result->rowCount() > 0;
        } catch (PDOException $e) {
            return false;
        }
    }
}