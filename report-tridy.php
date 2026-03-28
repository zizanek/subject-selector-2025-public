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

// 🎯 Předdefinovaný počet sloupců pro každou třídu
$volitelneSloupce = [
    'kvinta' => 2, 'rocnik1' => 2,
    'sexta' => 5, 'rocnik2' => 5,
    'septima' => 4, 'rocnik3' => 4,
    'oktava' => 10, 'rocnik4' => 10,
    'tercie' => 1
];

$nepovinneSloupce = [
    'prima' => 1,
    'sekunda' => 2,
    'tercie' => 3,
    'kvarta' => 3,
    'kvinta' => 4, 'rocnik1' => 4,
    'sexta' => 4, 'rocnik2' => 4,
    'septima' => 4, 'rocnik3' => 4,
    'oktava' => 3, 'rocnik4' => 3
];

// ✅ Hlavička
include 'templates/header.php';
?>

<div class="container mt-4">
    <!-- 📊 Tlačítko pro report -->
    <div class="mb-3">
        <a href="index.php" class="btn btn-outline-secondary">Home</a>
        <a href="report-tridy.php" class="btn btn-outline-secondary"><i class="bi bi-border-all"></i> Report - studenti</a>
        <a href="report-predmety.php" class="btn btn-outline-secondary"><i class="bi bi-bar-chart-steps"></i> Report - předměty</a>
        <a href="report-komplet.php" class="btn btn-outline-secondary"><i class="bi bi-table"></i> Report - komplet</a>
        <a href="report-kontrola.php" class="btn btn-outline-secondary"><i class="bi bi-eyeglasses"></i> Report - kontrola</a>
    </div>
    <h2 class="mb-4"><i class="bi bi-border-all"></i> Report podle studentů</h2>

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
        <?php
        $stmt = $db->query("SELECT DISTINCT u.id, u.name, u.surname, u.email
                            FROM users u
                            LEFT JOIN user_choices c ON u.id = c.user_id
                            WHERE u.class = ?
                            ORDER BY u.surname, u.name", [$selectedClass]);
        $students = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $volitPocet = $volitelneSloupce[$selectedClass] ?? 0;
        $nepovPocet = $nepovinneSloupce[$selectedClass] ?? 0;
        ?>

        <?php if (!empty($students)): ?>
            <h4 class="mb-3">Třída: <?= htmlspecialchars($classOptions[$selectedClass] ?? $selectedClass) ?></h4>
            <p class="fw-bold">Počet studentů v seznamu: <?= count($students) ?></p>

            <table class="table table-bordered">
                <thead class="table-light">
                    <tr>
                        <th colspan="<?= 3 + $volitPocet + $nepovPocet ?>" class="text-center fs-5 bg-secondary text-white">
                            <?= $classOptions[$selectedClass] ?? ucfirst($selectedClass) ?>
                        </th>
                    </tr>
                    <tr>
                        <th rowspan="2">Příjmení</th>
                        <th rowspan="2">Jméno</th>
                        <th rowspan="2">E-mail</th>
                        <?php if ($volitPocet > 0): ?>
                            <th colspan="<?= $volitPocet ?>" class="text-center">Volitelné předměty</th>
                        <?php endif; ?>
                        <?php if ($nepovPocet > 0): ?>
                            <th colspan="<?= $nepovPocet ?>" class="text-center">Nepovinné předměty</th>
                        <?php endif; ?>
                    </tr>
                    <tr>
                        <?php for ($i = 1; $i <= $volitPocet; $i++): ?>
                            <th><?= $i ?></th>
                        <?php endfor; ?>
                        <?php for ($i = 1; $i <= $nepovPocet; $i++): ?>
                            <th><?= $i ?></th>
                        <?php endfor; ?>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($students as $student): ?>
                        <?php
                        $volitelne = $db->query("SELECT subject_name FROM user_choices WHERE user_id = ? AND subject_class = ?", [$student['id'], $selectedClass])->fetchAll(PDO::FETCH_COLUMN);
                        $nepovinne = $db->query("SELECT subject_name FROM user_choices_optional WHERE user_id = ? AND subject_class = ?", [$student['id'], $selectedClass])->fetchAll(PDO::FETCH_COLUMN);
                        ?>
                        <tr>
                            <td><?= htmlspecialchars($student['surname']) ?></td>
                            <td><?= htmlspecialchars($student['name']) ?></td>
                            <td><?= htmlspecialchars($student['email']) ?></td>

                            <?php for ($i = 0; $i < $volitPocet; $i++): ?>
                                <td><?= isset($volitelne[$i]) ? htmlspecialchars($volitelne[$i]) : '' ?></td>
                            <?php endfor; ?>

                            <?php for ($i = 0; $i < $nepovPocet; $i++): ?>
                                <td><?= isset($nepovinne[$i]) ? htmlspecialchars($nepovinne[$i]) : '' ?></td>
                            <?php endfor; ?>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else: ?>
            <div class="alert alert-info">V této třídě zatím nejsou žádné výběry.</div>
        <?php endif; ?>
    <?php endif; ?>
</div>

<?php include 'templates/footer.php'; ?>
