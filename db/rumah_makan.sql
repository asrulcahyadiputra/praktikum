-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 17, 2020 at 01:30 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `rumah_makan`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `kd_akun` varchar(6) NOT NULL,
  `nm_akun` varchar(20) DEFAULT NULL,
  `header_akun` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`kd_akun`, `nm_akun`, `header_akun`) VALUES
('1', 'Aktiva', NULL),
('11', 'Aktiva Lancar', '1'),
('111', 'Kas', '11'),
('112', 'Piutang Dagang', '11'),
('113', 'Persedian Barang Dag', '11'),
('114', 'Sewa Dibayar Dimuka', '11'),
('115', 'Asuransi Dibayar Dim', '11'),
('116', 'Perlengkapan', '11'),
('2', 'Hutang', NULL),
('21', 'Hutang Lancar', '2'),
('211', 'Utang Dagang', '21'),
('3', 'Modal', NULL),
('311', 'Modal Tn.X', '3'),
('3112', 'Prive Tn.x', '311'),
('4', 'Pendapatan', NULL),
('41', 'Pendapatan Usaha', '4'),
('411', 'Penjualan', '41'),
('412', 'Harga Pokok Penjuala', '41'),
('413', 'Retur Penjualan', '41'),
('414', 'Potongan Penjualan', '41'),
('42', 'Pembelian', '4'),
('421', 'Harga Pokok Pembelia', '42'),
('422', 'Retur Pembelian', '42'),
('423', 'Potongan Pembelian', '42'),
('5', 'Beban', NULL),
('511', 'Beban Listrik', '5'),
('512', 'Beban Air', '5'),
('513', 'Beban Telepon', '5'),
('514', 'Beban Gaji', '5');

-- --------------------------------------------------------

--
-- Table structure for table `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `kd_bhn_baku` varchar(6) NOT NULL,
  `nm_bhn_baku` varchar(25) DEFAULT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bahan_baku`
--

