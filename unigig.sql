-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2015 at 05:43 PM
-- Server version: 5.6.26
-- PHP Version: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unigig`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_basic`
--

CREATE TABLE IF NOT EXISTS `student_basic` (
  `s_id` int(11) NOT NULL,
  `s_email` varchar(500) NOT NULL,
  `s_password` varchar(500) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_phone` varchar(20) NOT NULL,
  `s_address` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_basic`
--

INSERT INTO `student_basic` (`s_id`, `s_email`, `s_password`, `s_name`, `s_phone`, `s_address`) VALUES
(21, 'a@a.com', '123', 'Harum velit voluptas mollit magni', '+956-20-7888775', 'Laboris quia error temporibus do obcaecati qui'),
(23, 'vugo@yahoo.com', 'Pa$$w0rd!', 'Harum velit voluptas mollit magni', '+956-20-7888775', 'Laboris quia error temporibus do obcaecati qui'),
(24, 'hysumoro@gmail.com', 'Pa$$w0rd!', 'Sit maiores molestiae eu Nam sed neque nisi sit sed in iusto enim vel reiciendis', ' 656-79-8832273', 'Exercitation id id in id architecto ut ea dolorem laboris'),
(25, 'ziti@hotmail.com', 'Pa$$w0rd!', 'Recusandae Rerum nihil voluptate hic quis', ' 131-29-8102171', 'Adipisicing aliquip sed explicabo Odit tempor');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE IF NOT EXISTS `subscription` (
  `s_id` int(11) NOT NULL,
  `s_email` varchar(100) NOT NULL,
  `s_date` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`s_id`, `s_email`, `s_date`) VALUES
(1, 'a@a.com', '2015-11-13 21:41:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student_basic`
--
ALTER TABLE `student_basic`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`s_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student_basic`
--
ALTER TABLE `student_basic`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
