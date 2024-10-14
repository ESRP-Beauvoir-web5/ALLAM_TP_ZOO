-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 14 oct. 2024 à 12:01
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `zoo`
--

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

DROP TABLE IF EXISTS `animaux`;
CREATE TABLE IF NOT EXISTS `animaux` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` int NOT NULL,
  `tatouage` int NOT NULL,
  `signe` int NOT NULL,
  `id_regim_alim` int NOT NULL,
  `id_especes` int NOT NULL,
  `id_enclos` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_regim` (`id_regim_alim`),
  KEY `id_espece` (`id_especes`),
  KEY `id_enclos` (`id_enclos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `tel` char(12) COLLATE utf8mb4_general_ci NOT NULL,
  `poste` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enclos`
--

DROP TABLE IF EXISTS `enclos`;
CREATE TABLE IF NOT EXISTS `enclos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emplacement` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `num_enclos` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `superficie` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `id_employe` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_employe` (`id_employe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `especes`
--

DROP TABLE IF EXISTS `especes`;
CREATE TABLE IF NOT EXISTS `especes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_commun` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `nom_scient` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `origine` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `regime_alim`
--

DROP TABLE IF EXISTS `regime_alim`;
CREATE TABLE IF NOT EXISTS `regime_alim` (
  `id` int NOT NULL AUTO_INCREMENT,
  `composition` int NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

DROP TABLE IF EXISTS `traitement`;
CREATE TABLE IF NOT EXISTS `traitement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medicaments` text COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `traitement_animaux`
--

DROP TABLE IF EXISTS `traitement_animaux`;
CREATE TABLE IF NOT EXISTS `traitement_animaux` (
  `id_animaux` int NOT NULL,
  `id_traitement` int NOT NULL,
  KEY `id_traitement` (`id_traitement`),
  KEY `id_animaux` (`id_animaux`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD CONSTRAINT `id_enclos` FOREIGN KEY (`id_enclos`) REFERENCES `enclos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_espece` FOREIGN KEY (`id_especes`) REFERENCES `especes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_regim` FOREIGN KEY (`id_regim_alim`) REFERENCES `regime_alim` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `enclos`
--
ALTER TABLE `enclos`
  ADD CONSTRAINT `id_employe` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `traitement_animaux`
--
ALTER TABLE `traitement_animaux`
  ADD CONSTRAINT `id_animaux` FOREIGN KEY (`id_animaux`) REFERENCES `animaux` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_traitement` FOREIGN KEY (`id_traitement`) REFERENCES `traitement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
