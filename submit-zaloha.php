<?php
ini_set('log_errors', 1);
ini_set('error_log', __DIR__ . '/error_log.txt');
error_reporting(E_ALL);
session_start();
require_once 'includes/Database.php';

// Kontrola přihlášení
if (!isset($_SESSION['user_id']) || !isset($_SESSION['class']) || !isset($_SESSION['user_email'])) {
    header('Location: login.php');
    exit;
}

$userId = $_SESSION['user_id'];
$userEmail = $_SESSION['user_email'];
$class = $_SESSION['class']; // např. kvinta
$db = new Database();

// Volitelné předměty (radio buttons)
$chosenIds = [];
foreach ($_POST as $key => $value) {
    if (str_starts_with($key, 'row_')) {
        $chosenIds[] = (int)$value;
    }
}

$subjects = [];
if (!empty($chosenIds)) {
    $placeholders = implode(',', array_fill(0, count($chosenIds), '?'));
    $params = $chosenIds;
    $subjectTable = "subjects_" . preg_replace('/[^a-z0-9_]/', '', strtolower($class));

    $stmt = $db->query("SELECT id, name, hours FROM `$subjectTable` WHERE id IN ($placeholders)", $params);
    $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // 🧠 Ověření vícehodinových předmětů (pro určité třídy)
    $checkClasses = ['sexta', 'rocnik2', 'rocnik3', 'septima', 'oktava', 'rocnik4'];
    if (in_array(strtolower($class), $checkClasses)) {
        $grouped = [];

        foreach ($subjects as $s) {
            $grouped[$s['name']][] = $s;
        }

        foreach ($grouped as $name => $instances) {
            $expected = $instances[0]['hours'];
            $actual = count($instances);

            if ($expected > 1 && $actual < $expected) {
                $_SESSION['submit_error'] = "Výběr předmětu '$name' NEBYL KOMPLETNÍ – je potřeba vybrat všechny jeho části ({$expected}).";
                header("Location: index.php");
                exit;
            }
        }
    }
}

// ✅ Teprve teď smažeme staré záznamy
$db->query("DELETE FROM user_choices WHERE user_id = ? AND subject_class = ?", [$userId, $class]);
$db->query("DELETE FROM user_choices_optional WHERE user_id = ? AND subject_class = ?", [$userId, $class]);

// ✅ Uložení volitelných předmětů
foreach ($subjects as $s) {
    $db->query(
        "INSERT INTO user_choices (user_id, user_email, subject_id, subject_name, subject_class) VALUES (?, ?, ?, ?, ?)",
        [$userId, $userEmail, $s['id'], $s['name'], $class]
    );
}

// Nepovinné předměty (checkboxy)
if (!empty($_POST['optional_subjects']) && is_array($_POST['optional_subjects'])) {
    $optionalIds = array_map('intval', $_POST['optional_subjects']);
    $optTable = "subjects_" . preg_replace('/[^a-z0-9_]/', '', strtolower($class)) . "_optional";

    $placeholders = implode(',', array_fill(0, count($optionalIds), '?'));
    $stmt = $db->query("SELECT id, name FROM `$optTable` WHERE id IN ($placeholders)", $optionalIds);
    $optionalSubjects = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($optionalSubjects as $opt) {
        $db->query(
            "INSERT INTO user_choices_optional (user_id, user_email, subject_id, subject_name, subject_class) VALUES (?, ?, ?, ?, ?)",
            [$userId, $userEmail, $opt['id'], $opt['name'], $class]
        );
    }
}

// ✅ Přesměrování na potvrzení
header("Location: confirmation.php?ok=1");
exit;
