-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03 Jun 2018 pada 08.42
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anjing`
--
CREATE DATABASE IF NOT EXISTS `anjing` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `anjing`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1508901104),
('m171024_135904_create_users', 1508901112),
('m171025_023745_create_pets_table', 1508901112);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pets`
--

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pets`
--

INSERT INTO `pets` (`id`, `name`) VALUES
(1, 'asu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `authKey` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `accessToken` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `authKey`, `password`, `email`, `accessToken`) VALUES
(1, 'kontlo', '', '829b36babd21be519fa5f9353daf5dbdb796993e', 'kontlo@gmail.com', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;--
-- Database: `bukutamu`
--
CREATE DATABASE IF NOT EXISTS `bukutamu` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bukutamu`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `nama` text NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `notelp` int(12) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;--
-- Database: `db_tandur`
--
CREATE DATABASE IF NOT EXISTS `db_tandur` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_tandur`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ency_tandur`
--

CREATE TABLE `ency_tandur` (
  `ency_id` int(10) NOT NULL,
  `ency_nama` varchar(30) NOT NULL,
  `ency_latin` varchar(30) NOT NULL,
  `ency_info` varchar(20000) NOT NULL,
  `ency_image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ency_tandur`
--

INSERT INTO `ency_tandur` (`ency_id`, `ency_nama`, `ency_latin`, `ency_info`, `ency_image`) VALUES
(1, 'Anggrek Bulan', 'Phalaenopsis amabilis', 'Anggrek Bulan (Phalaenopsis amabilis) atau puspa pesona adalah salah satu bunga nasional Indonesia. Pertama kali ditemukan oleh seorang ahli botani Belanda, Dr. C.L. Blume.\r\nTanaman anggrek ini tersebar luas mulai dari Malaysia, Indonesia, Filipina, Papua, hingga ke Australia. Cara hidupnya secara epifit dengan menempel pada batang atau cabang pohon di hutan-hutan dan tumbuh subur hingga 600 meter di atas permukaan laut.\r\nAnggrek bulan termasuk dalam tanaman anggrek monopodial yang menyukai sedikit cahaya matahari sebagai penunjang hidupnya. Daunnya berwarna hijau dengan bentuk memanjang. Akar-akarnya berwarna putih dan berbentuk bulat memanjang serta terasa berdaging. Bunganya memiliki sedikit keharuman dan waktu mekar yang lama serta dapat tumbuh hingga diameter 10 cm lebih.', 'image_ency/anggrekbulan.jpg'),
(2, 'Anggrek Hitam', 'Coelogyne pandurata', 'Anggrek hitam (Coelogyne pandurata) adalah spesies anggrek yang tumbuh di Semenanjung Malaya, Kalimantan, dan Sumatera. Anggrek hitam adalah maskot flora provinsi Kalimantan Timur. Saat ini, habitat asli anggrek hitam mengalami penurunan jumlah yang cukup besar karena semakin menyusutnya luas hutan di Kalimantan namun masih bisa ditemukan di cagar alam Kersik Luway dalam jumlah yang sedikit. Diperkirakan jumlah yang lebih banyak berada di tangan para kolektor anggrek.\r\nDinamakan anggrek hitam karena anggrek ini memiliki lidah (labellum)berwarna hitam dengan sedikit garis-garis berwarna hijau dan berbulu. Sepal dan petal berwarna hijau muda. Bunganya cukup harum semerbak dan biasa mekar pada bulan Maret hingga Juni.\r\nAnggrek hitam termasuk dalam anggrek golongan simpodial dengan bentuk bulb membengkak pada bagian bawah dan daun terjulur di atasnya. Setiap bulb hanya memiliki dua lembar daun saja. Daunnya sendiri sekilas mirip seperti daun pada tunas kelapa muda.', 'image_ency/anggrekhitam.jpg'),
(3, 'Anggrek Tebu', 'Grammatophyllum speciosum', '', 'image_ency/anggrektebu.jpg'),
(4, 'Bunga Bangkai', 'Amorphpophallus titanium', '', 'image_ency/bungabangkai.jpg'),
(5, 'Cempaka Putih', 'Michelia alba', '', 'image_ency/cempakaputih.jpg'),
(6, 'Cempaka Kuning', 'Michelia champaka', '', 'image_ency/cempakakuning.jpg'),
(7, 'Cempaka Telor', 'Magnolia coco', '', 'image_ency/cempakatelor.jpg'),
(8, 'Edelweis Jawa', 'Anaphalis javanica', '', 'image_ency/edelweisjawa.jpg'),
(9, 'Kenanga', 'Cananga odorata', '', 'image_ency/kenanga.jpg'),
(10, 'Melati Gambir', 'Jasminum pubescens', '', 'image_ency/melatigambir.jpg'),
(11, 'Melati Putih', 'Jasminus sambac', '', 'image_ency/melatiputih.jpg'),
(12, 'Nibung', 'Oncosperma tigillarium', '', 'image_ency/nibung.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shop_tandur`
--

CREATE TABLE `shop_tandur` (
  `shop_id` int(11) NOT NULL,
  `shop_nama` varchar(40) NOT NULL,
  `shop_alamat` varchar(120) NOT NULL,
  `shop_info` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `shop_tandur`
--

INSERT INTO `shop_tandur` (`shop_id`, `shop_nama`, `shop_alamat`, `shop_info`) VALUES
(1, 'Garage Sale Kemang', 'Jl.Niaga Raya Blok Q No.11 ,Kemang Pratama,Bekasi (17116), Bekasi, Bekasi, Indonesia', ''),
(2, 'CV. Sakura Teknik', 'Jalan Raya Patung Bogor, Bogor, Indonesia', ''),
(3, 'Toko Pesona Bonsai', 'Jl. Taman Safari Indonesia, Desa Cibeureum, Bogor, Bogor, Indonesia', 'Bonsai'),
(4, 'Azzahra Flora', 'Jln Kebandungan 1 No 54 RT 04/05, Kel. Sirnagalih. Kec. Taman Sari KABUPATEN BOGOR/ JAWA BARAT, Bogor, Bogor, Indonesia', 'Bibit Pala, Palem Bismarkia, Bibit Tanaman, Benih Tanaman, Pohon Palem Washingtonia, Pohon Mahoni'),
(5, 'CV. Dipokusumo', 'Rasamala A4 Semarang Kota 50189 Jawa Tengah, Semarang, Jawa Tengah, Indonesia', 'Bibit Tanaman, Bibit Buah'),
(6, 'Toko Ijo Daun', 'Pusat Tanaman Hias Jababeka Kav.9 Simprug Garden, Cikarang Baru, Bekasi, Bekasi, Indonesia', 'Aneka Tanaman Hias, Pucuk Merah, Anthurium, Tanaman Buah, Rumput, Gajah Min'),
(7, 'Toko 2 M Nursery', 'JL Zaenal Zakse No 10, Sukabumi, Jawa Barat, Indonesia', 'Anggrek Vanda, Anggrek Rhyncostylus, Dendrobium, Cattelya'),
(8, 'Sentosa Florist & Nursery', 'Jl. Proklamator no 401 Yukum Jaya, Bandar Jaya, lampung Tengah, Lampung Tengah, Lampung, Indonesia', 'Aster, Mawar, Krisan, Anggrek, Aglaonema, Anthurium, Dll');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ency_tandur`
--
ALTER TABLE `ency_tandur`
  ADD PRIMARY KEY (`ency_id`);

--
-- Indexes for table `shop_tandur`
--
ALTER TABLE `shop_tandur`
  ADD PRIMARY KEY (`shop_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ency_tandur`
--
ALTER TABLE `ency_tandur`
  MODIFY `ency_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `shop_tandur`
--
ALTER TABLE `shop_tandur`
  MODIFY `shop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;--
-- Database: `nikah`
--
CREATE DATABASE IF NOT EXISTS `nikah` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `nikah`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ket_asal`
--

CREATE TABLE `ket_asal` (
  `id` int(11) NOT NULL,
  `nama` char(100) NOT NULL,
  `ttl` varchar(100) NOT NULL,
  `warga` char(100) NOT NULL,
  `agama` char(100) NOT NULL,
  `pekerjaan` char(100) NOT NULL,
  `tmpt_tinggal` varchar(100) NOT NULL,
  `nama_ayah` char(100) NOT NULL,
  `ttl_ayah` varchar(100) NOT NULL,
  `warga_ayah` char(100) NOT NULL,
  `kerja_ayah` char(100) NOT NULL,
  `tmpt_tinggal_ayah` char(100) NOT NULL,
  `nama_ibu` char(100) NOT NULL,
  `ttl_ibu` varchar(100) NOT NULL,
  `warga_ibu` char(100) NOT NULL,
  `agama_ibu` char(100) NOT NULL,
  `kerja_ibu` char(100) NOT NULL,
  `tmpt_tinggal_ibu` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ket_nikah`
--

CREATE TABLE `ket_nikah` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `ttl` varchar(100) NOT NULL,
  `warga` char(100) NOT NULL,
  `agama` char(100) NOT NULL,
  `pekerjaan` char(100) NOT NULL,
  `tmpt_tinggal` varchar(100) NOT NULL,
  `bin_binti` char(100) NOT NULL,
  `status_pria` char(100) NOT NULL,
  `status_wanita` char(100) NOT NULL,
  `nama_dahulu` char(100) NOT NULL,
  `kelurahan` char(100) NOT NULL,
  `kecamatan` char(100) NOT NULL,
  `kabupaten` char(100) NOT NULL,
  `kota` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `setuju_mempelai`
--

CREATE TABLE `setuju_mempelai` (
  `id` int(11) NOT NULL,
  `nama_suami` char(100) NOT NULL,
  `bin` char(100) NOT NULL,
  `ttl_suami` varchar(100) NOT NULL,
  `warga_suami` char(100) NOT NULL,
  `agama_suami` char(100) NOT NULL,
  `kerja_suami` char(100) NOT NULL,
  `tmpt_tinggal_suami` char(100) NOT NULL,
  `nama_istri` char(100) NOT NULL,
  `binti` char(100) NOT NULL,
  `ttl_istri` varchar(100) NOT NULL,
  `warga_istri` char(100) NOT NULL,
  `agama_istri` char(100) NOT NULL,
  `kerja_istri` char(100) NOT NULL,
  `tmpt_tinggal_istri` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ket_asal`
--
ALTER TABLE `ket_asal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ket_nikah`
--
ALTER TABLE `ket_nikah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setuju_mempelai`
--
ALTER TABLE `setuju_mempelai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ket_asal`
--
ALTER TABLE `ket_asal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ket_nikah`
--
ALTER TABLE `ket_nikah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `setuju_mempelai`
--
ALTER TABLE `setuju_mempelai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data untuk tabel `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"db_mahasiswa\",\"table\":\"tbl_user\"},{\"db\":\"db_tandur\",\"table\":\"ency_tandur\"},{\"db\":\"db_tandur\",\"table\":\"shop_tandur\"},{\"db\":\"bukutamu\",\"table\":\"test\"},{\"db\":\"nikah\",\"table\":\"ket_nikah\"},{\"db\":\"nikah\",\"table\":\"setuju_mempelai\"},{\"db\":\"nikah\",\"table\":\"ket_asal\"},{\"db\":\"yii2advanced\",\"table\":\"useraccount\"},{\"db\":\"anjing\",\"table\":\"users\"},{\"db\":\"yii2advanced\",\"table\":\"user\"}]');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data untuk tabel `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-10-04 06:04:38', '{\"lang\":\"id\",\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `yii2advanced`
--
CREATE DATABASE IF NOT EXISTS `yii2advanced` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `yii2advanced`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `encyclopedia`
--

CREATE TABLE `encyclopedia` (
  `id_pedia` int(11) NOT NULL,
  `name_pedia` varchar(250) NOT NULL,
  `category` varchar(250) NOT NULL,
  `article` text NOT NULL,
  `ph_pedia` double NOT NULL,
  `temp_pedia` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `encyclopedia`
--

INSERT INTO `encyclopedia` (`id_pedia`, `name_pedia`, `category`, `article`, `ph_pedia`, `temp_pedia`) VALUES
(2, 'Tanaman Jambu', 'Jambu Biji', 'bvjdsbvjsdbvjsdbvdjsvbdjsvbsd vjd vjds v dvj djv sdjnvj3jr 32j 3jr 3j2rb3j r3j r32j r', 7.5, 30.2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nip` int(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `angkatan` varchar(4) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nip`, `nama`, `jurusan`, `angkatan`, `alamat`) VALUES
(2103161016, 'Aldi Maulana Ardianto', 'Teknik Informatika', '2016', 'Surabaya'),
(2103161017, 'Mukhammad Fatkhun Najaa', 'Teknik Informatika', '2016', 'Jombang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1506834103),
('m130524_201442_init', 1506834110);

-- --------------------------------------------------------

--
-- Struktur dari tabel `plant`
--

CREATE TABLE `plant` (
  `id_plant` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `type` varchar(250) NOT NULL,
  `ph` double NOT NULL,
  `temp` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `plant`
--

INSERT INTO `plant` (`id_plant`, `name`, `type`, `ph`, `temp`) VALUES
(2, 'Bunga', 'Cengkih', 7.5, 30.5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sensor`
--

CREATE TABLE `sensor` (
  `id_sensor` int(11) NOT NULL,
  `ph_sensor` double NOT NULL,
  `temp_sensor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sensor`
--

INSERT INTO `sensor` (`id_sensor`, `ph_sensor`, `temp_sensor`) VALUES
(321314, 13.7, 35);

-- --------------------------------------------------------

--
-- Struktur dari tabel `testing`
--

CREATE TABLE `testing` (
  `id` int(9) NOT NULL,
  `user` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `testing`
--

INSERT INTO `testing` (`id`, `user`, `password`, `email`) VALUES
(3, 'adam', '1234', '1234@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'fatkhun', 'h1dfHKLJ99KIw83xHY2l45vx2iFRvecQ', '$2y$13$XXXFfMNgcftwyfmJpJWu6ueWE7/uBO8jBHi7JVK14a6Sh3xjJ8wQC', NULL, 'mfatkhun28@gmail.com', 10, 1506834165, 1506834165);

-- --------------------------------------------------------

--
-- Struktur dari tabel `useraccount`
--

CREATE TABLE `useraccount` (
  `id_user` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `full_name` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `ttl` date NOT NULL,
  `hp` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `useraccount`
--

INSERT INTO `useraccount` (`id_user`, `username`, `full_name`, `password`, `email`, `ttl`, `hp`) VALUES
(1, 'fatkhun', 'Mukhammad Fatkhun Najaa', 'qwerty1@', 'mfatkhun28@gmail.com', '1997-02-06', '085732326736');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `encyclopedia`
--
ALTER TABLE `encyclopedia`
  ADD PRIMARY KEY (`id_pedia`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `plant`
--
ALTER TABLE `plant`
  ADD PRIMARY KEY (`id_plant`);

--
-- Indexes for table `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`id_sensor`);

--
-- Indexes for table `testing`
--
ALTER TABLE `testing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `useraccount`
--
ALTER TABLE `useraccount`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `encyclopedia`
--
ALTER TABLE `encyclopedia`
  MODIFY `id_pedia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `plant`
--
ALTER TABLE `plant`
  MODIFY `id_plant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `testing`
--
ALTER TABLE `testing`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `useraccount`
--
ALTER TABLE `useraccount`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
