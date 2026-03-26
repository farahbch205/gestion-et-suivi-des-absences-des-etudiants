-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2026 at 06:59 PM
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
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `date_absence` date NOT NULL,
  `creneau` varchar(20) DEFAULT NULL,
  `statut` enum('absent','present') DEFAULT 'absent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `absences`
--

INSERT INTO `absences` (`id`, `student_id`, `module_id`, `date_absence`, `creneau`, `statut`) VALUES
(1, 3, 12, '2026-03-17', NULL, 'present'),
(2, 4, 12, '2026-03-17', NULL, 'present'),
(3, 5, 12, '2026-03-17', NULL, 'present'),
(4, 6, 12, '2026-03-17', NULL, 'present'),
(5, 7, 12, '2026-03-17', NULL, 'present'),
(11, 3, 12, '2026-03-11', NULL, 'present'),
(12, 4, 12, '2026-03-11', NULL, 'absent'),
(13, 5, 12, '2026-03-11', NULL, 'present'),
(14, 6, 12, '2026-03-11', NULL, 'present'),
(15, 7, 12, '2026-03-11', NULL, 'present'),
(26, 3, 12, '2026-02-04', NULL, 'absent'),
(27, 4, 12, '2026-02-04', NULL, 'present'),
(28, 5, 12, '2026-02-04', NULL, 'present'),
(29, 6, 12, '2026-02-04', NULL, 'present'),
(30, 7, 12, '2026-02-04', NULL, 'present'),
(31, 3, 12, '2026-03-05', '08h00-09h30', 'present'),
(32, 4, 12, '2026-03-05', '08h00-09h30', 'absent'),
(33, 5, 12, '2026-03-05', '08h00-09h30', 'present'),
(34, 6, 12, '2026-03-05', '08h00-09h30', 'present'),
(35, 7, 12, '2026-03-05', '08h00-09h30', 'present'),
(36, 3, 12, '2026-03-01', '08h00-09h30', 'absent'),
(37, 4, 12, '2026-03-01', '08h00-09h30', 'present'),
(38, 5, 12, '2026-03-01', '08h00-09h30', 'present'),
(39, 6, 12, '2026-03-01', '08h00-09h30', 'present'),
(40, 7, 12, '2026-03-01', '08h00-09h30', 'present');

-- --------------------------------------------------------

--
-- Table structure for table `bons`
--

