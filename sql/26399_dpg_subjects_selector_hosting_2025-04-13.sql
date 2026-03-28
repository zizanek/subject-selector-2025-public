-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Počítač: localhost
-- Vytvořeno: Ned 13. dub 2025, 19:54
-- Verze serveru: 10.11.8-MariaDB-log
-- Verze PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `subjects_selector`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `students_expected`
--

CREATE TABLE `students_expected` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `class` varchar(50) NOT NULL,
  `class_next_year` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `students_expected`
--



-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_kvarta_optional`
--

CREATE TABLE `subjects_kvarta_optional` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hours` int(11) NOT NULL DEFAULT 1,
  `teacher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_kvarta_optional`
--

INSERT INTO `subjects_kvarta_optional` (`id`, `name`, `hours`, `teacher`) VALUES
(1, 'Mladí debrujáři', 1, ''),
(2, 'Dramatická výchova', 2, ''),
(3, 'Konverzace ve španělském jazyce', 1, '');

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_kvinta`
--

CREATE TABLE `subjects_kvinta` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `table_row_number` int(11) NOT NULL,
  `category` enum('technicke','prirodovedne','humanitni','umelecke') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_kvinta`
--

INSERT INTO `subjects_kvinta` (`id`, `name`, `table_row_number`, `category`) VALUES
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
-- Struktura tabulky `subjects_kvinta_optional`
--

CREATE TABLE `subjects_kvinta_optional` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hours` int(11) NOT NULL DEFAULT 1,
  `teacher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_kvinta_optional`
--

INSERT INTO `subjects_kvinta_optional` (`id`, `name`, `hours`, `teacher`) VALUES
(1, 'Divadelní soubor', 2, 'Jáša'),
(2, 'Debatní klub', 1, 'Plocar'),
(3, 'Konverzace ve španělském jazyce', 1, 'Cociňa'),
(4, 'Fotografie', 1, 'Nemergutová, Kozák');

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_oktava`
--

CREATE TABLE `subjects_oktava` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `table_row_number` int(11) NOT NULL,
  `category` enum('technicke','prirodovedne','humanitni','umelecke') NOT NULL,
  `hours` int(11) DEFAULT 1,
  `is_required_choice` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_oktava`
--

INSERT INTO `subjects_oktava` (`id`, `name`, `table_row_number`, `category`, `hours`, `is_required_choice`) VALUES
(1, 'fyzika', 1, 'technicke', 2, 0),
(2, 'latina', 1, 'humanitni', 2, 0),
(3, 'výtvarná výchova', 1, 'umelecke', 2, 0),
(4, 'fyzika', 2, 'technicke', 2, 0),
(5, 'latina', 2, 'humanitni', 2, 0),
(6, 'výtvarná výchova', 2, 'umelecke', 2, 0),
(7, 'aplikovaná fyzika', 3, 'technicke', 2, 0),
(8, 'antropologický seminář', 3, 'prirodovedne', 1, 0),
(9, 'historický seminář', 3, 'humanitni', 1, 0),
(10, 'aplikovaná fyzika', 4, 'technicke', 2, 0),
(11, 'evoluční biologie', 4, 'prirodovedne', 1, 0),
(12, 'literární seminář', 4, 'humanitni', 1, 0),
(13, 'deskriptivní geometrie', 5, 'technicke', 2, 0),
(14, 'VSP', 5, 'prirodovedne', 1, 0),
(15, 'anglické reálie', 5, 'humanitni', 1, 0),
(16, 'hudební výchova', 5, 'umelecke', 2, 0),
(17, 'deskriptivní geometrie', 6, 'technicke', 2, 0),
(18, 'aplikovaná psychologie', 6, 'prirodovedne', 1, 0),
(19, 'anglická literatura', 6, 'humanitni', 1, 0),
(20, 'hudební výchova', 6, 'umelecke', 2, 0),
(21, 'zeměpis', 7, 'prirodovedne', 2, 0),
(22, 'psychologie', 7, 'humanitni', 2, 0),
(23, 'výtvarná tvorba', 7, 'umelecke', 1, 0),
(24, 'zeměpis', 8, 'prirodovedne', 2, 0),
(25, 'psychologie', 8, 'humanitni', 2, 0),
(26, 'chemie', 9, 'prirodovedne', 2, 0),
(27, 'dějepis', 9, 'humanitni', 3, 0),
(28, 'chemie', 10, 'prirodovedne', 2, 0),
(29, 'dějepis', 10, 'humanitni', 3, 0),
(30, 'biochemie', 11, 'prirodovedne', 1, 0),
(31, 'dějepis', 11, 'humanitni', 3, 0),
(32, 'biologie', 12, 'prirodovedne', 2, 0),
(33, 'biologie', 13, 'prirodovedne', 2, 0),
(34, 'společenskovědní seminář', 13, 'humanitni', 1, 0),
(35, 'matematika rozšířená*', 14, 'technicke', 4, 1),
(36, 'matematika základní*', 14, 'prirodovedne', 2, 1),
(37, 'matematika rozšířená*', 15, 'technicke', 4, 1),
(38, 'matematika základní*', 15, 'prirodovedne', 2, 1),
(39, 'matematika rozšířená*', 16, 'technicke', 4, 1),
(40, 'biologický seminář', 16, 'prirodovedne', 1, 0),
(41, 'Open Education', 16, 'humanitni', 1, 0),
(42, 'matematika rozšířená*', 17, 'technicke', 4, 1),
(43, 'anglická konverzace', 17, 'prirodovedne', 1, 0),
(44, 'německá konverzace', 17, 'humanitni', 1, 0),
(45, 'španělská konverzace', 17, 'umelecke', 1, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_oktava_optional`
--

CREATE TABLE `subjects_oktava_optional` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hours` int(11) NOT NULL,
  `teacher` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_oktava_optional`
--

INSERT INTO `subjects_oktava_optional` (`id`, `name`, `hours`, `teacher`) VALUES
(1, 'Divadelní soubor STOPA', 2, 'Jáša'),
(2, 'Debatní klub', 1, 'Plocar'),
(3, 'Konverzace ve španělském jazyce', 1, 'Cociňa');

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_prima_optional`
--

CREATE TABLE `subjects_prima_optional` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hours` int(11) NOT NULL,
  `teacher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_prima_optional`
--

