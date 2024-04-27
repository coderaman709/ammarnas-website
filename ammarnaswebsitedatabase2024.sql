-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2024 at 03:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ammarnaswebsitedatabase2024`
--

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`image`) VALUES
('<FileStorage: \'Dating Website.jpg\' (\'image/jpeg\')>'),
('<FileStorage: \'Dating Website.jpg\' (\'image/jpeg\')>'),
('<FileStorage: \'PROFESSIONAL.jpg\' (\'image/jpeg\')>'),
('<FileStorage: \'pa nsd.jpg\' (\'image/jpeg\')>'),
('<FileStorage: \'baby-groot-5k-hd-4k-wallpaper-preview.jpg\' (\'image/jpeg\')>'),
('<FileStorage: \'\' (\'application/octet-stream\')>'),
('<FileStorage: \'\' (\'application/octet-stream\')>'),
('<FileStorage: \'avtr-1.jpg\' (\'image/jpeg\')>'),
('<FileStorage: \'avtr-2.jpg\' (\'image/jpeg\')>'),
('<FileStorage: \'avtr-3.jpg\' (\'image/jpeg\')>'),
('<FileStorage: \'spiderman-hd-4k-superheroes-wallpaper-preview.jpg\' (\'image/jpeg\')>'),
('<FileStorage: \'avtr-4.jpg\' (\'image/jpeg\')>'),
('<FileStorage: \'spiderman-selfie-with-piece-sign-g7jl0sho47aa9fyb.jpg\' (\'image/jpeg\')>'),
('<FileStorage: \'baby-groot-5k-hd-4k-wallpaper-preview.jpg\' (\'image/jpeg\')>'),
('<FileStorage: \'user.jpg\' (\'image/jpeg\')>'),
('<FileStorage: \'Screenshot-31.png\' (\'image/png\')>');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `name` varchar(60) NOT NULL,
  `born` text NOT NULL,
  `dead` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`name`, `born`, `dead`, `image`) VALUES
('Aman', 'yeto', 'wet', 'avtr-2.jpg'),
('Chintu', '2/3/23', 'Alive', 'user.jpg'),
('Kiyara', '2024-04-04', '3346-02-23', 'avtr-4.jpg'),
('name', 'yeto', 'wet', 'avtr-3.jpg'),
('Yogilal', 'yeto', 'wet', 'avtr-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `searched`
--

CREATE TABLE `searched` (
  `username` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `village`
--

CREATE TABLE `village` (
  `title` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `village`
--

INSERT INTO `village` (`title`, `image`) VALUES
('I\'m in the zoo', 'spiderman-hd-4k-superheroes-wallpaper-preview.jpg'),
('There was a spiderman caught in the village', 'spiderman-selfie-with-piece-sign-g7jl0sho47aa9fyb.jpg'),
('Four men sitting in a dinning room covnverted into a baby grook!', 'baby-groot-5k-hd-4k-wallpaper-preview.jpg'),
('A group of Humans Walking in the morning', 'Screenshot-31.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `image` (`image`) USING HASH;

--
-- Indexes for table `village`
--
ALTER TABLE `village`
  ADD UNIQUE KEY `image` (`image`) USING HASH;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
