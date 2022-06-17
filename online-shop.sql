-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2019 at 08:58 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online-shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nama_lengkap`, `username`, `password`) VALUES
(1, 'iqbalelek', 'iqbal', '22512e58749ffead12e90dbd59eddf24');

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `id_pembeli` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `negara` varchar(30) NOT NULL,
  `kode_pos` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `total_harga` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`id_pembeli`, `nama_lengkap`, `alamat`, `negara`, `kode_pos`, `username`, `password`, `total_harga`) VALUES
(1, 'pembeli', 'di kabupaten bogogr kecamatan cibinong ', 'indonesia', '16918', 'andi', 'ce0e5bf55e4f71749eade7a8b95c4e46', '50000'),
(35, 'hoerudin', 'ciinong bogor', 'indonesia', '16918', 'hoerudin', '62328b88316cee576feb8a6a4e13fce0', '1320000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_barang` varchar(50) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto` varchar(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id_barang`, `nama_barang`, `harga_barang`, `id_kategori`, `deskripsi`, `foto`, `qty`, `info`) VALUES
(2, 'Tenda 8 Man ( 8 Orang)', '1500000', 1, 'Tenda 8 Man ( 8 Orang)\r\n\r\nTenda 8 Man ( 8 Orang).Tenda 8 ORANGGGG, ya tenda ini bisa menampung 8-9 orang, rekomended banget buat kamu yang mau mendaki dengan orang banyak', 'tenda8man2.jpg', 10, 'Tenda 8 Man ( 8 Orang)\r\n\r\nTenda 8 Man ( 8 Orang).Tenda 8 ORANGGGG, ya tenda ini bisa menampung 8-9 orang, rekomended banget buat kamu yang mau mendaki dengan orang banyak'),
(6, 'Tenda 2 Man ( 2 Orang)', '200000', 1, 'Tenda 2 Man ( 2 Orang)\r\n\r\nTenda 2 Man ( 2 Orang).ini cukup buat kau yang lagi sendirian menaki gunung karena ga ada kawan kau yang mau diajak untuk mendaki', 'tenda2man1.jpg', 10, 'Tenda 2 Man ( 2 Orang)\r\n\r\nTenda 2 Man ( 2 Orang).ini cukup buat kau yang lagi sendirian menaki gunung karena ga ada kawan kau yang mau diajak untuk mendaki'),
(7, 'Tenda 4 Man ( 4 Orang)', '500000', 1, 'Tenda 4 Man ( 4 Orang)\r\n\r\nTenda 4 Man ( 4 Orang).ini  cukup untuk 3-4 orang, bila kau ajak sahabat-sahabat kamu untuk mendaki bersama ini cukup buat 3-4 orang', 'tenda4man1.jpg', 10, 'Tenda 4 Man ( 4 Orang)\r\n\r\nTenda 4 Man ( 4 Orang).ini  cukup untuk 3-4 orang, bila kau ajak sahabat-sahabat kamu untuk mendaki bersama ini cukup buat 3-4 orang'),
(8, 'Tenda 6 Man ( 6 Orang)', '800000', 1, 'Tenda 6 Man ( 6 Orang)\r\n\r\nTenda 6 Man ( 6 Orang).ini cukup menampung hinnga 6-7 orang, bila kamu ingin mendaki degan orang banyak maka tenda ini cocok buat kamu', 'tenda6man1.jpg', 10, 'Tenda 6 Man ( 6 Orang)\r\n\r\nTenda 6 Man ( 6 Orang).ini cukup menampung hinnga 6-7 orang, bila kamu ingin mendaki degan orang banyak maka tenda ini cocok buat kamu'),
(11, 'Sleeping Bag 1 Man (1 Orang)', '300000', 2, 'Sleeping Bag 1 Man (1 Orang)\r\n\r\nSleeping Bag 1 Man (1 Orang).Sleeping bag untuk 1 orang ini enak sekali empuk nyaman tidak dinginss', 'sleping111.jpg', 15, 'Sleeping Bag 1 Man (1 Orang)\r\n\r\nSleeping Bag 1 Man (1 Orang).Sleeping bag untuk 1 orang ini enak sekali empuk nyaman tidak dinginss'),
(12, 'Sleeping Bag 1 Man XL (1 Orang) ', '500000', 2, 'Sleeping Bag 1 Man XL (1 Orang) \r\n\r\nSleeping Bag 1 Man XL (1 Orang).sleeping bag ini untuk 1 orang tapi lumayan besar, buat kamu yang lagi bermasalah dengan berat badan, sleeping bag ini cocok buat kamu karena lebih besar dari sebelumnya', '2142511.png', 15, 'Sleeping Bag 1 Man XL (1 Orang) \r\n\r\nSleeping Bag 1 Man XL (1 Orang).sleeping bag ini untuk 1 orang tapi lumayan besar, buat kamu yang lagi bermasalah dengan berat badan, sleeping bag ini cocok buat kamu karena lebih besar dari sebelumnya'),
(13, 'Sleeping Bag 1 Man (2 Orang)', '700000', 2, 'Sleeping Bag 1 Man (2 Orang)\r\n\r\nSleeping Bag 1 Man (2 Orang).Sleeping bag untuk 2 orang sangat rekomended buat kamu agar bisa membagi kehangatan', 'sleping21.jpg', 10, 'Sleeping Bag 1 Man (2 Orang)\r\n\r\nSleeping Bag 1 Man (2 Orang).Sleeping bag untuk 2 orang sangat rekomended buat kamu agar bisa membagi kehangatan'),
(15, '', '200', 3, 'asd', '140-pengantin-aksesoris-hiasan-kepala-rambut-retro-matte-emas-porselen-bunga-paduan-berlian-imitasi-bridal-aksesoris_jpg_640x6401.jpg', 0, 'asd'),
(19, 'Tas Carier REI 45L', '800000', 3, 'TAS CARIRER REI 45L\r\n\r\nTAS CARIRER REI 45L ini cocok buat kau yang masih pemula dalam mendaki gunung yang memiliki mdpl yang kecil/tidak begitu tinggi', '452.png', 10, 'TAS CARIRER REI 45L\r\n\r\nTAS CARIRER REI 45L ini cocok buat kau yang masih pemula dalam mendaki gunung yang memiliki mdpl yang kecil/tidak begitu tinggi'),
(20, 'Tas Carier REI 60L', '1000000', 3, 'Tas Carier REI 60L\r\n\r\nTas Carier REI 60L INI Tas Eiger 60L Paten kali cukup buat kau yang mau mendaki rasa camping karena selain kapasitas penyimpan yang besar, tas ini memiliki kecepatan transfer 10mb/sec', '602.jpg', 10, 'Tas Carier REI 60L\r\n\r\nTas Carier REI 60L INI Tas Eiger 60L Paten kali cukup buat kau yang mau mendaki rasa camping karena selain kapasitas penyimpan yang besar, tas ini memiliki kecepatan transfer 10mb/sec'),
(21, 'Tas Carier 70L', '1500000', 3, 'Tas Carier 70L\r\n\r\nTas Carier 70L. TAS EIGER 70L Ini cocok kali buat kau yang mau menaklukan gunung tertinggi di dunia macam everest, dengan tas ini kau bisa menyimpan semua isi kulkas kau di tas ini karena bisa untuk muat 70L+', '701.jpg', 10, 'Tas Carier 70L\r\n\r\nTas Carier 70L. TAS EIGER 70L Ini cocok kali buat kau yang mau menaklukan gunung tertinggi di dunia macam everest, dengan tas ini kau bisa menyimpan semua isi kulkas kau di tas ini karena bisa untuk muat 70L+'),
(22, 'Tas Carier REI 65L + 10L', '2000000', 3, 'Tas Carier REI 65L + 10L\r\n\r\nTas Carier REI 65L + 10L.Tas Carier REI 65L + 10L. Ini tas terakhir kita, ini tas sudah seperti kulkas, kau taruh makanan kau se indomerit kedalam tas ini, jangan kawatir, TAS INI MUAT 65+10L, Jadi Tas ini Besar banget', '65+104.jpg', 10, 'Tas Carier REI 65L + 10L\r\n\r\nTas Carier REI 65L + 10L.Tas Carier REI 65L + 10L. Ini tas terakhir kita, ini tas sudah seperti kulkas, kau taruh makanan kau se indomerit kedalam tas ini, jangan kawatir, TAS INI MUAT 65+10L, Jadi Tas ini Besar banget');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'TENDA'),
(2, 'SLEEPINGBAG'),
(3, 'BACKPACK');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `bukti_pembayaran` text NOT NULL,
  `qty` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `id_pembeli`, `id_barang`, `status`, `bukti_pembayaran`, `qty`, `tanggal`) VALUES
