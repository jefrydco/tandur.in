-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Jul 09, 2018 at 08:51 AM
-- Server version: 10.2.14-MariaDB-10.2.14+maria~jessie
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tandur`
--

-- --------------------------------------------------------

--
-- Table structure for table `ency_tandur`
--

CREATE TABLE `ency_tandur` (
  `ency_id` int(10) NOT NULL,
  `ency_nama` varchar(30) NOT NULL,
  `ency_latin` varchar(30) NOT NULL,
  `ency_info` varchar(20000) NOT NULL,
  `ency_image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ency_tandur`
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
-- Table structure for table `shop_tandur`
--

CREATE TABLE `shop_tandur` (
  `shop_id` int(11) NOT NULL,
  `shop_nama` varchar(40) NOT NULL,
  `shop_alamat` varchar(120) NOT NULL,
  `shop_lat` varchar(255) NOT NULL,
  `shop_lng` varchar(255) NOT NULL,
  `shop_info` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_tandur`
--

INSERT INTO `shop_tandur` (`shop_id`, `shop_nama`, `shop_alamat`, `shop_lat`, `shop_lng`, `shop_info`) VALUES
(1, 'Garage Sale Kemang', 'Jl.Niaga Raya Blok Q No.11 ,Kemang Pratama,Bekasi (17116), Bekasi, Bekasi, Indonesia', '-6.2709929', '106.9829401', 'Bunga Matahari'),
(2, 'CV. Sakura Teknik', 'Jalan Raya Patung Bogor, Bogor, Indonesia', '-6.4471503', '106.7610778', 'Bunga Matahari'),
(3, 'Toko Pesona Bonsai', 'Jl. Taman Safari Indonesia, Desa Cibeureum, Bogor, Bogor, Indonesia', '-6.7085824', '106.9436364', 'Bunga Matahari'),
(4, 'Azzahra Florist', 'Jl. Muchtar Raya, Sawangan Lama, Sawangan, Kota Depok, Jawa Barat 16517', '-6.4038377', '106.7541173', 'Bibit Pala, Palem Bismarkia, Bibit Tanaman, Benih Tanaman, Pohon Palem Washingtonia, Pohon Mahoni'),
(5, 'Rumah Kampoeng Flora', 'Jl. Raya Parung No.28, RT.2/RW.1, Curug, Bojongsari, Kota Depok, Jawa Barat 16516', '-6.4105971', '106.7332505', 'Bibit Tanaman, Bibit Buah'),
(6, 'Toko Ijo Daun', 'Pusat Tanaman Hias Jababeka Kav.9 Simprug Garden, Cikarang Baru, Bekasi, Bekasi, Indonesia', '-6.2281326', '106.6010251', 'Aneka Tanaman Hias, Pucuk Merah, Anthurium, Tanaman Buah, Rumput, Gajah Min'),
(7, 'Toko 2 M Nursery', 'JL Zaenal Zakse No 10, Sukabumi, Jawa Barat, Indonesia', '-6.2586544', '106.7072546', 'Anggrek Vanda, Anggrek Rhyncostylus, Dendrobium, Cattelya'),
(8, 'Sentosa Florist & Nursery', 'Jl. Proklamator no 401 Yukum Jaya, Bandar Jaya, lampung Tengah, Lampung Tengah, Lampung, Indonesia', '-4.9465377', '105.2127153', 'Aster, Mawar, Krisan, Anggrek, Aglaonema, Anthurium, Dll');

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
  MODIFY `shop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
