<?php
require_once 'includes/SubjectModel.php';
session_start();

// ✅ Kontrola přihlášení
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

// ✅ Zjistíme, jestli je admin
$isAdmin = isset($_SESSION['is_admin']) && $_SESSION['is_admin'] == 1;

// ✅ Pokud je admin a poslal třídu přes GET, uložíme ji do session + DB
if ($isAdmin && isset($_GET['selected_class'])) {
    $selectedClass = $_GET['selected_class'];
    $_SESSION['selected_class'] = $selectedClass;

    // 💾 Uložíme vybranou třídu admina i do DB (uživatelův sloupec `class`)
    require_once 'includes/Database.php';
    $db = new Database();
    $db->query("UPDATE users SET class = ? WHERE id = ?", [$selectedClass, $_SESSION['user_id']]);
}

// ✅ Určení třídy – buď podle výběru admina, nebo podle přihlášeného uživatele
$class = $isAdmin
    ? ($_SESSION['selected_class'] ?? 'kvinta')
    : strtolower($_SESSION['class']);

// ✅ Cesta k šabloně pro danou třídu
$renderFile = "includes/render/render-$class.php";

// ✅ Kontrola existence šablony
if (!file_exists($renderFile)) {
    die("Zobrazení pro třídu '" . htmlspecialchars($class) . "' zatím není připraveno.");
}

// ✅ Hlavička
include 'templates/header.php';

// ✅ Výpis chyby z validace submit.php
if (isset($_SESSION['submit_error'])): ?>
    <div class="alert alert-danger container fw-bold">
        <?= htmlspecialchars($_SESSION['submit_error']) ?>
    </div>
    <?php unset($_SESSION['submit_error']); ?>
<?php endif; ?>

<!-- ✅ Výběr třídy (pouze pro admina) -->
<?php if ($isAdmin): ?>
    <form method="get" class="mb-4 container">
        <label for="selected_class" class="form-label fw-bold">Zvolte třídu:</label>
        <select name="selected_class" id="selected_class" class="form-select w-auto d-inline-block" onchange="this.form.submit()">
            <?php
            $classOptions = [
                'prima' => 'Prima',
                'sekunda' => 'Sekunda',
                'tercie' => 'Tercie',
                'kvarta' => 'Kvarta',
                'kvinta' => 'Kvinta',
                'sexta' => 'Sexta',
                'septima' => 'Septima',
                'oktava' => 'Oktáva',
                'rocnik1' => '1. ročník',
                'rocnik2' => '2. ročník',
                'rocnik3' => '3. ročník',
                'rocnik4' => '4. ročník',
            ];
            foreach ($classOptions as $key => $label):
                $selected = ($class === $key) ? 'selected' : '';
                echo "<option value=\"$key\" $selected>$label</option>";
            endforeach;
            ?>
        </select>
    </form>
<?php endif; ?>

<!-- ✅ Šablona konkrétní třídy -->
<?php include $renderFile; ?>

<!-- ✅ Patička -->
<?php include 'templates/footer.php'; ?>