-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2026 at 05:38 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion_absences`
--

-- --------------------------------------------------------

--
-- Table structure for table `absences`
--

CREATE TABLE `absences` (
  `idAbsence` int(11) NOT NULL,
  `dateAbsence` date NOT NULL,
  `statut` enum('Présent','Absent') NOT NULL,
  `idEtudiant` int(11) DEFAULT NULL,
  `idModule` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `absences`
--

INSERT INTO `absences` (`idAbsence`, `dateAbsence`, `statut`, `idEtudiant`, `idModule`) VALUES
(1, '2026-01-10', 'Absent', 1, 1),
(2, '2026-01-10', 'Présent', 2, 1),
(3, '2026-01-15', 'Absent', 3, 2),
(4, '2026-01-15', 'Présent', 4, 2),
(5, '2026-02-01', 'Absent', 5, 3),
(6, '2026-02-03', 'Absent', 6, 4),
(7, '2026-02-05', 'Présent', 1, 5),
(8, '2026-02-06', 'Absent', 2, 6),
(9, '2026-02-08', 'Absent', 3, 1),
(10, '2026-02-10', 'Présent', 4, 3),
(11, '2026-02-12', 'Absent', 5, 2),
(12, '2026-02-15', 'Absent', 6, 5),
(13, '2026-02-10', 'Présent', 1, 6),
(14, '2026-02-10', 'Absent', 2, 6),
(15, '2026-02-10', 'Présent', 3, 6),
(16, '2026-02-10', 'Présent', 4, 6),
(17, '2026-02-10', 'Absent', 5, 6),
(18, '2026-02-10', 'Présent', 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `administrateurs`
--

CREATE TABLE `administrateurs` (
  `idAdmin` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `motDePasse` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrateurs`
--

