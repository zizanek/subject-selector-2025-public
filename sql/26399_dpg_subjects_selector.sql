-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Stř 02. dub 2025, 00:44
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
-- Databáze: `26399_dpg_subjects_selector`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pro tabulku `user_choices`
--
ALTER TABLE `user_choices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pro tabulku `user_choices_optional`
--
ALTER TABLE `user_choices_optional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
