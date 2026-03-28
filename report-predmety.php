<?php
require_once 'includes/Database.php';
session_start();

// ✅ Kontrola přihlášení a oprávnění
if (!isset($_SESSION['user_id']) || !isset($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
    header("Location: login.php");
    exit;
}

$db = new Database();

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

$selectedClass = $_GET['report_class'] ?? null;

include 'templates/header.php';
?>

<div class="container mt-4">
    <!-- Tlačítko pro report -->
    <div class="mb-3">
        <a href="index.php" class="btn btn-outline-secondary">Home</a>
        <a href="report-tridy.php" class="btn btn-outline-secondary"><i class="bi bi-border-all"></i> Report - studenti</a>
        <a href="report-predmety.php" class="btn btn-outline-secondary"><i class="bi bi-bar-chart-steps"></i> Report - předměty</a>
        <a href="report-komplet.php" class="btn btn-outline-secondary"><i class="bi bi-table"></i> Report - komplet</a>
        <a href="report-kontrola.php" class="btn btn-outline-secondary"><i class="bi bi-eyeglasses"></i> Report - kontrola</a>
    </div>
    <h2 class="mb-4"><i class="bi bi-bar-chart-steps"></i> Report podle předmětů</h2>

    <form method="get" class="mb-4">
        <label for="report_class" class="form-label fw-bold">Zvolte třídu:</label>
        <select name="report_class" id="report_class" class="form-select w-auto d-inline-block" onchange="this.form.submit()">
            <option value="">-- Vyberte třídu --</option>
            <?php foreach ($classOptions as $key => $label): ?>
                <option value="<?= $key ?>" <?= $selectedClass === $key ? 'selected' : '' ?>><?= $label ?></option>
            <?php endforeach; ?>
        </select>
    </form>

    <?php if ($selectedClass): ?>
        <h4 class="mb-4 text-primary">Zvolená třída: <?= htmlspecialchars($classOptions[$selectedClass] ?? ucfirst($selectedClass)) ?></h4>

        <?php
        $subjectTable = "subjects_" . $selectedClass;
        $optionalTable = $subjectTable . "_optional";

        // 🔍 Načti volitelné předměty (seřazené podle názvu a ID)
        $volitelne = $db->query("SELECT id, name FROM `$subjectTable` ORDER BY name ASC, id ASC")->fetchAll(PDO::FETCH_ASSOC);

        // 🔍 Načti nepovinné předměty (seřazené podle názvu a ID)
        $nepovinne = $db->query("SELECT id, name FROM `$optionalTable` ORDER BY name ASC, id ASC")->fetchAll(PDO::FETCH_ASSOC);
        ?>

        <h4 class="mt-4 mb-3">📌 Volitelné předměty</h4>
        <?php if (empty($volitelne)): ?>
            <div class="alert alert-warning">Žádné volitelné předměty v této třídě.</div>
        <?php else: ?>
            <?php foreach ($volitelne as $predmet): ?>
                <?php
                $studenti = $db->query("
                    SELECT u.name, u.surname
                    FROM user_choices c
                    JOIN users u ON u.id = c.user_id
                    WHERE c.subject_class = ? AND c.subject_id = ?
                    ORDER BY u.surname, u.name
                ", [$selectedClass, $predmet['id']])->fetchAll(PDO::FETCH_ASSOC);
                ?>
                <div class="mb-4">
                    <h5><?= htmlspecialchars($predmet['name']) ?> (ID <?= $predmet['id'] ?>)</h5>
                    <div class="mb-2 fw-bold">Zapsáno studentů: <?= count($studenti) ?></div>
                    <?php if (empty($studenti)): ?>
                        <div class="text-muted">Žádní studenti si předmět nezvolili.</div>
                    <?php else: ?>
                        <ul>
                            <?php foreach ($studenti as $s): ?>
                                <li><?= htmlspecialchars($s['surname']) ?> <?= htmlspecialchars($s['name']) ?></li>
                            <?php endforeach; ?>
                        </ul>
                    <?php endif; ?>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>

        <h4 class="mt-5 mb-3">📌 Nepovinné předměty</h4>
        <?php if (empty($nepovinne)): ?>
            <div class="alert alert-warning">Žádné nepovinné předměty v této třídě.</div>
        <?php else: ?>
            <?php foreach ($nepovinne as $predmet): ?>
                <?php
                $studenti = $db->query("
                    SELECT u.name, u.surname
                    FROM user_choices_optional c
                    JOIN users u ON u.id = c.user_id
                    WHERE c.subject_class = ? AND c.subject_id = ?
                    ORDER BY u.surname, u.name
                ", [$selectedClass, $predmet['id']])->fetchAll(PDO::FETCH_ASSOC);
                ?>
                <div class="mb-4">
                    <h5><?= htmlspecialchars($predmet['name']) ?> (ID <?= $predmet['id'] ?>)</h5>
                    <div class="mb-2 fw-bold">Zapsáno studentů: <?= count($studenti) ?></div>
                    <?php if (empty($studenti)): ?>
                        <div class="text-muted">Žádní studenti si předmět nezvolili.</div>
                    <?php else: ?>
                        <ul>
                            <?php foreach ($studenti as $s): ?>
                                <li><?= htmlspecialchars($s['surname']) ?> <?= htmlspecialchars($s['name']) ?></li>
                            <?php endforeach; ?>
                        </ul>
                    <?php endif; ?>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    <?php endif; ?>
</div>

<?php include 'templates/footer.php'; ?>
