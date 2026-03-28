<?php
require_once 'includes/SubjectKvinta.php';

$subjectModel = new SubjectKvinta();
$subjects = $subjectModel->getAll();

// Seskupíme předměty podle řádku a kategorie
$categories = ['technicke', 'prirodovedne', 'humanitni', 'umelecke'];
$grouped = [];

foreach ($subjects as $subject) {
    $grouped[$subject['row_number']][$subject['category']] = $subject;
}
?>

<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>Výběr volitelných předmětů - Kvinta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h1 class="mb-4">Výběr volitelného předmětu – Kvinta</h1>

    <form action="submit.php" method="post">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Řádek</th>
                    <th>Technické</th>
                    <th>Přírodovědné</th>
                    <th>Humanitní</th>
                    <th>Umělecké</th>
                </tr>
            </thead>
            <tbody>
            <?php foreach ($grouped as $rowNumber => $subjectsRow): ?>
                <tr>
                    <td><strong><?= $rowNumber ?></strong></td>
                    <?php foreach ($categories as $category): ?>
                        <td>
                            <?php if (isset($subjectsRow[$category])): 
                                $s = $subjectsRow[$category]; ?>
                                <div class="form-check">
                                    <input class="form-check-input subject-radio" type="radio"
                                           name="row_<?= $rowNumber ?>" value="<?= $s['id'] ?>"
                                           id="s<?= $s['id'] ?>" data-row="<?= $rowNumber ?>">
                                    <label class="form-check-label" for="s<?= $s['id'] ?>">
                                        <?= htmlspecialchars($s['name']) ?>
                                    </label>
                                </div>
                            <?php else: ?>
                                <em class="text-muted">—</em>
                            <?php endif; ?>
                        </td>
                    <?php endforeach; ?>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>

        <!-- Počítadlo bude přidáno JS skriptem -->
        
            <button type="submit" class="btn btn-primary mt-3">Odeslat výběr</button>
            <button type="button" class="btn btn-secondary mt-3" onclick="location.reload();">Zrušit výběr</button>
        
    </form>
</div>

<!-- JavaScript -->
<script src="public/js/limit-selection.js"></script>
</body>
</html>
