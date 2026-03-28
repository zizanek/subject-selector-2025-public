<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>Výběr volitelných předmětů</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="/subject-selector/public/css/style.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-4 mb-5">

    <?php if (isset($_SESSION['user_id'])): ?>
        <div class="mb-3 text-end">
            Přihlášen jako <strong><?= htmlspecialchars($_SESSION['user_email'] ?? '') ?></strong>
            (<?= htmlspecialchars($_SESSION['class'] ?? '') ?>)
            <a href="logout.php" class="btn btn-sm btn-outline-secondary ms-2">Odhlásit se</a>
        </div>
    <?php endif; ?>