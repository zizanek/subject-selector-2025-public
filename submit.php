<?php
// 🔧 Logování chyb do souboru
ini_set('log_errors', 1);
ini_set('error_log', __DIR__ . '/error_log.txt');
error_reporting(E_ALL);

session_start();
require_once 'includes/Database.php';

// ✅ Kontrola přihlášení
if (!isset($_SESSION['user_id']) || !isset($_SESSION['class']) || !isset($_SESSION['user_email'])) {
    header('Location: login.php');
    exit;
}

$userId = $_SESSION['user_id'];
$userEmail = $_SESSION['user_email'];
$class = $_SESSION['class']; // např. kvinta
$db = new Database();

// ✅ Získání ID vybraných předmětů
$chosenIds = [];
foreach ($_POST as $key => $value) {
    if (str_starts_with($key, 'row_')) {
        $chosenIds[] = (int)$value;
    }
}

// ✅ Předmětová tabulka
$subjectTable = "subjects_" . preg_replace('/[^a-z0-9_]/', '', strtolower($class));

// 🧠 Zjistíme, zda daná třída má vícehodinové předměty
$checkClasses = ['sexta', 'rocnik2', 'rocnik3', 'septima', 'oktava', 'rocnik4'];
$requiresHoursValidation = in_array(strtolower($class), $checkClasses);

// ✅ Načtení dat o předmětech
$subjects = [];
if (!empty($chosenIds)) {
    $placeholders = implode(',', array_fill(0, count($chosenIds), '?'));
    $params = $chosenIds;

    // 🧠 Výběr polí podle potřeby
    $fields = $requiresHoursValidation ? 'id, name, hours' : 'id, name';

    try {
        $stmt = $db->query("SELECT $fields FROM `$subjectTable` WHERE id IN ($placeholders)", $params);
        $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        error_log("Chyba při načítání předmětů z tabulky `$subjectTable`: " . $e->getMessage());
        $_SESSION['submit_error'] = "Chyba při zpracování výběru předmětů.";
        header("Location: index.php");
        exit;
    }

    // ✅ Ověření vícehodinových předmětů
    if ($requiresHoursValidation) {
        $grouped = [];

        foreach ($subjects as $s) {
            $grouped[$s['name']][] = $s;
        }

        foreach ($grouped as $name => $instances) {
            $expected = $instances[0]['hours'] ?? 1;
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
try {
    $db->query("DELETE FROM user_choices WHERE user_id = ? AND subject_class = ?", [$userId, $class]);
    $db->query("DELETE FROM user_choices_optional WHERE user_id = ? AND subject_class = ?", [$userId, $class]);
} catch (Exception $e) {
    error_log("Chyba při mazání starých záznamů: " . $e->getMessage());
}

// ✅ Uložení volitelných předmětů
foreach ($subjects as $s) {
    $db->query(
        "INSERT INTO user_choices (user_id, user_email, subject_id, subject_name, subject_class) VALUES (?, ?, ?, ?, ?)",
        [$userId, $userEmail, $s['id'], $s['name'], $class]
    );
}

// ✅ Zpracování nepovinných předmětů
if (!empty($_POST['optional_subjects']) && is_array($_POST['optional_subjects'])) {
    $optionalIds = array_map('intval', $_POST['optional_subjects']);
    $optTable = "subjects_" . preg_replace('/[^a-z0-9_]/', '', strtolower($class)) . "_optional";

    $placeholders = implode(',', array_fill(0, count($optionalIds), '?'));

    try {
        $stmt = $db->query("SELECT id, name FROM `$optTable` WHERE id IN ($placeholders)", $optionalIds);
        $optionalSubjects = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($optionalSubjects as $opt) {
            $db->query(
                "INSERT INTO user_choices_optional (user_id, user_email, subject_id, subject_name, subject_class) VALUES (?, ?, ?, ?, ?)",
                [$userId, $userEmail, $opt['id'], $opt['name'], $class]
            );
        }
    } catch (Exception $e) {
        error_log("Chyba při ukládání nepovinných předmětů: " . $e->getMessage());
    }
}

// ✅ Přesměrování na potvrzení
header("Location: confirmation.php?ok=1");
exit;
