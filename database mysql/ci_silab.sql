-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Jul 2020 pada 00.30
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_silab`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alat`
--

CREATE TABLE `alat` (
  `ID_ALAT` char(5) NOT NULL,
  `ID_PENGEMBALIAN` char(10) DEFAULT NULL,
  `ID_DETAIL_PEMINJAMAN` char(5) DEFAULT NULL,
  `NAMA_ALAT` varchar(50) DEFAULT NULL,
  `SPESIFIKASI` varchar(500) DEFAULT NULL,
  `TAHUN_ALAT` int(11) DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  `NAMA_IMAGE` longblob DEFAULT NULL,
  `KONDISI_ALAT` varchar(30) DEFAULT NULL,
  `TRACKING_KALIBRASI_ALAT` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `ID_DETAIL_PEMINJAMAN` char(5) NOT NULL,
  `ID_PEMINJAMAN` char(10) DEFAULT NULL,
  `JUMLAH` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `ID_PEMINJAMAN` char(10) NOT NULL,
  `USERNAME` varchar(30) DEFAULT NULL,
  `TANGGAL_PINJAM` datetime DEFAULT NULL,
  `TANGGAL_KEMBALI` datetime DEFAULT NULL,
  `KETERANGAN` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `ID_PENGEMBALIAN` char(10) NOT NULL,
  `USERNAME` varchar(30) DEFAULT NULL,
  `TANGGAL_PENGEMBALIAN` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `USERNAME` varchar(30) NOT NULL,
  `NIM` char(10) DEFAULT NULL,
  `NAMA` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(30) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `NO_TELP` char(20) DEFAULT NULL,
  `LEVEL` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`USERNAME`, `NIM`, `NAMA`, `PASSWORD`, `EMAIL`, `NO_TELP`, `LEVEL`) VALUES
('admin', '8612', 'Adi', '12345', 'admin@gmail.com', '083163524718', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alat`
--
ALTER TABLE `alat`
  ADD PRIMARY KEY (`ID_ALAT`),
  ADD KEY `FK_ALAT_RELATIONS_PENGEMBA` (`ID_PENGEMBALIAN`),
  ADD KEY `FK_ALAT_RELATIONS_DETAIL_P` (`ID_DETAIL_PEMINJAMAN`);

--
-- Indeks untuk tabel `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD PRIMARY KEY (`ID_DETAIL_PEMINJAMAN`),
  ADD KEY `FK_DETAIL_P_RELATIONS_PEMINJAM` (`ID_PEMINJAMAN`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`ID_PEMINJAMAN`),
  ADD KEY `FK_PEMINJAM_RELATIONS_USER` (`USERNAME`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`ID_PENGEMBALIAN`),
  ADD KEY `FK_PENGEMBA_RELATIONS_USER` (`USERNAME`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USERNAME`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `alat`
--
ALTER TABLE `alat`
  ADD CONSTRAINT `FK_ALAT_RELATIONS_DETAIL_P` FOREIGN KEY (`ID_DETAIL_PEMINJAMAN`) REFERENCES `detail_peminjaman` (`ID_DETAIL_PEMINJAMAN`),
  ADD CONSTRAINT `FK_ALAT_RELATIONS_PENGEMBA` FOREIGN KEY (`ID_PENGEMBALIAN`) REFERENCES `pengembalian` (`ID_PENGEMBALIAN`);

--
-- Ketidakleluasaan untuk tabel `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD CONSTRAINT `FK_DETAIL_P_RELATIONS_PEMINJAM` FOREIGN KEY (`ID_PEMINJAMAN`) REFERENCES `peminjaman` (`ID_PEMINJAMAN`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `FK_PEMINJAM_RELATIONS_USER` FOREIGN KEY (`USERNAME`) REFERENCES `user` (`USERNAME`);

--
-- Ketidakleluasaan untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `FK_PENGEMBA_RELATIONS_USER` FOREIGN KEY (`USERNAME`) REFERENCES `user` (`USERNAME`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
