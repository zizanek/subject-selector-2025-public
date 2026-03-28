<?php
if (!isset($_SESSION['user_id']) || !isset($_SESSION['class'])) {
    return;
}

require_once __DIR__ . '/../Database.php';

$userId = $_SESSION['user_id'];
$userClass = $_SESSION['class'];

$db = new Database();

// 🟦 Zjištění volitelných předmětů
$main = [];
try {
    $sql = "SELECT subject_name FROM user_choices WHERE user_id = ? AND subject_class = ?";
    $stmt = $db->query($sql, [$userId, $userClass]);
    $main = $stmt->fetchAll(PDO::FETCH_COLUMN);
} catch (Exception $e) {
    $main = [];
}

// 🟨 Zjištění nepovinných předmětů
$optional = [];
try {
    $sql = "SELECT subject_name FROM user_choices_optional WHERE user_id = ? AND subject_class = ?";
    $stmt = $db->query($sql, [$userId, $userClass]);
    $optional = $stmt->fetchAll(PDO::FETCH_COLUMN);
} catch (Exception $e) {
    $optional = [];
}

if (empty($main) && empty($optional)) {
    echo '<div class="alert alert-warning mb-4">Ještě nemáte zvolené žádné předměty.</div>';
} else {
    echo '<div class="mb-4">';
    echo '<h5>📝 Vaše aktuálně zvolené předměty</h5>';
    
    if (!empty($main)) {
        echo '<strong>Volitelné předměty:</strong>';
        echo '<ul>';
        foreach ($main as $name) {
            echo '<li>' . htmlspecialchars($name) . '</li>';
        }
        echo '</ul>';
    }

    if (!empty($optional)) {
        echo '<strong>Nepovinné předměty:</strong>';
        echo '<ul>';
        foreach ($optional as $name) {
            echo '<li>' . htmlspecialchars($name) . '</li>';
        }
        echo '</ul>';
    }

    echo '</div>';
}