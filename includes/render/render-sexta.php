<?php
$subjectModel = new SubjectModel('sexta');
$subjects = $subjectModel->getAll();

$optionalModel = new SubjectModel('sexta_optional');
$optionalSubjects = $optionalModel->getAll();

include 'includes/components/student-summary.php';

$categories = ['technicke', 'prirodovedne', 'humanitni', 'umelecke'];
$categoryHeadings = [
    'technicke' => 'Technické, IT, matematicko-fyzikální zaměření',
    'prirodovedne' => 'Přírodovědné, lékařské obory, farmacie',
    'humanitni' => 'Humanitní, psychologické, právo, historie',
    'umelecke' => 'Umělecké, sociální, společenské obory',
];

$grouped = [];
foreach ($subjects as $subject) {
    $grouped[$subject['table_row_number']][$subject['category']] = $subject;
}

$alreadyRendered = [];
?>

<h2 class="mb-4">Výběr volitelných předmětů – Sexta</h2>

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
                        if ($s['hours'] == 2) {
                            if (in_array($s['name'], $alreadyRendered)) {
                                $isLinked = true;
                            } else {
                                $alreadyRendered[] = $s['name'];
                                $isLinked = true;
                            }
                        }
                        if ($isLinked) {
                            $tdStyle = 'background-color: #ffe08a';
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
                                       data-required-choice="<?= $s['is_required_choice'] ?>">
                                <label class="form-check-label" for="s<?= $s['id'] ?>">
                                    <?= htmlspecialchars($s['name']) ?>
                                    <?php if ($s['hours'] == 2): ?>
                                        <span title="Dvouhodinový předmět – propojeno" style="font-size: 1.2em; color: #0d6efd;">🔗</span>
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
        Zvoleno: 0 / 5 hodin, z toho povinně volitelných: 0
    </div>

    <?php if (!empty($optionalSubjects)): ?>
        <h3 class="mt-5 mb-3">Nepovinné předměty</h3>
        <table class="table table-bordered">
            <thead class="table-light">
            <tr>
                <th>Předmět</th>
                <th>Počet hodin</th>
                <th>Vyučující</th>
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
    <?php endif; ?>

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

    const requiredHours = 5;
    const minRequiredChoices = 1;

    let lastClickedRadio = null;

    function getSelectedRadios() {
        return Array.from(radios).filter(r => r.checked);
    }

    function updateCount() {
        const selectedRadios = getSelectedRadios();
        let totalHours = 0;
        let requiredChoiceCount = 0;

        selectedRadios.forEach(r => {
            totalHours += 1;
            if (parseInt(r.dataset.requiredChoice || "0")) {
                requiredChoiceCount++;
            }
        });

        counter.textContent = `Zvoleno: ${totalHours} / ${requiredHours} hodin, z toho povinně volitelných: ${requiredChoiceCount}`;

        if (totalHours === requiredHours && requiredChoiceCount >= minRequiredChoices) {
            counter.classList.remove('text-danger');
            counter.classList.add('text-success');
        } else {
            counter.classList.remove('text-success');
            counter.classList.add('text-danger');
        }

        return { totalHours, requiredChoiceCount };
    }

    function findSiblingWithSameLabel(radio) {
        const label = document.querySelector(`label[for="${radio.id}"]`);
        if (!label) return null;

        const labelText = label.textContent.trim();

        for (let other of radios) {
            if (other === radio) continue;
            const otherLabel = document.querySelector(`label[for="${other.id}"]`);
            if (otherLabel && otherLabel.textContent.trim() === labelText) {
                return other;
            }
        }

        return null;
    }

    radios.forEach(radio => {
        radio.addEventListener('mousedown', () => {
            lastClickedRadio = radio.checked ? radio : null;
        });

        radio.addEventListener('click', () => {
            const isDouble = radio.dataset.hours === "2";
            const pairedRadio = isDouble ? findSiblingWithSameLabel(radio) : null;

            if (lastClickedRadio === radio) {
                radio.checked = false;
                if (pairedRadio) pairedRadio.checked = false;
                lastClickedRadio = null;
                setTimeout(updateCount, 0);
            } else {
                const selected = getSelectedRadios();
                if (!selected.map(r => r.name).includes(radio.name) && selected.length >= requiredHours) {
                    radio.checked = false;
                    if (pairedRadio) pairedRadio.checked = false;
                    alert(`Můžete vybrat maximálně ${requiredHours} hodin.`);
                    return;
                }

                if (pairedRadio) pairedRadio.checked = true;
                setTimeout(updateCount, 0);
            }
        });
    });

    form.addEventListener('submit', (e) => {
        const { totalHours, requiredChoiceCount } = updateCount();
        if (totalHours !== requiredHours) {
            e.preventDefault();
            alert(`Musíte vybrat přesně ${requiredHours} hodin.`);
        } else if (requiredChoiceCount < minRequiredChoices) {
            e.preventDefault();
            alert(`Musíte vybrat alespoň ${minRequiredChoices} povinně volitelný předmět (výtvarná výchova nebo hudební výchova).`);
        }
    });

    updateCount();
});
</script>
