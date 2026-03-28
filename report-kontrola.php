<?php
require_once 'includes/Database.php';
session_start();

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

<style>
    .bg-light-danger {
        background-color: rgba(220, 53, 69, 0.1); /* Bootstrap danger color with transparency */
    }
</style>

<div class="container mt-4">
    <div class="mb-3">
        <a href="index.php" class="btn btn-outline-secondary">Home</a>
        <a href="report-tridy.php" class="btn btn-outline-secondary"><i class="bi bi-border-all"></i> Report - studenti</a>
        <a href="report-predmety.php" class="btn btn-outline-secondary"><i class="bi bi-bar-chart-steps"></i> Report - předměty</a>
        <a href="report-komplet.php" class="btn btn-outline-secondary"><i class="bi bi-table"></i> Report - komplet</a>
        <a href="report-kontrola.php" class="btn btn-outline-secondary"><i class="bi bi-eyeglasses"></i> Report - kontrola</a>
    </div>

    <h2 class="mb-4"><i class="bi bi-eyeglasses"></i> Kontrola registrací a výběrů</h2>

    <form method="get" class="mb-4">
        <label for="report_class" class="form-label fw-bold">Zvolte budoucí třídu:</label>
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
        $studentsExpected = $db->query("SELECT * FROM students_expected WHERE class_next_year = ? ORDER BY surname, name", [$selectedClass])->fetchAll(PDO::FETCH_ASSOC);
        $totalCount = count($studentsExpected);
        ?>

        <?php if ($totalCount > 0): ?>
            <p><strong>Počet studentů v seznamu:</strong> <?= $totalCount ?></p>
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-sm align-middle text-center">
                <thead class="table-light">
                    <tr>
                        <th>Příjmení</th>
                        <th>Jméno</th>
                        <th>Třída - aktuální</th>
                        <th>Třída - příští rok</th>
                        <th>Registrace</th>
                        <th>Registrace do špatné třídy</th>
                        <th>Volitelné předměty</th>
                        <th>Nepovinné předměty</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($studentsExpected as $student): ?>
                        <?php
                        // Registrace do správné třídy
                        $registered = $db->query(
                            "SELECT id FROM users WHERE name = ? AND surname = ? AND class = ?",
                            [$student['name'], $student['surname'], $student['class_next_year']]
                        )->fetchColumn();

                        // Jakákoliv registrace (i do špatné)
                        $wrongClass = $db->query(
                            "SELECT class FROM users WHERE name = ? AND surname = ?",
                            [$student['name'], $student['surname']]
                        )->fetchColumn();

                        $wrongClassText = '';
                        $isWrongClass = false;

                        if (!$registered && $wrongClass && $wrongClass !== $student['class_next_year']) {
                            $isWrongClass = true;
                            $wrongClassText = 'ANO - ' . htmlspecialchars($wrongClass);
                        }

                        $hasVolitelne = 'NE';
                        $hasNepovinne = 'NE';

                        if ($registered) {
                            $hasVolitelne = $db->query("SELECT COUNT(*) FROM user_choices WHERE user_id = ?", [$registered])->fetchColumn() > 0 ? 'ANO' : 'NE';
                            $hasNepovinne = $db->query("SELECT COUNT(*) FROM user_choices_optional WHERE user_id = ?", [$registered])->fetchColumn() > 0 ? 'ANO' : 'NE';
                        }
                        ?>
                        <tr>
                            <td><?= htmlspecialchars($student['surname']) ?></td>
                            <td><?= htmlspecialchars($student['name']) ?></td>
                            <td class="text-secondary"><?= htmlspecialchars($student['class']) ?></td>
                            <td><?= htmlspecialchars($student['class_next_year']) ?></td>
                            <td class="<?= !$registered ? 'bg-danger text-white' : '' ?>"><?= $registered ? 'ANO' : 'NE' ?></td>
                            <td class="<?= $isWrongClass ? 'bg-warning' : '' ?>"><?= $isWrongClass ? $wrongClassText : 'NE' ?></td>
                            <td><?= $hasVolitelne ?></td>
                            <td><?= $hasNepovinne ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
                </table>
            </div>
        <?php else: ?>
            <div class="alert alert-info">Pro tuto třídu nejsou v tabulce očekávaní studenti.</div>
        <?php endif; ?>
    <?php endif; ?>
</div>

<?php include 'templates/footer.php'; ?>
