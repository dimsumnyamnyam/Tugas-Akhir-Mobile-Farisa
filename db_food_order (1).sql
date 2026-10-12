-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 12, 2026 at 01:58 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_food_order`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_pesanan`
--

CREATE TABLE `tb_detail_pesanan` (
  `id_detail` int NOT NULL,
  `id_pesanan` int DEFAULT NULL,
  `id_produk` int DEFAULT NULL,
  `jumlah` int NOT NULL,
  `harga_satuan` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_detail_pesanan`
--

INSERT INTO `tb_detail_pesanan` (`id_detail`, `id_pesanan`, `id_produk`, `jumlah`, `harga_satuan`) VALUES
(1, 14, 1, 2, '15000.00'),
(2, 15, 1, 2, '15000.00'),
(3, 16, 1, 1, '3000.00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_klaim`
--

CREATE TABLE `tb_klaim` (
  `id` int NOT NULL,
  `nama_pemesan` varchar(100) NOT NULL,
  `alasan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_klaim`
--

INSERT INTO `tb_klaim` (`id`, `nama_pemesan`, `alasan`) VALUES
(1, '', ''),
(2, 'farisa ', 'dimsum ya kurang 2 pcs');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id_pesanan` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `metode_pengambilan` enum('pickup','delivery') NOT NULL,
  `koordinat_lokasi` varchar(255) DEFAULT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `status_pesanan` enum('menunggu_konfirmasi','diproses_dapur','siap_pickup','sedang_diantar','selesai') DEFAULT 'menunggu_konfirmasi',
  `waktu_pesan` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id_pesanan`, `id_user`, `metode_pengambilan`, `koordinat_lokasi`, `total_harga`, `status_pesanan`, `waktu_pesan`) VALUES
(3, 1, 'pickup', '-7.69345 , 110.70276', '30000.00', 'menunggu_konfirmasi', '2026-10-05 07:07:30'),
(4, 1, 'pickup', '-7.69345 , 110.70276', '30000.00', 'menunggu_konfirmasi', '2026-10-05 07:07:52'),
(5, 1, 'pickup', '-7.69343 , 110.70275', '30000.00', 'menunggu_konfirmasi', '2026-10-05 07:52:52'),
(6, 1, 'pickup', '-7.69345 , 110.70277', '40000.00', 'menunggu_konfirmasi', '2026-10-05 07:56:10'),
(7, 1, 'pickup', '-7.69345 , 110.70277', '50000.00', 'menunggu_konfirmasi', '2026-10-05 07:58:36'),
(8, 1, 'delivery', '-7.69345 , 110.70277', '50000.00', 'menunggu_konfirmasi', '2026-10-05 07:59:17'),
(9, 1, 'pickup', '-7.71344 , 110.71396', '25000.00', 'menunggu_konfirmasi', '2026-10-05 17:40:36'),
(10, 1, 'pickup', '-7.71344 , 110.71396', '30000.00', 'menunggu_konfirmasi', '2026-10-05 17:45:43'),
(11, 1, 'pickup', '-7.71344 , 110.71396', '30000.00', 'menunggu_konfirmasi', '2026-10-05 17:46:01'),
(12, 1, 'pickup', '-7.71344 , 110.71396', '30000.00', 'menunggu_konfirmasi', '2026-10-05 17:47:04'),
(13, 1, 'pickup', '-7.71344 , 110.71396', '30000.00', 'menunggu_konfirmasi', '2026-10-05 17:49:04'),
(14, 1, 'pickup', '-7.71344 , 110.71396', '30000.00', 'menunggu_konfirmasi', '2026-10-05 17:50:45'),
(15, 1, 'pickup', '-7.71344 , 110.71396', '30000.00', 'menunggu_konfirmasi', '2026-10-05 17:51:12'),
(16, 1, 'pickup', '-7.71344 , 110.71396', '3000.00', 'menunggu_konfirmasi', '2026-10-05 17:51:46'),
(17, 1, 'pickup', '-7.69341 , 110.70278', '30000.00', 'menunggu_konfirmasi', '2026-10-06 03:05:01'),
(18, 1, 'pickup', '-7.69341 , 110.70278', '30000.00', 'menunggu_konfirmasi', '2026-10-06 03:05:29'),
(19, 1, 'delivery', '-7.71331, 110.7161', '27000.00', 'menunggu_konfirmasi', '2026-10-10 15:01:48'),
(20, 1, 'delivery', '-7.71331, 110.7161', '24000.00', 'menunggu_konfirmasi', '2026-10-10 15:19:59'),
(21, 1, 'pickup', '-7.71337, 110.716', '12000.00', 'menunggu_konfirmasi', '2026-10-12 01:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id_produk` int NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `deskripsi` text,
  `harga` decimal(10,2) NOT NULL,
  `stok` int DEFAULT '0',
  `foto_produk` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_produk`
--

INSERT INTO `tb_produk` (`id_produk`, `nama_produk`, `deskripsi`, `harga`, `stok`, `foto_produk`) VALUES
(1, 'Dimsum Mentai', 'Dimsum ayam dengan saus mentai bakar', '15000.00', 50, NULL),
(2, 'Risol Mayo', 'Risol isi telur, sosis, dan mayones', '3500.00', 100, NULL),
(3, 'Risol Cokelat', 'Risol isi cokelat lumer', '3000.00', 50, NULL),
(4, 'Risol Matcha', 'Risol isi saus matcha manis', '3000.00', 50, NULL),
(5, 'Dimsum Mozzarella', 'Dimsum ayam dengan topping keju mozzarella lumer', '4000.00', 50, 'dimsum_mozza.png'),
(6, 'Dimsum Nori', 'Dimsum daging ayam yang dibalut rumput laut', '3500.00', 50, 'dimsum_nori.png'),
(7, 'Risol Beef', 'Risol gurih isi smoked beef, telur, dan mayo', '4000.00', 80, 'risol_beef.png'),
(8, 'Risol Keju', 'Risol renyah dengan isian full saus keju cheddar', '3500.00', 60, 'risol_keju.png'),
(9, 'Es Matcha Latte', 'Minuman teh hijau matcha khas Jepang dengan susu', '14000.00', 40, 'matcha_latte.png'),
(10, 'Es Lemon Tea', 'Teh hitam segar dengan perasan jeruk lemon asli', '4000.00', 40, 'lemon_tea.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ulasan`
--

CREATE TABLE `tb_ulasan` (
  `id` int NOT NULL,
  `rating` varchar(50) NOT NULL,
  `teks_ulasan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_ulasan`
--

INSERT INTO `tb_ulasan` (`id`, `rating`, `teks_ulasan`) VALUES
(1, '⭐⭐⭐⭐ Puas', 'b aja tapi okelah');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id_user` int NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `no_wa` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','pelanggan') DEFAULT 'pelanggan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id_user`, `nama_lengkap`, `no_wa`, `password`, `role`) VALUES
(1, 'Farisa Shefalyan', '085799839xxxx', 'farisa1289', 'pelanggan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_detail_pesanan`
--
ALTER TABLE `tb_detail_pesanan`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_pesanan` (`id_pesanan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `tb_klaim`
--
ALTER TABLE `tb_klaim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `tb_ulasan`
--
ALTER TABLE `tb_ulasan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_detail_pesanan`
--
ALTER TABLE `tb_detail_pesanan`
  MODIFY `id_detail` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_klaim`
--
ALTER TABLE `tb_klaim`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id_pesanan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id_produk` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_ulasan`
--
ALTER TABLE `tb_ulasan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_detail_pesanan`
--
ALTER TABLE `tb_detail_pesanan`
  ADD CONSTRAINT `tb_detail_pesanan_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `tb_pesanan` (`id_pesanan`),
  ADD CONSTRAINT `tb_detail_pesanan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `tb_produk` (`id_produk`);

--
-- Constraints for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD CONSTRAINT `tb_pesanan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
