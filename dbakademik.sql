-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2020 at 07:25 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbakademik`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailkuis`
--

CREATE TABLE `detailkuis` (
  `id_detailkuis` int(10) NOT NULL,
  `id_kuis` int(10) DEFAULT NULL,
  `img_pertanyaan` varchar(255) NOT NULL,
  `jawaban` enum('A','B','C','D','E') NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detailkuis`
--

INSERT INTO `detailkuis` (`id_detailkuis`, `id_kuis`, `img_pertanyaan`, `jawaban`, `datecreated`) VALUES
(1, 1, 'b79c04bea6df8fe8.png', 'A', '2020-07-07 15:28:17'),
(2, 2, '95a9b0cef580ecf7.png', 'A', '2020-07-07 15:28:32'),
(3, 3, '94c819ac92b9e51a.png', 'A', '2020-07-07 15:29:10'),
(4, 4, '180178081ed58eb8.jpeg', 'A', '2020-07-07 15:29:26'),
(5, 5, '28cf6de82dc8abe2.png', 'D', '2020-07-07 15:29:45'),
(6, 6, 'd0a614ea8589c333.jpeg', 'D', '2020-07-07 15:30:03'),
(7, 7, '9a96a5024a44c8d8.png', 'B', '2020-07-07 15:45:12'),
(8, 8, '1a6664215ce4c3ed.png', 'C', '2020-07-07 15:45:55'),
(9, 9, '338b969f3e3ad6db.jpeg', 'A', '2020-07-07 16:25:59'),
(10, 10, 'ddc7b02d6cb61a05.png', 'C', '2020-07-07 16:26:22'),
(11, 12, 'cb493a6b3a977c6a.png', 'A', '2020-07-07 16:46:28'),
(12, 13, 'bc51c2a31c65d234.jpeg', 'A', '2020-07-07 16:47:29'),
(13, 14, 'b867948b8d9f8ec4.jpeg', 'A', '2020-07-07 16:47:42'),
(14, 15, '14582d4de6f2f8a7.jpeg', 'A', '2020-07-07 16:47:54'),
(15, 16, '9ee822f26fff0f99.png', 'A', '2020-07-07 16:48:08'),
(16, 17, '0dbbaef6b574f1f8.jpeg', 'A', '2020-07-07 16:48:22'),
(17, 18, '7e4df5e8ba47706d.png', 'A', '2020-07-07 16:48:37'),
(18, 19, 'ab3f77c9260ea1e8.jpeg', 'A', '2020-07-07 16:48:50'),
(19, 20, 'b05b3c136d58a594.jpeg', 'A', '2020-07-07 16:49:11'),
(20, 21, '5a3cdaa15cff550b.png', 'A', '2020-07-07 16:49:32'),
(21, 22, 'dc7b1287c7bbddfd.png', 'A', '2020-07-07 16:49:55'),
(22, 23, 'a699a08e4f663812.jpeg', 'A', '2020-07-07 16:50:09'),
(23, 24, '4604b6be6e24dda2.jpeg', 'A', '2020-07-07 16:50:27'),
(24, 25, 'f30909454d79f871.jpeg', 'A', '2020-07-07 16:50:42'),
(25, 26, '689e5d3689af1227.jpeg', 'A', '2020-07-07 16:51:01'),
(26, 27, '26f897469d261a3d.png', 'A', '2020-07-07 16:51:22'),
(27, 28, '49aa86915fc26d26.jpeg', 'A', '2020-07-07 16:51:46'),
(28, 29, '7c9e850dff0d4a15.png', 'A', '2020-07-07 16:52:02'),
(29, 30, '2c6e05d7f1737437.png', 'A', '2020-07-07 16:52:20'),
(30, 31, '85d1ada5c21f12e7.jpeg', 'A', '2020-07-07 16:52:33'),
(34, 37, 'a3a0d126b73eb65f.png', 'A', '2020-07-17 11:12:47');

-- --------------------------------------------------------

--
-- Table structure for table `detailtryout`
--

CREATE TABLE `detailtryout` (
  `id_detailtryout` int(10) NOT NULL,
  `id_tryout` int(10) DEFAULT NULL,
  `img_to` varchar(255) NOT NULL,
  `jawaban_to` enum('A','B','C','D','E') NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detailtryout`
--

INSERT INTO `detailtryout` (`id_detailtryout`, `id_tryout`, `img_to`, `jawaban_to`, `datecreated`) VALUES
(1, 11, '362ca0d2d8de73b1.jpeg', 'B', '2020-07-07 16:59:41'),
(2, 11, '3958956b159dfc6f.jpeg', 'B', '2020-07-07 16:59:55'),
(3, 11, 'eeaf66b7daba0c95.png', 'C', '2020-07-07 17:00:15'),
(4, 11, '67fdf335e5bd117e.png', 'A', '2020-07-07 17:01:17'),
(5, 11, 'f67583573afb7b5c.jpeg', 'C', '2020-07-07 17:02:45'),
(6, 11, 'c25bdd9d603fb6c9.jpeg', 'B', '2020-07-07 17:03:03'),
(7, 11, '5529b55a1f70f0c0.png', 'E', '2020-07-07 17:03:17'),
(8, 11, '6e8ff09f22de587b.jpeg', 'A', '2020-07-07 17:03:28'),
(9, 11, '58e6b9d755a016db.jpeg', 'A', '2020-07-07 17:03:43'),
(10, 11, '64da1f08f17d6025.png', 'A', '2020-07-07 17:09:29'),
(11, 11, 'a61ea0db738c6eb7.png', 'A', '2020-07-07 17:10:38'),
(12, 11, '81338c263c564645.jpeg', 'B', '2020-07-07 17:10:53'),
(13, 11, 'fb8aee6416797d62.png', 'A', '2020-07-07 17:11:05'),
(14, 11, 'efe91c5a029609bd.png', 'A', '2020-07-07 17:11:12'),
(15, 11, '10141d37912f0754.png', 'E', '2020-07-07 17:11:32'),
(16, 12, 'a405544a6e19cc4c.jpeg', 'B', '2020-07-07 18:48:38'),
(17, 12, '488d3fae6ab47753.png', 'B', '2020-07-07 18:48:45'),
(18, 12, 'b524f7a6c985d636.png', 'A', '2020-07-07 18:48:53'),
(19, 12, '8584b68d3aca790b.png', 'E', '2020-07-07 18:49:02'),
(20, 12, 'b8c84e5c9e07dd5d.jpeg', 'A', '2020-07-07 18:49:10'),
(21, 12, 'ee4c45c4526dd726.jpeg', 'A', '2020-07-07 18:49:16'),
(22, 12, '9134ef0fa9850aa0.jpeg', 'A', '2020-07-07 18:49:27'),
(23, 12, 'd9181f98884b9e0e.png', 'A', '2020-07-07 18:49:33'),
(24, 12, '95b756591f01ca33.png', 'C', '2020-07-07 18:49:44'),
(25, 12, '5672127d0b534ef0.png', 'A', '2020-07-07 18:49:54'),
(26, 13, '797a2a2ee84cd574.jpeg', 'A', '2020-07-07 18:50:16'),
(27, 13, '5de64ea993059a27.jpeg', 'B', '2020-07-07 18:50:24'),
(28, 13, '4ef8c9a8c40227b2.png', 'C', '2020-07-07 18:50:34'),
(29, 13, 'ce79c714f088e9d7.png', 'D', '2020-07-07 18:50:44'),
(30, 13, 'c4e466c61dde17cc.png', 'E', '2020-07-07 18:50:54'),
(33, 15, 'aa3556f76cd0d76c.jpeg', 'A', '2020-07-10 14:57:57');

-- --------------------------------------------------------

--
-- Table structure for table `jenjang`
--

CREATE TABLE `jenjang` (
  `id_jenjang` int(5) NOT NULL,
  `nama_jenjang` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenjang`
--

INSERT INTO `jenjang` (`id_jenjang`, `nama_jenjang`) VALUES
(1, 'SMP'),
(2, 'SMA');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(5) NOT NULL,
  `id_jenjang` int(5) DEFAULT NULL,
  `kelas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `id_jenjang`, `kelas`) VALUES
(1, 1, 7),
(2, 1, 8),
(3, 1, 9),
(4, 2, 10),
(5, 2, 11),
(6, 2, 12);

-- --------------------------------------------------------

--
-- Table structure for table `kuis`
--

CREATE TABLE `kuis` (
  `id_kuis` int(5) NOT NULL,
  `id_soal` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kuis`
--

INSERT INTO `kuis` (`id_kuis`, `id_soal`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(37, 9),
(38, 9);

--
-- Triggers `kuis`
--
DELIMITER $$
CREATE TRIGGER `deletedetailkuis` BEFORE DELETE ON `kuis` FOR EACH ROW DELETE FROM `detailkuis` WHERE id_kuis = old.id_kuis
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(5) NOT NULL,
  `nama_mapel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `nama_mapel`) VALUES
(1, 'Matematika'),
(2, 'IPA'),
(3, 'Kimia'),
(4, 'Bahasa Indonesia'),
(8, 'sejarah');

--
-- Triggers `mapel`
--
DELIMITER $$
CREATE TRIGGER `deletemateri` BEFORE DELETE ON `mapel` FOR EACH ROW DELETE FROM `materi` WHERE id_mapel = old.id_mapel
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mapelsoal`
--

CREATE TABLE `mapelsoal` (
  `id_mapelsoal` int(5) NOT NULL,
  `id_jenjang` int(5) DEFAULT NULL,
  `nama_mapelsoal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapelsoal`
--

INSERT INTO `mapelsoal` (`id_mapelsoal`, `id_jenjang`, `nama_mapelsoal`) VALUES
(1, 1, 'Matematika'),
(2, 2, 'Fisika'),
(3, 1, 'Biologi'),
(4, 1, 'PKN'),
(5, 2, 'Kimia'),
(10, 2, 'Matematika Wajib');

--
-- Triggers `mapelsoal`
--
DELIMITER $$
CREATE TRIGGER `deletesoal` BEFORE DELETE ON `mapelsoal` FOR EACH ROW DELETE FROM `soal` WHERE id_mapelsoal = old.id_mapelsoal
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id_materi` int(10) NOT NULL,
  `id_mapel` int(5) DEFAULT NULL,
  `id_kelas` int(5) DEFAULT NULL,
  `judul_materi` varchar(50) NOT NULL,
  `nama_materi` varchar(255) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id_materi`, `id_mapel`, `id_kelas`, `judul_materi`, `nama_materi`, `datecreated`) VALUES
(1, 1, 4, 'Limit Trigonometri', '48c24a6481587ad7.pdf', '2020-07-07 13:24:01'),
(2, 1, 2, 'Turunan Trigonometri dan Siklometri', '02d81e71414dcfbd.pdf', '2020-07-07 15:16:56'),
(3, 1, 1, 'Deret geometri tak hingga', '845888daa45ef0e7.pdf', '2020-07-07 15:23:20'),
(4, 2, 1, 'Listrik Statis', '056bf2663f38dd4c.pdf', '2020-07-07 15:50:34'),
(5, 2, 1, 'Listrik Dinamis', '02ddc4c0596c1609.pdf', '2020-07-07 15:54:52'),
(6, 1, 5, 'Kombinatorik dan peluang', '9b72d576845a1509.pdf', '2020-07-07 16:03:54'),
(11, 1, 5, 'rumus latihan mat', 'b0d2486ec09ff812.pdf', '2020-07-17 10:55:41');

-- --------------------------------------------------------

--
-- Table structure for table `nilaisoal`
--

CREATE TABLE `nilaisoal` (
  `id_nilaisoal` int(10) NOT NULL,
  `id_soal` int(10) DEFAULT NULL,
  `id` int(10) DEFAULT NULL,
  `nilai_soal` int(5) NOT NULL,
  `jumlah_soal` int(5) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilaisoal`
--

INSERT INTO `nilaisoal` (`id_nilaisoal`, `id_soal`, `id`, `nilai_soal`, `jumlah_soal`, `datecreated`) VALUES
(10, 1, 3, 5, 10, '2020-07-07 18:03:44'),
(12, 2, 3, 20, 20, '2020-07-07 18:36:32'),
(15, 1, 1, 0, 10, '2020-07-17 10:59:23');

-- --------------------------------------------------------

--
-- Table structure for table `nilaitryout`
--

CREATE TABLE `nilaitryout` (
  `id_nilaitryout` int(10) NOT NULL,
  `id_tryout` int(10) DEFAULT NULL,
  `id` int(10) DEFAULT NULL,
  `nilai_tryout` int(5) NOT NULL,
  `jumlah_tryout` int(5) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilaitryout`
--

INSERT INTO `nilaitryout` (`id_nilaitryout`, `id_tryout`, `id`, `nilai_tryout`, `jumlah_tryout`, `datecreated`) VALUES
(1, 11, 3, 7, 15, '2020-07-07 21:35:33'),
(2, 12, 3, 1, 10, '2020-07-07 21:43:10'),
(4, 11, 2, 0, 15, '2020-07-08 16:50:18'),
(6, 11, 1, 0, 15, '2020-07-17 11:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(5) NOT NULL,
  `nama_role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'Admin'),
(2, 'Guru'),
(3, 'Siswa');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(10) NOT NULL,
  `id_jenjang` int(5) DEFAULT NULL,
  `id_mapelsoal` int(5) DEFAULT NULL,
  `id_kelas` int(5) DEFAULT NULL,
  `nama_soal` varchar(50) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `id_jenjang`, `id_mapelsoal`, `id_kelas`, `nama_soal`, `datecreated`) VALUES
