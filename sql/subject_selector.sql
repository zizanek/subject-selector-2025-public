-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 25. bře 2025, 14:26
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `subject_selector`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_kvinta`
--

CREATE TABLE `subjects_kvinta` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `row_number` int(11) NOT NULL,
  `category` enum('technicke','prirodovedne','humanitni','umelecke') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_kvinta`
--

INSERT INTO `subjects_kvinta` (`id`, `name`, `row_number`, `category`) VALUES
(1, 'matematika rozšířená', 1, 'technicke'),
(2, 'chemický seminář', 1, 'prirodovedne'),
(3, 'historický seminář', 1, 'humanitni'),
(4, 'výtvarné techniky', 1, 'umelecke'),
(5, 'aplikovaná fyzika', 2, 'technicke'),
(6, 'praktická biologie', 2, 'prirodovedne'),
(7, 'kořeny evropské kultury', 2, 'humanitni'),
(8, 'IT dílna', 3, 'technicke'),
(9, 'čtenářská gramotnost', 3, 'humanitni'),
(10, 'extra aktivity v AJ', 4, 'technicke'),
(11, 'anglická konverzace', 4, 'prirodovedne'),
(12, 'španělská konverzace', 4, 'humanitni'),
(13, 'německá konverzace', 4, 'umelecke');

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_septima`
--

CREATE TABLE `subjects_septima` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `row_number` int(11) NOT NULL,
  `category` enum('technicke','prirodovedne','humanitni','umelecke') NOT NULL,
  `hours` int(11) DEFAULT 1,
  `is_required_choice` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_septima`
--

INSERT INTO `subjects_septima` (`id`, `name`, `row_number`, `category`, `hours`, `is_required_choice`) VALUES
(1, 'matematika rozšířená', 1, 'technicke', 1, 0),
(2, 'chemický seminář', 1, 'prirodovedne', 1, 0),
(3, 'historický seminář', 1, 'humanitni', 1, 0),
(4, 'výtvarná tvorba', 1, 'umelecke', 1, 0),
(5, 'aplikovaná fyzika', 2, 'technicke', 1, 0),
(6, 'programování', 3, 'technicke', 2, 0),
(7, 'biologie člověka rozšířená', 3, 'prirodovedne', 1, 0),
(8, 'globální problémy', 3, 'humanitni', 1, 0),
(9, 'výtvarná výchova', 3, 'umelecke', 2, 0),
(10, 'programování', 4, 'technicke', 2, 0),
(11, 'ekologie', 4, 'prirodovedne', 1, 0),
(12, 'literární seminář', 4, 'humanitni', 1, 0),
(13, 'výtvarná výchova', 4, 'umelecke', 2, 0),
(14, 'deskriptivní geometrie', 5, 'technicke', 2, 0),
(15, 'latina', 5, 'humanitni', 2, 0),
(16, 'hudební výchova', 5, 'umelecke', 2, 0),
(17, 'deskriptivní geometrie', 6, 'technicke', 2, 0),
(18, 'latina', 6, 'humanitni', 2, 0),
(19, 'hudební výchova', 6, 'umelecke', 2, 0),
(20, 'Advanced English', 7, 'humanitni', 2, 0),
(21, 'Advanced English', 8, 'humanitni', 2, 0),
(22, 'finanční gramotnost', 9, 'technicke', 1, 0),
(23, 'Open Education', 9, 'humanitni', 1, 0),
(24, 'anglická konverzace', 10, 'prirodovedne', 1, 0),
(25, 'německá konverzace', 10, 'humanitni', 1, 0),
(26, 'španělská konverzace', 10, 'umelecke', 1, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_sexta`
--

CREATE TABLE `subjects_sexta` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `row_number` int(11) NOT NULL,
  `category` enum('technicke','prirodovedne','humanitni','umelecke') NOT NULL,
  `hours` int(11) DEFAULT 1,
  `is_required_choice` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_sexta`
--

INSERT INTO `subjects_sexta` (`id`, `name`, `row_number`, `category`, `hours`, `is_required_choice`) VALUES
(1, 'matematika rozšířená', 1, 'technicke', 1, 0),
(2, 'etologie', 1, 'prirodovedne', 1, 0),
(3, 'čtenářská gramotnost', 1, 'humanitni', 1, 0),
(4, 'výtvarná tvorba', 1, 'umelecke', 1, 0),
(5, 'programování', 2, 'technicke', 2, 0),
(6, 'regionální výzvy', 2, 'prirodovedne', 1, 0),
(7, 'historický seminář', 2, 'humanitni', 1, 0),
(8, 'hudební estetika', 2, 'umelecke', 1, 0),
(9, 'programování', 3, 'technicke', 2, 0),
(10, 'Open Education', 3, 'humanitni', 1, 0),
(11, 'aplikovaná fyzika', 4, 'technicke', 1, 0),
(12, 'Advanced English', 4, 'humanitni', 2, 0),
(13, 'Advanced English', 5, 'humanitni', 2, 0),
(14, 'anglická konverzace', 6, 'prirodovedne', 1, 0),
(15, 'německá konverzace', 6, 'humanitni', 1, 0),
(16, 'španělská konverzace', 6, 'umelecke', 1, 0),
(17, 'výtvarná výchova', 7, 'technicke', 1, 1),
(18, 'hudební výchova', 7, 'humanitni', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `class` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `users`
--


--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `subjects_kvinta`
--
ALTER TABLE `subjects_kvinta`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_septima`
--
ALTER TABLE `subjects_septima`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_sexta`
--
ALTER TABLE `subjects_sexta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `row_number` (`row_number`,`category`);

--
-- Indexy pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `subjects_kvinta`
--
ALTER TABLE `subjects_kvinta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pro tabulku `subjects_septima`
--
ALTER TABLE `subjects_septima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pro tabulku `subjects_sexta`
--
ALTER TABLE `subjects_sexta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
