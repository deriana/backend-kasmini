-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for absensi_db
DROP DATABASE IF EXISTS `absensi_db`;
CREATE DATABASE IF NOT EXISTS `absensi_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `absensi_db`;

-- Dumping structure for table absensi_db.admin
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table absensi_db.admin: ~4 rows (approximately)
DELETE FROM `admin`;
INSERT INTO `admin` (`id`, `username`, `password_hash`, `email`, `created_at`, `updated_at`) VALUES
	(2, 'admin2', '$2b$10$12345abcdefg67890abcdefg1234567890abcdefg1234', 'admin2@example.com', '2024-12-09 23:55:22', '2024-12-09 23:55:22'),
	(3, 'admin3', '$2b$10$zxy9876543210abcdefg1234567890abcdefg1234567', 'admin3@example.com', '2024-12-09 23:55:22', '2024-12-09 23:55:22'),
	(4, 'risu', '$2b$10$Ngat9rwPQkSRIzdiT07oE.iyWEltclXz1FdaGVl3k5EpMT3FhyoTK', 'risu@gmail.com', '2024-12-10 00:31:25', '2024-12-10 00:31:25'),
	(5, 'newUsername', '$2b$10$u69zuDLXf3RhUZ2XFJVC7ejS2aC3XUU8nQy4nJ0OVmUzpoyK7vbZ.', 'newEmail@example.com', '2024-12-11 14:05:19', '2024-12-11 14:05:19');

-- Dumping structure for table absensi_db.scans
DROP TABLE IF EXISTS `scans`;
CREATE TABLE IF NOT EXISTS `scans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `type` enum('masuk','keluar') NOT NULL DEFAULT 'masuk',
  PRIMARY KEY (`id`),
  KEY `fk_user` (`userID`),
  CONSTRAINT `fk_user` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table absensi_db.scans: ~42 rows (approximately)
DELETE FROM `scans`;
INSERT INTO `scans` (`id`, `userID`, `timestamp`, `type`) VALUES
	(1, 1, '2024-01-01 08:05:00', 'masuk'),
	(2, 1, '2024-01-01 17:00:00', 'keluar'),
	(3, 2, '2024-01-01 07:55:00', 'masuk'),
	(4, 2, '2024-01-01 17:05:00', 'keluar'),
	(5, 3, '2024-01-01 08:10:00', 'masuk'),
	(6, 3, '2024-01-01 16:50:00', 'keluar'),
	(7, 1, '2024-01-02 08:00:00', 'masuk'),
	(8, 1, '2024-01-02 17:15:00', 'keluar'),
	(9, 2, '2024-01-02 08:02:00', 'masuk'),
	(10, 2, '2024-01-02 16:55:00', 'keluar'),
	(11, 3, '2024-01-02 08:07:00', 'masuk'),
	(12, 3, '2024-01-02 17:10:00', 'keluar'),
	(13, 1, '2024-01-03 08:03:00', 'masuk'),
	(14, 1, '2024-01-03 17:00:00', 'keluar'),
	(15, 2, '2024-01-03 07:59:00', 'masuk'),
	(16, 2, '2024-01-03 17:00:00', 'keluar'),
	(17, 3, '2024-01-03 08:05:00', 'masuk'),
	(18, 3, '2024-01-03 17:05:00', 'keluar'),
	(19, 1, '2024-11-30 08:10:00', 'masuk'),
	(20, 1, '2024-11-30 17:00:00', 'keluar'),
	(21, 2, '2024-11-30 07:50:00', 'masuk'),
	(22, 2, '2024-11-30 17:05:00', 'keluar'),
	(23, 3, '2024-11-30 08:05:00', 'keluar'),
	(24, 3, '2024-11-30 17:10:00', 'keluar'),
	(25, 1, '2024-12-04 12:17:51', 'masuk'),
	(26, 1, '2024-12-04 12:17:59', 'keluar'),
	(27, 4, '2024-12-04 12:19:42', 'masuk'),
	(28, 1, '2024-12-04 12:19:48', 'masuk'),
	(29, 1, '2024-12-04 12:20:10', 'keluar'),
	(30, 4, '2024-12-04 12:20:38', 'keluar'),
	(31, 1, '2024-12-04 12:20:42', 'masuk'),
	(32, 1, '2024-12-04 12:20:48', 'keluar'),
	(33, 4, '2024-12-04 12:20:52', 'masuk'),
	(34, 4, '2024-12-04 12:21:38', 'keluar'),
	(35, 4, '2024-12-04 12:21:42', 'masuk'),
	(36, 1, '2024-12-04 12:22:34', 'masuk'),
	(37, 4, '2024-12-04 12:22:41', 'keluar'),
	(38, 4, '2024-12-04 12:25:37', 'masuk'),
	(39, 4, '2024-12-04 12:25:41', 'keluar'),
	(40, 1, '2024-12-10 19:21:12', 'keluar'),
	(41, 1, '2024-12-10 19:21:16', 'masuk'),
	(42, 1, '2024-12-10 19:21:26', 'keluar');

-- Dumping structure for table absensi_db.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rfid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `kelamin` enum('Laki Laki','Wanita') DEFAULT NULL,
  `mapel` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid` (`rfid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table absensi_db.users: ~5 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `rfid`, `name`, `created_at`, `kelamin`, `mapel`, `image`) VALUES
	(1, '0018482806', 'risu', '2024-11-19 12:18:44', 'Laki Laki', 'Bahasa Inggris', NULL),
	(2, '1234567890', 'Guru 1', '2024-11-24 11:51:38', 'Laki Laki', 'Matematika', 'image1.jpg'),
	(3, '0987654321', 'Guru 2', '2024-11-24 11:51:38', 'Wanita', 'Bahasa Indonesia', 'image2.jpg'),
	(4, '0019467341', 'test', '2024-11-20 02:17:24', NULL, NULL, NULL),
	(5, '1231132', 'MIAW', '2024-12-03 13:37:28', 'Wanita', 'Kucing', 'apacoba.jpg');


-- Dumping database structure for app_bukutamu
DROP DATABASE IF EXISTS `app_bukutamu`;
CREATE DATABASE IF NOT EXISTS `app_bukutamu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `app_bukutamu`;

-- Dumping structure for table app_bukutamu.buku_tamu
DROP TABLE IF EXISTS `buku_tamu`;
CREATE TABLE IF NOT EXISTS `buku_tamu` (
  `id_tamu` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_tamu` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `bertemu` varchar(255) NOT NULL,
  `kepentingan` varchar(255) NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tamu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table app_bukutamu.buku_tamu: ~114 rows (approximately)
