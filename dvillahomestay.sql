-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2021 at 05:24 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dvillahomestay`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `namaadmin` text NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`username`, `password`, `namaadmin`, `role`) VALUES
('admin', '12345678', 'Admin', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `emeltoken`
--

CREATE TABLE `emeltoken` (
  `id` int(11) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emeltoken`
--

INSERT INTO `emeltoken` (`id`, `token`) VALUES
(1, '1//0g0KUuESXYzdWCgYIARAAGBASNwF-L9IrnzHXy7qiS60rZgGZEzL2eRuryoUeH-BEc-T0zmF5ZZMON59ECs9-C1gMKfTkS4wBUzo');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `email` varchar(150) NOT NULL,
  `namapelanggan` varchar(150) NOT NULL,
  `notelpelanggan` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`email`, `namapelanggan`, `notelpelanggan`) VALUES
('amirulasrix@gmail.com', 'MOHAMAD AMIRUL ASRI BIN AZMI', '01135020493');

-- --------------------------------------------------------

--
-- Table structure for table `pelangganlogin`
--

CREATE TABLE `pelangganlogin` (
  `email` varchar(150) NOT NULL,
  `katalaluan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pelangganlogin`
--

INSERT INTO `pelangganlogin` (`email`, `katalaluan`) VALUES
('amirulasrix@gmail.com', 'amirulasri');

-- --------------------------------------------------------

--
-- Table structure for table `rumah`
--

CREATE TABLE `rumah` (
  `idrumah` int(150) NOT NULL,
  `namarumah` varchar(150) NOT NULL,
  `hargarumah` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rumah`
--

INSERT INTO `rumah` (`idrumah`, `namarumah`, `hargarumah`) VALUES
(1, 'Teres', '120'),
(2, 'Banglo', '210'),
(3, 'Rumah Kampung', '85'),
(4, 'Rumah Air', '110');

-- --------------------------------------------------------

--
-- Table structure for table `tempahan`
--

CREATE TABLE `tempahan` (
  `idtempahan` int(150) NOT NULL,
  `idrumah` int(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `tarikhmasuk` varchar(15) NOT NULL,
  `tarikhkeluar` varchar(15) NOT NULL,
  `bildewasa` int(10) NOT NULL,
  `bilkanakkanak` int(10) NOT NULL,
  `jumlahharga` varchar(150) NOT NULL,
  `namapelanggan` varchar(150) NOT NULL,
  `notelpelanggan` varchar(11) NOT NULL,
  `statusbayaran` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `emeltoken`
--
ALTER TABLE `emeltoken`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pelangganlogin`
--
ALTER TABLE `pelangganlogin`
  ADD KEY `kunci_asing_email` (`email`) USING BTREE;

--
-- Indexes for table `rumah`
--
ALTER TABLE `rumah`
  ADD PRIMARY KEY (`idrumah`);

--
-- Indexes for table `tempahan`
--
ALTER TABLE `tempahan`
  ADD PRIMARY KEY (`idtempahan`),
  ADD KEY `kunci_asing_idrumah` (`idrumah`) USING BTREE,
  ADD KEY `kunci_asing_email` (`email`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emeltoken`
--
ALTER TABLE `emeltoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rumah`
--
ALTER TABLE `rumah`
  MODIFY `idrumah` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tempahan`
--
ALTER TABLE `tempahan`
  MODIFY `idtempahan` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pelangganlogin`
--
ALTER TABLE `pelangganlogin`
  ADD CONSTRAINT `pelangganlogin_ibfk_1` FOREIGN KEY (`email`) REFERENCES `pelanggan` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tempahan`
--
ALTER TABLE `tempahan`
  ADD CONSTRAINT `kunci_asing_email` FOREIGN KEY (`email`) REFERENCES `pelanggan` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kunci_asing_idrumah` FOREIGN KEY (`idrumah`) REFERENCES `rumah` (`idrumah`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
