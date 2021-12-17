-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Des 2021 pada 17.09
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile_uas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id_berita` char(8) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `isi` varchar(255) NOT NULL,
  `nama_penulis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id_berita`, `judul`, `tanggal`, `isi`, `nama_penulis`) VALUES
('00000011', 'Tes Tes', '2021-12-17 06:39:27', 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя', 'Renaldi Soeryadi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `populer`
--

CREATE TABLE `populer` (
  `berita` int(8) NOT NULL,
  `id_berita` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat`
--

CREATE TABLE `riwayat` (
  `berita` int(8) NOT NULL,
  `id_berita` char(8) NOT NULL,
  `waktu_baca` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `terbaru`
--

CREATE TABLE `terbaru` (
  `berita` int(8) NOT NULL,
  `id_berita` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indeks untuk tabel `populer`
--
ALTER TABLE `populer`
  ADD PRIMARY KEY (`berita`),
  ADD KEY `fk_id_berita2` (`id_berita`);

--
-- Indeks untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`berita`),
  ADD KEY `fk_id_berita3` (`id_berita`);

--
-- Indeks untuk tabel `terbaru`
--
ALTER TABLE `terbaru`
  ADD PRIMARY KEY (`berita`),
  ADD KEY `fk_id_berita` (`id_berita`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `populer`
--
ALTER TABLE `populer`
  MODIFY `berita` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `berita` int(8) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `populer`
--
ALTER TABLE `populer`
  ADD CONSTRAINT `fk_id_berita2` FOREIGN KEY (`id_berita`) REFERENCES `berita` (`id_berita`);

--
-- Ketidakleluasaan untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  ADD CONSTRAINT `fk_id_berita3` FOREIGN KEY (`id_berita`) REFERENCES `berita` (`id_berita`);

--
-- Ketidakleluasaan untuk tabel `terbaru`
--
ALTER TABLE `terbaru`
  ADD CONSTRAINT `fk_id_berita` FOREIGN KEY (`id_berita`) REFERENCES `berita` (`id_berita`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
