-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 19 oct. 2022 à 19:30
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Création de la base de données `mediacenter`
--

DROP DATABASE IF EXISTS `mediacenter`; 
CREATE DATABASE `mediacenter`;
USE `mediacenter`;

-- --------------------------------------------------------


--
-- Base de données : `mediacenter`
--

-- --------------------------------------------------------

--
-- Structure de la table `borrow`
--

CREATE TABLE `borrow` (
  `idBorrow` int(11) NOT NULL,
  `borrower` varchar(10) NOT NULL,
  `idMedia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `borrow`
--

INSERT INTO `borrow` (`idBorrow`, `borrower`, `idMedia`) VALUES
(1, 'kdeakan0', 32),
(2, 'ZERO', 15),
(3, 'kdeakan0', 24),
(4, 'aman2', 22),
(5, 'aspen7', 25),
(6, 'ZERO', 27),
(7, 'ggard5', 12),
(8, 'aspen7', 27),
(9, 'ggard5', 16),
(10, 'ZERO', 26),
(11, 'ggard5', 20),
(12, 'msuche3', 42),
(13, 'ZERO', 20),
(14, 'aspen7', 8),
(15, 'aspen7', 41),
(16, 'ggard5', 31),
(17, 'aman2', 29),
(18, 'aspen7', 7),
(19, 'msuche3', 15),
(20, 'kdeakan0', 32),
(21, 'aspen7', 48),
(22, 'kdeakan0', 5),
(23, 'ZERO', 10),
(24, 'ZERO', 7),
(25, 'aman2', 13),
(26, 'ggard5', 32),
(27, 'ggard5', 23),
(28, 'msuche3', 17),
(29, 'aspen7', 39),
(30, 'ZERO', 9),
(31, 'kdeakan0', 15),
(32, 'aman2', 21),
(33, 'msuche3', 8),
(34, 'aspen7', 50),
(35, 'kdeakan0', 22),
(36, 'kdeakan0', 3),
(37, 'ZERO', 46),
(38, 'msuche3', 23),
(39, 'ZERO', 4),
(40, 'msuche3', 5),
(41, 'kdeakan0', 36),
(43, 'aman2', 27),
(44, 'aman2', 33),
(45, 'msuche3', 12),
(46, 'ggard5', 21),
(47, 'ggard5', 36),
(48, 'aspen7', 26),
(49, 'aman2', 32),
(50, 'ggard5', 10);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `category` varchar(10) NOT NULL,
  `title` text NOT NULL,
  `author` varchar(20) NOT NULL,
  `owner` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `category`, `title`, `author`, `owner`, `city`, `rate`) VALUES
(1, 'games', 'Hijack That Went South, The (Kaappari)', 'Annotés', 'kdeak', 'Paris', 2),
(3, 'book', 'India: Matri Bhumi', 'Rébecca', 'msuche3', 'Cachan', 0),
(4, 'DVD', 'I Married a Monster from Outer Space', 'Gwenaëlle', 'msuche3', 'Lyon', 0),
(5, 'book', 'Cabinet of Dr. Caligari, The (Cabinet des Dr. Caligari., Das)', 'Desirée', 'ggard5', 'New York', 2),
(6, 'DVD', 'View to a Kill, A', 'Rébecca', 'kdeakan0', 'Douala', 3),
(7, 'games', 'Taqwacore: The Birth of Punk Islam', 'Méryl', 'ggard5', 'Yaoundé', 4),
(8, 'games', 'Cove, The', 'Illustrée', 'ggard5', 'Bandjoun', 4),
(9, 'book', 'Dark Circles ', 'Geneviève', 'msuche3', 'Geneve', 3),
(10, 'games', 'True Heart', 'Océanne', 'ZERO', 'San Juan', 1),
(11, 'DVD', 'Brain Donors', 'Léane', 'kdeakan0', 'Rouen', 2),
(12, 'games', 'Jakob the Liar', 'Clémence', 'kdeak', 'Kamenskiy', 1),
(13, 'DVD', 'Ten Inch Hero', 'Laurélie', 'kdeakan0', 'Creteil', 3),
(14, 'DVD', 'The 11 Commandments', 'Marylène', 'aspe', 'Nora', 3),
(15, 'DVD', 'MURDER and murder', 'Mélia', 'aspe', 'Koh Tao', 4),
(16, 'games', 'Please Give', 'Mélodie', 'aspe', 'Paris', 0),
(17, 'DVD', 'Beyond the Door II (Schock) (Shock) (Suspense)', 'Eliès', 'kdeakan0', 'Paris', 1),
(18, 'games', 'OH in Ohio, The', 'Bérengère', 'msuche3', 'Paris', 2),
(19, 'games', 'Road to Perdition', 'Maïté', 'kdeak', 'Sofia', 2),
(20, 'DVD', 'Diary of a Chambermaid, The', 'Dù', 'ZERO', 'Paris', 1),
(21, 'DVD', 'Hercules', 'Géraldine', 'aspe', 'Paris', 0),
(22, 'DVD', 'You Can\'t Win \'Em All', 'Mà', 'ggard5', 'Paris', 0),
(23, 'DVD', 'Witches, The (aka Devil\'s Own, The)', 'Loïc', 'kdeakan0', 'Paris', 1),
(24, 'games', 'Bewitched', 'Amélie', 'ZERO', 'Paris', 3),
(25, 'book', 'Starcrash (a.k.a. Star Crash)', 'Angèle', 'ggard5', 'Paris', 0),
(26, 'DVD', 'Secret Life of Walter Mitty, The', 'Maïlis', 'ggard5', 'Paris', 4),
(27, 'games', 'Southern Comfort', 'Méng', 'aspe', 'Paris', 0),
(28, 'games', 'Funeral, The', 'Björn', 'aspe', 'Paris', 1),
(29, 'games', 'Headless Body in Topless Bar', 'Pénélope', 'kdeakan0', 'Paris', 0),
(30, 'DVD', 'How to Rob a Bank', 'Loïs', 'ggard5', 'Paris', 0),
(31, 'DVD', 'Poseidon', 'Eléonore', 'kdeakan0', 'Cotonou', 2),
(32, 'DVD', 'Blind Fury', 'Lorène', 'kdeak', 'Porto novo', 0),
(33, 'DVD', 'Possession', 'Séréna', 'msuche3', 'Rio', 1),
(34, 'DVD', 'Juice', 'Aimée', 'kdeakan0', 'Antananarivo', 3),
(35, 'book', 'Move Over, Darling', 'Desirée', 'msuche3', 'Paris', 2),
(36, 'book', 'Split Second', 'Océane', 'kdeakan0', 'Paris', 4),
(37, 'book', 'Jim Gaffigan: Obsessed', 'Nélie', 'msuche3', 'Paris', 4),
(38, 'games', 'Pohjanmaa', 'Céline', 'kdeakan0', 'Tokyo', 2),
(39, 'DVD', 'Jewel of the Nile, The', 'Marie-ève', 'kdeakan0', 'San Antonio', 2),
(40, 'games', 'Ride Lonesome', 'Yáo', 'ZERO', 'Genting', 2),
(41, 'book', 'Eyewitness (Janitor, The)', 'Naëlle', 'kdeak', 'Woippy', 1),
(42, 'DVD', 'Act Da Fool', 'Yè', 'ZERO', 'Paris', 4),
(43, 'games', 'Conversation with Gregory Peck, A', 'Judicaël', 'kdeakan0', 'Paris', 3),
(44, 'book', 'Upstream Color', 'Lóng', 'kdeakan0', 'Paris', 1),
(45, 'DVD', 'Story of Science, The', 'Léonie', 'msuche3', 'Paris', 1),
(46, 'games', 'Brideshead Revisited', 'Laurène', 'ggard5', 'Paris', 2),
(47, 'DVD', 'Sand Sharks', 'Bérénice', 'msuche3', 'Argir', 3),
(48, 'book', 'Corrina, Corrina', 'Audréanne', 'ZERO', 'Lille', 4),
(49, 'DVD', 'Belizaire the Cajun', 'Chloé', 'kdeak', 'Bruxelles', 2),
(50, 'book', 'Magic Mike', 'Loïca', 'aspe', 'Mons', 3);

-- --------------------------------------------------------

--
-- Structure de la table `recommendation`
--

CREATE TABLE `recommendation` (
  `idRecommendation` int(11) NOT NULL,
  `recommender` varchar(10) NOT NULL,
  `idMedia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `recommendation`
--

INSERT INTO `recommendation` (`idRecommendation`, `recommender`, `idMedia`) VALUES
(1, 'msuche3', 27),
(2, 'aman2', 4),
(3, 'kdeakan0', 24),
(4, 'aman2', 44),
(5, 'kdeakan0', 26),
(6, 'aspen7', 29),
(7, 'aspen7', 18),
(8, 'aspen7', 27),
(9, 'aspen7', 5),
(10, 'kdeakan0', 32),
(11, 'msuche3', 45),
(12, 'msuche3', 49),
(13, 'ggard5', 10),
(14, 'ZERO', 34),
(15, 'aman2', 3),
(16, 'kdeakan0', 13),
(17, 'kdeakan0', 17),
(18, 'kdeakan0', 43),
(19, 'msuche3', 31),
(20, 'ZERO', 35),
(21, 'aspen7', 13),
(22, 'aspen7', 36),
(23, 'ZERO', 29),
(24, 'ZERO', 38),
(25, 'msuche3', 11),
(26, 'msuche3', 29),
(27, 'kdeakan0', 8),
(28, 'ZERO', 27),
(29, 'aman2', 29),
(30, 'kdeakan0', 42),
(31, 'msuche3', 17),
(32, 'aman2', 38),
(33, 'ZERO', 48),
(34, 'kdeakan0', 14),
(35, 'ggard5', 10),
(36, 'msuche3', 3),
(37, 'aman2', 25),
(38, 'kdeakan0', 35),
(39, 'kdeakan0', 30),
(40, 'ggard5', 3),
(41, 'aman2', 22),
(42, 'ZERO', 1),
(43, 'aspen7', 28),
(44, 'ggard5', 33),
(45, 'aspen7', 35),
(46, 'ggard5', 1),
(47, 'ZERO', 41),
(48, 'msuche3', 11),
(49, 'ZERO', 23),
(50, 'aman2', 34);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `pseudo` varchar(10) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`pseudo`, `firstname`, `lastname`, `password`) VALUES
('aman2', 'Ari', 'McAllan', 'mkqSn7W8hvh'),
('asap', 'Andeee', 'Spendley', 'Spendley'),
('aspe', 'Andeee', 'Spendley', 'Spendley'),
('aspen7', 'Andeee', 'Spendley', 'hcx4loqjEMmZ'),
('ggard5', 'Kip', 'Jaggard', '7fFJFWufb'),
('jly6', 'Janella', 'Dayly', 'FnUxwleFb4U'),
('kdeak', 'Kellen', 'Deakan', '5eFvJNG'),
('kdeakan0', 'Kellen', 'Deakan', '5eFvJNG'),
('msuche3', 'Maddy', 'Suche', 'JE1VNt'),
('tland4', 'Sunny', 'Gatland', 'Rt6QqO'),
('ZERO', 'KESSEL', 'FOZEU', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`idBorrow`),
  ADD KEY `borrower` (`borrower`),
  ADD KEY `idMedia` (`idMedia`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`);

--
-- Index pour la table `recommendation`
--
ALTER TABLE `recommendation`
  ADD PRIMARY KEY (`idRecommendation`),
  ADD KEY `idMedia` (`idMedia`),
  ADD KEY `recommender` (`recommender`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`pseudo`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `idBorrow` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `recommendation`
--
ALTER TABLE `recommendation`
  MODIFY `idRecommendation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`borrower`) REFERENCES `users` (`pseudo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`idMedia`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `users` (`pseudo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `recommendation`
--
ALTER TABLE `recommendation`
  ADD CONSTRAINT `recommendation_ibfk_1` FOREIGN KEY (`idMedia`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recommendation_ibfk_2` FOREIGN KEY (`recommender`) REFERENCES `users` (`pseudo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
