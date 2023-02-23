-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2023 at 06:21 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dental_express`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appID` int(11) NOT NULL,
  `appDate` varchar(225) NOT NULL,
  `appTime` varchar(225) NOT NULL,
  `staffID` int(11) NOT NULL,
  `serviceID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appID`, `appDate`, `appTime`, `staffID`, `serviceID`, `patientID`) VALUES
(3, '2023-02-03', '2', 3, 3, 7),
(4, '2023-02-22', '8', 5, 5, 7),
(5, '2023-02-27', '12', 5, 1, 8),
(6, '2023-02-03', '9', 5, 3, 8),
(7, '2023-02-16', '9', 3, 2, 8),
(8, '2023-02-28', '8', 5, 5, 7),
(9, '2023-02-22', '8', 5, 4, 7),
(12, '2023-05-24', '8', 3, 1, 11),
(25, '2023-02-09', '8', 3, 1, 12),
(28, '2023-02-09', '9', 3, 1, 12),
(29, '2023-02-09', '5', 5, 4, 12);

-- --------------------------------------------------------

--
-- Table structure for table `bookingtime`
--

CREATE TABLE `bookingtime` (
  `bookingTimeId` int(11) NOT NULL,
  `bookingTimeSlot` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookingtime`
--

INSERT INTO `bookingtime` (`bookingTimeId`, `bookingTimeSlot`) VALUES
(1, '8'),
(2, '9'),
(3, '10'),
(4, '11'),
(5, '12'),
(6, '1'),
(7, '2'),
(8, '3'),
(9, '4'),
(10, '5');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientID` int(11) NOT NULL,
  `patientName` varchar(135) NOT NULL,
  `patientAge` int(10) NOT NULL,
  `patientGender` varchar(10) NOT NULL,
  `patientPhone` varchar(15) NOT NULL,
  `patientMail` varchar(135) NOT NULL,
  `patientPass` varchar(135) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientID`, `patientName`, `patientAge`, `patientGender`, `patientPhone`, `patientMail`, `patientPass`) VALUES
(7, 'Jauhari Bin Johan', 52, 'Male', '0127952299', 'jauhar@mail.com', '123'),
(8, 'Hafiz Hashim Bin Khalid', 26, 'Male', '0114569856', 'hashim@mail.com', '123'),
(9, 'Muhammad Muhaimin Bin Mohd. Nizam', 40, 'Male', '0154206325', 'muha@mail.com', '123'),
(10, 'Muhd Sulaiman Bin Shamsul', 18, 'Male', '0158963214', 'sulaiman@mail.com', '123'),
(11, 'Nur Syahiran Sufyan Bin Ahmad', 28, 'Male', '0145632568', 'yan@mail.com', '123'),
(12, 'Muhammad Fikri Bin Hasnizam', 24, 'Male', '01140420880', 'mfikri@gmail.com', '#Mfikri');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `serviceID` int(11) NOT NULL,
  `serviceName` varchar(135) NOT NULL,
  `servicePrice` int(135) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`serviceID`, `serviceName`, `servicePrice`) VALUES
(1, 'Scaling', 95),
(2, 'Root Canal', 150),
(3, 'Consultation', 50),
(4, 'Filing', 90),
(5, 'Whitening', 320);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` int(11) NOT NULL,
  `staffName` varchar(135) NOT NULL,
  `staffAddress` varchar(135) NOT NULL,
  `staffPhone` varchar(15) NOT NULL,
  `staffMail` varchar(135) NOT NULL,
  `staffPass` varchar(135) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `staffName`, `staffAddress`, `staffPhone`, `staffMail`, `staffPass`) VALUES
(3, 'Muhammad Haziq Bin Maulizan', '16, Jalan Kayu', '0123654789', 'haziq@mail.com', '123'),
(5, 'Amato Bin Aba', 'kampung hilir', '0123658965', 'amato@mail.com', '159');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appID`),
  ADD KEY `patientID` (`patientID`),
  ADD KEY `staffID` (`staffID`),
  ADD KEY `serviceID` (`serviceID`);

--
-- Indexes for table `bookingtime`
--
ALTER TABLE `bookingtime`
  ADD PRIMARY KEY (`bookingTimeId`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientID`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`serviceID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `bookingtime`
--
ALTER TABLE `bookingtime`
  MODIFY `bookingTimeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `serviceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