CREATE TABLE `bons` (
  `id` int(11) NOT NULL,
  `justification_id` int(11) NOT NULL,
  `date_emission` date DEFAULT NULL,
  `date_validation` date DEFAULT NULL,
  `code_unique` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `justifications`
--

CREATE TABLE `justifications` (
  `id` int(11) NOT NULL,
  `absence_id` int(11) NOT NULL,
  `date_envoi` date DEFAULT NULL,
  `fichier` varchar(255) DEFAULT NULL,
  `motif` varchar(255) DEFAULT NULL,
  `statut` enum('en_attente','accepte','refuse') DEFAULT 'en_attente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `justifications`
--

INSERT INTO `justifications` (`id`, `absence_id`, `date_envoi`, `fichier`, `motif`, `statut`) VALUES
(3, 26, '2026-03-25', '1774455844_c566b0ac8bfb3b2464fae3df1bb3905c.jpg', 'maladi', 'accepte'),
(4, 36, '2026-03-26', '1774482945_c566b0ac8bfb3b2464fae3df1bb3905c.jpg', 'maladi', 'accepte');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `nom_module` varchar(100) NOT NULL,
  `prof_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `nom_module`, `prof_id`) VALUES
(12, 'Mathématiques', 9),
(22, 'Physique', 9),
(23, 'Informatique', 10),
(24, 'Réseaux', 10),
(25, 'Base de données', 11),
(26, 'Algèbre', 10),
(27, 'Analyse', 10),
(28, 'Anglais', 9);

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`id`, `user_id`) VALUES
(9, 12),
(10, 18),
(11, 19);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `niveau` varchar(10) DEFAULT NULL,
  `specialite` varchar(50) DEFAULT NULL,
  `groupe` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `niveau`, `specialite`, `groupe`) VALUES
(3, 13, 'L2', 'Informatique', 'G1'),
(4, 14, 'L2', 'Informatique', 'G1'),
(5, 15, 'L3', 'Réseaux', 'G2'),
(6, 16, 'L3', 'Réseaux', 'G2'),
(7, 17, 'L1', 'Réseaux', 'G1'),
(28, 20, 'M1', 'Informatique', 'G3'),
(29, 21, 'M1', 'Réseaux', 'G1'),
(30, 22, 'M2', 'Informatique', 'G2'),
(31, 23, 'M1', 'Informatique', 'G3');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `email`, `password`, `role`) VALUES
(1, 'admin', 'system', 'admin@gmail.com', '123456', 'admin'),
(12, 'Hadjs', 'Samira', 'samira.hadj@univ.dz', '$2y$10$vKOeod1DR4TGyy3dV3T5V.tQ6fMHjBWsA7GPdMMScTGPBJetQXdIa', 'prof'),
(13, 'Boudiaf', 'Ahmed', 'ahmed.boudiaf@etud.dz', '$2y$10$DAeG2JNS62VT6263XdhVy.4gRJ9dQQNRfOTQRzh1U.YTVnxFqRrCS', 'etudiant'),
(14, 'Hamidi', 'sara', 'sara.hamidi@etud.dz', '$2y$10$Ej7vganCXiW93GzBgLznDuT/UBcldf4A30L16IUMr94.0wpkuVuwG', 'etudiant'),
(15, 'Meziane', 'Youcef', 'youcef.meziane@etud.dz', '$2y$10$pR.MaHvuo80WBSKQAssgkeTY7LEycpJ8fUOFNGuJi8soxLhM3A8au', 'etudiant'),
(16, 'CherifI', 'imane', 'imane.cherif@etud.dz', '$2y$10$SH0p/7Ld7vvqrWxKBd.UX.S0ubOtYMlI5FTdopkdBiV/eVhB5nXju', 'etudiant'),
(17, 'SSSSSSS', 'GJJGJG', 'UGUYG@GUU', '$2y$10$iHit6ht7d9Mfcg.GG0FrXukSveTmRX.x.eZt1iL3IblbTZBnJszge', ''),
(18, 'mmmm', 'ddddd', 'mmmhhh@univ.dz', '$2y$10$g/Hh5Vavwq2uLzZld/zgdOvFN7lmykrE2cTw9KHt7xBFHLr9SZKsK', 'prof'),
(19, 'Benali', 'Karim', 'karim.benali@univ.dz', '$2y$10$iBSsFltl/aeZ91SD6oBmFODaAG/0MK2JkCH/wxJOFP/LafdpMS7nK', 'prof'),
(20, 'Benali', 'Karim ', 'karim.benali@etud.dz', '$2y$10$2s9dx3ipOrqPxigcY0nbT.IQuzKsSlY7pwNjg1zPlaFkswjJPI1Be', 'etudiant'),
(21, 'khelifi', 'Laila', 'laila.khelifi@etud.dz', '$2y$10$wF/x/S2/JFRMqYhujiZPd.bKbAeu/lIGqS.DjVskDC8UZoYTja1Zm', 'etudiant'),
(22, 'merabet', 'Sofiane', 'sofiane.merabet@etud.dz', '$2y$10$OnjmNFZJmx35ujvz8NXOh.2JuxKE.mIrUe4PVlyTz2Cr4W9eFFU0G', 'etudiant'),
(23, 'Boudiaf', 'Yasmina.', 'yasmina.boudiaf@etud.dz', '$2y$10$1SOCeGsQXl38Zix7CNRIguRgcRTx4BihCMd/okaIw9goTEQ50kGWi', 'etudiant');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `bons`
--
ALTER TABLE `bons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `justification_id` (`justification_id`);

--
-- Indexes for table `justifications`
--
ALTER TABLE `justifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absence_id` (`absence_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prof_id` (`prof_id`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absences`
--
ALTER TABLE `absences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `bons`
--
ALTER TABLE `bons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `justifications`
--
ALTER TABLE `justifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `absences_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `absences_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bons`
--
ALTER TABLE `bons`
  ADD CONSTRAINT `bons_ibfk_1` FOREIGN KEY (`justification_id`) REFERENCES `justifications` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `justifications`
--
ALTER TABLE `justifications`
  ADD CONSTRAINT `justifications_ibfk_1` FOREIGN KEY (`absence_id`) REFERENCES `absences` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`prof_id`) REFERENCES `professors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `professors`
--
ALTER TABLE `professors`
  ADD CONSTRAINT `professors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