DELETE FROM `buku_tamu`;
INSERT INTO `buku_tamu` (`id_tamu`, `tanggal`, `nama_tamu`, `alamat`, `no_hp`, `bertemu`, `kepentingan`, `img_path`) VALUES
	('1', '2024-10-05', 'Tamu1', 'Alamat Tamu1', '081200000001', 'Guru2', 'Menghadiri acara sekolah', ''),
	('10', '2024-10-05', 'Tamu10', 'Alamat Tamu10', '081200000010', 'Guru1', 'Menghadiri acara sekolah', NULL),
	('100', '2024-10-05', 'Tamu100', 'Alamat Tamu100', '081200000100', 'Guru1', 'Menghadiri acara sekolah', NULL),
	('11', '2024-10-05', 'Tamu11', 'Alamat Tamu11', '081200000011', 'Guru2', 'Menghadiri acara sekolah', NULL),
	('12', '2024-10-05', 'Tamu12', 'Alamat Tamu12', '081200000012', 'Guru3', 'Menghadiri acara sekolah', NULL),
	('13', '2024-10-05', 'Tamu13', 'Alamat Tamu13', '081200000013', 'Guru4', 'Menghadiri acara sekolah', NULL),
	('14', '2024-10-05', 'Tamu14', 'Alamat Tamu14', '081200000014', 'Guru5', 'Menghadiri acara sekolah', NULL),
	('15', '2024-10-05', 'Tamu15', 'Alamat Tamu15', '081200000015', 'Guru6', 'Menghadiri acara sekolah', NULL),
	('16', '2024-10-05', 'Tamu16', 'Alamat Tamu16', '081200000016', 'Guru7', 'Menghadiri acara sekolah', NULL),
	('17', '2024-10-05', 'Tamu17', 'Alamat Tamu17', '081200000017', 'Guru8', 'Menghadiri acara sekolah', NULL),
	('18', '2024-10-05', 'Tamu18', 'Alamat Tamu18', '081200000018', 'Guru9', 'Menghadiri acara sekolah', NULL),
	('19', '2024-10-05', 'Tamu19', 'Alamat Tamu19', '081200000019', 'Guru10', 'Menghadiri acara sekolah', NULL),
	('2', '2024-10-05', 'Tamu2', 'Alamat Tamu2', '081200000002', 'Guru3', 'Menghadiri acara sekolah', NULL),
	('20', '2024-10-05', 'Tamu20', 'Alamat Tamu20', '081200000020', 'Guru1', 'Menghadiri acara sekolah', NULL),
	('21', '2024-10-05', 'Tamu21', 'Alamat Tamu21', '081200000021', 'Guru2', 'Menghadiri acara sekolah', NULL),
	('22', '2024-10-05', 'Tamu22', 'Alamat Tamu22', '081200000022', 'Guru3', 'Menghadiri acara sekolah', NULL),
	('23', '2024-10-05', 'Tamu23', 'Alamat Tamu23', '081200000023', 'Guru4', 'Menghadiri acara sekolah', NULL),
	('24', '2024-10-05', 'Tamu24', 'Alamat Tamu24', '081200000024', 'Guru5', 'Menghadiri acara sekolah', NULL),
	('25', '2024-10-05', 'Tamu25', 'Alamat Tamu25', '081200000025', 'Guru6', 'Menghadiri acara sekolah', NULL),
	('26', '2024-10-05', 'Tamu26', 'Alamat Tamu26', '081200000026', 'Guru7', 'Menghadiri acara sekolah', NULL),
	('27', '2024-10-05', 'Tamu27', 'Alamat Tamu27', '081200000027', 'Guru8', 'Menghadiri acara sekolah', NULL),
	('28', '2024-10-05', 'Tamu28', 'Alamat Tamu28', '081200000028', 'Guru9', 'Menghadiri acara sekolah', NULL),
	('29', '2024-10-05', 'Tamu29', 'Alamat Tamu29', '081200000029', 'Guru10', 'Menghadiri acara sekolah', NULL),
	('3', '2024-10-05', 'Tamu3', 'Alamat Tamu3', '081200000003', 'Guru4', 'Menghadiri acara sekolah', NULL),
	('30', '2024-10-05', 'Tamu30', 'Alamat Tamu30', '081200000030', 'Guru1', 'Menghadiri acara sekolah', NULL),
	('31', '2024-10-05', 'Tamu31', 'Alamat Tamu31', '081200000031', 'Guru2', 'Menghadiri acara sekolah', NULL),
	('32', '2024-10-05', 'Tamu32', 'Alamat Tamu32', '081200000032', 'Guru3', 'Menghadiri acara sekolah', NULL),
	('33', '2024-10-05', 'Tamu33', 'Alamat Tamu33', '081200000033', 'Guru4', 'Menghadiri acara sekolah', NULL),
	('34', '2024-10-05', 'Tamu34', 'Alamat Tamu34', '081200000034', 'Guru5', 'Menghadiri acara sekolah', NULL),
	('35', '2024-10-05', 'Tamu35', 'Alamat Tamu35', '081200000035', 'Guru6', 'Menghadiri acara sekolah', NULL),
	('36', '2024-10-05', 'Tamu36', 'Alamat Tamu36', '081200000036', 'Guru7', 'Menghadiri acara sekolah', NULL),
	('37', '2024-10-05', 'Tamu37', 'Alamat Tamu37', '081200000037', 'Guru8', 'Menghadiri acara sekolah', NULL),
	('38', '2024-10-05', 'Tamu38', 'Alamat Tamu38', '081200000038', 'Guru9', 'Menghadiri acara sekolah', NULL),
	('39', '2024-10-05', 'Tamu39', 'Alamat Tamu39', '081200000039', 'Guru10', 'Menghadiri acara sekolah', NULL),
	('4', '2024-10-05', 'Tamu4', 'Alamat Tamu4', '081200000004', 'Guru5', 'Menghadiri acara sekolah', NULL),
	('40', '2024-10-05', 'Tamu40', 'Alamat Tamu40', '081200000040', 'Guru1', 'Menghadiri acara sekolah', NULL),
	('41', '2024-10-05', 'Tamu41', 'Alamat Tamu41', '081200000041', 'Guru2', 'Menghadiri acara sekolah', NULL),
	('42', '2024-10-05', 'Tamu42', 'Alamat Tamu42', '081200000042', 'Guru3', 'Menghadiri acara sekolah', NULL),
	('43', '2024-10-05', 'Tamu43', 'Alamat Tamu43', '081200000043', 'Guru4', 'Menghadiri acara sekolah', NULL),
	('44', '2024-10-05', 'Tamu44', 'Alamat Tamu44', '081200000044', 'Guru5', 'Menghadiri acara sekolah', NULL),
	('45', '2024-10-05', 'Tamu45', 'Alamat Tamu45', '081200000045', 'Guru6', 'Menghadiri acara sekolah', NULL),
	('46', '2024-10-05', 'Tamu46', 'Alamat Tamu46', '081200000046', 'Guru7', 'Menghadiri acara sekolah', NULL),
	('47', '2024-10-05', 'Tamu47', 'Alamat Tamu47', '081200000047', 'Guru8', 'Menghadiri acara sekolah', NULL),
	('48', '2024-10-05', 'Tamu48', 'Alamat Tamu48', '081200000048', 'Guru9', 'Menghadiri acara sekolah', NULL),
	('49', '2024-10-05', 'Tamu49', 'Alamat Tamu49', '081200000049', 'Guru10', 'Menghadiri acara sekolah', NULL),
	('5', '2024-10-05', 'Tamu5', 'Alamat Tamu5', '081200000005', 'Guru6', 'Menghadiri acara sekolah', NULL),
	('50', '2024-10-05', 'Tamu50', 'Alamat Tamu50', '081200000050', 'Guru1', 'Menghadiri acara sekolah', NULL),
	('51', '2024-10-05', 'Tamu51', 'Alamat Tamu51', '081200000051', 'Guru2', 'Menghadiri acara sekolah', NULL),
	('52', '2024-10-05', 'Tamu52', 'Alamat Tamu52', '081200000052', 'Guru3', 'Menghadiri acara sekolah', NULL),
	('53', '2024-10-05', 'Tamu53', 'Alamat Tamu53', '081200000053', 'Guru4', 'Menghadiri acara sekolah', NULL),
	('54', '2024-10-05', 'Tamu54', 'Alamat Tamu54', '081200000054', 'Guru5', 'Menghadiri acara sekolah', NULL),
	('55', '2024-10-05', 'Tamu55', 'Alamat Tamu55', '081200000055', 'Guru6', 'Menghadiri acara sekolah', NULL),
	('56', '2024-10-05', 'Tamu56', 'Alamat Tamu56', '081200000056', 'Guru7', 'Menghadiri acara sekolah', NULL),
	('57', '2024-10-05', 'Tamu57', 'Alamat Tamu57', '081200000057', 'Guru8', 'Menghadiri acara sekolah', NULL),
	('58', '2024-10-05', 'Tamu58', 'Alamat Tamu58', '081200000058', 'Guru9', 'Menghadiri acara sekolah', NULL),
	('59', '2024-10-05', 'Tamu59', 'Alamat Tamu59', '081200000059', 'Guru10', 'Menghadiri acara sekolah', NULL),
	('6', '2024-10-05', 'Tamu6', 'Alamat Tamu6', '081200000006', 'Guru7', 'Menghadiri acara sekolah', NULL),
	('60', '2024-10-05', 'Tamu60', 'Alamat Tamu60', '081200000060', 'Guru1', 'Menghadiri acara sekolah', NULL),
	('61', '2024-10-05', 'Tamu61', 'Alamat Tamu61', '081200000061', 'Guru2', 'Menghadiri acara sekolah', NULL),
	('62', '2024-10-05', 'Tamu62', 'Alamat Tamu62', '081200000062', 'Guru3', 'Menghadiri acara sekolah', NULL),
	('63', '2024-10-05', 'Tamu63', 'Alamat Tamu63', '081200000063', 'Guru4', 'Menghadiri acara sekolah', NULL),
	('64', '2024-10-05', 'Tamu64', 'Alamat Tamu64', '081200000064', 'Guru5', 'Menghadiri acara sekolah', NULL),
	('65', '2024-10-05', 'Tamu65', 'Alamat Tamu65', '081200000065', 'Guru6', 'Menghadiri acara sekolah', NULL),
	('66', '2024-10-05', 'Tamu66', 'Alamat Tamu66', '081200000066', 'Guru7', 'Menghadiri acara sekolah', NULL),
	('67', '2024-10-05', 'Tamu67', 'Alamat Tamu67', '081200000067', 'Guru8', 'Menghadiri acara sekolah', NULL),
	('68', '2024-10-05', 'Tamu68', 'Alamat Tamu68', '081200000068', 'Guru9', 'Menghadiri acara sekolah', NULL),
	('69', '2024-10-05', 'Tamu69', 'Alamat Tamu69', '081200000069', 'Guru10', 'Menghadiri acara sekolah', NULL),
	('7', '2024-10-05', 'Tamu7', 'Alamat Tamu7', '081200000007', 'Guru8', 'Menghadiri acara sekolah', NULL),
	('70', '2024-10-05', 'Tamu70', 'Alamat Tamu70', '081200000070', 'Guru1', 'Menghadiri acara sekolah', NULL),
	('71', '2024-10-05', 'Tamu71', 'Alamat Tamu71', '081200000071', 'Guru2', 'Menghadiri acara sekolah', NULL),
	('72', '2024-10-05', 'Tamu72', 'Alamat Tamu72', '081200000072', 'Guru3', 'Menghadiri acara sekolah', NULL),
	('73', '2024-10-05', 'Tamu73', 'Alamat Tamu73', '081200000073', 'Guru4', 'Menghadiri acara sekolah', NULL),
	('74', '2024-10-05', 'Tamu74', 'Alamat Tamu74', '081200000074', 'Guru5', 'Menghadiri acara sekolah', NULL),
	('75', '2024-10-05', 'Tamu75', 'Alamat Tamu75', '081200000075', 'Guru6', 'Menghadiri acara sekolah', NULL),
	('76', '2024-10-05', 'Tamu76', 'Alamat Tamu76', '081200000076', 'Guru7', 'Menghadiri acara sekolah', NULL),
	('77', '2024-10-05', 'Tamu77', 'Alamat Tamu77', '081200000077', 'Guru8', 'Menghadiri acara sekolah', NULL),
	('78', '2024-10-05', 'Tamu78', 'Alamat Tamu78', '081200000078', 'Guru9', 'Menghadiri acara sekolah', NULL),
	('79', '2024-10-05', 'Tamu79', 'Alamat Tamu79', '081200000079', 'Guru10', 'Menghadiri acara sekolah', NULL),
	('8', '2024-10-05', 'Tamu8', 'Alamat Tamu8', '081200000008', 'Guru9', 'Menghadiri acara sekolah', NULL),
	('80', '2024-10-05', 'Tamu80', 'Alamat Tamu80', '081200000080', 'Guru1', 'Menghadiri acara sekolah', NULL),
	('81', '2024-10-05', 'Tamu81', 'Alamat Tamu81', '081200000081', 'Guru2', 'Menghadiri acara sekolah', NULL),
	('82', '2024-10-05', 'Tamu82', 'Alamat Tamu82', '081200000082', 'Guru3', 'Menghadiri acara sekolah', NULL),
	('83', '2024-10-05', 'Tamu83', 'Alamat Tamu83', '081200000083', 'Guru4', 'Menghadiri acara sekolah', NULL),
	('84', '2024-10-05', 'Tamu84', 'Alamat Tamu84', '081200000084', 'Guru5', 'Menghadiri acara sekolah', NULL),
	('85', '2024-10-05', 'Tamu85', 'Alamat Tamu85', '081200000085', 'Guru6', 'Menghadiri acara sekolah', NULL),
	('86', '2024-10-05', 'Tamu86', 'Alamat Tamu86', '081200000086', 'Guru7', 'Menghadiri acara sekolah', NULL),
	('87', '2024-10-05', 'Tamu87', 'Alamat Tamu87', '081200000087', 'Guru8', 'Menghadiri acara sekolah', NULL),
	('88', '2024-10-05', 'Tamu88', 'Alamat Tamu88', '081200000088', 'Guru9', 'Menghadiri acara sekolah', NULL),
	('89', '2024-10-05', 'Tamu89', 'Alamat Tamu89', '081200000089', 'Guru10', 'Menghadiri acara sekolah', NULL),
	('9', '2024-10-05', 'Tamu9', 'Alamat Tamu9', '081200000009', 'Guru10', 'Menghadiri acara sekolah', NULL),
	('90', '2024-10-05', 'Tamu90', 'Alamat Tamu90', '081200000090', 'Guru1', 'Menghadiri acara sekolah', NULL),
	('91', '2024-10-05', 'Tamu91', 'Alamat Tamu91', '081200000091', 'Guru2', 'Menghadiri acara sekolah', NULL),
	('92', '2024-10-05', 'Tamu92', 'Alamat Tamu92', '081200000092', 'Guru3', 'Menghadiri acara sekolah', NULL),
	('93', '2024-10-05', 'Tamu93', 'Alamat Tamu93', '081200000093', 'Guru4', 'Menghadiri acara sekolah', NULL),
	('94', '2024-10-05', 'Tamu94', 'Alamat Tamu94', '081200000094', 'Guru5', 'Menghadiri acara sekolah', NULL),
	('95', '2024-10-05', 'Tamu95', 'Alamat Tamu95', '081200000095', 'Guru6', 'Menghadiri acara sekolah', NULL),
	('96', '2024-10-05', 'Tamu96', 'Alamat Tamu96', '081200000096', 'Guru7', 'Menghadiri acara sekolah', NULL),
	('97', '2024-10-05', 'Tamu97', 'Alamat Tamu97', '081200000097', 'Guru8', 'Menghadiri acara sekolah', NULL),
	('98', '2024-10-05', 'Tamu98', 'Alamat Tamu98', '081200000098', 'Guru9', 'Menghadiri acara sekolah', NULL),
	('99', '2024-10-05', 'Tamu99', 'Alamat Tamu99', '081200000099', 'Guru10', 'Menghadiri acara sekolah', NULL),
	('zt001', '2024-09-24', 'Jeanne D Arc', 'Fuyuki Jepang', '12345', 'Master', 'Cawan Suci', NULL),
	('zt002', '2024-09-25', 'Arturia Pendragon', 'Camelot', '+69', 'Emiya  Kiritsugu', 'Cawan Suci', NULL),
	('zt003', '2024-09-25', 'Arturia Pendragon', 'Fuyuki Jepang', '+69', 'Emiya  Kiritsugu', 'Cawan Suci', NULL),
	('zt004', '2024-10-09', 'Aigis', 'Persona 3 Reload', '3', 'Makoto Yuki', 'Bantai Shadow', ''),
	('zt005', '2024-10-09', 'Yuuki', 'Persona 3 Reload', '3', 'Aigis', 'Bantai Shadow', '6705f94d62ae7_1011897 (1).jpeg'),
	('zt006', '2024-10-09', 'Ame', 'Cugenang', '0895808747030', 'Deri', 'Miaw Miaw', ''),
	('zt007', '2024-10-09', 'Ame Chan', 'Sidoarjo', '0895808747030', 'Deri', 'Miaw Miaw', '6705ff00c29f4__10a70d6c-e946-4c9f-bbb6-287ad94d6ca6.jpeg'),
	('zt008', '2024-10-09', 'Aigis', 'Persona 3 Reload Fes And PP And Reload', '123123123123', 'Makoto Yuki', 'Bantai Nynx', ''),
	('zt009', '2024-10-09', 'Aigis', 'Persona 3 Reload Fes And PP And Reload', '123123123123', 'Makoto Yuki', 'Bantai Nynx', '670600a2c2a5c_843948.png'),
	('zt010', '2024-10-09', 'Raphael', 'Renaissance', '12312', 'Leonardo', 'Lukis art', '670600d840b03_Raphael.jpeg'),
	('zt011', '2024-10-09', 'Kakang', 'Sand Chicken', '123', 'Burger Bangor', 'Menikah', '6706015de3db6_Persona 3 pc v 1.png'),
	('zt012', '2024-10-09', 'Kakang', 'Sidoarjo', '123', 'sss', 'Menikah', '67060a4982870_459753159_542316041656771_7188316109348585577_n.jpg'),
	('zt013', '2024-10-09', 'Test', 'test', '123', 'tes', 'tes', '67060ba8cf1d9_9402378.png'),
	('zt014', '2024-11-04', '123', '123', '123', '123', '123', '672ad493b8cdb_464296901_1084413043366143_2666140367591480106_n.jpg');

