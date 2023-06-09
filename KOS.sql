-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2023 at 09:02 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kos`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id_galeri` int(11) NOT NULL,
  `id_kost` int(11) NOT NULL,
  `judul` varchar(40) NOT NULL,
  `file` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `galeri`
--

INSERT INTO `galeri` (`id_galeri`, `id_kost`, `judul`, `file`) VALUES
(1, 9, 'Kamar', '3909062023084449.png');

-- --------------------------------------------------------

--
-- Table structure for table `kost`
--

CREATE TABLE `kost` (
  `id_kost` int(11) NOT NULL,
  `id_pemilik` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `tersedia` int(2) NOT NULL,
  `status` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `fasilitas` text NOT NULL,
  `harga_3bulan` int(9) NOT NULL,
  `harga_6bulan` int(9) NOT NULL,
  `harga_pertahun` int(9) NOT NULL,
  `pengunjung` int(11) DEFAULT NULL,
  `kontak` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kost`
--

INSERT INTO `kost` (`id_kost`, `id_pemilik`, `nama`, `alamat`, `tersedia`, `status`, `fasilitas`, `harga_3bulan`, `harga_6bulan`, `harga_pertahun`, `pengunjung`, `kontak`) VALUES
(3, 2, 'Kost Cempaka', 'Jln.Cempaka sari RT 04 RW 02', 2, 'Perempuan', 'kipas angin, lemari, meja belajar, kamar mandi dalem', 3000, 6000, 10000, 2147483647, '62123456789012'),
(4, 2, 'Kost Mocca', 'Jln.Patemon RT 05 RW 03', 3, 'Perempuan', 'Kamar mandi dalem, kasur, lemari, meja belajar', 2000, 4000, 8000, 2147483647, '6287729374011'),
(5, 2, 'Kost Annisa', 'Jl. Kalimasada', 3, 'Perempuan', 'KM dalam, kulkas, kompor', 2500, 4000, 7500, 2147483647, '6285137693728'),
(6, 2, 'Kost Aisha', 'Kalimasada 3', 1, 'Perempuan', 'listrik, air, wifi', 2000, 4000, 7000, 2147483647, '62123456789012'),
(7, 2, 'Kost Biru', 'Patemon Raya', 5, 'Laki-laki', 'KM Luar, kompor, wifi', 1500, 3000, 5000, 2147483647, '6285199334578'),
(8, 2, 'Kost Bintang', 'Cempaka Sari Timur', 2, 'Laki-laki', 'KM Dalam, AC, Wifi, Kompor, Kulkas', 3000, 6000, 12000, 2147483647, '62878372891640'),
(9, 3, 'Kost Biru 2', 'Cempakasari', 3, 'Laki-laki', 'KM Dalam, Kompor, Kulkas', 2000000, 4000000, 7000000, 2147483647, '621234567890');

-- --------------------------------------------------------

--
-- Table structure for table `pemilik`
--

CREATE TABLE `pemilik` (
  `id_pemilik` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telepon` varchar(12) NOT NULL,
  `email` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pemilik`
--

INSERT INTO `pemilik` (`id_pemilik`, `nama`, `alamat`, `telepon`, `email`, `username`, `password`) VALUES
(1, 'Pemilik Kost', 'Karangbendo Wetan RT. 02 RW.08', '081234567890', 'pemilik@gmail.com', 'pemilik', '58399557dae3c60e23c78606771dfa3d'),
(2, '', '', '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(3, 'biru', 'cempakasari', '62123456', 'dummy@mail.xyz', 'biru', 'bffc68f8f0052cc5b8e0affaa651acb5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id_galeri`),
  ADD KEY `fk_kost` (`id_kost`);

--
-- Indexes for table `kost`
--
ALTER TABLE `kost`
  ADD PRIMARY KEY (`id_kost`),
  ADD KEY `fk_pemilik` (`id_pemilik`);

--
-- Indexes for table `pemilik`
--
ALTER TABLE `pemilik`
  ADD PRIMARY KEY (`id_pemilik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id_galeri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kost`
--
ALTER TABLE `kost`
  MODIFY `id_kost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pemilik`
--
ALTER TABLE `pemilik`
  MODIFY `id_pemilik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `galeri`
--
ALTER TABLE `galeri`
  ADD CONSTRAINT `galeri_ibfk_1` FOREIGN KEY (`id_kost`) REFERENCES `kost` (`id_kost`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kost`
--
ALTER TABLE `kost`
  ADD CONSTRAINT `kost_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik` (`id_pemilik`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
