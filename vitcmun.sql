-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2020 at 09:45 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vitcmun`
--

-- --------------------------------------------------------

--
-- Table structure for table `at`
--

CREATE TABLE `at` (
  `sno` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `username` varchar(30) COLLATE latin1_bin NOT NULL,
  `password` varchar(30) COLLATE latin1_bin NOT NULL,
  `country` varchar(30) COLLATE latin1_bin NOT NULL,
  `extra2` varchar(5) COLLATE latin1_bin NOT NULL,
  `at` int(1) NOT NULL,
  `pv1` int(1) NOT NULL,
  `pv2` int(1) NOT NULL,
  `sv` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`username`, `password`, `country`, `extra2`, `at`, `pv1`, `pv2`, `sv`) VALUES
('AdmiralGiampaoloDiPaola', '3304C4', '', 'user', 1, 0, 0, 0),
('AlanBKruger', '65REF5', '', 'user', 1, 0, 0, 0),
('AmartyaSen', 'YH216G', '', 'user', 1, 0, 0, 0),
('AmitShah ', '7EEB6C', '', 'user', 1, 0, 0, 0),
('AngelaMerkel', '6YHTSG', '', 'user', 1, 0, 0, 0),
('AshCarter', '1A16FF', '', 'user', 1, 0, 0, 0),
('BarackObama ', '712FB4', '', 'user', 1, 0, 0, 0),
('BenjaminNetanyahu', '508A3D', '', 'user', 1, 0, 0, 0),
('ChristineLagarde', 'YHBA87', '', 'user', 1, 0, 0, 0),
('DambisaMoyo', '3C8898', '', 'user', 1, 0, 0, 0),
('Director', 'E60F3F', '', 'eb', 1, 0, 0, 0),
('EB_ChairPerson', '57045A', '', 'eb', 1, 0, 0, 0),
('EGeraldCorrigan', '32C71F', '', 'user', 1, 0, 0, 0),
('ElonMusk', '19759D', '', 'user', 1, 0, 0, 0),
('EmmanuelMacron', '9A0018', '', 'user', 1, 0, 0, 0),
('EricSchmidt', '6446D3', '', 'user', 1, 0, 0, 0),
('HaiderAlAbadi', '5E7B34', '', 'user', 1, 0, 0, 0),
('HassanRouhani ', '8EA0F7', '', 'user', 1, 0, 0, 0),
('HeizoTakenaka', '8B8C7F', '', 'user', 1, 0, 0, 0),
('HenriDeCastries', 'E827E9', '', 'user', 1, 0, 0, 0),
('HenryKissinger', '1E89AF', '', 'user', 1, 0, 0, 0),
('HongSeokHyun', '66A942', '', 'user', 1, 0, 0, 0),
('InternationPress1', 'ADB097', '', 'user', 1, 0, 0, 0),
('InternationPress2', '7EA406', '', 'user', 1, 0, 0, 0),
('InternationPress3', 'EA7CE8', '', 'user', 1, 0, 0, 0),
('IvankaTrump', '8CB31C', '', 'user', 1, 0, 0, 0),
('JeanClaudeTrichet', 'AAED72', '', 'user', 1, 0, 0, 0),
('JeanLouis', 'CBCCF7', '', 'user', 1, 0, 0, 0),
('JeffWeiner', '4FDF26', '', 'user', 1, 0, 0, 0),
('JensStoltenberg', 'DCDDD9', '', 'user', 1, 0, 0, 0),
('JinLiqun', 'E05302', '', 'user', 1, 0, 0, 0),
('JohnJHamre', '3711DA', '', 'user', 1, 0, 0, 0),
('JosephSNyeJr', 'CB06C7', '', 'user', 1, 0, 0, 0),
('JurgenFitschen', 'D1708F', '', 'user', 1, 0, 0, 0),
('JustinTrudeau', '0E2E89', '', 'user', 1, 0, 0, 0),
('KVKamath', '2CCA9B', '', 'user', 1, 0, 0, 0),
('KalethOWright', '0F35A6', '', 'user', 1, 0, 0, 0),
('Klaas Knot', 'FAF7C6', '', 'user', 1, 0, 0, 0),
('KristalinaGeorgieva', 'D2FFBD', '', 'user', 1, 0, 0, 0),
('LawrenceHSummers', 'BD2B6F', '', 'user', 1, 0, 0, 0),
('MalalaYousafzai', 'D2F001', '', 'user', 1, 0, 0, 0),
('MarekBelka', '8051A3', '', 'user', 1, 0, 0, 0),
('MasayoshiSon', 'F0F176', '', 'user', 1, 0, 0, 0),
('MatthiasM?ller', '3D9FDC', '', 'user', 1, 0, 0, 0),
('MeganLeslie', '1DFB3B', '', 'user', 1, 0, 0, 0),
('MichaelSchaefer', 'FF8E35', '', 'user', 1, 0, 0, 0),
('MinoruMakihara', '7E88B3', '', 'user', 1, 0, 0, 0),
('NKSingh', '43ADBD', '', 'user', 1, 0, 0, 0),
('PeterSutherland', '413BBD', '', 'user', 1, 0, 0, 0),
('RaghuramRajan', '6FD6A3', '', 'user', 1, 0, 0, 0),
('RajivShah', '27056C', '', 'user', 1, 0, 0, 0),
('RatanTata', '6F718E', '', 'user', 1, 0, 0, 0),
('RecepTayyipErdogan', 'FB4529', '', 'user', 1, 0, 0, 0),
('RichardNHaass', '7FC42A', '', 'user', 1, 0, 0, 0),
('RupertMurdoch', 'U8IODV', '', 'user', 1, 0, 0, 0),
('SarahJaneBrown', '3D4783', '', 'user', 1, 0, 0, 0),
('SergeyLavrov', 'BE0E7E', '', 'user', 1, 0, 0, 0),
('ShahidKhaqanAbbasi', '012B3B', '', 'user', 1, 0, 0, 0),
('ShinzoAbe', 'ACFDB6', '', 'user', 1, 0, 0, 0),
('SundarPichai', '7C3A3D', '', 'user', 1, 0, 0, 0),
('TECH1', 'pwd1', '', 'eb', 1, 0, 0, 0),
('TECH2', 'pwd2', '', 'user', 0, 0, 0, 0),
('TECH3', 'B29984', '', 'eb', 1, 0, 0, 0),
('TECH4', '1A9BD6', '', 'user', 1, 0, 0, 0),
('TECH5', '4CD48D', '', 'user', 1, 0, 0, 0),
('TheresaMay ', 'ED2C46', '', 'user', 1, 0, 0, 0),
('ThomasRPickering', '45DA35', '', 'user', 1, 0, 0, 0),
('ViceChairPerson', '1311D1', '', 'eb', 1, 0, 0, 0),
('VolkerPerthes', 'A55E4E', '', 'user', 1, 0, 0, 0),
('WUHailong', '68F76F', '', 'user', 1, 0, 0, 0),
('WangYi', 'UIQ65V', '', 'user', 1, 0, 0, 0),
('YasuchikaHasegawa', '266F7A', '', 'user', 1, 0, 0, 0),
('YukiyaAmano', '4483C7', '', 'user', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pv1`
--

CREATE TABLE `pv1` (
  `sno` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pv2`
--

CREATE TABLE `pv2` (
  `sno` int(11) NOT NULL,
  `username` int(30) NOT NULL,
  `vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sv`
--

CREATE TABLE `sv` (
  `sno` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `at`
--
ALTER TABLE `at`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pv1`
--
ALTER TABLE `pv1`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pv2`
--
ALTER TABLE `pv2`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `sv`
--
ALTER TABLE `sv`
  ADD PRIMARY KEY (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
