/*
 Navicat Premium Data Transfer

 Source Server         : xampp
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : rentalcamping

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 17/06/2022 07:28:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for barang
-- ----------------------------
DROP TABLE IF EXISTS `barang`;
CREATE TABLE `barang`  (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_sewa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stock` int NULL DEFAULT NULL,
  `id_kategori` int NULL DEFAULT NULL,
  `denda` int NULL DEFAULT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_barang`) USING BTREE,
  INDEX `id_kategori`(`id_kategori`) USING BTREE,
  CONSTRAINT `id_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang
-- ----------------------------
INSERT INTO `barang` VALUES (1, 'testasd', '21000', 1, 1, NULL, 'asdasdasdasdasdasdasdasdasdasdasdasdasdasdasd');
INSERT INTO `barang` VALUES (2, 'barang2', '22000', 22, 1, NULL, 'barang2barang2barang2barang2barang2barang2barang2barang2barang2barang2');
INSERT INTO `barang` VALUES (3, 'barang3', '23000', 33, 1, NULL, 'barang3barang3barang3barang3barang3barang3barang3barang3');
INSERT INTO `barang` VALUES (4, 'sleepingbag1', '11000', 20, 2, NULL, 'sleepingbag1');
INSERT INTO `barang` VALUES (5, 'sleepingbag2', '22', 22, 1, NULL, 'sleepingbag2');
INSERT INTO `barang` VALUES (6, 'backpack', '12', 12, 3, NULL, 'backpack');

-- ----------------------------
-- Table structure for gallery
-- ----------------------------
DROP TABLE IF EXISTS `gallery`;
CREATE TABLE `gallery`  (
  `id_galeri` int NOT NULL AUTO_INCREMENT,
  `id_barang` int NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_galeri`) USING BTREE,
  INDEX `id_barang`(`id_barang`) USING BTREE,
  CONSTRAINT `id_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gallery
-- ----------------------------
INSERT INTO `gallery` VALUES (1, 1, 'dataset.png');
INSERT INTO `gallery` VALUES (2, 2, 'Screenshot_2022-04-15_075332.png');
INSERT INTO `gallery` VALUES (3, 3, '001-man.png');
INSERT INTO `gallery` VALUES (4, 4, 'sleping22.jpg');
INSERT INTO `gallery` VALUES (5, 5, 'sleping112.jpg');
INSERT INTO `gallery` VALUES (6, 6, 'test1.jpg');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id_history` int NOT NULL AUTO_INCREMENT,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tanggal_waktu` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_history`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `nama_kategori` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_kategori`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES (1, 'TENDA');
INSERT INTO `kategori` VALUES (2, 'SLEEPINGBAG');
INSERT INTO `kategori` VALUES (3, 'BACKPACK');

-- ----------------------------
-- Table structure for peminjaman
-- ----------------------------
DROP TABLE IF EXISTS `peminjaman`;
CREATE TABLE `peminjaman`  (
  `id_transaksi` int NULL DEFAULT NULL,
  `id_barang` int NULL DEFAULT NULL,
  `jumlah_sewa` int NULL DEFAULT NULL,
  `total_sewa` int NULL DEFAULT NULL,
  INDEX `id_transaksi`(`id_transaksi`) USING BTREE,
  INDEX `idbarang`(`id_barang`) USING BTREE,
  CONSTRAINT `id_transaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `idbarang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of peminjaman
-- ----------------------------

-- ----------------------------
-- Table structure for pengembalian
-- ----------------------------
DROP TABLE IF EXISTS `pengembalian`;
CREATE TABLE `pengembalian`  (
  `id_pengembalian` int NOT NULL AUTO_INCREMENT,
  `id_users` int NULL DEFAULT NULL,
  `id_transaksi` int NULL DEFAULT NULL,
  `tanggal_pengembalian` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengembalian`) USING BTREE,
  INDEX `idusers`(`id_users`) USING BTREE,
  INDEX `idtransaksi`(`id_transaksi`) USING BTREE,
  CONSTRAINT `idtransaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `idusers` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengembalian
-- ----------------------------

-- ----------------------------
-- Table structure for transaksi
-- ----------------------------
DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE `transaksi`  (
  `id_transaksi` int NOT NULL AUTO_INCREMENT,
  `id_users` int NULL DEFAULT NULL,
  `tanggal_awal_sewa` timestamp NULL DEFAULT NULL,
  `tanggal_akhir_sewa` timestamp NULL DEFAULT NULL,
  `jumlah_barang` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `total_sewa_semua` int NULL DEFAULT NULL,
  `upload_pembayaran` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`) USING BTREE,
  INDEX `id_users`(`id_users`) USING BTREE,
  CONSTRAINT `id_users` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id_users` int NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_telp` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_users`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'IqbalMP', 'Surabaya', '08383099', 'iqbal', '22512e58749ffead12e90dbd59eddf24', 1);
INSERT INTO `users` VALUES (2, 'Cust', 'test', '0833123', 'test', 'test', 2);

-- ----------------------------
-- View structure for v_penjualan
-- ----------------------------
DROP VIEW IF EXISTS `v_penjualan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_penjualan` AS SELECT
	u.id_users, 
	t.jumlah_barang, 
	t.id_transaksi, 
	b.nama_barang, 
	b.harga_sewa, 
	k.nama_kategori, 
	g.foto, 
	t.`status`, 
	u.alamat, 
	u.username, 
	u.`password`
FROM
	users AS u
	INNER JOIN
	transaksi AS t
	ON 
		u.id_users = t.id_users
	INNER JOIN
	peminjaman AS p
	ON 
		t.id_transaksi = p.id_transaksi
	INNER JOIN
	barang AS b
	ON 
		p.id_barang = b.id_barang
	INNER JOIN
	kategori AS k
	ON 
		b.id_kategori = k.id_kategori
	INNER JOIN
	gallery AS g
	ON 
		b.id_barang = g.id_barang ;

SET FOREIGN_KEY_CHECKS = 1;
