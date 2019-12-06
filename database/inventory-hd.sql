-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Okt 2019 pada 12.07
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory-hd`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_barang`
--

CREATE TABLE `hd_barang` (
  `id_barang` int(11) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `stock_minimal` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `id_golongan_barang` int(11) NOT NULL,
  `id_jenis_barang` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_barang_jenis`
--

CREATE TABLE `hd_barang_jenis` (
  `id_jenis_barang` int(11) NOT NULL,
  `kode_jenis_barang` varchar(20) NOT NULL,
  `nama_jenis_barang` int(100) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `keterangan` text NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `no_pemesanan` varchar(20) NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `dibuat_tgl` int(11) NOT NULL,
  `status` enum('1','2','3','4','5') NOT NULL COMMENT '1 -> sukses, 2->revisi, 3-> selesai, 4->sampah, 5->barang belum lengkap) jika status 3 tidak bisa rubah ke 4',
  `mengetahui_oleh` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_pemesanan_detail`
--

CREATE TABLE `hd_pemesanan_detail` (
  `id_pemesanan_detail` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `mengetahui_oleh` int(11) NOT NULL,
  `tanggal_penerimaan` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hd_penerimaan_detail`
--

CREATE TABLE `hd_penerimaan_detail` (
  `id_penerimaan_detail` int(11) NOT NULL,
  `id_penerimaan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `id_rak` int(11) NOT NULL,
  `tanggal_kadaluarsa` datetime NOT NULL,
  `no_batch` varchar(20) NOT NULL,
  `barcode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD PRIMARY KEY (`id_barang_foto`),
  ADD UNIQUE KEY `id_barang` (`id_barang`);

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
  ADD UNIQUE KEY `no_faktur` (`no_faktur`),
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
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `hd_barang`
--
ALTER TABLE `hd_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_barang_foto`
--
ALTER TABLE `hd_barang_foto`
  MODIFY `id_barang_foto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_barang_golongan`
--
ALTER TABLE `hd_barang_golongan`
  MODIFY `id_golongan_barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_barang_jenis`
--
ALTER TABLE `hd_barang_jenis`
  MODIFY `id_jenis_barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_barang_satuan`
--
ALTER TABLE `hd_barang_satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_pemesanan_detail`
--
ALTER TABLE `hd_pemesanan_detail`
  MODIFY `id_pemesanan_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_penerimaan`
--
ALTER TABLE `hd_penerimaan`
  MODIFY `id_penerimaan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_penerimaan_detail`
--
ALTER TABLE `hd_penerimaan_detail`
  MODIFY `id_penerimaan_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hd_rak`
--
ALTER TABLE `hd_rak`
  MODIFY `id_rak` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_vendor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `hd_barang`
--
ALTER TABLE `hd_barang`
  ADD CONSTRAINT `hd_barang_ibfk_1` FOREIGN KEY (`id_satuan`) REFERENCES `hd_barang_satuan` (`id_satuan`),
  ADD CONSTRAINT `hd_barang_ibfk_2` FOREIGN KEY (`id_golongan_barang`) REFERENCES `hd_barang_golongan` (`id_golongan_barang`),
  ADD CONSTRAINT `hd_barang_ibfk_3` FOREIGN KEY (`id_jenis_barang`) REFERENCES `hd_barang_jenis` (`id_jenis_barang`);

--
-- Ketidakleluasaan untuk tabel `hd_barang_foto`
--
ALTER TABLE `hd_barang_foto`
  ADD CONSTRAINT `hd_barang_foto_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `hd_barang` (`id_barang`);

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
-- Ketidakleluasaan untuk tabel `hd_pemesanan_detail`
--
ALTER TABLE `hd_pemesanan_detail`
  ADD CONSTRAINT `hd_pemesanan_detail_ibfk_1` FOREIGN KEY (`id_pemesanan_detail`) REFERENCES `hd_pemesanan` (`id_pemesanan`),
  ADD CONSTRAINT `hd_pemesanan_detail_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `hd_barang` (`id_barang`);

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
-- Ketidakleluasaan untuk tabel `hd_rak`
--
ALTER TABLE `hd_rak`
  ADD CONSTRAINT `hd_rak_ibfk_1` FOREIGN KEY (`id_gudang`) REFERENCES `hd_gudang` (`id_gudang`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
