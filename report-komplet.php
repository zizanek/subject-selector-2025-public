<?php
require_once 'includes/Database.php';
session_start();

// ✅ Kontrola přihlášení a oprávnění
if (!isset($_SESSION['user_id']) || !isset($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
    header("Location: login.php");
    exit;
}

$db = new Database();

// ✅ Možnosti tříd pro výběr
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

// ✅ Hlavička
include 'templates/header.php';
?>

<div class="container mt-4">
    <div class="mb-3">
        <a href="index.php" class="btn btn-outline-secondary">Home</a>
        <a href="report-tridy.php" class="btn btn-outline-secondary"><i class="bi bi-border-all"></i> Report - studenti</a>
        <a href="report-predmety.php" class="btn btn-outline-secondary"><i class="bi bi-bar-chart-steps"></i> Report - předměty</a>
        <a href="report-komplet.php" class="btn btn-outline-secondary"><i class="bi bi-table"></i> Report - komplet</a>
        <a href="report-kontrola.php" class="btn btn-outline-secondary"><i class="bi bi-eyeglasses"></i> Report - kontrola</a>
    </div>

    <h2 class="mb-4"><i class="bi bi-table"></i> Kompletní report výběrů (✅ = zvolený předmět)</h2>

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
        <h4 class="mb-3">Třída: <?= htmlspecialchars($classOptions[$selectedClass] ?? $selectedClass) ?></h4>

        <?php
        $tableMain = 'subjects_' . $selectedClass;
        $tableOpt = $tableMain . '_optional';

        $mainSubjects = [];
        $optionalSubjects = [];

        if ($db->tableExists($tableMain)) {
            $mainSubjects = $db->query("SELECT DISTINCT name FROM `$tableMain`")->fetchAll(PDO::FETCH_COLUMN);
        }

        if ($db->tableExists($tableOpt)) {
            $optionalSubjects = $db->query("SELECT DISTINCT name FROM `$tableOpt`")->fetchAll(PDO::FETCH_COLUMN);
        }

        sort($mainSubjects);
        sort($optionalSubjects);

        $allSubjects = array_merge($mainSubjects, $optionalSubjects);

        $students = $db->query("SELECT id, name, surname FROM users WHERE class = ? ORDER BY surname, name", [$selectedClass])->fetchAll(PDO::FETCH_ASSOC);
        
        $studentCount = count($students);
        // výpis počtu studentů
        echo "<p><strong>Počet studentů v seznamu:</strong> $studentCount</p>";

        $matrix = [];
        $summary = array_fill_keys($allSubjects, 0);

        foreach ($students as $student) {
            $userId = $student['id'];
            $matrix[$userId] = array_fill_keys($allSubjects, false);

            $picked = $db->query("SELECT subject_name FROM user_choices WHERE user_id = ? AND subject_class = ?", [$userId, $selectedClass])->fetchAll(PDO::FETCH_COLUMN);
            foreach ($picked as $subject) {
                if (isset($matrix[$userId][$subject]) && !$matrix[$userId][$subject]) {
                    $matrix[$userId][$subject] = true;
                    $summary[$subject]++;
                }
            }

            $pickedOpt = $db->query("SELECT subject_name FROM user_choices_optional WHERE user_id = ? AND subject_class = ?", [$userId, $selectedClass])->fetchAll(PDO::FETCH_COLUMN);
            foreach ($pickedOpt as $subject) {
                if (isset($matrix[$userId][$subject]) && !$matrix[$userId][$subject]) {
                    $matrix[$userId][$subject] = true;
                    $summary[$subject]++;
                }
            }
        }
        ?>

        <?php if (count($students) > 0): ?>
            <div class="table-responsive">
                <table class="table table-bordered table-sm align-middle text-center">
                    <thead class="table-light">
                        <tr>
                            <th class="align-middle text-center">Příjmení</th>
                            <th class="align-middle text-center">Jméno</th>
                            <?php foreach ($allSubjects as $subject): ?>
                                <th style="
                                    writing-mode: vertical-rl;
                                    text-orientation: mixed;
                                    vertical-align: middle;
                                    text-align: center;
                                    white-space: nowrap;
                                    padding: 10px 4px;
                                ">
                                    <?= htmlspecialchars($subject) ?>
                                </th>
                            <?php endforeach; ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($students as $student): ?>
                            <tr>
                                <td><?= htmlspecialchars($student['surname']) ?></td>
                                <td><?= htmlspecialchars($student['name']) ?></td>
                                <?php foreach ($allSubjects as $subject): ?>
                                    <td><?= $matrix[$student['id']][$subject] ? '✅' : '' ?></td>
                                <?php endforeach; ?>
                            </tr>
                        <?php endforeach; ?>
                        <tr class="fw-bold table-secondary">
                            <td colspan="2">Součet</td>
                            <?php foreach ($allSubjects as $subject): ?>
                                <td><?= $summary[$subject] ?></td>
                            <?php endforeach; ?>
                        </tr>
                    </tbody>
                </table>
            </div>
        <?php else: ?>
            <div class="alert alert-info">V této třídě nejsou zatím žádní studenti.</div>
        <?php endif; ?>
    <?php endif; ?>
</div>

<?php include 'templates/footer.php'; ?>
