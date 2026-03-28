<?php
require_once 'Database.php';

class SubjectModel {
    private $db;
    private $table;

    public function __construct($className) {
        $this->db = new Database();

        // Např. kvinta → subjects_kvinta
        $tableSafe = preg_replace('/[^a-z0-9_]/', '', strtolower(str_replace(' ', '_', $className)));
        $this->table = "subjects_" . $tableSafe;
    }

    public function getAll() {
        // Nepovinné předměty nemají table_row_number → nepoužijeme ORDER BY
        if (str_ends_with($this->table, '_optional')) {
            $sql = "SELECT * FROM `$this->table` ORDER BY id";
        } else {
            $sql = "SELECT * FROM `$this->table` ORDER BY table_row_number, id";
        }
    
        $stmt = $this->db->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}