INSERT INTO `subjects_prima_optional` (`id`, `name`, `hours`, `teacher`) VALUES
(1, 'Mladí debrujáři', 1, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_rocnik1`
--

CREATE TABLE `subjects_rocnik1` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `table_row_number` int(11) NOT NULL,
  `category` enum('technicke','prirodovedne','humanitni','umelecke') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_rocnik1`
--

INSERT INTO `subjects_rocnik1` (`id`, `name`, `table_row_number`, `category`) VALUES
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
-- Struktura tabulky `subjects_rocnik1_optional`
--

CREATE TABLE `subjects_rocnik1_optional` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hours` int(11) NOT NULL DEFAULT 1,
  `teacher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_rocnik1_optional`
--

INSERT INTO `subjects_rocnik1_optional` (`id`, `name`, `hours`, `teacher`) VALUES
(1, 'Divadelní soubor', 2, 'Jáša'),
(2, 'Debatní klub', 1, 'Plocar'),
(3, 'Konverzace ve španělském jazyce', 1, 'Cociňa'),
(4, 'Fotografie', 1, 'Nemergutová, Kozák');

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_rocnik2`
--

CREATE TABLE `subjects_rocnik2` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `table_row_number` int(11) NOT NULL,
  `category` enum('technicke','prirodovedne','humanitni','umelecke') NOT NULL,
  `hours` int(11) DEFAULT 1,
  `is_required_choice` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_rocnik2`
--

INSERT INTO `subjects_rocnik2` (`id`, `name`, `table_row_number`, `category`, `hours`, `is_required_choice`) VALUES
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
-- Struktura tabulky `subjects_rocnik2_optional`
--

CREATE TABLE `subjects_rocnik2_optional` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hours` int(11) NOT NULL DEFAULT 1,
  `teacher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_rocnik2_optional`
--

INSERT INTO `subjects_rocnik2_optional` (`id`, `name`, `hours`, `teacher`) VALUES
(1, 'Divadelní soubor STOPA', 2, 'Jáša'),
(2, 'Debatní klub', 1, 'Plocar'),
(3, 'Konverzace ve španělském jazyce', 1, 'Cociňa'),
(4, 'Fotografie', 1, 'Nemergutová, Kozák');

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_rocnik3`
--

CREATE TABLE `subjects_rocnik3` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `table_row_number` int(11) NOT NULL,
  `category` enum('technicke','prirodovedne','humanitni','umelecke') NOT NULL,
  `hours` int(11) DEFAULT 1,
  `is_required_choice` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_rocnik3`
--

INSERT INTO `subjects_rocnik3` (`id`, `name`, `table_row_number`, `category`, `hours`, `is_required_choice`) VALUES
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
-- Struktura tabulky `subjects_rocnik3_optional`
--

CREATE TABLE `subjects_rocnik3_optional` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hours` int(11) NOT NULL,
  `teacher` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_rocnik3_optional`
--

INSERT INTO `subjects_rocnik3_optional` (`id`, `name`, `hours`, `teacher`) VALUES
(1, 'Divadelní soubor STOPA', 2, 'Jáša'),
(2, 'Debatní klub', 1, 'Plocar'),
(3, 'Konverzace ve španělském jazyce', 1, 'Cociňa'),
(4, 'Fotografie', 1, 'Nemergutová, Kozák');

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_rocnik4`
--

CREATE TABLE `subjects_rocnik4` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `table_row_number` int(11) NOT NULL,
  `category` enum('technicke','prirodovedne','humanitni','umelecke') NOT NULL,
  `hours` int(11) DEFAULT 1,
  `is_required_choice` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_rocnik4`
--

INSERT INTO `subjects_rocnik4` (`id`, `name`, `table_row_number`, `category`, `hours`, `is_required_choice`) VALUES
(1, 'fyzika', 1, 'technicke', 2, 0),
(2, 'latina', 1, 'humanitni', 2, 0),
(3, 'výtvarná výchova', 1, 'umelecke', 2, 0),
(4, 'fyzika', 2, 'technicke', 2, 0),
(5, 'latina', 2, 'humanitni', 2, 0),
(6, 'výtvarná výchova', 2, 'umelecke', 2, 0),
(7, 'aplikovaná fyzika', 3, 'technicke', 2, 0),
(8, 'antropologický seminář', 3, 'prirodovedne', 1, 0),
(9, 'historický seminář', 3, 'humanitni', 1, 0),
(10, 'aplikovaná fyzika', 4, 'technicke', 2, 0),
(11, 'evoluční biologie', 4, 'prirodovedne', 1, 0),
(12, 'literární seminář', 4, 'humanitni', 1, 0),
(13, 'deskriptivní geometrie', 5, 'technicke', 2, 0),
(14, 'VSP', 5, 'prirodovedne', 1, 0),
(15, 'anglické reálie', 5, 'humanitni', 1, 0),
(16, 'hudební výchova', 5, 'umelecke', 2, 0),
(17, 'deskriptivní geometrie', 6, 'technicke', 2, 0),
(18, 'aplikovaná psychologie', 6, 'prirodovedne', 1, 0),
(19, 'anglická literatura', 6, 'humanitni', 1, 0),
(20, 'hudební výchova', 6, 'umelecke', 2, 0),
(21, 'zeměpis', 7, 'prirodovedne', 2, 0),
(22, 'psychologie', 7, 'humanitni', 2, 0),
(23, 'výtvarná tvorba', 7, 'umelecke', 1, 0),
(24, 'zeměpis', 8, 'prirodovedne', 2, 0),
(25, 'psychologie', 8, 'humanitni', 2, 0),
(26, 'chemie', 9, 'prirodovedne', 2, 0),
(27, 'dějepis', 9, 'humanitni', 3, 0),
(28, 'chemie', 10, 'prirodovedne', 2, 0),
(29, 'dějepis', 10, 'humanitni', 3, 0),
(30, 'biochemie', 11, 'prirodovedne', 1, 0),
(31, 'dějepis', 11, 'humanitni', 3, 0),
(32, 'biologie', 12, 'prirodovedne', 2, 0),
(33, 'biologie', 13, 'prirodovedne', 2, 0),
(34, 'společenskovědní seminář', 13, 'humanitni', 1, 0),
(35, 'matematika rozšířená*', 14, 'technicke', 4, 1),
(36, 'matematika základní*', 14, 'prirodovedne', 2, 1),
(37, 'matematika rozšířená*', 15, 'technicke', 4, 1),
(38, 'matematika základní*', 15, 'prirodovedne', 2, 1),
(39, 'matematika rozšířená*', 16, 'technicke', 4, 1),
(40, 'biologický seminář', 16, 'prirodovedne', 1, 0),
(41, 'Open Education', 16, 'humanitni', 1, 0),
(42, 'matematika rozšířená*', 17, 'technicke', 4, 1),
(43, 'anglická konverzace', 17, 'prirodovedne', 1, 0),
(44, 'německá konverzace', 17, 'humanitni', 1, 0),
(45, 'španělská konverzace', 17, 'umelecke', 1, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_rocnik4_optional`
--

CREATE TABLE `subjects_rocnik4_optional` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hours` int(11) NOT NULL,
  `teacher` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_rocnik4_optional`
--

INSERT INTO `subjects_rocnik4_optional` (`id`, `name`, `hours`, `teacher`) VALUES
(1, 'Divadelní soubor STOPA', 2, 'Jáša'),
(2, 'Debatní klub', 1, 'Plocar'),
(3, 'Konverzace ve španělském jazyce', 1, 'Cociňa');

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_sekunda_optional`
--

CREATE TABLE `subjects_sekunda_optional` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hours` int(11) NOT NULL,
  `teacher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_sekunda_optional`
--

INSERT INTO `subjects_sekunda_optional` (`id`, `name`, `hours`, `teacher`) VALUES
(1, 'Mladí debrujáři', 1, NULL),
(2, 'Dramatická výchova', 2, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_septima`
--

CREATE TABLE `subjects_septima` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `table_row_number` int(11) NOT NULL,
  `category` enum('technicke','prirodovedne','humanitni','umelecke') NOT NULL,
  `hours` int(11) DEFAULT 1,
  `is_required_choice` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_septima`
--

INSERT INTO `subjects_septima` (`id`, `name`, `table_row_number`, `category`, `hours`, `is_required_choice`) VALUES
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
-- Struktura tabulky `subjects_septima_optional`
--

CREATE TABLE `subjects_septima_optional` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hours` int(11) NOT NULL,
  `teacher` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_septima_optional`
--

INSERT INTO `subjects_septima_optional` (`id`, `name`, `hours`, `teacher`) VALUES
(1, 'Divadelní soubor STOPA', 2, 'Jáša'),
(2, 'Debatní klub', 1, 'Plocar'),
(3, 'Konverzace ve španělském jazyce', 1, 'Cociňa'),
(4, 'Fotografie', 1, 'Nemergutová, Kozák');

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_sexta`
--

CREATE TABLE `subjects_sexta` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `table_row_number` int(11) NOT NULL,
  `category` enum('technicke','prirodovedne','humanitni','umelecke') NOT NULL,
  `hours` int(11) DEFAULT 1,
  `is_required_choice` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_sexta`
--

INSERT INTO `subjects_sexta` (`id`, `name`, `table_row_number`, `category`, `hours`, `is_required_choice`) VALUES
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
-- Struktura tabulky `subjects_sexta_optional`
--

CREATE TABLE `subjects_sexta_optional` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hours` int(11) NOT NULL DEFAULT 1,
  `teacher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_sexta_optional`
--

INSERT INTO `subjects_sexta_optional` (`id`, `name`, `hours`, `teacher`) VALUES
(1, 'Divadelní soubor STOPA', 2, 'Jáša'),
(2, 'Debatní klub', 1, 'Plocar'),
(3, 'Konverzace ve španělském jazyce', 1, 'Cociňa'),
(4, 'Fotografie', 1, 'Nemergutová, Kozák');

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_tercie`
--

CREATE TABLE `subjects_tercie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `table_row_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_tercie`
--

INSERT INTO `subjects_tercie` (`id`, `name`, `table_row_number`) VALUES
(1, 'Německý jazyk', 1),
(2, 'Španělský jazyk', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_tercie_optional`
--

CREATE TABLE `subjects_tercie_optional` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hours` int(11) NOT NULL DEFAULT 1,
  `teacher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `subjects_tercie_optional`
--

INSERT INTO `subjects_tercie_optional` (`id`, `name`, `hours`, `teacher`) VALUES
(1, 'Mladí debrujáři', 1, NULL),
(2, 'Dramatická výchova', 2, NULL),
(3, 'Konverzace ve španělském jazyce', 1, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `class` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `surname`, `password_hash`, `class`, `created_at`, `updated_at`, `admin`) VALUES
(2, 'admin-pglbc@doctrina.cz', '', '', '$2y$10$cXVcIK5v3S3AYzeAfFeJSuqlNldFmGyhxU2MP5uFiigD2xdWWrHo2', 'septima', '2025-03-25 13:34:22', '2025-04-11 10:01:22', 1),
(9, 'test1@doctrina.cz', 'Zbyněk', 'Plocar', '$2y$10$9uJw7knS4ua0LZQI6nP2le/emc/ARbZPM5uIm6PvYmMeSlt/HoJtC', 'kvinta', '2025-04-02 08:25:34', '2025-04-02 08:25:34', 0),
(10, 'test2@doctrina.cz', 'Zbyněk', 'Plocar', '$2y$10$elphmSa5uAMi7rY9Xzi5geQYkmv4BkJOdOnx4JIEOhD9Qk06qcyRy', 'rocnik2', '2025-04-02 09:01:25', '2025-04-02 09:01:25', 0),
(11, 'test3@doctrina.cz', 'Zbyněk', 'Plocar', '$2y$10$7zcGkdGfJBuuADxl3b.84eInsUHyT1gAUCSRG3Uz5LWpjuIEvj5NO', 'rocnik4', '2025-04-02 09:04:48', '2025-04-02 09:04:48', 0),
(12, 'michal.zapadlo@doctrina.cz', 'Michal', 'Zapadlo', '$2y$10$sKCIYS//6N/V3BMU6JyJ4eRn8XUirZCxIjkhKObQEuIC5orQLRz9S', 'kvarta', '2025-04-02 09:18:48', '2025-04-02 09:18:48', 0),
(13, 'vojtech.prinda@doctrina.cz', 'Vojtěch', 'Přinda', '$2y$10$qurG8Fg6qufn2KRjWN8qGufAQgzWhBhrP/VZa5C8DDMhzrqYukgau', 'kvinta', '2025-04-02 09:21:45', '2025-04-02 09:21:45', 0),
(14, 'kristyna.maslova@doctrina.cz', 'Kristýna', 'Máslová', '$2y$10$mOfta4mWPfoFR6jSwvcfm.93arVrj9CIlXWm0WPmgKwqcvo3U8MTO', 'rocnik2', '2025-04-02 09:23:17', '2025-04-02 09:23:17', 0),
(15, 'jiri.minar@doctrina.cz', 'Jiří', 'Minář', '$2y$10$pWvpjqWFf1R3lVMWrCuf8u9UhQPxAdVw6/ijGqJ0/V3GaQ32PGrQ.', 'sexta', '2025-04-02 09:23:25', '2025-04-02 09:23:25', 0),
(16, 'mariana.hlavackova@doctrina.cz', 'Mariana', 'Hlaváčková', '$2y$10$k23KcdiIeAMjbZJnUYTbPOV.KMKzsnozEt5ht8JgbXX9bELiL95Wm', 'rocnik2', '2025-04-02 09:23:30', '2025-04-02 09:23:30', 0),
(17, 'matej.kalina@doctrina.cz', 'Matěj', 'Kalina', '$2y$10$zTwkvs2RXJli8ukXtt7.auACMVviKTbDPpu3mhVweSNKGSfKcRvoy', 'rocnik2', '2025-04-02 09:25:34', '2025-04-02 09:25:34', 0),
(18, 'anna.kotrcova@doctrina.cz', 'Anna', 'Kotrčová', '$2y$10$KbDwj4m8ps/apDPeNsWyj.IEsjn061T0DJYJC1kdq5s2EWiKgbAlG', 'rocnik2', '2025-04-02 09:32:18', '2025-04-02 09:32:18', 0),
(19, 'jiri.salda@doctrina.cz', 'Jiří', 'Šalda', '$2y$10$FVHJdDvKGCE8rZG2tOaOF.KnyQfW4D18ehuXFtXeePSp68V15/KsS', 'kvinta', '2025-04-02 09:32:36', '2025-04-02 09:32:36', 0),
(21, 'kristyna.hrda@doctrina.cz', 'Kristýna', 'Hrdá', '$2y$10$yewl8LvSBByX5yUOdwr6t.SLdLjZvg9jruOYGkUNB2r97zfGDjg8u', 'rocnik2', '2025-04-02 09:43:26', '2025-04-02 09:43:26', 0),
(22, 'antonin.vokurka@doctrina.cz', 'Antonín', 'Vokurka', '$2y$10$dvKLkqSmXvRSTVJQNe8B4erHMGKZphXasOCCQLRK1WSvyxGWYkCGi', 'septima', '2025-04-02 09:46:55', '2025-04-02 09:46:55', 0),
(23, 'filip.jindra@doctrina.cz', 'Filip', 'Jindra', '$2y$10$amx3NviTYOW4ZwArx.0gAunmyPJCU372OehDPs8KOxMWcrw651ixG', 'rocnik4', '2025-04-02 09:49:41', '2025-04-02 09:49:41', 0),
(24, 'oskar.blecha@doctrina.cz', 'Oskar', 'Blecha', '$2y$10$3LNLogkmE8BFTu4bRyRaKec8QkDKHw.s.FFB3.BvSmDnc5l89ON.m', 'kvinta', '2025-04-02 09:54:07', '2025-04-02 09:54:07', 0),
(25, 'hynek.sedlbauer@doctrina.cz', 'Hynek', 'Šedlbauer', '$2y$10$pFDs5Rxo4ya5fd6kjDPvYutJoIPW9jaw0hm70x9OUBElb38d5lgI2', 'kvinta', '2025-04-02 10:01:59', '2025-04-02 10:01:59', 0),
(26, 'tereza.kulichova@doctrina.cz', 'Tereza', 'Kulichová', '$2y$10$emJVJsBhVzjfG97LP6HMP.nBMN0/RJnFXYLWc4wpZkLR0o//ZmjZu', 'rocnik2', '2025-04-02 10:52:21', '2025-04-02 10:52:21', 0),
(27, 'pavla.krystufkova@doctrina.cz', 'Pavla', 'Kryštůfková', '$2y$10$brLpMIp4gCWBu1mrFlGQ3OKcVi3QVvlAEmn6OmTZXN8CSZlGYiBdi', 'sexta', '2025-04-02 11:21:54', '2025-04-02 11:21:54', 0),
(28, 'matej.cepelka@doctrina.cz', 'Matěj', 'Čepelka', '$2y$10$tjkAaFNU2PO4WTTe88MG8./DI7OSCxGc6cHt.A.J8QkVOtyNsC5Nu', 'rocnik4', '2025-04-02 11:42:15', '2025-04-02 11:42:15', 0),
(29, 'zuzana.karvayova@doctrina.cz', 'Zuzana', 'Karvayová', '$2y$10$WgC2fwMDtSCAY4uyK0rJputtoO6UI2zfI8eI9KovuBBIU7HphIc06', 'rocnik2', '2025-04-02 12:16:03', '2025-04-02 12:16:03', 0),
(30, 'marie.sirova@doctrina.cz', 'Marie', 'Šírová', '$2y$10$7pUV5K4WQpo/QHhbTl7EbeDPEaN1FdoMqDQXZHoUp1SImH7dhEFta', 'rocnik2', '2025-04-02 12:29:48', '2025-04-02 12:29:48', 0),
(31, 'marek.jahoda@doctrina.cz', 'Marek', 'Jahoda', '$2y$10$WwTyFjQLzdNp9IQN4a2xAeGmpW3kP.uehv9kykoZnQZhaHdYQ0/ny', 'kvarta', '2025-04-02 13:20:54', '2025-04-02 13:20:54', 0),
(32, 'ema.markalousova@doctrina.cz', 'Ema', 'Markalousová', '$2y$10$9GJrsYAZDkDknAwWQO3sGeTRIEif86IWSNQ6CaDmmQk.z44XxRuqO', 'sekunda', '2025-04-02 14:20:41', '2025-04-02 14:20:41', 0),
(33, 'rozalie.nalezinkova@doctrina.cz', 'Rozálie Anna', 'Nalezinková', '$2y$10$2TJi9ZcOHzCo3s0YG0KBPuuYU5nCZrOIHJTE6jzGxbWziKQlRdFte', 'tercie', '2025-04-02 14:25:04', '2025-04-02 14:25:04', 0),
(34, 'lukas.dusek@doctrina.cz', 'Lukas', 'Dusek', '$2y$10$otQqS7VNQtK80AMU486OC.S3dACTrQnvcxMcgO05esEp.QngTDtL6', 'sekunda', '2025-04-02 14:27:14', '2025-04-02 14:27:14', 0),
(35, 'simona.petruzelova@doctrina.cz', 'Simona', 'Petruželová', '$2y$10$ua/hJO0cpeemZlWs1mRpIeojg//hhZ6Za15tOlr.IsQvYYWRbF9bq', 'oktava', '2025-04-02 14:34:25', '2025-04-02 14:34:25', 0),
(36, 'krystof.bures@doctrina.cz', 'Kryštof', 'Bureš', '$2y$10$MPAjV11umUnxCaMPAwKjyOvvwZ2.LZLGlWJCd21ye2MMHDvHIutbS', 'tercie', '2025-04-02 15:15:49', '2025-04-02 15:15:49', 0),
(37, 'adela.horcickova@doctrina.cz', 'Adéla', 'Horčičková', '$2y$10$FR/rk1lPPzkjnEpOqR5aAe6HYO.8eQd6J9lHsjr52236lBEc5mVGG', 'rocnik4', '2025-04-02 15:16:17', '2025-04-02 15:16:17', 0),
(38, 'jan.schon@doctrina.cz', 'Jan', 'Schön', '$2y$10$yVO0MMty.J/gFKQ4RSOHW.qidV3y3F/zbp484R/awgbA5kGhpLaGm', 'rocnik4', '2025-04-02 15:34:03', '2025-04-02 15:34:03', 0),
(39, 'rudolf.steger@doctrina.cz', 'Rudolf', 'Steger', '$2y$10$g64X2oV.hrlEazfvagqAC.PXxH2GVeUi9mvThR9E39I145ZJk1V8q', 'kvinta', '2025-04-02 16:22:57', '2025-04-02 16:22:57', 0),
(40, 'oliver.koblasa@doctrina.cz', 'Oliver', 'Koblasa', '$2y$10$ijvB.0BZj/LuuKJ.TNfaiuti9ENRduyX/FIbvRmLwa50aISjTNe7S', 'kvarta', '2025-04-02 16:31:56', '2025-04-02 16:31:56', 0),
(41, 'adam.farek@doctrina.cz', 'Adam', 'Fárek', '$2y$10$d2ba3B/GaFPSM5q6D5vb4.mZtXznFyToCXe15gaUT0N/nJ3qOcYNW', 'kvinta', '2025-04-02 17:04:27', '2025-04-02 17:04:27', 0),
(42, 'filip.benes@doctrina.cz', 'Filip', 'Beneš', '$2y$10$DX7q1iAd66ALq0rHrK4aGu32ItLdAQro1P4yv7G1Hz2wR9CoasWRi', 'oktava', '2025-04-02 17:05:30', '2025-04-02 17:05:30', 0),
(43, 'tereza.storkova@doctrina.cz', 'Tereza', 'Štorková', '$2y$10$hgufYnaU2PR4SVrgwtBrk.3al0CZCeezrCzO5EhOX/bdD9PwJsjW6', 'rocnik4', '2025-04-02 17:36:07', '2025-04-02 17:36:07', 0),
(44, 'ema.solic@doctrina.cz', 'Ema', 'Šolić', '$2y$10$7WtKLdRBgiotQHLUoAC1IOSYck7Nh/APPO4e0QZNdau3ea5D5396u', 'sexta', '2025-04-02 17:59:08', '2025-04-02 17:59:08', 0),
(45, 'jakub.vaclavik@doctrina.cz', 'Jakub', 'Václavík', '$2y$10$pc5T49c2a1ZJld5.6LVZ8eXX85.uoMp00Ia8FXKonPxzP/tFjMKeK', 'kvinta', '2025-04-02 18:08:32', '2025-04-02 18:08:32', 0),
(46, 'matej.uher@doctrina.cz', 'Matěj', 'Uher', '$2y$10$mbxMXzNGX4ZPZXsNa1qSKO.MD8nfZdnljTluIDJcdKbwAqfywptFq', 'tercie', '2025-04-02 18:17:26', '2025-04-02 18:17:26', 0),
(47, 'nela.jezkova@doctrina.cz', 'Nela', 'Ježková', '$2y$10$2VHaweLSDOdwKqlJc8J4IOBbWJHKLeKvR7PBgSpZ858x7dO/AFyfS', 'oktava', '2025-04-02 18:41:32', '2025-04-02 18:41:32', 0),
(48, 'justina.kirschnerova@doctrina.cz', 'Justina', 'Kirschnerová', '$2y$10$w2pxzXJkq8jq1juc1n9p6OvMuRYSUxqGdKg6kSm.hR8GOlkOgkPNu', 'rocnik3', '2025-04-02 19:15:22', '2025-04-02 19:15:22', 0),
(49, 'eleni.futerova@doctrina.cz', 'Eleni', 'Futerová', '$2y$10$iR7uP6w7.KFO6c9/oKYaH.IyzmwWilIYa.6mqpSxjBB2MkdikCJDi', 'oktava', '2025-04-02 19:31:13', '2025-04-02 19:31:13', 0),
(50, 'jonas.kucera@doctrina.cz', 'Jonáš', 'Kučera', '$2y$10$nNCRbfKbBIhnyzrVQrA8o.TgCdPqqjMI4s2IrXG.zFAun7t/eicOe', 'rocnik4', '2025-04-02 19:45:26', '2025-04-02 19:45:26', 0),
(51, 'hana.vaclavikova@doctrina.cz', 'Hana', 'Václavíková', '$2y$10$x7Z9pYcxD1Jpo8Fg5FR6zOD5wVI9pdEUKfjXu.B4RmTioU4UCDMLq', 'sexta', '2025-04-02 19:46:02', '2025-04-02 19:46:02', 0),
(52, 'ondrej.dumek@doctrina.cz', 'Ondřej', 'Dumek', '$2y$10$ZbLCQru1It8E3/Bv45vrkOqRsWy2ucS8R2TINJISK0uz38Z/kqDQW', 'tercie', '2025-04-02 19:57:19', '2025-04-02 19:57:19', 0),
(53, 'marek.jahoda2@doctrina.cz', 'Marek', 'Jahoda', '$2y$10$gpYpRTnlB7xPjOHADgBlZOsU1S/HHbY.cDNe.aKNW1i1ITAwOgMJq', 'kvinta', '2025-04-02 20:11:59', '2025-04-02 20:11:59', 0),
(54, 'barbora.simethova@doctrina.cz', 'Barbora', 'Simethová', '$2y$10$rg7z1Colmy7DnKGO0i9xrOHJPcHbMQ.DDRIqWIVz5m3byU0utdTRO', 'rocnik2', '2025-04-02 20:34:21', '2025-04-02 20:34:21', 0),
(55, 'richard.pech@doctrina.cz', 'richard', 'pech', '$2y$10$9rySW9ImbiJU2ykkYO.O..4xkmnolVOUxQUtmJ9ot9PXg7ufz6R3O', 'rocnik3', '2025-04-02 20:37:12', '2025-04-02 20:37:12', 0),
(56, 'ema.podsednikova@doctrina.cz', 'Ema', 'Podsedníková', '$2y$10$Q0jpE5TuHNdpkmFpvGgMk.eplqLW1hc08C.17XujfTGUK4TyXZ9Z6', 'rocnik2', '2025-04-02 20:46:25', '2025-04-02 20:46:25', 0),
(57, 'ondrej.nerad@doctrina.cz', 'Ondřej', 'Nerad', '$2y$10$h2OrQadx0cHVutFRWPo0qORem9KfSB8XXSZJ67/jpgm0aakgGhWUe', 'rocnik2', '2025-04-02 20:48:47', '2025-04-02 20:48:47', 0),
(58, 'jan.zemanek@doctrina.cz', 'Jan', 'Zemánek', '$2y$10$jQaDuRE.pAapu0R1ofB3IOuXN9drSbYgyMOeO7iqn6nBx6jMu05qq', 'rocnik2', '2025-04-02 21:00:22', '2025-04-02 21:00:22', 0),
(59, 'martin.kulhanek@doctrina.cz', 'Martin', 'Kulhánek', '$2y$10$f64SyFCRDGfx.629C4C0M..hO5PcPriR/kUJoDF3sCu.YSVGKWCqK', 'oktava', '2025-04-02 21:24:54', '2025-04-02 21:24:54', 0),
(60, 'adela.petrova@doctrina.cz', 'Adéla', 'Petrová', '$2y$10$xjscXCSup8wFymkhEKquY.uoB1rGgPm5kAywhrc6bCCJlD1eesbf6', 'oktava', '2025-04-02 21:33:56', '2025-04-02 21:33:56', 0),
(61, 'linda.steinerova@doctrina.cz', 'Linda', 'Steinerová', '$2y$10$1CiaE/5ztBzPsKsrX7tMe.hvFcpvxTaCHCQZe4/IbMqKDvDUD151K', 'oktava', '2025-04-02 21:49:35', '2025-04-02 21:49:35', 0),
(62, 'alzbeta.samalova@doctrina.cz', 'Alžběta', 'Šámalová', '$2y$10$0Z0WAa.h3b7ryHM/YGwI/evA95MDPblHZTAF5ggyiqWHGkqmK/xZ.', 'sekunda', '2025-04-02 22:20:13', '2025-04-02 22:20:13', 0),
(63, 'vojtech.votava@doctrina.cz', 'Vojtech', 'Votava', '$2y$10$4tFPkBragx8Jc4nz65Jhd.B2wwycQS9dQRHshRQRSPaV8BQx3Jzna', 'tercie', '2025-04-03 07:55:19', '2025-04-03 07:55:19', 0),
(64, 'jakub.vaclavik2@doctrina.cz', 'Jakub', 'Václavík', '$2y$10$M3DGAHWbZDv.XBYEQm1NxOd91oesR15MP/H6oNqHYJAx5mlUMFKbG', 'sexta', '2025-04-03 08:04:06', '2025-04-03 08:04:06', 0),
(65, 'ema.solic2@doctrina.cz', 'Ema', 'Šolić', '$2y$10$6zzUogXH.wCg.8.dAJG.O.r/Y3fAZ9cngC3EpsrvCV5EPnL7J/MJy', 'septima', '2025-04-03 08:19:32', '2025-04-03 08:19:32', 0),
(66, 'sofiya.lyvynyuk@doctrina.cz', 'Sofiya', 'Lyvynyuk', '$2y$10$9qJajcBqB.WHhouJ1iRHMO4uV8PZLtqEGIHCWaYQtX31abvmJ/a/.', 'kvinta', '2025-04-03 08:43:56', '2025-04-03 08:43:56', 0),
(67, 'alisa.skorochod@doctrina.cz', 'Alisa', 'Skorochod', '$2y$10$d/4jPxK/0eRCjPS9NY.5y.Md6ocqJcnK5S7fGOv27AKnBoQ7g/yWm', 'sekunda', '2025-04-03 08:49:50', '2025-04-03 08:49:50', 0),
(68, 'josefina.melkova@doctrina.cz', 'Josefína', 'Melková', '$2y$10$WhRJIIPebmIz9qyppGGq1.fzbuiQWZwoW5Pi5ZzOuEDysVA.MShEG', 'oktava', '2025-04-03 09:05:47', '2025-04-03 09:05:47', 0),
(69, 'lucie.futschikova@doctrina.cz', 'Lucie', 'Futschik', '$2y$10$SvKTEul6yt9de..jmFVgGuJs.D6DypkCltmvqfrheIgxI.KAKIloS', 'tercie', '2025-04-03 10:06:43', '2025-04-03 10:06:43', 0),
(70, 'magdalena.pytlounova@doctrina.cz', 'Magdaléna', 'Pytlounová', '$2y$10$xmnaTTj3qSdt2aKKRxjtoeC7nluj4eWvbU9F2Up4y/yaz8ntbjtba', 'sekunda', '2025-04-03 10:08:01', '2025-04-03 10:08:01', 0),
(71, 'krystof.kout@doctrina.cz', 'Kryštof', 'Kout', '$2y$10$SAXcn0tak8/5JhIqI6Jo/eB7v2vwnE9YA5djqSOPjNMVuE3/C4UFO', 'tercie', '2025-04-03 10:08:06', '2025-04-03 10:08:06', 0),
(72, 'marie.raslova@doctrina.cz', 'Marie', 'Raslová', '$2y$10$yYUNUVR8GIilS.E2/et78O66LKwBE1Y5nHJFKxT45/xeiUq9/EIke', 'tercie', '2025-04-03 10:08:46', '2025-04-03 10:08:46', 0),
(73, 'frantisek.cermak@doctrina.cz', 'František', 'Čermák', '$2y$10$9ziGEBHaaBvx1x2Ztu97OOnPotg4BSCDd5VMn7xA5fqnEhPySp5Hq', 'tercie', '2025-04-03 10:08:46', '2025-04-03 10:08:46', 0),
(74, 'adela.rasochova@doctrina.cz', 'Adéla', 'Rasochová', '$2y$10$tDw5sM6gjF9XVojrBZfB2uSHPsUnV7onZiT5zjjxRuQnw1XnFLed.', 'tercie', '2025-04-03 10:08:47', '2025-04-03 10:08:47', 0),
(75, 'jasmina.cerhova@doctrina.cz', 'Jasmína', 'Cerhová', '$2y$10$YxsX1hcO6lCY4H9MashGDePNqCGdItqQg4Gwvzi1sYYTwx.LV42Ga', 'tercie', '2025-04-03 10:08:47', '2025-04-03 10:08:47', 0),
(76, 'marie.denkova@doctrina.cz', 'Marie', 'Denková', '$2y$10$pO1JGxPLthJlkEzBxBUCyeELCTUUkrwr.swW/XNfu35D6tX0yR2rC', 'tercie', '2025-04-03 10:08:48', '2025-04-03 10:08:48', 0),
(77, 'lukas.dusek2@doctrina.cz', 'Lukáš', 'Dušek', '$2y$10$ypSO/BQUKU6HRgiGSMId0.Mv.IGcp/vENGlczJj8nm8Qm/Bu5d9fK', 'tercie', '2025-04-03 10:08:56', '2025-04-03 10:08:56', 0),
(78, 'klara.baudysova@doctrina.cz', 'Klára', 'Baudyšová', '$2y$10$Pmmr22X615vYw0LU7479xOUjO74cCrxl7WPwGzd1L7B8/0Q/6EzTO', 'tercie', '2025-04-03 10:08:57', '2025-04-03 10:08:57', 0),
(79, 'benjamin.tuma@doctrina.cz', 'Benjamin', 'Tuma', '$2y$10$BrQnEnOlvf8yfwMrNj50fesERst0Ak6JWlegu/qAK9Z3zWbxPClEK', 'tercie', '2025-04-03 10:08:57', '2025-04-03 10:08:57', 0),
(80, 'matyas.barta@doctrina.cz', 'Matyáš', 'Bárta', '$2y$10$llRgDaS.sMbXh3PWg69h0e7WZrOngBdxtMexbFCFMaPaawd4swXN6', 'tercie', '2025-04-03 10:09:00', '2025-04-03 10:09:00', 0),
(81, 'johana.hajkova@doctrina.cz', 'Johana', 'Hájková', '$2y$10$iH1BN1LzjpqNokICQby9KumVy0TKV1OHWkyQF8s84E/3aNRcJ9nCm', 'tercie', '2025-04-03 10:09:01', '2025-04-03 10:09:01', 0),
(82, 'stella.fricova@doctrina.cz', 'Stella', 'Fričová', '$2y$10$jYt5fmAKK0dV4HZsHEdXCORRADSfhOQTe1xYfGc9T7IBGsESzA/ga', 'tercie', '2025-04-03 10:09:06', '2025-04-03 10:09:06', 0),
(83, 'eliska.ruzickova@doctrina.cz', 'Eliška', 'Růžičková', '$2y$10$vX/FS/5IPzxulQgIvWeL8ODReyNqBHgqGU485Va7ffpTQMhYRvOUG', 'tercie', '2025-04-03 10:09:12', '2025-04-03 10:09:12', 0),
(84, 'magdalena.pytlounova2@doctrina.cz', 'Magdaléna', 'Pytlounová', '$2y$10$qxboiqMpuC4PeIRc6M6X8.u6/O0gBzSDrpan/v45w6aFiy9D/NwyO', 'tercie', '2025-04-03 10:10:04', '2025-04-03 10:10:04', 0),
(85, 'eliza.chornei@doctrina.cz', 'Eliza', 'Chornei', '$2y$10$gbzWD1/IbziS7cTVEAsClOuAEY4czxLtYR0vHERJxbpngMVnEPoGG', 'sekunda', '2025-04-03 10:10:47', '2025-04-03 10:10:47', 0),
(86, 'eliza.chornei2@doctrina.cz', 'Eliza', 'Chornei', '$2y$10$AtMD005h29OEiFVkXcXciOVXmhgDGCrPBreQLFlzfa/x31h7jqmaK', 'tercie', '2025-04-03 10:15:00', '2025-04-03 10:15:00', 0),
(88, 'sebastian.bohun@doctrina.cz', 'Sebastián', 'Bohun', '$2y$10$JthTxFZTnTh.4GIOF7IyFOJRtE5Ak7X9J0tDaXZMTKGUik3xZNQTu', 'rocnik4', '2025-04-03 14:10:31', '2025-04-03 14:10:31', 0),
(89, 'natalie.pabiskova@doctrina.cz', 'Natálie', 'Pabišková', '$2y$10$6Z3Ns3AO5/BxLTmNzX63fe/bOV5ZEBCeoIb7U6BhuDnmIf6XCuY56', 'rocnik2', '2025-04-03 16:41:08', '2025-04-03 16:41:08', 0),
(90, 'max.pochman@doctrina.cz', 'Max', 'Pochman', '$2y$10$BFoF2Q2dUdmdFSOC65rgfOqcbT/tWwYrwkvCXrJXsYQQ8ynSznLJy', 'septima', '2025-04-03 18:56:47', '2025-04-03 18:56:47', 0),
(91, 'zizka@doctrina.cz', 'Tomáš', 'Žižka', '$2y$10$BTVGkHWtaHQC5TksCS49puBcWgh97qLIczftSzR7yazzUDf5mZWlq', 'sexta', '2025-04-03 19:42:36', '2025-04-06 22:32:24', 0),
(92, 'kristyna.shrbena@doctrina.cz', 'Kristýna', 'Shrbená', '$2y$10$uOklnrISv7MyjXvMKLaj4eVT3dI9OH6AiSFj1MiUOAEBHeZcwgaey', 'rocnik3', '2025-04-03 19:57:03', '2025-04-03 19:57:03', 0),
(93, 'richard.hanus@doctrina.cz', 'richard', 'hanuš', '$2y$10$pxo/conp51A.hc2sQD4osOL7seSMA3/XJGxzNBq/5OlVNFbj5yMIa', 'sekunda', '2025-04-03 20:16:12', '2025-04-03 20:16:12', 0),
(94, 'tereza.stranska@doctrina.cz', 'Tereza', 'Stránská', '$2y$10$zDv.8QZVIubTXXW3mpZRIOKbVkOKrgErr0DKgAT3.GbdcXCFw8qni', 'sexta', '2025-04-03 21:49:52', '2025-04-03 21:49:52', 0),
(95, 'antonin.sebanek@doctrina.cz', 'Antonín', 'Šebánek', '$2y$10$mvVdZ7GVWb.qLO8dZJz8s.EzXW4apy1eGj4l/5ke66yWD1LCnGGHK', 'kvinta', '2025-04-03 22:17:51', '2025-04-03 22:17:51', 0),
(96, 'katerina.kabatkova@doctrina.cz', 'Kateřina', 'Kabátková', '$2y$10$cdXbqsNIwLiIsNNWMooze.AZDJPjnt0mQ0tEkZgMEVF3Iq8mDz89O', 'oktava', '2025-04-03 23:23:21', '2025-04-03 23:23:21', 0),
(97, 'emma.jechova@doctrina.cz', 'Emma', 'Jechová', '$2y$10$jgZoQ76omufwgYL5XB2Dd..R/DLPuV2b8gnVNu15JCLk8M5eadrzO', 'rocnik2', '2025-04-04 07:13:16', '2025-04-04 07:13:16', 0),
(98, 'vaclav.vokurka@doctrina.cz', 'Václav', 'Vokurka', '$2y$10$rhPcxyoYoMZVqtgEmC4NauIR0xfLoEQ.u1xSAGdj.f8t0RiQWdqEC', 'kvinta', '2025-04-04 08:36:40', '2025-04-04 08:36:40', 0),
(99, 'david.zapadlo@doctrina.cz', 'David', 'Zapadlo', '$2y$10$v4qK4A/tyAXfWrgP/fCfouGHG4UJwrjEQrc2Us1vKm4SqF.xdg.HW', 'sekunda', '2025-04-04 09:58:21', '2025-04-04 09:58:21', 0),
(101, 'leonard.zemlik@doctrina.cz', 'Leonard', 'Zemlík', '$2y$10$JDAlGQJoDVDwvl4tMwirwejHLpyFI.roMLh5UuIWV9I8seO1ofCIu', 'sekunda', '2025-04-04 10:00:50', '2025-04-04 10:00:50', 0),
(102, 'anna.havrankova@doctrina.cz', 'Anna', 'Havránková', '$2y$10$yY5vyJvQb26WaxHdayTXKeoL/OX6v16jfdxEx92MNDNPX7Et1hgLW', 'sexta', '2025-04-04 10:08:35', '2025-04-04 10:08:35', 0),
(103, 'veronika.halirova@doctrina.cz', 'Veronika', 'Halířová', '$2y$10$mwoZBayNAbqDI/kH2SGRq..YDMWI8ubmCNrJJyYOdseIbpHAnkKaC', 'rocnik2', '2025-04-04 10:52:36', '2025-04-04 10:52:36', 0),
(104, 'antonin.adam@doctrina.cz', 'Antonín', 'Adam', '$2y$10$GPXfABJG0lYEuOv8e6Ga1Ogek.u9hgs9N980YKSxTNbDsupylElty', 'rocnik3', '2025-04-04 15:31:58', '2025-04-04 15:31:58', 0),
(105, 'anna.koutkova@doctrina.cz', 'Anna', 'Koutková', '$2y$10$0THdo30fioRco1UzHjPHrum4cdNV.dtNbCxMhoc9X.He0/XQ8n/kS', 'septima', '2025-04-04 15:46:39', '2025-04-04 15:46:39', 0),
(106, 'jakub.papirnik@doctrina.cz', 'Jakub', 'Papírník', '$2y$10$3IKSCChwKfWbW57HMw.L.uckgYQyHry6VZy3qUo7L6ejS7A4J6K9O', 'tercie', '2025-04-04 15:57:52', '2025-04-04 15:57:52', 0),
(107, 'marek.cerny@doctrina.cz', 'Marek', 'Černý', '$2y$10$ezzD2L2Tcc/pzyvudUeOIeh23A5CQjdjG1lxcAvq.9qxXjMjFfmvG', 'rocnik2', '2025-04-04 16:15:28', '2025-04-04 16:15:28', 0),
(108, 'marketa.hakrova@doctrina.cz', 'Markéta', 'Hakrová', '$2y$10$o3KmC0sliJ0dey01WNI1pOafYgoI1hE6lIubQbneoMEVEi8h5u8/6', 'rocnik3', '2025-04-04 16:45:45', '2025-04-04 16:45:45', 0),
(109, 'eliska.matyasova@doctrina.cz', 'Eliška', 'Matyášová', '$2y$10$lVQs25lqIDv1psVUeHUbfegmctDqQt4mY4CiWGCkg9mM4oSdrt.Di', 'rocnik3', '2025-04-04 16:51:05', '2025-04-04 16:51:05', 0),
(110, 'dominika.kopalova@doctrina.cz', 'Dominika', 'Kopalová', '$2y$10$IOSWORPq4hy0H5qTaMZvPO3ROMEZyHL7IrLa.vIXwmwIhmIGEcNcK', 'oktava', '2025-04-04 17:16:13', '2025-04-04 17:16:13', 0),
(111, 'sofie.dvorackova@doctrina.cz', 'Sofie', 'Dvořáčková', '$2y$10$5LYNjozizBt2joxHH8j6ouE7/DtzYH.MR0FetJ1YB5iMRSSl7DoF2', 'oktava', '2025-04-04 17:17:30', '2025-04-04 17:17:30', 0),
(112, 'agata.opalecka@doctrina.cz', 'Agáta', 'Opalecká', '$2y$10$EthEcz7aRsvydD.4Sun3xuytXRNUlcKRjMzFTckWub2aq3h3at7iS', 'rocnik3', '2025-04-04 17:20:59', '2025-04-04 17:20:59', 0),
(113, 'hana.hakrova@doctrina.cz', 'Hana', 'Hakrová', '$2y$10$xOpwYrkU6Qk67d69V.ITv.yTgdsYJTrmjF22b5lPJ4PITHNUowK9G', 'rocnik3', '2025-04-04 17:30:37', '2025-04-04 17:30:37', 0),
(114, 'filip.stadnik@doctrina.cz', 'Filip', 'Stádník', '$2y$10$XxfTIZYPViEPAOImwASj5OhNuqFAgrIKHGdGO2spQG8.D7Jy/FUvO', 'rocnik2', '2025-04-04 20:07:48', '2025-04-04 20:07:48', 0),
(115, 'david.bures@doctrina.cz', 'David', 'Bureš', '$2y$10$.0eiHezHjjBkqDMwgs0UkesHnAttxreaNG1FzwH1UK8eIcxtaJDXG', 'oktava', '2025-04-04 20:12:14', '2025-04-04 20:12:14', 0),
(116, 'marek.foukal@doctrina.cz', 'Marek', 'Foukal', '$2y$10$5GXcrtCn5c96NMK7yhQPgu8Kvs/coNfn7hmFg4UUMgwHmAYwz3pjG', 'sekunda', '2025-04-04 20:42:46', '2025-04-04 20:42:46', 0),
(117, 'vitek.hotar@doctrina.cz', 'Vítek', 'Hotař', '$2y$10$rz4.hXVq3KG9WrKzvFc0puYSMKKJ17gqqWiGd8b8eHdTNLNQEqEp2', 'rocnik2', '2025-04-04 20:56:18', '2025-04-04 20:56:18', 0),
(118, 'jan.litvan@doctrina.cz', 'Jan', 'Litvan', '$2y$10$mpi/lLgcHIrm2BgLkMiIS.GB42eB1GVEa5giTQofpgTZfIxoOo1Yq', 'oktava', '2025-04-05 08:28:14', '2025-04-05 08:28:14', 0),
(119, 'ondrej.prokes@doctrina.cz', 'Ondřej', 'Prokeš', '$2y$10$uok2k6GzlBLYW91Y1/EvNeEm2yn3GnKs.X30GJu4dF1f0go3ljEbi', 'sekunda', '2025-04-05 09:58:48', '2025-04-05 09:58:48', 0),
(120, 'matous.papirnik@doctrina.cz', 'Matouš', 'Papírník', '$2y$10$pVoTA89ArrHV/SI0tnV4oOka0o20/N26.DljpzEAbJf4/NbF8wYcG', 'rocnik4', '2025-04-05 13:27:03', '2025-04-05 13:27:03', 0),
(121, 'julie.hronova@doctrina.cz', 'Julie', 'Hronová', '$2y$10$dHXdQZKwPOl.G801Bj59BOgJTmxVM1VK/X2cA6bBS4Y9unTRVgD3a', 'kvinta', '2025-04-05 15:40:30', '2025-04-05 15:40:30', 0),
(122, 'viktorie.rosselova@doctrina.cz', 'Viktorie', 'Rösselová', '$2y$10$.EZFZr2vIYQJpEPSnA.ETe4e6bF3FIfNaoa6ZNLiGU6G5rE.xbj.y', 'rocnik3', '2025-04-05 19:21:04', '2025-04-05 19:21:04', 0),
(123, 'karolina.turcikova@doctrina.cz', 'Karolína', 'Turčíková', '$2y$10$qap4Uw0FssOAfx3EMYAjIOzvhq4UikpZqqrcQiy2B.BD7OFV9qf1.', 'sekunda', '2025-04-06 09:50:31', '2025-04-06 09:50:31', 0),
(124, 'aneta.hajkova@doctrina.cz', 'Aneta', 'Hájková', '$2y$10$FZFx/BBCapp/hvMSfOTfdepsVlc5ETwVmq/yqf/Xi.oQS.bt1cH0u', 'sekunda', '2025-04-06 12:50:11', '2025-04-07 10:56:08', 0),
(126, 'lucie.votrubcova@doctrina.cz', 'Lucka', 'Votrubcová', '$2y$10$R2NtKmSQ3iA/MzErp9HTmu7XXySHXi1ynuspQkblVgVb61uHpQati', 'rocnik2', '2025-04-06 13:13:47', '2025-04-06 13:13:47', 0),
(127, 'filip.popelak@doctrina.cz', 'Filip Robert', 'Popelák', '$2y$10$.X2g50ElJoItPXRwVOwaJ.jyYAj4i910HCMgUIIK3ALlPv5uhorAW', 'kvinta', '2025-04-06 13:35:42', '2025-04-06 13:35:42', 0),
(128, 'emilie.solcova@doctrina.cz', 'Emilie', 'Šolcová', '$2y$10$KXKSLtjorSIHijbXoXz4IelOA8hvDBNiEAkg7y49FKpj.EDSnQa5K', 'septima', '2025-04-06 17:02:21', '2025-04-06 17:02:21', 0),
(129, 'sofie.mazur@doctrina.cz', 'Sofia', 'Mazur', '$2y$10$kFUb7xSAyTgi9Lkv46O1MOTUyp3NytD.rznQYU99ORSe9li6ElKLC', 'sexta', '2025-04-06 17:41:43', '2025-04-06 17:41:43', 0),
(130, 'adam.handrk@doctrina.cz', 'Adam', 'Handrk', '$2y$10$HdNhQC7HxAWs8VdMLCidvuNBkeCfdzgyBQpLjJ6cIxDWnCOa/zETm', 'sekunda', '2025-04-06 17:42:01', '2025-04-06 17:42:01', 0),
(131, 'klaudie.novotna@doctrina.cz', 'Klaudie', 'Novotná', '$2y$10$1YHgH5LG24evqf24t1WxRelAMgXAmvk2eP1bytFi1Wm0Qg7qQePMS', 'sekunda', '2025-04-06 18:05:38', '2025-04-06 18:05:38', 0),
(132, 'killichova.j@doctrina.cz', 'Jitka', 'Killichová', '$2y$10$Lzd7hx1uPyUYt0rpV0B9..Cg1xojLwpB.Y6fl/tOlla5yhsG2Ym3G', 'sekunda', '2025-04-06 18:32:36', '2025-04-06 18:32:36', 0),
(133, 'zuzana.stverakova@doctrina.cz', 'Zuzana', 'Štveráková', '$2y$10$vmtSj.pPQJucH8UDCuPSquwjsIgnyt3HeWRWxOuI5bu67Ye1AEbKG', 'oktava', '2025-04-06 19:26:29', '2025-04-06 19:26:29', 0),
(134, 'zuzana.tlapakova@doctrina.cz', 'Zuzana', 'Tlapáková', '$2y$10$E8MmLsBNrk5JglzhecJF6uHEOr6Gir9PWCBsYrgZ3kWOtwFIgWf6W', 'rocnik4', '2025-04-06 19:29:12', '2025-04-06 19:29:12', 0),
(135, 'valentyna.sedlarova@doctrina.cz', 'Valentýna', 'Sedlářová', '$2y$10$q0xxok1SfcMXSVZ2lrWyVuif8z0G0eHF3.ygq784XVy4UMvBo1iO2', 'rocnik4', '2025-04-06 19:32:01', '2025-04-06 19:32:01', 0),
(136, 'andrea.pospisilova@doctrina.cz', 'Andrea', 'Pospíšilová', '$2y$10$Ok.a6uekIOFcjBv6gdsiXuOdA/d6fnSoofhhyQMPOTnCxRS1VZdEq', 'kvinta', '2025-04-06 19:56:56', '2025-04-06 19:56:56', 0),
(137, 'mikulas.uhyrek@doctrina.cz', 'Mikuláš', 'Uhýrek', '$2y$10$X6VONbK3iOuNlhlGIFk09edfbkB.XSiS2uv9iH1Cigpv.ik9zkzVu', 'kvarta', '2025-04-06 20:59:32', '2025-04-06 20:59:32', 0),
(138, 'jiri.roubicek@doctrina.cz', 'Jiří', 'Roubíček', '$2y$10$/7qOpVh7DLQm3Fk8RQLZwOiKgFrg6MIRy0WRFaIaozgrFCh5nX//a', 'kvinta', '2025-04-07 08:53:28', '2025-04-07 08:53:28', 0),
(139, 'tatiana.hruzova@doctrina.cz', 'Tatiana', 'Hrůzová', '$2y$10$BHJ3Z9lyQThun8d7I4jMtexlvQ.c22wr.CoNFFm6Jitf0jM99MyJW', 'septima', '2025-04-07 09:07:09', '2025-04-07 09:07:09', 0),
(140, 'vlada.kaspar@doctrina.cz', 'Vladimír', 'Kašpar', '$2y$10$iaZn39hwk.1LaYOx7Ww0q.VewtARe9rOhNZ5ZQQtLLorQC31wCtay', 'rocnik2', '2025-04-07 09:51:41', '2025-04-07 09:51:41', 0),
(141, 'anna.nedvidkova@doctrina.cz', 'Anna', 'Nedvídková', '$2y$10$326ldA3uhDLwHMvlOdMmJuJLAv9TEXo9wd4rkkSkt9r8STiSGNI76', 'sekunda', '2025-04-07 10:00:39', '2025-04-07 10:55:37', 0),
(142, 'tomas.trejbal@doctrina.cz', 'Tomáš', 'Trejbal', '$2y$10$CXi68dHxyefegj94zdgI/unP7W9WZUwglqGDwQFVsbhdQPSMT9SvK', 'rocnik4', '2025-04-07 10:39:19', '2025-04-07 10:39:19', 0),
(143, 'stepanka.killichova@doctrina.cz', 'Štěpánka', 'Killichová', '$2y$10$tTNFpqVVX8UMrRejgzos/eGuXqlGPkMtayY7mu8CpL1p.vbljwTjC', 'sekunda', '2025-04-07 10:51:46', '2025-04-07 10:51:46', 0),
(144, 'terezie.telekesova@doctrina.cz', 'Terezie', 'Telekesová', '$2y$10$3jh8Sv9ijqkiaBuWB7HcQemx4D7jbW3yjEbSozGKG2s4Tv.zs2djS', 'sekunda', '2025-04-07 10:52:34', '2025-04-07 10:52:34', 0),
(145, 'katerina.kajzarova@doctrina.cz', 'Kateřina', 'Kajzarová', '$2y$10$9YBziQczAo/C1WNnLGnTg.15EXys5fOcDEjRQm.UFhCDxHeRCJ5N.', 'sekunda', '2025-04-07 10:54:43', '2025-04-07 10:54:43', 0),
(146, 'adela.bulirova@doctrina.cz', 'Adéla', 'Bulířová', '$2y$10$zyA5S8FKF/lHMpf/m55zNuWt59VQ9O0goFSmGQZ.BNTgFEhv9Zwie', 'sekunda', '2025-04-07 10:55:00', '2025-04-07 10:55:00', 0),
(147, 'johana.petrof@doctrina.cz', 'Johana', 'Petrof', '$2y$10$n28SRfDOlgXEjAGphzHQdOv2DHO9A3.TuhwGyhixP/9xCb3yhrYlW', 'septima', '2025-04-07 11:52:59', '2025-04-07 11:52:59', 0),
(148, 'johana.rechtackova@doctrina.cz', 'Johana', 'Řechtáčková', '$2y$10$sfvKkIaRl2K65cNbre.Lr.Y37KOWydgArFafCLomR94zhEcFCUP1e', 'sekunda', '2025-04-07 14:22:34', '2025-04-07 14:22:34', 0),
(149, 'petr.kasak@doctrina.cz', 'Petr', 'Kašák', '$2y$10$0DezNbiHHTtfKA.I3QcbYevmOYPQ6EezFanfUbmTrbB.JgNaXCqta', 'rocnik4', '2025-04-07 14:30:09', '2025-04-07 14:30:09', 0),
(150, 'sofie.vorlova@doctrina.cz', 'Sofie Anna', 'Vorlová', '$2y$10$BvpBrIrx5qEKFdHjJDPtteR3u6PawDDECGbxH5mjhIA2yuBseCWyS', 'rocnik4', '2025-04-07 14:40:22', '2025-04-07 14:40:22', 0),
(151, 'vaclav.poek@doctrina.cz', 'Václav', 'Poek', '$2y$10$7fG9loEv/vy1bXtuR.W9F.b./qgI3KlRoESMCNQgBtW/5ySbfzblS', 'sexta', '2025-04-07 17:48:38', '2025-04-07 17:48:38', 0),
(152, 'magdalena.prokesova@doctrina.cz', 'Magdaléna', 'Prokešová', '$2y$10$2LxFFJnvV2kWwz1PiiUwTesUoDnbw/AfzLAsVRVOGKRn2QWrsBDU2', 'kvinta', '2025-04-07 18:08:25', '2025-04-07 18:08:25', 0),
(153, 'filip.kotek@doctrina.cz', 'Filip', 'Kotek', '$2y$10$x8GY4J3e/v3YcrpQUf.sleN2G/S2H7V1oey2UUt8IRpDolLP9vUm2', 'oktava', '2025-04-07 19:08:45', '2025-04-07 19:08:45', 0),
(154, 'simon.bily@doctrina.cz', 'Šimon', 'Bílý', '$2y$10$itADuyb4U3fSHqq8CsUrcOEp1d0xghn.S.kpHRWFd2Nx3bvUqcJru', 'kvarta', '2025-04-07 19:31:22', '2025-04-07 19:31:22', 0),
(155, 'valerie.nalezinkova@doctrina.cz', 'Valérie', 'Nalezinková', '$2y$10$4tZ9gjV8HwnxQAUcy8UoZOVODPxV0tQ8DTIWYMFnQx0zd7z225dku', 'sexta', '2025-04-07 19:36:31', '2025-04-07 19:36:31', 0),
(156, 'david.kotek@doctrina.cz', 'David', 'Kotek', '$2y$10$ufBlt3mbGzGzONBHbqh5wejqUBwZ6LyXIhZXb/bVVV4m9KebgXzp.', 'oktava', '2025-04-07 19:55:59', '2025-04-07 19:55:59', 0),
(157, 'jana.jouzova@doctrina.cz', 'Jana', 'Jouzová', '$2y$10$xMVT6PnaolcH6rFFnaTdYOD/2i4fUE024OMhcnGiRcTdW5SyqOoJ6', 'rocnik4', '2025-04-07 19:56:18', '2025-04-07 19:56:18', 0),
(158, 'petr.hauzner@doctrina.cz', 'Petr', 'Hauzner', '$2y$10$7ZmPdO5X69iFv22M0HrFH.yk7u4t0dGC7frd2HrPwUzdqCGIf48XW', 'rocnik2', '2025-04-07 20:51:22', '2025-04-07 20:51:22', 0),
(159, 'michaela.chocova@doctrina.cz', 'Michaela', 'Chocová', '$2y$10$s18ad.KnO6u1Qw6M6Bj1L.it7Vl8dCEweaYQ4WX2e5.aTnYHsxGjK', 'rocnik2', '2025-04-07 20:52:03', '2025-04-07 20:52:03', 0),
(160, 'barbora.samalova@doctrina.cz', 'Barbora', 'Šámalová', '$2y$10$O1a80MBHanqRdSjMZAE55eRRTV55D5K0cVcU64.N2uiNcofpj/Jta', 'kvinta', '2025-04-07 21:47:18', '2025-04-07 21:47:18', 0),
(161, 'marketa.kunaskova@doctrina.cz', 'Markéta', 'Kunášková', '$2y$10$qYNgxTQihtABAvDCAV2eIOdo1D6g9o7GKcsGSeivwiE02FdmCJRHm', 'kvarta', '2025-04-08 09:47:21', '2025-04-08 09:47:21', 0),
(163, 'barbora.jakubcova@doctrina.cz', 'Barbora', 'Jakubcova', '$2y$10$TlQqE.kULdoO2laeFDj7HuROuXn6fLAQerUxNqPzWejLhr3NjTdaK', 'rocnik3', '2025-04-08 09:49:34', '2025-04-08 09:49:34', 0),
(164, 'josef.terc@doctrina.cz', 'Josef', 'Terč', '$2y$10$QaJS6.DUIC4pVSfh9XvlXuHytVBCsdWMLbc2ORR6XzlLB4BQ7r1lq', 'rocnik3', '2025-04-08 09:49:37', '2025-04-08 09:49:37', 0),
(165, 'filip.sokol@doctrina.cz', 'Filip Akira', 'Sokol', '$2y$10$3WTONgETcUNfKrhk141OKOiAYAt1iyAH8t5tYyeFAHqSg1Sv1kb5i', 'kvarta', '2025-04-08 10:52:54', '2025-04-08 10:52:54', 0),
(167, 'adriena.michalkova@doctrina.cz', 'Adriena', 'Michálková', '$2y$10$Iz8WpQ/qo9fyTIH0BT8q5eF/8ufUJnzKCMqJGSjwMEeaLMR7Fk3BK', 'rocnik4', '2025-04-08 11:45:13', '2025-04-08 11:45:13', 0),
(168, 'klara.hromadova@doctrina.cz', 'Klára', 'Hromadová', '$2y$10$Y8i5VVOvvspIvBxuKPQ49Oe6gWjLdMdiZZY.8/RgLOfDtxpH.m7Au', 'kvinta', '2025-04-08 11:56:35', '2025-04-08 11:56:35', 0),
(169, 'anna.feurichova@doctrina.cz', 'Anna', 'Feurichová', '$2y$10$sRafksFHm3WOP5CguFV8.OB99Prs8NBX8DAwi1weY1L0dNIpUo8na', 'kvinta', '2025-04-08 12:00:38', '2025-04-08 12:00:38', 0),
(170, 'nela.nyplova@doctrina.cz', 'Nela', 'Nyplová', '$2y$10$6ODmAPPX76iF2Hjg9PoF7ezEL9N4A0DAAmzhieWE6HLX.ScdyXlb2', 'septima', '2025-04-08 12:46:11', '2025-04-08 12:46:11', 0),
(171, 'valerie.saldova@doctrina.cz', 'Valerie', 'Šaldová', '$2y$10$delbIizMsFzmFoYPo4cYAO9Aq/JnoV0zHU6RActBaYDe9zTW.ynzK', 'septima', '2025-04-08 13:00:05', '2025-04-08 13:00:05', 0),
(172, 'oskar.kupec@doctrina.cz', 'Oskar', 'Kupec', '$2y$10$flo4qnvIJ23f199vi15r1OHNfyKZbgmI41K14MItNGy.X.uCU6K9e', 'septima', '2025-04-08 16:02:40', '2025-04-08 16:02:40', 0),
(173, 'David.gucik@doctrina.cz', 'David', 'Gúčik', '$2y$10$yJvY/lYCox1FTKxAUupLxOqbSIEMe6YwSVVfuKq7wVkQ1F9YH0ub2', 'septima', '2025-04-08 16:05:34', '2025-04-08 16:05:34', 0),
(174, 'laura.sestakova@doctrina.cz', 'Laura', 'Šestáková', '$2y$10$7BRurZgZGHSkajS5PzurC.TjWrrBXc5CdaXgFp6HLD4uy8PUQsOZ2', 'rocnik2', '2025-04-08 16:31:33', '2025-04-08 16:31:33', 0),
(175, 'amalie.vobornikova@doctrina.cz', 'Amálie', 'Voborníková', '$2y$10$DfCZFQ/c68wd9rFANuO98uz4V1MVy29gPPEakoUsBuCMIsAj3qd5C', 'kvarta', '2025-04-08 16:50:56', '2025-04-08 16:50:56', 0),
(176, 'krystof.hajnik@doctrina.cz', 'Kyštof', 'Hajník', '$2y$10$ytv9kRHQ1gySgGbwMtAVUuBhjeMbicxKCc6qQA0qfQcFu8h5zbYny', 'sekunda', '2025-04-08 16:56:51', '2025-04-08 16:56:51', 0),
(177, 'madeleine.fricova@doctrina.cz', 'Madeleine', 'Fričová', '$2y$10$sGWxuKRQL9LdYRV0Ffnyc.1kNI1C8MK4pBqyXeV0BfZ0SbmPrA0Me', 'sexta', '2025-04-08 17:00:56', '2025-04-08 17:00:56', 0),
(178, 'johana.sestakova@doctrina.cz', 'Johana', 'Šestáková', '$2y$10$MQNQXF7IxjTxlrQjyut5xeNOzox3BiBMII2K8J3OT59Ltn00oBaIK', 'sexta', '2025-04-08 18:34:01', '2025-04-08 18:34:01', 0),
(179, 'nela.dadourkova@doctrina.cz', 'Nela', 'Daďourková', '$2y$10$7Vnd1yg2vJY7EOADEnHD6efIPP4ktpWimyilRmZEd9pLXuFNGLFUS', 'sexta', '2025-04-08 18:48:38', '2025-04-08 18:48:38', 0),
(180, 'filip.kuchar@doctrina.cz', 'Filip', 'Kuchař', '$2y$10$OQjYDxlAStwmS0FxuxPqkO6opjtTQhQQhXbOnF21MqHYdBsJDFM.6', 'septima', '2025-04-08 19:35:51', '2025-04-08 19:35:51', 0),
(181, 'julie.nemcova@doctrina.cz', 'Julie', 'Němcová', '$2y$10$q8ddJIEEHB1IeOy8Iem3HulECSjlcNz2py/ONZ8rGqzbY7flpRzLW', 'sexta', '2025-04-08 19:59:33', '2025-04-08 19:59:33', 0),
(182, 'marek.zaklasnik@doctrina.cz', 'Marek', 'Záklasník', '$2y$10$UDGQvxPZsY4lZnd5nGPiG..mRUjla1.AI0D3MVlquStNspjdk3QK2', 'sexta', '2025-04-08 20:30:07', '2025-04-08 20:30:07', 0),
(183, 'anezka.labusova@doctrina.cz', 'Anežka', 'Lábusová', '$2y$10$wsy4/6rv0XYRxXXPUYcXQ.IehT0DPjp9/zGnzgAhjqu8X.acHANYG', 'rocnik4', '2025-04-08 21:06:51', '2025-04-08 21:06:51', 0),
(184, 'zuzana.stechova@doctrina.cz', 'Zuzana', 'Štěchová', '$2y$10$nxSXsaWdMVaigTS6sOCWAevVJu8Yqc.9NiuGXIyD.5kDDEYxp8tBW', 'rocnik3', '2025-04-08 21:22:23', '2025-04-08 21:22:23', 0),
(185, 'karolina.nejedlova@doctrina.cz', 'Karolína', 'Nejedlová', '$2y$10$ewrrVdSmXntuwcvUjy8eeOrgVeB7Yx1usjug5Kc0R5Gv6JwVp4Dg6', 'rocnik3', '2025-04-08 21:29:41', '2025-04-08 21:29:41', 0),
(186, 'tereza.radova@doctrina.cz', 'Tereza', 'Radová', '$2y$10$gJ6R7pK405Sp5gjcTWaCz.tcp6502XHXqxucxzgRAZrD8yBUTjkxm', 'kvinta', '2025-04-08 21:31:29', '2025-04-08 21:31:29', 0),
(187, 'barbora.dobra@doctrina.cz', 'Barbora', 'Dobrá', '$2y$10$BRGkezgFWgRzTLzTyGDUQe2Ig6Hfn/N/N3IlvvnlEkiFbUr4VXiMS', 'septima', '2025-04-08 21:34:15', '2025-04-08 21:34:15', 0),
(188, 'taisia.biriucova@doctrina.cz', 'Taisia', 'Biriucova', '$2y$10$5cZk3Fu/K36Josa6MZCpjukxw/CfPD3xaSAyxW5ThsC5wRW3arC1a', 'rocnik3', '2025-04-08 21:42:29', '2025-04-08 21:42:29', 0),
(189, 'lucie.faloutova@doctrina.cz', 'Lucie', 'Faloutová', '$2y$10$JKp3NhwCc8xTNHQAU7joQe14CkvFsE0hVz8ppuDPC0PRjHSrTG2LS', 'septima', '2025-04-08 21:57:39', '2025-04-08 21:57:39', 0),
(190, 'viktor.steger@doctrina.cz', 'Viktor', 'Steger', '$2y$10$0ay04WWE9uxJEz1LCz0LBOIHX2XTEcE5l7sx3OCRkVd9mHyXo/rya', 'oktava', '2025-04-08 22:16:16', '2025-04-08 22:16:16', 0),
(191, 'vojtech.moravek@doctrina.cz', 'Vojtěch', 'Morávek', '$2y$10$JIRMoEajo9gA6ouA57yyi.l0Yb4g0OBloYkpvCSiTF0nAo91poSiK', 'tercie', '2025-04-08 22:45:59', '2025-04-08 22:45:59', 0),
(192, 'zuzana.kajzarova@doctrina.cz', 'Zuzana', 'Kajzarová', '$2y$10$/Cel9nNu0bPaV0taUneahOURirvythf/op7kzDTd6ee.zxbQhIIF6', 'kvarta', '2025-04-09 08:20:24', '2025-04-09 08:20:24', 0),
(193, 'jan.fedorcak@doctrina.cz', 'Jan', 'Fedorčák', '$2y$10$JgrQmz2k4nEqcytjj3HOhuLgyuXHUwcR/LEBCAAOJnGYV4CK1fCw.', 'rocnik3', '2025-04-09 09:49:40', '2025-04-09 09:49:40', 0),
(194, 'frantisek.vanek@doctrina.cz', 'František Alexandr', 'Vaněk', '$2y$10$8NdBogUdNA8BjJ7mu.O6G.CtnGCtrCosOj19Uy78U26/ib3Ifrjj.', 'septima', '2025-04-09 10:06:32', '2025-04-09 10:06:32', 0),
(195, 'vilem.redl@doctrina.cz', 'Vilém', 'Redl', '$2y$10$iIO5HHM5VnhSG3JHWfbxmO24S2voAyHZBBL1wdPSB8L9t2lk/SOsC', 'septima', '2025-04-09 10:07:47', '2025-04-09 10:07:47', 0),
(196, 'matej.plsek@doctrina.cz', 'Matěj', 'Plšek', '$2y$10$8uH8k2VYeWEEyHN2Zoo2uOc6Xfx7oHWpYsnNFVAk/1adYfjWjhW6G', 'rocnik4', '2025-04-09 10:24:38', '2025-04-09 10:24:38', 0),
(197, 'elias.redl@doctrina.cz', 'Eliáš', 'Redl', '$2y$10$CZhXBvARFCraeRZhVTkOeuUx1ZoxNu8rSZBg8ggncbHmZMQTv84JO', 'kvarta', '2025-04-09 10:59:09', '2025-04-09 10:59:09', 0),
(198, 'petr.severa@doctrina.cz', 'Petr', 'Severa', '$2y$10$AFqhASs8cgNUUS9721yroeqcruQqGg3SjgxMq/kpfW0VxXVMIPizy', 'rocnik3', '2025-04-09 11:38:00', '2025-04-09 11:38:00', 0),
(199, 'jakub.svoboda@doctrina.cz', 'Jakub', 'Svoboda', '$2y$10$IbA/Xvy7OPPSGIMP5ib6G.fQtrmYocZfrrfFUloL6MMgZPJsafu.O', 'rocnik3', '2025-04-09 11:57:11', '2025-04-09 11:57:11', 0),
(200, 'tereza.kavalirova@doctrina.cz', 'Tereza', 'Kavalírová', '$2y$10$nqSPD.0v4.whhn7AGfMUVOIlIo9a7RevPPHoB8XpruOzmWtAqIDNi', 'rocnik4', '2025-04-09 11:57:50', '2025-04-09 11:57:50', 0),
(201, 'adam.fendrych@doctrina.cz', 'Adam', 'Fendrych', '$2y$10$VCoj6q4oTZnalXN69kui8eLGDfAaTmpb18TX9tvUHwhmI2L7tQeW6', 'rocnik3', '2025-04-09 12:21:57', '2025-04-09 12:21:57', 0),
(202, 'matyas.klepl@doctrina.cz', 'Matyáš', 'Klepl', '$2y$10$keKZGizvd723K7UVOhZVWOZjHgDbJxzyhfolA0EjjINvY0FSLG44q', 'sexta', '2025-04-09 12:25:19', '2025-04-09 12:25:19', 0),
(203, 'michaela.soldatova@doctrina.cz', 'Michaela', 'Soldátová', '$2y$10$GfLhK355lPiarNTCfFkUhO7XN5O9PoWyYRXNhUKbWs1i/SGDCDq1O', 'rocnik3', '2025-04-09 12:47:17', '2025-04-09 12:47:17', 0),
(204, 'stepan.masik@doctrina.cz', 'Štěpán', 'Mašík', '$2y$10$zWsxZRT4BAIS2AXZfkYJou55VX//nPSpG3rrNoSWoEd4fcjmvqSk2', 'rocnik3', '2025-04-09 13:14:16', '2025-04-09 13:14:16', 0),
(205, 'stepanka.bacova@doctrina.cz', 'Štěpánka', 'Báčová', '$2y$10$Y.bjQ5Ox5huTh2l.nZrEMeb7q2xcGgh4.SZbIJ1fFzjW./IWVmfhy', 'rocnik3', '2025-04-09 15:44:13', '2025-04-09 15:44:13', 0),
(206, 'hana.jirovska@doctrina.cz', 'Hana', 'Jírovská', '$2y$10$VPb3rgrs6dx2ZOf/bp1AzOI.rM4KrOgzl/gbXGX0t3i/L7AlB0.9e', 'kvinta', '2025-04-09 15:56:36', '2025-04-09 15:56:36', 0),
(207, 'klara.markova@doctrina.cz', 'Klára', 'Marková', '$2y$10$XIghAGx5FKx0DlMjDAayrutQ8p0IuL6UIW7Ep/zgPgP2UCSCI6Lzu', 'septima', '2025-04-09 16:50:58', '2025-04-09 16:50:58', 0),
(208, 'jakub.janousek@doctrina.cz', 'Jakub', 'Janoušek', '$2y$10$IbNdCB3M9We4oUul25CAGufMjH2PfSuqsNwfhC95Hq8iY69bcf2gi', 'rocnik2', '2025-04-09 17:15:18', '2025-04-09 17:15:18', 0),
(209, 'ella.prikrylova@doctrina.cz', 'Ella', 'Přikrylová', '$2y$10$rZygcWAAKIUl6Zf6R/zktueOqvQpdOjRiYpsvPDBcW4lIGmDfe6eK', 'rocnik4', '2025-04-09 17:57:38', '2025-04-09 17:57:38', 0),
(210, 'benjamin.plesak@doctrina.cz', 'Benjamín', 'Plešák', '$2y$10$FEMOdZH11vP3oiDKiVKxm.tsEnusmoeMTg1AZaJH/NPuenqH8Ooem', 'rocnik4', '2025-04-09 18:05:16', '2025-04-09 18:05:16', 0),
(211, 'lucie.korpasova@doctrina.cz', 'Lucie', 'Korpasová', '$2y$10$C.eA4jB4j0ta8lKEHzIlCep3IJ7sPSjV3UL.RTnPyiGOQx2r04Q9y', 'rocnik4', '2025-04-09 18:13:59', '2025-04-09 18:13:59', 0),
(212, 'adela.podholova@doctrina.cz', 'Adéla', 'Podholová', '$2y$10$0TsLSkpwagXyEFZ.lEnCAOHk2NTQurMMOh/ALYyKPgirxxdE5kSc.', 'sexta', '2025-04-09 18:15:01', '2025-04-09 18:15:01', 0),
(213, 'jakub.vondrous@doctrina.cz', 'jakub', 'vondrous', '$2y$10$LG4.W1jfhvF8Bl2OtC.V3OS2kVdm/cfDKkuCfiT/L.TT2XtBjCgES', 'oktava', '2025-04-09 18:32:40', '2025-04-09 18:32:40', 0),
(214, 'kristian.bohun@doctrina.cz', 'Kristian', 'Bohun', '$2y$10$lKxP8Wu2tjQMkxzbeS.J1ehkLxVOlopGY9MzCGokCwpbaO/rbHiZG', 'oktava', '2025-04-09 18:38:22', '2025-04-09 18:38:22', 0),
(215, 'jakub.dusek@doctrina.cz', 'Jakub', 'Dusek', '$2y$10$ycauIArrT9JKaWJq7c3YNezb/C76FNHKiXkcU767C/CDN1jNV/Cny', 'oktava', '2025-04-09 18:42:03', '2025-04-09 18:42:03', 0),
(216, 'jiri.kosek@doctrina.cz', 'Jiří', 'Kosek', '$2y$10$7Ui/0j7qxPVIxqCW6vHN1ug7I4oOJ6/MDcJjxdP3gimwcb6wf9hPi', 'rocnik3', '2025-04-09 18:47:51', '2025-04-09 18:47:51', 0),
(217, 'zuzana.huskova@doctrina.cz', 'zuzana', 'hušková', '$2y$10$pqeJmr.gW.El5w8OslTwoeNaIjvClv/nTb9uP6FWa3nTmQU2aRgYi', 'septima', '2025-04-09 18:49:26', '2025-04-09 18:49:26', 0),
(218, 'matyas.mysik@doctrina.cz', 'Matyáš', 'Mysík', '$2y$10$ubgRhHj.Do/UtxgFV3yaKeDgz5u.96Cmq4G66sEhjUokAYB22pJfi', 'sexta', '2025-04-09 19:05:19', '2025-04-09 19:05:19', 0),
(219, 'alzbeta.minsterova@doctrina.cz', 'Alžběta', 'Minsterová', '$2y$10$rIWkg9tNM7iMrS.4y4DSPuEqLATnRotvzJ9X5gMKzygW96BCDjLy.', 'rocnik4', '2025-04-09 19:30:51', '2025-04-09 19:30:51', 0),
(220, 'David.Trpisovsky@doctrina.cz', 'David', 'Trpišovsky', '$2y$10$sn3cWZoQgSXUhs64bHfAiOoQK9qWaVSs7d//5V.ENEn6NOwxkna6C', 'sexta', '2025-04-09 20:50:19', '2025-04-09 20:50:19', 0),
(221, 'alzbeta.hronova@doctrina.cz', 'Alžběta', 'Hronová', '$2y$10$jgHkp2Co8jT0crP1AXbo5O.G0fMIn5aWh9AQEAyiS0ArMnz/.lWE2', 'septima', '2025-04-09 20:51:12', '2025-04-09 20:51:12', 0),
(222, 'sofie.baranikova@doctrina.cz', 'Sofie', 'Baraníková', '$2y$10$SLxY7eO0iMu7hJY8bOurRuZV/oZ1HDAZbc2DUwRmoFEQnaJUuU8je', 'kvinta', '2025-04-09 20:53:13', '2025-04-09 20:53:13', 0),
(223, 'julie.horatschkeova@doctrina.cz', 'Julie', 'Horatschkeová', '$2y$10$UdkyfPaW53iTCjNk9rF4He2vpo6QLpLAaSJbtG12GExJQPlZdeHHS', 'septima', '2025-04-09 21:05:12', '2025-04-09 21:05:12', 0),
(224, 'dominik.cesar@doctrina.cz', 'Dominik', 'Cesar', '$2y$10$u1iD4DD8D7qrRoF20HuOEusiJt2Inemw3ObrClT288R5clTynGHc.', 'rocnik2', '2025-04-09 21:45:11', '2025-04-09 21:45:11', 0),
(225, 'patrik.steiner@doctrina.cz', 'Patrik', 'Steiner', '$2y$10$SE5g2eRAsk3ZMhNMY8PYfeBueAcRUUFoXTWKBI3gsi9zA2L66jwJ2', 'sexta', '2025-04-09 22:15:46', '2025-04-09 22:15:46', 0),
(226, 'ema.belohlavkova@doctrina.cz', 'Ema', 'Bělohlávková', '$2y$10$LnkkiTzXAt6CjkcXDNu2du36L7YFlhguVKjUtP66tb47c4ks8Yx5u', 'kvarta', '2025-04-09 22:16:49', '2025-04-09 22:16:49', 0),
(227, 'tereza.loudova@doctrina.cz', 'Tereza', 'Loudová', '$2y$10$sjBrrB67OL8q1HjygZAqKuzHWwZ6CqN6opwGsjOOjcQa6YAwDTNkK', 'rocnik3', '2025-04-09 22:54:55', '2025-04-09 22:54:55', 0),
(228, 'jan.pospisil@doctrina.cz', 'Jan', 'Pospíšil', '$2y$10$NjjJMbn6lDmIXl1PoTEBn.OEIpgWGqvcsNxML3y3dB8c1bxSOIdqe', 'rocnik4', '2025-04-09 23:13:38', '2025-04-09 23:13:38', 0),
(229, 'ondrej.beran@doctrina.cz', 'Ondřej', 'Beran', '$2y$10$5iojFlmv5OIaxrBrhKYUsObCR8Ob3KaIvI85rBrn1xqSmWW.IFjGu', 'oktava', '2025-04-09 23:24:19', '2025-04-09 23:24:19', 0),
(230, 'katerina.pelantova@doctrina.cz', 'Kateřina', 'Pelantová', '$2y$10$c54PP4IJDwS0v3Aq2HUjfOYYlARSn0PdgJUpPqA7Cs8dD3Nh6ue3C', 'oktava', '2025-04-09 23:25:30', '2025-04-09 23:25:30', 0),
(231, 'karolina.sirova@doctrina.cz', 'Karolina', 'Šírová', '$2y$10$1FDfN4KTqb4p3OjheVTk8e7nVgoKv5DmqTlY0ibY/CJcJ9kQRx12e', 'sexta', '2025-04-10 01:23:21', '2025-04-10 01:23:21', 0),
(232, 'matej.patocka@doctrina.cz', 'Matěj', 'Patočka', '$2y$10$Ie3YkygoZcgYWoQeEU67/uzDosn566YOOz7llpyi48QTF2Evhk2a6', 'rocnik3', '2025-04-10 07:37:10', '2025-04-10 07:37:10', 0),
(233, 'vojtech.kasper@doctrina.cz', 'Vojtěch', 'Kasper', '$2y$10$1j62esOUi0H7dF4oy/Biqe21oh7Ab0f5k.2Z7kbZA8A6EU7yGCRqy', 'septima', '2025-04-10 08:49:42', '2025-04-10 08:49:42', 0),
(234, 'daniel.tuma@doctrina.cz', 'Daniel', 'Tuma', '$2y$10$J/.NJybf8Ze5NEorf1ZSjerW0mA/h4/hUyAhVfOT884hWpCWlVJzy', 'kvinta', '2025-04-10 08:59:08', '2025-04-10 08:59:08', 0),
(235, 'mikulas.meduna@doctrina.cz', 'Mikuláš', 'Medůna', '$2y$10$aUNcWR.BpHxDc5na/TsKR.DnBy8nyNzwu/JCjgM3ubvWx.xrgNoHm', 'sekunda', '2025-04-10 09:41:48', '2025-04-10 09:41:48', 0),
(236, 'samuel.tuma@doctrina.cz', 'Samuel', 'Tuma', '$2y$10$6YiY7L0mKaUSlzcPQnSWRO3tSnItw1Yu287E34b7VY3U142lldRG2', 'septima', '2025-04-10 10:04:38', '2025-04-10 10:04:38', 0),
(237, 'jan.vodolan@doctrina.cz', 'Jan', 'Vodolan', '$2y$10$GEJNRmVyUKITzhb5sAVOpe7hffg/fJ6qz8Jod2UUo/6tbwcjEtZii', 'sexta', '2025-04-10 15:52:39', '2025-04-10 15:52:39', 0),
(238, 'amelie.roubickova@doctrina.cz', 'Amélie', 'Roubičková', '$2y$10$rRNBTd8WTLtjErxVN5GHZeA9vUMuxaXIuqOqAZXj8HzS9aYFUJfOy', 'sexta', '2025-04-10 16:20:56', '2025-04-10 16:20:56', 0),
(239, 'tereza.habelova@doctrina.cz', 'Tereza', 'Habelová', '$2y$10$qHKcoDXaMsJQtPSyDh9If.CxXrZidIZNQFzfvrWU/NJnPC3LH6jHi', 'oktava', '2025-04-10 19:45:11', '2025-04-10 19:45:11', 0),
(240, 'denis.zikmund@doctrina.cz', 'DENIS', 'ZIKMUND', '$2y$10$BAgi.C7qM.tJsq9lIQXcTuuQwRbo5V.GGYXhlY7mFTkWcouPu4BYC', 'sexta', '2025-04-10 23:03:24', '2025-04-10 23:03:24', 0),
(241, 'eva.nedvidkova@doctrina.cz', 'Eva', 'Nedvídková', '$2y$10$iSKn1gm2t9syN1mwZ.2dR.x4BClLy.GQT6sG5q3nXMXgrlD1dD2aq', 'kvarta', '2025-04-11 09:47:52', '2025-04-11 09:47:52', 0),
(242, 'vendula.ledlova@doctrina.cz', 'Vendula', 'Lédlová', '$2y$10$4ojYM1HZR6X0Sc.ONW3Aketx3kEHIgrRfOMtiHfngs3wPCdACsgB.', 'kvarta', '2025-04-11 09:48:58', '2025-04-11 09:48:58', 0),
(243, 'tereza.vodolanova@doctrina.cz', 'Tereza', 'Vodolanová', '$2y$10$EzERbf7Ef1kihET6HYiUzOC52mm2fy.WgXHPUzN3MvskhNoktRcJK', 'kvarta', '2025-04-11 09:49:21', '2025-04-11 09:49:21', 0),
(244, 'stepan.knezu@doctrina.cz', 'Štěpán', 'Knězů', '$2y$10$u7V41JplovCE6I2qb831juQtlZgP94.APiAbssp1uiV1H/T4K.Nee', 'kvarta', '2025-04-11 09:49:33', '2025-04-11 09:49:33', 0),
(245, 'eliska.poekova@doctrina.cz', 'Eliška', 'Poeková', '$2y$10$SE3ANoJvlY1jyRCS0uwOtu1GkiHP.TEt1T2wrN.DA8kkPQDHP3XRW', 'kvarta', '2025-04-11 09:49:36', '2025-04-11 09:49:36', 0),
(246, 'maxmilian.benes@doctrina.cz', 'Maxmilián', 'Beneš', '$2y$10$MdYkPfRsqslHSs6GF4wvc.BptvTTAmE1fhmRAwUdAIeCPZEuth8PW', 'tercie', '2025-04-11 09:50:43', '2025-04-11 09:50:43', 0),
(247, 'martin.krivohlavek@doctrina.cz', 'Martin', 'Křivohlavek', '$2y$10$ygnGLkZyNATAMMwgqDFlw.xtbuCsIJ6I2iD.Wlv/TywAXwGXxP9Wy', 'kvarta', '2025-04-11 09:50:52', '2025-04-11 09:50:52', 0),
(248, 'lena.dadourkova@doctrina.cz', 'Lena', 'Daďourková', '$2y$10$4RZ5uoHDo2tV6wweYggRWOvprRPVHUXHJEFdcw5.Bstob0RPi4izW', 'kvarta', '2025-04-11 09:51:08', '2025-04-11 09:51:08', 0),
(249, 'mikulas.sedlaty@doctrina.cz', 'Mikuláš', 'Sedlatý', '$2y$10$P0kUTVE6LJMGt/HxQ9Bxn.7G9bL5Ilb98rer.yga/jOkxXou.FCFq', 'tercie', '2025-04-11 09:51:17', '2025-04-11 09:51:17', 0),
(250, 'eliska.fertova@doctrina.cz', 'Eliška', 'Feřtová', '$2y$10$yDWzI8lvrD6hz3wK85/WDuE/TTd5nbXmPdoax93.0r2Qid9b5N6TC', 'tercie', '2025-04-11 09:51:32', '2025-04-11 09:51:32', 0),
(251, 'libor.lazur@doctrina.cz', 'Libor', 'Lazur', '$2y$10$JtjLR9ACKI1LdHrv.wVF3ecOyvT8adqFJqq7teTOo83IuJ0b4UDRK', 'tercie', '2025-04-11 09:52:39', '2025-04-11 09:52:39', 0),
(252, 'lenka.kneysova@doctrina.cz', 'Lenka', 'Kneysová', '$2y$10$CFK4HwkyQW.LmRhnZhXvBu1m7qE/m9A0pm1AuHTFCHjKLZepKx26.', 'tercie', '2025-04-11 16:29:09', '2025-04-11 16:29:09', 0),
(253, 'Viktorie.mareckova@doctrina.cz', 'Viktorie', 'Marečková', '$2y$10$fM5QK.iR2WhmDbiyqSP/vuAl1bybVQ1G8L5C.2t0sYKYbTr03SqkO', 'kvinta', '2025-04-11 20:16:31', '2025-04-11 20:16:31', 0),
(254, 'matej.matejcek@doctrina.cz', 'Matej', 'Matejcek', '$2y$10$JV5bCC9EX9uSzTKmTNtgZufY1nNtEQA54gP720cU10NejmjACDLuu', 'tercie', '2025-04-12 17:54:58', '2025-04-12 17:54:58', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `user_choices`
--

CREATE TABLE `user_choices` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `subject_class` varchar(50) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `user_choices`
--

INSERT INTO `user_choices` (`id`, `user_id`, `user_email`, `subject_id`, `subject_class`, `subject_name`, `created_at`) VALUES
(6, 10, 'test2@doctrina.cz', 5, 'rocnik2', 'programování', '2025-04-02 09:01:51'),
(7, 10, 'test2@doctrina.cz', 9, 'rocnik2', 'programování', '2025-04-02 09:01:51'),
(8, 10, 'test2@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-02 09:01:51'),
(9, 10, 'test2@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-02 09:01:51'),
(10, 10, 'test2@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-02 09:01:51'),
(21, 14, 'kristyna.maslova@doctrina.cz', 3, 'rocnik2', 'čtenářská gramotnost', '2025-04-02 09:27:47'),
(22, 14, 'kristyna.maslova@doctrina.cz', 10, 'rocnik2', 'Open Education', '2025-04-02 09:27:47'),
(23, 14, 'kristyna.maslova@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-02 09:27:47'),
(24, 14, 'kristyna.maslova@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-02 09:27:47'),
(25, 14, 'kristyna.maslova@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-02 09:27:47'),
(26, 18, 'anna.kotrcova@doctrina.cz', 4, 'rocnik2', 'výtvarná tvorba', '2025-04-02 09:34:08'),
(27, 18, 'anna.kotrcova@doctrina.cz', 10, 'rocnik2', 'Open Education', '2025-04-02 09:34:08'),
(28, 18, 'anna.kotrcova@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-02 09:34:08'),
(29, 18, 'anna.kotrcova@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-02 09:34:08'),
(30, 18, 'anna.kotrcova@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-02 09:34:08'),
(36, 27, 'pavla.krystufkova@doctrina.cz', 1, 'sexta', 'matematika rozšířená', '2025-04-02 11:22:50'),
(37, 27, 'pavla.krystufkova@doctrina.cz', 5, 'sexta', 'programování', '2025-04-02 11:22:50'),
(38, 27, 'pavla.krystufkova@doctrina.cz', 9, 'sexta', 'programování', '2025-04-02 11:22:50'),
(39, 27, 'pavla.krystufkova@doctrina.cz', 11, 'sexta', 'aplikovaná fyzika', '2025-04-02 11:22:50'),
(40, 27, 'pavla.krystufkova@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-02 11:22:50'),
(41, 28, 'matej.cepelka@doctrina.cz', 14, 'rocnik4', 'VSP', '2025-04-02 11:43:50'),
(42, 28, 'matej.cepelka@doctrina.cz', 21, 'rocnik4', 'zeměpis', '2025-04-02 11:43:50'),
(43, 28, 'matej.cepelka@doctrina.cz', 24, 'rocnik4', 'zeměpis', '2025-04-02 11:43:50'),
(44, 28, 'matej.cepelka@doctrina.cz', 27, 'rocnik4', 'dějepis', '2025-04-02 11:43:50'),
(45, 28, 'matej.cepelka@doctrina.cz', 29, 'rocnik4', 'dějepis', '2025-04-02 11:43:50'),
(46, 28, 'matej.cepelka@doctrina.cz', 31, 'rocnik4', 'dějepis', '2025-04-02 11:43:50'),
(47, 28, 'matej.cepelka@doctrina.cz', 34, 'rocnik4', 'společenskovědní seminář', '2025-04-02 11:43:50'),
(48, 28, 'matej.cepelka@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-02 11:43:50'),
(49, 28, 'matej.cepelka@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-02 11:43:50'),
(50, 28, 'matej.cepelka@doctrina.cz', 41, 'rocnik4', 'Open Education', '2025-04-02 11:43:50'),
(51, 29, 'zuzana.karvayova@doctrina.cz', 4, 'rocnik2', 'výtvarná tvorba', '2025-04-02 12:17:42'),
(52, 29, 'zuzana.karvayova@doctrina.cz', 10, 'rocnik2', 'Open Education', '2025-04-02 12:17:42'),
(53, 29, 'zuzana.karvayova@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-02 12:17:42'),
(54, 29, 'zuzana.karvayova@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-02 12:17:42'),
(55, 29, 'zuzana.karvayova@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-02 12:17:42'),
(56, 21, 'kristyna.hrda@doctrina.cz', 10, 'rocnik2', 'Open Education', '2025-04-02 12:30:50'),
(57, 21, 'kristyna.hrda@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-02 12:30:50'),
(58, 21, 'kristyna.hrda@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-02 12:30:50'),
(59, 21, 'kristyna.hrda@doctrina.cz', 14, 'rocnik2', 'anglická konverzace', '2025-04-02 12:30:50'),
(60, 21, 'kristyna.hrda@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-02 12:30:50'),
(61, 17, 'matej.kalina@doctrina.cz', 3, 'rocnik2', 'čtenářská gramotnost', '2025-04-02 12:30:51'),
(62, 17, 'matej.kalina@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-02 12:30:51'),
(63, 17, 'matej.kalina@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-02 12:30:51'),
(64, 17, 'matej.kalina@doctrina.cz', 15, 'rocnik2', 'německá konverzace', '2025-04-02 12:30:51'),
(65, 17, 'matej.kalina@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-02 12:30:51'),
(66, 30, 'marie.sirova@doctrina.cz', 4, 'rocnik2', 'výtvarná tvorba', '2025-04-02 12:30:53'),
(67, 30, 'marie.sirova@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-02 12:30:53'),
(68, 30, 'marie.sirova@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-02 12:30:53'),
(69, 30, 'marie.sirova@doctrina.cz', 14, 'rocnik2', 'anglická konverzace', '2025-04-02 12:30:53'),
(70, 30, 'marie.sirova@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-02 12:30:53'),
(81, 11, 'test3@doctrina.cz', 7, 'rocnik4', 'aplikovaná fyzika', '2025-04-02 16:13:59'),
(82, 11, 'test3@doctrina.cz', 10, 'rocnik4', 'aplikovaná fyzika', '2025-04-02 16:13:59'),
(83, 11, 'test3@doctrina.cz', 13, 'rocnik4', 'deskriptivní geometrie', '2025-04-02 16:13:59'),
(84, 11, 'test3@doctrina.cz', 17, 'rocnik4', 'deskriptivní geometrie', '2025-04-02 16:13:59'),
(85, 11, 'test3@doctrina.cz', 21, 'rocnik4', 'zeměpis', '2025-04-02 16:13:59'),
(86, 11, 'test3@doctrina.cz', 24, 'rocnik4', 'zeměpis', '2025-04-02 16:13:59'),
(87, 11, 'test3@doctrina.cz', 35, 'rocnik4', 'matematika rozšířená*', '2025-04-02 16:13:59'),
(88, 11, 'test3@doctrina.cz', 37, 'rocnik4', 'matematika rozšířená*', '2025-04-02 16:13:59'),
(89, 11, 'test3@doctrina.cz', 39, 'rocnik4', 'matematika rozšířená*', '2025-04-02 16:13:59'),
(90, 11, 'test3@doctrina.cz', 42, 'rocnik4', 'matematika rozšířená*', '2025-04-02 16:13:59'),
(91, 15, 'jiri.minar@doctrina.cz', 3, 'sexta', 'čtenářská gramotnost', '2025-04-02 18:32:41'),
(92, 15, 'jiri.minar@doctrina.cz', 6, 'sexta', 'regionální výzvy', '2025-04-02 18:32:41'),
(93, 15, 'jiri.minar@doctrina.cz', 10, 'sexta', 'Open Education', '2025-04-02 18:32:41'),
(94, 15, 'jiri.minar@doctrina.cz', 14, 'sexta', 'anglická konverzace', '2025-04-02 18:32:41'),
(95, 15, 'jiri.minar@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-02 18:32:41'),
(96, 47, 'nela.jezkova@doctrina.cz', 14, 'oktava', 'VSP', '2025-04-02 18:42:03'),
(97, 47, 'nela.jezkova@doctrina.cz', 22, 'oktava', 'psychologie', '2025-04-02 18:42:03'),
(98, 47, 'nela.jezkova@doctrina.cz', 25, 'oktava', 'psychologie', '2025-04-02 18:42:03'),
(99, 47, 'nela.jezkova@doctrina.cz', 26, 'oktava', 'chemie', '2025-04-02 18:42:03'),
(100, 47, 'nela.jezkova@doctrina.cz', 28, 'oktava', 'chemie', '2025-04-02 18:42:03'),
(101, 47, 'nela.jezkova@doctrina.cz', 34, 'oktava', 'společenskovědní seminář', '2025-04-02 18:42:03'),
(102, 47, 'nela.jezkova@doctrina.cz', 35, 'oktava', 'matematika rozšířená*', '2025-04-02 18:42:03'),
(103, 47, 'nela.jezkova@doctrina.cz', 37, 'oktava', 'matematika rozšířená*', '2025-04-02 18:42:03'),
(104, 47, 'nela.jezkova@doctrina.cz', 39, 'oktava', 'matematika rozšířená*', '2025-04-02 18:42:03'),
(105, 47, 'nela.jezkova@doctrina.cz', 42, 'oktava', 'matematika rozšířená*', '2025-04-02 18:42:03'),
(110, 48, 'justina.kirschnerova@doctrina.cz', 8, 'rocnik3', 'globální problémy', '2025-04-02 19:17:41'),
(111, 48, 'justina.kirschnerova@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-02 19:17:41'),
(112, 48, 'justina.kirschnerova@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-02 19:17:41'),
(113, 48, 'justina.kirschnerova@doctrina.cz', 25, 'rocnik3', 'německá konverzace', '2025-04-02 19:17:41'),
(114, 26, 'tereza.kulichova@doctrina.cz', 3, 'rocnik2', 'čtenářská gramotnost', '2025-04-02 19:30:58'),
(115, 26, 'tereza.kulichova@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-02 19:30:58'),
(116, 26, 'tereza.kulichova@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-02 19:30:58'),
(117, 26, 'tereza.kulichova@doctrina.cz', 15, 'rocnik2', 'německá konverzace', '2025-04-02 19:30:58'),
(118, 26, 'tereza.kulichova@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-02 19:30:58'),
(119, 49, 'eleni.futerova@doctrina.cz', 1, 'oktava', 'fyzika', '2025-04-02 19:32:23'),
(120, 49, 'eleni.futerova@doctrina.cz', 4, 'oktava', 'fyzika', '2025-04-02 19:32:23'),
(121, 49, 'eleni.futerova@doctrina.cz', 26, 'oktava', 'chemie', '2025-04-02 19:32:23'),
(122, 49, 'eleni.futerova@doctrina.cz', 28, 'oktava', 'chemie', '2025-04-02 19:32:23'),
(123, 49, 'eleni.futerova@doctrina.cz', 30, 'oktava', 'biochemie', '2025-04-02 19:32:23'),
(124, 49, 'eleni.futerova@doctrina.cz', 32, 'oktava', 'biologie', '2025-04-02 19:32:23'),
(125, 49, 'eleni.futerova@doctrina.cz', 33, 'oktava', 'biologie', '2025-04-02 19:32:23'),
(126, 49, 'eleni.futerova@doctrina.cz', 36, 'oktava', 'matematika základní*', '2025-04-02 19:32:23'),
(127, 49, 'eleni.futerova@doctrina.cz', 38, 'oktava', 'matematika základní*', '2025-04-02 19:32:23'),
(128, 49, 'eleni.futerova@doctrina.cz', 40, 'oktava', 'biologický seminář', '2025-04-02 19:32:23'),
(129, 37, 'adela.horcickova@doctrina.cz', 1, 'rocnik4', 'fyzika', '2025-04-02 19:35:34'),
(130, 37, 'adela.horcickova@doctrina.cz', 4, 'rocnik4', 'fyzika', '2025-04-02 19:35:34'),
(131, 37, 'adela.horcickova@doctrina.cz', 14, 'rocnik4', 'VSP', '2025-04-02 19:35:34'),
(132, 37, 'adela.horcickova@doctrina.cz', 26, 'rocnik4', 'chemie', '2025-04-02 19:35:34'),
(133, 37, 'adela.horcickova@doctrina.cz', 28, 'rocnik4', 'chemie', '2025-04-02 19:35:34'),
(134, 37, 'adela.horcickova@doctrina.cz', 30, 'rocnik4', 'biochemie', '2025-04-02 19:35:34'),
(135, 37, 'adela.horcickova@doctrina.cz', 32, 'rocnik4', 'biologie', '2025-04-02 19:35:34'),
(136, 37, 'adela.horcickova@doctrina.cz', 33, 'rocnik4', 'biologie', '2025-04-02 19:35:34'),
(137, 37, 'adela.horcickova@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-02 19:35:34'),
(138, 37, 'adela.horcickova@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-02 19:35:34'),
(139, 51, 'hana.vaclavikova@doctrina.cz', 1, 'sexta', 'matematika rozšířená', '2025-04-02 19:47:06'),
(140, 51, 'hana.vaclavikova@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-02 19:47:06'),
(141, 51, 'hana.vaclavikova@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-02 19:47:06'),
(142, 51, 'hana.vaclavikova@doctrina.cz', 15, 'sexta', 'německá konverzace', '2025-04-02 19:47:06'),
(143, 51, 'hana.vaclavikova@doctrina.cz', 17, 'sexta', 'výtvarná výchova', '2025-04-02 19:47:06'),
(144, 50, 'jonas.kucera@doctrina.cz', 8, 'rocnik4', 'antropologický seminář', '2025-04-02 20:01:06'),
(145, 50, 'jonas.kucera@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-02 20:01:06'),
(146, 50, 'jonas.kucera@doctrina.cz', 15, 'rocnik4', 'anglické reálie', '2025-04-02 20:01:06'),
(147, 50, 'jonas.kucera@doctrina.cz', 21, 'rocnik4', 'zeměpis', '2025-04-02 20:01:06'),
(148, 50, 'jonas.kucera@doctrina.cz', 24, 'rocnik4', 'zeměpis', '2025-04-02 20:01:06'),
(149, 50, 'jonas.kucera@doctrina.cz', 32, 'rocnik4', 'biologie', '2025-04-02 20:01:06'),
(150, 50, 'jonas.kucera@doctrina.cz', 33, 'rocnik4', 'biologie', '2025-04-02 20:01:06'),
(151, 50, 'jonas.kucera@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-02 20:01:06'),
(152, 50, 'jonas.kucera@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-02 20:01:06'),
(153, 50, 'jonas.kucera@doctrina.cz', 43, 'rocnik4', 'anglická konverzace', '2025-04-02 20:01:06'),
(154, 55, 'richard.pech@doctrina.cz', 4, 'rocnik3', 'výtvarná tvorba', '2025-04-02 20:38:05'),
(155, 55, 'richard.pech@doctrina.cz', 8, 'rocnik3', 'globální problémy', '2025-04-02 20:38:05'),
(156, 55, 'richard.pech@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-02 20:38:05'),
(157, 55, 'richard.pech@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-02 20:38:05'),
(163, 54, 'barbora.simethova@doctrina.cz', 1, 'rocnik2', 'matematika rozšířená', '2025-04-02 20:39:42'),
(164, 54, 'barbora.simethova@doctrina.cz', 6, 'rocnik2', 'regionální výzvy', '2025-04-02 20:39:42'),
(165, 54, 'barbora.simethova@doctrina.cz', 10, 'rocnik2', 'Open Education', '2025-04-02 20:39:42'),
(166, 54, 'barbora.simethova@doctrina.cz', 14, 'rocnik2', 'anglická konverzace', '2025-04-02 20:39:42'),
(167, 54, 'barbora.simethova@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-02 20:39:42'),
(168, 56, 'ema.podsednikova@doctrina.cz', 7, 'rocnik2', 'historický seminář', '2025-04-02 20:47:54'),
(169, 56, 'ema.podsednikova@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-02 20:47:54'),
(170, 56, 'ema.podsednikova@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-02 20:47:54'),
(171, 56, 'ema.podsednikova@doctrina.cz', 16, 'rocnik2', 'španělská konverzace', '2025-04-02 20:47:54'),
(172, 56, 'ema.podsednikova@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-02 20:47:54'),
(173, 58, 'jan.zemanek@doctrina.cz', 7, 'rocnik2', 'historický seminář', '2025-04-02 21:05:21'),
(174, 58, 'jan.zemanek@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-02 21:05:21'),
(175, 58, 'jan.zemanek@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-02 21:05:21'),
(176, 58, 'jan.zemanek@doctrina.cz', 16, 'rocnik2', 'španělská konverzace', '2025-04-02 21:05:21'),
(177, 58, 'jan.zemanek@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-02 21:05:21'),
(178, 59, 'martin.kulhanek@doctrina.cz', 15, 'oktava', 'anglické reálie', '2025-04-02 21:27:00'),
(179, 59, 'martin.kulhanek@doctrina.cz', 21, 'oktava', 'zeměpis', '2025-04-02 21:27:00'),
(180, 59, 'martin.kulhanek@doctrina.cz', 24, 'oktava', 'zeměpis', '2025-04-02 21:27:00'),
(181, 59, 'martin.kulhanek@doctrina.cz', 27, 'oktava', 'dějepis', '2025-04-02 21:27:00'),
(182, 59, 'martin.kulhanek@doctrina.cz', 29, 'oktava', 'dějepis', '2025-04-02 21:27:00'),
(183, 59, 'martin.kulhanek@doctrina.cz', 31, 'oktava', 'dějepis', '2025-04-02 21:27:00'),
(184, 59, 'martin.kulhanek@doctrina.cz', 36, 'oktava', 'matematika základní*', '2025-04-02 21:27:00'),
(185, 59, 'martin.kulhanek@doctrina.cz', 38, 'oktava', 'matematika základní*', '2025-04-02 21:27:00'),
(186, 59, 'martin.kulhanek@doctrina.cz', 41, 'oktava', 'Open Education', '2025-04-02 21:27:00'),
(187, 59, 'martin.kulhanek@doctrina.cz', 43, 'oktava', 'anglická konverzace', '2025-04-02 21:27:00'),
(188, 60, 'adela.petrova@doctrina.cz', 1, 'oktava', 'fyzika', '2025-04-02 21:34:51'),
(189, 60, 'adela.petrova@doctrina.cz', 4, 'oktava', 'fyzika', '2025-04-02 21:34:51'),
(190, 60, 'adela.petrova@doctrina.cz', 26, 'oktava', 'chemie', '2025-04-02 21:34:51'),
(191, 60, 'adela.petrova@doctrina.cz', 28, 'oktava', 'chemie', '2025-04-02 21:34:51'),
(192, 60, 'adela.petrova@doctrina.cz', 30, 'oktava', 'biochemie', '2025-04-02 21:34:51'),
(193, 60, 'adela.petrova@doctrina.cz', 32, 'oktava', 'biologie', '2025-04-02 21:34:51'),
(194, 60, 'adela.petrova@doctrina.cz', 33, 'oktava', 'biologie', '2025-04-02 21:34:51'),
(195, 60, 'adela.petrova@doctrina.cz', 36, 'oktava', 'matematika základní*', '2025-04-02 21:34:51'),
(196, 60, 'adela.petrova@doctrina.cz', 38, 'oktava', 'matematika základní*', '2025-04-02 21:34:51'),
(197, 60, 'adela.petrova@doctrina.cz', 40, 'oktava', 'biologický seminář', '2025-04-02 21:34:51'),
(198, 61, 'linda.steinerova@doctrina.cz', 15, 'oktava', 'anglické reálie', '2025-04-02 22:01:05'),
(199, 61, 'linda.steinerova@doctrina.cz', 19, 'oktava', 'anglická literatura', '2025-04-02 22:01:05'),
(200, 61, 'linda.steinerova@doctrina.cz', 21, 'oktava', 'zeměpis', '2025-04-02 22:01:05'),
(201, 61, 'linda.steinerova@doctrina.cz', 24, 'oktava', 'zeměpis', '2025-04-02 22:01:05'),
(202, 61, 'linda.steinerova@doctrina.cz', 27, 'oktava', 'dějepis', '2025-04-02 22:01:05'),
(203, 61, 'linda.steinerova@doctrina.cz', 29, 'oktava', 'dějepis', '2025-04-02 22:01:05'),
(204, 61, 'linda.steinerova@doctrina.cz', 31, 'oktava', 'dějepis', '2025-04-02 22:01:05'),
(205, 61, 'linda.steinerova@doctrina.cz', 34, 'oktava', 'společenskovědní seminář', '2025-04-02 22:01:06'),
(206, 61, 'linda.steinerova@doctrina.cz', 36, 'oktava', 'matematika základní*', '2025-04-02 22:01:06'),
(207, 61, 'linda.steinerova@doctrina.cz', 38, 'oktava', 'matematika základní*', '2025-04-02 22:01:06'),
(208, 64, 'jakub.vaclavik2@doctrina.cz', 1, 'sexta', 'matematika rozšířená', '2025-04-03 08:09:43'),
(209, 64, 'jakub.vaclavik2@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-03 08:09:43'),
(210, 64, 'jakub.vaclavik2@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-03 08:09:43'),
(211, 64, 'jakub.vaclavik2@doctrina.cz', 15, 'sexta', 'německá konverzace', '2025-04-03 08:09:43'),
(212, 64, 'jakub.vaclavik2@doctrina.cz', 17, 'sexta', 'výtvarná výchova', '2025-04-03 08:09:43'),
(213, 65, 'ema.solic2@doctrina.cz', 1, 'septima', 'matematika rozšířená', '2025-04-03 08:24:29'),
(214, 65, 'ema.solic2@doctrina.cz', 14, 'septima', 'deskriptivní geometrie', '2025-04-03 08:24:29'),
(215, 65, 'ema.solic2@doctrina.cz', 17, 'septima', 'deskriptivní geometrie', '2025-04-03 08:24:29'),
(216, 65, 'ema.solic2@doctrina.cz', 22, 'septima', 'finanční gramotnost', '2025-04-03 08:24:29'),
(217, 68, 'josefina.melkova@doctrina.cz', 19, 'oktava', 'anglická literatura', '2025-04-03 09:06:46'),
(218, 68, 'josefina.melkova@doctrina.cz', 21, 'oktava', 'zeměpis', '2025-04-03 09:06:46'),
(219, 68, 'josefina.melkova@doctrina.cz', 24, 'oktava', 'zeměpis', '2025-04-03 09:06:46'),
(220, 68, 'josefina.melkova@doctrina.cz', 27, 'oktava', 'dějepis', '2025-04-03 09:06:46'),
(221, 68, 'josefina.melkova@doctrina.cz', 29, 'oktava', 'dějepis', '2025-04-03 09:06:46'),
(222, 68, 'josefina.melkova@doctrina.cz', 31, 'oktava', 'dějepis', '2025-04-03 09:06:46'),
(223, 68, 'josefina.melkova@doctrina.cz', 35, 'oktava', 'matematika rozšířená*', '2025-04-03 09:06:46'),
(224, 68, 'josefina.melkova@doctrina.cz', 37, 'oktava', 'matematika rozšířená*', '2025-04-03 09:06:46'),
(225, 68, 'josefina.melkova@doctrina.cz', 39, 'oktava', 'matematika rozšířená*', '2025-04-03 09:06:46'),
(226, 68, 'josefina.melkova@doctrina.cz', 42, 'oktava', 'matematika rozšířená*', '2025-04-03 09:06:46'),
(227, 88, 'sebastian.bohun@doctrina.cz', 1, 'rocnik4', 'fyzika', '2025-04-03 16:12:47'),
(228, 88, 'sebastian.bohun@doctrina.cz', 4, 'rocnik4', 'fyzika', '2025-04-03 16:12:47'),
(229, 88, 'sebastian.bohun@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-03 16:12:47'),
(230, 88, 'sebastian.bohun@doctrina.cz', 26, 'rocnik4', 'chemie', '2025-04-03 16:12:47'),
(231, 88, 'sebastian.bohun@doctrina.cz', 28, 'rocnik4', 'chemie', '2025-04-03 16:12:47'),
(232, 88, 'sebastian.bohun@doctrina.cz', 30, 'rocnik4', 'biochemie', '2025-04-03 16:12:47'),
(233, 88, 'sebastian.bohun@doctrina.cz', 32, 'rocnik4', 'biologie', '2025-04-03 16:12:47'),
(234, 88, 'sebastian.bohun@doctrina.cz', 33, 'rocnik4', 'biologie', '2025-04-03 16:12:47'),
(235, 88, 'sebastian.bohun@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-03 16:12:47'),
(236, 88, 'sebastian.bohun@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-03 16:12:47'),
(245, 90, 'max.pochman@doctrina.cz', 1, 'septima', 'matematika rozšířená', '2025-04-03 19:49:53'),
(246, 90, 'max.pochman@doctrina.cz', 8, 'septima', 'globální problémy', '2025-04-03 19:49:53'),
(247, 90, 'max.pochman@doctrina.cz', 11, 'septima', 'ekologie', '2025-04-03 19:49:53'),
(248, 90, 'max.pochman@doctrina.cz', 23, 'septima', 'Open Education', '2025-04-03 19:49:53'),
(253, 92, 'kristyna.shrbena@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-03 20:09:39'),
(254, 92, 'kristyna.shrbena@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-03 20:09:39'),
(255, 92, 'kristyna.shrbena@doctrina.cz', 22, 'rocnik3', 'finanční gramotnost', '2025-04-03 20:09:39'),
(256, 92, 'kristyna.shrbena@doctrina.cz', 24, 'rocnik3', 'anglická konverzace', '2025-04-03 20:09:39'),
(257, 94, 'tereza.stranska@doctrina.cz', 3, 'sexta', 'čtenářská gramotnost', '2025-04-03 21:51:42'),
(258, 94, 'tereza.stranska@doctrina.cz', 6, 'sexta', 'regionální výzvy', '2025-04-03 21:51:42'),
(259, 94, 'tereza.stranska@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-03 21:51:42'),
(260, 94, 'tereza.stranska@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-03 21:51:42'),
(261, 94, 'tereza.stranska@doctrina.cz', 17, 'sexta', 'výtvarná výchova', '2025-04-03 21:51:42'),
(281, 102, 'anna.havrankova@doctrina.cz', 4, 'sexta', 'výtvarná tvorba', '2025-04-04 10:10:25'),
(282, 102, 'anna.havrankova@doctrina.cz', 6, 'sexta', 'regionální výzvy', '2025-04-04 10:10:25'),
(283, 102, 'anna.havrankova@doctrina.cz', 10, 'sexta', 'Open Education', '2025-04-04 10:10:25'),
(284, 102, 'anna.havrankova@doctrina.cz', 14, 'sexta', 'anglická konverzace', '2025-04-04 10:10:25'),
(285, 102, 'anna.havrankova@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-04 10:10:25'),
(291, 16, 'mariana.hlavackova@doctrina.cz', 1, 'rocnik2', 'matematika rozšířená', '2025-04-04 11:33:11'),
(292, 16, 'mariana.hlavackova@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-04 11:33:11'),
(293, 16, 'mariana.hlavackova@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-04 11:33:11'),
(294, 16, 'mariana.hlavackova@doctrina.cz', 15, 'rocnik2', 'německá konverzace', '2025-04-04 11:33:11'),
(295, 16, 'mariana.hlavackova@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-04 11:33:11'),
(301, 97, 'emma.jechova@doctrina.cz', 10, 'rocnik2', 'Open Education', '2025-04-04 12:13:26'),
(302, 97, 'emma.jechova@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-04 12:13:26'),
(303, 97, 'emma.jechova@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-04 12:13:26'),
(304, 97, 'emma.jechova@doctrina.cz', 16, 'rocnik2', 'španělská konverzace', '2025-04-04 12:13:26'),
(305, 97, 'emma.jechova@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-04 12:13:26'),
(306, 104, 'antonin.adam@doctrina.cz', 2, 'rocnik3', 'chemický seminář', '2025-04-04 15:37:44'),
(307, 104, 'antonin.adam@doctrina.cz', 5, 'rocnik3', 'aplikovaná fyzika', '2025-04-04 15:37:44'),
(308, 104, 'antonin.adam@doctrina.cz', 7, 'rocnik3', 'biologie člověka rozšířená', '2025-04-04 15:37:44'),
(309, 104, 'antonin.adam@doctrina.cz', 25, 'rocnik3', 'německá konverzace', '2025-04-04 15:37:44'),
(310, 105, 'anna.koutkova@doctrina.cz', 6, 'septima', 'programování', '2025-04-04 15:49:08'),
(311, 105, 'anna.koutkova@doctrina.cz', 10, 'septima', 'programování', '2025-04-04 15:49:08'),
(312, 105, 'anna.koutkova@doctrina.cz', 20, 'septima', 'Advanced English', '2025-04-04 15:49:08'),
(313, 105, 'anna.koutkova@doctrina.cz', 21, 'septima', 'Advanced English', '2025-04-04 15:49:08'),
(319, 107, 'marek.cerny@doctrina.cz', 7, 'rocnik2', 'historický seminář', '2025-04-04 16:17:42'),
(320, 107, 'marek.cerny@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-04 16:17:42'),
(321, 107, 'marek.cerny@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-04 16:17:42'),
(322, 107, 'marek.cerny@doctrina.cz', 16, 'rocnik2', 'španělská konverzace', '2025-04-04 16:17:42'),
(323, 107, 'marek.cerny@doctrina.cz', 18, 'rocnik2', 'hudební výchova', '2025-04-04 16:17:42'),
(324, 109, 'eliska.matyasova@doctrina.cz', 2, 'rocnik3', 'chemický seminář', '2025-04-04 16:57:12'),
(325, 109, 'eliska.matyasova@doctrina.cz', 7, 'rocnik3', 'biologie člověka rozšířená', '2025-04-04 16:57:12'),
(326, 109, 'eliska.matyasova@doctrina.cz', 12, 'rocnik3', 'literární seminář', '2025-04-04 16:57:12'),
(327, 109, 'eliska.matyasova@doctrina.cz', 22, 'rocnik3', 'finanční gramotnost', '2025-04-04 16:57:12'),
(328, 112, 'agata.opalecka@doctrina.cz', 7, 'rocnik3', 'biologie člověka rozšířená', '2025-04-04 17:22:58'),
(329, 112, 'agata.opalecka@doctrina.cz', 12, 'rocnik3', 'literární seminář', '2025-04-04 17:22:58'),
(330, 112, 'agata.opalecka@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-04 17:22:58'),
(331, 112, 'agata.opalecka@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-04 17:22:58'),
(332, 108, 'marketa.hakrova@doctrina.cz', 1, 'rocnik3', 'matematika rozšířená', '2025-04-04 17:26:45'),
(333, 108, 'marketa.hakrova@doctrina.cz', 11, 'rocnik3', 'ekologie', '2025-04-04 17:26:45'),
(334, 108, 'marketa.hakrova@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-04 17:26:45'),
(335, 108, 'marketa.hakrova@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-04 17:26:45'),
(336, 113, 'hana.hakrova@doctrina.cz', 16, 'rocnik3', 'hudební výchova', '2025-04-04 17:31:43'),
(337, 113, 'hana.hakrova@doctrina.cz', 19, 'rocnik3', 'hudební výchova', '2025-04-04 17:31:43'),
(338, 113, 'hana.hakrova@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-04 17:31:43'),
(339, 113, 'hana.hakrova@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-04 17:31:43'),
(350, 110, 'dominika.kopalova@doctrina.cz', 1, 'oktava', 'fyzika', '2025-04-04 17:32:44'),
(351, 110, 'dominika.kopalova@doctrina.cz', 4, 'oktava', 'fyzika', '2025-04-04 17:32:44'),
(352, 110, 'dominika.kopalova@doctrina.cz', 26, 'oktava', 'chemie', '2025-04-04 17:32:44'),
(353, 110, 'dominika.kopalova@doctrina.cz', 28, 'oktava', 'chemie', '2025-04-04 17:32:44'),
(354, 110, 'dominika.kopalova@doctrina.cz', 30, 'oktava', 'biochemie', '2025-04-04 17:32:44'),
(355, 110, 'dominika.kopalova@doctrina.cz', 32, 'oktava', 'biologie', '2025-04-04 17:32:44'),
(356, 110, 'dominika.kopalova@doctrina.cz', 33, 'oktava', 'biologie', '2025-04-04 17:32:44'),
(357, 110, 'dominika.kopalova@doctrina.cz', 36, 'oktava', 'matematika základní*', '2025-04-04 17:32:44'),
(358, 110, 'dominika.kopalova@doctrina.cz', 38, 'oktava', 'matematika základní*', '2025-04-04 17:32:44'),
(359, 110, 'dominika.kopalova@doctrina.cz', 40, 'oktava', 'biologický seminář', '2025-04-04 17:32:44'),
(360, 111, 'sofie.dvorackova@doctrina.cz', 14, 'oktava', 'VSP', '2025-04-04 17:33:10'),
(361, 111, 'sofie.dvorackova@doctrina.cz', 22, 'oktava', 'psychologie', '2025-04-04 17:33:10'),
(362, 111, 'sofie.dvorackova@doctrina.cz', 25, 'oktava', 'psychologie', '2025-04-04 17:33:10'),
(363, 111, 'sofie.dvorackova@doctrina.cz', 27, 'oktava', 'dějepis', '2025-04-04 17:33:10'),
(364, 111, 'sofie.dvorackova@doctrina.cz', 29, 'oktava', 'dějepis', '2025-04-04 17:33:10'),
(365, 111, 'sofie.dvorackova@doctrina.cz', 31, 'oktava', 'dějepis', '2025-04-04 17:33:10'),
(366, 111, 'sofie.dvorackova@doctrina.cz', 35, 'oktava', 'matematika rozšířená*', '2025-04-04 17:33:10'),
(367, 111, 'sofie.dvorackova@doctrina.cz', 37, 'oktava', 'matematika rozšířená*', '2025-04-04 17:33:10'),
(368, 111, 'sofie.dvorackova@doctrina.cz', 39, 'oktava', 'matematika rozšířená*', '2025-04-04 17:33:10'),
(369, 111, 'sofie.dvorackova@doctrina.cz', 42, 'oktava', 'matematika rozšířená*', '2025-04-04 17:33:10'),
(370, 96, 'katerina.kabatkova@doctrina.cz', 9, 'oktava', 'historický seminář', '2025-04-04 17:36:32'),
(371, 96, 'katerina.kabatkova@doctrina.cz', 14, 'oktava', 'VSP', '2025-04-04 17:36:32'),
(372, 96, 'katerina.kabatkova@doctrina.cz', 27, 'oktava', 'dějepis', '2025-04-04 17:36:32'),
(373, 96, 'katerina.kabatkova@doctrina.cz', 29, 'oktava', 'dějepis', '2025-04-04 17:36:32'),
(374, 96, 'katerina.kabatkova@doctrina.cz', 31, 'oktava', 'dějepis', '2025-04-04 17:36:32'),
(375, 96, 'katerina.kabatkova@doctrina.cz', 34, 'oktava', 'společenskovědní seminář', '2025-04-04 17:36:32'),
(376, 96, 'katerina.kabatkova@doctrina.cz', 35, 'oktava', 'matematika rozšířená*', '2025-04-04 17:36:32'),
(377, 96, 'katerina.kabatkova@doctrina.cz', 37, 'oktava', 'matematika rozšířená*', '2025-04-04 17:36:32'),
(378, 96, 'katerina.kabatkova@doctrina.cz', 39, 'oktava', 'matematika rozšířená*', '2025-04-04 17:36:32'),
(379, 96, 'katerina.kabatkova@doctrina.cz', 42, 'oktava', 'matematika rozšířená*', '2025-04-04 17:36:32'),
(380, 103, 'veronika.halirova@doctrina.cz', 2, 'rocnik2', 'etologie', '2025-04-04 18:41:23'),
(381, 103, 'veronika.halirova@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-04 18:41:23'),
(382, 103, 'veronika.halirova@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-04 18:41:23'),
(383, 103, 'veronika.halirova@doctrina.cz', 16, 'rocnik2', 'španělská konverzace', '2025-04-04 18:41:23'),
(384, 103, 'veronika.halirova@doctrina.cz', 18, 'rocnik2', 'hudební výchova', '2025-04-04 18:41:23'),
(385, 117, 'vitek.hotar@doctrina.cz', 1, 'rocnik2', 'matematika rozšířená', '2025-04-04 20:57:25'),
(386, 117, 'vitek.hotar@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-04 20:57:25'),
(387, 117, 'vitek.hotar@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-04 20:57:25'),
(388, 117, 'vitek.hotar@doctrina.cz', 14, 'rocnik2', 'anglická konverzace', '2025-04-04 20:57:25'),
(389, 117, 'vitek.hotar@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-04 20:57:25'),
(390, 115, 'david.bures@doctrina.cz', 1, 'oktava', 'fyzika', '2025-04-04 21:03:35'),
(391, 115, 'david.bures@doctrina.cz', 4, 'oktava', 'fyzika', '2025-04-04 21:03:35'),
(392, 115, 'david.bures@doctrina.cz', 26, 'oktava', 'chemie', '2025-04-04 21:03:35'),
(393, 115, 'david.bures@doctrina.cz', 28, 'oktava', 'chemie', '2025-04-04 21:03:35'),
(394, 115, 'david.bures@doctrina.cz', 30, 'oktava', 'biochemie', '2025-04-04 21:03:35'),
(395, 115, 'david.bures@doctrina.cz', 32, 'oktava', 'biologie', '2025-04-04 21:03:35'),
(396, 115, 'david.bures@doctrina.cz', 33, 'oktava', 'biologie', '2025-04-04 21:03:35'),
(397, 115, 'david.bures@doctrina.cz', 36, 'oktava', 'matematika základní*', '2025-04-04 21:03:35'),
(398, 115, 'david.bures@doctrina.cz', 38, 'oktava', 'matematika základní*', '2025-04-04 21:03:35'),
(399, 115, 'david.bures@doctrina.cz', 40, 'oktava', 'biologický seminář', '2025-04-04 21:03:35'),
(400, 122, 'viktorie.rosselova@doctrina.cz', 8, 'rocnik3', 'globální problémy', '2025-04-05 19:32:43'),
(401, 122, 'viktorie.rosselova@doctrina.cz', 12, 'rocnik3', 'literární seminář', '2025-04-05 19:32:43'),
(402, 122, 'viktorie.rosselova@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-05 19:32:43'),
(403, 122, 'viktorie.rosselova@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-05 19:32:43'),
(404, 57, 'ondrej.nerad@doctrina.cz', 7, 'rocnik2', 'historický seminář', '2025-04-05 20:46:03'),
(405, 57, 'ondrej.nerad@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-05 20:46:03'),
(406, 57, 'ondrej.nerad@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-05 20:46:03'),
(407, 57, 'ondrej.nerad@doctrina.cz', 15, 'rocnik2', 'německá konverzace', '2025-04-05 20:46:03'),
(408, 57, 'ondrej.nerad@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-05 20:46:03'),
(414, 126, 'lucie.votrubcova@doctrina.cz', 5, 'rocnik2', 'programování', '2025-04-06 13:25:37'),
(415, 126, 'lucie.votrubcova@doctrina.cz', 9, 'rocnik2', 'programování', '2025-04-06 13:25:37'),
(416, 126, 'lucie.votrubcova@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-06 13:25:37'),
(417, 126, 'lucie.votrubcova@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-06 13:25:37'),
(418, 126, 'lucie.votrubcova@doctrina.cz', 18, 'rocnik2', 'hudební výchova', '2025-04-06 13:25:37'),
(446, 129, 'sofie.mazur@doctrina.cz', 1, 'sexta', 'matematika rozšířená', '2025-04-06 17:57:02'),
(447, 129, 'sofie.mazur@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-06 17:57:02'),
(448, 129, 'sofie.mazur@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-06 17:57:02'),
(449, 129, 'sofie.mazur@doctrina.cz', 14, 'sexta', 'anglická konverzace', '2025-04-06 17:57:02'),
(450, 129, 'sofie.mazur@doctrina.cz', 17, 'sexta', 'výtvarná výchova', '2025-04-06 17:57:02'),
(482, 114, 'filip.stadnik@doctrina.cz', 10, 'rocnik2', 'Open Education', '2025-04-06 18:47:28'),
(483, 114, 'filip.stadnik@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-06 18:47:28'),
(484, 114, 'filip.stadnik@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-06 18:47:28'),
(485, 114, 'filip.stadnik@doctrina.cz', 15, 'rocnik2', 'německá konverzace', '2025-04-06 18:47:28'),
(486, 114, 'filip.stadnik@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-06 18:47:28'),
(487, 134, 'zuzana.tlapakova@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-06 19:32:17'),
(488, 134, 'zuzana.tlapakova@doctrina.cz', 18, 'rocnik4', 'aplikovaná psychologie', '2025-04-06 19:32:17'),
(489, 134, 'zuzana.tlapakova@doctrina.cz', 22, 'rocnik4', 'psychologie', '2025-04-06 19:32:17'),
(490, 134, 'zuzana.tlapakova@doctrina.cz', 25, 'rocnik4', 'psychologie', '2025-04-06 19:32:17'),
(491, 134, 'zuzana.tlapakova@doctrina.cz', 27, 'rocnik4', 'dějepis', '2025-04-06 19:32:17'),
(492, 134, 'zuzana.tlapakova@doctrina.cz', 29, 'rocnik4', 'dějepis', '2025-04-06 19:32:17'),
(493, 134, 'zuzana.tlapakova@doctrina.cz', 31, 'rocnik4', 'dějepis', '2025-04-06 19:32:17'),
(494, 134, 'zuzana.tlapakova@doctrina.cz', 34, 'rocnik4', 'společenskovědní seminář', '2025-04-06 19:32:17'),
(495, 134, 'zuzana.tlapakova@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-06 19:32:17'),
(496, 134, 'zuzana.tlapakova@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-06 19:32:17'),
(499, 133, 'zuzana.stverakova@doctrina.cz', 1, 'oktava', 'fyzika', '2025-04-06 19:59:58'),
(500, 133, 'zuzana.stverakova@doctrina.cz', 4, 'oktava', 'fyzika', '2025-04-06 19:59:58'),
(501, 133, 'zuzana.stverakova@doctrina.cz', 7, 'oktava', 'aplikovaná fyzika', '2025-04-06 19:59:58'),
(502, 133, 'zuzana.stverakova@doctrina.cz', 10, 'oktava', 'aplikovaná fyzika', '2025-04-06 19:59:58'),
(503, 133, 'zuzana.stverakova@doctrina.cz', 21, 'oktava', 'zeměpis', '2025-04-06 19:59:58'),
(504, 133, 'zuzana.stverakova@doctrina.cz', 24, 'oktava', 'zeměpis', '2025-04-06 19:59:58'),
(505, 133, 'zuzana.stverakova@doctrina.cz', 35, 'oktava', 'matematika rozšířená*', '2025-04-06 19:59:58'),
(506, 133, 'zuzana.stverakova@doctrina.cz', 37, 'oktava', 'matematika rozšířená*', '2025-04-06 19:59:58'),
(507, 133, 'zuzana.stverakova@doctrina.cz', 39, 'oktava', 'matematika rozšířená*', '2025-04-06 19:59:58'),
(508, 133, 'zuzana.stverakova@doctrina.cz', 42, 'oktava', 'matematika rozšířená*', '2025-04-06 19:59:58'),
(509, 136, 'andrea.pospisilova@doctrina.cz', 3, 'kvinta', 'historický seminář', '2025-04-06 20:00:43'),
(510, 136, 'andrea.pospisilova@doctrina.cz', 12, 'kvinta', 'španělská konverzace', '2025-04-06 20:00:43'),
(522, 127, 'filip.popelak@doctrina.cz', 3, 'kvinta', 'historický seminář', '2025-04-07 07:17:32'),
(523, 127, 'filip.popelak@doctrina.cz', 7, 'kvinta', 'kořeny evropské kultury', '2025-04-07 07:17:32'),
(524, 24, 'oskar.blecha@doctrina.cz', 3, 'kvinta', 'historický seminář', '2025-04-07 08:52:02'),
(525, 24, 'oskar.blecha@doctrina.cz', 11, 'kvinta', 'anglická konverzace', '2025-04-07 08:52:02'),
(526, 66, 'sofiya.lyvynyuk@doctrina.cz', 3, 'kvinta', 'historický seminář', '2025-04-07 08:52:18'),
(527, 66, 'sofiya.lyvynyuk@doctrina.cz', 6, 'kvinta', 'praktická biologie', '2025-04-07 08:52:18'),
(528, 19, 'jiri.salda@doctrina.cz', 3, 'kvinta', 'historický seminář', '2025-04-07 08:52:21'),
(529, 19, 'jiri.salda@doctrina.cz', 11, 'kvinta', 'anglická konverzace', '2025-04-07 08:52:21'),
(530, 82, 'stella.fricova@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-07 08:52:24'),
(531, 84, 'magdalena.pytlounova2@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-07 08:52:24'),
(532, 83, 'eliska.ruzickova@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-07 08:52:31'),
(533, 76, 'marie.denkova@doctrina.cz', 1, 'tercie', 'Německý jazyk', '2025-04-07 08:52:36'),
(534, 69, 'lucie.futschikova@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-07 08:52:37'),
(535, 77, 'lukas.dusek2@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-07 08:53:10'),
(536, 33, 'rozalie.nalezinkova@doctrina.cz', 1, 'tercie', 'Německý jazyk', '2025-04-07 08:53:19'),
(539, 138, 'jiri.roubicek@doctrina.cz', 8, 'kvinta', 'IT dílna', '2025-04-07 08:54:40'),
(540, 138, 'jiri.roubicek@doctrina.cz', 11, 'kvinta', 'anglická konverzace', '2025-04-07 08:54:40'),
(541, 79, 'benjamin.tuma@doctrina.cz', 1, 'tercie', 'Německý jazyk', '2025-04-07 08:55:00'),
(542, 140, 'vlada.kaspar@doctrina.cz', 7, 'rocnik2', 'historický seminář', '2025-04-07 09:57:49'),
(543, 140, 'vlada.kaspar@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-07 09:57:49'),
(544, 140, 'vlada.kaspar@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-07 09:57:49'),
(545, 140, 'vlada.kaspar@doctrina.cz', 15, 'rocnik2', 'německá konverzace', '2025-04-07 09:57:49'),
(546, 140, 'vlada.kaspar@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-07 09:57:49'),
(547, 147, 'johana.petrof@doctrina.cz', 4, 'septima', 'výtvarná tvorba', '2025-04-07 13:20:35'),
(548, 147, 'johana.petrof@doctrina.cz', 12, 'septima', 'literární seminář', '2025-04-07 13:20:35'),
(549, 147, 'johana.petrof@doctrina.cz', 20, 'septima', 'Advanced English', '2025-04-07 13:20:35'),
(550, 147, 'johana.petrof@doctrina.cz', 21, 'septima', 'Advanced English', '2025-04-07 13:20:35'),
(551, 13, 'vojtech.prinda@doctrina.cz', 4, 'kvinta', 'výtvarné techniky', '2025-04-07 13:46:13'),
(552, 13, 'vojtech.prinda@doctrina.cz', 11, 'kvinta', 'anglická konverzace', '2025-04-07 13:46:13'),
(553, 91, 'zizka@doctrina.cz', 1, 'sexta', 'matematika rozšířená', '2025-04-07 15:17:29'),
(554, 91, 'zizka@doctrina.cz', 10, 'sexta', 'Open Education', '2025-04-07 15:17:29'),
(555, 91, 'zizka@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-07 15:17:29'),
(556, 91, 'zizka@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-07 15:17:29'),
(557, 91, 'zizka@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-07 15:17:29'),
(558, 46, 'matej.uher@doctrina.cz', 1, 'tercie', 'Německý jazyk', '2025-04-07 15:42:20'),
(563, 151, 'vaclav.poek@doctrina.cz', 6, 'sexta', 'regionální výzvy', '2025-04-07 18:19:47'),
(564, 151, 'vaclav.poek@doctrina.cz', 10, 'sexta', 'Open Education', '2025-04-07 18:19:47'),
(565, 151, 'vaclav.poek@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-07 18:19:47'),
(566, 151, 'vaclav.poek@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-07 18:19:47'),
(567, 151, 'vaclav.poek@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-07 18:19:47'),
(570, 153, 'filip.kotek@doctrina.cz', 1, 'oktava', 'fyzika', '2025-04-07 19:09:02'),
(571, 153, 'filip.kotek@doctrina.cz', 4, 'oktava', 'fyzika', '2025-04-07 19:09:02'),
(572, 153, 'filip.kotek@doctrina.cz', 7, 'oktava', 'aplikovaná fyzika', '2025-04-07 19:09:02'),
(573, 153, 'filip.kotek@doctrina.cz', 10, 'oktava', 'aplikovaná fyzika', '2025-04-07 19:09:02'),
(574, 153, 'filip.kotek@doctrina.cz', 13, 'oktava', 'deskriptivní geometrie', '2025-04-07 19:09:02'),
(575, 153, 'filip.kotek@doctrina.cz', 17, 'oktava', 'deskriptivní geometrie', '2025-04-07 19:09:02'),
(576, 153, 'filip.kotek@doctrina.cz', 35, 'oktava', 'matematika rozšířená*', '2025-04-07 19:09:02'),
(577, 153, 'filip.kotek@doctrina.cz', 37, 'oktava', 'matematika rozšířená*', '2025-04-07 19:09:02'),
(578, 153, 'filip.kotek@doctrina.cz', 39, 'oktava', 'matematika rozšířená*', '2025-04-07 19:09:02'),
(579, 153, 'filip.kotek@doctrina.cz', 42, 'oktava', 'matematika rozšířená*', '2025-04-07 19:09:02'),
(581, 78, 'klara.baudysova@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-07 19:37:23'),
(582, 155, 'valerie.nalezinkova@doctrina.cz', 1, 'sexta', 'matematika rozšířená', '2025-04-07 19:46:36'),
(583, 155, 'valerie.nalezinkova@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-07 19:46:36'),
(584, 155, 'valerie.nalezinkova@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-07 19:46:36'),
(585, 155, 'valerie.nalezinkova@doctrina.cz', 15, 'sexta', 'německá konverzace', '2025-04-07 19:46:36'),
(586, 155, 'valerie.nalezinkova@doctrina.cz', 17, 'sexta', 'výtvarná výchova', '2025-04-07 19:46:36'),
(587, 156, 'david.kotek@doctrina.cz', 1, 'oktava', 'fyzika', '2025-04-07 19:56:48'),
(588, 156, 'david.kotek@doctrina.cz', 4, 'oktava', 'fyzika', '2025-04-07 19:56:48'),
(589, 156, 'david.kotek@doctrina.cz', 7, 'oktava', 'aplikovaná fyzika', '2025-04-07 19:56:48'),
(590, 156, 'david.kotek@doctrina.cz', 10, 'oktava', 'aplikovaná fyzika', '2025-04-07 19:56:48'),
(591, 156, 'david.kotek@doctrina.cz', 13, 'oktava', 'deskriptivní geometrie', '2025-04-07 19:56:48'),
(592, 156, 'david.kotek@doctrina.cz', 17, 'oktava', 'deskriptivní geometrie', '2025-04-07 19:56:48'),
(593, 156, 'david.kotek@doctrina.cz', 35, 'oktava', 'matematika rozšířená*', '2025-04-07 19:56:48'),
(594, 156, 'david.kotek@doctrina.cz', 37, 'oktava', 'matematika rozšířená*', '2025-04-07 19:56:48'),
(595, 156, 'david.kotek@doctrina.cz', 39, 'oktava', 'matematika rozšířená*', '2025-04-07 19:56:48'),
(596, 156, 'david.kotek@doctrina.cz', 42, 'oktava', 'matematika rozšířená*', '2025-04-07 19:56:48'),
(597, 157, 'jana.jouzova@doctrina.cz', 8, 'rocnik4', 'antropologický seminář', '2025-04-07 19:58:22'),
(598, 157, 'jana.jouzova@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-07 19:58:22'),
(599, 157, 'jana.jouzova@doctrina.cz', 14, 'rocnik4', 'VSP', '2025-04-07 19:58:22'),
(600, 157, 'jana.jouzova@doctrina.cz', 22, 'rocnik4', 'psychologie', '2025-04-07 19:58:22'),
(601, 157, 'jana.jouzova@doctrina.cz', 25, 'rocnik4', 'psychologie', '2025-04-07 19:58:22'),
(602, 157, 'jana.jouzova@doctrina.cz', 27, 'rocnik4', 'dějepis', '2025-04-07 19:58:22'),
(603, 157, 'jana.jouzova@doctrina.cz', 29, 'rocnik4', 'dějepis', '2025-04-07 19:58:22'),
(604, 157, 'jana.jouzova@doctrina.cz', 31, 'rocnik4', 'dějepis', '2025-04-07 19:58:22'),
(605, 157, 'jana.jouzova@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-07 19:58:22'),
(606, 157, 'jana.jouzova@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-07 19:58:22'),
(609, 52, 'ondrej.dumek@doctrina.cz', 1, 'tercie', 'Německý jazyk', '2025-04-07 20:17:31'),
(610, 158, 'petr.hauzner@doctrina.cz', 1, 'rocnik2', 'matematika rozšířená', '2025-04-07 20:55:28'),
(611, 158, 'petr.hauzner@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-07 20:55:28'),
(612, 158, 'petr.hauzner@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-07 20:55:28'),
(613, 158, 'petr.hauzner@doctrina.cz', 15, 'rocnik2', 'německá konverzace', '2025-04-07 20:55:28'),
(614, 158, 'petr.hauzner@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-07 20:55:28'),
(615, 159, 'michaela.chocova@doctrina.cz', 7, 'rocnik2', 'historický seminář', '2025-04-07 20:55:49'),
(616, 159, 'michaela.chocova@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-07 20:55:49'),
(617, 159, 'michaela.chocova@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-07 20:55:49'),
(618, 159, 'michaela.chocova@doctrina.cz', 16, 'rocnik2', 'španělská konverzace', '2025-04-07 20:55:49'),
(619, 159, 'michaela.chocova@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-07 20:55:49'),
(620, 160, 'barbora.samalova@doctrina.cz', 2, 'kvinta', 'chemický seminář', '2025-04-07 21:48:55'),
(621, 160, 'barbora.samalova@doctrina.cz', 11, 'kvinta', 'anglická konverzace', '2025-04-07 21:48:55'),
(622, 121, 'julie.hronova@doctrina.cz', 2, 'kvinta', 'chemický seminář', '2025-04-07 21:50:02'),
(623, 121, 'julie.hronova@doctrina.cz', 6, 'kvinta', 'praktická biologie', '2025-04-07 21:50:02'),
(624, 74, 'adela.rasochova@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-08 07:38:37'),
(625, 142, 'tomas.trejbal@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-08 09:48:40'),
(626, 142, 'tomas.trejbal@doctrina.cz', 15, 'rocnik4', 'anglické reálie', '2025-04-08 09:48:40'),
(627, 142, 'tomas.trejbal@doctrina.cz', 18, 'rocnik4', 'aplikovaná psychologie', '2025-04-08 09:48:40'),
(628, 142, 'tomas.trejbal@doctrina.cz', 22, 'rocnik4', 'psychologie', '2025-04-08 09:48:40'),
(629, 142, 'tomas.trejbal@doctrina.cz', 25, 'rocnik4', 'psychologie', '2025-04-08 09:48:40'),
(630, 142, 'tomas.trejbal@doctrina.cz', 32, 'rocnik4', 'biologie', '2025-04-08 09:48:40'),
(631, 142, 'tomas.trejbal@doctrina.cz', 33, 'rocnik4', 'biologie', '2025-04-08 09:48:40'),
(632, 142, 'tomas.trejbal@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-08 09:48:40'),
(633, 142, 'tomas.trejbal@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-08 09:48:40'),
(634, 142, 'tomas.trejbal@doctrina.cz', 43, 'rocnik4', 'anglická konverzace', '2025-04-08 09:48:40'),
(636, 164, 'josef.terc@doctrina.cz', 8, 'rocnik3', 'globální problémy', '2025-04-08 09:53:03'),
(637, 164, 'josef.terc@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-08 09:53:03'),
(638, 164, 'josef.terc@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-08 09:53:03'),
(639, 164, 'josef.terc@doctrina.cz', 24, 'rocnik3', 'anglická konverzace', '2025-04-08 09:53:03'),
(640, 163, 'barbora.jakubcova@doctrina.cz', 8, 'rocnik3', 'globální problémy', '2025-04-08 09:56:13'),
(641, 163, 'barbora.jakubcova@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-08 09:56:13'),
(642, 163, 'barbora.jakubcova@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-08 09:56:13'),
(643, 163, 'barbora.jakubcova@doctrina.cz', 24, 'rocnik3', 'anglická konverzace', '2025-04-08 09:56:13'),
(644, 38, 'jan.schon@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-08 09:59:55'),
(645, 38, 'jan.schon@doctrina.cz', 14, 'rocnik4', 'VSP', '2025-04-08 09:59:55'),
(646, 38, 'jan.schon@doctrina.cz', 21, 'rocnik4', 'zeměpis', '2025-04-08 09:59:55'),
(647, 38, 'jan.schon@doctrina.cz', 24, 'rocnik4', 'zeměpis', '2025-04-08 09:59:55'),
(648, 38, 'jan.schon@doctrina.cz', 27, 'rocnik4', 'dějepis', '2025-04-08 09:59:55'),
(649, 38, 'jan.schon@doctrina.cz', 29, 'rocnik4', 'dějepis', '2025-04-08 09:59:55'),
(650, 38, 'jan.schon@doctrina.cz', 31, 'rocnik4', 'dějepis', '2025-04-08 09:59:55'),
(651, 38, 'jan.schon@doctrina.cz', 34, 'rocnik4', 'společenskovědní seminář', '2025-04-08 09:59:55'),
(652, 38, 'jan.schon@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-08 09:59:55'),
(653, 38, 'jan.schon@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-08 09:59:55'),
(654, 168, 'klara.hromadova@doctrina.cz', 3, 'kvinta', 'historický seminář', '2025-04-08 11:59:09'),
(655, 168, 'klara.hromadova@doctrina.cz', 6, 'kvinta', 'praktická biologie', '2025-04-08 11:59:09'),
(658, 169, 'anna.feurichova@doctrina.cz', 3, 'kvinta', 'historický seminář', '2025-04-08 12:01:43'),
(659, 169, 'anna.feurichova@doctrina.cz', 6, 'kvinta', 'praktická biologie', '2025-04-08 12:01:43'),
(660, 150, 'sofie.vorlova@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-08 12:39:36'),
(661, 150, 'sofie.vorlova@doctrina.cz', 19, 'rocnik4', 'anglická literatura', '2025-04-08 12:39:36'),
(662, 150, 'sofie.vorlova@doctrina.cz', 21, 'rocnik4', 'zeměpis', '2025-04-08 12:39:36'),
(663, 150, 'sofie.vorlova@doctrina.cz', 24, 'rocnik4', 'zeměpis', '2025-04-08 12:39:36'),
(664, 150, 'sofie.vorlova@doctrina.cz', 27, 'rocnik4', 'dějepis', '2025-04-08 12:39:36'),
(665, 150, 'sofie.vorlova@doctrina.cz', 29, 'rocnik4', 'dějepis', '2025-04-08 12:39:36'),
(666, 150, 'sofie.vorlova@doctrina.cz', 31, 'rocnik4', 'dějepis', '2025-04-08 12:39:36'),
(667, 150, 'sofie.vorlova@doctrina.cz', 34, 'rocnik4', 'společenskovědní seminář', '2025-04-08 12:39:36'),
(668, 150, 'sofie.vorlova@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-08 12:39:36'),
(669, 150, 'sofie.vorlova@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-08 12:39:36'),
(670, 171, 'valerie.saldova@doctrina.cz', 7, 'septima', 'biologie člověka rozšířená', '2025-04-08 13:02:40'),
(671, 171, 'valerie.saldova@doctrina.cz', 20, 'septima', 'Advanced English', '2025-04-08 13:02:40'),
(672, 171, 'valerie.saldova@doctrina.cz', 21, 'septima', 'Advanced English', '2025-04-08 13:02:40'),
(673, 171, 'valerie.saldova@doctrina.cz', 22, 'septima', 'finanční gramotnost', '2025-04-08 13:02:40'),
(674, 170, 'nela.nyplova@doctrina.cz', 7, 'septima', 'biologie člověka rozšířená', '2025-04-08 13:06:47'),
(675, 170, 'nela.nyplova@doctrina.cz', 20, 'septima', 'Advanced English', '2025-04-08 13:06:47'),
(676, 170, 'nela.nyplova@doctrina.cz', 21, 'septima', 'Advanced English', '2025-04-08 13:06:47'),
(677, 170, 'nela.nyplova@doctrina.cz', 22, 'septima', 'finanční gramotnost', '2025-04-08 13:06:47'),
(678, 172, 'oskar.kupec@doctrina.cz', 3, 'septima', 'historický seminář', '2025-04-08 16:03:30'),
(679, 172, 'oskar.kupec@doctrina.cz', 8, 'septima', 'globální problémy', '2025-04-08 16:03:30'),
(680, 172, 'oskar.kupec@doctrina.cz', 11, 'septima', 'ekologie', '2025-04-08 16:03:30'),
(681, 172, 'oskar.kupec@doctrina.cz', 23, 'septima', 'Open Education', '2025-04-08 16:03:30'),
(690, 174, 'laura.sestakova@doctrina.cz', 3, 'rocnik2', 'čtenářská gramotnost', '2025-04-08 16:32:46'),
(691, 174, 'laura.sestakova@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-08 16:32:46'),
(692, 174, 'laura.sestakova@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-08 16:32:46'),
(693, 174, 'laura.sestakova@doctrina.cz', 14, 'rocnik2', 'anglická konverzace', '2025-04-08 16:32:46'),
(694, 174, 'laura.sestakova@doctrina.cz', 18, 'rocnik2', 'hudební výchova', '2025-04-08 16:32:46'),
(695, 167, 'adriena.michalkova@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-08 16:39:56'),
(696, 167, 'adriena.michalkova@doctrina.cz', 14, 'rocnik4', 'VSP', '2025-04-08 16:39:56'),
(697, 167, 'adriena.michalkova@doctrina.cz', 18, 'rocnik4', 'aplikovaná psychologie', '2025-04-08 16:39:56'),
(698, 167, 'adriena.michalkova@doctrina.cz', 21, 'rocnik4', 'zeměpis', '2025-04-08 16:39:56'),
(699, 167, 'adriena.michalkova@doctrina.cz', 24, 'rocnik4', 'zeměpis', '2025-04-08 16:39:56'),
(700, 167, 'adriena.michalkova@doctrina.cz', 27, 'rocnik4', 'dějepis', '2025-04-08 16:39:56'),
(701, 167, 'adriena.michalkova@doctrina.cz', 29, 'rocnik4', 'dějepis', '2025-04-08 16:39:56'),
(702, 167, 'adriena.michalkova@doctrina.cz', 31, 'rocnik4', 'dějepis', '2025-04-08 16:39:56'),
(703, 167, 'adriena.michalkova@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-08 16:39:56'),
(704, 167, 'adriena.michalkova@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-08 16:39:56'),
(705, 177, 'madeleine.fricova@doctrina.cz', 3, 'sexta', 'čtenářská gramotnost', '2025-04-08 17:06:33'),
(706, 177, 'madeleine.fricova@doctrina.cz', 6, 'sexta', 'regionální výzvy', '2025-04-08 17:06:33'),
(707, 177, 'madeleine.fricova@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-08 17:06:33'),
(708, 177, 'madeleine.fricova@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-08 17:06:33'),
(709, 177, 'madeleine.fricova@doctrina.cz', 17, 'sexta', 'výtvarná výchova', '2025-04-08 17:06:33'),
(710, 89, 'natalie.pabiskova@doctrina.cz', 7, 'rocnik2', 'historický seminář', '2025-04-08 17:35:13'),
(711, 89, 'natalie.pabiskova@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-08 17:35:13'),
(712, 89, 'natalie.pabiskova@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-08 17:35:13'),
(713, 89, 'natalie.pabiskova@doctrina.cz', 14, 'rocnik2', 'anglická konverzace', '2025-04-08 17:35:13'),
(714, 89, 'natalie.pabiskova@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-08 17:35:13'),
(715, 178, 'johana.sestakova@doctrina.cz', 3, 'sexta', 'čtenářská gramotnost', '2025-04-08 18:36:53');
INSERT INTO `user_choices` (`id`, `user_id`, `user_email`, `subject_id`, `subject_class`, `subject_name`, `created_at`) VALUES
(716, 178, 'johana.sestakova@doctrina.cz', 6, 'sexta', 'regionální výzvy', '2025-04-08 18:36:53'),
(717, 178, 'johana.sestakova@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-08 18:36:53'),
(718, 178, 'johana.sestakova@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-08 18:36:53'),
(719, 178, 'johana.sestakova@doctrina.cz', 17, 'sexta', 'výtvarná výchova', '2025-04-08 18:36:53'),
(724, 180, 'filip.kuchar@doctrina.cz', 1, 'septima', 'matematika rozšířená', '2025-04-08 19:37:00'),
(725, 180, 'filip.kuchar@doctrina.cz', 8, 'septima', 'globální problémy', '2025-04-08 19:37:00'),
(726, 180, 'filip.kuchar@doctrina.cz', 14, 'septima', 'deskriptivní geometrie', '2025-04-08 19:37:00'),
(727, 180, 'filip.kuchar@doctrina.cz', 17, 'septima', 'deskriptivní geometrie', '2025-04-08 19:37:00'),
(728, 181, 'julie.nemcova@doctrina.cz', 2, 'sexta', 'etologie', '2025-04-08 20:04:09'),
(729, 181, 'julie.nemcova@doctrina.cz', 6, 'sexta', 'regionální výzvy', '2025-04-08 20:04:09'),
(730, 181, 'julie.nemcova@doctrina.cz', 11, 'sexta', 'aplikovaná fyzika', '2025-04-08 20:04:09'),
(731, 181, 'julie.nemcova@doctrina.cz', 15, 'sexta', 'německá konverzace', '2025-04-08 20:04:09'),
(732, 181, 'julie.nemcova@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-08 20:04:09'),
(733, 135, 'valentyna.sedlarova@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-08 20:32:18'),
(734, 135, 'valentyna.sedlarova@doctrina.cz', 14, 'rocnik4', 'VSP', '2025-04-08 20:32:18'),
(735, 135, 'valentyna.sedlarova@doctrina.cz', 22, 'rocnik4', 'psychologie', '2025-04-08 20:32:18'),
(736, 135, 'valentyna.sedlarova@doctrina.cz', 25, 'rocnik4', 'psychologie', '2025-04-08 20:32:18'),
(737, 135, 'valentyna.sedlarova@doctrina.cz', 30, 'rocnik4', 'biochemie', '2025-04-08 20:32:18'),
(738, 135, 'valentyna.sedlarova@doctrina.cz', 32, 'rocnik4', 'biologie', '2025-04-08 20:32:18'),
(739, 135, 'valentyna.sedlarova@doctrina.cz', 33, 'rocnik4', 'biologie', '2025-04-08 20:32:18'),
(740, 135, 'valentyna.sedlarova@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-08 20:32:18'),
(741, 135, 'valentyna.sedlarova@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-08 20:32:18'),
(742, 135, 'valentyna.sedlarova@doctrina.cz', 40, 'rocnik4', 'biologický seminář', '2025-04-08 20:32:18'),
(743, 23, 'filip.jindra@doctrina.cz', 7, 'rocnik4', 'aplikovaná fyzika', '2025-04-08 20:43:22'),
(744, 23, 'filip.jindra@doctrina.cz', 10, 'rocnik4', 'aplikovaná fyzika', '2025-04-08 20:43:22'),
(745, 23, 'filip.jindra@doctrina.cz', 15, 'rocnik4', 'anglické reálie', '2025-04-08 20:43:22'),
(746, 23, 'filip.jindra@doctrina.cz', 27, 'rocnik4', 'dějepis', '2025-04-08 20:43:22'),
(747, 23, 'filip.jindra@doctrina.cz', 29, 'rocnik4', 'dějepis', '2025-04-08 20:43:22'),
(748, 23, 'filip.jindra@doctrina.cz', 31, 'rocnik4', 'dějepis', '2025-04-08 20:43:22'),
(749, 23, 'filip.jindra@doctrina.cz', 35, 'rocnik4', 'matematika rozšířená*', '2025-04-08 20:43:22'),
(750, 23, 'filip.jindra@doctrina.cz', 37, 'rocnik4', 'matematika rozšířená*', '2025-04-08 20:43:22'),
(751, 23, 'filip.jindra@doctrina.cz', 39, 'rocnik4', 'matematika rozšířená*', '2025-04-08 20:43:22'),
(752, 23, 'filip.jindra@doctrina.cz', 42, 'rocnik4', 'matematika rozšířená*', '2025-04-08 20:43:22'),
(753, 183, 'anezka.labusova@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-08 21:10:22'),
(754, 183, 'anezka.labusova@doctrina.cz', 14, 'rocnik4', 'VSP', '2025-04-08 21:10:22'),
(755, 183, 'anezka.labusova@doctrina.cz', 26, 'rocnik4', 'chemie', '2025-04-08 21:10:22'),
(756, 183, 'anezka.labusova@doctrina.cz', 28, 'rocnik4', 'chemie', '2025-04-08 21:10:22'),
(757, 183, 'anezka.labusova@doctrina.cz', 30, 'rocnik4', 'biochemie', '2025-04-08 21:10:22'),
(758, 183, 'anezka.labusova@doctrina.cz', 32, 'rocnik4', 'biologie', '2025-04-08 21:10:22'),
(759, 183, 'anezka.labusova@doctrina.cz', 33, 'rocnik4', 'biologie', '2025-04-08 21:10:22'),
(760, 183, 'anezka.labusova@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-08 21:10:22'),
(761, 183, 'anezka.labusova@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-08 21:10:22'),
(762, 183, 'anezka.labusova@doctrina.cz', 40, 'rocnik4', 'biologický seminář', '2025-04-08 21:10:22'),
(763, 43, 'tereza.storkova@doctrina.cz', 1, 'rocnik4', 'fyzika', '2025-04-08 21:15:57'),
(764, 43, 'tereza.storkova@doctrina.cz', 4, 'rocnik4', 'fyzika', '2025-04-08 21:15:57'),
(765, 43, 'tereza.storkova@doctrina.cz', 7, 'rocnik4', 'aplikovaná fyzika', '2025-04-08 21:15:57'),
(766, 43, 'tereza.storkova@doctrina.cz', 10, 'rocnik4', 'aplikovaná fyzika', '2025-04-08 21:15:57'),
(767, 43, 'tereza.storkova@doctrina.cz', 22, 'rocnik4', 'psychologie', '2025-04-08 21:15:57'),
(768, 43, 'tereza.storkova@doctrina.cz', 25, 'rocnik4', 'psychologie', '2025-04-08 21:15:57'),
(769, 43, 'tereza.storkova@doctrina.cz', 35, 'rocnik4', 'matematika rozšířená*', '2025-04-08 21:15:57'),
(770, 43, 'tereza.storkova@doctrina.cz', 37, 'rocnik4', 'matematika rozšířená*', '2025-04-08 21:15:57'),
(771, 43, 'tereza.storkova@doctrina.cz', 39, 'rocnik4', 'matematika rozšířená*', '2025-04-08 21:15:57'),
(772, 43, 'tereza.storkova@doctrina.cz', 42, 'rocnik4', 'matematika rozšířená*', '2025-04-08 21:15:57'),
(773, 63, 'vojtech.votava@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-08 21:25:07'),
(774, 179, 'nela.dadourkova@doctrina.cz', 2, 'sexta', 'etologie', '2025-04-08 21:25:28'),
(775, 179, 'nela.dadourkova@doctrina.cz', 7, 'sexta', 'historický seminář', '2025-04-08 21:25:28'),
(776, 179, 'nela.dadourkova@doctrina.cz', 10, 'sexta', 'Open Education', '2025-04-08 21:25:28'),
(777, 179, 'nela.dadourkova@doctrina.cz', 11, 'sexta', 'aplikovaná fyzika', '2025-04-08 21:25:28'),
(778, 179, 'nela.dadourkova@doctrina.cz', 17, 'sexta', 'výtvarná výchova', '2025-04-08 21:25:28'),
(779, 186, 'tereza.radova@doctrina.cz', 3, 'kvinta', 'historický seminář', '2025-04-08 21:32:57'),
(780, 186, 'tereza.radova@doctrina.cz', 7, 'kvinta', 'kořeny evropské kultury', '2025-04-08 21:32:57'),
(781, 185, 'karolina.nejedlova@doctrina.cz', 2, 'rocnik3', 'chemický seminář', '2025-04-08 21:33:30'),
(782, 185, 'karolina.nejedlova@doctrina.cz', 7, 'rocnik3', 'biologie člověka rozšířená', '2025-04-08 21:33:30'),
(783, 185, 'karolina.nejedlova@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-08 21:33:30'),
(784, 185, 'karolina.nejedlova@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-08 21:33:30'),
(789, 187, 'barbora.dobra@doctrina.cz', 2, 'septima', 'chemický seminář', '2025-04-08 21:49:10'),
(790, 187, 'barbora.dobra@doctrina.cz', 5, 'septima', 'aplikovaná fyzika', '2025-04-08 21:49:11'),
(791, 187, 'barbora.dobra@doctrina.cz', 7, 'septima', 'biologie člověka rozšířená', '2025-04-08 21:49:11'),
(792, 187, 'barbora.dobra@doctrina.cz', 22, 'septima', 'finanční gramotnost', '2025-04-08 21:49:11'),
(793, 189, 'lucie.faloutova@doctrina.cz', 8, 'septima', 'globální problémy', '2025-04-08 22:02:08'),
(794, 189, 'lucie.faloutova@doctrina.cz', 20, 'septima', 'Advanced English', '2025-04-08 22:02:08'),
(795, 189, 'lucie.faloutova@doctrina.cz', 21, 'septima', 'Advanced English', '2025-04-08 22:02:08'),
(796, 189, 'lucie.faloutova@doctrina.cz', 23, 'septima', 'Open Education', '2025-04-08 22:02:08'),
(799, 41, 'adam.farek@doctrina.cz', 4, 'kvinta', 'výtvarné techniky', '2025-04-08 22:14:43'),
(800, 41, 'adam.farek@doctrina.cz', 8, 'kvinta', 'IT dílna', '2025-04-08 22:14:43'),
(801, 190, 'viktor.steger@doctrina.cz', 1, 'oktava', 'fyzika', '2025-04-08 22:17:59'),
(802, 190, 'viktor.steger@doctrina.cz', 4, 'oktava', 'fyzika', '2025-04-08 22:17:59'),
(803, 190, 'viktor.steger@doctrina.cz', 7, 'oktava', 'aplikovaná fyzika', '2025-04-08 22:17:59'),
(804, 190, 'viktor.steger@doctrina.cz', 10, 'oktava', 'aplikovaná fyzika', '2025-04-08 22:18:00'),
(805, 190, 'viktor.steger@doctrina.cz', 21, 'oktava', 'zeměpis', '2025-04-08 22:18:00'),
(806, 190, 'viktor.steger@doctrina.cz', 24, 'oktava', 'zeměpis', '2025-04-08 22:18:00'),
(807, 190, 'viktor.steger@doctrina.cz', 35, 'oktava', 'matematika rozšířená*', '2025-04-08 22:18:00'),
(808, 190, 'viktor.steger@doctrina.cz', 37, 'oktava', 'matematika rozšířená*', '2025-04-08 22:18:00'),
(809, 190, 'viktor.steger@doctrina.cz', 39, 'oktava', 'matematika rozšířená*', '2025-04-08 22:18:00'),
(810, 190, 'viktor.steger@doctrina.cz', 42, 'oktava', 'matematika rozšířená*', '2025-04-08 22:18:00'),
(811, 188, 'taisia.biriucova@doctrina.cz', 9, 'rocnik3', 'výtvarná výchova', '2025-04-08 22:18:16'),
(812, 188, 'taisia.biriucova@doctrina.cz', 13, 'rocnik3', 'výtvarná výchova', '2025-04-08 22:18:16'),
(813, 188, 'taisia.biriucova@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-08 22:18:16'),
(814, 188, 'taisia.biriucova@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-08 22:18:16'),
(815, 42, 'filip.benes@doctrina.cz', 1, 'oktava', 'fyzika', '2025-04-08 22:18:23'),
(816, 42, 'filip.benes@doctrina.cz', 4, 'oktava', 'fyzika', '2025-04-08 22:18:23'),
(817, 42, 'filip.benes@doctrina.cz', 7, 'oktava', 'aplikovaná fyzika', '2025-04-08 22:18:23'),
(818, 42, 'filip.benes@doctrina.cz', 10, 'oktava', 'aplikovaná fyzika', '2025-04-08 22:18:23'),
(819, 42, 'filip.benes@doctrina.cz', 21, 'oktava', 'zeměpis', '2025-04-08 22:18:23'),
(820, 42, 'filip.benes@doctrina.cz', 24, 'oktava', 'zeměpis', '2025-04-08 22:18:23'),
(821, 42, 'filip.benes@doctrina.cz', 35, 'oktava', 'matematika rozšířená*', '2025-04-08 22:18:23'),
(822, 42, 'filip.benes@doctrina.cz', 37, 'oktava', 'matematika rozšířená*', '2025-04-08 22:18:23'),
(823, 42, 'filip.benes@doctrina.cz', 39, 'oktava', 'matematika rozšířená*', '2025-04-08 22:18:23'),
(824, 42, 'filip.benes@doctrina.cz', 42, 'oktava', 'matematika rozšířená*', '2025-04-08 22:18:23'),
(825, 184, 'zuzana.stechova@doctrina.cz', 4, 'rocnik3', 'výtvarná tvorba', '2025-04-08 22:18:39'),
(826, 184, 'zuzana.stechova@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-08 22:18:39'),
(827, 184, 'zuzana.stechova@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-08 22:18:39'),
(828, 184, 'zuzana.stechova@doctrina.cz', 22, 'rocnik3', 'finanční gramotnost', '2025-04-08 22:18:39'),
(829, 53, 'marek.jahoda2@doctrina.cz', 8, 'kvinta', 'IT dílna', '2025-04-08 23:02:52'),
(830, 53, 'marek.jahoda2@doctrina.cz', 11, 'kvinta', 'anglická konverzace', '2025-04-08 23:02:52'),
(833, 25, 'hynek.sedlbauer@doctrina.cz', 4, 'kvinta', 'výtvarné techniky', '2025-04-09 00:09:33'),
(834, 25, 'hynek.sedlbauer@doctrina.cz', 11, 'kvinta', 'anglická konverzace', '2025-04-09 00:09:33'),
(835, 120, 'matous.papirnik@doctrina.cz', 14, 'rocnik4', 'VSP', '2025-04-09 08:56:52'),
(836, 120, 'matous.papirnik@doctrina.cz', 21, 'rocnik4', 'zeměpis', '2025-04-09 08:56:52'),
(837, 120, 'matous.papirnik@doctrina.cz', 24, 'rocnik4', 'zeměpis', '2025-04-09 08:56:52'),
(838, 120, 'matous.papirnik@doctrina.cz', 26, 'rocnik4', 'chemie', '2025-04-09 08:56:52'),
(839, 120, 'matous.papirnik@doctrina.cz', 28, 'rocnik4', 'chemie', '2025-04-09 08:56:52'),
(840, 120, 'matous.papirnik@doctrina.cz', 32, 'rocnik4', 'biologie', '2025-04-09 08:56:52'),
(841, 120, 'matous.papirnik@doctrina.cz', 33, 'rocnik4', 'biologie', '2025-04-09 08:56:52'),
(842, 120, 'matous.papirnik@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-09 08:56:52'),
(843, 120, 'matous.papirnik@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-09 08:56:52'),
(844, 120, 'matous.papirnik@doctrina.cz', 40, 'rocnik4', 'biologický seminář', '2025-04-09 08:56:52'),
(861, 194, 'frantisek.vanek@doctrina.cz', 1, 'septima', 'matematika rozšířená', '2025-04-09 10:12:18'),
(862, 194, 'frantisek.vanek@doctrina.cz', 5, 'septima', 'aplikovaná fyzika', '2025-04-09 10:12:18'),
(863, 194, 'frantisek.vanek@doctrina.cz', 8, 'septima', 'globální problémy', '2025-04-09 10:12:18'),
(864, 194, 'frantisek.vanek@doctrina.cz', 24, 'septima', 'anglická konverzace', '2025-04-09 10:12:18'),
(869, 195, 'vilem.redl@doctrina.cz', 2, 'septima', 'chemický seminář', '2025-04-09 10:14:05'),
(870, 195, 'vilem.redl@doctrina.cz', 20, 'septima', 'Advanced English', '2025-04-09 10:14:06'),
(871, 195, 'vilem.redl@doctrina.cz', 21, 'septima', 'Advanced English', '2025-04-09 10:14:06'),
(872, 195, 'vilem.redl@doctrina.cz', 24, 'septima', 'anglická konverzace', '2025-04-09 10:14:06'),
(873, 193, 'jan.fedorcak@doctrina.cz', 14, 'rocnik3', 'deskriptivní geometrie', '2025-04-09 10:51:21'),
(874, 193, 'jan.fedorcak@doctrina.cz', 17, 'rocnik3', 'deskriptivní geometrie', '2025-04-09 10:51:21'),
(875, 193, 'jan.fedorcak@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-09 10:51:21'),
(876, 193, 'jan.fedorcak@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-09 10:51:21'),
(877, 98, 'vaclav.vokurka@doctrina.cz', 8, 'kvinta', 'IT dílna', '2025-04-09 10:52:06'),
(878, 98, 'vaclav.vokurka@doctrina.cz', 11, 'kvinta', 'anglická konverzace', '2025-04-09 10:52:06'),
(879, 95, 'antonin.sebanek@doctrina.cz', 1, 'kvinta', 'matematika rozšířená', '2025-04-09 10:57:40'),
(880, 95, 'antonin.sebanek@doctrina.cz', 11, 'kvinta', 'anglická konverzace', '2025-04-09 10:57:40'),
(889, 198, 'petr.severa@doctrina.cz', 2, 'rocnik3', 'chemický seminář', '2025-04-09 11:39:48'),
(890, 198, 'petr.severa@doctrina.cz', 7, 'rocnik3', 'biologie člověka rozšířená', '2025-04-09 11:39:48'),
(891, 198, 'petr.severa@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-09 11:39:48'),
(892, 198, 'petr.severa@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-09 11:39:48'),
(893, 200, 'tereza.kavalirova@doctrina.cz', 3, 'rocnik4', 'výtvarná výchova', '2025-04-09 12:02:41'),
(894, 200, 'tereza.kavalirova@doctrina.cz', 6, 'rocnik4', 'výtvarná výchova', '2025-04-09 12:02:41'),
(895, 200, 'tereza.kavalirova@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-09 12:02:41'),
(896, 200, 'tereza.kavalirova@doctrina.cz', 21, 'rocnik4', 'zeměpis', '2025-04-09 12:02:41'),
(897, 200, 'tereza.kavalirova@doctrina.cz', 24, 'rocnik4', 'zeměpis', '2025-04-09 12:02:41'),
(898, 200, 'tereza.kavalirova@doctrina.cz', 27, 'rocnik4', 'dějepis', '2025-04-09 12:02:41'),
(899, 200, 'tereza.kavalirova@doctrina.cz', 29, 'rocnik4', 'dějepis', '2025-04-09 12:02:41'),
(900, 200, 'tereza.kavalirova@doctrina.cz', 31, 'rocnik4', 'dějepis', '2025-04-09 12:02:41'),
(901, 200, 'tereza.kavalirova@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-09 12:02:41'),
(902, 200, 'tereza.kavalirova@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-09 12:02:41'),
(903, 202, 'matyas.klepl@doctrina.cz', 4, 'sexta', 'výtvarná tvorba', '2025-04-09 12:26:58'),
(904, 202, 'matyas.klepl@doctrina.cz', 8, 'sexta', 'hudební estetika', '2025-04-09 12:26:58'),
(905, 202, 'matyas.klepl@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-09 12:26:58'),
(906, 202, 'matyas.klepl@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-09 12:26:58'),
(907, 202, 'matyas.klepl@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-09 12:26:58'),
(908, 201, 'adam.fendrych@doctrina.cz', 1, 'rocnik3', 'matematika rozšířená', '2025-04-09 12:56:06'),
(909, 201, 'adam.fendrych@doctrina.cz', 8, 'rocnik3', 'globální problémy', '2025-04-09 12:56:06'),
(910, 201, 'adam.fendrych@doctrina.cz', 22, 'rocnik3', 'finanční gramotnost', '2025-04-09 12:56:06'),
(911, 201, 'adam.fendrych@doctrina.cz', 24, 'rocnik3', 'anglická konverzace', '2025-04-09 12:56:06'),
(912, 203, 'michaela.soldatova@doctrina.cz', 8, 'rocnik3', 'globální problémy', '2025-04-09 12:59:22'),
(913, 203, 'michaela.soldatova@doctrina.cz', 12, 'rocnik3', 'literární seminář', '2025-04-09 12:59:22'),
(914, 203, 'michaela.soldatova@doctrina.cz', 22, 'rocnik3', 'finanční gramotnost', '2025-04-09 12:59:22'),
(915, 203, 'michaela.soldatova@doctrina.cz', 25, 'rocnik3', 'německá konverzace', '2025-04-09 12:59:22'),
(916, 204, 'stepan.masik@doctrina.cz', 4, 'rocnik3', 'výtvarná tvorba', '2025-04-09 13:29:35'),
(917, 204, 'stepan.masik@doctrina.cz', 14, 'rocnik3', 'deskriptivní geometrie', '2025-04-09 13:29:35'),
(918, 204, 'stepan.masik@doctrina.cz', 17, 'rocnik3', 'deskriptivní geometrie', '2025-04-09 13:29:35'),
(919, 204, 'stepan.masik@doctrina.cz', 24, 'rocnik3', 'anglická konverzace', '2025-04-09 13:29:35'),
(920, 205, 'stepanka.bacova@doctrina.cz', 7, 'rocnik3', 'biologie člověka rozšířená', '2025-04-09 15:45:15'),
(921, 205, 'stepanka.bacova@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-09 15:45:15'),
(922, 205, 'stepanka.bacova@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-09 15:45:15'),
(923, 205, 'stepanka.bacova@doctrina.cz', 22, 'rocnik3', 'finanční gramotnost', '2025-04-09 15:45:15'),
(924, 152, 'magdalena.prokesova@doctrina.cz', 7, 'kvinta', 'kořeny evropské kultury', '2025-04-09 15:55:06'),
(925, 152, 'magdalena.prokesova@doctrina.cz', 13, 'kvinta', 'německá konverzace', '2025-04-09 15:55:06'),
(926, 206, 'hana.jirovska@doctrina.cz', 7, 'kvinta', 'kořeny evropské kultury', '2025-04-09 16:00:04'),
(927, 206, 'hana.jirovska@doctrina.cz', 13, 'kvinta', 'německá konverzace', '2025-04-09 16:00:04'),
(928, 191, 'vojtech.moravek@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-09 16:17:54'),
(929, 207, 'klara.markova@doctrina.cz', 7, 'septima', 'biologie člověka rozšířená', '2025-04-09 16:53:16'),
(930, 207, 'klara.markova@doctrina.cz', 12, 'septima', 'literární seminář', '2025-04-09 16:53:16'),
(931, 207, 'klara.markova@doctrina.cz', 20, 'septima', 'Advanced English', '2025-04-09 16:53:16'),
(932, 207, 'klara.markova@doctrina.cz', 21, 'septima', 'Advanced English', '2025-04-09 16:53:16'),
(933, 139, 'tatiana.hruzova@doctrina.cz', 3, 'septima', 'historický seminář', '2025-04-09 17:13:50'),
(934, 139, 'tatiana.hruzova@doctrina.cz', 7, 'septima', 'biologie člověka rozšířená', '2025-04-09 17:13:50'),
(935, 139, 'tatiana.hruzova@doctrina.cz', 11, 'septima', 'ekologie', '2025-04-09 17:13:50'),
(936, 139, 'tatiana.hruzova@doctrina.cz', 24, 'septima', 'anglická konverzace', '2025-04-09 17:13:50'),
(937, 208, 'jakub.janousek@doctrina.cz', 7, 'rocnik2', 'historický seminář', '2025-04-09 17:20:18'),
(938, 208, 'jakub.janousek@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-09 17:20:18'),
(939, 208, 'jakub.janousek@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-09 17:20:18'),
(940, 208, 'jakub.janousek@doctrina.cz', 16, 'rocnik2', 'španělská konverzace', '2025-04-09 17:20:18'),
(941, 208, 'jakub.janousek@doctrina.cz', 18, 'rocnik2', 'hudební výchova', '2025-04-09 17:20:18'),
(942, 118, 'jan.litvan@doctrina.cz', 1, 'oktava', 'fyzika', '2025-04-09 18:29:48'),
(943, 118, 'jan.litvan@doctrina.cz', 4, 'oktava', 'fyzika', '2025-04-09 18:29:48'),
(944, 118, 'jan.litvan@doctrina.cz', 14, 'oktava', 'VSP', '2025-04-09 18:29:48'),
(945, 118, 'jan.litvan@doctrina.cz', 26, 'oktava', 'chemie', '2025-04-09 18:29:48'),
(946, 118, 'jan.litvan@doctrina.cz', 28, 'oktava', 'chemie', '2025-04-09 18:29:48'),
(947, 118, 'jan.litvan@doctrina.cz', 30, 'oktava', 'biochemie', '2025-04-09 18:29:48'),
(948, 118, 'jan.litvan@doctrina.cz', 35, 'oktava', 'matematika rozšířená*', '2025-04-09 18:29:48'),
(949, 118, 'jan.litvan@doctrina.cz', 37, 'oktava', 'matematika rozšířená*', '2025-04-09 18:29:48'),
(950, 118, 'jan.litvan@doctrina.cz', 39, 'oktava', 'matematika rozšířená*', '2025-04-09 18:29:48'),
(951, 118, 'jan.litvan@doctrina.cz', 42, 'oktava', 'matematika rozšířená*', '2025-04-09 18:29:48'),
(952, 213, 'jakub.vondrous@doctrina.cz', 8, 'oktava', 'antropologický seminář', '2025-04-09 18:36:00'),
(953, 213, 'jakub.vondrous@doctrina.cz', 14, 'oktava', 'VSP', '2025-04-09 18:36:00'),
(954, 213, 'jakub.vondrous@doctrina.cz', 21, 'oktava', 'zeměpis', '2025-04-09 18:36:00'),
(955, 213, 'jakub.vondrous@doctrina.cz', 24, 'oktava', 'zeměpis', '2025-04-09 18:36:00'),
(956, 213, 'jakub.vondrous@doctrina.cz', 27, 'oktava', 'dějepis', '2025-04-09 18:36:00'),
(957, 213, 'jakub.vondrous@doctrina.cz', 29, 'oktava', 'dějepis', '2025-04-09 18:36:00'),
(958, 213, 'jakub.vondrous@doctrina.cz', 31, 'oktava', 'dějepis', '2025-04-09 18:36:00'),
(959, 213, 'jakub.vondrous@doctrina.cz', 34, 'oktava', 'společenskovědní seminář', '2025-04-09 18:36:01'),
(960, 213, 'jakub.vondrous@doctrina.cz', 36, 'oktava', 'matematika základní*', '2025-04-09 18:36:01'),
(961, 213, 'jakub.vondrous@doctrina.cz', 38, 'oktava', 'matematika základní*', '2025-04-09 18:36:01'),
(962, 214, 'kristian.bohun@doctrina.cz', 1, 'oktava', 'fyzika', '2025-04-09 18:40:31'),
(963, 214, 'kristian.bohun@doctrina.cz', 4, 'oktava', 'fyzika', '2025-04-09 18:40:31'),
(964, 214, 'kristian.bohun@doctrina.cz', 15, 'oktava', 'anglické reálie', '2025-04-09 18:40:31'),
(965, 214, 'kristian.bohun@doctrina.cz', 27, 'oktava', 'dějepis', '2025-04-09 18:40:31'),
(966, 214, 'kristian.bohun@doctrina.cz', 29, 'oktava', 'dějepis', '2025-04-09 18:40:31'),
(967, 214, 'kristian.bohun@doctrina.cz', 31, 'oktava', 'dějepis', '2025-04-09 18:40:31'),
(968, 214, 'kristian.bohun@doctrina.cz', 35, 'oktava', 'matematika rozšířená*', '2025-04-09 18:40:31'),
(969, 214, 'kristian.bohun@doctrina.cz', 37, 'oktava', 'matematika rozšířená*', '2025-04-09 18:40:31'),
(970, 214, 'kristian.bohun@doctrina.cz', 39, 'oktava', 'matematika rozšířená*', '2025-04-09 18:40:31'),
(971, 214, 'kristian.bohun@doctrina.cz', 42, 'oktava', 'matematika rozšířená*', '2025-04-09 18:40:31'),
(972, 215, 'jakub.dusek@doctrina.cz', 8, 'oktava', 'antropologický seminář', '2025-04-09 18:44:08'),
(973, 215, 'jakub.dusek@doctrina.cz', 11, 'oktava', 'evoluční biologie', '2025-04-09 18:44:08'),
(974, 215, 'jakub.dusek@doctrina.cz', 14, 'oktava', 'VSP', '2025-04-09 18:44:08'),
(975, 215, 'jakub.dusek@doctrina.cz', 30, 'oktava', 'biochemie', '2025-04-09 18:44:08'),
(976, 215, 'jakub.dusek@doctrina.cz', 32, 'oktava', 'biologie', '2025-04-09 18:44:08'),
(977, 215, 'jakub.dusek@doctrina.cz', 33, 'oktava', 'biologie', '2025-04-09 18:44:08'),
(978, 215, 'jakub.dusek@doctrina.cz', 36, 'oktava', 'matematika základní*', '2025-04-09 18:44:08'),
(979, 215, 'jakub.dusek@doctrina.cz', 38, 'oktava', 'matematika základní*', '2025-04-09 18:44:08'),
(980, 215, 'jakub.dusek@doctrina.cz', 40, 'oktava', 'biologický seminář', '2025-04-09 18:44:08'),
(981, 215, 'jakub.dusek@doctrina.cz', 44, 'oktava', 'německá konverzace', '2025-04-09 18:44:08'),
(982, 216, 'jiri.kosek@doctrina.cz', 1, 'rocnik3', 'matematika rozšířená', '2025-04-09 18:49:11'),
(983, 216, 'jiri.kosek@doctrina.cz', 8, 'rocnik3', 'globální problémy', '2025-04-09 18:49:11'),
(984, 216, 'jiri.kosek@doctrina.cz', 14, 'rocnik3', 'deskriptivní geometrie', '2025-04-09 18:49:11'),
(985, 216, 'jiri.kosek@doctrina.cz', 17, 'rocnik3', 'deskriptivní geometrie', '2025-04-09 18:49:11'),
(986, 35, 'simona.petruzelova@doctrina.cz', 15, 'oktava', 'anglické reálie', '2025-04-09 18:50:36'),
(987, 35, 'simona.petruzelova@doctrina.cz', 19, 'oktava', 'anglická literatura', '2025-04-09 18:50:36'),
(988, 35, 'simona.petruzelova@doctrina.cz', 21, 'oktava', 'zeměpis', '2025-04-09 18:50:36'),
(989, 35, 'simona.petruzelova@doctrina.cz', 24, 'oktava', 'zeměpis', '2025-04-09 18:50:36'),
(990, 35, 'simona.petruzelova@doctrina.cz', 30, 'oktava', 'biochemie', '2025-04-09 18:50:36'),
(991, 35, 'simona.petruzelova@doctrina.cz', 34, 'oktava', 'společenskovědní seminář', '2025-04-09 18:50:36'),
(992, 35, 'simona.petruzelova@doctrina.cz', 36, 'oktava', 'matematika základní*', '2025-04-09 18:50:36'),
(993, 35, 'simona.petruzelova@doctrina.cz', 38, 'oktava', 'matematika základní*', '2025-04-09 18:50:37'),
(994, 35, 'simona.petruzelova@doctrina.cz', 41, 'oktava', 'Open Education', '2025-04-09 18:50:37'),
(995, 35, 'simona.petruzelova@doctrina.cz', 43, 'oktava', 'anglická konverzace', '2025-04-09 18:50:37'),
(996, 22, 'antonin.vokurka@doctrina.cz', 2, 'septima', 'chemický seminář', '2025-04-09 18:51:58'),
(997, 22, 'antonin.vokurka@doctrina.cz', 7, 'septima', 'biologie člověka rozšířená', '2025-04-09 18:51:58'),
(998, 22, 'antonin.vokurka@doctrina.cz', 11, 'septima', 'ekologie', '2025-04-09 18:51:58'),
(999, 22, 'antonin.vokurka@doctrina.cz', 25, 'septima', 'německá konverzace', '2025-04-09 18:51:58'),
(1000, 217, 'zuzana.huskova@doctrina.cz', 8, 'septima', 'globální problémy', '2025-04-09 18:58:09'),
(1001, 217, 'zuzana.huskova@doctrina.cz', 12, 'septima', 'literární seminář', '2025-04-09 18:58:09'),
(1002, 217, 'zuzana.huskova@doctrina.cz', 20, 'septima', 'Advanced English', '2025-04-09 18:58:09'),
(1003, 217, 'zuzana.huskova@doctrina.cz', 21, 'septima', 'Advanced English', '2025-04-09 18:58:09'),
(1004, 218, 'matyas.mysik@doctrina.cz', 6, 'sexta', 'regionální výzvy', '2025-04-09 19:11:01'),
(1005, 218, 'matyas.mysik@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-09 19:11:01'),
(1006, 218, 'matyas.mysik@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-09 19:11:01'),
(1007, 218, 'matyas.mysik@doctrina.cz', 14, 'sexta', 'anglická konverzace', '2025-04-09 19:11:01'),
(1008, 218, 'matyas.mysik@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-09 19:11:01'),
(1009, 196, 'matej.plsek@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-09 19:11:33'),
(1010, 196, 'matej.plsek@doctrina.cz', 14, 'rocnik4', 'VSP', '2025-04-09 19:11:33'),
(1011, 196, 'matej.plsek@doctrina.cz', 21, 'rocnik4', 'zeměpis', '2025-04-09 19:11:33'),
(1012, 196, 'matej.plsek@doctrina.cz', 24, 'rocnik4', 'zeměpis', '2025-04-09 19:11:33'),
(1013, 196, 'matej.plsek@doctrina.cz', 27, 'rocnik4', 'dějepis', '2025-04-09 19:11:33'),
(1014, 196, 'matej.plsek@doctrina.cz', 29, 'rocnik4', 'dějepis', '2025-04-09 19:11:33'),
(1015, 196, 'matej.plsek@doctrina.cz', 31, 'rocnik4', 'dějepis', '2025-04-09 19:11:33'),
(1016, 196, 'matej.plsek@doctrina.cz', 34, 'rocnik4', 'společenskovědní seminář', '2025-04-09 19:11:33'),
(1017, 196, 'matej.plsek@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-09 19:11:33'),
(1018, 196, 'matej.plsek@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-09 19:11:33'),
(1019, 210, 'benjamin.plesak@doctrina.cz', 1, 'rocnik4', 'fyzika', '2025-04-09 19:30:27'),
(1020, 210, 'benjamin.plesak@doctrina.cz', 4, 'rocnik4', 'fyzika', '2025-04-09 19:30:27'),
(1021, 210, 'benjamin.plesak@doctrina.cz', 19, 'rocnik4', 'anglická literatura', '2025-04-09 19:30:27'),
(1022, 210, 'benjamin.plesak@doctrina.cz', 22, 'rocnik4', 'psychologie', '2025-04-09 19:30:27'),
(1023, 210, 'benjamin.plesak@doctrina.cz', 25, 'rocnik4', 'psychologie', '2025-04-09 19:30:27'),
(1024, 210, 'benjamin.plesak@doctrina.cz', 30, 'rocnik4', 'biochemie', '2025-04-09 19:30:27'),
(1025, 210, 'benjamin.plesak@doctrina.cz', 35, 'rocnik4', 'matematika rozšířená*', '2025-04-09 19:30:27'),
(1026, 210, 'benjamin.plesak@doctrina.cz', 37, 'rocnik4', 'matematika rozšířená*', '2025-04-09 19:30:27'),
(1027, 210, 'benjamin.plesak@doctrina.cz', 39, 'rocnik4', 'matematika rozšířená*', '2025-04-09 19:30:27'),
(1028, 210, 'benjamin.plesak@doctrina.cz', 42, 'rocnik4', 'matematika rozšířená*', '2025-04-09 19:30:27'),
(1029, 211, 'lucie.korpasova@doctrina.cz', 9, 'rocnik4', 'historický seminář', '2025-04-09 19:35:37'),
(1030, 211, 'lucie.korpasova@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-09 19:35:37'),
(1031, 211, 'lucie.korpasova@doctrina.cz', 14, 'rocnik4', 'VSP', '2025-04-09 19:35:37'),
(1032, 211, 'lucie.korpasova@doctrina.cz', 19, 'rocnik4', 'anglická literatura', '2025-04-09 19:35:37'),
(1033, 211, 'lucie.korpasova@doctrina.cz', 22, 'rocnik4', 'psychologie', '2025-04-09 19:35:37'),
(1034, 211, 'lucie.korpasova@doctrina.cz', 25, 'rocnik4', 'psychologie', '2025-04-09 19:35:37'),
(1035, 211, 'lucie.korpasova@doctrina.cz', 34, 'rocnik4', 'společenskovědní seminář', '2025-04-09 19:35:37'),
(1036, 211, 'lucie.korpasova@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-09 19:35:37'),
(1037, 211, 'lucie.korpasova@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-09 19:35:37'),
(1038, 211, 'lucie.korpasova@doctrina.cz', 40, 'rocnik4', 'biologický seminář', '2025-04-09 19:35:37'),
(1039, 219, 'alzbeta.minsterova@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-09 19:47:47'),
(1040, 219, 'alzbeta.minsterova@doctrina.cz', 14, 'rocnik4', 'VSP', '2025-04-09 19:47:47'),
(1041, 219, 'alzbeta.minsterova@doctrina.cz', 21, 'rocnik4', 'zeměpis', '2025-04-09 19:47:47'),
(1042, 219, 'alzbeta.minsterova@doctrina.cz', 24, 'rocnik4', 'zeměpis', '2025-04-09 19:47:47'),
(1043, 219, 'alzbeta.minsterova@doctrina.cz', 27, 'rocnik4', 'dějepis', '2025-04-09 19:47:47'),
(1044, 219, 'alzbeta.minsterova@doctrina.cz', 29, 'rocnik4', 'dějepis', '2025-04-09 19:47:47'),
(1045, 219, 'alzbeta.minsterova@doctrina.cz', 31, 'rocnik4', 'dějepis', '2025-04-09 19:47:47'),
(1046, 219, 'alzbeta.minsterova@doctrina.cz', 34, 'rocnik4', 'společenskovědní seminář', '2025-04-09 19:47:47'),
(1047, 219, 'alzbeta.minsterova@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-09 19:47:48'),
(1048, 219, 'alzbeta.minsterova@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-09 19:47:48'),
(1049, 209, 'ella.prikrylova@doctrina.cz', 9, 'rocnik4', 'historický seminář', '2025-04-09 19:51:33'),
(1050, 209, 'ella.prikrylova@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-09 19:51:33'),
(1051, 209, 'ella.prikrylova@doctrina.cz', 14, 'rocnik4', 'VSP', '2025-04-09 19:51:33'),
(1052, 209, 'ella.prikrylova@doctrina.cz', 18, 'rocnik4', 'aplikovaná psychologie', '2025-04-09 19:51:33'),
(1053, 209, 'ella.prikrylova@doctrina.cz', 22, 'rocnik4', 'psychologie', '2025-04-09 19:51:33'),
(1054, 209, 'ella.prikrylova@doctrina.cz', 25, 'rocnik4', 'psychologie', '2025-04-09 19:51:33'),
(1055, 209, 'ella.prikrylova@doctrina.cz', 34, 'rocnik4', 'společenskovědní seminář', '2025-04-09 19:51:33'),
(1056, 209, 'ella.prikrylova@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-09 19:51:33'),
(1057, 209, 'ella.prikrylova@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-09 19:51:33'),
(1058, 209, 'ella.prikrylova@doctrina.cz', 40, 'rocnik4', 'biologický seminář', '2025-04-09 19:51:33'),
(1066, 212, 'adela.podholova@doctrina.cz', 2, 'sexta', 'etologie', '2025-04-09 19:55:19'),
(1067, 212, 'adela.podholova@doctrina.cz', 10, 'sexta', 'Open Education', '2025-04-09 19:55:19'),
(1068, 212, 'adela.podholova@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-09 19:55:19'),
(1069, 212, 'adela.podholova@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-09 19:55:19'),
(1070, 212, 'adela.podholova@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-09 19:55:19'),
(1071, 149, 'petr.kasak@doctrina.cz', 1, 'rocnik4', 'fyzika', '2025-04-09 20:07:51'),
(1072, 149, 'petr.kasak@doctrina.cz', 4, 'rocnik4', 'fyzika', '2025-04-09 20:07:51'),
(1073, 149, 'petr.kasak@doctrina.cz', 12, 'rocnik4', 'literární seminář', '2025-04-09 20:07:51'),
(1074, 149, 'petr.kasak@doctrina.cz', 14, 'rocnik4', 'VSP', '2025-04-09 20:07:51'),
(1075, 149, 'petr.kasak@doctrina.cz', 19, 'rocnik4', 'anglická literatura', '2025-04-09 20:07:51'),
(1076, 149, 'petr.kasak@doctrina.cz', 21, 'rocnik4', 'zeměpis', '2025-04-09 20:07:51'),
(1077, 149, 'petr.kasak@doctrina.cz', 24, 'rocnik4', 'zeměpis', '2025-04-09 20:07:51'),
(1078, 149, 'petr.kasak@doctrina.cz', 30, 'rocnik4', 'biochemie', '2025-04-09 20:07:51'),
(1079, 149, 'petr.kasak@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-09 20:07:51'),
(1080, 149, 'petr.kasak@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-09 20:07:51'),
(1082, 36, 'krystof.bures@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-09 20:31:05'),
(1083, 221, 'alzbeta.hronova@doctrina.cz', 2, 'septima', 'chemický seminář', '2025-04-09 20:52:24'),
(1084, 221, 'alzbeta.hronova@doctrina.cz', 11, 'septima', 'ekologie', '2025-04-09 20:52:24'),
(1085, 221, 'alzbeta.hronova@doctrina.cz', 20, 'septima', 'Advanced English', '2025-04-09 20:52:24'),
(1086, 221, 'alzbeta.hronova@doctrina.cz', 21, 'septima', 'Advanced English', '2025-04-09 20:52:24'),
(1087, 220, 'David.Trpisovsky@doctrina.cz', 7, 'sexta', 'historický seminář', '2025-04-09 20:52:50'),
(1088, 220, 'David.Trpisovsky@doctrina.cz', 10, 'sexta', 'Open Education', '2025-04-09 20:52:50'),
(1089, 220, 'David.Trpisovsky@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-09 20:52:50'),
(1090, 220, 'David.Trpisovsky@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-09 20:52:50'),
(1091, 220, 'David.Trpisovsky@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-09 20:52:50'),
(1092, 222, 'sofie.baranikova@doctrina.cz', 3, 'kvinta', 'historický seminář', '2025-04-09 20:54:01'),
(1093, 222, 'sofie.baranikova@doctrina.cz', 11, 'kvinta', 'anglická konverzace', '2025-04-09 20:54:01'),
(1094, 223, 'julie.horatschkeova@doctrina.cz', 2, 'septima', 'chemický seminář', '2025-04-09 21:06:53'),
(1095, 223, 'julie.horatschkeova@doctrina.cz', 7, 'septima', 'biologie člověka rozšířená', '2025-04-09 21:06:53'),
(1096, 223, 'julie.horatschkeova@doctrina.cz', 11, 'septima', 'ekologie', '2025-04-09 21:06:53'),
(1097, 223, 'julie.horatschkeova@doctrina.cz', 23, 'septima', 'Open Education', '2025-04-09 21:06:53'),
(1098, 224, 'dominik.cesar@doctrina.cz', 7, 'rocnik2', 'historický seminář', '2025-04-09 21:49:21'),
(1099, 224, 'dominik.cesar@doctrina.cz', 12, 'rocnik2', 'Advanced English', '2025-04-09 21:49:21'),
(1100, 224, 'dominik.cesar@doctrina.cz', 13, 'rocnik2', 'Advanced English', '2025-04-09 21:49:21'),
(1101, 224, 'dominik.cesar@doctrina.cz', 16, 'rocnik2', 'španělská konverzace', '2025-04-09 21:49:21'),
(1102, 224, 'dominik.cesar@doctrina.cz', 17, 'rocnik2', 'výtvarná výchova', '2025-04-09 21:49:21'),
(1103, 182, 'marek.zaklasnik@doctrina.cz', 1, 'sexta', 'matematika rozšířená', '2025-04-09 22:11:24'),
(1104, 182, 'marek.zaklasnik@doctrina.cz', 6, 'sexta', 'regionální výzvy', '2025-04-09 22:11:24'),
(1105, 182, 'marek.zaklasnik@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-09 22:11:24'),
(1106, 182, 'marek.zaklasnik@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-09 22:11:24'),
(1107, 182, 'marek.zaklasnik@doctrina.cz', 17, 'sexta', 'výtvarná výchova', '2025-04-09 22:11:24'),
(1108, 225, 'patrik.steiner@doctrina.cz', 10, 'sexta', 'Open Education', '2025-04-09 22:20:41'),
(1109, 225, 'patrik.steiner@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-09 22:20:41'),
(1110, 225, 'patrik.steiner@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-09 22:20:41'),
(1111, 225, 'patrik.steiner@doctrina.cz', 15, 'sexta', 'německá konverzace', '2025-04-09 22:20:41'),
(1112, 225, 'patrik.steiner@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-09 22:20:41'),
(1113, 227, 'tereza.loudova@doctrina.cz', 7, 'rocnik3', 'biologie člověka rozšířená', '2025-04-09 22:56:25'),
(1114, 227, 'tereza.loudova@doctrina.cz', 12, 'rocnik3', 'literární seminář', '2025-04-09 22:56:25'),
(1115, 227, 'tereza.loudova@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-09 22:56:25'),
(1116, 227, 'tereza.loudova@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-09 22:56:25'),
(1117, 230, 'katerina.pelantova@doctrina.cz', 12, 'oktava', 'literární seminář', '2025-04-09 23:27:45'),
(1118, 230, 'katerina.pelantova@doctrina.cz', 18, 'oktava', 'aplikovaná psychologie', '2025-04-09 23:27:45'),
(1119, 230, 'katerina.pelantova@doctrina.cz', 22, 'oktava', 'psychologie', '2025-04-09 23:27:45'),
(1120, 230, 'katerina.pelantova@doctrina.cz', 25, 'oktava', 'psychologie', '2025-04-09 23:27:45'),
(1121, 230, 'katerina.pelantova@doctrina.cz', 27, 'oktava', 'dějepis', '2025-04-09 23:27:45'),
(1122, 230, 'katerina.pelantova@doctrina.cz', 29, 'oktava', 'dějepis', '2025-04-09 23:27:45'),
(1123, 230, 'katerina.pelantova@doctrina.cz', 31, 'oktava', 'dějepis', '2025-04-09 23:27:45'),
(1124, 230, 'katerina.pelantova@doctrina.cz', 36, 'oktava', 'matematika základní*', '2025-04-09 23:27:45'),
(1125, 230, 'katerina.pelantova@doctrina.cz', 38, 'oktava', 'matematika základní*', '2025-04-09 23:27:45'),
(1126, 230, 'katerina.pelantova@doctrina.cz', 45, 'oktava', 'španělská konverzace', '2025-04-09 23:27:45'),
(1137, 229, 'ondrej.beran@doctrina.cz', 11, 'oktava', 'evoluční biologie', '2025-04-09 23:32:17'),
(1138, 229, 'ondrej.beran@doctrina.cz', 21, 'oktava', 'zeměpis', '2025-04-09 23:32:17'),
(1139, 229, 'ondrej.beran@doctrina.cz', 24, 'oktava', 'zeměpis', '2025-04-09 23:32:17'),
(1140, 229, 'ondrej.beran@doctrina.cz', 30, 'oktava', 'biochemie', '2025-04-09 23:32:17'),
(1141, 229, 'ondrej.beran@doctrina.cz', 32, 'oktava', 'biologie', '2025-04-09 23:32:17'),
(1142, 229, 'ondrej.beran@doctrina.cz', 33, 'oktava', 'biologie', '2025-04-09 23:32:17'),
(1143, 229, 'ondrej.beran@doctrina.cz', 36, 'oktava', 'matematika základní*', '2025-04-09 23:32:17'),
(1144, 229, 'ondrej.beran@doctrina.cz', 38, 'oktava', 'matematika základní*', '2025-04-09 23:32:17'),
(1145, 229, 'ondrej.beran@doctrina.cz', 40, 'oktava', 'biologický seminář', '2025-04-09 23:32:17'),
(1146, 229, 'ondrej.beran@doctrina.cz', 43, 'oktava', 'anglická konverzace', '2025-04-09 23:32:17'),
(1147, 228, 'jan.pospisil@doctrina.cz', 3, 'rocnik4', 'výtvarná výchova', '2025-04-09 23:33:34'),
(1148, 228, 'jan.pospisil@doctrina.cz', 6, 'rocnik4', 'výtvarná výchova', '2025-04-09 23:33:34'),
(1149, 228, 'jan.pospisil@doctrina.cz', 9, 'rocnik4', 'historický seminář', '2025-04-09 23:33:34'),
(1150, 228, 'jan.pospisil@doctrina.cz', 11, 'rocnik4', 'evoluční biologie', '2025-04-09 23:33:34'),
(1151, 228, 'jan.pospisil@doctrina.cz', 23, 'rocnik4', 'výtvarná tvorba', '2025-04-09 23:33:34'),
(1152, 228, 'jan.pospisil@doctrina.cz', 27, 'rocnik4', 'dějepis', '2025-04-09 23:33:34'),
(1153, 228, 'jan.pospisil@doctrina.cz', 29, 'rocnik4', 'dějepis', '2025-04-09 23:33:34'),
(1154, 228, 'jan.pospisil@doctrina.cz', 31, 'rocnik4', 'dějepis', '2025-04-09 23:33:34'),
(1155, 228, 'jan.pospisil@doctrina.cz', 36, 'rocnik4', 'matematika základní*', '2025-04-09 23:33:34'),
(1156, 228, 'jan.pospisil@doctrina.cz', 38, 'rocnik4', 'matematika základní*', '2025-04-09 23:33:34'),
(1162, 231, 'karolina.sirova@doctrina.cz', 5, 'sexta', 'programování', '2025-04-10 01:25:37'),
(1163, 231, 'karolina.sirova@doctrina.cz', 9, 'sexta', 'programování', '2025-04-10 01:25:37'),
(1164, 231, 'karolina.sirova@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-10 01:25:37'),
(1165, 231, 'karolina.sirova@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-10 01:25:37'),
(1166, 231, 'karolina.sirova@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-10 01:25:37'),
(1167, 232, 'matej.patocka@doctrina.cz', 1, 'rocnik3', 'matematika rozšířená', '2025-04-10 07:38:39'),
(1168, 232, 'matej.patocka@doctrina.cz', 5, 'rocnik3', 'aplikovaná fyzika', '2025-04-10 07:38:39'),
(1169, 232, 'matej.patocka@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-10 07:38:39'),
(1170, 232, 'matej.patocka@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-10 07:38:39'),
(1171, 234, 'daniel.tuma@doctrina.cz', 1, 'kvinta', 'matematika rozšířená', '2025-04-10 09:00:04'),
(1172, 234, 'daniel.tuma@doctrina.cz', 8, 'kvinta', 'IT dílna', '2025-04-10 09:00:04'),
(1173, 236, 'samuel.tuma@doctrina.cz', 7, 'septima', 'biologie člověka rozšířená', '2025-04-10 10:14:48'),
(1174, 236, 'samuel.tuma@doctrina.cz', 20, 'septima', 'Advanced English', '2025-04-10 10:14:48'),
(1175, 236, 'samuel.tuma@doctrina.cz', 21, 'septima', 'Advanced English', '2025-04-10 10:14:48'),
(1176, 236, 'samuel.tuma@doctrina.cz', 22, 'septima', 'finanční gramotnost', '2025-04-10 10:14:48'),
(1177, 233, 'vojtech.kasper@doctrina.cz', 8, 'septima', 'globální problémy', '2025-04-10 10:27:02'),
(1178, 233, 'vojtech.kasper@doctrina.cz', 20, 'septima', 'Advanced English', '2025-04-10 10:27:02'),
(1179, 233, 'vojtech.kasper@doctrina.cz', 21, 'septima', 'Advanced English', '2025-04-10 10:27:02'),
(1180, 233, 'vojtech.kasper@doctrina.cz', 23, 'septima', 'Open Education', '2025-04-10 10:27:02'),
(1181, 173, 'David.gucik@doctrina.cz', 4, 'septima', 'výtvarná tvorba', '2025-04-10 11:59:55'),
(1182, 173, 'David.gucik@doctrina.cz', 8, 'septima', 'globální problémy', '2025-04-10 11:59:55'),
(1183, 173, 'David.gucik@doctrina.cz', 11, 'septima', 'ekologie', '2025-04-10 11:59:55'),
(1184, 173, 'David.gucik@doctrina.cz', 22, 'septima', 'finanční gramotnost', '2025-04-10 11:59:55'),
(1185, 237, 'jan.vodolan@doctrina.cz', 4, 'sexta', 'výtvarná tvorba', '2025-04-10 16:05:06'),
(1186, 237, 'jan.vodolan@doctrina.cz', 6, 'sexta', 'regionální výzvy', '2025-04-10 16:05:06'),
(1187, 237, 'jan.vodolan@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-10 16:05:06'),
(1188, 237, 'jan.vodolan@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-10 16:05:06'),
(1189, 237, 'jan.vodolan@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-10 16:05:06'),
(1190, 238, 'amelie.roubickova@doctrina.cz', 6, 'sexta', 'regionální výzvy', '2025-04-10 16:32:27'),
(1191, 238, 'amelie.roubickova@doctrina.cz', 12, 'sexta', 'Advanced English', '2025-04-10 16:32:27'),
(1192, 238, 'amelie.roubickova@doctrina.cz', 13, 'sexta', 'Advanced English', '2025-04-10 16:32:27'),
(1193, 238, 'amelie.roubickova@doctrina.cz', 15, 'sexta', 'německá konverzace', '2025-04-10 16:32:27'),
(1194, 238, 'amelie.roubickova@doctrina.cz', 17, 'sexta', 'výtvarná výchova', '2025-04-10 16:32:27'),
(1195, 239, 'tereza.habelova@doctrina.cz', 1, 'oktava', 'fyzika', '2025-04-10 19:47:48'),
(1196, 239, 'tereza.habelova@doctrina.cz', 4, 'oktava', 'fyzika', '2025-04-10 19:47:48'),
(1197, 239, 'tereza.habelova@doctrina.cz', 26, 'oktava', 'chemie', '2025-04-10 19:47:48'),
(1198, 239, 'tereza.habelova@doctrina.cz', 28, 'oktava', 'chemie', '2025-04-10 19:47:48'),
(1199, 239, 'tereza.habelova@doctrina.cz', 30, 'oktava', 'biochemie', '2025-04-10 19:47:48'),
(1200, 239, 'tereza.habelova@doctrina.cz', 32, 'oktava', 'biologie', '2025-04-10 19:47:48'),
(1201, 239, 'tereza.habelova@doctrina.cz', 33, 'oktava', 'biologie', '2025-04-10 19:47:48'),
(1202, 239, 'tereza.habelova@doctrina.cz', 36, 'oktava', 'matematika základní*', '2025-04-10 19:47:49'),
(1203, 239, 'tereza.habelova@doctrina.cz', 38, 'oktava', 'matematika základní*', '2025-04-10 19:47:49'),
(1204, 239, 'tereza.habelova@doctrina.cz', 40, 'oktava', 'biologický seminář', '2025-04-10 19:47:49'),
(1205, 240, 'denis.zikmund@doctrina.cz', 1, 'sexta', 'matematika rozšířená', '2025-04-11 00:00:05'),
(1206, 240, 'denis.zikmund@doctrina.cz', 6, 'sexta', 'regionální výzvy', '2025-04-11 00:00:05'),
(1207, 240, 'denis.zikmund@doctrina.cz', 11, 'sexta', 'aplikovaná fyzika', '2025-04-11 00:00:05'),
(1208, 240, 'denis.zikmund@doctrina.cz', 15, 'sexta', 'německá konverzace', '2025-04-11 00:00:05'),
(1209, 240, 'denis.zikmund@doctrina.cz', 18, 'sexta', 'hudební výchova', '2025-04-11 00:00:05'),
(1210, 106, 'jakub.papirnik@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-11 09:51:10'),
(1212, 246, 'maxmilian.benes@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-11 09:51:31'),
(1214, 249, 'mikulas.sedlaty@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-11 09:51:49'),
(1215, 251, 'libor.lazur@doctrina.cz', 1, 'tercie', 'Německý jazyk', '2025-04-11 09:53:04'),
(1216, 252, 'lenka.kneysova@doctrina.cz', 2, 'tercie', 'Španělský jazyk', '2025-04-11 16:30:03'),
(1217, 199, 'jakub.svoboda@doctrina.cz', 3, 'rocnik3', 'historický seminář', '2025-04-13 12:18:52'),
(1218, 199, 'jakub.svoboda@doctrina.cz', 8, 'rocnik3', 'globální problémy', '2025-04-13 12:18:52'),
(1219, 199, 'jakub.svoboda@doctrina.cz', 20, 'rocnik3', 'Advanced English', '2025-04-13 12:18:52'),
(1220, 199, 'jakub.svoboda@doctrina.cz', 21, 'rocnik3', 'Advanced English', '2025-04-13 12:18:52');

-- --------------------------------------------------------

--
-- Struktura tabulky `user_choices_optional`
--

CREATE TABLE `user_choices_optional` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `subject_class` varchar(50) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `teacher` varchar(255) DEFAULT NULL,
  `hours` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `user_choices_optional`
--

INSERT INTO `user_choices_optional` (`id`, `user_id`, `user_email`, `subject_id`, `subject_class`, `subject_name`, `teacher`, `hours`, `created_at`) VALUES
(2, 10, 'test2@doctrina.cz', 2, 'rocnik2', 'Debatní klub', NULL, 1, '2025-04-02 09:01:51'),
(3, 14, 'kristyna.maslova@doctrina.cz', 1, 'rocnik2', 'Divadelní soubor STOPA', NULL, 1, '2025-04-02 09:27:47'),
(4, 27, 'pavla.krystufkova@doctrina.cz', 4, 'sexta', 'Fotografie', NULL, 1, '2025-04-02 11:22:50'),
(6, 37, 'adela.horcickova@doctrina.cz', 1, 'rocnik4', 'Divadelní soubor STOPA', NULL, 1, '2025-04-02 19:35:34'),
(7, 55, 'richard.pech@doctrina.cz', 2, 'rocnik3', 'Debatní klub', NULL, 1, '2025-04-02 20:38:05'),
(9, 67, 'alisa.skorochod@doctrina.cz', 1, 'sekunda', 'Mladí debrujáři', NULL, 1, '2025-04-03 08:54:14'),
(20, 94, 'tereza.stranska@doctrina.cz', 1, 'sexta', 'Divadelní soubor STOPA', NULL, 1, '2025-04-03 21:51:42'),
(28, 105, 'anna.koutkova@doctrina.cz', 2, 'septima', 'Debatní klub', NULL, 1, '2025-04-04 15:49:08'),
(29, 105, 'anna.koutkova@doctrina.cz', 4, 'septima', 'Fotografie', NULL, 1, '2025-04-04 15:49:08'),
(30, 109, 'eliska.matyasova@doctrina.cz', 1, 'rocnik3', 'Divadelní soubor STOPA', NULL, 1, '2025-04-04 16:57:12'),
(31, 109, 'eliska.matyasova@doctrina.cz', 4, 'rocnik3', 'Fotografie', NULL, 1, '2025-04-04 16:57:12'),
(32, 103, 'veronika.halirova@doctrina.cz', 1, 'rocnik2', 'Divadelní soubor STOPA', NULL, 1, '2025-04-04 18:41:23'),
(33, 123, 'karolina.turcikova@doctrina.cz', 1, 'sekunda', 'Mladí debrujáři', NULL, 1, '2025-04-06 09:51:01'),
(35, 130, 'adam.handrk@doctrina.cz', 1, 'sekunda', 'Mladí debrujáři', NULL, 1, '2025-04-06 17:42:41'),
(64, 132, 'killichova.j@doctrina.cz', 2, 'sekunda', 'Dramatická výchova', NULL, 1, '2025-04-06 18:33:21'),
(66, 136, 'andrea.pospisilova@doctrina.cz', 1, 'kvinta', 'Divadelní soubor', NULL, 1, '2025-04-06 20:00:43'),
(74, 76, 'marie.denkova@doctrina.cz', 2, 'tercie', 'Dramatická výchova', NULL, 1, '2025-04-07 08:52:36'),
(75, 77, 'lukas.dusek2@doctrina.cz', 3, 'tercie', 'Konverzace ve španělském jazyce', NULL, 1, '2025-04-07 08:53:10'),
(76, 143, 'stepanka.killichova@doctrina.cz', 2, 'sekunda', 'Dramatická výchova', NULL, 1, '2025-04-07 10:52:16'),
(77, 145, 'katerina.kajzarova@doctrina.cz', 2, 'sekunda', 'Dramatická výchova', NULL, 1, '2025-04-07 10:56:26'),
(78, 148, 'johana.rechtackova@doctrina.cz', 2, 'sekunda', 'Dramatická výchova', NULL, 1, '2025-04-07 14:23:03'),
(79, 91, 'zizka@doctrina.cz', 1, 'sexta', 'Divadelní soubor STOPA', NULL, 1, '2025-04-07 15:17:29'),
(80, 91, 'zizka@doctrina.cz', 2, 'sexta', 'Debatní klub', NULL, 1, '2025-04-07 15:17:29'),
(82, 78, 'klara.baudysova@doctrina.cz', 2, 'tercie', 'Dramatická výchova', NULL, 1, '2025-04-07 19:37:23'),
(83, 74, 'adela.rasochova@doctrina.cz', 2, 'tercie', 'Dramatická výchova', NULL, 1, '2025-04-08 07:38:37'),
(85, 161, 'marketa.kunaskova@doctrina.cz', 2, 'kvarta', 'Dramatická výchova', NULL, 1, '2025-04-08 10:15:52'),
(86, 161, 'marketa.kunaskova@doctrina.cz', 3, 'kvarta', 'Konverzace ve španělském jazyce', NULL, 1, '2025-04-08 10:15:52'),
(87, 167, 'adriena.michalkova@doctrina.cz', 1, 'rocnik4', 'Divadelní soubor STOPA', NULL, 1, '2025-04-08 16:39:56'),
(88, 175, 'amalie.vobornikova@doctrina.cz', 3, 'kvarta', 'Konverzace ve španělském jazyce', NULL, 1, '2025-04-08 16:51:26'),
(89, 177, 'madeleine.fricova@doctrina.cz', 1, 'sexta', 'Divadelní soubor STOPA', NULL, 1, '2025-04-08 17:06:33'),
(90, 43, 'tereza.storkova@doctrina.cz', 3, 'rocnik4', 'Konverzace ve španělském jazyce', NULL, 1, '2025-04-08 21:15:57'),
(93, 41, 'adam.farek@doctrina.cz', 1, 'kvinta', 'Divadelní soubor', NULL, 1, '2025-04-08 22:14:43'),
(94, 41, 'adam.farek@doctrina.cz', 4, 'kvinta', 'Fotografie', NULL, 1, '2025-04-08 22:14:43'),
(95, 192, 'zuzana.kajzarova@doctrina.cz', 2, 'kvarta', 'Dramatická výchova', NULL, 1, '2025-04-09 08:24:56'),
(96, 120, 'matous.papirnik@doctrina.cz', 1, 'rocnik4', 'Divadelní soubor STOPA', NULL, 1, '2025-04-09 08:56:52'),
(97, 194, 'frantisek.vanek@doctrina.cz', 4, 'septima', 'Fotografie', NULL, 1, '2025-04-09 10:12:18'),
(98, 98, 'vaclav.vokurka@doctrina.cz', 2, 'kvinta', 'Debatní klub', NULL, 1, '2025-04-09 10:52:06'),
(100, 197, 'elias.redl@doctrina.cz', 3, 'kvarta', 'Konverzace ve španělském jazyce', NULL, 1, '2025-04-09 10:59:49'),
(102, 198, 'petr.severa@doctrina.cz', 2, 'rocnik3', 'Debatní klub', NULL, 1, '2025-04-09 11:39:48'),
(103, 203, 'michaela.soldatova@doctrina.cz', 1, 'rocnik3', 'Divadelní soubor STOPA', NULL, 1, '2025-04-09 12:59:22'),
(104, 203, 'michaela.soldatova@doctrina.cz', 2, 'rocnik3', 'Debatní klub', NULL, 1, '2025-04-09 12:59:22'),
(105, 204, 'stepan.masik@doctrina.cz', 2, 'rocnik3', 'Debatní klub', NULL, 1, '2025-04-09 13:29:35'),
(106, 205, 'stepanka.bacova@doctrina.cz', 1, 'rocnik3', 'Divadelní soubor STOPA', NULL, 1, '2025-04-09 15:45:15'),
(107, 191, 'vojtech.moravek@doctrina.cz', 1, 'tercie', 'Mladí debrujáři', NULL, 1, '2025-04-09 16:17:54'),
(108, 191, 'vojtech.moravek@doctrina.cz', 3, 'tercie', 'Konverzace ve španělském jazyce', NULL, 1, '2025-04-09 16:17:54'),
(109, 118, 'jan.litvan@doctrina.cz', 2, 'oktava', 'Debatní klub', NULL, 1, '2025-04-09 18:29:48'),
(110, 216, 'jiri.kosek@doctrina.cz', 2, 'rocnik3', 'Debatní klub', NULL, 1, '2025-04-09 18:49:11'),
(113, 149, 'petr.kasak@doctrina.cz', 2, 'rocnik4', 'Debatní klub', NULL, 1, '2025-04-09 20:07:51'),
(114, 220, 'David.Trpisovsky@doctrina.cz', 1, 'sexta', 'Divadelní soubor STOPA', NULL, 1, '2025-04-09 20:52:50'),
(115, 223, 'julie.horatschkeova@doctrina.cz', 4, 'septima', 'Fotografie', NULL, 1, '2025-04-09 21:06:53'),
(116, 225, 'patrik.steiner@doctrina.cz', 1, 'sexta', 'Divadelní soubor STOPA', NULL, 1, '2025-04-09 22:20:41'),
(117, 230, 'katerina.pelantova@doctrina.cz', 2, 'oktava', 'Debatní klub', NULL, 1, '2025-04-09 23:27:45'),
(118, 230, 'katerina.pelantova@doctrina.cz', 3, 'oktava', 'Konverzace ve španělském jazyce', NULL, 1, '2025-04-09 23:27:45'),
(120, 231, 'karolina.sirova@doctrina.cz', 1, 'sexta', 'Divadelní soubor STOPA', NULL, 1, '2025-04-10 01:25:37'),
(121, 235, 'mikulas.meduna@doctrina.cz', 2, 'sekunda', 'Dramatická výchova', NULL, 1, '2025-04-10 09:43:22'),
(122, 238, 'amelie.roubickova@doctrina.cz', 4, 'sexta', 'Fotografie', NULL, 1, '2025-04-10 16:32:27'),
(123, 240, 'denis.zikmund@doctrina.cz', 4, 'sexta', 'Fotografie', NULL, 1, '2025-04-11 00:00:05'),
(124, 106, 'jakub.papirnik@doctrina.cz', 3, 'tercie', 'Konverzace ve španělském jazyce', NULL, 1, '2025-04-11 09:51:11'),
(125, 245, 'eliska.poekova@doctrina.cz', 2, 'kvarta', 'Dramatická výchova', NULL, 1, '2025-04-11 09:51:19'),
(126, 244, 'stepan.knezu@doctrina.cz', 3, 'kvarta', 'Konverzace ve španělském jazyce', NULL, 1, '2025-04-11 09:52:24');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `subjects_kvarta_optional`
--
ALTER TABLE `subjects_kvarta_optional`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_kvinta`
--
ALTER TABLE `subjects_kvinta`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_kvinta_optional`
--
ALTER TABLE `subjects_kvinta_optional`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_oktava_optional`
--
ALTER TABLE `subjects_oktava_optional`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_prima_optional`
--
ALTER TABLE `subjects_prima_optional`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_rocnik1`
--
ALTER TABLE `subjects_rocnik1`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_rocnik1_optional`
--
ALTER TABLE `subjects_rocnik1_optional`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_rocnik2`
--
ALTER TABLE `subjects_rocnik2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `row_number` (`table_row_number`,`category`);

--
-- Indexy pro tabulku `subjects_rocnik2_optional`
--
ALTER TABLE `subjects_rocnik2_optional`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_rocnik3`
--
ALTER TABLE `subjects_rocnik3`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_rocnik3_optional`
--
ALTER TABLE `subjects_rocnik3_optional`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_rocnik4_optional`
--
ALTER TABLE `subjects_rocnik4_optional`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_sekunda_optional`
--
ALTER TABLE `subjects_sekunda_optional`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_septima`
--
ALTER TABLE `subjects_septima`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_septima_optional`
--
ALTER TABLE `subjects_septima_optional`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_sexta`
--
ALTER TABLE `subjects_sexta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `row_number` (`table_row_number`,`category`);

--
-- Indexy pro tabulku `subjects_sexta_optional`
--
ALTER TABLE `subjects_sexta_optional`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_tercie`
--
ALTER TABLE `subjects_tercie`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_tercie_optional`
--
ALTER TABLE `subjects_tercie_optional`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexy pro tabulku `user_choices`
--
ALTER TABLE `user_choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pro tabulku `user_choices_optional`
--
ALTER TABLE `user_choices_optional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `subjects_kvarta_optional`
--
ALTER TABLE `subjects_kvarta_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `subjects_kvinta`
--
ALTER TABLE `subjects_kvinta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pro tabulku `subjects_kvinta_optional`
--
ALTER TABLE `subjects_kvinta_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `subjects_oktava_optional`
--
ALTER TABLE `subjects_oktava_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `subjects_prima_optional`
--
ALTER TABLE `subjects_prima_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `subjects_rocnik1`
--
ALTER TABLE `subjects_rocnik1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pro tabulku `subjects_rocnik1_optional`
--
ALTER TABLE `subjects_rocnik1_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `subjects_rocnik2`
--
ALTER TABLE `subjects_rocnik2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pro tabulku `subjects_rocnik2_optional`
--
ALTER TABLE `subjects_rocnik2_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `subjects_rocnik3`
--
ALTER TABLE `subjects_rocnik3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pro tabulku `subjects_rocnik3_optional`
--
ALTER TABLE `subjects_rocnik3_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `subjects_rocnik4_optional`
--
ALTER TABLE `subjects_rocnik4_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `subjects_sekunda_optional`
--
ALTER TABLE `subjects_sekunda_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `subjects_septima`
--
ALTER TABLE `subjects_septima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pro tabulku `subjects_septima_optional`
--
ALTER TABLE `subjects_septima_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `subjects_sexta`
--
ALTER TABLE `subjects_sexta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pro tabulku `subjects_sexta_optional`
--
ALTER TABLE `subjects_sexta_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `subjects_tercie`
--
ALTER TABLE `subjects_tercie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `subjects_tercie_optional`
--
ALTER TABLE `subjects_tercie_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT pro tabulku `user_choices`
--
ALTER TABLE `user_choices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1221;

--
-- AUTO_INCREMENT pro tabulku `user_choices_optional`
--
ALTER TABLE `user_choices_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `user_choices`
--
ALTER TABLE `user_choices`
  ADD CONSTRAINT `user_choices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `user_choices_optional`
--
ALTER TABLE `user_choices_optional`
  ADD CONSTRAINT `user_choices_optional_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
