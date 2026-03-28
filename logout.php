<?php
session_start();
session_unset();      // smaže všechny session proměnné
session_destroy();    // zruší session

// Přesměrování na přihlášení nebo jinou stránku
header("Location: login.php");
exit;