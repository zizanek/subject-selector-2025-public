<?php 
$subjectModel = new SubjectModel('rocnik4');
$subjects = $subjectModel->getAll();

$optionalModel = new SubjectModel('rocnik4_optional');
$optionalSubjects = $optionalModel->getAll();

include 'includes/components/student-summary.php';

$categories = ['technicke', 'prirodovedne', 'humanitni', 'umelecke'];
$categoryHeadings = [
    'technicke' => 'Technické, IT, matematicko-fyzikální',
    'prirodovedne' => 'Přírodovědné, lékařské obory, farmacie',
    'humanitni' => 'Humanitní, psychologické, právo, historie',
    'umelecke' => 'Umělecké, sociální, společenské obory',
];

$grouped = [];
foreach ($subjects as $subject) {
    $grouped[$subject['table_row_number']][$subject['category']] = $subject;
}

$alreadyRendered = [];
$dvojiceZvyraznene = [
    'aplikovaná fyzika',
    'výtvarná výchova',
    'psychologie',
    'chemie',
    'matematika základní*'
];
?>

<h2 class="mb-4">Výběr volitelných předmětů – 4. ročník</h2>

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
                    <?php
                    $tdStyle = '';
                    $isLinked = false;
                    if (isset($row[$category])) {
                        $s = $row[$category];
                        if ($s['hours'] >= 2) {
                            if (in_array($s['name'], $alreadyRendered)) {
                                $isLinked = true;
                            } else {
                                $alreadyRendered[] = $s['name'];
                                $isLinked = true;
                            }
                        }
                        if ($isLinked) {
                            $color = in_array($s['name'], $dvojiceZvyraznene)
                                ? '#d1f5ce'
                                : '#ffe199';
                            $tdStyle = "background-color: {$color}";
                        }
                    }
                    ?>
                    <td style="<?= $tdStyle ?>">
                        <?php if (isset($row[$category])): 
                            $s = $row[$category]; ?>
                            <div class="form-check">
                                <input class="form-check-input subject-radio" type="radio"
                                       name="row_<?= $rowNumber ?>" value="<?= $s['id'] ?>"
                                       id="s<?= $s['id'] ?>"
                                       data-row="<?= $rowNumber ?>"
                                       data-hours="<?= $s['hours'] ?>"
                                       data-name="<?= htmlspecialchars($s['name']) ?>"
                                       data-required-choice="<?= $s['is_required_choice'] ?>">
                                <label class="form-check-label" for="s<?= $s['id'] ?>">
                                    <?= htmlspecialchars($s['name']) ?>
                                    <?php if ($s['hours'] >= 2): ?>
                                        <span title="Vícehodinový předmět – propojeno" style="font-size: 1.2em; color: #0d6efd;">🔗</span>
                                    <?php endif; ?>
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

    <div id="selection-count" class="mb-3 fw-bold text-danger">
        Zvoleno: 0 / 10 hodin, ❌ Nevybrán matematický předmět
    </div>

    <hr class="my-4">
    <h4 class="mb-3">Nepovinné předměty</h4>

    <table class="table table-bordered">
        <thead class="table-light">
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
                        <input class="form-check-input" type="checkbox" name="optional_subjects[]" id="o<?= $subject['id'] ?>" value="<?= $subject['id'] ?>">
                        <label class="form-check-label" for="o<?= $subject['id'] ?>">
                            <?= htmlspecialchars($subject['name']) ?>
                        </label>
                    </div>
                </td>
                <td><?= $subject['hours'] ?></td>
                <td><?= htmlspecialchars($subject['teacher']) ?></td>
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

    const requiredHours = 10;
    let lastClickedRadio = null;

    function getSelectedRadios() {
        return Array.from(radios).filter(r => r.checked);
    }

    function updateCount() {
        const selectedRadios = getSelectedRadios();
        let totalHours = selectedRadios.length;

        const selectedNames = selectedRadios.map(r => r.dataset.name.trim().toLowerCase());
        const hasMatikaRozsirena = selectedNames.includes("matematika rozšířená*".toLowerCase());
        const hasMatikaZakladni = selectedNames.includes("matematika základní*".toLowerCase());
        const hasMatika = hasMatikaRozsirena || hasMatikaZakladni;

        counter.textContent = `Zvoleno: ${totalHours} / ${requiredHours} hodin, ` +
            (hasMatika ? "✅ Vybrán matematický předmět" : "❌ Nevybrán matematický předmět");

        if (totalHours === requiredHours && hasMatika) {
            counter.classList.remove('text-danger');
            counter.classList.add('text-success');
        } else {
            counter.classList.remove('text-success');
            counter.classList.add('text-danger');
        }

        return { totalHours, hasMatika };
    }

    function findMatchingRadiosByName(name) {
        return Array.from(radios).filter(r =>
            r.dataset.name.trim().toLowerCase() === name.trim().toLowerCase()
        );
    }

    radios.forEach(radio => {
        radio.addEventListener('mousedown', () => {
            lastClickedRadio = radio.checked ? radio : null;
        });

        radio.addEventListener('click', () => {
            const name = radio.dataset.name;
            const group = findMatchingRadiosByName(name);

            if (lastClickedRadio === radio) {
                group.forEach(r => r.checked = false);
                lastClickedRadio = null;
                setTimeout(updateCount, 0);
            } else {
                const selected = getSelectedRadios();
                const alreadyInGroup = selected.some(r => r.name === radio.name);

                if (!alreadyInGroup && selected.length + group.length > requiredHours) {
                    radio.checked = false;
                    alert(`Můžete vybrat maximálně ${requiredHours} hodin.`);
                    return;
                }

                group.forEach(r => r.checked = true);
                setTimeout(updateCount, 0);
            }
        });
    });

    form.addEventListener('submit', (e) => {
        const { totalHours, hasMatika } = updateCount();
        if (totalHours !== requiredHours) {
            e.preventDefault();
            alert(`Musíte vybrat přesně ${requiredHours} hodin.`);
        } else if (!hasMatika) {
            e.preventDefault();
            alert("Musíte vybrat alespoň jeden matematický předmět – buď matematiku rozšířenou (4 hodiny), nebo základní (2 hodiny).");
        }
    });

    updateCount();
});
</script>
