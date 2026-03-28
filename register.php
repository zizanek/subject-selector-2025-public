<?php
require_once 'includes/Database.php';
session_start();

$errors = [];
$success = false;

$classMap = [
    'prima' => 'prima',
    'sekunda' => 'sekunda',
    'tercie' => 'tercie',
    'kvarta' => 'kvarta',
    'kvinta' => 'kvinta',
    'sexta' => 'sexta',
    'septima' => 'septima',
    'oktáva' => 'oktava',
    '1. ročník' => 'rocnik1',
    '2. ročník' => 'rocnik2',
    '3. ročník' => 'rocnik3',
    '4. ročník' => 'rocnik4',
];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    $name = trim($_POST['name']);
    $surname = trim($_POST['surname']);
    $password = $_POST['password'];
    $password_confirm = $_POST['password_confirm'];
    $classInput = $_POST['class'];

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Neplatný formát e-mailu.";
    } elseif (!str_ends_with($email, '@doctrina.cz')) {
        $errors[] = "E-mail musí být z domény @doctrina.cz.";
    }

    if (empty($name)) {
        $errors[] = "Jméno je povinné.";
    }
    if (empty($surname)) {
        $errors[] = "Příjmení je povinné.";
    }

    if (strlen($password) < 6) {
        $errors[] = "Heslo musí mít alespoň 6 znaků.";
    } elseif ($password !== $password_confirm) {
        $errors[] = "Hesla se neshodují.";
    }

    if (empty($classInput)) {
        $errors[] = "Musíte vybrat třídu.";
    } elseif (!array_key_exists($classInput, $classMap)) {
        $errors[] = "Neplatná třída.";
    }

    if (empty($errors)) {
        try {
            $db = new Database();
            $stmt = $db->query("SELECT id FROM users WHERE email = ?", [$email]);

            if ($stmt->rowCount() > 0) {
                $errors[] = "Uživatel s tímto e-mailem už existuje.";
            } else {
                $hash = password_hash($password, PASSWORD_DEFAULT);
                $mappedClass = $classMap[$classInput];
                $db->query(
                    "INSERT INTO users (email, name, surname, password_hash, class) VALUES (?, ?, ?, ?, ?)",
                    [$email, $name, $surname, $hash, $mappedClass]
                );
                $success = true;
                header("Location: login.php?registered=1");
                exit;
            }
        } catch (Exception $e) {
            $errors[] = "Chyba při registraci: " . $e->getMessage();
        }
    }
}
?>

<?php include 'templates/header.php'; ?>

<h1 class="p-3" style="background-color: rgb(13, 160, 198);">Doctrina - Podještědské gymnázium</h1>
<h2 class="mt-5">Výběr volitelných a nepovinných předmětů</h2>
<h3 class="mt-5">Registrace uživatele</h3>

<?php if (!empty($errors)): ?>
    <div class="alert alert-danger">
        <ul class="mb-0">
            <?php foreach ($errors as $err): ?>
                <li><?= htmlspecialchars($err) ?></li>
            <?php endforeach; ?>
        </ul>
    </div>
<?php endif; ?>

<form method="post" class="mt-3">
    <div class="mb-3">
        <label for="email" class="form-label fw-bold">E-mail (doctrina.cz) <span class="text-danger">*</span></label>
        <input type="email" class="form-control" id="email" name="email" required
               value="<?= isset($email) ? htmlspecialchars($email) : '' ?>">
    </div>

    <div class="mb-3">
        <label for="name" class="form-label fw-bold">Jméno <span class="text-danger">*</span></label>
        <input type="text" class="form-control" id="name" name="name" required
               value="<?= isset($name) ? htmlspecialchars($name) : '' ?>">
    </div>

    <div class="mb-3">
        <label for="surname" class="form-label fw-bold">Příjmení <span class="text-danger">*</span></label>
        <input type="text" class="form-control" id="surname" name="surname" required
               value="<?= isset($surname) ? htmlspecialchars($surname) : '' ?>">
    </div>

    <div class="mb-3">
        <label for="password" class="form-label fw-bold">Heslo <span class="text-danger">*</span></label>
        <div class="input-group">
            <input type="password" class="form-control" id="password" name="password"
                required
                pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}"
                title="Heslo musí mít alespoň 8 znaků, obsahovat malé i velké písmeno a číslici.">
            <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('password')">👁️</button>
        </div>
    </div>

    <div class="mb-3">
        <label for="password_confirm" class="form-label fw-bold">Zopakujte heslo <span class="text-danger">*</span></label>
        <div class="input-group">
            <input type="password" class="form-control" id="password_confirm" name="password_confirm"
                required
                pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}"
                title="Heslo musí mít alespoň 8 znaků, obsahovat malé i velké písmeno a číslici.">
            <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('password_confirm')">👁️</button>
        </div>
    </div>

    <div class="mb-3">
        <label for="class" class="form-label fw-bold">Třída <span class="text-danger">*</span><span class="text-danger h4"> POZOR: zde vyberte třídu, ve které budete ve školním roce 2025/2026</span></label>
        <select class="form-select" id="class" name="class" required>
            <option value="">-- Vyberte třídu --</option>
            <?php
            foreach (array_keys($classMap) as $c) {
                $selected = (isset($classInput) && $classInput === $c) ? 'selected' : '';
                echo "<option value=\"$c\" $selected>$c</option>";
            }
            ?>
        </select>
    </div>

    <button type="submit" class="btn btn-primary">Registrovat</button>
    <a href="login.php" class="btn btn-link"><span class="h4">Už mám účet</span></a>
</form>

<script>
function togglePassword(id) {
    const input = document.getElementById(id);
    input.type = input.type === 'password' ? 'text' : 'password';
}
</script>

<?php include 'templates/footer.php'; ?>
