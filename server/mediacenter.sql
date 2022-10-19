-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 19 oct. 2022 à 01:58
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
-- Base de données : `mediacenter`
--

-- --------------------------------------------------------

--
-- Structure de la table `Borrow`
--

CREATE TABLE `Borrow` (
  `idBorrow` int(11) NOT NULL,
  `borrower` varchar(10) NOT NULL,
  `borrowing` varchar(10) NOT NULL,
  `idMedia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `category`, `title`, `author`, `owner`, `rate`) VALUES
(1, 'games', 'Hijack That Went South, The (Kaappari)', 'Annotés', 'kdeak', 2),
(3, 'book', 'India: Matri Bhumi', 'Rébecca', 'msuche3', 0),
(4, 'DVD', 'I Married a Monster from Outer Space', 'Gwenaëlle', 'msuche3', 0),
(5, 'book', 'Cabinet of Dr. Caligari, The (Cabinet des Dr. Caligari., Das)', 'Desirée', 'ggard5', 2),
(6, 'DVD', 'View to a Kill, A', 'Rébecca', 'kdeakan0', 3),
(7, 'games', 'Taqwacore: The Birth of Punk Islam', 'Méryl', 'ggard5', 4),
(8, 'games', 'Cove, The', 'Illustrée', 'ggard5', 4),
(9, 'book', 'Dark Circles ', 'Geneviève', 'msuche3', 3),
(10, 'games', 'True Heart', 'Océanne', 'ZERO', 1),
(11, 'DVD', 'Brain Donors', 'Léane', 'kdeakan0', 2),
(12, 'games', 'Jakob the Liar', 'Clémence', 'kdeak', 1),
(13, 'DVD', 'Ten Inch Hero', 'Laurélie', 'kdeakan0', 3),
(14, 'DVD', 'The 11 Commandments', 'Marylène', 'aspe', 3),
(15, 'DVD', 'MURDER and murder', 'Mélia', 'aspe', 4),
(16, 'games', 'Please Give', 'Mélodie', 'aspe', 0),
(17, 'DVD', 'Beyond the Door II (Schock) (Shock) (Suspense)', 'Eliès', 'kdeakan0', 1),
(18, 'games', 'OH in Ohio, The', 'Bérengère', 'msuche3', 2),
(19, 'games', 'Road to Perdition', 'Maïté', 'kdeak', 2),
(20, 'DVD', 'Diary of a Chambermaid, The', 'Dù', 'ZERO', 1),
(21, 'DVD', 'Hercules', 'Géraldine', 'aspe', 0),
(22, 'DVD', 'You Can\'t Win \'Em All', 'Mà', 'ggard5', 0),
(23, 'DVD', 'Witches, The (aka Devil\'s Own, The)', 'Loïc', 'kdeakan0', 1),
(24, 'games', 'Bewitched', 'Amélie', 'ZERO', 3),
(25, 'book', 'Starcrash (a.k.a. Star Crash)', 'Angèle', 'ggard5', 0),
(26, 'DVD', 'Secret Life of Walter Mitty, The', 'Maïlis', 'ggard5', 4),
(27, 'games', 'Southern Comfort', 'Méng', 'aspe', 0),
(28, 'games', 'Funeral, The', 'Björn', 'aspe', 1),
(29, 'games', 'Headless Body in Topless Bar', 'Pénélope', 'kdeakan0', 0),
(30, 'DVD', 'How to Rob a Bank', 'Loïs', 'ggard5', 0),
(31, 'DVD', 'Poseidon', 'Eléonore', 'kdeakan0', 2),
(32, 'DVD', 'Blind Fury', 'Lorène', 'kdeak', 0),
(33, 'DVD', 'Possession', 'Séréna', 'msuche3', 1),
(34, 'DVD', 'Juice', 'Aimée', 'kdeakan0', 3),
(35, 'book', 'Move Over, Darling', 'Desirée', 'msuche3', 2),
(36, 'book', 'Split Second', 'Océane', 'kdeakan0', 4),
(37, 'book', 'Jim Gaffigan: Obsessed', 'Nélie', 'msuche3', 4),
(38, 'games', 'Pohjanmaa', 'Céline', 'kdeakan0', 2),
(39, 'DVD', 'Jewel of the Nile, The', 'Marie-ève', 'kdeakan0', 2),
(40, 'games', 'Ride Lonesome', 'Yáo', 'ZERO', 2),
(41, 'book', 'Eyewitness (Janitor, The)', 'Naëlle', 'kdeak', 1),
(42, 'DVD', 'Act Da Fool', 'Yè', 'ZERO', 4),
(43, 'games', 'Conversation with Gregory Peck, A', 'Judicaël', 'kdeakan0', 3),
(44, 'book', 'Upstream Color', 'Lóng', 'kdeakan0', 1),
(45, 'DVD', 'Story of Science, The', 'Léonie', 'msuche3', 1),
(46, 'games', 'Brideshead Revisited', 'Laurène', 'ggard5', 2),
(47, 'DVD', 'Sand Sharks', 'Bérénice', 'msuche3', 3),
(48, 'book', 'Corrina, Corrina', 'Audréanne', 'ZERO', 4),
(49, 'DVD', 'Belizaire the Cajun', 'Chloé', 'kdeak', 2),
(50, 'book', 'Magic Mike', 'Loïca', 'aspe', 3);

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
-- Index pour la table `Borrow`
--
ALTER TABLE `Borrow`
  ADD PRIMARY KEY (`idBorrow`),
  ADD KEY `borrower` (`borrower`),
  ADD KEY `borrowing` (`borrowing`),
  ADD KEY `idMedia` (`idMedia`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`pseudo`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Borrow`
--
ALTER TABLE `Borrow`
  MODIFY `idBorrow` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Borrow`
--
ALTER TABLE `Borrow`
  ADD CONSTRAINT `Borrow_ibfk_1` FOREIGN KEY (`borrower`) REFERENCES `users` (`pseudo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Borrow_ibfk_2` FOREIGN KEY (`borrowing`) REFERENCES `users` (`pseudo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Borrow_ibfk_3` FOREIGN KEY (`idMedia`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `users` (`pseudo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
