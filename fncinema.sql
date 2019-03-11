-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-06-28 17:14:04
-- 服务器版本： 5.5.57-log
-- PHP Version: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fncinema`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'fnadmin', '26324636');

-- --------------------------------------------------------

--
-- 表的结构 `dingdan`
--

CREATE TABLE IF NOT EXISTS `dingdan` (
  `id` int(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `user` varchar(20) NOT NULL,
  `day` varchar(10) NOT NULL,
  `is_use` varchar(10) NOT NULL,
  `order_date` varchar(20) NOT NULL,
  `order_price` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `dingdan`
--

INSERT INTO `dingdan` (`id`, `code`, `user`, `day`, `is_use`, `order_date`, `order_price`) VALUES
(1, 'SLNSLXUG', '26324636', '1', '是', '2018-06-22', '1.00'),
(2, '3HDYEEDJ', 'zjw', '1', '是', '2018-06-22', '1.00'),
(3, 'G2W8CI1B', '599366709', '3', '是', '2018-06-22', '2.00'),
(5, '2DNZZACG', 'he', '7', '是', '2018-06-25', '5.00');

-- --------------------------------------------------------

--
-- 表的结构 `fankui`
--

CREATE TABLE IF NOT EXISTS `fankui` (
  `id` int(10) NOT NULL,
  `user` varchar(20) NOT NULL,
  `feedback` varchar(200) NOT NULL,
  `feedback_date` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `fankui`
--

INSERT INTO `fankui` (`id`, `user`, `feedback`, `feedback_date`) VALUES
(1, '26324636', '感谢平台', '2018-06-22'),
(2, '26324636', '我爱你', '2018-06-22'),
(3, '26324636', '撒大声地', '2018-06-22'),
(4, '26324636', '我威锋网', '2018-06-22'),
(6, 'zjw', 'lalalala', '2018-06-22');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `qq` varchar(11) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `qianming` varchar(30) DEFAULT NULL,
  `zhuce_data` varchar(20) NOT NULL,
  `vip_data` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `qq`, `phone`, `qianming`, `zhuce_data`, `vip_data`) VALUES
(1, '26324636', '26324636', '', '', '', '2018-06-19', '2019-01-01'),
(2, 'fengniao', '26324636', '26324636', '17857058385', '有些路都有不得不这样走的理由', '2018-06-19', '2018-07-19'),
(3, '1486748924', '52263Qaz', '', '', '', '2018-06-19', '尚未开通VIP'),
(5, 'xy', '12345678', '', '', '', '2018-06-19', '尚未开通VIP'),
(6, 'zjw', '12345678', '26324636', '17857058385', '爱你一万年', '2018-06-22', '2018-06-23'),
(7, '599366709', '26324636', '599366709', '17857058338', '钟佳闱', '2018-06-22', '2018-06-25'),
(8, 'he', '26324636', '26324636', '17857058385', '我爱你', '2018-06-25', '2018-07-02');

-- --------------------------------------------------------

--
-- 表的结构 `vip`
--

CREATE TABLE IF NOT EXISTS `vip` (
  `id` int(11) NOT NULL,
  `jihuoma` varchar(8) NOT NULL,
  `is_use` int(1) NOT NULL,
  `is_buy` int(1) NOT NULL,
  `day` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `vip`
--

INSERT INTO `vip` (`id`, `jihuoma`, `is_use`, `is_buy`, `day`) VALUES
(1, 'SLNSLXUG', 1, 1, 1),
(2, '3HDYEEDJ', 1, 1, 1),
(3, 'G2W8CI1B', 1, 1, 3),
(4, 'YOF3ZEI7', 0, 0, 3),
(5, '2DNZZACG', 1, 1, 7),
(6, 'G0J5CX6W', 0, 0, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dingdan`
--
ALTER TABLE `dingdan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fankui`
--
ALTER TABLE `fankui`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vip`
--
ALTER TABLE `vip`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fankui`
--
ALTER TABLE `fankui`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `vip`
--
ALTER TABLE `vip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