INSERT INTO `bahan_baku` (`kd_bhn_baku`, `nm_bhn_baku`, `satuan`, `harga`) VALUES
('B01', 'Ayam', 'kg', 25000),
('B02', 'Ikan', 'kg', 30000),
('B03', 'Udang', 'kg', 40000),
('B04', 'Bawang Merah', 'ons', 10000),
('B05', 'Bawang Putih', 'ons', 15000),
('B06', 'Jahe', 'ons', 15000),
('B07', 'Lengkuas', 'ons', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `bom`
--

CREATE TABLE `bom` (
  `id_menu` varchar(10) NOT NULL,
  `kd_bhn_baku` varchar(6) NOT NULL,
  `jumlah_komposisi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bom`
--

INSERT INTO `bom` (`id_menu`, `kd_bhn_baku`, `jumlah_komposisi`) VALUES
('M01', 'B01', 3),
('M01', 'B04', 5),
('M01', 'B05', 1),
('M02', 'B02', 3),
('M02', 'B06', 4),
('M03', 'B03', 20),
('M03', 'B07', 15),
('M05', 'B01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `detail_beli`
--

CREATE TABLE `detail_beli` (
  `kd_bhn_baku` varchar(10) NOT NULL,
  `id_nota` char(8) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_beli`
--

INSERT INTO `detail_beli` (`kd_bhn_baku`, `id_nota`, `jumlah`, `harga`) VALUES
('B01', 'BL1', 1, 17000),
('B02', 'BL3', 1, 20000),
('B02', 'BL7', 2, 11000),
('B03', 'BL2', 2, 38000),
('B03', 'BL6', 2, 12000),
('B04', 'BL4', 2, 16000),
('B04', 'BL5', 2, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_jual`
--

CREATE TABLE `detail_jual` (
  `id_menu` varchar(10) NOT NULL,
  `no_nota` char(10) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_jual`
--

INSERT INTO `detail_jual` (`id_menu`, `no_nota`, `jumlah`, `subtotal`) VALUES
('M01', 'NO4', 2, 75000),
('M02', 'NO3', 3, 23000),
('M02', 'NO4', 2, 40000),
('M03', 'NO1', 1, 15000),
('M03', 'NO5', 5, 85000),
('M04', 'NO3', 5, 40000),
('M05', 'NO2', 2, 22000),
('M06', 'NO3', 4, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesan`
--

CREATE TABLE `detail_pesan` (
  `id_menu` varchar(10) NOT NULL,
  `id_pesan` varchar(10) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_pesan`
--

INSERT INTO `detail_pesan` (`id_menu`, `id_pesan`, `jumlah`, `subtotal`) VALUES
('M01', 'PSN1', 1, 17000),
('M02', 'PSN3', 2, 38000),
('M03', 'PSN2', 1, 20000),
('M04', 'PSN1', 2, 16000),
('M05', 'PSN3', 4, 76000),
('M06', 'PSN4', 6, 114000),
('M07', 'PSN2', 5, 85000);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_pembayaran`
--

CREATE TABLE `jurnal_pembayaran` (
  `id_bayar` varchar(10) NOT NULL,
  `kd_akun` char(5) NOT NULL,
  `posisi_dr_cr` varchar(10) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurnal_pembayaran`
--

INSERT INTO `jurnal_pembayaran` (`id_bayar`, `kd_akun`, `posisi_dr_cr`, `nominal`) VALUES
('BYR1', '111', 'Debet', 100000),
('BYR1', '113', 'Kredit', 100000),
('BYR2', '111', 'Debet', 200000),
('BYR2', '112', 'Kredit', 200000),
('BYR3', '111', 'Debet', 220000),
('BYR3', '113', 'Kredit', 220000),
('BYR4', '111', 'Debet', 120000),
('BYR4', '113', 'Kredit', 120000),
('BYR5', '111', 'Debet', 50000),
('BYR5', '112', 'Kredit', 50000),
('BYR6', '111', 'Debet', 300000),
('BYR6', '211', 'Kredit', 300000),
('BYR7', '111', 'Debet', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_pembelian`
--

CREATE TABLE `jurnal_pembelian` (
  `id_nota` varchar(10) NOT NULL,
  `kd_akun` char(5) NOT NULL,
  `posisi_dr_cr` varchar(10) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurnal_pembelian`
--

INSERT INTO `jurnal_pembelian` (`id_nota`, `kd_akun`, `posisi_dr_cr`, `nominal`) VALUES
('BL1', '111', 'Debet', 250000),
('BL1', '2', 'Kredit', 250000),
('BL2', '111', 'Kredit', 180000),
('BL2', '42', 'Debet', 180000),
('BL3', '111', 'Kredit', 130000),
('BL3', '2', 'Debet', 130000),
('BL4', '111', 'Kredit', 750000),
('BL4', '2', 'Debet', 750000),
('BL5', '111', 'Debet', 80000),
('BL5', '2', 'Kredit', 80000),
('BL6', '111', 'Kredit', 300000),
('BL6', '42', 'Debet', 300000),
('BL7', '111', 'Kredit', 100000),
('BL7', '42', 'Debet', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_penggajian`
--

CREATE TABLE `jurnal_penggajian` (
  `id_gaji` varchar(10) NOT NULL,
  `kd_akun` char(5) NOT NULL,
  `posisi_dr_cr` varchar(10) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurnal_penggajian`
--

INSERT INTO `jurnal_penggajian` (`id_gaji`, `kd_akun`, `posisi_dr_cr`, `nominal`) VALUES
('GJ1', '111', 'Kredit', 1500000),
('GJ1', '514', 'Debet', 1500000),
('GJ2', '111', 'Kredit', 1500000),
('GJ2', '514', 'Debet', 1500000),
('GJ3', '111', 'Kredit', 2000000),
('GJ3', '514', 'Debet', 2000000),
('GJ4', '111', 'Kredit', 2000000),
('GJ4', '514', 'Debet', 2000000),
('GJ5', '111', 'Kredit', 2000000),
('GJ5', '514', 'Debet', 2000000),
('GJ6', '111', 'Kredit', 1000000),
('GJ6', '514', 'Debet', 1000000),
('GJ7', '111', 'Kredit', 1000000),
('GJ7', '514', 'Debet', 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_penjualan`
--

CREATE TABLE `jurnal_penjualan` (
  `no_nota` varchar(10) NOT NULL,
  `kd_akun` char(5) NOT NULL,
  `posisi_dr_cr` varchar(10) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurnal_penjualan`
--

INSERT INTO `jurnal_penjualan` (`no_nota`, `kd_akun`, `posisi_dr_cr`, `nominal`) VALUES
('NO1', '111', 'Debet', 150000),
('NO1', '411', 'Kredit', 150000),
('NO2', '111', 'Debet', 220000),
('NO2', '411', 'Kredit', 220000),
('NO3', '111', 'Debet', 230000),
('NO3', '411', 'Kredit', 230000),
('NO4', '111', 'Debet', 750000),
('NO4', '411', 'Kredit', 750000),
('NO5', '111', 'Debet', 50000),
('NO5', '411', 'Kredit', 50000),
('NO6', '111', 'Debet', 300000),
('NO6', '411', 'Kredit', 300000),
('NO7', '111', 'Debet', 100000),
('NO7', '411', 'Kredit', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` varchar(10) NOT NULL,
  `nm_menu` varchar(25) DEFAULT NULL,
  `jenis_menu` varchar(20) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `nm_menu`, `jenis_menu`, `harga`) VALUES
('M01', 'Ayam Balado', 'Makanan', 17000),
('M02', 'Ikan Bakar', 'Makanan', 20000),
('M03', 'Gulai Udang', 'Makanan', 19000),
('M04', 'Juice Jeruk', 'Minuman', 8000),
('M05', 'Ayam Rendang', 'Makanan', 17000),
('M06', 'Es Teh', 'Minuman', 5000),
('M07', 'Gulai Ikan', 'Makanan', 15000),
('M08', 'Juice Alpukat', 'Minuman', 8000);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` varchar(10) NOT NULL,
  `nm_pegawai` varchar(30) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `posisi` varchar(10) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `no_telp` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nm_pegawai`, `alamat`, `posisi`, `tgl_lahir`, `no_telp`) VALUES
('P01', 'INDAH', 'PADANG', 'KASIR', '1999-01-20', '081223445888'),
('P02', 'JEKO', 'BUKIT TINGGI', 'KASIR', '2000-01-01', '082323446887'),
('P03', 'ODI', 'PADANG', 'KOKI', '2001-02-20', '081213225777'),
('P04', 'BUDI', 'PADANG', 'KOKI', '1999-03-21', '081255544566'),
('P05', 'WAWAN', 'SOLOK', 'KOKI', '1999-04-22', '087821456789'),
('P06', 'WATI', 'BUKIT TINGGI', 'PELAYAN', '1999-05-23', '081316021563'),
('P07', 'PUTRI', 'SOLOK', 'PELAYAN', '1999-06-24', '083778222111');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(10) NOT NULL,
  `nm_pelanggan` varchar(30) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_telp` text,
  `tgl_lahir` date DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nm_pelanggan`, `alamat`, `no_telp`, `tgl_lahir`, `status`, `deleted_at`) VALUES
('PEL01', 'ALIYA', 'Bukit Permai Malang', '081280055856', '1999-07-16', 1, NULL),
('PEL02', 'SYIFA', 'PADANG', '081234567907', '1995-05-05', 1, NULL),
('PEL03', 'YULIA', 'BUKIT TINGGI', '081224478451', '1996-06-12', 1, NULL),
('PEL04', 'AGUNG', 'BUKIT TINGGI', '081456789013', '1997-04-24', 1, NULL),
('PEL05', 'TONO', 'PADANG', '083456772201', '1996-09-09', 0, '2020-12-17 13:19:13'),
('PEL06', 'JELITA', 'SOLOK', '08145678904', '1999-01-24', 0, '2020-12-17 13:19:13'),
('PEL07', 'ESA', 'SOLOK', '081234123456', '1995-07-20', 0, '2020-12-17 13:19:10'),
('PEL08', 'Asrul Cahyadi', 'Bandung', '081280055856', '1999-07-16', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_bayar` char(6) NOT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `total_bayar` int(11) DEFAULT NULL,
  `id_pesan` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_bayar`, `tgl_bayar`, `total_bayar`, `id_pesan`) VALUES
('BYR1', '2020-11-01', 100000, 'PSN1'),
('BYR2', '2020-11-02', 200000, 'PSN1'),
('BYR3', '2020-11-03', 220000, 'PSN3'),
('BYR4', '2020-11-04', 120000, 'PSN4'),
('BYR5', '2020-11-05', 50000, 'PSN5'),
('BYR6', '2020-11-06', 300000, 'PSN6'),
('BYR7', '2020-11-07', 20000, 'PSN7');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_nota` char(8) NOT NULL,
  `tgl_nota` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_nota`, `tgl_nota`, `total`) VALUES
('BL1', '2020-11-01', 250000),
('BL2', '2020-11-02', 180000),
('BL3', '2020-11-03', 130000),
('BL4', '2020-11-04', 750000),
('BL5', '2020-11-05', 80000),
('BL6', '2020-11-06', 300000),
('BL7', '2020-11-07', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pesan` varchar(10) NOT NULL,
  `tgl_pesan` date DEFAULT NULL,
  `id_pelanggan` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id_pesan`, `tgl_pesan`, `id_pelanggan`) VALUES
('PSN1', '2020-11-01', 'PEL01'),
('PSN2', '2020-11-02', 'PEL02'),
('PSN3', '2020-11-03', 'PEL03'),
('PSN4', '2020-11-04', 'PEL04'),
('PSN5', '2020-11-05', 'PEL05'),
('PSN6', '2020-11-06', 'PEL06'),
('PSN7', '2020-11-07', 'PEL07');

-- --------------------------------------------------------

--
-- Table structure for table `penggajian`
--

CREATE TABLE `penggajian` (
  `id_gaji` char(10) NOT NULL,
  `tgl_gaji` date DEFAULT NULL,
  `periode` int(11) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  `id_pegawai` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penggajian`
--

INSERT INTO `penggajian` (`id_gaji`, `tgl_gaji`, `periode`, `nominal`, `id_pegawai`) VALUES
('GJ1', '2020-11-30', 2012, 1500000, 'P01'),
('GJ2', '2020-11-29', 2010, 1500000, 'P02'),
('GJ3', '2020-11-30', 2016, 2000000, 'P03'),
('GJ4', '2020-11-28', 2016, 1200000, 'P04'),
('GJ5', '2020-11-28', 2016, 1500000, 'P05'),
('GJ6', '2020-11-30', 2014, 1500000, 'P06'),
('GJ7', '2020-11-26', 2014, 1500000, 'P07');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `no_nota` char(10) NOT NULL,
  `tgl_nota` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `id_pegawai` varchar(10) DEFAULT NULL,
  `id_pelanggan` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`no_nota`, `tgl_nota`, `total`, `id_pegawai`, `id_pelanggan`) VALUES
('NO1', '2020-11-01', 150000, 'P01', 'PEL01'),
('NO2', '2020-11-02', 220000, 'P01', 'PEL04'),
('NO3', '2020-11-03', 230000, 'P03', 'PEL04'),
('NO4', '2020-11-04', 750000, 'P04', 'PEL02'),
('NO5', '2020-11-05', 50000, 'P05', 'PEL02'),
('NO6', '2020-11-06', 300000, 'P02', 'PEL01'),
('NO7', '2020-11-07', 100000, 'P01', 'PEL07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`kd_akun`),
  ADD KEY `fk_header` (`header_akun`);

--
-- Indexes for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`kd_bhn_baku`);

--
-- Indexes for table `bom`
--
ALTER TABLE `bom`
  ADD PRIMARY KEY (`id_menu`,`kd_bhn_baku`),
  ADD KEY `fk_bhn_baku` (`kd_bhn_baku`);

--
-- Indexes for table `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD PRIMARY KEY (`kd_bhn_baku`,`id_nota`),
  ADD KEY `fk_nota` (`id_nota`);

--
-- Indexes for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`id_menu`,`no_nota`),
  ADD KEY `fk_detail` (`no_nota`);

--
-- Indexes for table `detail_pesan`
--
ALTER TABLE `detail_pesan`
  ADD PRIMARY KEY (`id_menu`,`id_pesan`),
  ADD KEY `fk_psn` (`id_pesan`);

--
-- Indexes for table `jurnal_pembayaran`
--
ALTER TABLE `jurnal_pembayaran`
  ADD PRIMARY KEY (`id_bayar`,`kd_akun`),
  ADD KEY `fk_id` (`kd_akun`);

--
-- Indexes for table `jurnal_pembelian`
--
ALTER TABLE `jurnal_pembelian`
  ADD PRIMARY KEY (`id_nota`,`kd_akun`),
  ADD KEY `fk_bl` (`kd_akun`);

--
-- Indexes for table `jurnal_penggajian`
--
ALTER TABLE `jurnal_penggajian`
  ADD PRIMARY KEY (`id_gaji`,`kd_akun`),
  ADD KEY `fk_akn` (`kd_akun`);

--
-- Indexes for table `jurnal_penjualan`
--
ALTER TABLE `jurnal_penjualan`
  ADD PRIMARY KEY (`no_nota`,`kd_akun`),
  ADD KEY `fk_jualan` (`kd_akun`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_bayar`),
  ADD KEY `fk_bayar` (`id_pesan`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_nota`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `fk_pemesanan` (`id_pelanggan`);

--
-- Indexes for table `penggajian`
--
ALTER TABLE `penggajian`
  ADD PRIMARY KEY (`id_gaji`),
  ADD KEY `fk_gaji` (`id_pegawai`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`no_nota`),
  ADD KEY `fk_jual` (`id_pegawai`),
  ADD KEY `fk_pelanggan` (`id_pelanggan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `fk_header` FOREIGN KEY (`header_akun`) REFERENCES `akun` (`kd_akun`);

--
-- Constraints for table `bom`
--
ALTER TABLE `bom`
  ADD CONSTRAINT `fk_bhn_baku` FOREIGN KEY (`kd_bhn_baku`) REFERENCES `bahan_baku` (`kd_bhn_baku`),
  ADD CONSTRAINT `fk_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Constraints for table `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD CONSTRAINT `fk_beli` FOREIGN KEY (`kd_bhn_baku`) REFERENCES `bahan_baku` (`kd_bhn_baku`),
  ADD CONSTRAINT `fk_nota` FOREIGN KEY (`id_nota`) REFERENCES `pembelian` (`id_nota`);

--
-- Constraints for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD CONSTRAINT `fk_detail` FOREIGN KEY (`no_nota`) REFERENCES `penjualan` (`no_nota`),
  ADD CONSTRAINT `fk_jl` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Constraints for table `detail_pesan`
--
ALTER TABLE `detail_pesan`
  ADD CONSTRAINT `fk_pesan` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`),
  ADD CONSTRAINT `fk_psn` FOREIGN KEY (`id_pesan`) REFERENCES `pemesanan` (`id_pesan`);

--
-- Constraints for table `jurnal_pembayaran`
--
ALTER TABLE `jurnal_pembayaran`
  ADD CONSTRAINT `fk_byr` FOREIGN KEY (`id_bayar`) REFERENCES `pembayaran` (`id_bayar`),
  ADD CONSTRAINT `fk_id` FOREIGN KEY (`kd_akun`) REFERENCES `akun` (`kd_akun`);

--
-- Constraints for table `jurnal_pembelian`
--
ALTER TABLE `jurnal_pembelian`
  ADD CONSTRAINT `fk_bl` FOREIGN KEY (`kd_akun`) REFERENCES `akun` (`kd_akun`),
  ADD CONSTRAINT `fk_nt` FOREIGN KEY (`id_nota`) REFERENCES `pembelian` (`id_nota`);

--
-- Constraints for table `jurnal_penggajian`
--
ALTER TABLE `jurnal_penggajian`
  ADD CONSTRAINT `fk_akn` FOREIGN KEY (`kd_akun`) REFERENCES `akun` (`kd_akun`),
  ADD CONSTRAINT `fk_gj` FOREIGN KEY (`id_gaji`) REFERENCES `penggajian` (`id_gaji`);

--
-- Constraints for table `jurnal_penjualan`
--
ALTER TABLE `jurnal_penjualan`
  ADD CONSTRAINT `fk_jualan` FOREIGN KEY (`kd_akun`) REFERENCES `akun` (`kd_akun`),
  ADD CONSTRAINT `fk_pen` FOREIGN KEY (`no_nota`) REFERENCES `penjualan` (`no_nota`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_bayar` FOREIGN KEY (`id_pesan`) REFERENCES `pemesanan` (`id_pesan`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `fk_pemesanan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Constraints for table `penggajian`
--
ALTER TABLE `penggajian`
  ADD CONSTRAINT `fk_gaji` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `fk_jual` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`),
  ADD CONSTRAINT `fk_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE;
