<?php
require_once 'includes/Database.php';
session_start();

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    try {
        $db = new Database();
        $stmt = $db->query("SELECT * FROM users WHERE email = ?", [$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password_hash'])) {
            // Uložení do session
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['user_email'] = $user['email'];
            $_SESSION['class'] = $user['class'];
            $_SESSION['is_admin'] = $user['admin'];

            // Pokud je admin, nastavíme i vybranou třídu podle databáze
            if ($user['admin'] == 1) {
                $_SESSION['selected_class'] = $user['class'];
            }

            header("Location: index.php");
            exit;
        } else {
            $error = "Neplatný e-mail nebo heslo.";
        }
    } catch (Exception $e) {
        $error = "Chyba při přihlášení: " . $e->getMessage();
    }
}
?>

<?php include 'templates/header.php'; ?>

<h1 class="p-3" style="background-color: rgb(13, 160, 198);">Doctrina - Podještědské gymnázium</h1>
<h2 class="mt-5">Výběr volitelných a nepovinných předmětů</h2>
<h2 class="mt-5">Přihlášení uživatele</h2>

<?php if (isset($_GET['registered'])): ?>
    <div class="alert alert-success">
        Úspěšná registrace. Nyní se můžete přihlásit.
    </div>
<?php endif; ?>

<?php if ($error): ?>
    <div class="alert alert-danger">
        <?= htmlspecialchars($error) ?>
    </div>
<?php endif; ?>

<form method="post" class="mt-3">
    <div class="mb-3">
        <label for="email" class="form-label">E-mail</label>
        <input type="email" class="form-control" id="email" name="email" required
               value="<?= isset($email) ? htmlspecialchars($email) : '' ?>">
    </div>

    <div class="mb-3">
        <label for="password" class="form-label">Heslo</label>
        <input type="password" class="form-control" id="password" name="password" required>
    </div>

    <button type="submit" class="btn btn-primary">Přihlásit se</button>
    <a href="register.php" class="btn btn-link"><span class="h4">Nemáte účet? Zaregistrujte se</span></a>
</form>

<?php include 'templates/footer.php'; ?>
