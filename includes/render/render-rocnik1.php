<?php
$subjectModel = new SubjectModel('rocnik1');
$subjects = $subjectModel->getAll();

// Nepovinné předměty – zvláštní tabulka
$optionalModel = new SubjectModel('rocnik1_optional');
$optionalSubjects = $optionalModel->getAll();

include 'includes/components/student-summary.php';

$categories = ['technicke', 'prirodovedne', 'humanitni', 'umelecke'];
$categoryHeadings = [
    'technicke' => 'Technické, IT, matematicko-fyzikální zaměření',
    'prirodovedne' => 'Přírodovědné zaměření',
    'humanitni' => 'Humanitní, společenskovědní zaměření',
    'umelecke' => 'Umělecké obory',
];

$grouped = [];
foreach ($subjects as $subject) {
    $grouped[$subject['table_row_number']][$subject['category']] = $subject;
}
?>

<h2 class="mb-4">Výběr volitelných předmětů – 1. ročník</h2>

<form method="post" action="submit.php">
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>Řádek</th>
            <?php foreach ($categories as $cat): ?>
                <th><?= $categoryHeadings[$cat] ?? ucfirst($cat) ?></th>
            <?php endforeach; ?>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($grouped as $rowNumber => $row): ?>
            <tr>
                <td><strong><?= $rowNumber ?></strong></td>
                <?php foreach ($categories as $category): ?>
                    <td>
                        <?php if (isset($row[$category])): 
                            $s = $row[$category]; ?>
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

    <div id="selection-count" class="mb-3 fw-bold">Vybrané předměty: 0 / 2</div>

    <hr class="my-4">

    <h4 class="mb-3">Nepovinné předměty</h4>
    <table class="table table-bordered">
        <thead class="table-light">
        <tr>
            <th style="width: 40%">Předmět</th>
            <th style="width: 15%">Počet hodin</th>
            <th style="width: 45%">Vyučující</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($optionalSubjects as $opt): ?>
            <tr>
                <td>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox"
                               name="optional_subjects[]" value="<?= $opt['id'] ?>"
                               id="opt<?= $opt['id'] ?>">
                        <label class="form-check-label" for="opt<?= $opt['id'] ?>">
                            <?= htmlspecialchars($opt['name']) ?>
                        </label>
                    </div>
                </td>
                <td><?= (int)$opt['hours'] ?></td>
                <td><?= htmlspecialchars($opt['teacher']) ?></td>
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
    const form = document.querySelector('form');
    const maxSelections = 2;

    let lastClickedRadio = null;

    function getSelectedRows() {
        const selected = new Set();
        radios.forEach(r => {
            if (r.checked) {
                selected.add(r.name);
            }
        });
        return selected;
    }

    function updateCount() {
        const selected = getSelectedRows();
        const count = selected.size;
        counter.textContent = `Vybrané předměty: ${count} / ${maxSelections}`;

        if (count === maxSelections) {
            counter.classList.remove('text-danger');
            counter.classList.add('text-success');
        } else {
            counter.classList.remove('text-success');
            counter.classList.add('text-danger');
        }

        return count;
    }

    radios.forEach(radio => {
        radio.addEventListener('mousedown', (e) => {
            if (radio.checked) {
                lastClickedRadio = radio;
            } else {
                lastClickedRadio = null;
            }
        });

        radio.addEventListener('click', (e) => {
            if (lastClickedRadio === radio) {
                radio.checked = false;
                lastClickedRadio = null;
                setTimeout(() => updateCount(), 0);
            } else {
                const selected = getSelectedRows();
                if (!selected.has(radio.name) && selected.size >= maxSelections) {
                    e.preventDefault();
                    radio.checked = false;
                    alert(`Můžete vybrat maximálně ${maxSelections} předměty.`);
                }
                setTimeout(() => updateCount(), 0);
            }
        });
    });

    form.addEventListener('submit', (e) => {
        const selectedCount = getSelectedRows().size;
        if (selectedCount !== maxSelections) {
            e.preventDefault();
            alert(`Musíte vybrat právě ${maxSelections} volitelné předměty.`);
        }
    });

    updateCount();
});
</script>
