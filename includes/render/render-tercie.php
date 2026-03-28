<?php
// Volitelné předměty
$subjectModel = new SubjectModel('tercie');
$subjects = $subjectModel->getAll();

// Nepovinné předměty
$optionalModel = new SubjectModel('tercie_optional');
$optionalSubjects = $optionalModel->getAll();

include 'includes/components/student-summary.php';

// Seskupení podle řádku
$grouped = [];
foreach ($subjects as $subject) {
    $grouped[$subject['table_row_number']][] = $subject;
}
?>

<h2 class="mb-4">Výběr volitelného předmětu – Tercie</h2>

<form method="post" action="submit.php" id="tercie-form">
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>Řádek</th>
            <th>Předmět</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($grouped as $rowNumber => $items): ?>
            <tr>
                <td><strong><?= $rowNumber ?></strong></td>
                <td>
                    <?php foreach ($items as $s): ?>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input subject-radio" type="radio"
                                   name="row_<?= $rowNumber ?>" value="<?= $s['id'] ?>"
                                   id="s<?= $s['id'] ?>" data-row="<?= $rowNumber ?>">
                            <label class="form-check-label" for="s<?= $s['id'] ?>">
                                <?= htmlspecialchars($s['name']) ?>
                            </label>
                        </div>
                    <?php endforeach; ?>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>

    <div id="selection-count" class="mb-3 fw-bold text-danger">Vybrán: 0 / 1 předmět</div>

    <hr class="my-4">
    <h4 class="mb-3">Nepovinné předměty – Tercie</h4>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>Předmět</th>
            <th>Počet hodin</th>
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
                <td><?= (int)$subject['hours'] ?></td>
                <td><?= htmlspecialchars($subject['teacher'] ?? '—') ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>

    <div class="mb-3">
        <button type="submit" class="btn btn-primary">Odeslat výběr</button>
        <button type="button" class="btn btn-secondary" onclick="location.reload();">Zrušit výběr</button>
    </div>
</form>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const radios = document.querySelectorAll('.subject-radio');
    const counter = document.getElementById('selection-count');
    const form = document.getElementById('tercie-form');

    function updateCount() {
        const selected = Array.from(radios).filter(r => r.checked);
        counter.textContent = `Vybrán: ${selected.length} / 1 předmět`;

        if (selected.length === 1) {
            counter.classList.remove('text-danger');
            counter.classList.add('text-success');
        } else {
            counter.classList.remove('text-success');
            counter.classList.add('text-danger');
        }
    }

    radios.forEach(radio => {
        radio.addEventListener('change', updateCount);
    });

    form.addEventListener('submit', (e) => {
        const selected = Array.from(radios).filter(r => r.checked);
        if (selected.length !== 1) {
            e.preventDefault();
            alert("Musíte vybrat právě jeden jazyk jako volitelný předmět.");
        }
    });

    updateCount();
});
</script>
