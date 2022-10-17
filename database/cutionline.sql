-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Okt 2022 pada 15.44
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cutionline`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cuti_pegawai`
--

CREATE TABLE `cuti_pegawai` (
  `id_cutipegawai` int(25) NOT NULL,
  `id_pegawai` int(25) DEFAULT NULL,
  `jenis_cuti` varchar(30) NOT NULL,
  `alasan_cuti` text NOT NULL,
  `lama_cuti` int(11) NOT NULL DEFAULT 0,
  `ket_lama_cuti` varchar(30) NOT NULL,
  `dari_tanggal` date NOT NULL,
  `sampai_dengan` date NOT NULL,
  `panmud_kasubag` varchar(100) DEFAULT NULL,
  `panitera_sekretaris` varchar(100) DEFAULT NULL,
  `ketua` varchar(100) DEFAULT NULL,
  `app_panmud_kasubag` int(25) NOT NULL,
  `app_panitera_sekretaris` int(25) NOT NULL,
  `app_ketua` int(25) NOT NULL,
  `status_cuti` varchar(30) NOT NULL,
  `ket_status_cuti` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cuti_pegawai`
--

INSERT INTO `cuti_pegawai` (`id_cutipegawai`, `id_pegawai`, `jenis_cuti`, `alasan_cuti`, `lama_cuti`, `ket_lama_cuti`, `dari_tanggal`, `sampai_dengan`, `panmud_kasubag`, `panitera_sekretaris`, `ketua`, `app_panmud_kasubag`, `app_panitera_sekretaris`, `app_ketua`, `status_cuti`, `ket_status_cuti`) VALUES
(1, 12, 'Cuti Sakit', 'test', 1, 'Hari', '2022-09-19', '2022-09-20', NULL, NULL, '196507021992031005', 1, 1, 1, 'Disetujui', 'Pengajuan Cuti Diterima'),
(2, 35, 'Cuti Sakit', 'Demam', 4, 'Hari', '2022-10-11', '2022-10-17', NULL, '197208161994031002', '196507021992031005', 1, 1, 0, 'Diajukan', 'Menunggu Approval Ketua'),
(3, 36, 'Cuti Sakit', 'Demam', 2, 'Hari', '2022-10-11', '2022-10-13', NULL, NULL, '196507021992031005', 1, 1, 1, 'Disetujui', 'Pengajuan Cuti Diterima'),
(4, 37, 'Cuti Sakit', 'Demam Berdarah', 5, 'Hari', '2022-10-11', '2022-10-16', NULL, NULL, '196507021992031005', 1, 1, 1, 'Disetujui', 'Pengajuan Cuti Diterima');

-- --------------------------------------------------------

--
-- Struktur dari tabel `golongan`
--

CREATE TABLE `golongan` (
  `id_golongan` int(25) NOT NULL,
  `nama_golongan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `golongan`
--

INSERT INTO `golongan` (`id_golongan`, `nama_golongan`) VALUES
(1, 'IV A'),
(2, 'IV B'),
(3, 'IV C'),
(4, 'IV D'),
(5, 'IV E'),
(6, 'III A'),
(7, 'III B'),
(8, 'III C'),
(9, 'III D'),
(10, 'II A');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(25) NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
(1, 'KETUA'),
(2, 'WAKIL KETUA'),
(3, 'HAKIM UTAMA MUDA'),
(4, 'HAKIM MADYA UTAMA'),
(5, 'PANITERA'),
(6, 'SEKRETARIS'),
(7, 'PANMUD HUKUM'),
(8, 'PANMUD GUGATAN'),
(9, 'PANMUD PERMOHONAN'),
(10, 'STAFF PELAKSANA PANMUD HUKUM'),
(11, 'STAFF PELAKSANA PANMUD GUGATAN'),
(12, 'STAFF PELAKSANA PANMUD PERMOHONAN'),
(13, 'PANITERA PENGGANTI'),
(14, 'JURU SITA'),
(15, 'JURU SITA PENGGANTI'),
(16, 'KASUBAG KEPEGAWAIAN DAN ORTALA'),
(17, 'KASUBAG PERNCANAAN, IT DAN PELAPORAN'),
(18, 'KASUBAG UMUM DAN KEUANGAN'),
(19, 'STAFF PELAKSANA KEPEGAWAIAN DAN ORTALA'),
(20, 'STAFF PELAKSANA PERNCANAAN, IT DAN PELAPORAN'),
(21, 'STAFF PELAKSANA UMUM DAN KEUANGAN'),
(22, 'Kasi Pemerintahan dan Pelayanan Masyarakat'),
(23, 'Kasi Ketentraman dan Ketertiban'),
(24, 'Kasi Kependudukan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(25) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `nip` varchar(18) DEFAULT NULL,
  `id_jabatan` int(25) DEFAULT NULL,
  `id_golongan` int(25) DEFAULT NULL,
  `unit_kerja` varchar(100) NOT NULL,
  `sisa_cuti` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama_pegawai`, `nip`, `id_jabatan`, `id_golongan`, `unit_kerja`, `sisa_cuti`) VALUES
(1, 'Dr. M. Fahmi, S.Kom.', '196507021992031005', 1, 3, 'KELURAHAN TELAGA ASIH', 2),
(4, 'Dra. Hj. ERAWATI, S.H., M.H.', '195704071992032001', 4, 3, 'KELURAHAN TELAGA ASIH', 0),
(5, 'Drs. H. SYARIFUDIN, M.H.', '197002061994031004', 4, 3, 'KELURAHAN TELAGA ASIH', 0),
(6, 'H. ABDILLAH, S.H., M.H.', '195708191984031002', 3, 4, 'KELURAHAN TELAGA ASIH', 0),
(10, 'Drs. H. A. SYUYUTI, M.Sy.', '196901031995031001', 4, 3, 'KELURAHAN TELAGA ASIH', 0),
(12, 'Drs. Zul S.kom', '196507021992031006', 2, 3, 'KELURAHAN TELAGA ASIH', 0),
(13, 'Drs. E. ARIFUDIN', '196311151993031004', 5, 1, 'KELURAHAN TELAGA ASIH', 0),
(14, 'ATO SUNARTO, S.Ag', '197208161994031002', 6, 1, 'KELURAHAN TELAGA ASIH', 0),
(15, 'ABDUL HAKIM, SH., SHI, M.H.', '196709172000121002', 7, 1, 'KELURAHAN TELAGA ASIH', 0),
(16, 'YUYU YULIANI, S.Ag.M.H.', '196211051983032004', 8, 1, 'KELURAHAN TELAGA ASIH', 0),
(17, 'ASNALI, S.Ag', '196303071992031005', 9, 9, 'KELURAHAN TELAGA ASIH', 0),
(18, 'Drs. Staff Panmud Hukum S.Kom', '196709172000121004', 10, 6, 'KELURAHAN TELAGA ASIH', 0),
(19, 'Drs. Staff Panmud Gugatan S.Kom', '196211051983032005', 11, 6, 'KELURAHAN TELAGA ASIH', 0),
(20, 'Drs. Staff Panmud Permohonan S.Kom', '196303071992031006', 12, 6, 'KELURAHAN TELAGA ASIH', 0),
(21, 'KHALIDA, S.Ag, M.H.', '197411022003122002', 13, 1, 'KELURAHAN TELAGA ASIH', 0),
(22, 'AHYA SYARIFUDDIN', '196011261981021003', 13, 8, 'KELURAHAN TELAGA ASIH', 0),
(23, 'AHMAD WASKITO, SEI', '197606082009041001', 13, 8, 'KELURAHAN TELAGA ASIH', 0),
(24, 'WAHYU, S.Sy', '197209212003121004', 13, 7, 'KELURAHAN TELAGA ASIH', 0),
(25, 'FADHLILLAH MUBARAK, S.Sy', '197908112006041002', 13, 7, 'KELURAHAN TELAGA ASIH', 0),
(26, 'ENY KURNIASIH, S.H.', '196511091989102001', 14, 9, 'KELURAHAN TELAGA ASIH', 0),
(27, 'SOLIKHIN, S.H.', '196512101992031001', 14, 7, 'KELURAHAN TELAGA ASIH', 0),
(28, 'ADE SOLAHUDIN, SHI', '197905172014051001', 14, 7, 'KELURAHAN TELAGA ASIH', 0),
(29, 'DWI YUNIANTI, S.H.', '198212132006042002', 16, 8, 'KELURAHAN TELAGA ASIH', 0),
(30, 'USMANIAH, S.H.', '197006181990032001', 17, 9, 'KELURAHAN TELAGA ASIH', 0),
(31, 'RATUSISKA ARIES TIANI, S.E.', '198304212011012013', 18, 8, 'KELURAHAN TELAGA ASIH', 0),
(32, 'RAHMA YUSTINI, S.I.A', '199612022019032004', 19, 6, 'KELURAHAN TELAGA ASIH', 0),
(33, 'INTAN MAHARANI, S.I.A', '199602122019032014', 21, 6, 'KELURAHAN TELAGA ASIH', 0),
(34, 'Drs. Staff Pelaksana Perencanaan IT', '199602122019032015', 20, 6, 'KELURAHAN TELAGA ASIH', 0),
(35, 'Cecep Mulyadi S.Kom', '123445534567245679', 17, 9, 'PENGADILAN AGAMA KARAWANG', 0),
(36, 'Adi S.M', '124525728123456712', 22, 3, 'PENGADILAN AGAMA KARAWANG', 0),
(37, 'Fayi Asahab', '121234521238465712', 24, 3, 'PENGADILAN AGAMA KARAWANG', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(25) NOT NULL,
  `nip` varchar(18) DEFAULT NULL,
  `password` varchar(225) NOT NULL,
  `role` text NOT NULL,
  `foto` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nip`, `password`, `role`, `foto`) VALUES
(1, '196507021992031005', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(4, '195704071992032001', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(5, '197002061994031004', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(6, '195708191984031002', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(10, '196901031995031001', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(12, '196311151993031004', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(13, '197208161994031002', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(14, '196709172000121002', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(15, '196303071992031005', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(16, '196211051983032005', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(17, '197411022003122002', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(18, '196011261981021003', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(19, '197606082009041001', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(20, '197209212003121004', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(21, '197908112006041002', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(22, '196511091989102001', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(23, '197905172014051001', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(24, '196512101992031001', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(25, '198212132006042002', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(26, '197006181990032001', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(27, '199612022019032004', '21232f297a57a5a743894a0e4a801fc3', 'Admin', NULL),
(28, '199602122019032014', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(29, '198304212011012013', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(30, '196507021992031006', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(31, '196211051983032004', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(32, '199602122019032015', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(33, '196709172000121004', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(34, '196303071992031006', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(35, '123445534567245679', '9bc65c2abec141778ffaa729489f3e87', 'User', NULL),
(36, '124525728123456712', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL),
(37, '121234521238465712', 'ee11cbb19052e40b07aac0ca060c23ee', 'User', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cuti_pegawai`
--
ALTER TABLE `cuti_pegawai`
  ADD PRIMARY KEY (`id_cutipegawai`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `golongan`
--
ALTER TABLE `golongan`
  ADD PRIMARY KEY (`id_golongan`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_jabatan` (`id_jabatan`),
  ADD KEY `id_golongan` (`id_golongan`),
  ADD KEY `nip` (`nip`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `nip` (`nip`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cuti_pegawai`
--
ALTER TABLE `cuti_pegawai`
  MODIFY `id_cutipegawai` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `golongan`
--
ALTER TABLE `golongan`
  MODIFY `id_golongan` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
