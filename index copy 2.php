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

// ✅ Pokud je admin a poslal třídu přes GET, uložíme ji do session
if ($isAdmin && isset($_GET['selected_class'])) {
    $_SESSION['selected_class'] = $_GET['selected_class'];
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

// ✅ Výběr třídy (pouze pro admina)
if ($isAdmin):
?>
    <form method="get" class="mb-4 container">
        <label for="selected_class" class="form-label fw-bold">Zvolte třídu:</label>
        <select name="selected_class" id="selected_class" class="form-select w-auto d-inline-block" onchange="this.form.submit()">
            <option value="prima" <?= $class === 'prima' ? 'selected' : '' ?>>Prima</option>
            <option value="sekunda" <?= $class === 'sekunda' ? 'selected' : '' ?>>Sekunda</option>
            <option value="tercie" <?= $class === 'tercie' ? 'selected' : '' ?>>Tercie</option>
            <option value="kvarta" <?= $class === 'kvarta' ? 'selected' : '' ?>>Kvarta</option>
            <option value="kvinta" <?= $class === 'kvinta' ? 'selected' : '' ?>>Kvinta</option>
            <option value="sexta" <?= $class === 'sexta' ? 'selected' : '' ?>>Sexta</option>
            <option value="septima" <?= $class === 'septima' ? 'selected' : '' ?>>Septima</option>
            <option value="oktava" <?= $class === 'oktava' ? 'selected' : '' ?>>Oktáva</option>
            <option value="rocnik1" <?= $class === 'rocnik1' ? 'selected' : '' ?>>1. ročník</option>
            <option value="rocnik2" <?= $class === 'rocnik2' ? 'selected' : '' ?>>2. ročník</option>
            <option value="rocnik3" <?= $class === 'rocnik3' ? 'selected' : '' ?>>3. ročník</option>
            <option value="rocnik4" <?= $class === 'rocnik4' ? 'selected' : '' ?>>4. ročník</option>
            <!-- můžeš přidat další -->
        </select>
    </form>
<?php
endif;

// ✅ Šablona konkrétní třídy
include $renderFile;

// ✅ Patička
include 'templates/footer.php';