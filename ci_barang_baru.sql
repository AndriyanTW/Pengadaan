-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2022 pada 05.04
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(7) NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `jenis_id` int(11) NOT NULL,
  `nama_satuan` varchar(255) NOT NULL,
  `type_barang` varchar(255) NOT NULL,
  `warna_barang` varchar(255) NOT NULL,
  `ukuran_barang` varchar(255) NOT NULL,
  `berat_barang` varchar(255) NOT NULL,
  `merk_barang` varchar(255) NOT NULL,
  `seri_barang` varchar(255) NOT NULL,
  `kode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `kode_barang`, `nama_barang`, `stok`, `jenis_id`, `nama_satuan`, `type_barang`, `warna_barang`, `ukuran_barang`, `berat_barang`, `merk_barang`, `seri_barang`, `kode`) VALUES
('B000001', '1001', 'Kertas HVS F4 70gsm Copy Paper', 0, 39, 'RIM', '', '', 'F4', '70 gsm', 'Copy Paper', '', '10'),
('B000002', '1101', 'Ballpoint Balliner Hitam Pilot', 0, 62, 'PCS', 'Original', 'Hitam', '0.8mm', '2gram', 'Pilot', '', '11'),
('B000003', '1201', 'Pensil Kayu 2B Faber Castell', 0, 65, 'PCS', '', '', '2B', '2gram', 'Faber Castell', '', '12'),
('B000004', '1301', 'Penggaris 30 cm Butterfly', 0, 69, 'PCS', '', '', '30 cm', '2gram', 'Butterfly', '', '13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barang_keluar` char(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `barang_id` char(7) NOT NULL,
  `jumlah_keluar` int(11) NOT NULL,
  `tanggal_keluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_barang_keluar`, `user_id`, `barang_id`, `jumlah_keluar`, `tanggal_keluar`) VALUES
('T-BK-22062200001', 1, 'B000002', 10, '2022-06-22'),
('T-BK-22062200002', 1, 'B000002', 10, '2022-06-22');

--
-- Trigger `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `update_stok_keluar` BEFORE INSERT ON `barang_keluar` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` - NEW.jumlah_keluar WHERE `barang`.`id_barang` = NEW.barang_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` char(16) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `barang_id` char(7) NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barang_masuk`, `supplier_id`, `user_id`, `barang_id`, `jumlah_masuk`, `tanggal_masuk`) VALUES
('T-BM-22062200001', 12, 1, 'B000002', 20, '2022-06-22');

--
-- Trigger `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `update_stok_masuk` BEFORE INSERT ON `barang_masuk` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` + NEW.jumlah_masuk WHERE `barang`.`id_barang` = NEW.barang_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `kode_jenis` varchar(11) NOT NULL,
  `nama_jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `kode_jenis`, `nama_jenis`) VALUES
(39, '10', 'Kertas HVS'),
(47, '10', 'Kertas Asturo'),
(48, '10', 'Kertas BC'),
(49, '10', 'Kertas CD'),
(50, '10', 'Kertas Emas'),
(51, '10', 'Kertas Flip Chart'),
(52, '10', 'Kertas Kado'),
(53, '10', 'Kertas Karbon'),
(54, '10', 'Kertas Karton'),
(55, '10', 'Kertas Label'),
(56, '10', 'Kertas Manila'),
(57, '10', 'Kertas Marmer'),
(58, '10', 'Kertas Photo'),
(59, '10', 'Kertas Stiker'),
(60, '10', 'Kertas Thermal'),
(61, '10', 'Loose Leaf'),
(62, '11', 'Ballpoint'),
(63, '11', 'Isi Ballpoint'),
(64, '12', 'Isi Pensil'),
(65, '12', 'Pensil Kayu'),
(66, '12', 'Pensil Mekanik'),
(67, '12', 'Pensil Warna'),
(68, '13', 'Busur'),
(69, '13', 'Penggaris'),
(70, '14', 'Jangka'),
(71, '14', 'Kotak Pensil'),
(72, '15', 'Rautan Mekanik'),
(73, '15', 'Rautan Serut'),
(74, '16', 'Amplop'),
(75, '16', 'Amplop Linen'),
(76, '16', 'Amplop Tali'),
(77, '17', 'Correction Pen'),
(78, '17', 'Penghapus'),
(79, '18', 'Cutter'),
(80, '18', 'Gunting'),
(81, '18', 'Isi Cutter'),
(82, '19', 'Isi Spidol'),
(83, '19', 'Kapur Tulis'),
(84, '19', 'Spidol'),
(85, '19', 'Stabilo'),
(86, '20', 'Double Tape'),
(87, '20', 'Isolasi'),
(88, '20', 'Lem Cair'),
(89, '20', 'Lem Gel'),
(90, '20', 'Lem Stik'),
(91, '3', 'Belati'),
(92, '3', 'Dasi'),
(93, '33', 'kapur');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `no_telp`, `alamat`) VALUES
(1, 'Fajri', '085348439785', 'Kalimantan Utara'),
(2, 'Khoirul', '081993335312', 'Madiun'),
(3, 'Tatak', '082245271900', 'Madiun'),
(12, 'Feby', '0895399680461', 'Madiun');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `role` enum('gudang','admin') NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  `foto` text NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `email`, `no_telp`, `role`, `password`, `created_at`, `foto`, `is_active`) VALUES
(1, 'Adminisitrator', 'admin', 'admin@admin.com', '025123456789', 'admin', '$2y$10$wMgi9s3FEDEPEU6dEmbp8eAAEBUXIXUy3np3ND2Oih.MOY.q/Kpoy', 1568689561, 'f20d1a77ab778dc41306bb977db9c9d9.jpg', 1),
(14, 'Feby Velerina', 'feby', 'feby@gmail.com', '0895399680461', 'gudang', '$2y$10$soyt1j//hRyW0VOXmbasyeydeyg0ci6q5oqNky.g96ORG.oCfAC3q', 1650941576, '0aba9f2a1184b134f63f821d905b82fc.JPG', 1),
(15, 'Hema', 'hema', 'hema@gmail.com', '085853587558', 'gudang', '$2y$10$2BsDCd6L7bEaYYT9RsJK5uEdd114tYfAKcY7Lgws8/X778UxjHnua', 1650941830, 'user.png', 1),
(16, 'Khoirul', 'khoirul', 'khoirul@gmail.com', '081993335310', 'gudang', '$2y$10$OYlqd6p1n029vsNypHjlJ.ca9ilCLk4BFG8gHnemtwL.k11a0QJbq', 1650941937, 'user.png', 1),
(17, 'Fajri', 'fajri', 'fajri@gmail.com', '085348439785', 'gudang', '$2y$10$9RWvMTkxnFGo3Cly9hFWneS.cZQvnuSm5f332JxVdkW4SlF9KDxLO', 1650941978, 'user.png', 1),
(18, 'Tatak', 'tatak', 'tatak@gmail.com', '082245271900', 'gudang', '$2y$10$uBkUKxMVAVO7Cv7VeG.6X.2VkbOMf0KzqoVTV21hHFi.dusmY.3ku', 1650942014, 'user.png', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `kategori_id` (`jenis_id`);

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_barang_keluar`),
  ADD KEY `id_user` (`user_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`),
  ADD KEY `id_user` (`user_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indeks untuk tabel `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`jenis_id`) REFERENCES `jenis` (`id_jenis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_keluar_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_masuk_ibfk_3` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