(1, 1, 1, 2, 'Latihan Mat 1', '2020-07-07 15:24:56'),
(2, 1, 1, 1, 'Latihan Deret Geometri', '2020-07-07 16:27:54'),
(3, 1, 1, 3, 'Limit Fungsi Aljabar', '2020-07-07 16:39:59'),
(4, 1, 1, 2, 'Persamaan Lingkaran', '2020-07-07 16:45:25'),
(5, 2, 2, 4, 'Teori Kinetik Gas', '2020-07-08 01:31:22'),
(6, 2, 2, 6, 'Kapasitor', '2020-07-08 01:31:49'),
(9, 1, 1, 2, 'soal 2', '2020-07-17 11:11:53');

--
-- Triggers `soal`
--
DELIMITER $$
CREATE TRIGGER `deletekuis` BEFORE DELETE ON `soal` FOR EACH ROW DELETE FROM `kuis` WHERE id_soal = old.id_soal
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deletenilaisoal` BEFORE DELETE ON `soal` FOR EACH ROW DELETE FROM `nilaisoal` WHERE id_soal = old.id_soal
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tryout`
--

CREATE TABLE `tryout` (
  `id_tryout` int(10) NOT NULL,
  `id_jenjang` int(10) DEFAULT NULL,
  `judul` varchar(50) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `timer` int(5) DEFAULT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tryout`
--

INSERT INTO `tryout` (`id_tryout`, `id_jenjang`, `judul`, `deskripsi`, `timer`, `datecreated`) VALUES
(11, 1, 'Fluida Statis dan Dinamis', 'Materi Fisika Lanjutan', 5, '2020-07-07 16:55:27'),
(12, 2, 'PRA-TO 1 UTBK 2020', 'Bidang matematika dan fisika', 20, '2020-07-07 16:57:05'),
(13, 2, 'TO 3 SAINTEK SBMPTN', 'SAINTEK dan TPS', NULL, '2020-07-07 16:59:07'),
(15, 1, 'TO Percobaan 1', 'Mat, Fisika, Kimia, Biologi', 1, '2020-07-10 14:52:22'),
(16, 2, 'TO baru 1', 'baru ', 3, '2020-07-17 11:00:27');

--
-- Triggers `tryout`
--
DELIMITER $$
CREATE TRIGGER `deletedetailtryout` BEFORE DELETE ON `tryout` FOR EACH ROW DELETE FROM `detailtryout` WHERE id_tryout = old.id_tryout
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deletenilaitryout` BEFORE DELETE ON `tryout` FOR EACH ROW DELETE FROM `nilaitryout` WHERE id_tryout = old.id_tryout
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `id_role` int(5) DEFAULT NULL,
  `nama` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_role`, `nama`, `password`, `email`) VALUES
(1, 1, 'admin', 'admin', 'admin@gmail.com'),
(2, 2, 'Guru', 'guru', 'guru@gmail.com'),
(3, 3, 'Murid', 'murid', 'murid@gmail.com'),
(4, 3, 'test', 'test', 'test@gmail.com'),
(5, 3, 'ahmad', 'ahmad', 'ahmad@gmail.com'),
(6, 2, 'guru lama', 'gurulama', 'gurulama@gmail.com'),
(7, 3, 'siswa', 'siswa', 'siswa@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailkuis`
--
ALTER TABLE `detailkuis`
  ADD PRIMARY KEY (`id_detailkuis`),
  ADD KEY `FKID_Kuis` (`id_kuis`);

--
-- Indexes for table `detailtryout`
--
ALTER TABLE `detailtryout`
  ADD PRIMARY KEY (`id_detailtryout`),
  ADD KEY `FKID_Tryout` (`id_tryout`);

--
-- Indexes for table `jenjang`
--
ALTER TABLE `jenjang`
  ADD PRIMARY KEY (`id_jenjang`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `kuis`
--
ALTER TABLE `kuis`
  ADD PRIMARY KEY (`id_kuis`),
  ADD KEY `FKID_Soal` (`id_soal`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `mapelsoal`
--
ALTER TABLE `mapelsoal`
  ADD PRIMARY KEY (`id_mapelsoal`),
  ADD KEY `FKID_Jenjang` (`id_jenjang`) USING BTREE;

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `FKID_Mapel` (`id_mapel`),
  ADD KEY `FKID_Kelasmateri` (`id_kelas`);

--
-- Indexes for table `nilaisoal`
--
ALTER TABLE `nilaisoal`
  ADD PRIMARY KEY (`id_nilaisoal`),
  ADD KEY `FKID_NilaiSoal` (`id_soal`),
  ADD KEY `FKID_IDUserSoal` (`id`);

--
-- Indexes for table `nilaitryout`
--
ALTER TABLE `nilaitryout`
  ADD PRIMARY KEY (`id_nilaitryout`),
  ADD KEY `FKID_NilaiTryout` (`id_tryout`),
  ADD KEY `FKID_IDUserTryout` (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `FKID_Jenjangsoal` (`id_jenjang`),
  ADD KEY `FKID_Mapelsoal` (`id_mapelsoal`),
  ADD KEY `FKID_Kelas` (`id_kelas`);

--
-- Indexes for table `tryout`
--
ALTER TABLE `tryout`
  ADD PRIMARY KEY (`id_tryout`),
  ADD KEY `FKID_JenjangTryout` (`id_jenjang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `FKID_role` (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detailkuis`
--
ALTER TABLE `detailkuis`
  MODIFY `id_detailkuis` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `detailtryout`
--
ALTER TABLE `detailtryout`
  MODIFY `id_detailtryout` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `jenjang`
--
ALTER TABLE `jenjang`
  MODIFY `id_jenjang` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kuis`
--
ALTER TABLE `kuis`
  MODIFY `id_kuis` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mapelsoal`
--
ALTER TABLE `mapelsoal`
  MODIFY `id_mapelsoal` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id_materi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `nilaisoal`
--
ALTER TABLE `nilaisoal`
  MODIFY `id_nilaisoal` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `nilaitryout`
--
ALTER TABLE `nilaitryout`
  MODIFY `id_nilaitryout` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tryout`
--
ALTER TABLE `tryout`
  MODIFY `id_tryout` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailkuis`
--
ALTER TABLE `detailkuis`
  ADD CONSTRAINT `FKID_Kuis` FOREIGN KEY (`id_kuis`) REFERENCES `kuis` (`id_kuis`);

--
-- Constraints for table `detailtryout`
--
ALTER TABLE `detailtryout`
  ADD CONSTRAINT `FKID_Tryout` FOREIGN KEY (`id_tryout`) REFERENCES `tryout` (`id_tryout`);

--
-- Constraints for table `kuis`
--
ALTER TABLE `kuis`
  ADD CONSTRAINT `FKID_Soal` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id_soal`);

--
-- Constraints for table `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `FKID_Kelasmateri` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `FKID_Mapel` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id_mapel`);

--
-- Constraints for table `nilaisoal`
--
ALTER TABLE `nilaisoal`
  ADD CONSTRAINT `FKID_IDUserSoal` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKID_NilaiSoal` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id_soal`);

--
-- Constraints for table `nilaitryout`
--
ALTER TABLE `nilaitryout`
  ADD CONSTRAINT `FKID_IDUserTryout` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKID_NilaiTryout` FOREIGN KEY (`id_tryout`) REFERENCES `tryout` (`id_tryout`);

--
-- Constraints for table `soal`
--
ALTER TABLE `soal`
  ADD CONSTRAINT `FKID_Jenjangsoal` FOREIGN KEY (`id_jenjang`) REFERENCES `jenjang` (`id_jenjang`),
  ADD CONSTRAINT `FKID_Kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `FKID_Mapelsoal` FOREIGN KEY (`id_mapelsoal`) REFERENCES `mapelsoal` (`id_mapelsoal`);

--
-- Constraints for table `tryout`
--
ALTER TABLE `tryout`
  ADD CONSTRAINT `FKID_JenjangTryout` FOREIGN KEY (`id_jenjang`) REFERENCES `jenjang` (`id_jenjang`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKID_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