(1, 1, 2, 1, 'rp-2.png', 2, '2018-07-09 11:45:06'),
(6, 35, 2, 1, '135215_sssc1.jpg', 7, '2018-07-09 13:17:02'),
(7, 35, 2, 1, '135215_sssc1.jpg', 3, '2018-07-09 13:25:42');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_chek`
-- (See below for the actual view)
--
CREATE TABLE `v_chek` (
`id_pembeli` int(11)
,`nama_lengkap` varchar(50)
,`alamat` text
,`negara` varchar(30)
,`kode_pos` varchar(20)
,`qty` int(11)
,`harga_barang` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_penjualan`
-- (See below for the actual view)
--
CREATE TABLE `v_penjualan` (
`id_pembeli` int(11)
,`qty` int(11)
,`id_transaksi` int(11)
,`nama_barang` varchar(50)
,`harga_barang` varchar(50)
,`nama_kategori` varchar(50)
,`foto` varchar(200)
,`status` int(11)
,`alamat` text
,`username` varchar(20)
,`password` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `v_chek`
--
DROP TABLE IF EXISTS `v_chek`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_chek`  AS  select `ts`.`id_pembeli` AS `id_pembeli`,`pm`.`nama_lengkap` AS `nama_lengkap`,`pm`.`alamat` AS `alamat`,`pm`.`negara` AS `negara`,`pm`.`kode_pos` AS `kode_pos`,`ts`.`qty` AS `qty`,`tb`.`harga_barang` AS `harga_barang` from ((`tbl_transaksi` `ts` join `pembeli` `pm`) join `tbl_barang` `tb`) where ((`ts`.`id_pembeli` = `pm`.`id_pembeli`) and (`tb`.`id_barang` = `ts`.`id_barang`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_penjualan`
--
DROP TABLE IF EXISTS `v_penjualan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_penjualan`  AS  select `pm`.`id_pembeli` AS `id_pembeli`,`ts`.`qty` AS `qty`,`ts`.`id_transaksi` AS `id_transaksi`,`tb`.`nama_barang` AS `nama_barang`,`tb`.`harga_barang` AS `harga_barang`,`tk`.`nama_kategori` AS `nama_kategori`,`tb`.`foto` AS `foto`,`ts`.`status` AS `status`,`pm`.`alamat` AS `alamat`,`pm`.`username` AS `username`,`pm`.`password` AS `password` from (((`tbl_transaksi` `ts` join `tbl_barang` `tb`) join `tbl_kategori` `tk`) join `pembeli` `pm`) where ((`ts`.`id_pembeli` = `pm`.`id_pembeli`) and (`tb`.`id_kategori` = `tk`.`id_kategori`) and (`ts`.`id_barang` = `tb`.`id_barang`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_pembeli` (`id_pembeli`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id_pembeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD CONSTRAINT `tbl_barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tbl_kategori` (`id_kategori`);

--
-- Constraints for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `tbl_transaksi_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tbl_barang` (`id_barang`),
  ADD CONSTRAINT `tbl_transaksi_ibfk_2` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id_pembeli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