INSERT INTO `administrateurs` (`idAdmin`, `nom`, `email`, `motDePasse`) VALUES
(1, 'Admin Principal', 'admin@univ.dz', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `enseignants`
--

CREATE TABLE `enseignants` (
  `idEnseignant` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `motDePasse` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enseignants`
--

INSERT INTO `enseignants` (`idEnseignant`, `nom`, `prenom`, `email`, `motDePasse`) VALUES
(1, 'Rahmani', 'Ahmed', 'ahmed.rahmani@mail.com', 'Ahmed2024'),
(2, 'Bensalem', 'Nadia', 'nadia.bensalem@mail.com', 'Nadia2024'),
(3, 'Touati', 'Samir', 'samir.touati@mail.com', 'Samir2024'),
(4, 'Bendana', 'Roukia', 'roukia.bendana@univ.dz', 'Roukia1981'),
(5, 'Remmiche', 'Farid', 'farid.remmiche@univ.dz', 'Farid2231'),
(6, 'Kasri', 'Soumia', 'soumia.kasri@univ.dz', 'Soumia15'),
(7, 'Seghiri', 'Nabil', 'nabil.seghiri@univ.dz', 'Nabil202'),
(8, 'Bourmal', 'Hakim', 'hakim.bourmal@univ.dz', 'Hakim222'),
(9, 'Mansoul', 'Karim', 'karim.mansoul@univ.dz', 'Karim456');

-- --------------------------------------------------------

--
-- Table structure for table `etudiants`
--

CREATE TABLE `etudiants` (
  `idEtudiant` int(20) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `motDePasse` varchar(255) NOT NULL,
  `groupe` varchar(20) NOT NULL,
  `niveau` varchar(20) NOT NULL,
  `specialite` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `etudiants`
--

INSERT INTO `etudiants` (`idEtudiant`, `nom`, `prenom`, `email`, `motDePasse`, `groupe`, `niveau`, `specialite`) VALUES
(1, 'Louahem', 'Amna', 'amna@mail.com', '15678321', 'G1', 'L3', 'Informatique'),
(2, 'Benali', 'Sara', 'sara@mail.com', 'sara2135', 'G2', 'L2', 'Mathématique'),
(3, 'Merabet', 'Yacine', 'yacine@mail.com', '59076421', 'G2', 'L2', 'Mathématique'),
(4, 'bouchriha', 'farah', 'farah@mail.com', 'farah345', 'G1', 'L3', 'Informatique'),
(5, 'Haddad', 'karim', 'karim@mail.com', 'karim000', 'G2', 'L3', 'Informatique'),
(6, ' Bouchareb', 'Lina', 'lina@mail.com', '34788856', 'G2', 'L3', 'Informatique');

-- --------------------------------------------------------

--
-- Table structure for table `groupes`
--

CREATE TABLE `groupes` (
  `idGroupe` int(11) NOT NULL,
  `nomGroupe` varchar(50) NOT NULL,
  `specialite` varchar(100) NOT NULL,
  `idEnseignant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groupes`
--

INSERT INTO `groupes` (`idGroupe`, `nomGroupe`, `specialite`, `idEnseignant`) VALUES
(1, 'G1', 'Informatique', 1),
(2, 'G2', 'Mathématiques', 2),
(3, 'G1', 'Informatique', 1),
(4, 'G2', 'Mathématiques', 2),
(5, 'G3', 'Informatique', 1),
(6, 'G4', 'Physique', 3),
(7, 'G5', 'Mathématiques', 2);

-- --------------------------------------------------------

--
-- Table structure for table `justifications`
--

CREATE TABLE `justifications` (
  `idJustification` int(11) NOT NULL,
  `dateAbsence` date NOT NULL,
  `motif` varchar(255) NOT NULL,
  `fichier` varchar(255) NOT NULL,
  `statut` enum('En attente','Acceptée','Refusée') DEFAULT 'En attente',
  `idEtudiant` int(11) DEFAULT NULL,
  `idAbsence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `justifications`
--

INSERT INTO `justifications` (`idJustification`, `dateAbsence`, `motif`, `fichier`, `statut`, `idEtudiant`, `idAbsence`) VALUES
(1, '2026-01-10', 'Certificat médical', 'certif1.pdf', 'Acceptée', 1, 1),
(2, '2026-01-15', 'Maladie', 'certif2.pdf', 'En attente', 3, 3),
(3, '2026-02-03', 'Problème familial', 'justif1.jpg', 'Refusée', 6, 6),
(4, '2026-02-12', 'Rendez-vous médical', 'doc1.pdf', 'En attente', 5, 11);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `idModule` int(11) NOT NULL,
  `nomModule` varchar(100) NOT NULL,
  `idEnseignant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`idModule`, `nomModule`, `idEnseignant`) VALUES
(1, 'Base de données', 1),
(2, 'Algorithmique', 2),
(3, 'Base de données', 1),
(4, 'Algorithmique', 1),
(5, 'Analyse mathématique', 2),
(6, 'Algèbre', 2),
(7, 'Physique générale', 3),
(8, 'Structures de données', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`idAbsence`),
  ADD KEY `idEtudiant` (`idEtudiant`),
  ADD KEY `idModule` (`idModule`);

--
-- Indexes for table `administrateurs`
--
ALTER TABLE `administrateurs`
  ADD PRIMARY KEY (`idAdmin`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `enseignants`
--
ALTER TABLE `enseignants`
  ADD PRIMARY KEY (`idEnseignant`);

--
-- Indexes for table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`idEtudiant`);

--
-- Indexes for table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`idGroupe`),
  ADD KEY `idEnseignant` (`idEnseignant`);

--
-- Indexes for table `justifications`
--
ALTER TABLE `justifications`
  ADD PRIMARY KEY (`idJustification`),
  ADD KEY `idEtudiant` (`idEtudiant`),
  ADD KEY `idAbsence` (`idAbsence`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`idModule`),
  ADD KEY `idEnseignant` (`idEnseignant`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absences`
--
ALTER TABLE `absences`
  MODIFY `idAbsence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `administrateurs`
--
ALTER TABLE `administrateurs`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enseignants`
--
ALTER TABLE `enseignants`
  MODIFY `idEnseignant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `idEtudiant` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `groupes`
--
ALTER TABLE `groupes`
  MODIFY `idGroupe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `justifications`
--
ALTER TABLE `justifications`
  MODIFY `idJustification` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `idModule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `absences_ibfk_1` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiants` (`idEtudiant`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `absences_ibfk_2` FOREIGN KEY (`idModule`) REFERENCES `modules` (`idModule`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `groupes`
--
ALTER TABLE `groupes`
  ADD CONSTRAINT `groupes_ibfk_1` FOREIGN KEY (`idEnseignant`) REFERENCES `enseignants` (`idEnseignant`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `justifications`
--
ALTER TABLE `justifications`
  ADD CONSTRAINT `justifications_ibfk_1` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiants` (`idEtudiant`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `justifications_ibfk_2` FOREIGN KEY (`idAbsence`) REFERENCES `absences` (`idAbsence`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`idEnseignant`) REFERENCES `enseignants` (`idEnseignant`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