-- Dumping structure for table app_bukutamu.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id_category` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `category_description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table app_bukutamu.categories: ~0 rows (approximately)
DELETE FROM `categories`;
INSERT INTO `categories` (`id_category`, `category_name`, `category_description`, `created_at`) VALUES
	(1, 'tupai cantik aseli jawa', 'gak tau njir', '2024-12-22 07:06:22');

-- Dumping structure for table app_bukutamu.expenses
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id_expense` bigint unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `description` text,
  `tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_expense`),
  UNIQUE KEY `id_expense` (`id_expense`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table app_bukutamu.expenses: ~0 rows (approximately)
DELETE FROM `expenses`;

-- Dumping structure for table app_bukutamu.expense_reports
DROP TABLE IF EXISTS `expense_reports`;
CREATE TABLE IF NOT EXISTS `expense_reports` (
  `id_expense_report` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  `total_expenses` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_expense_report`),
  UNIQUE KEY `id_expense_report` (`id_expense_report`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table app_bukutamu.expense_reports: ~0 rows (approximately)
DELETE FROM `expense_reports`;

-- Dumping structure for table app_bukutamu.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_users` varchar(5) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_role` enum('admin','operator') NOT NULL,
  PRIMARY KEY (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table app_bukutamu.users: ~5 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id_users`, `username`, `password`, `user_role`) VALUES
	('2', 'ojan cinta zahran', '$2y$10$KVMrbqgztZ0Xeocg4f4Slu60D6r.qP5coy81oArw8G.oqXeomLhEq', 'operator'),
	('usr01', 'admin123', '$2y$10$aYcYBI9h3hFZkR2SCu0gwOZg9EvLD4/dChCczMeFSXKzUJ3Thu0Oe', 'admin'),
	('usr02', 'admin', '$2y$10$gkPEN8Mbms93KeUAfn5gwuR4LWY1Jz5deLjIQqYbvb6fQuppCG8ru', 'admin'),
	('usr03', 'Hideri', '$2y$10$fXpcTD.bVxDSjlNhWwVgq.spDdHYmfP/Sq81MeCzSN/KkTiTs.Jz2', 'admin'),
	('usr04', 'jeanne', '$2y$10$hB5BBL7n2lESvZH4TuSP7em.KBuimw3z30zSWuaYU.8cwCia6hSoC', 'operator');


-- Dumping database structure for db_cake
DROP DATABASE IF EXISTS `db_cake`;
CREATE DATABASE IF NOT EXISTS `db_cake` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_cake`;

-- Dumping structure for table db_cake.cakes
DROP TABLE IF EXISTS `cakes`;
CREATE TABLE IF NOT EXISTS `cakes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `stock` int NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `imgurl` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_id` int DEFAULT NULL,
  `price_product` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `cakes_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cake.cakes: ~14 rows (approximately)
DELETE FROM `cakes`;
INSERT INTO `cakes` (`id`, `name`, `stock`, `price`, `imgurl`, `created_at`, `updated_at`, `category_id`, `price_product`) VALUES
	(8, 'Kue Smakzie', 100, 20.00, 'assets/cakeImg/flutter.png', '2024-11-05 02:34:56', '2024-11-20 07:44:15', 1, 20.00),
	(9, 'bambang subroto1', 10, 25.00, 'assets/cakeImg/Frieren (1).jpeg', '2024-11-05 10:11:15', '2024-11-11 11:36:46', 3, 20.00),
	(10, 'TEST', 100, 200.00, 'assets/cakeImg/OIP (1).jpg', '2024-11-05 10:12:51', '2024-11-11 11:36:48', 4, 20.00),
	(11, 'Test132', 10, 9.00, 'assets/cakeImg/464296901_1084413043366143_2666140367591480106_n.jpg', '2024-11-05 10:14:44', '2024-11-11 11:36:53', 4, 20.00),
	(14, '13', 32, 123.00, 'assets/cakeImg/flutter.png', '2024-11-05 11:31:25', '2024-11-11 11:36:54', 3, 20.00),
	(15, 'Jeanne', 4, 20.00, 'assets/cakeImg/_10a70d6c-e946-4c9f-bbb6-287ad94d6ca6.jpeg', '2024-11-05 12:29:31', '2024-11-11 13:52:09', 2, 20.00),
	(16, 'nigga', 90, 10.00, 'assets/cakeImg/7725825.jpg', '2024-11-05 12:31:26', '2024-11-11 11:36:55', 2, 20.00),
	(17, 'test', 3, 10.00, 'assets/cakeImg/aigis.jpg', '2024-11-05 15:39:55', '2024-11-11 11:36:55', 1, 20.00),
	(18, 'Amelia', 40, 20.00, 'assets/cakeImg/GYGUk9hasAALEua.jpeg', '2024-11-05 16:59:11', '2024-11-11 11:36:56', 3, 20.00),
	(19, 'bus', 20, 20.00, 'assets/cakeImg/Gambar Desain Media Sosial Demokrasi Hari Internasional _ PSD Unduhan Gratis - Pikbest.jpg', '2024-11-06 14:50:18', '2024-11-11 11:36:56', 4, 20.00),
	(20, 'Ali', 20, 5.00, 'assets/cakeImg/Prabowo Presiden Indonesia Maju.jpg', '2024-11-07 03:13:05', '2024-11-11 11:36:57', 3, 20.00),
	(22, 'puding coklat pak hambali', 5967, 69.00, 'assets/cakeImg/JerriGame.png', '2024-11-07 06:42:52', '2024-11-11 13:52:19', 4, 10.00),
	(26, 'Dewa19', 5, 100.00, 'assets/cakeImg/a177b986cc2b2648d3faa7a6eb44576e.jpg', '2024-11-08 03:06:53', '2024-11-20 07:43:35', 4, 20.00),
	(30, 'Dasi', 10, 50.00, 'assets/cakeImg/WhatsApp Image 2024-11-09 at 13.08.55_f27eb407.jpg', '2024-11-11 11:41:38', '2024-11-11 11:58:56', 1, 40.00);

-- Dumping structure for table db_cake.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cake.category: ~7 rows (approximately)
DELETE FROM `category`;
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Kue Balok'),
	(2, 'Kue Bolu'),
	(3, 'Kue Lapis Talas'),
	(4, 'Brownies'),
	(9, 'Frieren'),
	(10, 'JKT48'),
	(13, 'test');

-- Dumping structure for table db_cake.sales
DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cake_id` int NOT NULL,
  `quantity` int NOT NULL,
  `discount` decimal(10,2) DEFAULT '0.00',
  `total_price` decimal(10,2) NOT NULL,
  `payment_method` enum('cash','rek') NOT NULL,
  `pembeli` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `buy_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cake_id` (`cake_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`cake_id`) REFERENCES `cakes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cake.sales: ~9 rows (approximately)
DELETE FROM `sales`;
INSERT INTO `sales` (`id`, `cake_id`, `quantity`, `discount`, `total_price`, `payment_method`, `pembeli`, `created_at`, `buy_date`) VALUES
	(13, 15, 1, 0.00, 20.00, 'rek', 'Jawa', '2024-11-06', '2024-11-14'),
	(16, 22, 2, 0.00, 138.00, 'rek', 'Arya', '2024-11-07', '2024-11-22'),
	(17, 22, 1000, 6900.00, 69000.00, 'cash', 'Arya', '2024-11-07', '2024-11-30'),
	(18, 8, 10, 0.00, 200.00, 'cash', '123', '2024-11-08', '2024-11-15'),
	(19, 26, 10, 100.00, 1000.00, 'cash', 'Arya', '2024-11-08', '2024-11-23'),
	(22, 30, 10, 0.00, 500.00, 'cash', '1', '2024-11-11', '2024-11-21'),
	(23, 8, 21, 0.00, 420.00, 'cash', '1', '2024-11-11', '2024-11-14'),
	(24, 8, 13, 0.00, 260.00, 'cash', '123', '2024-11-12', '2024-11-15'),
	(25, 26, 5, 0.00, 500.00, 'rek', 'Arya', '2024-11-20', '2024-11-22');

-- Dumping structure for table db_cake.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cake.users: ~3 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
	(8, 'admin', '$2y$10$z.kY1loOLUiW2vqicYcHhuec7VglCl0JxTf7Xv9GRXdblfvQowjnS', '2024-11-05 16:47:10'),
	(10, 'jeanne123', '$2y$10$a7VMoJGGm578Vmpr1RvQF..K9IFwWx./7PzPOViYCuMn5CH30kVbe', '2024-11-06 00:35:42'),
	(17, '123', '$2y$10$.hanKEXU7OlimpXMh66oYeF4vmapH8WThhG.up1UW.FHyuFYhAbze', '2024-11-09 13:38:17');


-- Dumping database structure for db_food
DROP DATABASE IF EXISTS `db_food`;
CREATE DATABASE IF NOT EXISTS `db_food` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_food`;

-- Dumping structure for table db_food.cart
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id_cart` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cart`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_food.cart: ~2 rows (approximately)
DELETE FROM `cart`;
INSERT INTO `cart` (`id_cart`, `id_user`, `created_at`) VALUES
	(1, 1, '2024-11-17 00:20:27'),
	(2, 2, '2024-11-17 00:20:27');

-- Dumping structure for table db_food.cart_items
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id_cart_item` int NOT NULL AUTO_INCREMENT,
  `id_cart` int DEFAULT NULL,
  `id_food` int DEFAULT NULL,
  `jumlah` int NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_cart_item`),
  KEY `id_cart` (`id_cart`),
  KEY `id_food` (`id_food`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`id_cart`) REFERENCES `cart` (`id_cart`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`id_food`) REFERENCES `foods` (`id_food`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_food.cart_items: ~0 rows (approximately)
DELETE FROM `cart_items`;
INSERT INTO `cart_items` (`id_cart_item`, `id_cart`, `id_food`, `jumlah`, `total_harga`) VALUES
	(6, 2, 6, 3, 30000.00);

-- Dumping structure for table db_food.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `nama_category` varchar(255) NOT NULL,
  `deskripsi` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_food.categories: ~3 rows (approximately)
DELETE FROM `categories`;
INSERT INTO `categories` (`id_category`, `nama_category`, `deskripsi`, `created_at`) VALUES
	(1, 'Makanan Pembuka', 'Aneka makanan pembuka', '2024-11-17 00:20:04'),
	(2, 'Makanan Utama', 'Aneka makanan utama', '2024-11-17 00:20:04'),
	(3, 'Minuman', 'Aneka minuman', '2024-11-17 00:20:04');

-- Dumping structure for table db_food.foods
DROP TABLE IF EXISTS `foods`;
CREATE TABLE IF NOT EXISTS `foods` (
  `id_food` int NOT NULL AUTO_INCREMENT,
  `nama_food` varchar(255) NOT NULL,
  `deskripsi` text,
  `harga` decimal(10,2) NOT NULL,
  `rating` decimal(3,2) DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_food`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_food.foods: ~3 rows (approximately)
DELETE FROM `foods`;
INSERT INTO `foods` (`id_food`, `nama_food`, `deskripsi`, `harga`, `rating`, `id_category`, `image_path`, `created_at`) VALUES
	(4, 'Spring Rolls', 'Spring rolls dengan saus spesial', 25000.00, 4.50, 1, 'path/to/image1.jpg', '2024-11-17 00:20:18'),
	(5, 'Burger', 'Burger daging sapi dengan keju', 50000.00, 4.70, 2, 'path/to/image2.jpg', '2024-11-17 00:20:18'),
	(6, 'Cola', 'Minuman soda berkarbonasi', 10000.00, 4.00, 3, 'path/to/image3.jpg', '2024-11-17 00:20:18');

-- Dumping structure for table db_food.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','shipped','completed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_order`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_food.orders: ~6 rows (approximately)
DELETE FROM `orders`;
INSERT INTO `orders` (`id_order`, `id_user`, `total_harga`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 100000.00, 'pending', '2024-11-17 00:21:01', '2024-11-17 00:21:01'),
	(2, 2, 30000.00, 'completed', '2024-11-17 00:21:01', '2024-11-17 00:21:01'),
	(3, 1, 100000.00, 'pending', '2024-11-17 01:11:12', '2024-11-17 01:11:12'),
	(4, 1, 50000.00, 'pending', '2024-11-17 01:18:53', '2024-11-17 01:18:53'),
	(5, 1, 10.00, 'pending', '2024-11-18 01:49:40', '2024-11-18 01:49:40'),
	(6, 1, 101.00, 'completed', '2024-11-18 01:51:16', '2024-11-18 01:51:16');

-- Dumping structure for table db_food.order_items
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id_order_item` int NOT NULL AUTO_INCREMENT,
  `id_order` int DEFAULT NULL,
  `id_food` int DEFAULT NULL,
  `jumlah` int NOT NULL,
  `harga_per_item` decimal(10,2) NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_order_item`),
  KEY `id_order` (`id_order`),
  KEY `id_food` (`id_food`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`id_food`) REFERENCES `foods` (`id_food`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_food.order_items: ~5 rows (approximately)
DELETE FROM `order_items`;
INSERT INTO `order_items` (`id_order_item`, `id_order`, `id_food`, `jumlah`, `harga_per_item`, `total_harga`) VALUES
	(4, 1, 4, 2, 25000.00, 50000.00),
	(5, 1, 5, 1, 50000.00, 50000.00),
	(6, 2, 6, 3, 10000.00, 30000.00),
	(7, 1, 4, 2, 25000.00, 50000.00),
	(8, 4, 4, 2, 25000.00, 50000.00);

-- Dumping structure for table db_food.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` text,
  `telepon` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_food.users: ~13 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id_user`, `nama`, `email`, `password`, `alamat`, `telepon`, `created_at`) VALUES
	(1, 'John Doe', 'john@example.com', '$2b$10$abcdefghijklmnopqrstuv', '123 Main St', '08123456789', '2024-11-17 00:18:31'),
	(2, 'Jane Smith', 'jane@example.com', '$2b$10$abcdefghijklmnopqrstuv', '456 Maple Ave', '08129876543', '2024-11-17 00:18:31'),
	(4, 'risu', 'risu@example.com', '$2b$10$rU2it0T2.D57xQM.5ZazdencouxjjybVpKTaOZhECtMUqbW.f0qsm', '123 Main St', '08123456789', '2024-11-17 00:53:30'),
	(5, 'aigis', 'aigis@example.com', '$2b$10$oVEQ/nrYycOHy/NPCMryiudTT.LhByI8EqpIIZ5WG.5OLVwyO2Lte', 'Example Address', '123456789', '2024-11-17 01:51:57'),
	(6, 'ame', 'ame', '$2b$10$QDw6R6R8b1Mymb4Qq.wniuj02Y5VR98g4CCI6Ay0w0Xfvz6726iu6', 'Example Address', '123456789', '2024-11-17 01:55:39'),
	(7, 'test', 'test@gmail.com', '$2b$10$WsrmJvMVdL4d04twJvPqUO30bCbZ6HmhcUFc0ngGAhVrQx1N1InNq', 'teset', '123', '2024-11-18 12:18:35'),
	(9, '', '', '$2b$10$VGyGXU013zpbQd2.gKAqTeLyCkfdXg0E/lChIMj/I5mn4k0xboFIq', '', '', '2024-11-18 12:26:58'),
	(10, 'risu', 'risu@gmail.com', '$2b$10$0AjNgjiDoi4h2vJohOehfu/9XeG9hlazO6D.ltFFP64Zn6lbkQAnu', 'risu', '123', '2024-11-18 12:28:52'),
	(13, '123', '123', '$2b$10$Ty0B0XXno4P1zXS6nwPCceRFRjvsmNP1v4d5yuG/0JS9eRY3cPsH2', '123', '123', '2024-11-18 12:37:45'),
	(14, '111', '111', '$2b$10$Si8lEmQjZBr.3iAn.kpWy.jXnq3Hi7MVjTnYbEJ78WFB2NCdasGiW', '111', '111', '2024-11-18 12:47:40'),
	(15, 'aegis', 'aegis@gmail.com', '$2b$10$QoZNCeV4jqeR6VaA7C2ZIuB5fwEL3gtzMj0b7EwFwWqytERo/GqqS', 'persona 3 reload meren', '+79', '2024-11-18 12:52:22'),
	(16, 'test', 'test@example.com', '$2b$10$s6.C585B2LUsA7RA2xuziOH5WjbfXQDNFe5kl6MyOb6ac6d00akYe', 'cianjur', '12313', '2024-11-19 00:32:14'),
	(17, 'aigis', 'aigis@gmail.com', '$2b$10$gAlZgHKELDcUl.Km3twDc..h1WvjobW5JlKwJ3Sb4Gx5TciyEVLFu', 'persona 3', '123', '2024-11-19 06:26:04');


-- Dumping database structure for db_perpustakaan
DROP DATABASE IF EXISTS `db_perpustakaan`;
CREATE DATABASE IF NOT EXISTS `db_perpustakaan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_perpustakaan`;

-- Dumping structure for table db_perpustakaan.activity_logs
DROP TABLE IF EXISTS `activity_logs`;
CREATE TABLE IF NOT EXISTS `activity_logs` (
  `id_activity_logs` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `activity_type` enum('borrow','return','add','remove','update') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_books` int DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_activity_logs`),
  KEY `id_books` (`id_books`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`id_books`) REFERENCES `books` (`id_books`),
  CONSTRAINT `activity_logs_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_perpustakaan.activity_logs: ~64 rows (approximately)
DELETE FROM `activity_logs`;
INSERT INTO `activity_logs` (`id_activity_logs`, `id_user`, `activity_type`, `id_books`, `timestamp`) VALUES
	(31, 3, 'borrow', 10, '2024-10-20 11:19:28'),
	(32, 3, 'add', 11, '2024-10-20 11:19:34'),
	(33, 3, 'add', 13, '2024-10-20 11:19:39'),
	(34, 3, 'add', 14, '2024-10-20 11:19:45'),
	(35, 3, 'add', 15, '2024-10-20 11:19:49'),
	(36, 3, 'add', 17, '2024-10-20 11:19:53'),
	(37, 3, 'borrow', 11, '2024-10-20 11:20:03'),
	(38, 3, 'borrow', 13, '2024-10-20 11:20:03'),
	(39, 3, 'borrow', 14, '2024-10-20 11:20:03'),
	(40, 3, 'borrow', 15, '2024-10-20 11:20:03'),
	(41, 3, 'borrow', 17, '2024-10-20 11:20:03'),
	(42, 3, 'remove', 11, '2024-10-20 11:20:03'),
	(43, 3, 'remove', 13, '2024-10-20 11:20:03'),
	(44, 3, 'remove', 14, '2024-10-20 11:20:03'),
	(45, 3, 'remove', 15, '2024-10-20 11:20:03'),
	(46, 3, 'remove', 17, '2024-10-20 11:20:03'),
	(48, 3, 'return', 8, '2024-10-21 07:41:51'),
	(49, 3, 'add', 8, '2024-10-21 07:42:07'),
	(50, 3, 'add', 28, '2024-10-21 07:42:15'),
	(51, 3, 'borrow', 8, '2024-10-21 07:42:19'),
	(52, 3, 'borrow', 28, '2024-10-21 07:42:19'),
	(53, 3, 'remove', 8, '2024-10-21 07:42:19'),
	(54, 3, 'remove', 28, '2024-10-21 07:42:19'),
	(55, 3, 'return', 9, '2024-10-21 11:32:16'),
	(56, 3, 'return', 12, '2024-10-21 11:32:32'),
	(57, 3, 'return', 16, '2024-10-21 11:32:37'),
	(58, 3, 'add', 9, '2024-10-21 11:32:45'),
	(59, 3, 'add', 12, '2024-10-21 11:32:51'),
	(60, 3, 'borrow', 9, '2024-10-21 11:32:58'),
	(61, 3, 'borrow', 12, '2024-10-21 11:32:58'),
	(62, 3, 'remove', 9, '2024-10-21 11:32:58'),
	(63, 3, 'remove', 12, '2024-10-21 11:32:58'),
	(64, 3, 'add', 29, '2024-10-21 12:13:59'),
	(65, 3, 'borrow', 29, '2024-10-21 12:14:05'),
	(66, 3, 'remove', 29, '2024-10-21 12:14:05'),
	(67, 3, 'return', 29, '2024-10-21 12:14:20'),
	(68, 3, 'return', 8, '2024-10-26 18:50:50'),
	(69, 3, 'add', 8, '2024-10-26 18:51:29'),
	(70, 3, 'return', 13, '2024-10-26 19:16:19'),
	(71, 3, 'return', 8, '2024-10-26 19:31:31'),
	(72, 3, 'borrow', 8, '2024-10-26 19:31:49'),
	(73, 3, 'remove', 8, '2024-10-26 19:31:49'),
	(74, 3, 'add', 29, '2024-10-26 19:31:58'),
	(75, 3, 'add', 29, '2024-10-26 19:35:13'),
	(76, 13, 'add', 8, '2024-10-26 20:38:14'),
	(77, 13, 'add', 9, '2024-10-26 20:38:17'),
	(78, 13, 'add', 10, '2024-10-26 20:38:21'),
	(79, 13, 'add', 11, '2024-10-26 20:38:24'),
	(80, 13, 'borrow', 8, '2024-10-26 20:38:26'),
	(81, 13, 'borrow', 9, '2024-10-26 20:38:26'),
	(82, 13, 'borrow', 10, '2024-10-26 20:38:26'),
	(83, 13, 'borrow', 11, '2024-10-26 20:38:26'),
	(84, 13, 'remove', 8, '2024-10-26 20:38:26'),
	(85, 13, 'remove', 9, '2024-10-26 20:38:26'),
	(86, 13, 'remove', 10, '2024-10-26 20:38:27'),
	(87, 13, 'remove', 11, '2024-10-26 20:38:27'),
	(88, 13, 'return', 8, '2024-10-26 22:01:14'),
	(89, 13, 'return', 9, '2024-10-26 22:01:19'),
	(90, 13, 'borrow', 9, '2024-11-19 08:29:49'),
	(91, 13, 'return', 9, '2024-11-19 08:29:59'),
	(92, 14, 'add', 8, '2024-11-19 08:43:13'),
	(93, 14, 'borrow', 8, '2024-11-19 08:43:25'),
	(94, 14, 'remove', 8, '2024-11-19 08:43:25'),
	(95, 14, 'return', 8, '2024-11-19 08:43:54');

-- Dumping structure for table db_perpustakaan.activity_reports
DROP TABLE IF EXISTS `activity_reports`;
CREATE TABLE IF NOT EXISTS `activity_reports` (
  `id_activity_reports` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_books` int DEFAULT NULL,
  `activity_date` date DEFAULT NULL,
  PRIMARY KEY (`id_activity_reports`),
  KEY `id_user` (`id_user`),
  KEY `id_books` (`id_books`),
  CONSTRAINT `activity_reports_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `activity_reports_ibfk_2` FOREIGN KEY (`id_books`) REFERENCES `books` (`id_books`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_perpustakaan.activity_reports: ~0 rows (approximately)
DELETE FROM `activity_reports`;

-- Dumping structure for table db_perpustakaan.books
DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id_books` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `synopsis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cover_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `book_date` date NOT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `is_favorite` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_books`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_perpustakaan.books: ~13 rows (approximately)
DELETE FROM `books`;
INSERT INTO `books` (`id_books`, `title`, `author`, `synopsis`, `cover_path`, `book_date`, `is_read`, `is_favorite`) VALUES
	(8, 'Kaiju no 8', 'Naoya Matsumoto', 'Kafka Hibino menjalani kehidupan membosankan sebagai anggota tim pembersih setelah serangan monster raksasa (kaiju). Meski bercita-cita masuk Pasukan Pertahanan, umurnya yang tak lagi muda membuatnya tak berani mengejar mimpi itu. Namun, hidupnya berubah ketika dia secara misterius berubah menjadi kaiju. Dengan kekuatan monster di tubuhnya, Kafka memutuskan untuk bergabung dengan Pasukan Pertahanan sambil menyembunyikan identitasnya yang berbahaya. Cerita ini mengikuti perjuangan Kafka untuk mengendalikan kekuatannya dan melindungi orang-orang yang dicintainya dari ancaman kaiju lain.', '6713606513377_kaiju no 8.jpg', '2024-10-19', 0, 0),
	(9, 'Dandadan', 'Yukinobu Tatsu', 'Momo Ayase adalah seorang gadis yang percaya pada hantu, sedangkan teman sekelasnya, Okarun, yakin bahwa alien itu nyata. Saat mereka bertengkar mengenai keberadaan entitas supernatural, mereka setuju untuk membuktikan kebenaran satu sama lain. Namun, situasi berubah menjadi kacau ketika mereka berdua benar-benar menghadapi hantu dan alien di dunia nyata. Momo dan Okarun akhirnya terlibat dalam serangkaian kejadian aneh, penuh aksi, humor, dan romansa. Manga ini menyajikan kombinasi menarik antara elemen horor, fiksi ilmiah, dan kejenakaan sehari-hari.', '671361430d691_dandadan.jpg', '2024-10-19', 0, 0),
	(10, 'Panorama of Hell', 'Hideshi Hino', 'Berpusat pada seorang seniman yang terobsesi dengan darahnya sendiri, manga ini menggambarkan perjalanan pribadi seniman tersebut ke dalam dunia kelam yang dipenuhi penderitaan dan trauma masa lalunya. Karya seninya, yang terbuat dari darah, menciptakan gambaran mengerikan tentang neraka, yang mencerminkan rasa sakit batin yang dia alami. Sepanjang manga ini, pembaca dibawa menyelami pikiran seniman tersebut, menelusuri masa lalunya yang penuh dengan tragedi dan kekerasan, serta bagaimana trauma itu terus menghantuinya hingga hari ini.', '67136164235c5_paranormal.jpg', '2024-10-19', 0, 0),
	(11, 'Stitches', 'Junji Ito dan Hirokatsu Kihara', 'Dibuat oleh maestro horor Junji Ito dan penulis misteri Hirokatsu Kihara, Stitches adalah antologi cerita pendek yang mengambil inspirasi dari misteri-misteri nyata yang belum terpecahkan. Setiap cerita membawa pembaca ke dunia yang dipenuhi dengan ketakutan, di mana setiap petunjuk mengarah pada kengerian yang tak terbayangkan. Cerita-cerita ini tidak hanya membuat pembaca takut, tetapi juga menimbulkan rasa penasaran yang mendalam terhadap misteri yang melatarbelakanginya. Stitches adalah salah satu manga horor yang menghadirkan atmosfer menakutkan dengan cara yang unik dan tak terduga.', '67136179a19e5_junji ito.jpg', '2024-10-19', 0, 0),
	(12, 'One Piece', 'Eiichiro Oda', 'Luffy dan kru Topi Jerami melanjutkan perjalanan mereka untuk menemukan harta karun legendaris, One Piece, yang diyakini akan membuat pemiliknya menjadi Raja Bajak Laut. Di arc terbaru, Luffy menghadapi kekuatan terkuat di Grand Line dan mengungkap misteri dunia, termasuk sejarah D. dan Rahasia Poneglyph. Sementara itu, kru Topi Jerami terus berhadapan dengan ancaman besar dari pemerintah dunia dan Yonko, penguasa lautan. Petualangan ini penuh dengan aksi, persahabatan, dan humor, serta pesan-pesan tentang kebebasan dan impian.', '6713619b6c24a_one piece.jpg', '2024-10-19', 0, 0),
	(13, 'Spy X Family', 'Tatsuya Endo', 'Loid Forger, alias Twilight, adalah mata-mata elit yang diberi misi untuk menyusup ke sekolah elit di negara musuh. Untuk itu, dia membangun keluarga palsu dengan mengadopsi seorang gadis kecil bernama Anya, yang memiliki kemampuan membaca pikiran, dan menikahi Yor, seorang pembunuh bayaran yang merahasiakan identitasnya. Meski misi ini penuh dengan intrik, hal-hal yang tidak terduga terjadi saat keluarga palsu ini perlahan-lahan mulai merasa seperti keluarga sungguhan. Setiap anggota keluarga memiliki rahasia yang tak diketahui oleh yang lain, menciptakan situasi yang penuh dengan humor dan ketegangan.', '671361b5112e0_spy x family.jpg', '2024-10-19', 0, 0),
	(14, 'Jujutsu Kaisen', 'Gege Akutami', 'Yuji Itadori, seorang siswa SMA biasa, tiba-tiba terjerat dalam dunia ilmu kutukan ketika dia menelan jari terkutuk milik Ryoumen Sukuna, Raja Kutukan. Untuk mencegah kehancuran dunia, Yuji bergabung dengan Sekolah Jujutsu untuk mengendalikan kutukan yang ada di dalam dirinya. Di sekolah, dia belajar cara menghadapi makhluk-makhluk kutukan yang menyerang manusia. Sepanjang perjalanan, Yuji dan teman-temannya terlibat dalam pertempuran sengit melawan para pengguna kutukan yang ingin menguasai dunia dengan kekuatan jahat.', '671361e9ba507_jjk.jpg', '2024-10-19', 0, 0),
	(15, 'Boku No Hero Academia', 'Horikoshi Kohei', 'Di dunia di mana hampir semua orang memiliki kekuatan super yang disebut Quirk, Izuku Midoriya adalah salah satu dari sedikit orang yang terlahir tanpa kekuatan. Namun, setelah bertemu dengan pahlawan nomor satu, All Might, Midoriya diberikan kekuatan Quirk terkuat, One For All. Dengan kekuatan ini, Midoriya bergabung dengan Akademi U.A., sekolah khusus bagi para calon pahlawan. Cerita ini mengikuti perjalanannya menjadi pahlawan pro dan perjuangan melawan Liga Penjahat yang dipimpin oleh Tomura Shigaraki, yang memiliki ambisi menghancurkan masyarakat pahlawan.', '6713620ad36fc_bnha.jpg', '2024-10-19', 0, 0),
	(16, 'Tokyo Revengers', 'Wakui Ken', 'Takemichi Hanagaki, seorang pria berusia 26 tahun, mendapati hidupnya berantakan setelah kematian mantan pacarnya, Hinata. Secara misterius, dia kembali ke masa lalu saat dia masih remaja, tepat sebelum dirinya bergabung dengan geng Tokyo Manji. Dengan pengetahuannya tentang masa depan, Takemichi bertekad untuk mengubah sejarah dan menyelamatkan Hinata dari nasib tragisnya. Sepanjang manga ini, Takemichi terlibat dalam pertempuran antara geng-geng jalanan yang penuh dengan pengkhianatan, kekerasan, dan persahabatan yang diuji waktu.', '6713622228c0c_tokyo revengers.jpg', '2024-10-19', 0, 0),
	(17, 'Oshi No Ko', 'Aka Akasaka', 'Aqua dan Ruby adalah anak kembar dari seorang idol terkenal, Ai Hoshino, yang secara misterius dibunuh. Keduanya terlahir kembali dengan memori kehidupan mereka sebelumnya, dan mereka memutuskan untuk mengejar impian masing-masing di dunia hiburan sambil mencoba mengungkap siapa yang bertanggung jawab atas kematian ibu mereka. Manga ini mengeksplorasi sisi gelap industri hiburan Jepang, dari tekanan terhadap para idol hingga manipulasi media, serta bagaimana Aqua dan Ruby menghadapi trauma dan misteri di balik kehidupan mereka.', '671362351c212_oshi no ko.jpg', '2024-10-19', 0, 0),
	(28, 'Furry', 'Ridho', 'RIdho Suka Furry', '6714fcaa8727e_c4cde5e0-0646-475b-b5ff-2cce6f9cda86.jpg', '2024-10-20', 0, 0),
	(29, '10 Dosa besar Soeharto', 'JOKOWI', 'Masih Nanya', '6715c8004e0b0_7725825.jpg', '2024-10-21', 0, 0),
	(31, 'Pemrograman Web Berbasis HTML 5, PHP, Dan JavaScript', 'Edy Winarno ST, M.Eng, Ali Zaki & SmitDev Community', 'Buku ini menjelaskan cara melakukan pemrograman web dengan mudah memakai 3 bahasa pemrograman pokok, yaitu HTML5, PHP, dan JavaScript. Anda akan belajar bagaimana memanfaatkan HTML5 sebagai antarmuka awal, selanjutnya mengenal PHP untuk memberikan kemampuan pengolahan data client-server di web, lalu menggunakan JavaScript untuk memberikan sentuhan dinamis. Setiap penjelasan dilengkapi dengan contoh program dan di bagian akhir ditutup dengan pembuatan program yang melibatkan ketiganya. *Bonus pada buku fisik (CD, voucher, pembatas buku) tidak disertakan dalam buku digital (e-book)', 'http://books.google.com/books/content?id=YuVyDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', '2024-12-10', 0, 0);

-- Dumping structure for table db_perpustakaan.borrows
DROP TABLE IF EXISTS `borrows`;
CREATE TABLE IF NOT EXISTS `borrows` (
  `id_borrows` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_books` int NOT NULL,
  `borrow_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `status` enum('borrowed','returned') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'borrowed',
  `is_read` tinyint(1) DEFAULT '0',
  `is_favorite` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_borrows`),
  KEY `id_books` (`id_books`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`id_books`) REFERENCES `books` (`id_books`),
  CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_perpustakaan.borrows: ~23 rows (approximately)
DELETE FROM `borrows`;
INSERT INTO `borrows` (`id_borrows`, `id_user`, `id_books`, `borrow_date`, `return_date`, `status`, `is_read`, `is_favorite`) VALUES
	(12, 3, 17, '2024-10-19', '2024-10-19', 'returned', 0, 0),
	(22, 3, 8, '2024-10-19', '2024-10-21', 'returned', 1, 0),
	(23, 3, 9, '2024-10-19', '2024-10-21', 'returned', 1, 0),
	(24, 3, 12, '2024-10-19', '2024-10-21', 'returned', 1, 0),
	(25, 3, 16, '2024-10-19', '2024-10-21', 'returned', 0, 0),
	(29, 3, 10, '2024-10-20', NULL, 'borrowed', 1, 1),
	(30, 3, 11, '2024-10-20', NULL, 'borrowed', 0, 0),
	(31, 3, 13, '2024-10-20', '2024-10-26', 'returned', 0, 0),
	(32, 3, 14, '2024-10-20', NULL, 'borrowed', 0, 0),
	(33, 3, 15, '2024-10-20', NULL, 'borrowed', 0, 0),
	(34, 3, 17, '2024-10-20', NULL, 'borrowed', 0, 0),
	(36, 3, 8, '2024-10-21', '2024-10-26', 'returned', 0, 0),
	(37, 3, 28, '2024-10-21', NULL, 'borrowed', 0, 0),
	(38, 3, 9, '2024-10-21', NULL, 'borrowed', 0, 0),
	(39, 3, 12, '2024-10-21', NULL, 'borrowed', 0, 0),
	(40, 3, 29, '2024-10-21', '2024-10-21', 'returned', 1, 0),
	(41, 3, 8, '2024-10-26', NULL, 'borrowed', 0, 0),
	(42, 13, 8, '2024-10-26', '2024-10-26', 'returned', 0, 0),
	(43, 13, 9, '2024-10-26', '2024-10-26', 'returned', 1, 0),
	(44, 13, 10, '2024-10-26', NULL, 'borrowed', 0, 0),
	(45, 13, 11, '2024-10-26', NULL, 'borrowed', 0, 0),
	(46, 13, 9, '2024-11-19', '2024-11-19', 'returned', 0, 0),
	(47, 14, 8, '2024-11-19', '2024-11-19', 'returned', 0, 0);

-- Dumping structure for table db_perpustakaan.cart
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id_cart` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_books` int DEFAULT NULL,
  PRIMARY KEY (`id_cart`),
  KEY `id_user` (`id_user`),
  KEY `id_books` (`id_books`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`id_books`) REFERENCES `books` (`id_books`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_perpustakaan.cart: ~0 rows (approximately)
DELETE FROM `cart`;

-- Dumping structure for table db_perpustakaan.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('admin','users') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'users',
  `pf_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_perpustakaan.users: ~12 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id_user`, `user_name`, `user_password`, `role`, `pf_img`) VALUES
	(3, 'jeanne', '$2y$10$XeTiaeaTO/.vtDBU8KDjEuFgnY/.8Yi1YEykBm3eQIVE/jtaAMtcS', 'users', '671cecd796d03_GOJ_11vXkAEqz7V.jpeg'),
	(4, 'kafka', '$2y$10$UocbnPoyOCN9.rTVpS0OmODVTzIfZz8NUuOYnwLHjHKpjzJ7SUAhq', 'users', NULL),
	(5, 'test', '$2y$10$Iy5XDW4Zrca8ItMbGh6V/OvykKrx.UVMkRf6V4T5JMX9EqH6Bj7sS', 'admin', ''),
	(6, 'test123', '$2y$10$7UOL8fhxmMGT6Mzncq9zOOK5Vdf76C8SVzkMoweu7TVQaDxsZ8SWO', 'users', '6713f4586012f_843948.png'),
	(7, 'admin123', '$2y$10$gjHUuapscLWmTcqH3PYF/OEO9oEkJUNhM/uJKRYxmYIBk7QQH/l6.', 'admin', ''),
	(8, 'admin', '$2y$10$g0rz5ngshJDn.nHZGeU9DuNALmhELmPmhXHlG134eP1XRVTNhNb0W', 'admin', '6714822d727da_1309920.png'),
	(9, '123', '$2y$10$PsPp0vOvWz9JC/zrw9OO.e04SraiWNKLxLF62wihThYxpezTPGnm.', 'admin', '6714f9bfce4ae_frieren-beyond-journeys-end-vol-1-9781974725762_hr.jpg'),
	(10, 'kafka', '$2y$10$ZcR3w6OtyhrDIJYxkg3q1O4MUJi1L5G5suOBsODFZZJeAgHpwDXWC', 'admin', ''),
	(11, 'abdul', '$2y$10$ySVEFZKcDuvggJW5qRptCuqX7SR2PAC1MJbOBhoEXzI5HkqGZfe26', 'users', NULL),
	(12, 'laravel', '$2y$10$H.DjnJZfe93La/pZb1mSoOD1mWhUuBiJqnIKeHT1YQFfeUz64nzq2', 'users', NULL),
	(13, 'risu', '$2y$10$Jr/62P6Jw1stlTYNFx/2aOa9dKnfXFbR76eOd56FgTc3wG8Y1i942', 'users', '671cf09a671b4_GPKOO5wbMAABsh7.jpeg'),
	(14, 'izal', '$2y$10$msZh7E8/ckLJk06x3RRS9Oq2kX6jfA9KMg3McVcFy/45O9C.MxhS2', 'users', NULL);


-- Dumping database structure for kasmini
DROP DATABASE IF EXISTS `kasmini`;
CREATE DATABASE IF NOT EXISTS `kasmini` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kasmini`;

-- Dumping structure for table kasmini.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id_category` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `category_description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kasmini.categories: ~0 rows (approximately)
DELETE FROM `categories`;

-- Dumping structure for table kasmini.expenses
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id_expense` bigint unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `description` text,
  `tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_expense`),
  UNIQUE KEY `id_expense` (`id_expense`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kasmini.expenses: ~0 rows (approximately)
DELETE FROM `expenses`;

-- Dumping structure for table kasmini.expense_reports
DROP TABLE IF EXISTS `expense_reports`;
CREATE TABLE IF NOT EXISTS `expense_reports` (
  `id_expense_report` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  `total_expenses` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_expense_report`),
  UNIQUE KEY `id_expense_report` (`id_expense_report`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kasmini.expense_reports: ~0 rows (approximately)
DELETE FROM `expense_reports`;

-- Dumping structure for table kasmini.payment_records
DROP TABLE IF EXISTS `payment_records`;
CREATE TABLE IF NOT EXISTS `payment_records` (
  `id_payment_record` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint unsigned DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('cash','transfer') NOT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_payment_record`),
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `payment_records_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id_transaction`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kasmini.payment_records: ~0 rows (approximately)
DELETE FROM `payment_records`;

-- Dumping structure for table kasmini.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id_product` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `unit` int DEFAULT NULL,
  `category_id` bigint unsigned NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_product`),
  UNIQUE KEY `id_product` (`id_product`),
  KEY `fk_product_category` (`category_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kasmini.products: ~0 rows (approximately)
DELETE FROM `products`;

-- Dumping structure for table kasmini.store_settings
DROP TABLE IF EXISTS `store_settings`;
CREATE TABLE IF NOT EXISTS `store_settings` (
  `id_store_setting` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_store_setting`),
  UNIQUE KEY `id_store_setting` (`id_store_setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kasmini.store_settings: ~0 rows (approximately)
DELETE FROM `store_settings`;

-- Dumping structure for table kasmini.transactions
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id_transaction` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `transaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('belum bayar','sudah bayar','dibatalkan') NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `payment_method` enum('cash','transfer') DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT '0.00',
  `tax` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id_transaction`),
  UNIQUE KEY `id_transaction` (`id_transaction`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kasmini.transactions: ~0 rows (approximately)
DELETE FROM `transactions`;

-- Dumping structure for table kasmini.transaction_details
DROP TABLE IF EXISTS `transaction_details`;
CREATE TABLE IF NOT EXISTS `transaction_details` (
  `id_transaction_detail` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id_transaction_detail`),
  UNIQUE KEY `id_transaction_detail` (`id_transaction_detail`),
  KEY `product_id` (`product_id`),
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_product`),
  CONSTRAINT `transaction_details_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id_transaction`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kasmini.transaction_details: ~0 rows (approximately)
DELETE FROM `transaction_details`;

-- Dumping structure for table kasmini.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('kasir','pemilik') NOT NULL,
  `pin` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id_user` (`id_user`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kasmini.users: ~0 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id_user`, `username`, `email`, `password`, `role`, `pin`, `created_at`) VALUES
	(7, 'mumei', 'mumei@gmail.com', '$2b$10$ZSIuBdKHF4T/zEXzaN9tXezhldJgy4WDVUOF32NkFPAFRKW5ShbBW', 'kasir', '123456', '2024-12-26 02:00:58');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
