-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Sep 2024 pada 09.33
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan_habib`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` INT AUTO_INCREMENT PRIMARY KEY,
  `nama_anggota` VARCHAR(255) NOT NULL,
  `alamat` TEXT,
  `no_telepon` VARCHAR(15),
  `email` VARCHAR(100),
  `tanggal_daftar` DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` INT AUTO_INCREMENT PRIMARY KEY,
  `judul_buku` VARCHAR(255) NOT NULL,
  `pengarang` VARCHAR(255) NOT NULL,
  `penerbit` VARCHAR(255),
  `tahun_terbit` YEAR NOT NULL,
  `kategori` VARCHAR(100),
  `stok` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` INT AUTO_INCREMENT PRIMARY KEY,
  `nama_petugas` VARCHAR(255) NOT NULL,
  `jabatan` VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` INT AUTO_INCREMENT PRIMARY KEY,
  `id_buku` INT NOT NULL,
  `id_anggota` INT NOT NULL,
  `id_petugas` INT NOT NULL,
  `tanggal_pinjam` DATE NOT NULL,
  `tanggal_kembali` DATE,
  `status_pengembalian` ENUM('dipinjam', 'dikembalikan') DEFAULT 'dipinjam',
  FOREIGN KEY (`id_buku`) REFERENCES `buku`(`id_buku`) ON DELETE CASCADE,
  FOREIGN KEY (`id_anggota`) REFERENCES `anggota`(`id_anggota`) ON DELETE CASCADE,
  FOREIGN KEY (`id_petugas`) REFERENCES `petugas`(`id_petugas`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
