-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 07:58 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `billingservicedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `billingservice`
--

CREATE TABLE `billingservice` (
  `BillID` int(11) NOT NULL,
  `NoOfUnits` varchar(11) NOT NULL,
  `NoOfExceededUnits` varchar(11) NOT NULL,
  `ConnectionStatus` varchar(20) NOT NULL,
  `CustomerID` varchar(10) NOT NULL,
  `UnitPrice` varchar(11) NOT NULL,
  `Month` varchar(20) NOT NULL,
  `Year` varchar(11) NOT NULL,
  `InputDate` varchar(11) NOT NULL,
  `District` varchar(20) NOT NULL,
  `TotalBill` varchar(11) NOT NULL,
  `PaymentStatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billingservice`
--
ALTER TABLE `billingservice`
  ADD PRIMARY KEY (`BillID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billingservice`
--
ALTER TABLE `billingservice`
  MODIFY `BillID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
