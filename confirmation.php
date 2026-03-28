<?php
require_once 'includes/Database.php';
session_start();

// ✅ Uživatel musí být přihlášen
if (!isset($_SESSION['user_id']) || !isset($_SESSION['class']) || !isset($_SESSION['user_email'])) {
    header("Location: login.php");
    exit;
}

$userId = $_SESSION['user_id'];
$userClass = $_SESSION['class'];
$userEmail = $_SESSION['user_email'];

$tableMain = 'subjects_' . $userClass;
$tableOptional = 'subjects_' . $userClass . '_optional';

$db = new Database();

// 🔄 Načtení volitelných předmětů
$mainChoices = [];
try {
    // Pokud třída nemá volitelné předměty (prima, sekunda, kvarta)
    if (in_array($userClass, ['prima', 'sekunda', 'kvarta'])) {
        $mainChoices = ['V tomto ročníku nejsou žádné volitelné předměty.'];
    } else {
        $sql = "SELECT s.name FROM user_choices uc
                JOIN `$tableMain` s ON uc.subject_id = s.id
                WHERE uc.user_id = ? AND uc.subject_class = ?";
        $stmt = $db->query($sql, [$userId, $userClass]);
        $mainChoices = $stmt->fetchAll(PDO::FETCH_COLUMN);
    }
} catch (Exception $e) {
    $mainChoices = ['Chyba při načítání volitelných předmětů.'];
}

// 🔄 Načtení nepovinných předmětů
$optionalChoices = [];
try {
    $sql = "SELECT s.name FROM user_choices_optional uo
            JOIN `$tableOptional` s ON uo.subject_id = s.id
            WHERE uo.user_id = ? AND uo.subject_class = ?";
    $stmt = $db->query($sql, [$userId, $userClass]);
    $optionalChoices = $stmt->fetchAll(PDO::FETCH_COLUMN);
} catch (Exception $e) {
    $optionalChoices = [];
}

include 'templates/header.php';
?>

<h1 class="mb-4">Potvrzení výběru předmětů</h1>

<div class="mb-3">
    <strong>E-mail:</strong> <?= htmlspecialchars($userEmail) ?><br>
    <strong>Třída:</strong> <?= htmlspecialchars($userClass) ?>
</div>

<h3>Vaše volitelné předměty</h3>
<?php if (!empty($mainChoices) && !in_array($mainChoices[0], ['Chyba při načítání volitelných předmětů.', 'V tomto ročníku nejsou žádné volitelné předměty.'])): ?>
    <?php
    $counts = array_count_values($mainChoices);
    $highlightColors = ['#ffe08a', '#d1f5ce', '#cde9f9', '#f9cdea'];
    $subjectColors = [];
    $colorIndex = 0;
    ?>
    <ul class="list-group">
        <?php foreach ($mainChoices as $name): ?>
            <?php
            $isDouble = $counts[$name] > 1;
            if ($isDouble && !isset($subjectColors[$name])) {
                $subjectColors[$name] = $highlightColors[$colorIndex % count($highlightColors)];
                $colorIndex++;
            }
            $style = $isDouble ? "background-color: {$subjectColors[$name]};" : '';
            ?>
            <li class="list-group-item" style="<?= $style ?>">
                <?= htmlspecialchars($name) ?>
                <?php if ($isDouble): ?>
                    <span title="Dvouhodinový předmět – propojeno" style="font-size: 1.2em; color: #0d6efd;">🔗</span>
                <?php endif; ?>
            </li>
        <?php endforeach; ?>
    </ul>
<?php else: ?>
    <p class="text-muted"><?= htmlspecialchars($mainChoices[0]) ?></p>
<?php endif; ?>

<h3 class="mt-4">Vaše nepovinné předměty</h3>
<?php if (!empty($optionalChoices)): ?>
    <ul>
        <?php foreach ($optionalChoices as $name): ?>
            <li><?= htmlspecialchars($name) ?></li>
        <?php endforeach; ?>
    </ul>
<?php else: ?>
    <p class="text-muted">Nevybrali jste žádné nepovinné předměty.</p>
<?php endif; ?>

<a href="index.php" class="btn btn-secondary mt-4">Zpět na výběr</a>

<?php include 'templates/footer.php'; ?>
