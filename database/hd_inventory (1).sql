-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 17 Des 2019 pada 20.13
-- Versi server: 5.7.28-0ubuntu0.18.04.4
-- Versi PHP: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hd_inventory`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_barang`
--

CREATE TABLE `hd_barang` (
  `id_barang` int(11) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `stock_minimal` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `id_golongan_barang` int(11) NOT NULL,
  `id_jenis_barang` int(11) NOT NULL,
  `deskripsi` text,
  `dibuat_oleh` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hd_barang`
--

INSERT INTO `hd_barang` (`id_barang`, `kode_barang`, `nama_barang`, `stock`, `stock_minimal`, `id_satuan`, `id_golongan_barang`, `id_jenis_barang`, `deskripsi`, `dibuat_oleh`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PRCT01', 'Minargip', 100, 10, 2, 2, 2, 'obat panas', 1, '1', '2019-12-02 00:00:00', '2019-12-02 00:00:00'),
(2, 'PRC01', 'Procold', 100, 10, 1, 1, 1, 'obat flu', 1, '1', '2019-12-02 00:00:00', '2019-12-02 00:00:00'),
(3, 'MX01', 'Mixagrip', 100, 10, 1, 2, 2, 'obat pilek', 1, '1', '2019-12-02 00:00:00', '2019-12-02 00:00:00'),
(5, 'OBT01', 'Adem Sari', 0, 100, 1, 1, 1, 'obat panas dalam', 1, '1', '2019-12-14 05:36:35', '2019-12-14 05:36:35'),
(13, 'OBT02', 'Lasegar', 0, 120, 2, 1, 3, 'obat panas dalam', 1, '1', '2019-12-14 06:04:49', '2019-12-15 01:48:17'),
(17, 'xxx', 'ini adalah xxx', 0, 0, 0, 0, 0, NULL, 0, '1', '2019-12-14 22:42:58', '2019-12-14 22:42:58'),
(18, 'yyy', 'ini adalah yyy', 0, 0, 0, 0, 0, NULL, 0, '1', '2019-12-14 22:42:58', '2019-12-14 22:42:58'),
(19, 'XXX-01', 'xxx', 0, 200, 1, 1, 1, 'ini adalah xxx', 1, '0', '2019-12-14 23:20:50', '2019-12-15 13:03:37'),
(20, 'YYY-02', 'yyy', 0, 250, 2, 1, 2, 'ini adalah yyy', 1, '1', '2019-12-14 23:20:50', '2019-12-14 23:20:50'),
(25, 'Test01', 'test', 0, 1, 1, 1, 1, 'testt', 1, '1', '2019-12-15 01:56:48', '2019-12-15 13:34:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_barang_foto`
--

CREATE TABLE `hd_barang_foto` (
  `id_barang_foto` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_barang_golongan`
--

CREATE TABLE `hd_barang_golongan` (
  `id_golongan_barang` int(11) NOT NULL,
  `kode_golongan` varchar(20) NOT NULL,
  `nama_golongan` varchar(100) NOT NULL,
  `status` enum('1','0') NOT NULL COMMENT '1->aktif, 0->tdak aktif',
  `keterangan` text NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hd_barang_golongan`
--

INSERT INTO `hd_barang_golongan` (`id_golongan_barang`, `kode_golongan`, `nama_golongan`, `status`, `keterangan`, `dibuat_oleh`, `created_at`, `updated_at`) VALUES
(1, 'BT', 'Bebas Terbatas', '1', '', 1, '2019-12-02 00:00:00', '2019-12-02 00:00:00'),
(2, 'B', 'Bebas', '1', '', 1, '2019-12-02 00:00:00', '2019-12-02 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_barang_jenis`
--

CREATE TABLE `hd_barang_jenis` (
  `id_jenis_barang` int(11) NOT NULL,
  `kode_jenis_barang` varchar(20) NOT NULL,
  `nama_jenis_barang` varchar(100) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `keterangan` text NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hd_barang_jenis`
--

INSERT INTO `hd_barang_jenis` (`id_jenis_barang`, `kode_jenis_barang`, `nama_jenis_barang`, `status`, `keterangan`, `dibuat_oleh`, `created_at`, `updated_at`) VALUES
(1, 'P01', 'Pil', '1', '', 1, '2019-12-02 00:00:00', '2019-12-02 00:00:00'),
(2, 'K01', 'Kaplet', '1', '', 1, '2019-12-02 00:00:00', '2019-12-02 00:00:00'),
(3, 'L01', 'Larutan', '1', '', 1, '2019-12-02 00:00:00', '2019-12-02 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_barang_satuan`
--

CREATE TABLE `hd_barang_satuan` (
  `id_satuan` int(11) NOT NULL,
  `kode_satuan` varchar(20) NOT NULL,
  `nama_satuan` varchar(20) NOT NULL,
  `satuan_terkecil` varchar(20) NOT NULL,
  `isi` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `status` enum('1','0') NOT NULL COMMENT '1->aktif, 0->tidak aktif',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hd_barang_satuan`
--

INSERT INTO `hd_barang_satuan` (`id_satuan`, `kode_satuan`, `nama_satuan`, `satuan_terkecil`, `isi`, `keterangan`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PCS01', 'Pcs', 'Pcs', 1, '', '1', '2019-12-02 00:00:00', '2019-12-02 00:00:00'),
(2, 'BOX12', 'Box', 'Pcs', 12, '', '1', '2019-12-02 00:00:00', '2019-12-02 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_barang_vendor`
--

CREATE TABLE `hd_barang_vendor` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `tanggal_kadaluarsa` date NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `no_batch` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hd_barang_vendor`
--

INSERT INTO `hd_barang_vendor` (`id`, `id_barang`, `id_vendor`, `id_satuan`, `qty`, `harga_beli`, `harga_jual`, `tanggal_kadaluarsa`, `dibuat_oleh`, `created_at`, `updated_at`, `no_batch`) VALUES
(1, 3, 1, 2, 100, 15000, 0, '2019-12-31', 1, '2019-12-02 00:00:00', '2019-12-02 00:00:00', ''),
(2, 1, 1, 2, 120, 15500, 0, '2019-12-30', 1, '2019-12-02 00:00:00', '2019-12-02 00:00:00', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_berita_acara`
--

CREATE TABLE `hd_berita_acara` (
  `id_berita_acara` int(11) NOT NULL,
  `no_berita_acara` varchar(20) NOT NULL,
  `tanggal` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL COMMENT '1->disetujui, 0->menunggu persetujuan',
  `dibuat_oleh` int(11) NOT NULL,
  `yang_menyerahkan` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_berita_acara_detail`
--

CREATE TABLE `hd_berita_acara_detail` (
  `id_berita_acara_detail` int(11) NOT NULL,
  `id_berita_acara` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `keterangan` int(11) NOT NULL,
  `no_faktur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_data_apotek`
--

CREATE TABLE `hd_data_apotek` (
  `id_apotek` int(11) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telepon` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `penanggung_jawab` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hd_data_apotek`
--

INSERT INTO `hd_data_apotek` (`id_apotek`, `kode`, `nama`, `telepon`, `email`, `alamat`, `penanggung_jawab`, `created_at`, `updated_at`) VALUES
(1, 'RS', 'RYAN SEHAT', '085649184363', 'ryansaputro52@gmail.com', 'Jakarta', 'Ryan', '2019-12-07 00:00:00', '2019-12-07 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_diskon`
--

CREATE TABLE `hd_diskon` (
  `id_diskon` int(11) NOT NULL,
  `nama_diskon` varchar(100) NOT NULL,
  `jenis_diskon` enum('1','0') NOT NULL COMMENT '1->diskon persen, 0->diskon rupiah',
  `jumlah_diskon` int(11) NOT NULL,
  `tanggal_mulai_diskon` datetime NOT NULL,
  `tanggal_akhir_diskon` datetime NOT NULL,
  `keterangan` text NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_diskon_detail`
--

CREATE TABLE `hd_diskon_detail` (
  `id_diskon_detail` int(11) NOT NULL,
  `id_diskon` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_gudang`
--

CREATE TABLE `hd_gudang` (
  `id_gudang` int(11) NOT NULL,
  `kode_gudang` varchar(20) NOT NULL,
  `nama_gudang` varchar(100) NOT NULL,
  `lokasi_gudang` varchar(100) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `keterangan` text NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_pemesanan`
--

CREATE TABLE `hd_pemesanan` (
  `id_pemesanan` int(11) NOT NULL,
  `no_pemesanan` varchar(30) NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `dibuat_tgl` datetime NOT NULL,
  `status` enum('1','2','3','4','5','6','7') NOT NULL COMMENT '1 -> sukses, 2->revisi, 3-> selesai, 4->sampah, 5->barang belum lengkap, 6->draf, 7->file asli sebelum revisi) jika status 3 tidak bisa rubah ke 4',
  `mengetahui_oleh` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `catatan` text NOT NULL,
  `referensi_id_pemesanan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hd_pemesanan`
--

INSERT INTO `hd_pemesanan` (`id_pemesanan`, `no_pemesanan`, `dibuat_oleh`, `dibuat_tgl`, `status`, `mengetahui_oleh`, `id_vendor`, `created_at`, `updated_at`, `catatan`, `referensi_id_pemesanan`) VALUES
(1, '001ORDER08122019', 1, '2019-12-08 00:00:00', '3', 0, 1, '2019-12-08 00:09:40', '2019-12-08 21:45:26', 'segera diproses', NULL),
(2, '002ORDER08122019', 1, '2019-12-08 00:00:00', '7', 0, 1, '2019-12-08 00:10:37', '2019-12-08 00:10:59', 'oke', NULL),
(3, '002ORDER08122019REV001', 1, '2019-12-08 00:00:00', '4', 0, 1, '2019-12-08 00:10:59', '2019-12-08 00:27:18', 'oke', 2),
(4, '003ORDER08122019', 1, '2019-12-08 00:00:00', '7', 0, 1, '2019-12-08 00:14:43', '2019-12-08 00:15:20', 'oke', NULL),
(5, '003ORDER08122019REV001', 1, '2019-12-08 00:00:00', '7', 0, 1, '2019-12-08 00:15:20', '2019-12-08 00:21:11', 'oke', 4),
(6, '003ORDER08122019REV002', 1, '2019-12-08 00:00:00', '3', 0, 1, '2019-12-08 00:21:11', '2019-12-08 22:55:58', 'oke', 5),
(7, '004ORDER08122019', 1, '2019-12-08 00:00:00', '7', 0, 1, '2019-12-08 00:22:11', '2019-12-08 00:22:31', 'segera diproses', NULL),
(8, '004ORDER08122019REV001', 1, '2019-12-08 00:00:00', '3', 0, 1, '2019-12-08 00:22:31', '2019-12-08 22:58:29', 'segera diproses', 7),
(9, '005ORDER08122019', 1, '2019-12-08 00:00:00', '7', 0, 1, '2019-12-08 08:05:21', '2019-12-08 08:06:18', 'segera diproses ya gaes', NULL),
(10, '005ORDER08122019REV001', 1, '2019-12-08 00:00:00', '2', 0, 1, '2019-12-08 08:06:18', '2019-12-08 08:06:18', 'segera diproses ya gaes', 9),
(11, '006ORDER09122019', 1, '2019-12-09 00:00:00', '1', 0, 1, '2019-12-09 07:08:47', '2019-12-09 07:08:47', 'segera diproses', NULL),
(12, '007ORDER09122019', 1, '2019-12-09 00:00:00', '7', 0, 1, '2019-12-09 08:20:23', '2019-12-09 08:21:26', 'segera diproses', NULL),
(13, '007ORDER09122019REV001', 1, '2019-12-09 00:00:00', '3', 0, 1, '2019-12-09 08:21:26', '2019-12-09 08:43:51', 'segera diproses', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_pemesanan_detail`
--

CREATE TABLE `hd_pemesanan_detail` (
  `id_pemesanan_detail` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hd_pemesanan_detail`
--

INSERT INTO `hd_pemesanan_detail` (`id_pemesanan_detail`, `id_pemesanan`, `id_barang`, `qty`, `harga`, `keterangan`) VALUES
(1, 1, 3, 100, 10000, 'diskon 5000'),
(2, 1, 1, 120, 15500, '-'),
(3, 2, 3, 100, 15000, NULL),
(4, 2, 1, 120, 15500, NULL),
(5, 3, 3, 10, 15000, NULL),
(6, 3, 1, 20, 15500, NULL),
(7, 4, 3, 100, 10000, 'mixagrip dikon 5000'),
(8, 4, 1, 120, 15500, 'ga diskon'),
(9, 5, 3, 50, 10000, 'mixagrip dikon 5000'),
(10, 5, 1, 100, 15500, 'ga diskon'),
(11, 6, 3, 50, 10000, 'mixagrip dikon 5000'),
(12, 6, 1, 10, 15500, 'ga diskon'),
(13, 7, 3, 10, 10000, 'mixagrip dikon 5000'),
(14, 7, 1, 120, 15500, 'ga diskon'),
(15, 8, 3, 100, 10000, 'mixagrip dikon 5000'),
(16, 8, 1, 120, 15500, 'ga diskon'),
(17, 9, 3, 100, 10000, 'barang ini sedang diskon'),
(18, 9, 1, 120, 15500, NULL),
(19, 10, 3, 10, 10000, 'barang ini sedang diskon'),
(20, 10, 1, 20, 15500, NULL),
(21, 11, 3, 100, 5000, 'diskon 10 ribu'),
(22, 11, 1, 20, 15500, NULL),
(23, 12, 3, 10, 10000, 'ada diskon'),
(24, 12, 1, 20, 15500, NULL),
(25, 13, 3, 100, 10000, 'ada diskon'),
(26, 13, 1, 20, 15500, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_penerimaan`
--

CREATE TABLE `hd_penerimaan` (
  `id_penerimaan` int(11) NOT NULL,
  `no_penerimaan` varchar(20) NOT NULL,
  `no_faktur` varchar(50) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `diterima_oleh` int(11) NOT NULL,
  `mengetahui_oleh` int(11) DEFAULT NULL,
  `tanggal_penerimaan` datetime NOT NULL,
  `catatan` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hd_penerimaan`
--

INSERT INTO `hd_penerimaan` (`id_penerimaan`, `no_penerimaan`, `no_faktur`, `id_pemesanan`, `diterima_oleh`, `mengetahui_oleh`, `tanggal_penerimaan`, `catatan`, `created_at`, `updated_at`) VALUES
(2, '001RECEIVE08122019', '100020003000', 1, 1, NULL, '2019-12-08 00:00:00', 'mantap', '2019-12-08 21:45:26', '2019-12-08 21:45:26'),
(3, '002RECEIVE08122019', '21212121212', 6, 1, NULL, '2019-12-08 00:00:00', 'mantap', '2019-12-08 22:17:50', '2019-12-08 22:17:50'),
(4, '003RECEIVE08122019', '212121212123', 6, 1, NULL, '2019-12-08 00:00:00', 'mantap', '2019-12-08 22:22:27', '2019-12-08 22:22:27'),
(5, '004RECEIVE08122019', '21212121212', 6, 1, NULL, '2019-12-08 00:00:00', 'oke', '2019-12-08 22:55:58', '2019-12-08 22:55:58'),
(6, '005RECEIVE08122019', '21212121212', 8, 1, NULL, '2019-12-08 00:00:00', 'mantap', '2019-12-08 22:56:58', '2019-12-08 22:56:58'),
(7, '006RECEIVE08122019', '212121212123', 8, 1, NULL, '2019-12-08 00:00:00', 'mantap', '2019-12-08 22:58:29', '2019-12-08 22:58:29'),
(8, '007RECEIVE09122019', '21212121212', 13, 1, NULL, '2019-12-09 00:00:00', 'mantap', '2019-12-09 08:23:14', '2019-12-09 08:23:14'),
(9, '008RECEIVE09122019', '41331211323', 13, 1, NULL, '2019-12-09 00:00:00', 'mantap', '2019-12-09 08:43:27', '2019-12-09 08:43:27'),
(10, '009RECEIVE09122019', '41331211323', 13, 1, NULL, '2019-12-09 00:00:00', 'mantap', '2019-12-09 08:43:51', '2019-12-09 08:43:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_penerimaan_detail`
--

CREATE TABLE `hd_penerimaan_detail` (
  `id_penerimaan_detail` int(11) NOT NULL,
  `id_penerimaan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `keterangan` text,
  `id_rak` int(11) NOT NULL,
  `tanggal_kadaluarsa` datetime NOT NULL,
  `no_batch` varchar(20) NOT NULL,
  `barcode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hd_penerimaan_detail`
--

INSERT INTO `hd_penerimaan_detail` (`id_penerimaan_detail`, `id_penerimaan`, `id_barang`, `qty`, `keterangan`, `id_rak`, `tanggal_kadaluarsa`, `no_batch`, `barcode`) VALUES
(1, 2, 3, 100, NULL, 3, '2020-01-01 00:00:00', '12130362', NULL),
(2, 2, 1, 120, NULL, 5, '2020-01-02 00:00:00', '12130363', NULL),
(3, 3, 3, 30, NULL, 3, '2020-01-03 00:00:00', '111111', NULL),
(4, 3, 1, 5, NULL, 5, '2020-01-04 00:00:00', '222222', NULL),
(5, 4, 3, 10, NULL, 3, '2020-01-01 00:00:00', '1212121', NULL),
(6, 4, 1, 2, NULL, 4, '2020-01-02 00:00:00', '32323232', NULL),
(7, 5, 3, 10, NULL, 3, '2020-01-01 00:00:00', '131313', NULL),
(8, 5, 1, 3, NULL, 5, '2020-01-02 00:00:00', '21321313', NULL),
(9, 6, 3, 50, NULL, 3, '2020-01-01 00:00:00', '12121212', NULL),
(10, 6, 1, 60, NULL, 5, '2020-01-02 00:00:00', '121212121', NULL),
(11, 7, 3, 50, NULL, 5, '2019-12-31 00:00:00', '1121212', NULL),
(12, 7, 1, 60, NULL, 4, '2020-01-01 00:00:00', '12121312', NULL),
(13, 8, 3, 50, NULL, 3, '2020-01-01 00:00:00', '123', NULL),
(14, 8, 1, 20, NULL, 5, '2020-01-02 00:00:00', '321', NULL),
(15, 9, 3, 25, NULL, 3, '2020-01-01 00:00:00', '313131313', NULL),
(16, 10, 3, 25, NULL, 5, '2020-01-03 00:00:00', '1441141414', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_rak`
--

CREATE TABLE `hd_rak` (
  `id_rak` int(11) NOT NULL,
  `kode_rak` varchar(20) NOT NULL,
  `id_gudang` int(11) NOT NULL,
  `nama_rak` varchar(100) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `keterangan` text NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hd_rak`
--

INSERT INTO `hd_rak` (`id_rak`, `kode_rak`, `id_gudang`, `nama_rak`, `status`, `keterangan`, `dibuat_oleh`, `created_at`, `updated_at`) VALUES
(3, 'RDPN1', 1, 'Rak Depan 01', '1', '', 1, '2019-12-08 00:00:00', '2019-12-08 00:00:00'),
(4, 'RDPN2', 2, 'Rak Depan 02', '1', '', 1, '2019-12-08 00:00:00', '2019-12-08 00:00:00'),
(5, 'RBLK1', 1, 'Rak Belakang 01', '1', '', 1, '2019-12-08 00:00:00', '2019-12-08 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_retur_barang`
--

CREATE TABLE `hd_retur_barang` (
  `id_retur_barang` int(11) NOT NULL,
  `no_retur_barang` varchar(20) NOT NULL,
  `id_penerimaan` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `deskripsi` text NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `mengetahui_oleh` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_retur_barang_detail`
--

CREATE TABLE `hd_retur_barang_detail` (
  `id_retur_barang_detail` int(11) NOT NULL,
  `id_retur_barang` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_stock_opname`
--

CREATE TABLE `hd_stock_opname` (
  `id_stock_opname` int(11) NOT NULL,
  `tanggal_stock_opname` datetime NOT NULL,
  `nama_stock_opname` varchar(100) NOT NULL,
  `no_dokumen` varchar(20) NOT NULL,
  `revisi` int(11) NOT NULL,
  `deskripsi_stock_opname` text NOT NULL,
  `pihak_terkait` int(11) NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `diperiksa_oleh` int(11) NOT NULL,
  `disetujui_oleh` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_stock_opname_detail`
--

CREATE TABLE `hd_stock_opname_detail` (
  `id_stock_opname_detail` int(11) NOT NULL,
  `id_stock_opname` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah_persedian_awal` int(11) NOT NULL,
  `jumlah_barang_keluar` int(11) NOT NULL,
  `jumlah_barang_masuk` int(11) NOT NULL,
  `jumlah_persedian_akhir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_vendor`
--

CREATE TABLE `hd_vendor` (
  `id_vendor` int(11) NOT NULL,
  `kode_vendor` varchar(20) NOT NULL,
  `nama_vendor` varchar(100) NOT NULL,
  `alamat_vendor` varchar(100) NOT NULL,
  `tlp_vendor` varchar(12) NOT NULL,
  `pimpinan` varchar(30) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `keterangan` text NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hd_vendor`
--

INSERT INTO `hd_vendor` (`id_vendor`, `kode_vendor`, `nama_vendor`, `alamat_vendor`, `tlp_vendor`, `pimpinan`, `status`, `keterangan`, `dibuat_oleh`, `created_at`, `updated_at`) VALUES
(1, 'RMJ', 'Ryan Medicine Jaya', 'Magetan', '03517755305', 'Ryan Saputro', '1', '', 1, '2019-12-02 00:00:00', '2019-12-02 00:00:00'),
(2, 'SOI', 'Supply Obat Indonesia', 'Magetan', '03517755305', 'Ryan Saputro', '1', '', 1, '2019-12-02 00:00:00', '2019-12-02 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log`
--

CREATE TABLE `log` (
  `id` bigint(20) NOT NULL,
  `id_data` int(11) NOT NULL,
  `table_data` varchar(100) NOT NULL,
  `field` varchar(255) NOT NULL,
  `values` longtext NOT NULL,
  `event` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `log`
--

INSERT INTO `log` (`id`, `id_data`, `table_data`, `field`, `values`, `event`, `created_at`) VALUES
(7, 5, 'meta', 'status', '1', 'UPDATE', '2019-05-27 16:51:51'),
(8, 5, 'meta', 'name', 'test', 'UPDATE', '2019-05-27 16:52:19'),
(9, 6, 'meta', 'name', 'test trigger', 'UPDATE', '2019-05-27 16:53:36'),
(10, 6, 'meta', 'all', 'test', 'DELETE', '2019-05-27 16:54:01'),
(11, 7, 'meta', 'DELETE', 'DELETE', 'DELETE', '2019-05-27 16:55:05'),
(12, 13, 'menu', 'name', 'Adsense', 'UPDATE', '2019-05-27 17:02:49'),
(13, 13, 'menu', 'name', 'Adsenses', 'UPDATE', '2019-05-27 17:03:04'),
(14, 9, 'menu', 'status', '1', 'UPDATE', '2019-05-27 17:04:26'),
(15, 10, 'menu', 'status', '1', 'UPDATE', '2019-05-27 17:04:26'),
(16, 3, 'meta', 'status', '1', 'UPDATE', '2019-05-28 05:37:16'),
(17, 3, 'meta', 'status', '0', 'UPDATE', '2019-05-28 05:38:17'),
(18, 3, 'meta', 'status', '1', 'UPDATE', '2019-05-28 05:43:52'),
(19, 9, 'menu', 'status', '0', 'UPDATE', '2019-05-28 05:47:27'),
(20, 10, 'menu', 'status', '0', 'UPDATE', '2019-05-28 05:47:34'),
(21, 3, 'meta', 'status', '0', 'UPDATE', '2019-05-28 06:17:23'),
(22, 7, 'menu', 'rgt', '0', 'UPDATE', '2019-06-01 08:37:08'),
(23, 7, 'menu', 'lft', '0', 'UPDATE', '2019-06-01 08:37:08'),
(24, 8, 'menu', 'rgt', '0', 'UPDATE', '2019-06-01 08:37:08'),
(25, 8, 'menu', 'lft', '0', 'UPDATE', '2019-06-01 08:37:08'),
(26, 9, 'menu', 'rgt', '0', 'UPDATE', '2019-06-01 08:37:08'),
(27, 9, 'menu', 'lft', '0', 'UPDATE', '2019-06-01 08:37:08'),
(28, 10, 'menu', 'rgt', '0', 'UPDATE', '2019-06-01 08:37:08'),
(29, 10, 'menu', 'lft', '0', 'UPDATE', '2019-06-01 08:37:08'),
(30, 10, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-01 08:37:08'),
(31, 8, 'menu', 'rgt', '4', 'UPDATE', '2019-06-01 08:45:32'),
(32, 9, 'menu', 'rgt', '8', 'UPDATE', '2019-06-01 08:45:32'),
(33, 9, 'menu', 'lft', '5', 'UPDATE', '2019-06-01 08:45:32'),
(34, 9, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-01 08:45:32'),
(35, 10, 'menu', 'rgt', '7', 'UPDATE', '2019-06-01 08:45:32'),
(36, 10, 'menu', 'lft', '6', 'UPDATE', '2019-06-01 08:45:32'),
(37, 9, 'menu', 'id_parent', '8', 'UPDATE', '2019-06-01 08:46:34'),
(38, 9, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-01 08:47:53'),
(39, 7, 'menu', 'rgt', '2', 'UPDATE', '2019-06-01 09:16:14'),
(40, 8, 'menu', 'rgt', '8', 'UPDATE', '2019-06-01 09:16:14'),
(41, 8, 'menu', 'lft', '3', 'UPDATE', '2019-06-01 09:16:14'),
(42, 8, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-01 09:16:14'),
(43, 9, 'menu', 'rgt', '7', 'UPDATE', '2019-06-01 09:16:14'),
(44, 9, 'menu', 'lft', '4', 'UPDATE', '2019-06-01 09:16:14'),
(45, 10, 'menu', 'rgt', '6', 'UPDATE', '2019-06-01 09:16:14'),
(46, 10, 'menu', 'lft', '5', 'UPDATE', '2019-06-01 09:16:14'),
(47, 7, 'menu', 'rgt', '8', 'UPDATE', '2019-06-01 09:17:41'),
(48, 8, 'menu', 'rgt', '7', 'UPDATE', '2019-06-01 09:17:41'),
(49, 8, 'menu', 'lft', '2', 'UPDATE', '2019-06-01 09:17:41'),
(50, 8, 'menu', 'id_parent', '7', 'UPDATE', '2019-06-01 09:17:41'),
(51, 9, 'menu', 'rgt', '6', 'UPDATE', '2019-06-01 09:17:41'),
(52, 9, 'menu', 'lft', '3', 'UPDATE', '2019-06-01 09:17:41'),
(53, 10, 'menu', 'rgt', '5', 'UPDATE', '2019-06-01 09:17:41'),
(54, 10, 'menu', 'lft', '4', 'UPDATE', '2019-06-01 09:17:41'),
(55, 7, 'menu', 'rgt', '2', 'UPDATE', '2019-06-01 09:25:28'),
(56, 8, 'menu', 'rgt', '8', 'UPDATE', '2019-06-01 09:25:28'),
(57, 8, 'menu', 'lft', '3', 'UPDATE', '2019-06-01 09:25:28'),
(58, 8, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-01 09:25:28'),
(59, 9, 'menu', 'rgt', '7', 'UPDATE', '2019-06-01 09:25:28'),
(60, 9, 'menu', 'lft', '4', 'UPDATE', '2019-06-01 09:25:28'),
(61, 10, 'menu', 'rgt', '6', 'UPDATE', '2019-06-01 09:25:28'),
(62, 10, 'menu', 'lft', '5', 'UPDATE', '2019-06-01 09:25:28'),
(63, 7, 'menu', 'rgt', '8', 'UPDATE', '2019-06-01 09:25:38'),
(64, 8, 'menu', 'rgt', '7', 'UPDATE', '2019-06-01 09:25:38'),
(65, 8, 'menu', 'lft', '2', 'UPDATE', '2019-06-01 09:25:38'),
(66, 8, 'menu', 'id_parent', '7', 'UPDATE', '2019-06-01 09:25:38'),
(67, 9, 'menu', 'rgt', '6', 'UPDATE', '2019-06-01 09:25:38'),
(68, 9, 'menu', 'lft', '3', 'UPDATE', '2019-06-01 09:25:38'),
(69, 10, 'menu', 'rgt', '5', 'UPDATE', '2019-06-01 09:25:38'),
(70, 10, 'menu', 'lft', '4', 'UPDATE', '2019-06-01 09:25:38'),
(71, 8, 'menu', 'rgt', '8', 'UPDATE', '2019-06-01 09:50:04'),
(72, 9, 'menu', 'rgt', '7', 'UPDATE', '2019-06-01 09:50:04'),
(73, 9, 'menu', 'lft', '4', 'UPDATE', '2019-06-01 09:50:04'),
(74, 9, 'menu', 'id_parent', '8', 'UPDATE', '2019-06-01 09:50:04'),
(75, 10, 'menu', 'rgt', '6', 'UPDATE', '2019-06-01 09:50:04'),
(76, 10, 'menu', 'lft', '5', 'UPDATE', '2019-06-01 09:50:04'),
(77, 10, 'menu', 'id_parent', '9', 'UPDATE', '2019-06-01 09:50:04'),
(78, 8, 'menu', 'rgt', '4', 'UPDATE', '2019-06-01 09:50:33'),
(79, 9, 'menu', 'rgt', '6', 'UPDATE', '2019-06-01 09:50:33'),
(80, 9, 'menu', 'lft', '5', 'UPDATE', '2019-06-01 09:50:33'),
(81, 9, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-01 09:50:33'),
(82, 8, 'menu', 'rgt', '6', 'UPDATE', '2019-06-01 09:50:44'),
(83, 9, 'menu', 'rgt', '5', 'UPDATE', '2019-06-01 09:50:44'),
(84, 9, 'menu', 'lft', '4', 'UPDATE', '2019-06-01 09:50:44'),
(85, 9, 'menu', 'id_parent', '8', 'UPDATE', '2019-06-01 09:50:44'),
(86, 8, 'menu', 'rgt', '4', 'UPDATE', '2019-06-02 10:04:32'),
(87, 9, 'menu', 'rgt', '6', 'UPDATE', '2019-06-02 10:04:32'),
(88, 9, 'menu', 'lft', '5', 'UPDATE', '2019-06-02 10:04:32'),
(89, 9, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-02 10:04:32'),
(90, 7, 'menu', 'rgt', '2', 'UPDATE', '2019-06-02 10:05:41'),
(91, 8, 'menu', 'rgt', '6', 'UPDATE', '2019-06-02 10:05:41'),
(92, 8, 'menu', 'lft', '3', 'UPDATE', '2019-06-02 10:05:41'),
(93, 8, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-02 10:05:41'),
(94, 9, 'menu', 'rgt', '5', 'UPDATE', '2019-06-02 10:05:41'),
(95, 9, 'menu', 'lft', '4', 'UPDATE', '2019-06-02 10:05:41'),
(96, 7, 'menu', 'rgt', '6', 'UPDATE', '2019-06-02 10:06:04'),
(97, 8, 'menu', 'rgt', '5', 'UPDATE', '2019-06-02 10:06:04'),
(98, 8, 'menu', 'lft', '2', 'UPDATE', '2019-06-02 10:06:04'),
(99, 8, 'menu', 'id_parent', '7', 'UPDATE', '2019-06-02 10:06:04'),
(100, 9, 'menu', 'rgt', '4', 'UPDATE', '2019-06-02 10:06:04'),
(101, 9, 'menu', 'lft', '3', 'UPDATE', '2019-06-02 10:06:04'),
(102, 8, 'menu', 'rgt', '6', 'UPDATE', '2019-06-02 10:06:57'),
(103, 9, 'menu', 'rgt', '5', 'UPDATE', '2019-06-02 10:06:57'),
(104, 10, 'menu', 'rgt', '8', 'UPDATE', '2019-06-02 10:06:57'),
(105, 10, 'menu', 'lft', '7', 'UPDATE', '2019-06-02 10:06:57'),
(106, 10, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-02 10:06:57'),
(107, 9, 'menu', 'rgt', '7', 'UPDATE', '2019-06-02 10:07:07'),
(108, 10, 'menu', 'rgt', '6', 'UPDATE', '2019-06-02 10:07:07'),
(109, 10, 'menu', 'lft', '5', 'UPDATE', '2019-06-02 10:07:07'),
(110, 10, 'menu', 'id_parent', '9', 'UPDATE', '2019-06-02 10:07:07'),
(111, 9, 'menu', 'rgt', '5', 'UPDATE', '2019-06-02 10:07:42'),
(112, 10, 'menu', 'rgt', '7', 'UPDATE', '2019-06-02 10:07:42'),
(113, 10, 'menu', 'lft', '6', 'UPDATE', '2019-06-02 10:07:42'),
(114, 10, 'menu', 'id_parent', '8', 'UPDATE', '2019-06-02 10:07:42'),
(115, 8, 'menu', 'rgt', '8', 'UPDATE', '2019-06-02 10:10:41'),
(116, 9, 'menu', 'rgt', '7', 'UPDATE', '2019-06-02 10:10:41'),
(117, 10, 'menu', 'rgt', '6', 'UPDATE', '2019-06-02 10:10:41'),
(118, 10, 'menu', 'lft', '5', 'UPDATE', '2019-06-02 10:10:41'),
(119, 10, 'menu', 'id_parent', '9', 'UPDATE', '2019-06-02 10:10:41'),
(120, 8, 'menu', 'rgt', '6', 'UPDATE', '2019-06-02 10:12:00'),
(121, 9, 'menu', 'rgt', '5', 'UPDATE', '2019-06-02 10:12:00'),
(122, 10, 'menu', 'rgt', '8', 'UPDATE', '2019-06-02 10:12:00'),
(123, 10, 'menu', 'lft', '7', 'UPDATE', '2019-06-02 10:12:00'),
(124, 10, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-02 10:12:00'),
(125, 8, 'menu', 'rgt', '8', 'UPDATE', '2019-06-02 10:12:19'),
(126, 9, 'menu', 'rgt', '7', 'UPDATE', '2019-06-02 10:12:19'),
(127, 9, 'menu', 'lft', '4', 'UPDATE', '2019-06-02 10:12:19'),
(128, 9, 'menu', 'id_parent', '8', 'UPDATE', '2019-06-02 10:12:19'),
(129, 10, 'menu', 'rgt', '6', 'UPDATE', '2019-06-02 10:12:19'),
(130, 10, 'menu', 'lft', '5', 'UPDATE', '2019-06-02 10:12:19'),
(131, 9, 'menu', 'rgt', '8', 'UPDATE', '2019-06-02 10:12:28'),
(132, 10, 'menu', 'rgt', '7', 'UPDATE', '2019-06-02 10:12:28'),
(133, 10, 'menu', 'lft', '6', 'UPDATE', '2019-06-02 10:12:28'),
(134, 10, 'menu', 'id_parent', '9', 'UPDATE', '2019-06-02 10:12:28'),
(135, 16, 'menu', 'menu_role', '17', 'UPDATE', '2019-06-03 17:50:01'),
(136, 16, 'menu', 'DELETE', 'DELETE', 'DELETE', '2019-06-03 17:54:22'),
(137, 17, 'menu', 'DELETE', 'DELETE', 'DELETE', '2019-06-03 17:55:48'),
(138, 18, 'menu', 'DELETE', 'DELETE', 'DELETE', '2019-06-03 17:56:40'),
(139, 19, 'menu', 'rgt', '0', 'UPDATE', '2019-06-03 17:58:50'),
(140, 19, 'menu', 'lft', '0', 'UPDATE', '2019-06-03 17:58:50'),
(141, 19, 'menu', 'rgt', '10', 'UPDATE', '2019-06-03 18:07:26'),
(142, 19, 'menu', 'lft', '9', 'UPDATE', '2019-06-03 18:07:26'),
(143, 8, 'menu', 'rgt', '4', 'UPDATE', '2019-06-03 18:07:26'),
(144, 8, 'menu', 'lft', '3', 'UPDATE', '2019-06-03 18:07:26'),
(145, 9, 'menu', 'rgt', '6', 'UPDATE', '2019-06-03 18:07:26'),
(146, 9, 'menu', 'lft', '5', 'UPDATE', '2019-06-03 18:07:26'),
(147, 10, 'menu', 'rgt', '8', 'UPDATE', '2019-06-03 18:07:26'),
(148, 10, 'menu', 'lft', '7', 'UPDATE', '2019-06-03 18:07:26'),
(149, 8, 'menu', 'rgt', '6', 'UPDATE', '2019-06-03 18:08:07'),
(150, 8, 'menu', 'lft', '5', 'UPDATE', '2019-06-03 18:08:07'),
(151, 9, 'menu', 'rgt', '8', 'UPDATE', '2019-06-03 18:08:07'),
(152, 9, 'menu', 'lft', '7', 'UPDATE', '2019-06-03 18:08:07'),
(153, 19, 'menu', 'rgt', '4', 'UPDATE', '2019-06-03 18:08:07'),
(154, 19, 'menu', 'lft', '3', 'UPDATE', '2019-06-03 18:08:07'),
(155, 7, 'menu', 'order', '7', 'UPDATE', '2019-06-03 18:10:04'),
(156, 8, 'menu', 'order', '8', 'UPDATE', '2019-06-03 18:10:04'),
(157, 9, 'menu', 'order', '9', 'UPDATE', '2019-06-03 18:10:04'),
(158, 10, 'menu', 'rgt', '10', 'UPDATE', '2019-06-03 18:10:04'),
(159, 10, 'menu', 'lft', '9', 'UPDATE', '2019-06-03 18:10:04'),
(160, 10, 'menu', 'order', '10', 'UPDATE', '2019-06-03 18:10:04'),
(161, 19, 'menu', 'rgt', '8', 'UPDATE', '2019-06-03 18:10:04'),
(162, 19, 'menu', 'lft', '7', 'UPDATE', '2019-06-03 18:10:04'),
(163, 9, 'menu', 'rgt', '6', 'UPDATE', '2019-06-03 18:10:35'),
(164, 19, 'menu', 'rgt', '10', 'UPDATE', '2019-06-03 18:10:35'),
(165, 19, 'menu', 'lft', '9', 'UPDATE', '2019-06-03 18:10:35'),
(166, 19, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-03 18:10:35'),
(167, 19, 'menu', 'order', '4', 'UPDATE', '2019-06-03 18:10:35'),
(168, 10, 'menu', 'rgt', '8', 'UPDATE', '2019-06-03 18:10:35'),
(169, 10, 'menu', 'lft', '7', 'UPDATE', '2019-06-03 18:10:35'),
(170, 10, 'menu', 'order', '3', 'UPDATE', '2019-06-03 18:10:35'),
(171, 19, 'menu', 'description', '<p>ini adalah contoh menu roles</p>', 'UPDATE', '2019-06-04 06:13:27'),
(172, 19, 'menu', 'icon', 'pe-7s-science', 'UPDATE', '2019-06-04 06:15:41'),
(173, 19, 'menu', 'name', 'custom', 'UPDATE', '2019-06-04 06:15:41'),
(174, 19, 'menu', 'icon', 'pe-7s-server', 'UPDATE', '2019-06-04 06:15:59'),
(175, 19, 'menu', 'name', 'customs', 'UPDATE', '2019-06-04 06:15:59'),
(176, 9, 'menu', 'rgt', '8', 'UPDATE', '2019-06-04 06:17:21'),
(177, 19, 'menu', 'rgt', '7', 'UPDATE', '2019-06-04 06:17:21'),
(178, 19, 'menu', 'lft', '6', 'UPDATE', '2019-06-04 06:17:21'),
(179, 19, 'menu', 'id_parent', '9', 'UPDATE', '2019-06-04 06:17:21'),
(180, 10, 'menu', 'lft', '9', 'UPDATE', '2019-06-04 06:17:50'),
(181, 10, 'menu', 'order', '4', 'UPDATE', '2019-06-04 06:17:50'),
(182, 19, 'menu', 'rgt', '8', 'UPDATE', '2019-06-04 06:17:50'),
(183, 19, 'menu', 'lft', '7', 'UPDATE', '2019-06-04 06:17:50'),
(184, 19, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-04 06:17:50'),
(185, 19, 'menu', 'order', '3', 'UPDATE', '2019-06-04 06:17:50'),
(186, 19, 'menu', 'description', '<p>ini adalah contoh menu custom</p>', 'UPDATE', '2019-06-04 09:59:27'),
(187, 10, 'menu', 'rgt', '10', 'UPDATE', '2019-06-04 10:00:53'),
(188, 19, 'menu', 'rgt', '9', 'UPDATE', '2019-06-04 10:00:53'),
(189, 19, 'menu', 'lft', '8', 'UPDATE', '2019-06-04 10:00:53'),
(190, 19, 'menu', 'id_parent', '10', 'UPDATE', '2019-06-04 10:00:53'),
(191, 19, 'menu', 'name', 'custom', 'UPDATE', '2019-06-04 10:01:37'),
(192, 19, 'menu', 'status', '1', 'UPDATE', '2019-06-04 10:05:58'),
(193, 19, 'menu', 'status', '0', 'UPDATE', '2019-06-04 10:12:02'),
(194, 19, 'menu', 'DELETE', 'DELETE', 'DELETE', '2019-06-04 14:49:07'),
(195, 10, 'menu', 'DELETE', 'DELETE', 'Contact', '2019-06-04 14:53:10'),
(196, 9, 'menu', 'DELETE', 'Services', 'DELETE', '2019-06-04 14:54:14'),
(197, 8, 'menu', 'DELETE', 'About', 'DELETE', '2019-06-04 14:58:03'),
(198, 20, 'menu', 'rgt', '0', 'UPDATE', '2019-06-04 14:58:50'),
(199, 20, 'menu', 'lft', '0', 'UPDATE', '2019-06-04 14:58:50'),
(200, 20, 'menu', 'DELETE', 'About', 'DELETE', '2019-06-04 15:04:35'),
(201, 21, 'menu', 'rgt', '0', 'UPDATE', '2019-06-04 15:05:58'),
(202, 21, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-04 15:06:23'),
(203, 1, 'menu', 'rgt', '0', 'UPDATE', '2019-06-04 15:09:33'),
(204, 1, 'menu', 'lft', '0', 'UPDATE', '2019-06-04 15:09:33'),
(205, 1, 'menu', 'order', '1', 'UPDATE', '2019-06-04 15:09:33'),
(206, 4, 'menu', 'rgt', '0', 'UPDATE', '2019-06-04 15:09:33'),
(207, 4, 'menu', 'lft', '0', 'UPDATE', '2019-06-04 15:09:33'),
(208, 4, 'menu', 'order', '2', 'UPDATE', '2019-06-04 15:09:33'),
(209, 2, 'menu', 'rgt', '1', 'UPDATE', '2019-06-04 15:09:33'),
(210, 2, 'menu', 'lft', '0', 'UPDATE', '2019-06-04 15:09:33'),
(211, 2, 'menu', 'order', '3', 'UPDATE', '2019-06-04 15:09:33'),
(212, 3, 'menu', 'rgt', '1', 'UPDATE', '2019-06-04 15:09:33'),
(213, 3, 'menu', 'lft', '0', 'UPDATE', '2019-06-04 15:09:33'),
(214, 3, 'menu', 'order', '4', 'UPDATE', '2019-06-04 15:09:33'),
(215, 21, 'menu', 'rgt', '1', 'UPDATE', '2019-06-04 15:09:33'),
(216, 21, 'menu', 'lft', '0', 'UPDATE', '2019-06-04 15:09:33'),
(217, 5, 'menu', 'rgt', '1', 'UPDATE', '2019-06-04 15:09:33'),
(218, 5, 'menu', 'lft', '0', 'UPDATE', '2019-06-04 15:09:33'),
(219, 6, 'menu', 'rgt', '1', 'UPDATE', '2019-06-04 15:09:33'),
(220, 6, 'menu', 'lft', '0', 'UPDATE', '2019-06-04 15:09:33'),
(221, 11, 'menu', 'rgt', '1', 'UPDATE', '2019-06-04 15:09:33'),
(222, 11, 'menu', 'lft', '0', 'UPDATE', '2019-06-04 15:09:33'),
(223, 11, 'menu', 'order', '11', 'UPDATE', '2019-06-04 15:09:33'),
(224, 12, 'menu', 'rgt', '1', 'UPDATE', '2019-06-04 15:09:33'),
(225, 12, 'menu', 'lft', '0', 'UPDATE', '2019-06-04 15:09:33'),
(226, 12, 'menu', 'order', '12', 'UPDATE', '2019-06-04 15:09:33'),
(227, 13, 'menu', 'rgt', '1', 'UPDATE', '2019-06-04 15:09:33'),
(228, 13, 'menu', 'lft', '0', 'UPDATE', '2019-06-04 15:09:33'),
(229, 13, 'menu', 'order', '13', 'UPDATE', '2019-06-04 15:09:33'),
(230, 15, 'menu', 'rgt', '0', 'UPDATE', '2019-06-04 15:09:33'),
(231, 15, 'menu', 'lft', '0', 'UPDATE', '2019-06-04 15:09:33'),
(232, 15, 'menu', 'order', '12', 'UPDATE', '2019-06-04 15:09:33'),
(233, 21, 'menu', 'url', '/custom', 'UPDATE', '2019-06-04 15:17:40'),
(234, 81, 'permissions', 'name', 'page-list', 'UPDATE', '2019-06-07 05:30:03'),
(235, 82, 'permissions', 'name', 'page-create', 'UPDATE', '2019-06-07 05:30:03'),
(236, 83, 'permissions', 'name', 'page-edit', 'UPDATE', '2019-06-07 05:30:03'),
(237, 84, 'permissions', 'name', 'page-delete', 'UPDATE', '2019-06-07 05:30:03'),
(238, 81, 'permissions', 'DELETE', 'pages-list', 'DELETE', '2019-06-07 05:31:41'),
(239, 22, 'menu', 'rgt', '0', 'UPDATE', '2019-06-07 19:20:38'),
(240, 22, 'menu', 'lft', '0', 'UPDATE', '2019-06-07 19:20:38'),
(241, 22, 'menu', 'url', '/services', 'UPDATE', '2019-06-07 19:47:57'),
(242, 23, 'menu', 'rgt', '0', 'UPDATE', '2019-06-07 19:52:04'),
(243, 23, 'menu', 'lft', '0', 'UPDATE', '2019-06-07 19:52:04'),
(244, 22, 'menu', 'rgt', '4', 'UPDATE', '2019-06-07 19:52:34'),
(245, 23, 'menu', 'rgt', '6', 'UPDATE', '2019-06-07 19:52:34'),
(246, 23, 'menu', 'lft', '5', 'UPDATE', '2019-06-07 19:52:34'),
(247, 23, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-07 19:52:34'),
(248, 22, 'menu', 'rgt', '6', 'UPDATE', '2019-06-07 19:52:52'),
(249, 23, 'menu', 'rgt', '5', 'UPDATE', '2019-06-07 19:52:52'),
(250, 23, 'menu', 'lft', '4', 'UPDATE', '2019-06-07 19:52:52'),
(251, 23, 'menu', 'id_parent', '22', 'UPDATE', '2019-06-07 19:52:52'),
(252, 24, 'menu', 'rgt', '0', 'UPDATE', '2019-06-08 00:03:38'),
(253, 24, 'menu', 'lft', '0', 'UPDATE', '2019-06-08 00:03:38'),
(254, 24, 'menu', 'status', '1', 'UPDATE', '2019-06-08 00:07:41'),
(255, 24, 'menu', 'url', '/about-us', 'UPDATE', '2019-06-08 09:21:33'),
(256, 24, 'menu', 'status', '0', 'UPDATE', '2019-06-08 09:21:39'),
(257, 24, 'menu', 'url', '/tentang-perusahaan', 'UPDATE', '2019-06-08 15:07:25'),
(258, 23, 'menu', 'url', '/contact', 'UPDATE', '2019-06-09 02:56:26'),
(259, 23, 'menu', 'url', '/tentang-perusahaan', 'UPDATE', '2019-06-09 02:57:08'),
(260, 1, 'pages', 'DELETE', 'custom', 'DELETE', '2019-06-09 16:01:50'),
(261, 3, 'pages_detail', 'DELETE', '<div><h1>ini adalah contoh halaman baru dengan alamat /services</h1></div>', 'DELETE', '2019-06-09 16:03:17'),
(262, 10, 'routes', 'DELETE', '/services', 'DELETE', '2019-06-09 16:03:17'),
(263, 3, 'pages', 'DELETE', 'services', 'DELETE', '2019-06-09 16:03:17'),
(264, 4, 'meta', 'description', 'test', 'UPDATE', '2019-06-12 02:37:11'),
(265, 7, 'pages_detail', 'DELETE', ' ORDER BY none DESC', 'DELETE', '2019-06-12 02:40:54'),
(266, 7, 'pages', 'DELETE', 'test', 'DELETE', '2019-06-12 02:40:58'),
(267, 17, 'routes', 'DELETE', '/test', 'DELETE', '2019-06-12 02:41:05'),
(268, 8, 'pages_detail', 'DELETE', 'SELECT * from users', 'DELETE', '2019-06-12 02:43:58'),
(269, 18, 'routes', 'DELETE', '/test', 'DELETE', '2019-06-12 02:43:58'),
(270, 8, 'pages', 'DELETE', 'test', 'DELETE', '2019-06-12 02:43:58'),
(271, 4, 'pages_detail', 'custom_html', '<style>\r\n.mb-60 {\r\n    margin-bottom: 60px;\r\n}\r\n.services-inner {\r\n    border: 2px solid #48c7ec;\r\n    margin-left: 35px;\r\n    transition: .3s;\r\n}\r\n.our-services-img {\r\n    float: left;\r\n    margin-left: -36px;\r\n    margin-right: 22px;\r\n    margin-top: 28', 'UPDATE', '2019-06-12 02:46:34'),
(272, 4, 'pages_detail', 'custom_html', '<style>\r\n.mb-60 {\r\n    margin-bottom: 60px;\r\n}\r\n.services-inner {\r\n    border: 2px solid #48c7ec;\r\n    margin-left: 35px;\r\n    transition: .3s;\r\n}\r\n.our-services-img {\r\n    float: left;\r\n    margin-left: -36px;\r\n    margin-right: 22px;\r\n    margin-top: 28', 'UPDATE', '2019-06-12 02:46:41'),
(273, 6, 'pages_detail', 'custom_html', '<div class=\"aboutus-section\">\r\n\r\n        <div class=\"container\">\r\n\r\n            <div class=\"row\">\r\n\r\n                <div class=\"col-md-3 col-sm-6 col-xs-12\">\r\n\r\n                    <div class=\"aboutus\">\r\n\r\n                        <h2 class=\"aboutus-title', 'UPDATE', '2019-06-12 02:46:52'),
(274, 23, 'menu', 'rgt', '6', 'UPDATE', '2019-06-12 05:33:44'),
(275, 24, 'menu', 'rgt', '8', 'UPDATE', '2019-06-12 05:33:44'),
(276, 24, 'menu', 'lft', '7', 'UPDATE', '2019-06-12 05:33:44'),
(277, 24, 'menu', 'id_parent', '0', 'UPDATE', '2019-06-12 05:33:44'),
(278, 24, 'menu', 'url', '/meta', 'UPDATE', '2019-06-12 05:34:29'),
(279, 25, 'menu', 'rgt', '0', 'UPDATE', '2019-06-12 05:36:04'),
(280, 25, 'menu', 'lft', '0', 'UPDATE', '2019-06-12 05:36:04'),
(281, 9, 'pages', 'pages_type', 'custom', 'UPDATE', '2019-06-12 05:36:35'),
(282, 9, 'pages_detail', 'custom_html', '<h1>test</h1>', 'UPDATE', '2019-06-12 05:36:35'),
(283, 29, 'menu', 'DELETE', 'Ja', 'DELETE', '2019-06-12 05:47:43'),
(284, 25, 'menu', 'DELETE', 'test', 'DELETE', '2019-06-12 05:48:27'),
(285, 85, 'permissions', 'DELETE', 'pages-list', 'DELETE', '2019-06-12 13:29:31'),
(286, 82, 'permissions', 'DELETE', 'pages-create', 'DELETE', '2019-06-12 13:29:33'),
(287, 83, 'permissions', 'DELETE', 'pages-edit', 'DELETE', '2019-06-12 13:29:34'),
(288, 84, 'permissions', 'DELETE', 'pages-delete', 'DELETE', '2019-06-12 13:29:35'),
(289, 28, 'menu', 'DELETE', 'Custom', 'DELETE', '2019-06-12 13:31:47'),
(290, 26, 'menu', 'DELETE', 'Blog', 'DELETE', '2019-06-12 13:31:52'),
(291, 27, 'menu', 'DELETE', 'Vlog', 'DELETE', '2019-06-12 13:31:56'),
(292, 23, 'menu', 'rgt', '8', 'UPDATE', '2019-06-12 13:32:04'),
(293, 24, 'menu', 'rgt', '7', 'UPDATE', '2019-06-12 13:32:04'),
(294, 24, 'menu', 'lft', '6', 'UPDATE', '2019-06-12 13:32:04'),
(295, 24, 'menu', 'id_parent', '23', 'UPDATE', '2019-06-12 13:32:04'),
(296, 13, 'pages_detail', 'DELETE', 'SELECT * from pages_detail WHERE id_page LIKE 1 ORDER BY id_page DESC', 'DELETE', '2019-06-12 13:32:09'),
(297, 23, 'routes', 'DELETE', '/ja', 'DELETE', '2019-06-12 13:32:09'),
(298, 13, 'pages', 'DELETE', 'Ja', 'DELETE', '2019-06-12 13:32:09'),
(299, 12, 'pages_detail', 'DELETE', '<p>INI custom&nbsp;</p><ul><li>sasasasasasa</li><li>aasasadadadasasa</li><li>sasasasasas</li><li>asasa</li></ul>', 'DELETE', '2019-06-12 13:32:11'),
(300, 22, 'routes', 'DELETE', '/custom', 'DELETE', '2019-06-12 13:32:11'),
(301, 12, 'pages', 'DELETE', 'Custom', 'DELETE', '2019-06-12 13:32:11'),
(302, 11, 'pages_detail', 'DELETE', '<p><span style=\"background-color: rgb(255, 255, 0);\">Ini Vlog</span></p>', 'DELETE', '2019-06-12 13:32:13'),
(303, 21, 'routes', 'DELETE', '/vlog', 'DELETE', '2019-06-12 13:32:13'),
(304, 11, 'pages', 'DELETE', 'vlog', 'DELETE', '2019-06-12 13:32:13'),
(305, 10, 'pages_detail', 'DELETE', '<p>Ini adalah view blog</p>', 'DELETE', '2019-06-12 13:32:14'),
(306, 20, 'routes', 'DELETE', '/blog', 'DELETE', '2019-06-12 13:32:14'),
(307, 10, 'pages', 'DELETE', 'blog', 'DELETE', '2019-06-12 13:32:14'),
(308, 9, 'pages_detail', 'DELETE', 'SELECT * from meta', 'DELETE', '2019-06-12 13:32:15'),
(309, 19, 'routes', 'DELETE', '/test', 'DELETE', '2019-06-12 13:32:15'),
(310, 9, 'pages', 'DELETE', 'test', 'DELETE', '2019-06-12 13:32:15'),
(311, 25, 'menu', 'url', 'administrator/article', 'UPDATE', '2019-06-13 13:17:49'),
(312, 25, 'menu', 'icon', 'filter-option-inner-inner', 'UPDATE', '2019-06-13 13:19:19'),
(313, 24, 'menu', 'description', '<p>ini halaman about us</p>', 'UPDATE', '2019-06-13 13:49:50'),
(314, 24, 'menu', 'url', '/about-us', 'UPDATE', '2019-06-13 14:26:02'),
(315, 24, 'menu', 'url', '/about-usa', 'UPDATE', '2019-06-13 14:26:06'),
(316, 24, 'menu', 'description', '0', 'UPDATE', '2019-06-13 14:28:24'),
(317, 24, 'menu', 'description', '21212', 'UPDATE', '2019-06-13 14:28:42'),
(318, 24, 'menu', 'description', 'ni halaman about us', 'UPDATE', '2019-06-13 14:34:23'),
(319, 24, 'menu', 'description', '0', 'UPDATE', '2019-06-13 14:43:15'),
(320, 24, 'menu', 'description', '1212', 'UPDATE', '2019-06-13 14:45:05'),
(321, 24, 'menu', 'description', '<p>ni halaman about us</p>', 'UPDATE', '2019-06-13 14:45:20'),
(322, 24, 'menu', 'description', '0', 'UPDATE', '2019-06-13 14:54:18'),
(323, 24, 'menu', 'description', '<p>ni halaman about us</p>', 'UPDATE', '2019-06-13 14:55:16'),
(324, 24, 'menu', 'description', '0', 'UPDATE', '2019-06-13 14:58:26'),
(325, 24, 'menu', 'description', '0', 'UPDATE', '2019-06-13 15:02:25');
INSERT INTO `log` (`id`, `id_data`, `table_data`, `field`, `values`, `event`, `created_at`) VALUES
(326, 24, 'menu', 'description', '/*!\r\n * Bootstrap v3.3.7 (http://getbootstrap.com)\r\n * Copyright 2011-2016 Twitter, Inc.\r\n * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)\r\n *//*! normalize.css v3.0.3 | MIT License | github.com/necolas/normalize.css */html{font-family:sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}body{margin:0}article,aside,details,figcaption,figure,footer,header,hgroup,main,menu,nav,section,summary{display:block}audio,canvas,progress,video{display:inline-block;vertical-align:baseline}audio:not([controls]){display:none;height:0}[hidden],template{display:none}a{background-color:transparent}a:active,a:hover{outline:0}abbr[title]{border-bottom:1px dotted}b,strong{font-weight:700}dfn{font-style:italic}h1{margin:.67em 0;font-size:2em}mark{color:#000;background:#ff0}small{font-size:80%}sub,sup{position:relative;font-size:75%;line-height:0;vertical-align:baseline}sup{top:-.5em}sub{bottom:-.25em}img{border:0}svg:not(:root){overflow:hidden}figure{margin:1em 40px}hr{height:0;-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box}pre{overflow:auto}code,kbd,pre,samp{font-family:monospace,monospace;font-size:1em}button,input,optgroup,select,textarea{margin:0;font:inherit;color:inherit}button{overflow:visible}button,select{text-transform:none}button,html input[type=button],input[type=reset],input[type=submit]{-webkit-appearance:button;cursor:pointer}button[disabled],html input[disabled]{cursor:default}button::-moz-focus-inner,input::-moz-focus-inner{padding:0;border:0}input{line-height:normal}input[type=checkbox],input[type=radio]{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;padding:0}input[type=number]::-webkit-inner-spin-button,input[type=number]::-webkit-outer-spin-button{height:auto}input[type=search]{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;-webkit-appearance:textfield}input[type=search]::-webkit-search-cancel-button,input[type=search]::-webkit-search-decoration{-webkit-appearance:none}fieldset{padding:.35em .625em .75em;margin:0 2px;border:1px solid silver}legend{padding:0;border:0}textarea{overflow:auto}optgroup{font-weight:700}table{border-spacing:0;border-collapse:collapse}td,th{padding:0}! Source: https://github.com/h5bp/html5-boilerplate/blob/master/src/css/main.css@media print{*,:after,:before{color:#000!important;text-shadow:none!important;background:0 0!important;-webkit-box-shadow:none!important;box-shadow:none!important}a,a:visited{text-decoration:underline}a[href]:after{content:\" (\" attr(href) \")\"}abbr[title]:after{content:\" (\" attr(title) \")\"}a[href^=\"javascript:\"]:after,a[href^=\"#\"]:after{content:\"\"}blockquote,pre{border:1px solid #999;page-break-inside:avoid}thead{display:table-header-group}img,tr{page-break-inside:avoid}img{max-width:100%!important}h2,h3,p{orphans:3;widows:3}h2,h3{page-break-after:avoid}.navbar{display:none}.btn>.caret,.dropup>.btn>.caret{border-top-color:#000!important}.label{border:1px solid #000}.table{border-collapse:collapse!important}.table td,.table th{background-color:#fff!important}.table-bordered td,.table-bordered th{border:1px solid #ddd!important}}@font-face{font-family:\'Glyphicons Halflings\';src:url(../fonts/glyphicons-halflings-regular.eot);src:url(../fonts/glyphicons-halflings-regular.eot?#iefix) format(\'embedded-opentype\'),url(../fonts/glyphicons-halflings-regular.woff2) format(\'woff2\'),url(../fonts/glyphicons-halflings-regular.woff) format(\'woff\'),url(../fonts/glyphicons-halflings-regular.ttf) format(\'truetype\'),url(../fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular) format(\'svg\')}.glyphicon{position:relative;top:1px;display:inline-block;font-family:\'Glyphicons Halflings\';font-style:normal;font-weight:400;line-height:1;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}.glyphicon-asterisk:before{content:\"\\002a\"}.glyphicon-plus:before{content:\"\\002b\"}.glyphicon-eur:before,.glyphicon-euro:before{content:\"\\20ac\"}.glyphicon-minus:before{content:\"\\2212\"}.glyphicon-cloud:before{content:\"\\2601\"}.glyphicon-envelope:before{content:\"\\2709\"}.glyphicon-pencil:before{content:\"\\270f\"}.glyphicon-glass:before{content:\"\\e001\"}.glyphicon-music:before{content:\"\\e002\"}.glyphicon-search:before{content:\"\\e003\"}.glyphicon-heart:before{content:\"\\e005\"}.glyphicon-star:before{content:\"\\e006\"}.glyphicon-star-empty:before{content:\"\\e007\"}.glyphicon-user:before{content:\"\\e008\"}.glyphicon-film:before{content:\"\\e009\"}.glyphicon-th-large:before{content:\"\\e010\"}.glyphicon-th:before{content:\"\\e011\"}.glyphicon-th-list:before{content:\"\\e012\"}.glyphicon-ok:before{content:\"\\e013\"}.glyphicon-remove:before{content:\"\\e014\"}.glyphicon-zoom-in:before{content:\"\\e015\"}.glyphicon-zoom-out:before{content:\"\\e016\"}.glyphicon-off:before{content:\"\\e017\"}.glyphicon-signal:before{content:\"\\e018\"}.glyphicon-cog:before{content:\"\\e019\"}.glyphicon-trash:before{content:\"\\e020\"}.glyphicon-home:before{content:\"\\e021\"}.glyphicon-file:before{content:\"\\e022\"}.glyphicon-time:before{content:\"\\e023\"}.glyphicon-road:before{content:\"\\e024\"}.glyphicon-download-alt:before{content:\"\\e025\"}.glyphicon-download:before{content:\"\\e026\"}.glyphicon-upload:before{content:\"\\e027\"}.glyphicon-inbox:before{content:\"\\e028\"}.glyphicon-play-circle:before{content:\"\\e029\"}.glyphicon-repeat:before{content:\"\\e030\"}.glyphicon-refresh:before{content:\"\\e031\"}.glyphicon-list-alt:before{content:\"\\e032\"}.glyphicon-lock:before{content:\"\\e033\"}.glyphicon-flag:before{content:\"\\e034\"}.glyphicon-headphones:before{content:\"\\e035\"}.glyphicon-volume-off:before{content:\"\\e036\"}.glyphicon-volume-down:before{content:\"\\e037\"}.glyphicon-volume-up:before{content:\"\\e038\"}.glyphicon-qrcode:before{content:\"\\e039\"}.glyphicon-barcode:before{content:\"\\e040\"}.glyphicon-tag:before{content:\"\\e041\"}.glyphicon-tags:before{content:\"\\e042\"}.glyphicon-book:before{content:\"\\e043\"}.glyphicon-bookmark:before{content:\"\\e044\"}.glyphicon-print:before{content:\"\\e045\"}.glyphicon-camera:before{content:\"\\e046\"}.glyphicon-font:before{content:\"\\e047\"}.glyphicon-bold:before{content:\"\\e048\"}.glyphicon-italic:before{content:\"\\e049\"}.glyphicon-text-height:before{content:\"\\e050\"}.glyphicon-text-width:before{content:\"\\e051\"}.glyphicon-align-left:before{content:\"\\e052\"}.glyphicon-align-center:before{content:\"\\e053\"}.glyphicon-align-right:before{content:\"\\e054\"}.glyphicon-align-justify:before{content:\"\\e055\"}.glyphicon-list:before{content:\"\\e056\"}.glyphicon-indent-left:before{content:\"\\e057\"}.glyphicon-indent-right:before{content:\"\\e058\"}.glyphicon-facetime-video:before{content:\"\\e059\"}.glyphicon-picture:before{content:\"\\e060\"}.glyphicon-map-marker:before{content:\"\\e062\"}.glyphicon-adjust:before{content:\"\\e063\"}.glyphicon-tint:before{content:\"\\e064\"}.glyphicon-edit:before{content:\"\\e065\"}.glyphicon-share:before{content:\"\\e066\"}.glyphicon-check:before{content:\"\\e067\"}.glyphicon-move:before{content:\"\\e068\"}.glyphicon-step-backward:before{content:\"\\e069\"}.glyphicon-fast-backward:before{content:\"\\e070\"}.glyphicon-backward:before{content:\"\\e071\"}.glyphicon-play:before{content:\"\\e072\"}.glyphicon-pause:before{content:\"\\e073\"}.glyphicon-stop:before{content:\"\\e074\"}.glyphicon-forward:before{content:\"\\e075\"}.glyphicon-fast-forward:before{content:\"\\e076\"}.glyphicon-step-forward:before{content:\"\\e077\"}.glyphicon-eject:before{content:\"\\e078\"}.glyphicon-chevron-left:before{content:\"\\e079\"}.glyphicon-chevron-right:before{content:\"\\e080\"}.glyphicon-plus-sign:before{content:\"\\e081\"}.glyphicon-minus-sign:before{content:\"\\e082\"}.glyphicon-remove-sign:before{content:\"\\e083\"}.glyphicon-ok-sign:before{content:\"\\e084\"}.glyphicon-question-sign:before{content:\"\\e085\"}.glyphicon-info-sign:before{content:\"\\e086\"}.glyphicon-screenshot:before{content:\"\\e087\"}.glyphicon-remove-circle:before{content:\"\\e088\"}.glyphicon-ok-circle:before{content:\"\\e089\"}.glyphicon-ban-circle:before{content:\"\\e090\"}.glyphicon-arrow-left:before{content:\"\\e091\"}.glyphicon-arrow-right:before{content:\"\\e092\"}.glyphicon-arrow-up:before{content:\"\\e093\"}.glyphicon-arrow-down:before{content:\"\\e094\"}.glyphicon-share-alt:before{content:\"\\e095\"}.glyphicon-resize-full:before{content:\"\\e096\"}.glyphicon-resize-small:before{content:\"\\e097\"}.glyphicon-exclamation-sign:before{content:\"\\e101\"}.glyphicon-gift:before{content:\"\\e102\"}.glyphicon-leaf:before{content:\"\\e103\"}.glyphicon-fire:before{content:\"\\e104\"}.glyphicon-eye-open:before{content:\"\\e105\"}.glyphicon-eye-close:before{content:\"\\e106\"}.glyphicon-warning-sign:before{content:\"\\e107\"}.glyphicon-plane:before{content:\"\\e108\"}.glyphicon-calendar:before{content:\"\\e109\"}.glyphicon-random:before{content:\"\\e110\"}.glyphicon-comment:before{content:\"\\e111\"}.glyphicon-magnet:before{content:\"\\e112\"}.glyphicon-chevron-up:before{content:\"\\e113\"}.glyphicon-chevron-down:before{content:\"\\e114\"}.glyphicon-retweet:before{content:\"\\e115\"}.glyphicon-shopping-cart:before{content:\"\\e116\"}.glyphicon-folder-close:before{content:\"\\e117\"}.glyphicon-folder-open:before{content:\"\\e118\"}.glyphicon-resize-vertical:before{content:\"\\e119\"}.glyphicon-resize-horizontal:before{content:\"\\e120\"}.glyphicon-hdd:before{content:\"\\e121\"}.glyphicon-bullhorn:before{content:\"\\e122\"}.glyphicon-bell:before{content:\"\\e123\"}.glyphicon-certificate:before{content:\"\\e124\"}.glyphicon-thumbs-up:before{content:\"\\e125\"}.glyphicon-thumbs-down:before{content:\"\\e126\"}.glyphicon-hand-right:before{content:\"\\e127\"}.glyphicon-hand-left:before{content:\"\\e128\"}.glyphicon-hand-up:before{content:\"\\e129\"}.glyphicon-hand-down:before{content:\"\\e130\"}.glyphicon-circle-arrow-right:before{content:\"\\e131\"}.glyphicon-circle-arrow-left:before{content:\"\\e132\"}.glyphicon-circle-arrow-up:before{content:\"\\e133\"}.glyphicon-circle-arrow-down:before{content:\"\\e134\"}.glyphicon-globe:before{content:\"\\e135\"}.glyphicon-wrench:before{content:\"\\e136\"}.glyphicon-tasks:before{content:\"\\e137\"}.glyphicon-filter:before{content:\"\\e138\"}.glyphicon-briefcase:before{content:\"\\e139\"}.glyphicon-fullscreen:before{content:\"\\e140\"}.glyphicon-dashboard:before{content:\"\\e141\"}.glyphicon-paperclip:before{content:\"\\e142\"}.glyphicon-heart-empty:before{content:\"\\e143\"}.glyphicon-link:before{content:\"\\e144\"}.glyphicon-phone:before{content:\"\\e145\"}.glyphicon-pushpin:before{content:\"\\e146\"}.glyphicon-usd:before{content:\"\\e148\"}.glyphicon-gbp:before{content:\"\\e149\"}.glyphicon-sort:before{content:\"\\e150\"}.glyphicon-sort-by-alphabet:before{content:\"\\e151\"}.glyphicon-sort-by-alphabet-alt:before{content:\"\\e152\"}.glyphicon-sort-by-order:before{content:\"\\e153\"}.glyphicon-sort-by-order-alt:before{content:\"\\e154\"}.glyphicon-sort-by-attributes:before{content:\"\\e155\"}.glyphicon-sort-by-attributes-alt:before{content:\"\\e156\"}.glyphicon-unchecked:before{content:\"\\e157\"}.glyphicon-expand:before{content:\"\\e158\"}.glyphicon-collapse-down:before{content:\"\\e159\"}.glyphicon-collapse-up:before{content:\"\\e160\"}.glyphicon-log-in:before{content:\"\\e161\"}.glyphicon-flash:before{content:\"\\e162\"}.glyphicon-log-out:before{content:\"\\e163\"}.glyphicon-new-window:before{content:\"\\e164\"}.glyphicon-record:before{content:\"\\e165\"}.glyphicon-save:before{content:\"\\e166\"}.glyphicon-open:before{content:\"\\e167\"}.glyphicon-saved:before{content:\"\\e168\"}.glyphicon-import:before{content:\"\\e169\"}.glyphicon-export:before{content:\"\\e170\"}.glyphicon-send:before{content:\"\\e171\"}.glyphicon-floppy-disk:before{content:\"\\e172\"}.glyphicon-floppy-saved:before{content:\"\\e173\"}.glyphicon-floppy-remove:before{content:\"\\e174\"}.glyphicon-floppy-save:before{content:\"\\e175\"}.glyphicon-floppy-open:before{content:\"\\e176\"}.glyphicon-credit-card:before{content:\"\\e177\"}.glyphicon-transfer:before{content:\"\\e178\"}.glyphicon-cutlery:before{content:\"\\e179\"}.glyphicon-header:before{content:\"\\e180\"}.glyphicon-compressed:before{content:\"\\e181\"}.glyphicon-earphone:before{content:\"\\e182\"}.glyphicon-phone-alt:before{content:\"\\e183\"}.glyphicon-tower:before{content:\"\\e184\"}.glyphicon-stats:before{content:\"\\e185\"}.glyphicon-sd-video:before{content:\"\\e186\"}.glyphicon-hd-video:before{content:\"\\e187\"}.glyphicon-subtitles:before{content:\"\\e188\"}.glyphicon-sound-stereo:before{content:\"\\e189\"}.glyphicon-sound-dolby:before{content:\"\\e190\"}.glyphicon-sound-5-1:before{content:\"\\e191\"}.glyphicon-sound-6-1:before{content:\"\\e192\"}.glyphicon-sound-7-1:before{content:\"\\e193\"}.glyphicon-copyright-mark:before{content:\"\\e194\"}.glyphicon-registration-mark:before{content:\"\\e195\"}.glyphicon-cloud-download:before{content:\"\\e197\"}.glyphicon-cloud-upload:before{content:\"\\e198\"}.glyphicon-tree-conifer:before{content:\"\\e199\"}.glyphicon-tree-deciduous:before{content:\"\\e200\"}.glyphicon-cd:before{content:\"\\e201\"}.glyphicon-save-file:before{content:\"\\e202\"}.glyphicon-open-file:before{content:\"\\e203\"}.glyphicon-level-up:before{content:\"\\e204\"}.glyphicon-copy:before{content:\"\\e205\"}.glyphicon-paste:before{content:\"\\e206\"}.glyphicon-alert:before{content:\"\\e209\"}.glyphicon-equalizer:before{content:\"\\e210\"}.glyphicon-king:before{content:\"\\e211\"}.glyphicon-queen:before{content:\"\\e212\"}.glyphicon-pawn:before{content:\"\\e213\"}.glyphicon-bishop:before{content:\"\\e214\"}.glyphicon-knight:before{content:\"\\e215\"}.glyphicon-baby-formula:before{content:\"\\e216\"}.glyphicon-tent:before{content:\"\\26fa\"}.glyphicon-blackboard:before{content:\"\\e218\"}.glyphicon-bed:before{content:\"\\e219\"}.glyphicon-apple:before{content:\"\\f8ff\"}.glyphicon-erase:before{content:\"\\e221\"}.glyphicon-hourglass:before{content:\"\\231b\"}.glyphicon-lamp:before{content:\"\\e223\"}.glyphicon-duplicate:before{content:\"\\e224\"}.glyphicon-piggy-bank:before{content:\"\\e225\"}.glyphicon-scissors:before{content:\"\\e226\"}.glyphicon-bitcoin:before{content:\"\\e227\"}.glyphicon-btc:before{content:\"\\e227\"}.glyphicon-xbt:before{content:\"\\e227\"}.glyphicon-yen:before{content:\"\\00a5\"}.glyphicon-jpy:before{content:\"\\00a5\"}.glyphicon-ruble:before{content:\"\\20bd\"}.glyphicon-rub:before{content:\"\\20bd\"}.glyphicon-scale:before{content:\"\\e230\"}.glyphicon-ice-lolly:before{content:\"\\e231\"}.glyphicon-ice-lolly-tasted:before{content:\"\\e232\"}.glyphicon-education:before{content:\"\\e233\"}.glyphicon-option-horizontal:before{content:\"\\e234\"}.glyphicon-option-vertical:before{content:\"\\e235\"}.glyphicon-menu-hamburger:before{content:\"\\e236\"}.glyphicon-modal-window:before{content:\"\\e237\"}.glyphicon-oil:before{content:\"\\e238\"}.glyphicon-grain:before{content:\"\\e239\"}.glyphicon-sunglasses:before{content:\"\\e240\"}.glyphicon-text-size:before{content:\"\\e241\"}.glyphicon-text-color:before{content:\"\\e242\"}.glyphicon-text-background:before{content:\"\\e243\"}.glyphicon-object-align-top:before{content:\"\\e244\"}.glyphicon-object-align-bottom:before{content:\"\\e245\"}.glyphicon-object-align-horizontal:before{content:\"\\e246\"}.glyphicon-object-align-left:before{content:\"\\e247\"}.glyphicon-object-align-vertical:before{content:\"\\e248\"}.glyphicon-object-align-right:before{content:\"\\e249\"}.glyphicon-triangle-right:before{content:\"\\e250\"}.glyphicon-triangle-left:before{content:\"\\e251\"}.glyphicon-triangle-bottom:before{content:\"\\e252\"}.glyphicon-triangle-top:before{content:\"\\e253\"}.glyphicon-console:before{content:\"\\e254\"}.glyphicon-superscript:before{content:\"\\e255\"}.glyphicon-subscript:before{content:\"\\e256\"}.glyphicon-menu-left:before{content:\"\\e257\"}.glyphicon-menu-right:before{content:\"\\e258\"}.glyphicon-menu-down:before{content:\"\\e259\"}.glyphicon-menu-up:before{content:\"\\e260\"}*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}:after,:before{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}html{font-size:10px;-webkit-tap-highlight-color:rgba(0,0,0,0)}body{font-family:\"Helvetica Neue\",Helvetica,Arial,sans-serif;font-size:14px;line-height:1.42857143;color:#333;background-color:#fff}button,input,select,textarea{font-family:inherit;font-size:inherit;line-height:inherit}a{color:#337ab7;text-decoration:none}a:focus,a:hover{color:#23527c;text-decoration:underline}a:focus{outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}figure{margin:0}img{vertical-align:middle}.carousel-inner>.item>a>img,.carousel-inner>.item>img,.img-responsive,.thumbnail a>img,.thumbnail>img{display:block;max-width:100%;height:auto}.img-rounded{border-radius:6px}.img-thumbnail{display:inline-block;max-width:100%;height:auto;padding:4px;line-height:1.42857143;background-color:#fff;border:1px solid #ddd;border-radius:4px;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;transition:all .2s ease-in-out}.img-circle{border-radius:50%}hr{margin-top:20px;margin-bottom:20px;border:0;border-top:1px solid #eee}.sr-only{position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}.sr-only-focusable:active,.sr-only-focusable:focus{position:static;width:auto;height:auto;margin:0;overflow:visible;clip:auto}[role=button]{cursor:pointer}.h1,.h2,.h3,.h4,.h5,.h6,h1,h2,h3,h4,h5,h6{font-family:inherit;font-weight:500;line-height:1.1;color:inherit}.h1 .small,.h1 small,.h2 .small,.h2 small,.h3 .small,.h3 small,.h4 .small,.h4 small,.h5 .small,.h5 small,.h6 .small,.h6 small,h1 .small,h1 small,h2 .small,h2 small,h3 .small,h3 small,h4 .small,h4 small,h5 .small,h5 small,h6 .small,h6 small{font-weight:400;line-height:1;color:#777}.h1,.h2,.h3,h1,h2,h3{margin-top:20px;margin-bottom:10px}.h1 .small,.h1 small,.h2 .small,.h2 small,.h3 .small,.h3 small,h1 .small,h1 small,h2 .small,h2 small,h3 .small,h3 small{font-size:65%}.h4,.h5,.h6,h4,h5,h6{margin-top:10px;margin-bottom:10px}.h4 .small,.h4 small,.h5 .small,.h5 small,.h6 .small,.h6 small,h4 .small,h4 small,h5 .small,h5 small,h6 .small,h6 small{font-size:75%}.h1,h1{font-size:36px}.h2,h2{font-size:30px}.h3,h3{font-size:24px}.h4,h4{font-size:18px}.h5,h5{font-size:14px}.h6,h6{font-size:12px}p{margin:0 0 10px}.lead{margin-bottom:20px;font-size:16px;font-weight:300;line-height:1.4}@media (min-width:768px){.lead{font-size:21px}}.small,small{font-size:85%}.mark,mark{padding:.2em;background-color:#fcf8e3}.text-left{text-align:left}.text-right{text-align:right}.text-center{text-align:center}.text-justify{text-align:justify}.text-nowrap{white-space:nowrap}.text-lowercase{text-transform:lowercase}.text-uppercase{text-transform:uppercase}.text-capitalize{text-transform:capitalize}.text-muted{color:#777}.text-primary{color:#337ab7}a.text-primary:focus,a.text-primary:hover{color:#286090}.text-success{color:#3c763d}a.text-success:focus,a.text-success:hover{color:#2b542c}.text-info{color:#31708f}a.text-info:focus,a.text-info:hover{color:#245269}.text-warning{color:#8a6d3b}a.text-warning:focus,a.text-warning:hover{color:#66512c}.text-danger{color:#a94442}a.text-danger:focus,a.text-danger:hover{color:#843534}.bg-primary{color:#fff;background-color:#337ab7}a.bg-primary:focus,a.bg-primary:hover{background-color:#286090}.bg-success{background-color:#dff0d8}a.bg-success:focus,a.bg-success:hover{background-color:#c1e2b3}.bg-info{background-color:#d9edf7}a.bg-info:focus,a.bg-info:hover{background-color:#afd9ee}.bg-warning{background-color:#fcf8e3}a.bg-warning:focus,a.bg-warning:hover{background-color:#f7ecb5}.bg-danger{background-color:#f2dede}a.bg-danger:focus,a.bg-danger:hover{background-color:#e4b9b9}.page-header{padding-bottom:9px;margin:40px 0 20px;border-bottom:1px solid #eee}ol,ul{margin-top:0;margin-bottom:10px}ol ol,ol ul,ul ol,ul ul{margin-bottom:0}.list-unstyled{padding-left:0;list-style:none}.list-inline{padding-left:0;margin-left:-5px;list-style:none}.list-inline>li{display:inline-block;padding-right:5px;padding-left:5px}dl{margin-top:0;margin-bottom:20px}dd,dt{line-height:1.42857143}dt{font-weight:700}dd{margin-left:0}@media (min-width:768px){.dl-horizontal dt{float:left;width:160px;overflow:hidden;clear:left;text-align:right;text-overflow:ellipsis;white-space:nowrap}.dl-horizontal dd{margin-left:180px}}abbr[data-original-title],abbr[title]{cursor:help;border-bottom:1px dotted #777}.initialism{font-size:90%;text-transform:uppercase}blockquote{padding:10px 20px;margin:0 0 20px;font-size:17.5px;border-left:5px solid #eee}blockquote ol:last-child,blockquote p:last-child,blockquote ul:last-child{margin-bottom:0}blockquote .small,blockquote footer,blockquote small{display:block;font-size:80%;line-height:1.42857143;color:#777}blockquote .small:before,blockquote footer:before,blockquote small:before{content:\'\\2014 \\00A0\'}.blockquote-reverse,blockquote.pull-right{padding-right:15px;padding-left:0;text-align:right;border-right:5px solid #eee;border-left:0}.blockquote-reverse .small:before,.blockquote-reverse footer:before,.blockquote-reverse small:before,blockquote.pull-right .small:before,blockquote.pull-right footer:before,blockquote.pull-right small:before{content:\'\'}.blockquote-reverse .small:after,.blockquote-reverse footer:after,.blockquote-reverse small:after,blockquote.pull-right .small:after,blockquote.pull-right footer:after,blockquote.pull-right small:after{content:\'\\00A0 \\2014\'}address{margin-bottom:20px;font-style:normal;line-height:1.42857143}code,kbd,pre,samp{font-family:Menlo,Monaco,Consolas,\"Courier New\",monospace}code{padding:2px 4px;font-size:90%;color:#c7254e;background-color:#f9f2f4;border-radius:4px}kbd{padding:2px 4px;font-size:90%;color:#fff;background-color:#333;border-radius:3px;-webkit-box-shadow:inset 0 -1px 0 rgba(0,0,0,.25);box-shadow:inset 0 -1px 0 rgba(0,0,0,.25)}kbd kbd{padding:0;font-size:100%;font-weight:700;-webkit-box-shadow:none;box-shadow:none}pre{display:block;padding:9.5px;margin:0 0 10px;font-size:13px;line-height:1.42857143;color:#333;word-break:break-all;word-wrap:break-word;background-color:#f5f5f5;border:1px solid #ccc;border-radius:4px}pre code{padding:0;font-size:inherit;color:inherit;white-space:pre-wrap;background-color:transparent;border-radius:0}.pre-scrollable{max-height:340px;overflow-y:scroll}.container{padding-right:15px;padding-left:15px;margin-right:auto;margin-left:auto}@media (min-width:768px){.container{width:750px}}@media (min-width:992px){.container{width:970px}}@media (min-width:1200px){.container{width:1170px}}.container-fluid{padding-right:15px;padding-left:15px;margin-right:auto;margin-left:auto}.row{margin-right:-15px;margin-left:-15px}.col-lg-1,.col-lg-10,.col-lg-11,.col-lg-12,.col-lg-2,.col-lg-3,.col-lg-4,.col-lg-5,.col-lg-6,.col-lg-7,.col-lg-8,.col-lg-9,.col-md-1,.col-md-10,.col-md-11,.col-md-12,.col-md-2,.col-md-3,.col-md-4,.col-md-5,.col-md-6,.col-md-7,.col-md-8,.col-md-9,.col-sm-1,.col-sm-10,.col-sm-11,.col-sm-12,.col-sm-2,.col-sm-3,.col-sm-4,.col-sm-5,.col-sm-6,.col-sm-7,.col-sm-8,.col-sm-9,.col-xs-1,.col-xs-10,.col-xs-11,.col-xs-12,.col-xs-2,.col-xs-3,.col-xs-4,.col-xs-5,.col-xs-6,.col-xs-7,.col-xs-8,.col-xs-9{position:relative;min-height:1px;padding-right:15px;padding-left:15px}.col-xs-1,.col-xs-10,.col-xs-11,.col-xs-12,.col-xs-2,.col-xs-3,.col-xs-4,.col-xs-5,.col-xs-6,.col-xs-7,.col-xs-8,.col-xs-9{float:left}.col-xs-12{width:100%}.col-xs-11{width:91.66666667%}.col-xs-10{width:83.33333333%}.col-xs-9{width:75%}.col-xs-8{width:66.66666667%}.col-xs-7{width:58.33333333%}.col-xs-6{width:50%}.col-xs-5{width:41.66666667%}.col-xs-4{width:33.33333333%}.col-xs-3{width:25%}.col-xs-2{width:16.66666667%}.col-xs-1{width:8.33333333%}.col-xs-pull-12{right:100%}.col-xs-pull-11{right:91.66666667%}.col-xs-pull-10{right:83.33333333%}.col-xs-pull-9{right:75%}.col-xs-pull-8{right:66.66666667%}.col-xs-pull-7{right:58.33333333%}.col-xs-pull-6{right:50%}.col-xs-pull-5{right:41.66666667%}.col-xs-pull-4{right:33.33333333%}.col-xs-pull-3{right:25%}.col-xs-pull-2{right:16.66666667%}.col-xs-pull-1{right:8.33333333%}.col-xs-pull-0{right:auto}.col-xs-push-12{left:100%}.col-xs-push-11{left:91.66666667%}.col-xs-push-10{left:83.33333333%}.col-xs-push-9{left:75%}.col-xs-push-8{left:66.66666667%}.col-xs-push-7{left:58.33333333%}.col-xs-push-6{left:50%}.col-xs-push-5{left:41.66666667%}.col-xs-push-4{left:33.33333333%}.col-xs-push-3{left:25%}.col-xs-push-2{left:16.66666667%}.col-xs-push-1{left:8.33333333%}.col-xs-push-0{left:auto}.col-xs-offset-12{margin-left:100%}.col-xs-offset-11{margin-left:91.66666667%}.col-xs-offset-10{margin-left:83.33333333%}.col-xs-offset-9{margin-left:75%}.col-xs-offset-8{margin-left:66.66666667%}.col-xs-offset-7{margin-left:58.33333333%}.col-xs-offset-6{margin-left:50%}.col-xs-offset-5{margin-left:41.66666667%}.col-xs-offset-4{margin-left:33.33333333%}.col-xs-offset-3{margin-left:25%}.col-xs-offset-2{margin-left:16.66666667%}.col-xs-offset-1{margin-left:8.33333333%}.col-xs-offset-0{margin-left:0}@media (min-width:768px){.col-sm-1,.col-sm-10,.col-sm-11,.col-sm-12,.col-sm-2,.col-sm-3,.col-sm-4,.col-sm-5,.col-sm-6,.col-sm-7,.col-sm-8,.col-sm-9{float:left}.col-sm-12{width:100%}.col-sm-11{width:91.66666667%}.col-sm-10{width:83.33333333%}.col-sm-9{width:75%}.col-sm-8{width:66.66666667%}.col-sm-7{width:58.33333333%}.col-sm-6{width:50%}.col-sm-5{width:41.66666667%}.col-sm-4{width:33.33333333%}.col-sm-3{width:25%}.col-sm-2{width:16.66666667%}.col-sm-1{width:8.33333333%}.col-sm-pull-12{right:100%}.col-sm-pull-11{right:91.66666667%}.col-sm-pull-10{right:83.33333333%}.col-sm-pull-9{right:75%}.col-sm-pull-8{right:66.66666667%}.col-sm-pull-7{right:58.33333333%}.col-sm-pull-6{right:50%}.col-sm-pull-5{right:41.66666667%}.col-sm-pull-4{right:33.33333333%}.col-sm-pull-3{right:25%}.col-sm-pull-2{right:16.66666667%}.col-sm-pull-1{right:8.33333333%}.col-sm-pull-0{right:auto}.col-sm-push-12{left:100%}.col-sm-push-11{left:91.66666667%}.col-sm-push-10{left:83.33333333%}.col-sm-push-9{left:75%}.col-sm-push-8{left:66.66666667%}.col-sm-push-7{left:58.33333333%}.col-sm-push-6{left:50%}.col-sm-push-5{left:41.66666667%}.col-sm-push-4{left:33.33333333%}.col-sm-push-3{left:25%}.col-sm-push-2{left:16.66666667%}.col-sm-push-1{left:8.33333333%}.col-sm-push-0{left:auto}.col-sm-offset-12{margin-left:100%}.col-sm-offset-11{margin-left:91.66666667%}.col-sm-offset-10{margin-left:83.33333333%}.col-sm-offset-9{margin-left:75%}.col-sm-offset-8{margin-left:66.66666667%}.col-sm-offset-7{margin-left:58.33333333%}.col-sm-offset-6{margin-left:50%}.col-sm-offset-5{margin-left:41.66666667%}.col-sm-offset-4{margin-left:33.33333333%}.col-sm-offset-3{margin-left:25%}.col-sm-offset-2{margin-left:16.66666667%}.col-sm-offset-1{margin-left:8.33333333%}.col-sm-offset-0{margin-left:0}}@media (min-width:992px){.col-md-1,.col-md-10,.col-md-11,.col-md-12,.col-md-2,.col-md-3,.col-md-4,.col-md-5,.col-md-6,.col-md-7,.col-md-8,.col-md-9{float:left}.col-md-12{width:100%}.col-md-11{width:91.66666667%}.col-md-10{width:83.33333333%}.col-md-9{width:75%}.col-md-8{width:66.66666667%}.col-md-7{width:58.33333333%}.col-md-6{width:50%}.col-md-5{width:41.66666667%}.col-md-4{width:33.33333333%}.col-md-3{width:25%}.col-md-2{width:16.66666667%}.col-md-1{width:8.33333333%}.col-md-pull-12{right:100%}.col-md-pull-11{right:91.66666667%}.col-md-pull-10{right:83.33333333%}.col-md-pull-9{right:75%}.col-md-pull-8{right:66.66666667%}.col-md-pull-7{right:58.33333333%}.col-md-pull-6{right:50%}.col-md-pull-5{right:41.66666667%}.col-md-pull-4{right:33.33333333%}.col-md-pull-3{right:25%}.col-md-pull-2{right:16.66666667%}.col-md-pull-1{right:8.33333333%}.col-md-pull-0{right:auto}.col-md-push-12{left:100%}.col-md-push-11{left:91.66666667%}.col-md-push-10{left:83.33333333%}.col-md-push-9{left:75%}.col-md-push-8{left:66.66666667%}.col-md-push-7{left:58.33333333%}.col-md-push-6{left:50%}.col-md-push-5{left:41.66666667%}.col-md-push-4{left:33.33333333%}.col-md-push-3{left:25%}.col-md-push-2{left:16.66666667%}.col-md-push-1{left:8.33333333%}.col-md-push-0{left:auto}.col-md-offset-12{margin-left:100%}.col-md-offset-11{margin-left:91.66666667%}.col-md-offset-10{margin-left:83.33333333%}.col-md-offset-9{margin-left:75%}.col-md-offset-8{margin-left:66.66666667%}.col-md-offset-7{margin-left:58.33333333%}.col-md-offset-6{margin-left:50%}.col-md-offset-5{margin-left:41.66666667%}.col-md-offset-4{margin-left:33.33333333%}.col-md-offset-3{margin-left:25%}.col-md-offset-2{margin-left:16.66666667%}.col-md-offset-1{margin-left:8.33333333%}.col-md-offset-0{margin-left:0}}@media (min-width:1200px){.col-lg-1,.col-lg-10,.col-lg-11,.col-lg-12,.col-lg-2,.col-lg-3,.col-lg-4,.col-lg-5,.col-lg-6,.col-lg-7,.col-lg-8,.col-lg-9{float:left}.col-lg-12{width:100%}.col-lg-11{width:91.66666667%}.col-lg-10{width:83.33333333%}.col-lg-9{width:75%}.col-lg-8{width:66.66666667%}.col-lg-7{width:58.33333333%}.col-lg-6{width:50%}.col-lg-5{width:41.66666667%}.col-lg-4{width:33.33333333%}.col-lg-3{width:25%}.col-lg-2{width:16.66666667%}.col-lg-1{width:8.33333333%}.col-lg-pull-12{right:100%}.col-lg-pull-11{right:91.66666667%}.col-lg-pull-10{right:83.33333333%}.col-lg-pull-9{right:75%}.col-lg-pull-8{right:66.66666667%}.col-lg-pull-7{right:58.33333333%}.col-lg-pull-6{right:50%}.col-lg-pull-5{right:41.66666667%}.col-lg-pull-4{right:33.33333333%}.col-lg-pull-3{right:25%}.col-lg-pull-2{right:16.66666667%}.col-lg-pull-1{right:8.33333333%}.col-lg-pull-0{right:auto}.col-lg-push-12{left:100%}.col-lg-push-11{left:91.66666667%}.col-lg-push-10{left:83.33333333%}.col-lg-push-9{left:75%}.col-lg-push-8{left:66.66666667%}.col-lg-push-7{left:58.33333333%}.col-lg-push-6{left:50%}.col-lg-push-5{left:41.66666667%}.col-lg-push-4{left:33.33333333%}.col-lg-push-3{left:25%}.col-lg-push-2{left:16.66666667%}.col-lg-push-1{left:8.33333333%}.col-lg-push-0{left:auto}.col-lg-offset-12{margin-left:100%}.col-lg-offset-11{margin-left:91.66666667%}.col-lg-offset-10{margin-left:83.33333333%}.col-lg-offset-9{margin-left:75%}.col-lg-offset-8{margin-left:66.66666667%}.col-lg-offset-7{margin-left:58.33333333%}.col-lg-offset-6{margin-left:50%}.col-lg-offset-5{margin-left:41.66666667%}.col-lg-offset-4{margin-left:33.33333333%}.col-lg-offset-3{margin-left:25%}.col-lg-offset-2{margin-left:16.66666667%}.col-lg-offset-1{margin-left:8.33333333%}.col-lg-offset-0{margin-left:0}}table{background-color:transparent}caption{padding-top:8px;padding-bottom:8px;color:#777;text-align:left}th{text-align:left}.table{width:100%;max-width:100%;margin-bottom:20px}.table>tbody>tr>td,.table>tbody>tr>th,.table>tfoot>tr>td,.table>tfoot>tr>th,.table>thead>tr>td,.table>thead>tr>th{padding:8px;line-height:1.42857143;vertical-align:top;border-top:1px solid #ddd}.table>thead>tr>th{vertical-align:bottom;border-bottom:2px solid #ddd}.table>caption+thead>tr:first-child>td,.table>caption+thead>tr:first-child>th,.table>colgroup+thead>tr:first-child>td,.table>colgroup+thead>tr:first-child>th,.table>thead:first-child>tr:first-child>td,.table>thead:first-child>tr:first-child>th{border-top:0}.table>tbody+tbody{border-top:2px solid #ddd}.table .table{background-color:#fff}.table-condensed>tbody>tr>td,.table-condensed>tbody>tr>th,.table-condensed>tfoot>tr>td,.table-condensed>tfoot>tr>th,.table-condensed>thead>tr>td,.table-condensed>thead>tr>th{padding:5px}.table-bordered{border:1px solid #ddd}.table-bordered>tbody>tr>td,.table-bordered>tbody>tr>th,.table-bordered>tfoot>tr>td,.table-bordered>tfoot>tr>th,.table-bordered>thead>tr>td,.table-bordered>thead>tr>th{border:1px solid #ddd}.table-bordered>thead>tr>td,.table-bordered>thead>tr>th{border-bottom-width:2px}.table-striped>tbody>tr:nth-of-type(odd){background-color:#f9f9f9}.table-hover>tbody>tr:hover{background-color:#f5f5f5}table col[class*=col-]{position:static;display:table-column;float:none}table td[class*=col-],table th[class*=col-]{position:static;display:table-cell;float:none}.table>tbody>tr.active>td,.table>tbody>tr.active>th,.table>tbody>tr>td.active,.table>tbody>tr>th.active,.table>tfoot>tr.active>td,.table>tfoot>tr.active>th,.table>tfoot>tr>td.active,.table>tfoot>tr>th.active,.table>thead>tr.active>td,.table>thead>tr.active>th,.table>thead>tr>td.active,.table>thead>tr>th.active{background-color:#f5f5f5}.table-hover>tbody>tr.active:hover>td,.table-hover>tbody>tr.active:hover>th,.table-hover>tbody>tr:hover>.active,.table-hover>tbody>tr>td.active:hover,.table-hover>tbody>tr>th.active:hover{background-color:#e8e8e8}.table>tbody>tr.success>td,.table>tbody>tr.success>th,.table>tbody>tr>td.success,.table>tbody>tr>th.success,.table>tfoot>tr.success>td,.table>tfoot>tr.success>th,.table>tfoot>tr>td.success,.table>tfoot>tr>th.success,.table>thead>tr.success>td,.table>thead>tr.success>th,.table>thead>tr>td.success,.table>thead>tr>th.success{background-color:#dff0d8}.table-hover>tbody>tr.success:hover>td,.table-hover>tbody>tr.success:hover>th,.table-hover>tbody>tr:hover>.success,.table-hover>tbody>tr>td.success:hover,.table-hover>tbody>tr>th.success:hover{background-color:#d0e9c6}.table>tbody>tr.info>td,.table>tbody>tr.info>th,.table>tbody>tr>td.info,.table>tbody>tr>th.info,.table>tfoot>tr.info>td,.table>tfoot>tr.info>th,.table>tfoot>tr>td.info,.table>tfoot>tr>th.info,.table>thead>tr.info>td,.table>thead>tr.info>th,.table>thead>tr>td.info,.table>thead>tr>th.info{background-color:#d9edf7}.table-hover>tbody>tr.info:hover>td,.table-hover>tbody>tr.info:hover>th,.table-hover>tbody>tr:hover>.info,.table-hover>tbody>tr>td.info:hover,.table-hover>tbody>tr>th.info:hover{background-color:#c4e3f3}.table>tbody>tr.warning>td,.table>tbody>tr.warning>th,.table>tbody>tr>td.warning,.table>tbody>tr>th.warning,.table>tfoot>tr.warning>td,.table>tfoot>tr.warning>th,.table>tfoot>tr>td.warning,.table>tfoot>tr>th.warning,.table>thead>tr.warning>td,.table>thead>tr.warning>th,.table>thead>tr>td.warning,.table>thead>tr>th.warning{background-color:#fcf8e3}.table-hover>tbody>tr.warning:hover>td,.table-hover>tbody>tr.warning:hover>th,.table-hover>tbody>tr:hover>.warning,.table-hover>tbody>tr>td.warning:hover,.table-hover>tbody>tr>th.warning:hover{background-color:#faf2cc}.table>tbody>tr.danger>td,.table>tbody>tr.danger>th,.table>tbody>tr>td.danger,.table>tbody>tr>th.danger,.table>tfoot>tr.danger>td,.table>tfoot>tr.danger>th,.table>tfoot>tr>td.danger,.table>tfoot>tr>th.danger,.table>thead>tr.danger>td,.table>thead>tr.danger>th,.table>thead>tr>td.danger,.table>thead>tr>th.danger{background-color:#f2dede}.table-hover>tbody>tr.danger:hover>td,.table-hover>tbody>tr.danger:hover>th,.table-hover>tbody>tr:hover>.danger,.table-hover>tbody>tr>td.danger:hover,.table-hover>tbody>tr>th.danger:hover{background-color:#ebcccc}.table-responsive{min-height:.01%;overflow-x:auto}@media screen and (max-width:767px){.table-responsive{width:100%;margin-bottom:15px;overflow-y:hidden;-ms-overflow-style:-ms-autohiding-scrollbar;border:1px solid #ddd}.table-responsive>.table{margin-bottom:0}.table-responsive>.table>tbody>tr>td,.table-responsive>.table>tbody>tr>th,.table-responsive>.table>tfoot>tr>td,.table-responsive>.table>tfoot>tr>th,.table-responsive>.table>thead>tr>td,.table-responsive>.table>thead>tr>th{white-space:nowrap}.table-responsive>.table-bordered{border:0}.table-responsive>.table-bordered>tbody>tr>td:first-child,.table-responsive>.table-bordered>tbody>tr>th:first-child,.table-responsive>.table-bordered>tfoot>tr>td:first-child,.table-responsive>.table-bordered>tfoot>tr>th:first-child,.table-responsive>.table-bordered>thead>tr>td:first-child,.table-responsive>.table-bordered>thead>tr>th:first-child{border-left:0}.table-responsive>.table-bordered>tbody>tr>td:last-child,.table-responsive>.table-bordered>tbody>tr>th:last-child,.table-responsive>.table-bordered>tfoot>tr>td:last-child,.table-responsive>.table-bordered>tfoot>tr>th:last-child,.table-responsive>.table-bordered>thead>tr>td:last-child,.table-responsive>.table-bordered>thead>tr>th:last-child{border-right:0}.table-responsive>.table-bordered>tbody>tr:last-child>td,.table-responsive>.table-bordered>tbody>tr:last-child>th,.table-responsive>.table-bordered>tfoot>tr:last-child>td,.table-responsive>.table-bordered>tfoot>tr:last-child>th{border-bottom:0}}fieldset{min-width:0;padding:0;margin:0;border:0}legend{display:block;width:100%;padding:0;margin-bottom:20px;font-size:21px;line-height:inherit;color:#333;border:0;border-bottom:1px solid #e5e5e5}label{display:inline-block;max-width:100%;margin-bottom:5px;font-weight:700}input[type=search]{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}input[type=checkbox],input[type=radio]{margin:4px 0 0;margin-top:1px\\9;line-height:normal}input[type=file]{display:block}input[type=range]{display:block;width:100%}select[multiple],select[size]{height:auto}input[type=file]:focus,input[type=checkbox]:focus,input[type=radio]:focus{outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}output{display:block;padding-top:7px;font-size:14px;line-height:1.42857143;color:#555}.form-control{display:block;width:100%;height:34px;padding:6px 12px;font-size:14px;line-height:1.42857143;color:#555;background-color:#fff;background-image:none;border:1px solid #ccc;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075);-webkit-transition:border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;-o-transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s;transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s}.form-control:focus{border-color:#66afe9;outline:0;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)}.form-control::-moz-placeholder{color:#999;opacity:1}.form-control:-ms-input-placeholder{color:#999}.form-control::-webkit-input-placeholder{color:#999}.form-control::-ms-expand{background-color:transparent;border:0}.form-control[disabled],.form-control[readonly],fieldset[disabled] .form-control{background-color:#eee;opacity:1}.form-control[disabled],fieldset[disabled] .form-control{cursor:not-allowed}textarea.form-control{height:auto}input[type=search]{-webkit-appearance:none}@media screen and (-webkit-min-device-pixel-ratio:0){input[type=date].form-control,input[type=time].form-control,input[type=datetime-local].form-control,input[type=month].form-control{line-height:34px}.input-group-sm input[type=date],.input-group-sm input[type=time],.input-group-sm input[type=datetime-local],.input-group-sm input[type=month],input[type=date].input-sm,input[type=time].input-sm,input[type=datetime-local].input-sm,input[type=month].input-sm{line-height:30px}.input-group-lg input[type=date],.input-group-lg input[type=time],.input-group-lg input[type=datetime-local],.input-group-lg input[type=month],input[type=date].input-lg,input[type=time].input-lg,input[type=datetime-local].input-lg,input[type=month].input-lg{line-height:46px}}.form-group{margin-bottom:15px}.checkbox,.radio{position:relative;display:block;margin-top:10px;margin-bottom:10px}.checkbox label,.radio label{min-height:20px;padding-left:20px;margin-bottom:0;font-weight:400;cursor:pointer}.checkbox input[type=checkbox],.checkbox-inline input[type=checkbox],.radio input[type=radio],.radio-inline input[type=radio]{position:absolute;margin-top:4px\\9;margin-left:-20px}.checkbox+.checkbox,.radio+.radio{margin-top:-5px}.checkbox-inline,.radio-inline{position:relative;display:inline-block;padding-left:20px;margin-bottom:0;font-weight:400;vertical-align:middle;cursor:pointer}.checkbox-inline+.checkbox-inline,.radio-inline+.radio-inline{margin-top:0;margin-left:10px}fieldset[disabled] input[type=checkbox],fieldset[disabled] input[type=radio],input[type=checkbox].disabled,input[type=checkbox][disabled],input[type=radio].disabled,input[type=radio][disabled]{cursor:not-allowed}.checkbox-inline.disabled,.radio-inline.disabled,fieldset[disabled] .checkbox-inline,fieldset[disabled] .radio-inline{cursor:not-allowed}.checkbox.disabled label,.radio.disabled label,fieldset[disabled] .checkbox label,fieldset[disabled] .radio label{cursor:not-allowed}.form-control-static{min-height:34px;padding-top:7px;padding-bottom:7px;margin-bottom:0}.form-control-static.input-lg,.form-control-static.input-sm{padding-right:0;padding-left:0}.input-sm{height:30px;padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}select.input-sm{height:30px;line-height:30px}select[multiple].input-sm,textarea.input-sm{height:auto}.form-group-sm .form-control{height:30px;padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}.form-group-sm select.form-control{height:30px;line-height:30px}.form-group-sm select[multiple].form-control,.form-group-sm textarea.form-control{height:auto}.form-group-sm .form-control-static{height:30px;min-height:32px;padding:6px 10px;font-size:12px;line-height:1.5}.input-lg{height:46px;padding:10px 16px;font-size:18px;line-height:1.3333333;border-radius:6px}select.input-lg{height:46px;line-height:46px}select[multiple].input-lg,textarea.input-lg{height:auto}.form-group-lg .form-control{height:46px;padding:10px 16px;font-size:18px;line-height:1.3333333;border-radius:6px}.form-group-lg select.form-control{height:46px;line-height:46px}.form-group-lg select[multiple].form-control,.form-group-lg textarea.form-control{height:auto}.form-group-lg .form-control-static{height:46px;min-height:38px;padding:11px 16px;font-size:18px;line-height:1.3333333}.has-feedback{position:relative}.has-feedback .form-control{padding-right:42.5px}.form-control-feedback{position:absolute;top:0;right:0;z-index:2;display:block;width:34px;height:34px;line-height:34px;text-align:center;pointer-events:none}.form-group-lg .form-control+.form-control-feedback,.input-group-lg+.form-control-feedback,.input-lg+.form-control-feedback{width:46px;height:46px;line-height:46px}.form-group-sm .form-control+.form-control-feedback,.input-group-sm+.form-control-feedback,.input-sm+.form-control-feedback{width:30px;height:30px;line-height:30px}.has-success .checkbox,.has-success .checkbox-inline,.has-success .control-label,.has-success .help-block,.has-success .radio,.has-success .radio-inline,.has-success.checkbox label,.has-success.checkbox-inline label,.has-success.radio label,.has-success.radio-inline label{color:#3c763d}.has-success .form-control{border-color:#3c763d;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.has-success .form-control:focus{border-color:#2b542c;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #67b168;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #67b168}.has-success .input-group-addon{color:#3c763d;background-color:#dff0d8;border-color:#3c763d}.has-success .form-control-feedback{color:#3c763d}.has-warning .checkbox,.has-warning .checkbox-inline,.has-warning .control-label,.has-warning .help-block,.has-warning .radio,.has-warning .radio-inline,.has-warning.checkbox label,.has-warning.checkbox-inline label,.has-warning.radio label,.has-warning.radio-inline label{color:#8a6d3b}.has-warning .form-control{border-color:#8a6d3b;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.has-warning .form-control:focus{border-color:#66512c;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #c0a16b;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #c0a16b}.has-warning .input-group-addon{color:#8a6d3b;background-color:#fcf8e3;border-color:#8a6d3b}.has-warning .form-control-feedback{color:#8a6d3b}.has-error .checkbox,.has-error .checkbox-inline,.has-error .control-label,.has-error .help-block,.has-error .radio,.has-error .radio-inline,.has-error.checkbox label,.has-error.checkbox-inline label,.has-error.radio label,.has-error.radio-inline label{color:#a94442}.has-error .form-control{border-color:#a94442;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.has-error .form-control:focus{border-color:#843534;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #ce8483;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #ce8483}.has-error .input-group-addon{color:#a94442;background-color:#f2dede;border-color:#a94442}.has-error .form-control-feedback{color:#a94442}.has-feedback label~.form-control-feedback{top:25px}.has-feedback label.sr-only~.form-control-feedback{top:0}.help-block{display:block;margin-top:5px;margin-bottom:10px;color:#737373}@media (min-width:768px){.form-inline .form-group{display:inline-block;margin-bottom:0;vertical-align:middle}.form-inline .form-control{display:inline-block;width:auto;vertical-align:middle}.form-inline .form-control-static{display:inline-block}.form-inline .input-group{display:inline-table;vertical-align:middle}.form-inline .input-group .form-control,.form-inline .input-group .input-group-addon,.form-inline .input-group .input-group-btn{width:auto}.form-inline .input-group>.form-control{width:100%}.form-inline .control-label{margin-bottom:0;vertical-align:middle}.form-inline .checkbox,.form-inline .radio{display:inline-block;margin-top:0;margin-bottom:0;vertical-align:middle}.form-inline .checkbox label,.form-inline .radio label{padding-left:0}.form-inline .checkbox input[type=checkbox],.form-inline .radio input[type=radio]{position:relative;margin-left:0}.form-inline .has-feedback .form-control-feedback{top:0}}.form-horizontal .checkbox,.form-horizontal .checkbox-inline,.form-horizontal .radio,.form-horizontal .radio-inline{padding-top:7px;margin-top:0;margin-bottom:0}.form-horizontal .checkbox,.form-horizontal .radio{min-height:27px}.form-horizontal .form-group{margin-right:-15px;margin-left:-15px}@media (min-width:768px){.form-horizontal .control-label{padding-top:7px;margin-bottom:0;text-align:right}}.form-horizontal .has-feedback .form-control-feedback{right:15px}@media (min-width:768px){.form-horizontal .form-group-lg .control-label{padding-top:11px;font-size:18px}}@media (min-width:768px){.form-horizontal .form-group-sm .control-label{padding-top:6px;font-size:12px}}.btn{display:inline-block;padding:6px 12px;margin-bottom:0;font-size:14px;font-weight:400;line-height:1.42857143;text-align:center;white-space:nowrap;vertical-align:middle;-ms-touch-action:manipulation;touch-action:manipulation;cursor:pointer;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;background-image:none;border:1px solid transparent;border-radius:4px}.btn.active.focus,.btn.active:focus,.btn.focus,.btn:active.focus,.btn:active:focus,.btn:focus{outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}.btn.focus,.btn:focus,.btn:hover{color:#333;text-decoration:none}.btn.active,.btn:active{background-image:none;outline:0;-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,.125);box-shadow:inset 0 3px 5px rgba(0,0,0,.125)}.btn.disabled,.btn[disabled],fieldset[disabled] .btn{cursor:not-allowed;filter:alpha(opacity=65);-webkit-box-shadow:none;box-shadow:none;opacity:.65}a.btn.disabled,fieldset[disabled] a.btn{pointer-events:none}.btn-default{color:#333;background-color:#fff;border-color:#ccc}.btn-default.focus,.btn-default:focus{color:#333;background-color:#e6e6e6;border-color:#8c8c8c}.btn-default:hover{color:#333;background-color:#e6e6e6;border-color:#adadad}.btn-default.active,.btn-default:active,.open>.dropdown-toggle.btn-default{color:#333;background-color:#e6e6e6;border-color:#adadad}.btn-default.active.focus,.btn-default.active:focus,.btn-default.active:hover,.btn-default:active.focus,.btn-default:active:focus,.btn-default:active:hover,.open>.dropdown-toggle.btn-default.focus,.open>.dropdown-toggle.btn-default:focus,.open>.dropdown-toggle.btn-default:hover{color:#333;background-color:#d4d4d4;border-color:#8c8c8c}.btn-default.active,.btn-default:active,.open>.dropdown-toggle.btn-default{background-image:none}.btn-default.disabled.focus,.btn-default.disabled:focus,.btn-default.disabled:hover,.btn-default[disabled].focus,.btn-default[disabled]:focus,.btn-default[disabled]:hover,fieldset[disabled] .btn-default.focus,fieldset[disabled] .btn-default:focus,fieldset[disabled] .btn-default:hover{background-color:#fff;border-color:#ccc}.btn-default .badge{color:#fff;background-color:#333}.btn-primary{color:#fff;background-color:#337ab7;border-color:#2e6da4}.btn-primary.focus,.btn-primary:focus{color:#fff;background-color:#286090;border-color:#122b40}.btn-primary:hover{color:#fff;background-color:#286090;border-color:#204d74}.btn-primary.active,.btn-primary:active,.open>.dropdown-toggle.btn-primary{color:#fff;background-color:#286090;border-color:#204d74}.btn-primary.active.focus,.btn-primary.active:focus,.btn-primary.active:hover,.btn-primary:active.focus,.btn-primary:active:focus,.btn-primary:active:hover,.open>.dropdown-toggle.btn-primary.focus,.open>.dropdown-toggle.btn-primary:focus,.open>.dropdown-toggle.btn-primary:hover{color:#fff;background-color:#204d74;border-color:#122b40}.btn-primary.active,.btn-primary:active,.open>.dropdown-toggle.btn-primary{background-image:none}.btn-primary.disabled.focus,.btn-primary.disabled:focus,.btn-primary.disabled:hover,.btn-primary[disabled].focus,.btn-primary[disabled]:focus,.btn-primary[disabled]:hover,fieldset[disabled] .btn-primary.focus,fieldset[disabled] .btn-primary:focus,fieldset[disabled] .btn-primary:hover{background-color:#337ab7;border-color:#2e6da4}.btn-primary .badge{color:#337ab7;background-color:#fff}.btn-success{color:#fff;background-color:#5cb85c;border-color:#4cae4c}.btn-success.focus,.btn-success:focus{color:#fff;background-color:#449d44;border-color:#255625}.btn-success:hover{color:#fff;background-color:#449d44;border-color:#398439}.btn-success.active,.btn-success:active,.open>.dropdown-toggle.btn-success{color:#fff;background-color:#449d44;border-color:#398439}.btn-success.active.focus,.btn-success.active:focus,.btn-success.active:hover,.btn-success:active.focus,.btn-success:active:focus,.btn-success:active:hover,.open>.dropdown-toggle.btn-success.focus,.open>.dropdown-toggle.btn-success:focus,.open>.dropdown-toggle.btn-success:hover{color:#fff;background-color:#398439;border-color:#255625}.btn-success.active,.btn-success:active,.open>.dropdown-toggle.btn-success{background-image:none}.btn-success.disabled.focus,.btn-success.disabled:focus,.btn-success.disabled:hover,.btn-success[disabled].focus,.btn-success[disabled]:focus,.btn-success[disabled]:hover,fieldset[disabled] .btn-success.focus,fieldset[disabled] .btn-success:focus,fieldset[disabled] .btn-success:hover{background-color:#5cb85c;border-color:#4cae4c}.btn-success .badge{color:#5cb85c;background-color:#fff}.btn-info{color:#fff;background-color:#5bc0de;border-color:#46b8da}.btn-info.focus,.btn-info:focus{color:#fff;background-color:#31b0d5;border-color:#1b6d85}.btn-info:hover{color:#fff;background-color:#31b0d5;border-color:#269abc}.btn-info.active,.btn-info:active,.open>.dropdown-toggle.btn-info{color:#fff;background-color:#31b0d5;border-color:#269abc}.btn-info.active.focus,.btn-info.active:focus,.btn-info.active:hover,.btn-info:active.focus,.btn-info:active:focus,.btn-info:active:hover,.open>.dropdown-toggle.btn-info.focus,.open>.dropdown-toggle.btn-info:focus,.open>.dropdown-toggle.btn-info:hover{color:#fff;background-color:#269abc;border-color:#1b6d85}.btn-info.active,.btn-info:active,.open>.dropdown-toggle.btn-info{background-image:none}.btn-info.disabled.focus,.btn-info.disabled:focus,.btn-info.disabled:hover,.btn-info[disabled].focus,.btn-info[disabled]:focus,.btn-info[disabled]:hover,fieldset[disabled] .btn-info.focus,fieldset[disabled] .btn-info:focus,fieldset[disabled] .btn-info:hover{background-color:#5bc0de;border-color:#46b8da}.btn-info .badge{color:#5bc0de;background-color:#fff}.btn-warning{color:#fff;background-color:#f0ad4e;border-color:#eea236}.btn-warning.focus,.btn-warning:focus{color:#fff;background-color:#ec971f;border-color:#985f0d}.btn-warning:hover{color:#fff;background-color:#ec971f;border-color:#d58512}.btn-warning.active,.btn-warning:active,.open>.dropdown-toggle.btn-warning{color:#fff;background-color:#ec971f;border-color:#d58512}.btn-warning.active.focus,.btn-warning.active:focus,.btn-warning.active:hover,.btn-warning:active.focus,.btn-warning:active:focus,.btn-warning:active:hover,.open>.dropdown-toggle.btn-warning.focus,.open>.dropdown-toggle.btn-warning:focus,.open>.dropdown-toggle.btn-warning:hover{color:#fff;background-color:#d58512;border-color:#985f0d}.btn-warning.active,.btn-warning:active,.open>.dropdown-toggle.btn-warning{background-image:none}.btn-warning.disabled.focus,.btn-warning.disabled:focus,.btn-warning.disabled:hover,.btn-warning[disabled].focus,.btn-warning[disabled]:focus,.btn-warning[disabled]:hover,fieldset[disabled] .btn-warning.focus,fieldset[disabled] .btn-warning:focus,fieldset[disabled] .btn-warning:hover{background-color:#f0ad4e;border-color:#eea236}.btn-warning .badge{color:#f0ad4e;background-color:#fff}.btn-danger{color:#fff;background-color:#d9534f;border-color:#d43f3a}.btn-danger.focus,.btn-danger:focus{color:#fff;background-color:#c9302c;border-color:#761c19}.btn-danger:hover{color:#fff;background-color:#c9302c;border-color:#ac2925}.btn-danger.active,.btn-danger:active,.open>.dropdown-toggle.btn-danger{color:#fff;background-color:#c9302c;border-color:#ac2925}.btn-danger.active.focus,.btn-danger.active:focus,.btn-danger.active:hover,.btn-danger:active.focus,.btn-danger:active:focus,.btn-danger:active:hover,.open>.dropdown-toggle.btn-danger.focus,.open>.dropdown-toggle.btn-danger:focus,.open>.dropdown-toggle.btn-danger:hover{color:#fff;background-color:#ac2925;border-color:#761c19}.btn-danger.active,.btn-danger:active,.open>.dropdown-toggle.btn-danger{background-image:none}.btn-danger.disabled.focus,.btn-danger.disabled:focus,.btn-danger.disabled:hover,.btn-danger[disabled].focus,.btn-danger[disabled]:focus,.btn-danger[disabled]:hover,fieldset[disabled] .btn-danger.focus,fieldset[disabled] .btn-danger:focus,fieldset[disabled] .btn-danger:hover{background-color:#d9534f;border-color:#d43f3a}.btn-danger .badge{color:#d9534f;background-color:#fff}.btn-link{font-weight:400;color:#337ab7;border-radius:0}.btn-link,.btn-link.active,.btn-link:active,.btn-link[disabled],fieldset[disabled] .btn-link{background-color:transparent;-webkit-box-shadow:none;box-shadow:none}.btn-link,.btn-link:active,.btn-link:focus,.btn-link:hover{border-color:transparent}.btn-link:focus,.btn-link:hover{color:#23527c;text-decoration:underline;background-color:transparent}.btn-link[disabled]:focus,.btn-link[disabled]:hover,fieldset[disabled] .btn-link:focus,fieldset[disabled] .btn-link:hover{color:#777;text-decoration:none}.btn-group-lg>.btn,.btn-lg{padding:10px 16px;font-size:18px;line-height:1.3333333;border-radius:6px}.btn-group-sm>.btn,.btn-sm{padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}.btn-group-xs>.btn,.btn-xs{padding:1px 5px;font-size:12px;line-height:1.5;border-radius:3px}.btn-block{display:block;width:100%}.btn-block+.btn-block{margin-top:5px}input[type=button].btn-block,input[type=reset].btn-block,input[type=submit].btn-block{width:100%}.fade{opacity:0;-webkit-transition:opacity .15s linear;-o-transition:opacity .15s linear;transition:opacity .15s linear}.fade.in{opacity:1}.collapse{display:none}.collapse.in{display:block}tr.collapse.in{display:table-row}tbody.collapse.in{display:table-row-group}.collapsing{position:relative;height:0;overflow:hidden;-webkit-transition-timing-function:ease;-o-transition-timing-function:ease;transition-timing-function:ease;-webkit-transition-duration:.35s;-o-transition-duration:.35s;transition-duration:.35s;-webkit-transition-property:height,visibility;-o-transition-property:height,visibility;transition-property:height,visibility}.caret{display:inline-block;width:0;height:0;margin-left:2px;vertical-align:middle;border-top:4px dashed;border-top:4px solid\\9;border-right:4px solid transparent;border-left:4px solid transparent}.dropdown,.dropup{position:relative}.dropdown-toggle:focus{outline:0}.dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;display:none;float:left;min-width:160px;padding:5px 0;margin:2px 0 0;font-size:14px;text-align:left;list-style:none;background-color:#fff;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #ccc;border:1px solid rgba(0,0,0,.15);border-radius:4px;-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175);box-shadow:0 6px 12px rgba(0,0,0,.175)}.dropdown-menu.pull-right{right:0;left:auto}.dropdown-menu .divider{height:1px;margin:9px 0;overflow:hidden;background-color:#e5e5e5}.dropdown-menu>li>a{display:block;padding:3px 20px;clear:both;font-weight:400;line-height:1.42857143;color:#333;white-space:nowrap}.dropdown-menu>li>a:focus,.dropdown-menu>li>a:hover{color:#262626;text-decoration:none;background-color:#f5f5f5}.dropdown-menu>.active>a,.dropdown-menu>.active>a:focus,.dropdown-menu>.active>a:hover{color:#fff;text-decoration:none;background-color:#337ab7;outline:0}.dropdown-menu>.disabled>a,.dropdown-menu>.disabled>a:focus,.dropdown-menu>.disabled>a:hover{color:#777}.dropdown-menu>.disabled>a:focus,.dropdown-menu>.disabled>a:hover{text-decoration:none;cursor:not-allowed;background-color:transparent;background-image:none;filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.open>.dropdown-menu{display:block}.open>a{outline:0}.dropdown-menu-right{right:0;left:auto}.dropdown-menu-left{right:auto;left:0}.dropdown-header{display:block;padding:3px 20px;font-size:12px;line-height:1.42857143;color:#777;white-space:nowrap}.dropdown-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:990}.pull-right>.dropdown-menu{right:0;left:auto}.dropup .caret,.navbar-fixed-bottom .dropdown .caret{content:\"\";border-top:0;border-bottom:4px dashed;border-bottom:4px solid\\9}.dropup .dropdown-menu,.navbar-fixed-bottom .dropdown .dropdown-menu{top:auto;bottom:100%;margin-bottom:2px}@media (min-width:768px){.navbar-right .dropdown-menu{right:0;left:auto}.navbar-right .dropdown-menu-left{right:auto;left:0}}.btn-group,.btn-group-vertical{position:relative;display:inline-block;vertical-align:middle}.btn-group-vertical>.btn,.btn-group>.btn{position:relative;float:left}.btn-group-vertical>.btn.active,.btn-group-vertical>.btn:active,.btn-group-vertical>.btn:focus,.btn-group-vertical>.btn:hover,.btn-group>.btn.active,.btn-group>.btn:active,.btn-group>.btn:focus,.btn-group>.btn:hover{z-index:2}.btn-group .btn+.btn,.btn-group .btn+.btn-group,.btn-group .btn-group+.btn,.btn-group .btn-group+.btn-group{margin-left:-1px}.btn-toolbar{margin-left:-5px}.btn-toolbar .btn,.btn-toolbar .btn-group,.btn-toolbar .input-group{float:left}.btn-toolbar>.btn,.btn-toolbar>.btn-group,.btn-toolbar>.input-group{margin-left:5px}.btn-group>.btn:not(:first-child):not(:last-child):not(.dropdown-toggle){border-radius:0}.btn-group>.btn:first-child{margin-left:0}.btn-group>.btn:first-child:not(:last-child):not(.dropdown-toggle){border-top-right-radius:0;border-bottom-right-radius:0}.btn-group>.btn:last-child:not(:first-child),.btn-group>.dropdown-toggle:not(:first-child){border-top-left-radius:0;border-bottom-left-radius:0}.btn-group>.btn-group{float:left}.btn-group>.btn-group:not(:first-child):not(:last-child)>.btn{border-radius:0}.btn-group>.btn-group:first-child:not(:last-child)>.btn:last-child,.btn-group>.btn-group:first-child:not(:last-child)>.dropdown-toggle{border-top-right-radius:0;border-bottom-right-radius:0}.btn-group>.btn-group:last-child:not(:first-child)>.btn:first-child{border-top-left-radius:0;border-bottom-left-radius:0}.btn-group .dropdown-toggle:active,.btn-group.open .dropdown-toggle{outline:0}.btn-group>.btn+.dropdown-toggle{padding-right:8px;padding-left:8px}.btn-group>.btn-lg+.dropdown-toggle{padding-right:12px;padding-left:12px}.btn-group.open .dropdown-toggle{-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,.125);box-shadow:inset 0 3px 5px rgba(0,0,0,.125)}.btn-group.open .dropdown-toggle.btn-link{-webkit-box-shadow:none;box-shadow:none}.btn .caret{margin-left:0}.btn-lg .caret{border-width:5px 5px 0;border-bottom-width:0}.dropup .btn-lg .caret{border-width:0 5px 5px}.btn-group-vertical>.btn,.btn-group-vertical>.btn-group,.btn-group-vertical>.btn-group>.btn{display:block;float:none;width:100%;max-width:100%}.btn-group-vertical>.btn-group>.btn{float:none}.btn-group-vertical>.btn+.btn,.btn-group-vertical>.btn+.btn-group,.btn-group-vertical>.btn-group+.btn,.btn-group-vertical>.btn-group+.btn-group{margin-top:-1px;margin-left:0}.btn-group-vertical>.btn:not(:first-child):not(:last-child){border-radius:0}.btn-group-vertical>.btn:first-child:not(:last-child){border-top-left-radius:4px;border-top-right-radius:4px;border-bottom-right-radius:0;border-bottom-left-radius:0}.btn-group-vertical>.btn:last-child:not(:first-child){border-top-left-radius:0;border-top-right-radius:0;border-bottom-right-radius:4px;border-bottom-left-radius:4px}.btn-group-vertical>.btn-group:not(:first-child):not(:last-child)>.btn{border-radius:0}.btn-group-vertical>.btn-group:first-child:not(:last-child)>.btn:last-child,.btn-group-vertical>.btn-group:first-child:not(:last-child)>.dropdown-toggle{border-bottom-right-radius:0;border-bottom-left-radius:0}.btn-group-vertical>.btn-group:last-child:not(:first-child)>.btn:first-child{border-top-left-radius:0;border-top-right-radius:0}.btn-group-justified{display:table;width:100%;table-layout:fixed;border-collapse:separate}.btn-group-justified>.btn,.btn-group-justified>.btn-group{display:table-cell;float:none;width:1%}.btn-group-justified>.btn-group .btn{width:100%}.btn-group-justified>.btn-group .dropdown-menu{left:auto}[data-toggle=buttons]>.btn input[type=checkbox],[data-toggle=buttons]>.btn input[type=radio],[data-toggle=buttons]>.btn-group>.btn input[type=checkbox],[data-toggle=buttons]>.btn-group>.btn input[type=radio]{position:absolute;clip:rect(0,0,0,0);pointer-events:none}.input-group{position:relative;display:table;border-collapse:separate}.input-group[class*=col-]{float:none;padding-right:0;padding-left:0}.input-group .form-control{position:relative;z-index:2;float:left;width:100%;margin-bottom:0}.input-group .form-control:focus{z-index:3}.input-group-lg>.form-control,.input-group-lg>.input-group-addon,.input-group-lg>.input-group-btn>.btn{height:46px;padding:10px 16px;font-size:18px;line-height:1.3333333;border-radius:6px}select.input-group-lg>.form-control,select.input-group-lg>.input-group-addon,select.input-group-lg>.input-group-btn>.btn{height:46px;line-height:46px}select[multiple].input-group-lg>.form-control,select[multiple].input-group-lg>.input-group-addon,select[multiple].input-group-lg>.input-group-btn>.btn,textarea.input-group-lg>.form-control,textarea.input-group-lg>.input-group-addon,textarea.input-group-lg>.input-group-btn>.btn{height:auto}.input-group-sm>.form-control,.input-group-sm>.input-group-addon,.input-group-sm>.input-group-btn>.btn{height:30px;padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}select.input-group-sm>.form-control,select.input-group-sm>.input-group-addon,select.input-group-sm>.input-group-btn>.btn{height:30px;line-height:30px}select[multiple].input-group-sm>.form-control,select[multiple].input-group-sm>.input-group-addon,select[multiple].input-group-sm>.input-group-btn>.btn,textarea.input-group-sm>.form-control,textarea.input-group-sm>.input-group-addon,textarea.input-group-sm>.input-group-btn>.btn{height:auto}.input-group .form-control,.input-group-addon,.input-group-btn{display:table-cell}.input-group .form-control:not(:first-child):not(:last-child),.input-group-addon:not(:first-child):not(:last-child),.input-group-btn:not(:first-child):not(:last-child){border-radius:0}.input-group-addon,.input-group-btn{width:1%;white-space:nowrap;vertical-align:middle}.input-group-addon{padding:6px 12px;font-size:14px;font-weight:400;line-height:1;color:#555;text-align:center;background-color:#eee;border:1px solid #ccc;border-radius:4px}.input-group-addon.input-sm{padding:5px 10px;font-size:12px;border-radius:3px}.input-group-addon.input-lg{padding:10px 16px;font-size:18px;border-radius:6px}.input-group-addon input[type=checkbox],.input-group-addon input[type=radio]{margin-top:0}.input-group .form-control:first-child,.input-group-addon:first-child,.input-group-btn:first-child>.btn,.input-group-btn:first-child>.btn-group>.btn,.input-group-btn:first-child>.dropdown-toggle,.input-group-btn:last-child>.btn-group:not(:last-child)>.btn,.input-group-btn:last-child>.btn:not(:last-child):not(.dropdown-toggle){border-top-right-radius:0;border-bottom-right-radius:0}.input-group-addon:first-child{border-right:0}.input-group .form-control:last-child,.input-group-addon:last-child,.input-group-btn:first-child>.btn-group:not(:first-child)>.btn,.input-group-btn:first-child>.btn:not(:first-child),.input-group-btn:last-child>.btn,.input-group-btn:last-child>.btn-group>.btn,.input-group-btn:last-child>.dropdown-toggle{border-top-left-radius:0;border-bottom-left-radius:0}.input-group-addon:last-child{border-left:0}.input-group-btn{position:relative;font-size:0;white-space:nowrap}.input-group-btn>.btn{position:relative}.input-group-btn>.btn+.btn{margin-left:-1px}.input-group-btn>.btn:active,.input-group-btn>.btn:focus,.input-group-btn>.btn:hover{z-index:2}.input-group-btn:first-child>.btn,.input-group-btn:first-child>.btn-group{margin-right:-1px}.input-group-btn:last-child>.btn,.input-group-btn:last-child>.btn-group{z-index:2;margin-left:-1px}.nav{padding-left:0;margin-bottom:0;list-style:none}.nav>li{position:relative;display:block}.nav>li>a{position:relative;display:block;padding:10px 15px}.nav>li>a:focus,.nav>li>a:hover{text-decoration:none;background-color:#eee}.nav>li.disabled>a{color:#777}.nav>li.disabled>a:focus,.nav>li.disabled>a:hover{color:#777;text-decoration:none;cursor:not-allowed;background-color:transparent}.nav .open>a,.nav .open>a:focus,.nav .open>a:hover{background-color:#eee;border-color:#337ab7}.nav .nav-divider{height:1px;margin:9px 0;overflow:hidden;background-color:#e5e5e5}.nav>li>a>img{max-width:none}.nav-tabs{border-bottom:1px solid #ddd}.nav-tabs>li{float:left;margin-bottom:-1px}.nav-tabs>li>a{margin-right:2px;line-height:1.42857143;border:1px solid transparent;border-radius:4px 4px 0 0}.nav-tabs>li>a:hover{border-color:#eee #eee #ddd}.nav-tabs>li.active>a,.nav-tabs>li.active>a:focus,.nav-tabs>li.active>a:hover{color:#555;cursor:default;background-color:#fff;border:1px solid #ddd;border-bottom-color:transparent}.nav-tabs.nav-justified{width:100%;border-bottom:0}.nav-tabs.nav-justified>li{float:none}.nav-tabs.nav-justified>li>a{margin-bottom:5px;text-align:center}.nav-tabs.nav-justified>.dropdown .dropdown-menu{top:auto;left:auto}@media (min-width:768px){.nav-tabs.nav-justified>li{display:table-cell;width:1%}.nav-tabs.nav-justified>li>a{margin-bottom:0}}.nav-tabs.nav-justified>li>a{margin-right:0;border-radius:4px}.nav-tabs.nav-justified>.active>a,.nav-tabs.nav-justified>.active>a:focus,.nav-tabs.nav-justified>.active>a:hover{border:1px solid #ddd}@media (min-width:768px){.nav-tabs.nav-justified>li>a{border-bottom:1px solid #ddd;border-radius:4px 4px 0 0}.nav-tabs.nav-justified>.active>a,.nav-tabs.nav-justified>.active>a:focus,.nav-tabs.nav-justified>.active>a:hover{border-bottom-color:#fff}}.nav-pills>li{float:left}.nav-pills>li>a{border-radius:4px}.nav-pills>li+li{margin-left:2px}.nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{color:#fff;background-color:#337ab7}.nav-stacked>li{float:none}.nav-stacked>li+li{margin-top:2px;margin-left:0}.nav-justified{width:100%}.nav-justified>li{float:none}.nav-justified>li>a{margin-bottom:5px;text-align:center}.nav-justified>.dropdown .dropdown-menu{top:auto;left:auto}@media (min-width:768px){.nav-justified>li{display:table-cell;width:1%}.nav-justified>li>a{margin-bottom:0}}.nav-tabs-justified{border-bottom:0}.nav-tabs-justified>li>a{margin-right:0;border-radius:4px}.nav-tabs-justified>.active>a,.nav-tabs-justified>.active>a:focus,.nav-tabs-justified>.active>a:hover{border:1px solid #ddd}@media (min-width:768px){.nav-tabs-justified>li>a{border-bottom:1px solid #ddd;border-radius:4px 4px 0 0}.nav-tabs-justified>.active>a,.nav-tabs-justified>.active>a:focus,.nav-tabs-justified>.active>a:hover{border-bottom-color:#fff}}.tab-content>.tab-pane{display:none}.tab-content>.active{display:block}.nav-tabs .dropdown-menu{margin-top:-1px;border-top-left-radius:0;border-top-right-radius:0}.navbar{position:relative;min-height:50px;margin-bottom:20px;border:1px solid transparent}@media (min-width:768px){.navbar{border-radius:4px}}@media (min-width:768px){.navbar-header{float:left}}.navbar-collapse{padding-right:15px;padding-left:15px;overflow-x:visible;-webkit-overflow-scrolling:touch;border-top:1px solid transparent;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1);box-shadow:inset 0 1px 0 rgba(255,255,255,.1)}.navbar-collapse.in{overflow-y:auto}@media (min-width:768px){.navbar-collapse{width:auto;border-top:0;-webkit-box-shadow:none;box-shadow:none}.navbar-collapse.collapse{display:block!important;height:auto!important;padding-bottom:0;overflow:visible!important}.navbar-collapse.in{overflow-y:visible}.navbar-fixed-bottom .navbar-collapse,.navbar-fixed-top .navbar-collapse,.navbar-static-top .navbar-collapse{padding-right:0;padding-left:0}}.navbar-fixed-bottom .navbar-collapse,.navbar-fixed-top .navbar-collapse{max-height:340px}@media (max-device-width:480px) and (orientation:landscape){.navbar-fixed-bottom .navbar-collapse,.navbar-fixed-top .navbar-collapse{max-height:200px}}.container-fluid>.navbar-collapse,.container-fluid>.navbar-header,.container>.navbar-collapse,.container>.navbar-header{margin-right:-15px;margin-left:-15px}@media (min-width:768px){.container-fluid>.navbar-collapse,.container-fluid>.navbar-header,.container>.navbar-collapse,.container>.navbar-header{margin-right:0;margin-left:0}}.navbar-static-top{z-index:1000;border-width:0 0 1px}@media (min-width:768px){.navbar-static-top{border-radius:0}}.navbar-fixed-bottom,.navbar-fixed-top{position:fixed;right:0;left:0;z-index:1030}@media (min-width:768px){.navbar-fixed-bottom,.navbar-fixed-top{border-radius:0}}.navbar-fixed-top{top:0;border-width:0 0 1px}.navbar-fixed-bottom{bottom:0;margin-bottom:0;border-width:1px 0 0}.navbar-brand{float:left;height:50px;padding:15px 15px;font-size:18px;line-height:20px}.navbar-brand:focus,.navbar-brand:hover{text-decoration:none}.navbar-brand>img{display:block}@media (min-width:768px){.navbar>.container .navbar-brand,.navbar>.container-fluid .navbar-brand{margin-left:-15px}}.navbar-toggle{position:relative;float:right;padding:9px 10px;margin-top:8px;margin-right:15px;margin-bottom:8px;background-color:transparent;background-image:none;border:1px solid transparent;border-radius:4px}.navbar-toggle:focus{outline:0}.navbar-toggle .icon-bar{display:block;width:22px;height:2px;border-radius:1px}.navbar-toggle .icon-bar+.icon-bar{margin-top:4px}@media (min-width:768px){.navbar-toggle{display:none}}.navbar-nav{margin:7.5px -15px}.navbar-nav>li>a{padding-top:10px;padding-bottom:10px;line-height:20px}@media (max-width:767px){.navbar-nav .open .dropdown-menu{position:static;float:none;width:auto;margin-top:0;background-color:transparent;border:0;-webkit-box-shadow:none;box-shadow:none}.navbar-nav .open .dropdown-menu .dropdown-header,.navbar-nav .open .dropdown-menu>li>a{padding:5px 15px 5px 25px}.navbar-nav .open .dropdown-menu>li>a{line-height:20px}.navbar-nav .open .dropdown-menu>li>a:focus,.navbar-nav .open .dropdown-menu>li>a:hover{background-image:none}}@media (min-width:768px){.navbar-nav{float:left;margin:0}.navbar-nav>li{float:left}.navbar-nav>li>a{padding-top:15px;padding-bottom:15px}}.navbar-form{padding:10px 15px;margin-top:8px;margin-right:-15px;margin-bottom:8px;margin-left:-15px;border-top:1px solid transparent;border-bottom:1px solid transparent;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.1);box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.1)}@media (min-width:768px){.navbar-form .form-group{display:inline-block;margin-bottom:0;vertical-align:middle}.navbar-form .form-control{display:inline-block;width:auto;vertical-align:middle}.navbar-form .form-control-static{display:inline-block}.navbar-form .input-group{display:inline-table;vertical-align:middle}.navbar-form .input-group .form-control,.navbar-form .input-group .input-group-addon,.navbar-form .input-group .input-group-btn{width:auto}.navbar-form .input-group>.form-control{width:100%}.navbar-form .control-label{margin-bottom:0;vertical-align:middle}.navbar-form .checkbox,.navbar-form .radio{display:inline-block;margin-top:0;margin-bottom:0;vertical-align:middle}.navbar-form .checkbox label,.navbar-form .radio label{padding-left:0}.navbar-form .checkbox input[type=checkbox],.navbar-form .radio input[type=radio]{position:relative;margin-left:0}.navbar-form .has-feedback .form-control-feedback{top:0}}@media (max-width:767px){.navbar-form .form-group{margin-bottom:5px}.navbar-form .form-group:last-child{margin-bottom:0}}@media (min-width:768px){.navbar-form{width:auto;padding-top:0;padding-bottom:0;margin-right:0;margin-left:0;border:0;-webkit-box-shadow:none;box-shadow:none}}.navbar-nav>li>.dropdown-menu{margin-top:0;border-top-left-radius:0;border-top-right-radius:0}.navbar-fixed-bottom .navbar-nav>li>.dropdown-menu{margin-bottom:0;border-top-left-radius:4px;border-top-right-radius:4px;border-bottom-right-radius:0;border-bottom-left-radius:0}.navbar-btn{margin-top:8px;margin-bottom:8px}.navbar-btn.btn-sm{margin-top:10px;margin-bottom:10px}.navbar-btn.btn-xs{margin-top:14px;margin-bottom:14px}.navbar-text{margin-top:15px;margin-bottom:15px}@media (min-width:768px){.navbar-text{float:left;margin-right:15px;margin-left:15px}}@media (min-width:768px){.navbar-left{float:left!important}.navbar-right{float:right!important;margin-right:-15px}.navbar-right~.navbar-right{margin-right:0}}.navbar-default{background-color:#f8f8f8;border-color:#e7e7e7}.navbar-default .navbar-brand{color:#777}.navbar-default .navbar-brand:focus,.navbar-default .navbar-brand:hover{color:#5e5e5e;background-color:transparent}.navbar-default .navbar-text{color:#777}.navbar-default .navbar-nav>li>a{color:#777}.navbar-default .navbar-nav>li>a:focus,.navbar-default .navbar-nav>li>a:hover{color:#333;background-color:transparent}.navbar-default .navbar-nav>.active>a,.navbar-default .navbar-nav>.active>a:focus,.navbar-default .navbar-nav>.active>a:hover{color:#555;background-color:#e7e7e7}.navbar-default .navbar-nav>.disabled>a,.navbar-default .navbar-nav>.disabled>a:focus,.navbar-default .navbar-nav>.disabled>a:hover{color:#ccc;background-color:transparent}.navbar-default .navbar-toggle{border-color:#ddd}.navbar-default .navbar-toggle:focus,.navbar-default .navbar-toggle:hover{background-color:#ddd}.navbar-default .navbar-toggle .icon-bar{background-color:#888}.navbar-default .navbar-collapse,.navbar-default .navbar-form{border-color:#e7e7e7}.navbar-default .navbar-nav>.open>a,.navbar-default .navbar-nav>.open>a:focus,.navbar-default .navbar-nav>.open>a:hover{color:#555;background-color:#e7e7e7}@media (max-width:767px){.navbar-default .navbar-nav .open .dropdown-menu>li>a{color:#777}.navbar-default .navbar-nav .open .dropdown-menu>li>a:focus,.navbar-default .navbar-nav .open .dropdown-menu>li>a:hover{color:#333;background-color:transparent}.navbar-default .navbar-nav .open .dropdown-menu>.active>a,.navbar-default .navbar-nav .open .dropdown-menu>.active>a:focus,.navbar-default .navbar-nav .open .dropdown-menu>.active>a:hover{color:#555;background-color:#e7e7e7}.navbar-default .navbar-nav .open .dropdown-menu>.disabled>a,.navbar-default .navbar-nav .open .dropdown-menu>.disabled>a:focus,.navbar-default .navbar-nav .open .dropdown-menu>.disabled>a:hover{color:#ccc;background-color:transparent}}.navbar-default .navbar-link{color:#777}.navbar-default .navbar-link:hover{color:#333}.navbar-default .btn-link{color:#777}.navbar-default .btn-link:focus,.navbar-default .btn-link:hover{color:#333}.navbar-default .btn-link[disabled]:focus,.navbar-default .btn-link[disabled]:hover,fieldset[disabled] .navbar-default .btn-link:focus,fieldset[disabled] .navbar-default .btn-link:hover{color:#ccc}.navbar-inverse{background-color:#222;border-color:#080808}.navbar-inverse .navbar-brand{color:#9d9d9d}.navbar-inverse .navbar-brand:focus,.navbar-inverse .navbar-brand:hover{color:#fff;background-color:transparent}.navbar-inverse .navbar-text{color:#9d9d9d}.navbar-inverse .navbar-nav>li>a{color:#9d9d9d}.navbar-inverse .navbar-nav>li>a:focus,.navbar-inverse .navbar-nav>li>a:hover{color:#fff;background-color:transparent}.navbar-inverse .navbar-nav>.active>a,.navbar-inverse .navbar-nav>.active>a:focus,.navbar-inverse .navbar-nav>.active>a:hover{color:#fff;background-color:#080808}.navbar-inverse .navbar-nav>.disabled>a,.navbar-inverse .navbar-nav>.disabled>a:focus,.navbar-inverse .navbar-nav>.disabled>a:hover{color:#444;background-color:transparent}.navbar-inverse .navbar-toggle{border-color:#333}.navbar-inverse .navbar-toggle:focus,.navbar-inverse .navbar-toggle:hover{background-color:#333}.navbar-inverse .navbar-toggle .icon-bar{background-color:#fff}.navbar-inverse .navbar-collapse,.navbar-inverse .navbar-form{border-color:#101010}.navbar-inverse .navbar-nav>.open>a,.navbar-inverse .navbar-nav>.open>a:focus,.navbar-inverse .navbar-nav>.open>a:hover{color:#fff;background-color:#080808}@media (max-width:767px){.navbar-inverse .navbar-nav .open .dropdown-menu>.dropdown-header{border-color:#080808}.navbar-inverse .navbar-nav .open .dropdown-menu .divider{background-color:#080808}.navbar-inverse .navbar-nav .open .dropdown-menu>li>a{color:#9d9d9d}.navbar-inverse .navbar-nav .open .dropdown-menu>li>a:focus,.navbar-inverse .navbar-nav .open .dropdown-menu>li>a:hover{color:#fff;background-color:transparent}.navbar-inverse .navbar-nav .open .dropdown-menu>.active>a,.navbar-inverse .navbar-nav .open .dropdown-menu>.active>a:focus,.navbar-inverse .navbar-nav .open .dropdown-menu>.active>a:hover{color:#fff;background-color:#080808}.navbar-inverse .navbar-nav .open .dropdown-menu>.disabled>a,.navbar-inverse .navbar-nav .open .dropdown-menu>.disabled>a:focus,.navbar-inverse .navbar-nav .open .dropdown-menu>.disabled>a:hover{color:#444;background-color:transparent}}.navbar-inverse .navbar-link{color:#9d9d9d}.navbar-inverse .navbar-link:hover{color:#fff}.navbar-inverse .btn-link{color:#9d9d9d}.navbar-inverse .btn-link:focus,.navbar-inverse .btn-link:hover{color:#fff}.navbar-inverse .btn-link[disabled]:focus,.navbar-inverse .btn-link[disabled]:hover,fieldset[disabled] .navbar-inverse .btn-link:focus,fieldset[disabled] .navbar-inverse .btn-link:hover{color:#444}.breadcrumb{padding:8px 15px;margin-bottom:20px;list-style:none;background-color:#f5f5f5;border-radius:4px}.breadcrumb>li{display:inline-block}.breadcrumb>li+li:before{padding:0 5px;color:#ccc;content:\"/\\00a0\"}.breadcrumb>.active{color:#777}.pagination{display:inline-block;padding-left:0;margin:20px 0;border-radius:4px}.pagination>li{display:inline}.pagination>li>a,.pagination>li>span{position:relative;float:left;padding:6px 12px;margin-left:-1px;line-height:1.42857143;color:#337ab7;text-decoration:none;background-color:#fff;border:1px solid #ddd}.pagination>li:first-child>a,.pagination>li:first-child>span{margin-left:0;border-top-left-radius:4px;border-bottom-left-radius:4px}.pagination>li:last-child>a,.pagination>li:last-child>span{border-top-right-radius:4px;border-bottom-right-radius:4px}.pagination>li>a:focus,.pagination>li>a:hover,.pagination>li>span:focus,.pagination>li>span:hover{z-index:2;color:#23527c;background-color:#eee;border-color:#ddd}.pagination>.active>a,.pagination>.active>a:focus,.pagination>.active>a:hover,.pagination>.active>span,.pagination>.active>span:focus,.pagination>.active>span:hover{z-index:3;color:#fff;cursor:default;background-color:#337ab7;border-color:#337ab7}.pagination>.disabled>a,.pagination>.disabled>a:focus,.pagination>.disabled>a:hover,.pagination>.disabled>span,.pagination>.disabled>span:focus,.pagination>.disabled>span:hover{color:#777;cursor:not-allowed;background-color:#fff;border-color:#ddd}.pagination-lg>li>a,.pagination-lg>li>span{padding:10px 16px;font-size:18px;line-height:1.3333333}.pagination-lg>li:first-child>a,.pagination-lg>li:first-child>span{border-top-left-radius:6px;border-bottom-left-radius:6px}.pagination-lg>li:last-child>a,.pagination-lg>li:last-child>span{border-top-right-radius:6px;border-bottom-right-radius:6px}.pagination-sm>li>a,.pagination-sm>li>span{padding:5px 10px;font-size:12px;line-height:1.5}.pagination-sm>li:first-child>a,.pagination-sm>li:first-child>span{border-top-left-radius:3px;border-bottom-left-radius:3px}.pagination-sm>li:last-child>a,.pagination-sm>li:last-child>span{border-top-right-radius:3px;border-bottom-right-radius:3px}.pager{padding-left:0;margin:20px 0;text-align:center;list-style:none}.pager li{display:inline}.pager li>a,.pager li>span{display:inline-block;padding:5px 14px;background-color:#fff;border:1px solid #ddd;border-radius:15px}.pager li>a:focus,.pager li>a:hover{text-decoration:none;background-color:#eee}.pager .next>a,.pager .next>span{float:right}.pager .previous>a,.pager .previous>span{float:left}.pager .disabled>a,.pager .disabled>a:focus,.pager .disabled>a:hover,.pager .disabled>span{color:#777;cursor:not-allowed;background-color:#fff}.label{display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em}a.label:focus,a.label:hover{color:#fff;text-decoration:none;cursor:pointer}.label:empty{display:none}.btn .label{position:relative;top:-1px}.label-default{background-color:#777}.label-default[href]:focus,.label-default[href]:hover{background-color:#5e5e5e}.label-primary{background-color:#337ab7}.label-primary[href]:focus,.label-primary[href]:hover{background-color:#286090}.label-success{background-color:#5cb85c}.label-success[href]:focus,.label-success[href]:hover{background-color:#449d44}.label-info{background-color:#5bc0de}.label-info[href]:focus,.label-info[href]:hover{background-color:#31b0d5}.label-warning{background-color:#f0ad4e}.label-warning[href]:focus,.label-warning[href]:hover{background-color:#ec971f}.label-danger{background-color:#d9534f}.label-danger[href]:focus,.label-danger[href]:hover{background-color:#c9302c}.badge{display:inline-block;min-width:10px;padding:3px 7px;font-size:12px;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:middle;background-color:#777;border-radius:10px}.badge:empty{display:none}.btn .badge{position:relative;top:-1px}.btn-group-xs>.btn .badge,.btn-xs .badge{top:0;padding:1px 5px}a.badge:focus,a.badge:hover{color:#fff;text-decoration:none;cursor:pointer}.list-group-item.active>.badge,.nav-pills>.active>a>.badge{color:#337ab7;background-color:#fff}.list-group-item>.badge{float:right}.list-group-item>.badge+.badge{margin-right:5px}.nav-pills>li>a>.badge{margin-left:3px}.jumbotron{padding-top:30px;padding-bottom:30px;margin-bottom:30px;color:inherit;background-color:#eee}.jumbotron .h1,.jumbotron h1{color:inherit}.jumbotron p{margin-bottom:15px;font-size:21px;font-weight:200}.jumbotron>hr{border-top-color:#d5d5d5}.container .jumbotron,.container-fluid .jumbotron{padding-right:15px;padding-left:15px;border-radius:6px}.jumbotron .container{max-width:100%}@media screen and (min-width:768px){.jumbotron{padding-top:48px;padding-bottom:48px}.container .jumbotron,.container-fluid .jumbotron{padding-right:60px;padding-left:60px}.jumbotron .h1,.jumbotron h1{font-size:63px}}.thumbnail{display:block;padding:4px;margin-bottom:20px;line-height:1.42857143;background-color:#fff;border:1px solid #ddd;border-radius:4px;-webkit-transition:border .2s ease-in-out;-o-transition:border .2s ease-in-out;transition:border .2s ease-in-out}.thumbnail a>img,.thumbnail>img{margin-right:auto;margin-left:auto}a.thumbnail.active,a.thumbnail:focus,a.thumbnail:hover{border-color:#337ab7}.thumbnail .caption{padding:9px;color:#333}.alert{padding:15px;margin-bottom:20px;border:1px solid transparent;border-radius:4px}.alert h4{margin-top:0;color:inherit}.alert .alert-link{font-weight:700}.alert>p,.alert>ul{margin-bottom:0}.alert>p+p{margin-top:5px}.alert-dismissable,.alert-dismissible{padding-right:35px}.alert-dismissable .close,.alert-dismissible .close{position:relative;top:-2px;right:-21px;color:inherit}.alert-success{color:#3c763d;background-color:#dff0d8;border-color:#d6e9c6}.alert-success hr{border-top-color:#c9e2b3}.alert-success .alert-link{color:#2b542c}.alert-info{color:#31708f;background-color:#d9edf7;border-color:#bce8f1}.alert-info hr{border-top-color:#a6e1ec}.alert-info .alert-link{color:#245269}.alert-warning{color:#8a6d3b;background-color:#fcf8e3;border-color:#faebcc}.alert-warning hr{border-top-color:#f7e1b5}.alert-warning .alert-link{color:#66512c}.alert-danger{color:#a94442;background-color:#f2dede;border-color:#ebccd1}.alert-danger hr{border-top-color:#e4b9c0}.alert-danger .alert-link{color:#843534}@-webkit-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}@-o-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}@keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}.progress{height:20px;margin-bottom:20px;overflow:hidden;background-color:#f5f5f5;border-radius:4px;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.1);box-shadow:inset 0 1px 2px rgba(0,0,0,.1)}.progress-bar{float:left;width:0;height:100%;font-size:12px;line-height:20px;color:#fff;text-align:center;background-color:#337ab7;-webkit-box-shadow:inset 0 -1px 0 rgba(0,0,0,.15);box-shadow:inset 0 -1px 0 rgba(0,0,0,.15);-webkit-transition:width .6s ease;-o-transition:width .6s ease;transition:width .6s ease}.progress-bar-striped,.progress-striped .progress-bar{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);-webkit-background-size:40px 40px;background-size:40px 40px}.progress-bar.active,.progress.active .progress-bar{-webkit-animation:progress-bar-stripes 2s linear infinite;-o-animation:progress-bar-stripes 2s linear infinite;animation:progress-bar-stripes 2s linear infinite}.progress-bar-success{background-color:#5cb85c}.progress-striped .progress-bar-success{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}.progress-bar-info{background-color:#5bc0de}.progress-striped .progress-bar-info{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}.progress-bar-warning{background-color:#f0ad4e}.progress-striped .progress-bar-warning{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}.progress-bar-danger{background-color:#d9534f}.progress-striped .progress-bar-danger{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}.media{margin-top:15px}.media:first-child{margin-top:0}.media,.media-body{overflow:hidden;zoom:1}.media-body{width:10000px}.media-object{display:block}.media-object.img-thumbnail{max-width:none}.media-right,.media>.pull-right{padding-left:10px}.media-left,.media>.pull-left{padding-right:10px}.media-body,.media-left,.media-right{display:table-cell;vertical-align:top}.media-middle{vertical-align:middle}.media-bottom{vertical-align:bottom}.media-heading{margin-top:0;margin-bottom:5px}.media-list{padding-left:0;list-style:none}.list-group{padding-left:0;margin-bottom:20px}.list-group-item{position:relative;display:block;padding:10px 15px;margin-bottom:-1px;background-color:#fff;border:1px solid #ddd}.list-group-item:first-child{border-top-left-radius:4px;border-top-right-radius:4px}.list-group-item:last-child{margin-bottom:0;border-bottom-right-radius:4px;border-bottom-left-radius:4px}a.list-group-item,button.list-group-item{color:#555}a.list-group-item .list-group-item-heading,button.list-group-item .list-group-item-heading{color:#333}a.list-group-item:focus,a.list-group-item:hover,button.list-group-item:focus,button.list-group-item:hover{color:#555;text-decoration:none;background-color:#f5f5f5}button.list-group-item{width:100%;text-align:left}.list-group-item.disabled,.list-group-item.disabled:focus,.list-group-item.disabled:hover{color:#777;cursor:not-allowed;background-color:#eee}.list-group-item.disabled .list-group-item-heading,.list-group-item.disabled:focus .list-group-item-heading,.list-group-item.disabled:hover .list-group-item-heading{color:inherit}.list-group-item.disabled .list-group-item-text,.list-group-item.disabled:focus .list-group-item-text,.list-group-item.disabled:hover .list-group-item-text{color:#777}.list-group-item.active,.list-group-item.active:focus,.list-group-item.active:hover{z-index:2;color:#fff;background-color:#337ab7;border-color:#337ab7}.list-group-item.active .list-group-item-heading,.list-group-item.active .list-group-item-heading>.small,.list-group-item.active .list-group-item-heading>small,.list-group-item.active:focus .list-group-item-heading,.list-group-item.active:focus .list-group-item-heading>.small,.list-group-item.active:focus .list-group-item-heading>small,.list-group-item.active:hover .list-group-item-heading,.list-group-item.active:hover .list-group-item-heading>.small,.list-group-item.active:hover .list-group-item-heading>small{color:inherit}.list-group-item.active .list-group-item-text,.list-group-item.active:focus .list-group-item-text,.list-group-item.active:hover .list-group-item-text{color:#c7ddef}.list-group-item-success{color:#3c763d;background-color:#dff0d8}a.list-group-item-success,button.list-group-item-success{color:#3c763d}a.list-group-item-success .list-group-item-heading,button.list-group-item-success .list-group-item-heading{color:inherit}a.list-group-item-success:focus,a.list-group-item-success:hover,button.list-group-item-success:focus,button.list-group-item-success:hover{color:#3c763d;background-color:#d0e9c6}a.list-group-item-success.active,a.list-group-item-success.active:focus,a.list-group-item-success.active:hover,button.list-group-item-success.active,button.list-group-item-success.active:focus,button.list-group-item-success.active:hover{color:#fff;background-color:#3c763d;border-color:#3c763d}.list-group-item-info{color:#31708f;background-color:#d9edf7}a.list-group-item-info,button.list-group-item-info{color:#31708f}a.list-group-item-info .list-group-item-heading,button.list-group-item-info .list-group-item-heading{color:inherit}a.list-group-item-info:focus,a.list-group-item-info:hover,button.list-group-item-info:focus,button.list-group-item-info:hover{color:#31708f;background-color:#c4e3f3}a.list-group-item-info.active,a.list-group-item-info.active:focus,a.list-group-item-info.active:hover,button.list-group-item-info.active,button.list-group-item-info.active:focus,button.list-group-item-info.active:hover{color:#fff;background-color:#31708f;border-color:#31708f}.list-group-item-warning{color:#8a6d3b;background-color:#fcf8e3}a.list-group-item-warning,button.list-group-item-warning{color:#8a6d3b}a.list-group-item-warning .list-group-item-heading,button.list-group-item-warning .list-group-item-heading{color:inherit}a.list-group-item-warning:focus,a.list-group-item-warning:hover,button.list-group-item-warning:focus,button.list-group-item-warning:hover{color:#8a6d3b;background-color:#faf2cc}a.list-group-item-warning.active,a.list-group-item-warning.active:focus,a.list-group-item-warning.active:hover,button.list-group-item-warning.active,button.list-group-item-warning.active:focus,button.list-group-item-warning.active:hover{color:#fff;background-color:#8a6d3b;border-color:#8a6d3b}.list-group-item-danger{color:#a94442;background-color:#f2dede}a.list-group-item-danger,button.list-group-item-danger{color:#a94442}a.list-group-item-danger .list-group-item-heading,button.list-group-item-danger .list-group-item-heading{color:inherit}a.list-group-item-danger:focus,a.list-group-item-danger:hover,button.list-group-item-danger:focus,button.list-group-item-danger:hover{color:#a94442;background-color:#ebcccc}a.list-group-item-danger.active,a.list-group-item-danger.active:focus,a.list-group-item-danger.active:hover,button.list-group-item-danger.active,button.list-group-item-danger.active:focus,button.list-group-item-danger.active:hover{color:#fff;background-color:#a94442;border-color:#a94442}.list-group-item-heading{margin-top:0;margin-bottom:5px}.list-group-item-text{margin-bottom:0;line-height:1.3}.panel{margin-bottom:20px;background-color:#fff;border:1px solid transparent;border-radius:4px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05);box-shadow:0 1px 1px rgba(0,0,0,.05)}.panel-body{padding:15px}.panel-heading{padding:10px 15px;border-bottom:1px solid transparent;border-top-left-radius:3px;border-top-right-radius:3px}.panel-heading>.dropdown .dropdown-toggle{color:inherit}.panel-title{margin-top:0;margin-bottom:0;font-size:16px;color:inherit}.panel-title>.small,.panel-title>.small>a,.panel-title>a,.panel-title>small,.panel-title>small>a{color:inherit}.panel-footer{padding:10px 15px;background-color:#f5f5f5;border-top:1px solid #ddd;border-bottom-right-radius:3px;border-bottom-left-radius:3px}.panel>.list-group,.panel>.panel-collapse>.list-group{margin-bottom:0}.panel>.list-group .list-group-item,.panel>.panel-collapse>.list-group .list-group-item{border-width:1px 0;border-radius:0}.panel>.list-group:first-child .list-group-item:first-child,.panel>.panel-collapse>.list-group:first-child .list-group-item:first-child{border-top:0;border-top-left-radius:3px;border-top-right-radius:3px}.panel>.list-group:last-child .list-group-item:last-child,.panel>.panel-collapse>.list-group:last-child .list-group-item:last-child{border-bottom:0;border-bottom-right-radius:3px;border-bottom-left-radius:3px}.panel>.panel-heading+.panel-collapse>.list-group .list-group-item:first-child{border-top-left-radius:0;border-top-right-radius:0}.panel-heading+.list-group .list-group-item:first-child{border-top-width:0}.list-group+.panel-footer{border-top-width:0}.panel>.panel-collapse>.table,.panel>.table,.panel>.table-responsive>.table{margin-bottom:0}.panel>.panel-collapse>.table caption,.panel>.table caption,.panel>.table-responsive>.table caption{padding-right:15px;padding-left:15px}.panel>.table-responsive:first-child>.table:first-child,.panel>.table:first-child{border-top-left-radius:3px;border-top-right-radius:3px}.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child,.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child,.panel>.table:first-child>tbody:first-child>tr:first-child,.panel>.table:first-child>thead:first-child>tr:first-child{border-top-left-radius:3px;border-top-right-radius:3px}.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child td:first-child,.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child th:first-child,.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child td:first-child,.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child th:first-child,.panel>.table:first-child>tbody:first-child>tr:first-child td:first-child,.panel>.table:first-child>tbody:first-child>tr:first-child th:first-child,.panel>.table:first-child>thead:first-child>tr:first-child td:first-child,.panel>.table:first-child>thead:first-child>tr:first-child th:first-child{border-top-left-radius:3px}.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child td:last-child,.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child th:last-child,.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child td:last-child,.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child th:last-child,.panel>.table:first-child>tbody:first-child>tr:first-child td:last-child,.panel>.table:first-child>tbody:first-child>tr:first-child th:last-child,.panel>.table:first-child>thead:first-child>tr:first-child td:last-child,.panel>.table:first-child>thead:first-child>tr:first-child th:last-child{border-top-right-radius:3px}.panel>.table-responsive:last-child>.table:last-child,.panel>.table:last-child{border-bottom-right-radius:3px;border-bottom-left-radius:3px}.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child,.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child,.panel>.table:last-child>tbody:last-child>tr:last-child,.panel>.table:last-child>tfoot:last-child>tr:last-child{border-bottom-right-radius:3px;border-bottom-left-radius:3px}.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child td:first-child,.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child th:first-child,.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child td:first-child,.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child th:first-child,.panel>.table:last-child>tbody:last-child>tr:last-child td:first-child,.panel>.table:last-child>tbody:last-child>tr:last-child th:first-child,.panel>.table:last-child>tfoot:last-child>tr:last-child td:first-child,.panel>.table:last-child>tfoot:last-child>tr:last-child th:first-child{border-bottom-left-radius:3px}.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child td:last-child,.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child th:last-child,.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child td:last-child,.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child th:last-child,.panel>.table:last-child>tbody:last-child>tr:last-child td:last-child,.panel>.table:last-child>tbody:last-child>tr:last-child th:last-child,.panel>.table:last-child>tfoot:last-child>tr:last-child td:last-child,.panel>.table:last-child>tfoot:last-child>tr:last-child th:last-child{border-bottom-right-radius:3px}.panel>.panel-body+.table,.panel>.panel-body+.table-responsive,.panel>.table+.panel-body,.panel>.table-responsive+.panel-body{border-top:1px solid #ddd}.panel>.table>tbody:first-child>tr:first-child td,.panel>.table>tbody:first-child>tr:first-child th{border-top:0}.panel>.table-bordered,.panel>.table-responsive>.table-bordered{border:0}.panel>.table-bordered>tbody>tr>td:first-child,.panel>.table-bordered>tbody>tr>th:first-child,.panel>.table-bordered>tfoot>tr>td:first-child,.panel>.table-bordered>tfoot>tr>th:first-child,.panel>.table-bordered>thead>tr>td:first-child,.panel>.table-bordered>thead>tr>th:first-child,.panel>.table-responsive>.table-bordered>tbody>tr>td:first-child,.panel>.table-responsive>.table-bordered>tbody>tr>th:first-child,.panel>.table-responsive>.table-bordered>tfoot>tr>td:first-child,.panel>.table-responsive>.table-bordered>tfoot>tr>th:first-child,.panel>.table-responsive>.table-bordered>thead>tr>td:first-child,.panel>.table-responsive>.table-bordered>thead>tr>th:first-child{border-left:0}.panel>.table-bordered>tbody>tr>td:last-child,.panel>.table-bordered>tbody>tr>th:last-child,.panel>.table-bordered>tfoot>tr>td:last-child,.panel>.table-bordered>tfoot>tr>th:last-child,.panel>.table-bordered>thead>tr>td:last-child,.panel>.table-bordered>thead>tr>th:last-child,.panel>.table-responsive>.table-bordered>tbody>tr>td:last-child,.panel>.table-responsive>.table-bordered>tbody>tr>th:last-child,.panel>.table-responsive>.table-bordered>tfoot>tr>td:last-child,.panel>.table-responsive>.table-bordered>tfoot>tr>th:last-child,.panel>.table-responsive>.table-bordered>thead>tr>td:last-child,.panel>.table-responsive>.table-bordered>thead>tr>th:last-child{border-right:0}.panel>.table-bordered>tbody>tr:first-child>td,.panel>.table-bordered>tbody>tr:first-child>th,.panel>.table-bordered>thead>tr:first-child>td,.panel>.table-bordered>thead>tr:first-child>th,.panel>.table-responsive>.table-bordered>tbody>tr:first-child>td,.panel>.table-responsive>.table-bordered>tbody>tr:first-child>th,.panel>.table-responsive>.table-bordered>thead>tr:first-child>td,.panel>.table-responsive>.table-bordered>thead>tr:first-child>th{border-bottom:0}.panel>.table-bordered>tbody>tr:last-child>td,.panel>.table-bordered>tbody>tr:last-child>th,.panel>.table-bordered>tfoot>tr:last-child>td,.panel>.table-bordered>tfoot>tr:last-child>th,.panel>.table-responsive>.table-bordered>tbody>tr:last-child>td,.panel>.table-responsive>.table-bordered>tbody>tr:last-child>th,.panel>.table-responsive>.table-bordered>tfoot>tr:last-child>td,.panel>.table-responsive>.table-bordered>tfoot>tr:last-child>th{border-bottom:0}.panel>.table-responsive{margin-bottom:0;border:0}.panel-group{margin-bottom:20px}.panel-group .panel{margin-bottom:0;border-radius:4px}.panel-group .panel+.panel{margin-top:5px}.panel-group .panel-heading{border-bottom:0}.panel-group .panel-heading+.panel-collapse>.list-group,.panel-group .panel-heading+.panel-collapse>.panel-body{border-top:1px solid #ddd}.panel-group .panel-footer{border-top:0}.panel-group .panel-footer+.panel-collapse .panel-body{border-bottom:1px solid #ddd}.panel-default{border-color:#ddd}.panel-default>.panel-heading{color:#333;background-color:#f5f5f5;border-color:#ddd}.panel-default>.panel-heading+.panel-collapse>.panel-body{border-top-color:#ddd}.panel-default>.panel-heading .badge{color:#f5f5f5;background-color:#333}.panel-default>.panel-footer+.panel-collapse>.panel-body{border-bottom-color:#ddd}.panel-primary{border-color:#337ab7}.panel-primary>.panel-heading{color:#fff;background-color:#337ab7;border-color:#337ab7}.panel-primary>.panel-heading+.panel-collapse>.panel-body{border-top-color:#337ab7}.panel-primary>.panel-heading .badge{color:#337ab7;background-color:#fff}.panel-primary>.panel-footer+.panel-collapse>.panel-body{border-bottom-color:#337ab7}.panel-success{border-color:#d6e9c6}.panel-success>.panel-heading{color:#3c763d;background-color:#dff0d8;border-color:#d6e9c6}.panel-success>.panel-heading+.panel-collapse>.panel-body{border-top-color:#d6e9c6}.panel-success>.panel-heading .badge{color:#dff0d8;background-color:#3c763d}.panel-success>.panel-footer+.panel-collapse>.panel-body{border-bottom-color:#d6e9c6}.panel-info{border-color:#bce8f1}.panel-info>.panel-heading{color:#31708f;background-color:#d9edf7;border-color:#bce8f1}.panel-info>.panel-heading+.panel-collapse>.panel-body{border-top-color:#bce8f1}.panel-info>.panel-heading .badge{color:#d9edf7;background-color:#31708f}.panel-info>.panel-footer+.panel-collapse>.panel-body{border-bottom-color:#bce8f1}.panel-warning{border-color:#faebcc}.panel-warning>.panel-heading{color:#8a6d3b;background-color:#fcf8e3;border-color:#faebcc}.panel-warning>.panel-heading+.panel-collapse>.panel-body{border-top-color:#faebcc}.panel-warning>.panel-heading .badge{color:#fcf8e3;background-color:#8a6d3b}.panel-warning>.panel-footer+.panel-collapse>.panel-body{border-bottom-color:#faebcc}.panel-danger{border-color:#ebccd1}.panel-danger>.panel-heading{color:#a94442;background-color:#f2dede;border-color:#ebccd1}.panel-danger>.panel-heading+.panel-collapse>.panel-body{border-top-color:#ebccd1}.panel-danger>.panel-heading .badge{color:#f2dede;background-color:#a94442}.panel-danger>.panel-footer+.panel-collapse>.panel-body{border-bottom-color:#ebccd1}.embed-responsive{position:relative;display:block;height:0;padding:0;overflow:hidden}.embed-responsive .embed-responsive-item,.embed-responsive embed,.embed-responsive iframe,.embed-responsive object,.embed-responsive video{position:absolute;top:0;bottom:0;left:0;width:100%;height:100%;border:0}.embed-responsive-16by9{padding-bottom:56.25%}.embed-responsive-4by3{padding-bottom:75%}.well{min-height:20px;padding:19px;margin-bottom:20px;background-color:#f5f5f5;border:1px solid #e3e3e3;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.05);box-shadow:inset 0 1px 1px rgba(0,0,0,.05)}.well blockquote{border-color:#ddd;border-color:rgba(0,0,0,.15)}.well-lg{padding:24px;border-radius:6px}.well-sm{padding:9px;border-radius:3px}.close{float:right;font-size:21px;font-weight:700;line-height:1;color:#000;text-shadow:0 1px 0 #fff;filter:alpha(opacity=20);opacity:.2}.close:focus,.close:hover{color:#000;text-decoration:none;cursor:pointer;filter:alpha(opacity=50);opacity:.5}button.close{-webkit-appearance:none;padding:0;cursor:pointer;background:0 0;border:0}.modal-open{overflow:hidden}.modal{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1050;display:none;overflow:hidden;-webkit-overflow-scrolling:touch;outline:0}.modal.fade .modal-dialog{-webkit-transition:-webkit-transform .3s ease-out;-o-transition:-o-transform .3s ease-out;transition:transform .3s ease-out;-webkit-transform:translate(0,-25%);-ms-transform:translate(0,-25%);-o-transform:translate(0,-25%);transform:translate(0,-25%)}.modal.in .modal-dialog{-webkit-transform:translate(0,0);-ms-transform:translate(0,0);-o-transform:translate(0,0);transform:translate(0,0)}.modal-open .modal{overflow-x:hidden;overflow-y:auto}.modal-dialog{position:relative;width:auto;margin:10px}.modal-content{position:relative;background-color:#fff;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,.2);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,.5);box-shadow:0 3px 9px rgba(0,0,0,.5)}.modal-header{padding:15px;border-bottom:1px solid #e5e5e5}.modal-header .close{margin-top:-2px}.modal-title{margin:0;line-height:1.42857143}.modal-body{position:relative;padding:15px}.modal-footer{padding:15px;text-align:right;border-top:1px solid #e5e5e5}.modal-footer .btn+.btn{margin-bottom:0;margin-left:5px}.modal-footer .btn-group .btn+.btn{margin-left:-1px}.modal-footer .btn-block+.btn-block{margin-left:0}.modal-scrollbar-measure{position:absolute;top:-9999px;width:50px;height:50px;overflow:scroll}@media (min-width:768px){.modal-dialog{width:600px;margin:30px auto}.modal-content{-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}.modal-sm{width:300px}}@media (min-width:992px){.modal-lg{width:900px}}.tooltip{position:absolute;z-index:1070;display:block;font-family:\"Helvetica Neue\",Helvetica,Arial,sans-serif;font-size:12px;font-style:normal;font-weight:400;line-height:1.42857143;text-align:left;text-align:start;text-decoration:none;text-shadow:none;text-transform:none;letter-spacing:normal;word-break:normal;word-spacing:normal;word-wrap:normal;white-space:normal;filter:alpha(opacity=0);opacity:0;line-break:auto}.tooltip.in{filter:alpha(opacity=90);opacity:.9}.tooltip.top{padding:5px 0;margin-top:-3px}.tooltip.right{padding:0 5px;margin-left:3px}.tooltip.bottom{padding:5px 0;margin-top:3px}.tooltip.left{padding:0 5px;margin-left:-3px}.tooltip-inner{max-width:200px;padding:3px 8px;color:#fff;text-align:center;background-color:#000;border-radius:4px}.tooltip-arrow{position:absolute;width:0;height:0;border-color:transparent;border-style:solid}.tooltip.top .tooltip-arrow{bottom:0;left:50%;margin-left:-5px;border-width:5px 5px 0;border-top-color:#000}.tooltip.top-left .tooltip-arrow{right:5px;bottom:0;margin-bottom:-5px;border-width:5px 5px 0;border-top-color:#000}.tooltip.top-right .tooltip-arrow{bottom:0;left:5px;margin-bottom:-5px;border-width:5px 5px 0;border-top-color:#000}.tooltip.right .tooltip-arrow{top:50%;left:0;margin-top:-5px;border-width:5px 5px 5px 0;border-right-color:#000}.tooltip.left .tooltip-arrow{top:50%;right:0;margin-top:-5px;border-width:5px 0 5px 5px;border-left-color:#000}.tooltip.bottom .tooltip-arrow{top:0;left:50%;margin-left:-5px;border-width:0 5px 5px;border-bottom-color:#000}.tooltip.bottom-left .tooltip-arrow{top:0;right:5px;margin-top:-5px;border-width:0 5px 5px;border-bottom-color:#000}.tooltip.bottom-right .tooltip-arrow{top:0;left:5px;margin-top:-5px;border-width:0 5px 5px;border-bottom-color:#000}.popover{position:absolute;top:0;left:0;z-index:1060;display:none;max-width:276px;padding:1px;font-family:\"Helvetica Neue\",Helvetica,Arial,sans-serif;font-size:14px;font-style:normal;font-weight:400;line-height:1.42857143;text-align:left;text-align:start;text-decoration:none;text-shadow:none;text-transform:none;letter-spacing:normal;word-break:normal;word-spacing:normal;word-wrap:normal;white-space:normal;background-color:#fff;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #ccc;border:1px solid rgba(0,0,0,.2);border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0,0,0,.2);box-shadow:0 5px 10px rgba(0,0,0,.2);line-break:auto}.popover.top{margin-top:-10px}.popover.right{margin-left:10px}.popover.bottom{margin-top:10px}.popover.left{margin-left:-10px}.popover-title{padding:8px 14px;margin:0;font-size:14px;background-color:#f7f7f7;border-bottom:1px solid #ebebeb;border-radius:5px 5px 0 0}.popover-content{padding:9px 14px}.popover>.arrow,.popover>.arrow:after{position:absolute;display:block;width:0;height:0;border-color:transparent;border-style:solid}.popover>.arrow{border-width:11px}.popover>.arrow:after{content:\"\";border-width:10px}.popover.top>.arrow{bottom:-11px;left:50%;margin-left:-11px;border-top-color:#999;border-top-color:rgba(0,0,0,.25);border-bottom-width:0}.popover.top>.arrow:after{bottom:1px;margin-left:-10px;content:\" \";border-top-color:#fff;border-bottom-width:0}.popover.right>.arrow{top:50%;left:-11px;margin-top:-11px;border-right-color:#999;border-right-color:rgba(0,0,0,.25);border-left-width:0}.popover.right>.arrow:after{bottom:-10px;left:1px;content:\" \";border-right-color:#fff;border-left-width:0}.popover.bottom>.arrow{top:-11px;left:50%;margin-left:-11px;border-top-width:0;border-bottom-color:#999;border-bottom-color:rgba(0,0,0,.25)}.popover.bottom>.arrow:after{top:1px;margin-left:-10px;content:\" \";border-top-width:0;border-bottom-color:#fff}.popover.left>.arrow{top:50%;right:-11px;margin-top:-11px;border-right-width:0;border-left-color:#999;border-left-color:rgba(0,0,0,.25)}.popover.left>.arrow:after{right:1px;bottom:-10px;content:\" \";border-right-width:0;border-left-color:#fff}.carousel{position:relative}.carousel-inner{position:relative;width:100%;overflow:hidden}.carousel-inner>.item{position:relative;display:none;-webkit-transition:.6s ease-in-out left;-o-transition:.6s ease-in-out left;transition:.6s ease-in-out left}.carousel-inner>.item>a>img,.carousel-inner>.item>img{line-height:1}@media all and (transform-3d),(-webkit-transform-3d){.carousel-inner>.item{-webkit-transition:-webkit-transform .6s ease-in-out;-o-transition:-o-transform .6s ease-in-out;transition:transform .6s ease-in-out;-webkit-backface-visibility:hidden;backface-visibility:hidden;-webkit-perspective:1000px;perspective:1000px}.carousel-inner>.item.active.right,.carousel-inner>.item.next{left:0;-webkit-transform:translate3d(100%,0,0);transform:translate3d(100%,0,0)}.carousel-inner>.item.active.left,.carousel-inner>.item.prev{left:0;-webkit-transform:translate3d(-100%,0,0);transform:translate3d(-100%,0,0)}.carousel-inner>.item.active,.carousel-inner>.item.next.left,.carousel-inner>.item.prev.right{left:0;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}}.carousel-inner>.active,.carousel-inner>.next,.carousel-inner>.prev{display:block}.carousel-inner>.active{left:0}.carousel-inner>.next,.carousel-inner>.prev{position:absolute;top:0;width:100%}.carousel-inner>.next{left:100%}.carousel-inner>.prev{left:-100%}.carousel-inner>.next.left,.carousel-inner>.prev.right{left:0}.carousel-inner>.active.left{left:-100%}.carousel-inner>.active.right{left:100%}.carousel-control{position:absolute;top:0;bottom:0;left:0;width:15%;font-size:20px;color:#fff;text-align:center;text-shadow:0 1px 2px rgba(0,0,0,.6);background-color:rgba(0,0,0,0);filter:alpha(opacity=50);opacity:.5}.carousel-control.left{background-image:-webkit-linear-gradient(left,rgba(0,0,0,.5) 0,rgba(0,0,0,.0001) 100%);background-image:-o-linear-gradient(left,rgba(0,0,0,.5) 0,rgba(0,0,0,.0001) 100%);background-image:-webkit-gradient(linear,left top,right top,from(rgba(0,0,0,.5)),to(rgba(0,0,0,.0001)));background-image:linear-gradient(to right,rgba(0,0,0,.5) 0,rgba(0,0,0,.0001) 100%);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#80000000\', endColorstr=\'#00000000\', GradientType=1);background-repeat:repeat-x}.carousel-control.right{right:0;left:auto;background-image:-webkit-linear-gradient(left,rgba(0,0,0,.0001) 0,rgba(0,0,0,.5) 100%);background-image:-o-linear-gradient(left,rgba(0,0,0,.0001) 0,rgba(0,0,0,.5) 100%);background-image:-webkit-gradient(linear,left top,right top,from(rgba(0,0,0,.0001)),to(rgba(0,0,0,.5)));background-image:linear-gradient(to right,rgba(0,0,0,.0001) 0,rgba(0,0,0,.5) 100%);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#00000000\', endColorstr=\'#80000000\', GradientType=1);background-repeat:repeat-x}.carousel-control:focus,.carousel-control:hover{color:#fff;text-decoration:none;filter:alpha(opacity=90);outline:0;opacity:.9}.carousel-control .glyphicon-chevron-left,.carousel-control .glyphicon-chevron-right,.carousel-control .icon-next,.carousel-control .icon-prev{position:absolute;top:50%;z-index:5;display:inline-block;margin-top:-10px}.carousel-control .glyphicon-chevron-left,.carousel-control .icon-prev{left:50%;margin-left:-10px}.carousel-control .glyphicon-chevron-right,.carousel-control .icon-next{right:50%;margin-right:-10px}.carousel-control .icon-next,.carousel-control .icon-prev{width:20px;height:20px;font-family:serif;line-height:1}.carousel-control .icon-prev:before{content:\'\\2039\'}.carousel-control .icon-next:before{content:\'\\203a\'}.carousel-indicators{position:absolute;bottom:10px;left:50%;z-index:15;width:60%;padding-left:0;margin-left:-30%;text-align:center;list-style:none}.carousel-indicators li{display:inline-block;width:10px;height:10px;margin:1px;text-indent:-999px;cursor:pointer;background-color:#000\\9;background-color:rgba(0,0,0,0);border:1px solid #fff;border-radius:10px}.carousel-indicators .active{width:12px;height:12px;margin:0;background-color:#fff}.carousel-caption{position:absolute;right:15%;bottom:20px;left:15%;z-index:10;padding-top:20px;padding-bottom:20px;color:#fff;text-align:center;text-shadow:0 1px 2px rgba(0,0,0,.6)}.carousel-caption .btn{text-shadow:none}@media screen and (min-width:768px){.carousel-control .glyphicon-chevron-left,.carousel-control .glyphicon-chevron-right,.carousel-control .icon-next,.carousel-control .icon-prev{width:30px;height:30px;margin-top:-10px;font-size:30px}.carousel-control .glyphicon-chevron-left,.carousel-control .icon-prev{margin-left:-10px}.carousel-control .glyphicon-chevron-right,.carousel-control .icon-next{margin-right:-10px}.carousel-caption{right:20%;left:20%;padding-bottom:30px}.carousel-indicators{bottom:20px}}.btn-group-vertical>.btn-group:after,.btn-group-vertical>.btn-group:before,.btn-toolbar:after,.btn-toolbar:before,.clearfix:after,.clearfix:before,.container-fluid:after,.container-fluid:before,.container:after,.container:before,.dl-horizontal dd:after,.dl-horizontal dd:before,.form-horizontal .form-group:after,.form-horizontal .form-group:before,.modal-footer:after,.modal-footer:before,.modal-header:after,.modal-header:before,.nav:after,.nav:before,.navbar-collapse:after,.navbar-collapse:before,.navbar-header:after,.navbar-header:before,.navbar:after,.navbar:before,.pager:after,.pager:before,.panel-body:after,.panel-body:before,.row:after,.row:before{display:table;content:\" \"}.btn-group-vertical>.btn-group:after,.btn-toolbar:after,.clearfix:after,.container-fluid:after,.container:after,.dl-horizontal dd:after,.form-horizontal .form-group:after,.modal-footer:after,.modal-header:after,.nav:after,.navbar-collapse:after,.navbar-header:after,.navbar:after,.pager:after,.panel-body:after,.row:after{clear:both}.center-block{display:block;margin-right:auto;margin-left:auto}.pull-right{float:right!important}.pull-left{float:left!important}.hide{display:none!important}.show{display:block!important}.invisible{visibility:hidden}.text-hide{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}.hidden{display:none!important}.affix{position:fixed}@-ms-viewport{width:device-width}.visible-lg,.visible-md,.visible-sm,.visible-xs{display:none!important}.visible-lg-block,.visible-lg-inline,.visible-lg-inline-block,.visible-md-block,.visible-md-inline,.visible-md-inline-block,.visible-sm-block,.visible-sm-inline,.visible-sm-inline-block,.visible-xs-block,.visible-xs-inline,.visible-xs-inline-block{display:none!important}@media (max-width:767px){.visible-xs{display:block!important}table.visible-xs{display:table!important}tr.visible-xs{display:table-row!important}td.visible-xs,th.visible-xs{display:table-cell!important}}@media (max-width:767px){.visible-xs-block{display:block!important}}@media (max-width:767px){.visible-xs-inline{display:inline!important}}@media (max-width:767px){.visible-xs-inline-block{display:inline-block!important}}@media (min-width:768px) and (max-width:991px){.visible-sm{display:block!important}table.visible-sm{display:table!important}tr.visible-sm{display:table-row!important}td.visible-sm,th.visible-sm{display:table-cell!important}}@media (min-width:768px) and (max-width:991px){.visible-sm-block{display:block!important}}@media (min-width:768px) and (max-width:991px){.visible-sm-inline{display:inline!important}}@media (min-width:768px) and (max-width:991px){.visible-sm-inline-block{display:inline-block!important}}@media (min-width:992px) and (max-width:1199px){.visible-md{display:block!important}table.visible-md{display:table!important}tr.visible-md{display:table-row!important}td.visible-md,th.visible-md{display:table-cell!important}}@media (min-width:992px) and (max-width:1199px){.visible-md-block{display:block!important}}@media (min-width:992px) and (max-width:1199px){.visible-md-inline{display:inline!important}}@media (min-width:992px) and (max-width:1199px){.visible-md-inline-block{display:inline-block!important}}@media (min-width:1200px){.visible-lg{display:block!important}table.visible-lg{display:table!important}tr.visible-lg{display:table-row!important}td.visible-lg,th.visible-lg{display:table-cell!important}}@media (min-width:1200px){.visible-lg-block{display:block!important}}@media (min-width:1200px){.visible-lg-inline{display:inline!important}}@media (min-width:1200px){.visible-lg-inline-block{display:inline-block!important}}@media (max-width:767px){.hidden-xs{display:none!important}}@media (min-width:768px) and (max-width:991px){.hidden-sm{display:none!important}}@media (min-width:992px) and (max-width:1199px){.hidden-md{display:none!important}}@media (min-width:1200px){.hidden-lg{display:none!important}}.visible-print{display:none!important}@media print{.visible-print{display:block!important}table.visible-print{display:table!important}tr.visible-print{display:table-row!important}td.visible-print,th.visible-print{display:table-cell!important}}.visible-print-block{display:none!important}@media print{.visible-print-block{display:block!important}}.visible-print-inline{display:none!important}@media print{.visible-print-inline{display:inline!important}}.visible-print-inline-block{display:none!important}@media print{.visible-print-inline-block{display:inline-block!important}}@media print{.hidden-print{display:none!important}}\r\n/*# sourceMappingURL=bootstrap.min.css.map */', 'UPDATE', '2019-06-13 15:03:24');
INSERT INTO `log` (`id`, `id_data`, `table_data`, `field`, `values`, `event`, `created_at`) VALUES
(327, 24, 'menu', 'description', 'a', 'UPDATE', '2019-06-13 15:03:46');
INSERT INTO `log` (`id`, `id_data`, `table_data`, `field`, `values`, `event`, `created_at`) VALUES
(328, 24, 'menu', 'description', '<p><img src=\"data:image/jpeg;base64,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\" data-filename=\"ryan_ganteng.jpeg\" style=\"width: 785px;\"></p>', 'UPDATE', '2019-06-13 15:04:00');
INSERT INTO `log` (`id`, `id_data`, `table_data`, `field`, `values`, `event`, `created_at`) VALUES
(329, 2, 'users', 'password', '$2y$10$GhoBGb94GXIldUO05cuvw.i4nrUH26aEXF7/C8RcG/RqIgb7IxudW', 'UPDATE', '2019-06-28 20:32:43'),
(330, 22, 'menu', 'DELETE', 'Services', 'DELETE', '2019-08-23 17:58:15'),
(331, 23, 'menu', 'DELETE', 'Contact', 'DELETE', '2019-08-23 17:58:19'),
(332, 24, 'menu', 'DELETE', 'About Us', 'DELETE', '2019-08-23 17:58:22'),
(333, 7, 'menu', 'icon', '', 'UPDATE', '2019-08-23 17:59:17'),
(334, 7, 'menu', 'name', 'Home', 'UPDATE', '2019-08-23 17:59:17'),
(335, 7, 'menu', 'url', '/', 'UPDATE', '2019-08-23 17:59:17'),
(336, 7, 'menu', 'description', '0', 'UPDATE', '2019-08-23 17:59:17'),
(337, 7, 'menu', 'name', 'Profile', 'UPDATE', '2019-08-23 18:00:49'),
(338, 7, 'menu', 'url', '/service', 'UPDATE', '2019-08-23 18:00:49'),
(339, 7, 'menu', 'description', 'menu profile', 'UPDATE', '2019-08-23 18:00:49'),
(340, 5, 'menu', 'DELETE', 'Menu', 'DELETE', '2019-10-19 08:23:23'),
(341, 6, 'menu', 'DELETE', 'Halaman', 'DELETE', '2019-10-19 08:23:23'),
(342, 7, 'menu', 'DELETE', 'Transaksi', 'DELETE', '2019-10-19 08:23:23'),
(343, 11, 'menu', 'DELETE', 'Meta', 'DELETE', '2019-10-19 08:23:23'),
(344, 12, 'menu', 'DELETE', 'Banner', 'DELETE', '2019-10-19 08:23:23'),
(345, 13, 'menu', 'DELETE', 'Adsense', 'DELETE', '2019-10-19 08:23:23'),
(346, 25, 'menu', 'DELETE', 'Artikel', 'DELETE', '2019-10-19 08:23:23'),
(347, 22, 'menu', 'rgt', '0', 'UPDATE', '2019-10-29 04:00:16'),
(348, 22, 'menu', 'lft', '0', 'UPDATE', '2019-10-29 04:00:16'),
(349, 4, 'menu', 'rgt', '20', 'UPDATE', '2019-10-29 04:00:16'),
(350, 4, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:00:16'),
(351, 4, 'menu', 'order', '1', 'UPDATE', '2019-10-29 04:00:16'),
(352, 2, 'menu', 'rgt', '5', 'UPDATE', '2019-10-29 04:00:16'),
(353, 2, 'menu', 'lft', '4', 'UPDATE', '2019-10-29 04:00:16'),
(354, 2, 'menu', 'order', '2', 'UPDATE', '2019-10-29 04:00:16'),
(355, 3, 'menu', 'rgt', '7', 'UPDATE', '2019-10-29 04:00:16'),
(356, 3, 'menu', 'lft', '6', 'UPDATE', '2019-10-29 04:00:16'),
(357, 3, 'menu', 'order', '3', 'UPDATE', '2019-10-29 04:00:16'),
(358, 21, 'menu', 'rgt', '9', 'UPDATE', '2019-10-29 04:00:16'),
(359, 21, 'menu', 'lft', '8', 'UPDATE', '2019-10-29 04:00:16'),
(360, 21, 'menu', 'order', '4', 'UPDATE', '2019-10-29 04:00:16'),
(361, 5, 'menu', 'rgt', '11', 'UPDATE', '2019-10-29 04:00:16'),
(362, 5, 'menu', 'lft', '10', 'UPDATE', '2019-10-29 04:00:16'),
(363, 5, 'menu', 'order', '5', 'UPDATE', '2019-10-29 04:00:16'),
(364, 6, 'menu', 'rgt', '13', 'UPDATE', '2019-10-29 04:00:16'),
(365, 6, 'menu', 'lft', '12', 'UPDATE', '2019-10-29 04:00:16'),
(366, 6, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:00:16'),
(367, 15, 'menu', 'rgt', '22', 'UPDATE', '2019-10-29 04:00:16'),
(368, 15, 'menu', 'lft', '21', 'UPDATE', '2019-10-29 04:00:16'),
(369, 15, 'menu', 'order', '10', 'UPDATE', '2019-10-29 04:00:16'),
(370, 22, 'menu', 'url', '/pemesanan', 'UPDATE', '2019-10-29 04:01:33'),
(371, 23, 'menu', 'rgt', '4', 'UPDATE', '2019-10-29 04:07:13'),
(372, 23, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:07:13'),
(373, 23, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:07:13'),
(374, 4, 'menu', 'rgt', '16', 'UPDATE', '2019-10-29 04:07:13'),
(375, 4, 'menu', 'lft', '5', 'UPDATE', '2019-10-29 04:07:13'),
(376, 4, 'menu', 'order', '2', 'UPDATE', '2019-10-29 04:07:13'),
(377, 2, 'menu', 'rgt', '7', 'UPDATE', '2019-10-29 04:07:13'),
(378, 2, 'menu', 'lft', '6', 'UPDATE', '2019-10-29 04:07:13'),
(379, 2, 'menu', 'order', '3', 'UPDATE', '2019-10-29 04:07:13'),
(380, 3, 'menu', 'rgt', '9', 'UPDATE', '2019-10-29 04:07:13'),
(381, 3, 'menu', 'lft', '8', 'UPDATE', '2019-10-29 04:07:13'),
(382, 3, 'menu', 'order', '4', 'UPDATE', '2019-10-29 04:07:13'),
(383, 21, 'menu', 'rgt', '11', 'UPDATE', '2019-10-29 04:07:13'),
(384, 21, 'menu', 'lft', '10', 'UPDATE', '2019-10-29 04:07:13'),
(385, 21, 'menu', 'order', '5', 'UPDATE', '2019-10-29 04:07:13'),
(386, 5, 'menu', 'rgt', '13', 'UPDATE', '2019-10-29 04:07:13'),
(387, 5, 'menu', 'lft', '12', 'UPDATE', '2019-10-29 04:07:13'),
(388, 5, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:07:13'),
(389, 6, 'menu', 'rgt', '15', 'UPDATE', '2019-10-29 04:07:13'),
(390, 6, 'menu', 'lft', '14', 'UPDATE', '2019-10-29 04:07:13'),
(391, 6, 'menu', 'order', '7', 'UPDATE', '2019-10-29 04:07:13'),
(392, 15, 'menu', 'rgt', '18', 'UPDATE', '2019-10-29 04:07:13'),
(393, 15, 'menu', 'lft', '17', 'UPDATE', '2019-10-29 04:07:13'),
(394, 15, 'menu', 'order', '8', 'UPDATE', '2019-10-29 04:07:13'),
(395, 26, 'menu', 'DELETE', 'Berita Acara', 'DELETE', '2019-10-29 04:09:51'),
(396, 24, 'menu', 'rgt', '4', 'UPDATE', '2019-10-29 04:10:09'),
(397, 24, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:10:09'),
(398, 24, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:10:09'),
(399, 25, 'menu', 'rgt', '4', 'UPDATE', '2019-10-29 04:10:09'),
(400, 25, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:10:09'),
(401, 25, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:10:09'),
(402, 4, 'menu', 'rgt', '18', 'UPDATE', '2019-10-29 04:10:09'),
(403, 4, 'menu', 'lft', '7', 'UPDATE', '2019-10-29 04:10:09'),
(404, 4, 'menu', 'order', '3', 'UPDATE', '2019-10-29 04:10:09'),
(405, 2, 'menu', 'rgt', '9', 'UPDATE', '2019-10-29 04:10:09'),
(406, 2, 'menu', 'lft', '8', 'UPDATE', '2019-10-29 04:10:09'),
(407, 2, 'menu', 'order', '4', 'UPDATE', '2019-10-29 04:10:09'),
(408, 3, 'menu', 'rgt', '11', 'UPDATE', '2019-10-29 04:10:09'),
(409, 3, 'menu', 'lft', '10', 'UPDATE', '2019-10-29 04:10:09'),
(410, 3, 'menu', 'order', '5', 'UPDATE', '2019-10-29 04:10:09'),
(411, 21, 'menu', 'rgt', '13', 'UPDATE', '2019-10-29 04:10:09'),
(412, 21, 'menu', 'lft', '12', 'UPDATE', '2019-10-29 04:10:09'),
(413, 21, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:10:09'),
(414, 5, 'menu', 'rgt', '15', 'UPDATE', '2019-10-29 04:10:09'),
(415, 5, 'menu', 'lft', '14', 'UPDATE', '2019-10-29 04:10:09'),
(416, 5, 'menu', 'order', '7', 'UPDATE', '2019-10-29 04:10:09'),
(417, 6, 'menu', 'rgt', '17', 'UPDATE', '2019-10-29 04:10:09'),
(418, 6, 'menu', 'lft', '16', 'UPDATE', '2019-10-29 04:10:09'),
(419, 6, 'menu', 'order', '8', 'UPDATE', '2019-10-29 04:10:09'),
(420, 15, 'menu', 'rgt', '20', 'UPDATE', '2019-10-29 04:10:09'),
(421, 15, 'menu', 'lft', '19', 'UPDATE', '2019-10-29 04:10:09'),
(422, 15, 'menu', 'order', '9', 'UPDATE', '2019-10-29 04:10:09'),
(423, 24, 'menu', 'icon', 'pe-7s-news-paper', 'UPDATE', '2019-10-29 04:11:29'),
(424, 25, 'menu', 'icon', 'pe-7s-news-paper', 'UPDATE', '2019-10-29 04:11:55'),
(425, 25, 'menu', 'rgt', '10', 'UPDATE', '2019-10-29 04:12:18'),
(426, 25, 'menu', 'lft', '9', 'UPDATE', '2019-10-29 04:12:18'),
(427, 25, 'menu', 'order', '4', 'UPDATE', '2019-10-29 04:12:18'),
(428, 24, 'menu', 'rgt', '8', 'UPDATE', '2019-10-29 04:12:18'),
(429, 24, 'menu', 'lft', '7', 'UPDATE', '2019-10-29 04:12:18'),
(430, 24, 'menu', 'order', '3', 'UPDATE', '2019-10-29 04:12:18'),
(431, 31, 'menu', 'DELETE', 'Stock Opname', 'DELETE', '2019-10-29 04:17:01'),
(432, 28, 'menu', 'DELETE', 'Barang', 'DELETE', '2019-10-29 04:17:20'),
(433, 29, 'menu', 'DELETE', 'Satuan', 'DELETE', '2019-10-29 04:17:20'),
(434, 30, 'menu', 'DELETE', 'Retur', 'DELETE', '2019-10-29 04:17:20'),
(435, 34, 'menu', 'rgt', '4', 'UPDATE', '2019-10-29 04:17:47'),
(436, 34, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:17:47'),
(437, 34, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:17:47'),
(438, 25, 'menu', 'rgt', '8', 'UPDATE', '2019-10-29 04:17:47'),
(439, 25, 'menu', 'lft', '7', 'UPDATE', '2019-10-29 04:17:47'),
(440, 25, 'menu', 'order', '3', 'UPDATE', '2019-10-29 04:17:47'),
(441, 24, 'menu', 'rgt', '10', 'UPDATE', '2019-10-29 04:17:47'),
(442, 24, 'menu', 'lft', '9', 'UPDATE', '2019-10-29 04:17:47'),
(443, 24, 'menu', 'order', '4', 'UPDATE', '2019-10-29 04:17:47'),
(444, 4, 'menu', 'rgt', '22', 'UPDATE', '2019-10-29 04:17:47'),
(445, 4, 'menu', 'lft', '11', 'UPDATE', '2019-10-29 04:17:47'),
(446, 4, 'menu', 'order', '5', 'UPDATE', '2019-10-29 04:17:47'),
(447, 2, 'menu', 'rgt', '13', 'UPDATE', '2019-10-29 04:17:47'),
(448, 2, 'menu', 'lft', '12', 'UPDATE', '2019-10-29 04:17:47'),
(449, 2, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:17:47'),
(450, 32, 'menu', 'rgt', '4', 'UPDATE', '2019-10-29 04:17:47'),
(451, 32, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:17:47'),
(452, 32, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:17:47'),
(453, 33, 'menu', 'rgt', '4', 'UPDATE', '2019-10-29 04:17:47'),
(454, 33, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:17:47'),
(455, 33, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:17:47'),
(456, 3, 'menu', 'rgt', '15', 'UPDATE', '2019-10-29 04:17:47'),
(457, 3, 'menu', 'lft', '14', 'UPDATE', '2019-10-29 04:17:47'),
(458, 3, 'menu', 'order', '7', 'UPDATE', '2019-10-29 04:17:47'),
(459, 21, 'menu', 'rgt', '17', 'UPDATE', '2019-10-29 04:17:47'),
(460, 21, 'menu', 'lft', '16', 'UPDATE', '2019-10-29 04:17:47'),
(461, 21, 'menu', 'order', '8', 'UPDATE', '2019-10-29 04:17:47'),
(462, 5, 'menu', 'rgt', '19', 'UPDATE', '2019-10-29 04:17:47'),
(463, 5, 'menu', 'lft', '18', 'UPDATE', '2019-10-29 04:17:47'),
(464, 5, 'menu', 'order', '9', 'UPDATE', '2019-10-29 04:17:47'),
(465, 6, 'menu', 'rgt', '21', 'UPDATE', '2019-10-29 04:17:47'),
(466, 6, 'menu', 'lft', '20', 'UPDATE', '2019-10-29 04:17:47'),
(467, 6, 'menu', 'order', '10', 'UPDATE', '2019-10-29 04:17:47'),
(468, 27, 'menu', 'rgt', '4', 'UPDATE', '2019-10-29 04:17:47'),
(469, 27, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:17:47'),
(470, 27, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:17:47'),
(471, 15, 'menu', 'rgt', '24', 'UPDATE', '2019-10-29 04:17:47'),
(472, 15, 'menu', 'lft', '23', 'UPDATE', '2019-10-29 04:17:47'),
(473, 15, 'menu', 'order', '11', 'UPDATE', '2019-10-29 04:17:47'),
(474, 34, 'menu', 'icon', 'pe-7s-news-paper', 'UPDATE', '2019-10-29 04:18:47'),
(475, 32, 'menu', 'icon', 'pe-7s-news-paper', 'UPDATE', '2019-10-29 04:21:01'),
(476, 27, 'menu', 'DELETE', 'Stock Opname', 'DELETE', '2019-10-29 04:21:23'),
(477, 33, 'menu', 'url', '/administrator/official-report', 'UPDATE', '2019-10-29 04:22:19'),
(478, 34, 'menu', 'url', '/administrator/official-report', 'UPDATE', '2019-10-29 04:23:15'),
(479, 32, 'menu', 'url', '/administrator/official-report', 'UPDATE', '2019-10-29 04:23:37'),
(480, 33, 'menu', 'icon', 'pe-7s-news-paper', 'UPDATE', '2019-10-29 04:24:21'),
(481, 4, 'menu', 'name', 'Pengaturan', 'UPDATE', '2019-10-29 04:26:06'),
(482, 32, 'menu', 'rgt', '17', 'UPDATE', '2019-10-29 04:26:37'),
(483, 32, 'menu', 'lft', '16', 'UPDATE', '2019-10-29 04:26:37'),
(484, 32, 'menu', 'order', '8', 'UPDATE', '2019-10-29 04:26:37'),
(485, 33, 'menu', 'rgt', '19', 'UPDATE', '2019-10-29 04:26:37'),
(486, 33, 'menu', 'lft', '18', 'UPDATE', '2019-10-29 04:26:37'),
(487, 33, 'menu', 'order', '9', 'UPDATE', '2019-10-29 04:26:37'),
(488, 2, 'menu', 'rgt', '15', 'UPDATE', '2019-10-29 04:26:37'),
(489, 2, 'menu', 'lft', '14', 'UPDATE', '2019-10-29 04:26:37'),
(490, 2, 'menu', 'order', '7', 'UPDATE', '2019-10-29 04:26:37'),
(491, 15, 'menu', 'rgt', '32', 'UPDATE', '2019-10-29 04:26:37'),
(492, 15, 'menu', 'lft', '31', 'UPDATE', '2019-10-29 04:26:37'),
(493, 15, 'menu', 'order', '15', 'UPDATE', '2019-10-29 04:26:37'),
(494, 4, 'menu', 'rgt', '28', 'UPDATE', '2019-10-29 04:31:32'),
(495, 39, 'menu', 'rgt', '4', 'UPDATE', '2019-10-29 04:31:32'),
(496, 39, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:31:32'),
(497, 39, 'menu', 'id_parent', '0', 'UPDATE', '2019-10-29 04:31:32'),
(498, 39, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:31:32'),
(499, 38, 'menu', 'rgt', '4', 'UPDATE', '2019-10-29 04:31:32'),
(500, 38, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:31:32'),
(501, 38, 'menu', 'id_parent', '0', 'UPDATE', '2019-10-29 04:31:32'),
(502, 38, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:31:32'),
(503, 33, 'menu', 'rgt', '17', 'UPDATE', '2019-10-29 04:31:32'),
(504, 33, 'menu', 'lft', '16', 'UPDATE', '2019-10-29 04:31:32'),
(505, 33, 'menu', 'order', '8', 'UPDATE', '2019-10-29 04:31:32'),
(506, 40, 'menu', 'rgt', '4', 'UPDATE', '2019-10-29 04:31:32'),
(507, 40, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:31:32'),
(508, 40, 'menu', 'id_parent', '0', 'UPDATE', '2019-10-29 04:31:32'),
(509, 40, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:31:32'),
(510, 37, 'menu', 'rgt', '4', 'UPDATE', '2019-10-29 04:31:32'),
(511, 37, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:31:32'),
(512, 37, 'menu', 'id_parent', '0', 'UPDATE', '2019-10-29 04:31:32'),
(513, 37, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:31:32'),
(514, 36, 'menu', 'rgt', '4', 'UPDATE', '2019-10-29 04:31:32'),
(515, 36, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:31:32'),
(516, 36, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:31:32'),
(517, 35, 'menu', 'rgt', '4', 'UPDATE', '2019-10-29 04:31:32'),
(518, 35, 'menu', 'lft', '3', 'UPDATE', '2019-10-29 04:31:32'),
(519, 35, 'menu', 'order', '6', 'UPDATE', '2019-10-29 04:31:32'),
(520, 2, 'menu', 'rgt', '19', 'UPDATE', '2019-10-29 04:31:32'),
(521, 2, 'menu', 'lft', '18', 'UPDATE', '2019-10-29 04:31:32'),
(522, 2, 'menu', 'order', '9', 'UPDATE', '2019-10-29 04:31:32'),
(523, 3, 'menu', 'rgt', '21', 'UPDATE', '2019-10-29 04:31:32'),
(524, 3, 'menu', 'lft', '20', 'UPDATE', '2019-10-29 04:31:32'),
(525, 3, 'menu', 'order', '10', 'UPDATE', '2019-10-29 04:31:32'),
(526, 21, 'menu', 'rgt', '23', 'UPDATE', '2019-10-29 04:31:32'),
(527, 21, 'menu', 'lft', '22', 'UPDATE', '2019-10-29 04:31:32'),
(528, 21, 'menu', 'order', '11', 'UPDATE', '2019-10-29 04:31:32'),
(529, 5, 'menu', 'rgt', '25', 'UPDATE', '2019-10-29 04:31:32'),
(530, 5, 'menu', 'lft', '24', 'UPDATE', '2019-10-29 04:31:32'),
(531, 5, 'menu', 'order', '12', 'UPDATE', '2019-10-29 04:31:32'),
(532, 6, 'menu', 'rgt', '27', 'UPDATE', '2019-10-29 04:31:32'),
(533, 6, 'menu', 'lft', '26', 'UPDATE', '2019-10-29 04:31:32'),
(534, 6, 'menu', 'order', '13', 'UPDATE', '2019-10-29 04:31:32'),
(535, 15, 'menu', 'rgt', '30', 'UPDATE', '2019-10-29 04:31:32'),
(536, 15, 'menu', 'lft', '29', 'UPDATE', '2019-10-29 04:31:32'),
(537, 15, 'menu', 'order', '14', 'UPDATE', '2019-10-29 04:31:32'),
(538, 38, 'menu', 'icon', 'pe-7s-news-paper', 'UPDATE', '2019-10-29 04:32:42'),
(539, 39, 'menu', 'icon', 'pe-7s-news-paper', 'UPDATE', '2019-10-29 04:33:20'),
(540, 37, 'menu', 'icon', 'pe-7s-news-paper', 'UPDATE', '2019-10-29 04:34:48'),
(541, 40, 'menu', 'icon', 'pe-7s-news-paper', 'UPDATE', '2019-10-29 04:35:07'),
(542, 36, 'menu', 'icon', 'pe-7s-news-paper', 'UPDATE', '2019-10-29 04:35:47'),
(543, 35, 'menu', 'icon', 'pe-7s-news-paper', 'UPDATE', '2019-10-29 04:36:52'),
(544, 6, 'menu', 'status', '1', 'UPDATE', '2019-10-29 06:29:20'),
(545, 5, 'menu', 'status', '1', 'UPDATE', '2019-10-29 06:29:26'),
(546, 28, 'routes', 'DELETE', '/administrator/item', 'DELETE', '2019-12-02 14:13:06'),
(547, 23, 'menu', 'url', '/administrator/reception', 'UPDATE', '2019-12-08 01:12:28'),
(548, 32, 'menu', 'name', 'Barang', 'UPDATE', '2019-12-12 13:02:43'),
(549, 4, 'menu', 'rgt', '40', 'UPDATE', '2019-12-12 13:09:43'),
(550, 41, 'menu', 'rgt', '15', 'UPDATE', '2019-12-12 13:09:43'),
(551, 41, 'menu', 'lft', '14', 'UPDATE', '2019-12-12 13:09:43'),
(552, 41, 'menu', 'order', '7', 'UPDATE', '2019-12-12 13:09:43'),
(553, 39, 'menu', 'rgt', '17', 'UPDATE', '2019-12-12 13:09:43'),
(554, 39, 'menu', 'lft', '16', 'UPDATE', '2019-12-12 13:09:43'),
(555, 39, 'menu', 'order', '8', 'UPDATE', '2019-12-12 13:09:43'),
(556, 38, 'menu', 'rgt', '19', 'UPDATE', '2019-12-12 13:09:43'),
(557, 38, 'menu', 'lft', '18', 'UPDATE', '2019-12-12 13:09:43'),
(558, 38, 'menu', 'order', '9', 'UPDATE', '2019-12-12 13:09:43'),
(559, 33, 'menu', 'rgt', '21', 'UPDATE', '2019-12-12 13:09:43'),
(560, 33, 'menu', 'lft', '20', 'UPDATE', '2019-12-12 13:09:43'),
(561, 33, 'menu', 'order', '10', 'UPDATE', '2019-12-12 13:09:43'),
(562, 40, 'menu', 'rgt', '23', 'UPDATE', '2019-12-12 13:09:43'),
(563, 40, 'menu', 'lft', '22', 'UPDATE', '2019-12-12 13:09:43'),
(564, 40, 'menu', 'order', '11', 'UPDATE', '2019-12-12 13:09:43'),
(565, 37, 'menu', 'rgt', '25', 'UPDATE', '2019-12-12 13:09:43'),
(566, 37, 'menu', 'lft', '24', 'UPDATE', '2019-12-12 13:09:43'),
(567, 37, 'menu', 'order', '12', 'UPDATE', '2019-12-12 13:09:43'),
(568, 36, 'menu', 'rgt', '27', 'UPDATE', '2019-12-12 13:09:43'),
(569, 36, 'menu', 'lft', '26', 'UPDATE', '2019-12-12 13:09:43'),
(570, 36, 'menu', 'order', '13', 'UPDATE', '2019-12-12 13:09:43'),
(571, 35, 'menu', 'rgt', '29', 'UPDATE', '2019-12-12 13:09:43'),
(572, 35, 'menu', 'lft', '28', 'UPDATE', '2019-12-12 13:09:43'),
(573, 35, 'menu', 'order', '14', 'UPDATE', '2019-12-12 13:09:43'),
(574, 2, 'menu', 'rgt', '31', 'UPDATE', '2019-12-12 13:09:43'),
(575, 2, 'menu', 'lft', '30', 'UPDATE', '2019-12-12 13:09:43'),
(576, 2, 'menu', 'order', '15', 'UPDATE', '2019-12-12 13:09:43'),
(577, 3, 'menu', 'rgt', '33', 'UPDATE', '2019-12-12 13:09:43'),
(578, 3, 'menu', 'lft', '32', 'UPDATE', '2019-12-12 13:09:43'),
(579, 3, 'menu', 'order', '16', 'UPDATE', '2019-12-12 13:09:43'),
(580, 21, 'menu', 'rgt', '35', 'UPDATE', '2019-12-12 13:09:43'),
(581, 21, 'menu', 'lft', '34', 'UPDATE', '2019-12-12 13:09:43'),
(582, 21, 'menu', 'order', '17', 'UPDATE', '2019-12-12 13:09:43'),
(583, 5, 'menu', 'rgt', '37', 'UPDATE', '2019-12-12 13:09:43'),
(584, 5, 'menu', 'lft', '36', 'UPDATE', '2019-12-12 13:09:43'),
(585, 5, 'menu', 'order', '18', 'UPDATE', '2019-12-12 13:09:43'),
(586, 6, 'menu', 'rgt', '39', 'UPDATE', '2019-12-12 13:09:44'),
(587, 6, 'menu', 'lft', '38', 'UPDATE', '2019-12-12 13:09:44'),
(588, 6, 'menu', 'order', '19', 'UPDATE', '2019-12-12 13:09:44'),
(589, 15, 'menu', 'rgt', '42', 'UPDATE', '2019-12-12 13:09:44'),
(590, 15, 'menu', 'lft', '41', 'UPDATE', '2019-12-12 13:09:44'),
(591, 15, 'menu', 'order', '20', 'UPDATE', '2019-12-12 13:09:44'),
(592, 41, 'menu', 'icon', 'pe-7s-gift', 'UPDATE', '2019-12-12 13:12:05'),
(593, 32, 'menu', 'url', '/administrator/item', 'UPDATE', '2019-12-12 13:13:53'),
(594, 32, 'menu', 'url', '/administrator/daftar-barang', 'UPDATE', '2019-12-12 13:18:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `depth` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `lft` int(11) NOT NULL,
  `id_parent` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) DEFAULT NULL,
  `menu_role` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `icon`, `name`, `depth`, `rgt`, `lft`, `id_parent`, `url`, `description`, `status`, `order`, `menu_role`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 'pe-7s-graph', 'Beranda', 0, 2, 1, 0, '/administrator/dashboard', '0', '1', 0, 17, '2019-05-26 00:00:00', '2019-06-04 15:09:33', 2),
(2, 'pe-7s-user', 'Pengguna', 1, 33, 32, 4, '/administrator/users', '0', '1', 16, 17, '2019-05-26 00:00:00', '2019-12-12 20:09:43', 2),
(3, 'pe-7s-settings', 'Role', 1, 35, 34, 4, '/administrator/roles', '0', '1', 17, 17, '2019-05-26 00:00:00', '2019-12-12 20:09:43', 2),
(4, 'pe-7s-settings', 'Master Data', 0, 42, 13, 0, '#', '0', '1', 6, 17, '2019-05-26 00:00:00', '2019-12-12 20:09:43', 2),
(5, 'pe-7s-menu', 'Menu', 1, 39, 38, 4, '/administrator/menus', '0', '0', 19, 17, '2019-05-26 00:00:00', '2019-12-12 20:09:43', 2),
(6, 'pe-7s-news-paper', 'Halaman', 1, 41, 40, 4, '/administrator/pages', '0', '0', 20, 17, '2019-05-26 00:00:00', '2019-12-12 20:09:43', 2),
(15, 'pe-7s-helm', 'Log Aktivitas', 0, 44, 43, 0, '/administrator/history', '0', '1', 21, 17, '2019-05-28 00:00:00', '2019-12-12 20:09:44', 2),
(21, 'pe-7s-eyedropper', 'Permission', 1, 37, 36, 4, '/administrator/permission', '0', '1', 18, 17, '2019-06-04 15:05:19', '2019-12-12 20:09:43', 1),
(22, 'pe-7s-note2', 'Pemesanan', 0, 4, 3, 0, '/administrator/pemesanan', NULL, '1', 1, 17, '2019-10-29 10:51:22', '2019-10-29 11:00:16', 1),
(23, 'pe-7s-news-paper', 'Penerimaan', 0, 6, 5, 0, '/administrator/penerimaan', '0', '1', 2, 17, '2019-05-26 00:00:00', '2019-10-29 11:07:13', 2),
(24, 'pe-7s-hourglass', 'Stock Opname', 0, 12, 11, 0, '/administrator/stockopname', '0', '1', 5, 17, '2019-05-26 00:00:00', '2019-10-29 11:17:47', 2),
(25, 'pe-7s-plugin', 'Berita Acara', 0, 10, 9, 0, '/administrator/official-report', '0', '1', 4, 17, '2019-05-26 00:00:00', '2019-10-29 11:17:47', 2),
(32, 'pe-7s-gift', 'Daftar Barang', 1, 15, 14, 4, '/administrator/daftar_barang', '0', '1', 7, 17, '2019-05-26 00:00:00', '2019-10-29 11:26:37', 2),
(33, 'pe-7s-door-lock', 'Satuan', 1, 23, 22, 4, '/administrator/item-unit', '0', '1', 11, 17, '2019-05-26 00:00:00', '2019-12-12 20:09:43', 26),
(34, 'pe-7s-back-2', 'Retur', 0, 8, 7, 0, '/administrator/official-return', '0', '1', 3, 17, '2019-05-26 00:00:00', '2019-10-29 11:17:47', 2),
(35, 'pe-7s-scissors', 'Diskon', 1, 31, 30, 4, '/administrator/discount', '0', '1', 15, 17, '2019-05-26 00:00:00', '2019-12-12 20:09:43', 2),
(36, 'pe-7s-user', 'Vendor', 1, 29, 28, 4, '/administrator/vendor', '0', '1', 14, 17, '2019-05-26 00:00:00', '2019-12-12 20:09:43', 26),
(37, 'pe-7s-box1', 'Rak', 1, 27, 26, 4, '/administrator/rack', '0', '1', 13, 17, '2019-05-26 00:00:00', '2019-12-12 20:09:43', 2),
(38, 'pe-7s-science', 'Golongan Barang', 1, 21, 20, 4, '/administrator/item-class', '0', '1', 10, 17, '2019-05-26 00:00:00', '2019-12-12 20:09:43', 2),
(39, 'pe-7s-magic-wand', 'Jenis Barang', 1, 19, 18, 4, '/administrator/item-type', '0', '1', 9, 17, '2019-05-26 00:00:00', '2019-12-12 20:09:43', 2),
(40, 'pe-7s-culture', 'Gudang', 1, 25, 24, 4, '/administrator/warehouse', '0', '1', 12, 17, '2019-05-26 00:00:00', '2019-12-12 20:09:43', 2),
(41, 'pe-7s-shopbag', 'Barang Vendor', 1, 17, 16, 4, '/administrator/barang_vendor', '0', '1', 8, 17, '2019-05-26 00:00:00', '2019-12-12 20:09:43', 2);

--
-- Trigger `menus`
--
DELIMITER $$
CREATE TRIGGER `logMenusAfterDelete` AFTER DELETE ON `menus` FOR EACH ROW BEGIN
   
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "menu", "DELETE",  OLD.name, "DELETE", NOW());

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logMenusAfterUpdate` AFTER UPDATE ON `menus` FOR EACH ROW BEGIN
    IF (NEW.icon != OLD.icon) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "menu", "icon",  OLD.icon, "UPDATE", NOW());
    END IF;
    
    IF (NEW.name != OLD.name) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "menu", "name",  OLD.name, "UPDATE", NOW());
    END IF;
    
    
    IF (NEW.rgt != OLD.rgt) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "menu", "rgt",  OLD.rgt, "UPDATE", NOW());
    END IF;
    
    
    IF (NEW.lft != OLD.lft) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "menu", "lft",  OLD.lft, "UPDATE", NOW());
    END IF;
    
    
    IF (NEW.id_parent != OLD.id_parent) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "menu", "id_parent",  OLD.id_parent, "UPDATE", NOW());
    END IF;
    
    
    IF (NEW.url != OLD.url) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "menu", "url",  OLD.url, "UPDATE", NOW());
    END IF;
    
    
    IF (NEW.description != OLD.description) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "menu", "description",  OLD.description, "UPDATE", NOW());
    END IF;
    
    
    IF (NEW.status != OLD.status) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "menu", "status",  OLD.status, "UPDATE", NOW());
    END IF;
    
    
    IF (NEW.order != OLD.order) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "menu", "order",  OLD.order, "UPDATE", NOW());
    END IF;
    
    
    IF (NEW.menu_role != OLD.menu_role) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "menu", "menu_role",  OLD.menu_role, "UPDATE", NOW());
    END IF;
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2019_05_23_143517_create_items_table', 2),
(6, '2019_05_23_145006_entrust_setup_tables', 3),
(7, '2019_05_26_043933_create_spatie_table', 4),
(8, '2019_05_26_051058_create_users_table', 5),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 6),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 6),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 6),
(12, '2016_06_01_000004_create_oauth_clients_table', 6),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 6),
(14, '2019_10_19_154320_test_migration', 7),
(19, '2019_10_19_185939_teeest', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(17, 'App\\User', 1),
(16, 'App\\User', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `pages_type` enum('query','custom','form') NOT NULL,
  `status` enum('1','0') NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pages`
--

INSERT INTO `pages` (`id`, `name`, `url`, `pages_type`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 'Service', '/service', 'custom', '1', 1, '2019-06-07 19:47:45', '2019-06-09 16:03:27'),
(5, 'Contact', '/contact', 'custom', '1', 1, '2019-06-07 19:51:31', '2019-06-07 19:51:31'),
(6, 'About us', '/about-us', 'custom', '1', 1, '2019-06-08 00:01:58', '2019-06-08 00:01:58'),
(7, 'transaksi', '/transaksi', 'custom', '1', 1, '2019-08-23 18:00:27', '2019-08-23 18:00:27'),
(11, 'Pemesanan', '/pemesanan', 'query', '1', 1, '2019-10-29 10:47:03', '2019-10-29 10:47:03');

--
-- Trigger `pages`
--
DELIMITER $$
CREATE TRIGGER `logPagesAfterDelete` AFTER DELETE ON `pages` FOR EACH ROW BEGIN
   
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "pages", "DELETE",  OLD.name, "DELETE", NOW());

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logPagesAfterUpdate` AFTER UPDATE ON `pages` FOR EACH ROW BEGIN
    IF (NEW.name != OLD.name) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "pages", "name",  OLD.name, "UPDATE", NOW());
    END IF;
    IF (NEW.url != OLD.url) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "pages", "url",  OLD.url, "UPDATE", NOW());
    END IF;
    IF (NEW.pages_type != OLD.pages_type) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "pages", "pages_type",  OLD.pages_type, "UPDATE", NOW());
    END IF;
      IF (NEW.status != OLD.status) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "pages", "status",  OLD.status, "UPDATE", NOW());
    END IF;
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages_detail`
--

CREATE TABLE `pages_detail` (
  `id` int(11) NOT NULL,
  `id_page` int(11) NOT NULL,
  `custom_html` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pages_detail`
--

INSERT INTO `pages_detail` (`id`, `id_page`, `custom_html`) VALUES
(3, 4, '<style>\r\n.mb-60 {\r\n    margin-bottom: 60px;\r\n}\r\n.services-inner {\r\n    border: 2px solid #48c7ec;\r\n    margin-left: 35px;\r\n    transition: .3s;\r\n}\r\n.our-services-img {\r\n    float: left;\r\n    margin-left: -36px;\r\n    margin-right: 22px;\r\n    margin-top: 28px;\r\n}\r\n.our-services-text {\r\n    padding-right: 10px;\r\n}\r\n.our-services-text {\r\n    overflow: hidden;\r\n    padding: 28px 0 25px;\r\n}\r\n.our-services-text h4 {\r\n    color: #222222;\r\n    font-size: 18px;\r\n    font-weight: 700;\r\n    letter-spacing: 1px;\r\n    margin-bottom: 8px;\r\n    padding-bottom: 10px;\r\n    position: relative;\r\n    text-transform: uppercase;\r\n}\r\n.our-services-text h4::before {\r\n    background: #ec6d48 none repeat scroll 0 0;\r\n    bottom: 0;\r\n    content: \"\";\r\n    height: 1px;\r\n    position: absolute;\r\n    width: 35px;\r\n}\r\n.our-services-wrapper:hover .services-inner {\r\n    background: #fff none repeat scroll 0 0;\r\n    border: 2px solid transparent;\r\n    box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.2);\r\n}\r\n.our-services-text p {\r\n    margin-bottom: 0;\r\n}\r\np {\r\n    font-size: 14px;\r\n    font-weight: 400;\r\n    line-height: 26px;\r\n    color: #666;\r\n    margin-bottom: 15px;\r\n}\r\n</style>\r\n\r\n<div class=\"container\">\r\n    <h2>OUR SERVICES</h2>\r\n	<div class=\"row\">\r\n		<div class=\"col-xl-4 col-lg-4 col-md-6 col-sm-12\">\r\n						<div class=\"our-services-wrapper mb-60\">\r\n							<div class=\"services-inner\">\r\n								<div class=\"our-services-img\">\r\n								<img src=\"https://www.orioninfosolutions.com/assets/img/icon/Agricultural-activities.png\" width=\"68px\" alt=\"\">\r\n								</div>\r\n								<div class=\"our-services-text\">\r\n									<h4>business growth</h4>\r\n									<p>Proin varius pellentesque nuncia tincidunt ante. In id lacus</p>\r\n								</div>\r\n							</div>\r\n						</div>\r\n					</div>\r\n					<div class=\"col-xl-4 col-lg-4 col-md-6 col-sm-12\">\r\n						<div class=\"our-services-wrapper mb-60\">\r\n							<div class=\"services-inner\">\r\n								<div class=\"our-services-img\">\r\n								<img src=\"https://www.orioninfosolutions.com/assets/img/icon/Agricultural-activities.png\" width=\"68px\" alt=\"\">\r\n								</div>\r\n								<div class=\"our-services-text\">\r\n									<h4>business growth</h4>\r\n									<p>Proin varius pellentesque nuncia tincidunt ante. In id lacus</p>\r\n								</div>\r\n							</div>\r\n						</div>\r\n					</div>\r\n					<div class=\"col-xl-4 col-lg-4 col-md-6 col-sm-12\">\r\n						<div class=\"our-services-wrapper mb-60\">\r\n							<div class=\"services-inner\">\r\n								<div class=\"our-services-img\">\r\n								<img src=\"https://www.orioninfosolutions.com/assets/img/icon/Agricultural-activities.png\" width=\"68px\" alt=\"\">\r\n								</div>\r\n								<div class=\"our-services-text\">\r\n									<h4>business growth</h4>\r\n									<p>Proin varius pellentesque nuncia tincidunt ante. In id lacus</p>\r\n								</div>\r\n							</div>\r\n						</div>\r\n					</div>\r\n	</div>\r\n</div>\r\n'),
(4, 5, '<style>\r\n.jumbotron {\r\nbackground: #358CCE;\r\ncolor: #FFF;\r\nborder-radius: 0px;\r\n}\r\n.jumbotron-sm { padding-top: 24px;\r\npadding-bottom: 24px; }\r\n.jumbotron small {\r\ncolor: #FFF;\r\n}\r\n.h1 small {\r\nfont-size: 24px;\r\n}\r\n</style>\r\n<div class=\"jumbotron jumbotron-sm\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-sm-12 col-lg-12\">\r\n                <h1 class=\"h1\">\r\n                    Contact us <small>Feel free to contact us</small></h1>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n<div class=\"container\">\r\n    <div class=\"row\">\r\n        <div class=\"col-md-8\">\r\n            <div class=\"well well-sm\">\r\n                <form>\r\n                <div class=\"row\">\r\n                    <div class=\"col-md-6\">\r\n                        <div class=\"form-group\">\r\n                            <label for=\"name\">\r\n                                Name</label>\r\n                            <input type=\"text\" class=\"form-control\" id=\"name\" placeholder=\"Enter name\" required=\"required\">\r\n                        </div>\r\n                        <div class=\"form-group\">\r\n                            <label for=\"email\">\r\n                                Email Address</label>\r\n                            <div class=\"input-group\">\r\n                                <span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-envelope\"></span>\r\n                                </span>\r\n                                <input type=\"email\" class=\"form-control\" id=\"email\" placeholder=\"Enter email\" required=\"required\"></div>\r\n                        </div>\r\n                        <div class=\"form-group\">\r\n                            <label for=\"subject\">\r\n                                Subject</label>\r\n                            <select id=\"subject\" name=\"subject\" class=\"form-control\" required=\"required\">\r\n                                <option value=\"na\" selected=\"\">Choose One:</option>\r\n                                <option value=\"service\">General Customer Service</option>\r\n                                <option value=\"suggestions\">Suggestions</option>\r\n                                <option value=\"product\">Product Support</option>\r\n                            </select>\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"col-md-6\">\r\n                        <div class=\"form-group\">\r\n                            <label for=\"name\">\r\n                                Message</label>\r\n                            <textarea name=\"message\" id=\"message\" class=\"form-control\" rows=\"9\" cols=\"25\" required=\"required\" placeholder=\"Message\"></textarea>\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"col-md-12\">\r\n                        <button type=\"submit\" class=\"btn btn-primary pull-right\" id=\"btnContactUs\">\r\n                            Send Message</button>\r\n                    </div>\r\n                </div>\r\n                </form>\r\n            </div>\r\n        </div>\r\n        <div class=\"col-md-4\">\r\n            <form>\r\n            <legend><span class=\"glyphicon glyphicon-globe\"></span>&nbsp;Our office</legend>\r\n            <address>\r\n                <strong>Twitter, Inc.</strong><br>\r\n                795 Folsom Ave, Suite 600<br>\r\n                San Francisco, CA 94107<br>\r\n                <abbr title=\"Phone\">\r\n                    P:</abbr>\r\n                (123) 456-7890\r\n            </address>\r\n            <address>\r\n                <strong>Full Name</strong><br>\r\n                <a href=\"mailto:#\">first.last@example.com</a>\r\n            </address>\r\n            </form>\r\n        </div>\r\n    </div>\r\n</div>'),
(5, 6, '<div class=\"aboutus-section\">\r\n\r\n        <div class=\"container\">\r\n\r\n            <div class=\"row\">\r\n\r\n                <div class=\"col-md-3 col-sm-6 col-xs-12\">\r\n\r\n                    <div class=\"aboutus\">\r\n\r\n                        <h2 class=\"aboutus-title\">About Us YEAH</h2>\r\n\r\n                        <p class=\"aboutus-text\">Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in.</p>\r\n\r\n                        <p class=\"aboutus-text\">This is Photoshop\'s version of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem</p>\r\n\r\n                        <a class=\"aboutus-more\" href=\"#\">read more</a>\r\n\r\n                    </div>\r\n\r\n                </div>\r\n\r\n                <div class=\"col-md-3 col-sm-6 col-xs-12\">\r\n\r\n                    <div class=\"aboutus-banner\">\r\n\r\n                        <img src=\"http://themeinnovation.com/demo2/html/build-up/img/home1/about1.jpg\" alt=\"\">\r\n\r\n                    </div>\r\n\r\n                </div>\r\n\r\n                <div class=\"col-md-5 col-sm-6 col-xs-12\">\r\n\r\n                    <div class=\"feature\">\r\n\r\n                        <div class=\"feature-box\">\r\n\r\n                            <div class=\"clearfix\">\r\n\r\n                                <div class=\"iconset\">\r\n\r\n                                    <span class=\"glyphicon glyphicon-cog icon\"></span>\r\n\r\n                                </div>\r\n\r\n                                <div class=\"feature-content\">\r\n\r\n                                    <h4>Work with heart</h4>\r\n\r\n                                    <p>Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in.</p>\r\n\r\n                                </div>\r\n\r\n                            </div>\r\n\r\n                        </div>\r\n\r\n                        <div class=\"feature-box\">\r\n\r\n                            <div class=\"clearfix\">\r\n\r\n                                <div class=\"iconset\">\r\n\r\n                                    <span class=\"glyphicon glyphicon-cog icon\"></span>\r\n\r\n                                </div>\r\n\r\n                                <div class=\"feature-content\">\r\n\r\n                                    <h4>Reliable services</h4>\r\n\r\n                                    <p>Donec vitae sapien ut libero venenatis faucibu. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt</p>\r\n\r\n                                </div>\r\n\r\n                            </div>\r\n\r\n                        </div>\r\n\r\n                        <div class=\"feature-box\">\r\n\r\n                            <div class=\"clearfix\">\r\n\r\n                                <div class=\"iconset\">\r\n\r\n                                    <span class=\"glyphicon glyphicon-cog icon\"></span>\r\n\r\n                                </div>\r\n\r\n                                <div class=\"feature-content\">\r\n\r\n                                    <h4>Great support</h4>\r\n\r\n                                    <p>Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in.</p>\r\n\r\n                                </div>\r\n\r\n                            </div>\r\n\r\n                        </div>\r\n\r\n                    </div>\r\n\r\n                </div>\r\n\r\n            </div>\r\n\r\n        </div>\r\n\r\n    </div>\r\n<style>\r\n.aboutus-section {\r\n    padding: 90px 0;\r\n}\r\n.aboutus-title {\r\n    font-size: 30px;\r\n    letter-spacing: 0;\r\n    line-height: 32px;\r\n    margin: 0 0 39px;\r\n    padding: 0 0 11px;\r\n    position: relative;\r\n    text-transform: uppercase;\r\n    color: #000;\r\n}\r\n.aboutus-title::after {\r\n    background: #fdb801 none repeat scroll 0 0;\r\n    bottom: 0;\r\n    content: \"\";\r\n    height: 2px;\r\n    left: 0;\r\n    position: absolute;\r\n    width: 54px;\r\n}\r\n.aboutus-text {\r\n    color: #606060;\r\n    font-size: 13px;\r\n    line-height: 22px;\r\n    margin: 0 0 35px;\r\n}\r\n\r\na:hover, a:active {\r\n    color: #ffb901;\r\n    text-decoration: none;\r\n    outline: 0;\r\n}\r\n.aboutus-more {\r\n    border: 1px solid #fdb801;\r\n    border-radius: 25px;\r\n    color: #fdb801;\r\n    display: inline-block;\r\n    font-size: 14px;\r\n    font-weight: 700;\r\n    letter-spacing: 0;\r\n    padding: 7px 20px;\r\n    text-transform: uppercase;\r\n}\r\n.feature .feature-box .iconset {\r\n    background: #fff none repeat scroll 0 0;\r\n    float: left;\r\n    position: relative;\r\n    width: 18%;\r\n}\r\n.feature .feature-box .iconset::after {\r\n    background: #fdb801 none repeat scroll 0 0;\r\n    content: \"\";\r\n    height: 150%;\r\n    left: 43%;\r\n    position: absolute;\r\n    top: 100%;\r\n    width: 1px;\r\n}\r\n\r\n.feature .feature-box .feature-content h4 {\r\n    color: #0f0f0f;\r\n    font-size: 18px;\r\n    letter-spacing: 0;\r\n    line-height: 22px;\r\n    margin: 0 0 5px;\r\n}\r\n\r\n\r\n.feature .feature-box .feature-content {\r\n    float: left;\r\n    padding-left: 28px;\r\n    width: 78%;\r\n}\r\n.feature .feature-box .feature-content h4 {\r\n    color: #0f0f0f;\r\n    font-size: 18px;\r\n    letter-spacing: 0;\r\n    line-height: 22px;\r\n    margin: 0 0 5px;\r\n}\r\n.feature .feature-box .feature-content p {\r\n    color: #606060;\r\n    font-size: 13px;\r\n    line-height: 22px;\r\n}\r\n.icon {\r\n    color : #f4b841;\r\n    padding:0px;\r\n    font-size:40px;\r\n    border: 1px solid #fdb801;\r\n    border-radius: 100px;\r\n    color: #fdb801;\r\n    font-size: 28px;\r\n    height: 70px;\r\n    line-height: 70px;\r\n    text-align: center;\r\n    width: 70px;\r\n}\r\n}\r\n</style>'),
(6, 7, '<p>halaman transaksi</p>'),
(7, 11, 'SELECT * from hd_pemesanan');

--
-- Trigger `pages_detail`
--
DELIMITER $$
CREATE TRIGGER `logPagesDetailAfterDelete` AFTER DELETE ON `pages_detail` FOR EACH ROW BEGIN
   
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id_page, "pages_detail", "DELETE",  OLD.custom_html, "DELETE", NOW());

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logPagesDetailAfterUpdate` AFTER UPDATE ON `pages_detail` FOR EACH ROW BEGIN
    IF (NEW.custom_html != OLD.custom_html) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id_page, "pages_detail", "custom_html",  OLD.custom_html, "UPDATE", NOW());
    END IF;
    
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2019-05-25 21:47:03', '2019-05-25 21:47:03'),
(2, 'role-create', 'web', '2019-05-25 21:47:03', '2019-05-25 21:47:03'),
(3, 'role-edit', 'web', '2019-05-25 21:47:03', '2019-05-25 21:47:03'),
(4, 'role-delete', 'web', '2019-05-25 21:47:03', '2019-05-25 21:47:03'),
(5, 'user-list', 'web', '2019-05-25 21:47:03', '2019-05-25 21:47:03'),
(6, 'user-create', 'web', '2019-05-25 21:47:03', '2019-05-25 21:47:03'),
(7, 'user-edit', 'web', '2019-05-25 21:47:03', '2019-05-25 21:47:03'),
(8, 'user-delete', 'web', '2019-05-25 21:47:03', '2019-05-25 21:47:03'),
(9, 'meta-list', 'web', '2019-05-26 17:00:00', '2019-05-26 17:00:00'),
(10, 'meta-create', 'web', '2019-05-26 17:00:00', '2019-05-26 17:00:00'),
(11, 'meta-edit', 'web', '2019-05-26 17:00:00', '2019-05-26 17:00:00'),
(12, 'meta-delete', 'web', '2019-05-26 17:00:00', '2019-05-26 17:00:00'),
(13, 'menu-list', 'web', '2019-05-31 17:00:00', '2019-05-31 17:00:00'),
(14, 'menu-create', 'web', '2019-05-31 17:00:00', '2019-05-31 17:00:00'),
(15, 'menu-edit', 'web', '2019-05-31 17:00:00', '2019-05-31 17:00:00'),
(16, 'menu-delete', 'web', '2019-05-31 17:00:00', '2019-05-31 17:00:00'),
(17, 'permission-list', 'web', '2019-06-03 17:00:00', '2019-06-03 17:00:00'),
(18, 'permission-create', 'web', '2019-06-03 17:00:00', '2019-06-03 17:00:00'),
(19, 'permission-edit', 'web', '2019-06-03 17:00:00', '2019-06-03 17:00:00'),
(20, 'permission-delete', 'web', '2019-06-03 17:00:00', '2019-06-03 17:00:00'),
(73, 'banner-list', 'web', '2019-06-06 00:45:37', '2019-06-06 21:21:55'),
(74, 'banner-create', 'web', '2019-06-06 00:45:37', '2019-06-06 21:21:55'),
(75, 'banner-edit', 'web', '2019-06-06 00:45:37', '2019-06-06 21:21:55'),
(76, 'banner-delete', 'web', '2019-06-06 00:45:37', '2019-06-06 21:21:55'),
(86, 'pages-list', 'web', '2019-06-12 06:30:48', '2019-06-12 06:30:48'),
(87, 'pages-create', 'web', '2019-06-12 06:30:48', '2019-06-12 06:30:48'),
(88, 'pages-edit', 'web', '2019-06-12 06:30:48', '2019-06-12 06:30:48'),
(89, 'pages-delete', 'web', '2019-06-12 06:30:48', '2019-06-12 06:30:48'),
(90, 'article-list', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(91, 'article-create', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(92, 'article-edit', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(93, 'article-delete', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(94, 'pemesanan-list', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(95, 'pemesanan-create', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(96, 'pemesanan-edit', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(97, 'pemesanan-delete', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(98, 'penerimaan-list', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(99, 'penerimaan-create', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(100, 'penerimaan-edit', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(101, 'penerimaan-delete', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(102, 'daftar_barang-list', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(103, 'daftar_barang-create', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(104, 'daftar_barang-edit', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49'),
(105, 'daftar_barang-delete', 'web', '2019-06-13 06:29:49', '2019-06-13 06:29:49');

--
-- Trigger `permissions`
--
DELIMITER $$
CREATE TRIGGER `logPermissionAfterUpdate` AFTER UPDATE ON `permissions` FOR EACH ROW BEGIN
    IF (NEW.name != OLD.name) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "permissions", "name",  OLD.name, "UPDATE", NOW());
    END IF;    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logPermissionsAfterDelete` AFTER DELETE ON `permissions` FOR EACH ROW BEGIN
   
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "permissions", "DELETE",  OLD.name, "DELETE", NOW());

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(16, 'user', 'web', '2019-05-25 23:46:10', '2019-05-25 23:46:10'),
(17, 'admin', 'web', '2019-05-26 00:30:18', '2019-05-26 00:31:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 17),
(2, 17),
(3, 17),
(4, 17),
(5, 17),
(6, 17),
(7, 17),
(8, 17),
(9, 17),
(10, 17),
(11, 17),
(12, 17),
(13, 17),
(14, 17),
(15, 17),
(16, 17),
(17, 17),
(18, 17),
(19, 17),
(20, 17),
(73, 17),
(74, 17),
(75, 17),
(76, 17),
(86, 17),
(87, 17),
(88, 17),
(89, 17),
(90, 17),
(91, 17),
(92, 17),
(93, 17),
(94, 17),
(95, 17),
(96, 17),
(97, 17),
(98, 17),
(99, 17),
(100, 17),
(101, 17),
(102, 17),
(103, 17),
(104, 17),
(105, 17);

-- --------------------------------------------------------

--
-- Struktur dari tabel `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `name_as` varchar(100) NOT NULL,
  `uses_controller` varchar(100) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `routes`
--

INSERT INTO `routes` (`id`, `url`, `name_as`, `uses_controller`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'administrator/users', 'user', 'Backend\\UserController', 2, '2019-05-26 00:00:00', '2019-05-26 00:00:00'),
(2, 'administrator/roles', 'roles', 'Backend\\RoleController', 2, '2019-05-26 00:00:00', '2019-05-26 00:00:00'),
(3, 'administrator/dashboard', 'dashboard', 'Backend\\DashboardController', 2, '2019-05-26 00:00:00', '2019-05-26 00:00:00'),
(4, 'administrator/menus', 'menus', 'Backend\\MenuController', 2, '2019-05-26 00:00:00', '2019-05-26 00:00:00'),
(5, '/home', 'Home', 'Frontend\\FrontController', 2, '2019-05-27 00:00:00', '2019-05-27 00:00:00'),
(6, '/administrator/meta', 'meta', 'Backend\\MetaController', 2, '2019-05-27 00:00:00', '2019-05-27 00:00:00'),
(7, '/administrator/history', 'history', 'Backend\\HistoryController', 2, '2019-05-28 00:00:00', '2019-05-28 00:00:00'),
(8, 'administrator/permission', 'permission', 'Backend\\PermissionController', 2, '2019-06-04 00:00:00', '2019-06-04 00:00:00'),
(9, 'administrator/pages', 'pages', 'Backend\\PageController', 2, '2019-06-07 00:00:00', '2019-06-07 00:00:00'),
(11, '/service', 'service', 'Frontend\\CustomPageController', 1, '2019-06-07 19:47:45', '2019-06-07 19:47:45'),
(12, '/contact', 'Contact', 'Frontend\\CustomPageController', 1, '2019-06-07 19:51:31', '2019-06-07 19:51:31'),
(13, '/about-us', 'About us', 'Frontend\\CustomPageController', 1, '2019-06-08 00:01:58', '2019-06-08 00:01:58'),
(16, '/meta', 'meta', 'Frontend\\CustomPageController', 1, '2019-06-08 14:30:56', '2019-06-08 14:30:56'),
(24, '/administrator/pemesanan', 'pemesanan', 'Backend\\PemesananController', 2, '2019-06-12 00:00:00', '2019-06-12 00:00:00'),
(25, 'administrator/article', 'article', 'Backend\\ArticleController', 2, '2019-06-13 00:00:00', '2019-06-13 00:00:00'),
(26, '/transaksi', 'transaksi', 'Frontend\\CustomPageController', 1, '2019-08-23 18:00:27', '2019-08-23 18:00:27'),
(27, '/order', 'Pemesanan', 'Frontend\\CustomPageController', 1, '2019-10-29 10:47:03', '2019-10-29 10:47:03'),
(28, '/administrator/penerimaan', 'penerimaan', 'Backend\\PenerimaanController', 2, '2019-06-12 00:00:00', '2019-06-12 00:00:00'),
(29, '/administrator/daftar_barang', 'daftar barang', 'Backend\\DaftarBarangController', 2, '2019-06-12 00:00:00', '2019-06-12 00:00:00');

--
-- Trigger `routes`
--
DELIMITER $$
CREATE TRIGGER `logRoutesAfterDelete` AFTER DELETE ON `routes` FOR EACH ROW BEGIN
   
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "routes", "DELETE",  OLD.url, "DELETE", NOW());

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$yEzoe6gbIDD46qeQm3OBEuG77WoTK4h7tOC1P.Ev6DnPm3/MJoohy', NULL, '2019-05-25 22:13:19', '2019-05-27 09:33:49'),
(2, 'user', 'user@user.com', '$2y$10$NDkAeiA.XYhS2soPupCjx.GsPTIr3hdbubSp5Tdu.mNucK9NQsd.O', NULL, '2019-05-26 00:48:25', '2019-06-28 20:32:43');

--
-- Trigger `users`
--
DELIMITER $$
CREATE TRIGGER `logUserAfterUpdate` AFTER UPDATE ON `users` FOR EACH ROW BEGIN
    IF (NEW.email != OLD.email) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`) 
        VALUES 
            (OLD.id, "users", "email",  OLD.email, "UPDATE", NOW());
    END IF;
    IF (NEW.name != OLD.name) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`) 
        VALUES 
            (OLD.id, "users", "name", OLD.name, "UPDATE", NOW());
    END IF;
    IF (NEW.password != OLD.password) THEN
        INSERT INTO log 
            (`id_data`, `table_data`, `field` , `values`, `event`, `created_at`)  
        VALUES 
            (OLD.id, "users", "password", OLD.password, "UPDATE", NOW());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_barang_vendor`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_barang_vendor` (
`id_vendor` int(11)
,`id_barang` int(11)
,`harga_beli` int(11)
,`qty` int(11)
,`no_batch` varchar(100)
,`nama_barang` varchar(100)
,`nama_satuan` varchar(20)
,`id_satuan` int(11)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_barang_vendor`
--
DROP TABLE IF EXISTS `v_barang_vendor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_barang_vendor`  AS  select `a`.`id_vendor` AS `id_vendor`,`a`.`id_barang` AS `id_barang`,`a`.`harga_beli` AS `harga_beli`,`a`.`qty` AS `qty`,`a`.`no_batch` AS `no_batch`,`b`.`nama_barang` AS `nama_barang`,`c`.`nama_satuan` AS `nama_satuan`,`c`.`id_satuan` AS `id_satuan` from ((`hd_barang_vendor` `a` join `hd_barang` `b` on((`a`.`id_barang` = `b`.`id_barang`))) join `hd_barang_satuan` `c` on((`a`.`id_satuan` = `c`.`id_satuan`))) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `hd_barang`
--
ALTER TABLE `hd_barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_satuan` (`id_satuan`),
  ADD KEY `id_golongan_barang` (`id_golongan_barang`),
  ADD KEY `id_jenis_barang` (`id_jenis_barang`);

--
-- Indeks untuk tabel `hd_barang_foto`
--
ALTER TABLE `hd_barang_foto`
  ADD PRIMARY KEY (`id_barang_foto`);

--
-- Indeks untuk tabel `hd_barang_golongan`
--
ALTER TABLE `hd_barang_golongan`
  ADD PRIMARY KEY (`id_golongan_barang`);

--
-- Indeks untuk tabel `hd_barang_jenis`
--
ALTER TABLE `hd_barang_jenis`
  ADD PRIMARY KEY (`id_jenis_barang`);

--
-- Indeks untuk tabel `hd_barang_satuan`
--
ALTER TABLE `hd_barang_satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indeks untuk tabel `hd_barang_vendor`
--
ALTER TABLE `hd_barang_vendor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang` (`id_barang`),
  ADD KEY `satuan` (`id_satuan`),
  ADD KEY `vendor` (`id_vendor`);

--
-- Indeks untuk tabel `hd_berita_acara`
--
ALTER TABLE `hd_berita_acara`
  ADD PRIMARY KEY (`id_berita_acara`);

--
-- Indeks untuk tabel `hd_berita_acara_detail`
--
ALTER TABLE `hd_berita_acara_detail`
  ADD PRIMARY KEY (`id_berita_acara_detail`),
  ADD KEY `id_berita_acara` (`id_berita_acara`) USING BTREE,
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `hd_data_apotek`
--
ALTER TABLE `hd_data_apotek`
  ADD PRIMARY KEY (`id_apotek`),
  ADD UNIQUE KEY `telepon` (`telepon`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indeks untuk tabel `hd_diskon`
--
ALTER TABLE `hd_diskon`
  ADD PRIMARY KEY (`id_diskon`);

--
-- Indeks untuk tabel `hd_diskon_detail`
--
ALTER TABLE `hd_diskon_detail`
  ADD PRIMARY KEY (`id_diskon_detail`),
  ADD KEY `id_diskon` (`id_diskon`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_vendor` (`id_vendor`),
  ADD KEY `id_barang_2` (`id_barang`);

--
-- Indeks untuk tabel `hd_gudang`
--
ALTER TABLE `hd_gudang`
  ADD PRIMARY KEY (`id_gudang`);

--
-- Indeks untuk tabel `hd_pemesanan`
--
ALTER TABLE `hd_pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD UNIQUE KEY `no_pemesanan` (`no_pemesanan`),
  ADD KEY `id_vendor` (`id_vendor`);

--
-- Indeks untuk tabel `hd_pemesanan_detail`
--
ALTER TABLE `hd_pemesanan_detail`
  ADD PRIMARY KEY (`id_pemesanan_detail`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `hd_penerimaan`
--
ALTER TABLE `hd_penerimaan`
  ADD PRIMARY KEY (`id_penerimaan`),
  ADD UNIQUE KEY `no_penerimaan` (`no_penerimaan`) USING BTREE,
  ADD KEY `id_pemesanan` (`id_pemesanan`);

--
-- Indeks untuk tabel `hd_penerimaan_detail`
--
ALTER TABLE `hd_penerimaan_detail`
  ADD PRIMARY KEY (`id_penerimaan_detail`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_rak` (`id_rak`),
  ADD KEY `id_penerimaan` (`id_penerimaan`);

--
-- Indeks untuk tabel `hd_rak`
--
ALTER TABLE `hd_rak`
  ADD PRIMARY KEY (`id_rak`),
  ADD KEY `id_gudang` (`id_gudang`);

--
-- Indeks untuk tabel `hd_retur_barang`
--
ALTER TABLE `hd_retur_barang`
  ADD PRIMARY KEY (`id_retur_barang`),
  ADD KEY `id_pemesanan` (`id_pemesanan`),
  ADD KEY `id_penerimaan` (`id_penerimaan`);

--
-- Indeks untuk tabel `hd_retur_barang_detail`
--
ALTER TABLE `hd_retur_barang_detail`
  ADD PRIMARY KEY (`id_retur_barang_detail`),
  ADD KEY `id_retur_barang` (`id_retur_barang`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_satuan` (`id_satuan`);

--
-- Indeks untuk tabel `hd_stock_opname`
--
ALTER TABLE `hd_stock_opname`
  ADD PRIMARY KEY (`id_stock_opname`);

--
-- Indeks untuk tabel `hd_stock_opname_detail`
--
ALTER TABLE `hd_stock_opname_detail`
  ADD PRIMARY KEY (`id_stock_opname_detail`),
  ADD KEY `id_stock_opname` (`id_stock_opname`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `hd_vendor`
--
ALTER TABLE `hd_vendor`
  ADD PRIMARY KEY (`id_vendor`);

--
-- Indeks untuk tabel `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pages_detail`
--
ALTER TABLE `pages_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `hd_barang`
--
ALTER TABLE `hd_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `hd_barang_foto`
--
ALTER TABLE `hd_barang_foto`
  MODIFY `id_barang_foto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_barang_golongan`
--
ALTER TABLE `hd_barang_golongan`
  MODIFY `id_golongan_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `hd_barang_jenis`
--
ALTER TABLE `hd_barang_jenis`
  MODIFY `id_jenis_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `hd_barang_satuan`
--
ALTER TABLE `hd_barang_satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `hd_barang_vendor`
--
ALTER TABLE `hd_barang_vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `hd_berita_acara`
--
ALTER TABLE `hd_berita_acara`
  MODIFY `id_berita_acara` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_berita_acara_detail`
--
ALTER TABLE `hd_berita_acara_detail`
  MODIFY `id_berita_acara_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_data_apotek`
--
ALTER TABLE `hd_data_apotek`
  MODIFY `id_apotek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `hd_diskon`
--
ALTER TABLE `hd_diskon`
  MODIFY `id_diskon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_diskon_detail`
--
ALTER TABLE `hd_diskon_detail`
  MODIFY `id_diskon_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_gudang`
--
ALTER TABLE `hd_gudang`
  MODIFY `id_gudang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_pemesanan`
--
ALTER TABLE `hd_pemesanan`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `hd_pemesanan_detail`
--
ALTER TABLE `hd_pemesanan_detail`
  MODIFY `id_pemesanan_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `hd_penerimaan`
--
ALTER TABLE `hd_penerimaan`
  MODIFY `id_penerimaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `hd_penerimaan_detail`
--
ALTER TABLE `hd_penerimaan_detail`
  MODIFY `id_penerimaan_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `hd_rak`
--
ALTER TABLE `hd_rak`
  MODIFY `id_rak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `hd_retur_barang`
--
ALTER TABLE `hd_retur_barang`
  MODIFY `id_retur_barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_retur_barang_detail`
--
ALTER TABLE `hd_retur_barang_detail`
  MODIFY `id_retur_barang_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_stock_opname`
--
ALTER TABLE `hd_stock_opname`
  MODIFY `id_stock_opname` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_stock_opname_detail`
--
ALTER TABLE `hd_stock_opname_detail`
  MODIFY `id_stock_opname_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_vendor`
--
ALTER TABLE `hd_vendor`
  MODIFY `id_vendor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `log`
--
ALTER TABLE `log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=595;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pages_detail`
--
ALTER TABLE `pages_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `hd_barang_vendor`
--
ALTER TABLE `hd_barang_vendor`
  ADD CONSTRAINT `barang` FOREIGN KEY (`id_barang`) REFERENCES `hd_barang` (`id_barang`),
  ADD CONSTRAINT `satuan` FOREIGN KEY (`id_satuan`) REFERENCES `hd_barang_satuan` (`id_satuan`),
  ADD CONSTRAINT `vendor` FOREIGN KEY (`id_vendor`) REFERENCES `hd_vendor` (`id_vendor`);

--
-- Ketidakleluasaan untuk tabel `hd_berita_acara_detail`
--
ALTER TABLE `hd_berita_acara_detail`
  ADD CONSTRAINT `hd_berita_acara_detail_ibfk_1` FOREIGN KEY (`id_berita_acara`) REFERENCES `hd_berita_acara` (`id_berita_acara`),
  ADD CONSTRAINT `hd_berita_acara_detail_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `hd_barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `hd_diskon_detail`
--
ALTER TABLE `hd_diskon_detail`
  ADD CONSTRAINT `hd_diskon_detail_ibfk_1` FOREIGN KEY (`id_diskon`) REFERENCES `hd_diskon` (`id_diskon`),
  ADD CONSTRAINT `hd_diskon_detail_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `hd_barang` (`id_barang`),
  ADD CONSTRAINT `hd_diskon_detail_ibfk_3` FOREIGN KEY (`id_vendor`) REFERENCES `hd_vendor` (`id_vendor`);

--
-- Ketidakleluasaan untuk tabel `hd_pemesanan`
--
ALTER TABLE `hd_pemesanan`
  ADD CONSTRAINT `hd_pemesanan_ibfk_1` FOREIGN KEY (`id_vendor`) REFERENCES `hd_vendor` (`id_vendor`);

--
-- Ketidakleluasaan untuk tabel `hd_penerimaan`
--
ALTER TABLE `hd_penerimaan`
  ADD CONSTRAINT `hd_penerimaan_ibfk_1` FOREIGN KEY (`id_pemesanan`) REFERENCES `hd_pemesanan` (`id_pemesanan`);

--
-- Ketidakleluasaan untuk tabel `hd_penerimaan_detail`
--
ALTER TABLE `hd_penerimaan_detail`
  ADD CONSTRAINT `hd_penerimaan_detail_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `hd_barang` (`id_barang`),
  ADD CONSTRAINT `hd_penerimaan_detail_ibfk_3` FOREIGN KEY (`id_penerimaan`) REFERENCES `hd_penerimaan` (`id_penerimaan`),
  ADD CONSTRAINT `hd_penerimaan_detail_ibfk_4` FOREIGN KEY (`id_rak`) REFERENCES `hd_rak` (`id_rak`);

--
-- Ketidakleluasaan untuk tabel `hd_retur_barang`
--
ALTER TABLE `hd_retur_barang`
  ADD CONSTRAINT `hd_retur_barang_ibfk_1` FOREIGN KEY (`id_pemesanan`) REFERENCES `hd_pemesanan` (`id_pemesanan`),
  ADD CONSTRAINT `hd_retur_barang_ibfk_2` FOREIGN KEY (`id_penerimaan`) REFERENCES `hd_penerimaan` (`id_penerimaan`);

--
-- Ketidakleluasaan untuk tabel `hd_retur_barang_detail`
--
ALTER TABLE `hd_retur_barang_detail`
  ADD CONSTRAINT `hd_retur_barang_detail_ibfk_1` FOREIGN KEY (`id_retur_barang`) REFERENCES `hd_retur_barang` (`id_retur_barang`),
  ADD CONSTRAINT `hd_retur_barang_detail_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `hd_barang` (`id_barang`),
  ADD CONSTRAINT `hd_retur_barang_detail_ibfk_3` FOREIGN KEY (`id_satuan`) REFERENCES `hd_barang_satuan` (`id_satuan`);

--
-- Ketidakleluasaan untuk tabel `hd_stock_opname_detail`
--
ALTER TABLE `hd_stock_opname_detail`
  ADD CONSTRAINT `hd_stock_opname_detail_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `hd_barang` (`id_barang`),
  ADD CONSTRAINT `id_stock_opname` FOREIGN KEY (`id_stock_opname`) REFERENCES `hd_stock_opname` (`id_stock_opname`);

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
