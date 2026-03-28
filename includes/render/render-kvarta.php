<?php
$subjectModel = new SubjectModel('kvarta_optional');
$optionalSubjects = $subjectModel->getAll();

include 'includes/components/student-summary.php';

?>

<h2 class="mb-4">Nepovinné předměty – Kvarta</h2>

<!-- <form method="post" action="submit_optional.php"> -->
<form method="post" action="submit.php">    
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>Předmět</th>
            <th>Počet hodin týdně</th>
            <th>Vyučující</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($optionalSubjects as $subject): ?>
            <tr>
                <td>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox"
                               name="optional_subjects[]" value="<?= $subject['id'] ?>"
                               id="opt<?= $subject['id'] ?>">
                        <label class="form-check-label" for="opt<?= $subject['id'] ?>">
                            <?= htmlspecialchars($subject['name']) ?>
                        </label>
                    </div>
                </td>
                <td><?= htmlspecialchars($subject['hours']) ?></td>
                <td><?= htmlspecialchars($subject['teacher'] ?? '') ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>

    <div class="mb-3">
        <button type="submit" class="btn btn-primary">Odeslat výběr nepovinných předmětů</button>
        <button type="button" class="btn btn-secondary" onclick="location.reload();">Zrušit výběr</button>
    </div>
</form>
