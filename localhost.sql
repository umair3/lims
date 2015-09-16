-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 24, 2010 at 07:05 PM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lims`
--
CREATE DATABASE `lims` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lims`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `book_acc` varchar(10) NOT NULL,
  `book_cutt` varchar(10) NOT NULL,
  `book_bno` varchar(10) NOT NULL,
  `book_title` varchar(50) NOT NULL,
  `book_edition` varchar(5) NOT NULL,
  `book_author` varchar(50) NOT NULL,
  `book_subject_id` varchar(3) NOT NULL,
  `book_date_of_publication` date NOT NULL,
  `book_publisher` varchar(50) NOT NULL,
  `book_language` varchar(50) NOT NULL,
  `book_cd_floppy` tinyint(1) NOT NULL,
  `book_price` int(11) NOT NULL,
  `book_add_date` date NOT NULL,
  `book_source` varchar(50) NOT NULL,
  PRIMARY KEY (`book_acc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='book table';

--
-- Dumping data for table `book`
--


-- --------------------------------------------------------

--
-- Table structure for table `book_history`
--

CREATE TABLE IF NOT EXISTS `book_history` (
  `book_history_acc` varchar(10) NOT NULL,
  `book_history_member_id` varchar(12) NOT NULL,
  `book_history_issue_date` date NOT NULL,
  `book_history_return_date` date NOT NULL,
  PRIMARY KEY (`book_history_acc`,`book_history_member_id`,`book_history_issue_date`),
  KEY `book_history_member_id` (`book_history_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='book history table';

--
-- Dumping data for table `book_history`
--


-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `department_id` varchar(2) NOT NULL,
  `department_name` varchar(30) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Departments Table';

--
-- Dumping data for table `departments`
--


-- --------------------------------------------------------

--
-- Table structure for table `fine`
--

CREATE TABLE IF NOT EXISTS `fine` (
  `fine_book_acc` varchar(10) NOT NULL,
  `fine_member_id` varchar(12) NOT NULL,
  `fine_due_date` date NOT NULL,
  `fine_return_date` date NOT NULL,
  `fine` int(11) NOT NULL,
  PRIMARY KEY (`fine_book_acc`,`fine_member_id`,`fine_return_date`),
  KEY `fine_member_id` (`fine_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fine`
--


-- --------------------------------------------------------

--
-- Table structure for table `issue_book`
--

CREATE TABLE IF NOT EXISTS `issue_book` (
  `issue_book_acc` varchar(10) NOT NULL,
  `issue_book_member_id` varchar(12) NOT NULL,
  `issue_book_issue_date` date NOT NULL,
  `issue_book_due_date` date NOT NULL,
  PRIMARY KEY (`issue_book_acc`,`issue_book_member_id`,`issue_book_issue_date`),
  KEY `issue_book_member_id` (`issue_book_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='issue book table';

--
-- Dumping data for table `issue_book`
--


-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(8) NOT NULL,
  `password` varchar(8) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('umair82', 'umair82');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `member_id` varchar(12) NOT NULL,
  `member_name` varchar(30) NOT NULL,
  `member_dob` date NOT NULL,
  `member_type_id` varchar(1) NOT NULL,
  `department_id` varchar(2) NOT NULL,
  `program_id` varchar(2) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `member_address` text,
  `member_city` varchar(30) DEFAULT NULL,
  `member_phone` varchar(30) NOT NULL,
  `member_email` text NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='members table';

--
-- Dumping data for table `members`
--


-- --------------------------------------------------------

--
-- Table structure for table `membership_type`
--

CREATE TABLE IF NOT EXISTS `membership_type` (
  `membership_type_id` varchar(1) NOT NULL,
  `membership_type_name` varchar(30) NOT NULL,
  `membership_type_description` varchar(50) NOT NULL,
  `membership_type_book_limit` varchar(1) NOT NULL,
  `membership_type_day_to_return` varchar(2) NOT NULL,
  `membership_type_fine_per_day` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Membership type table';

--
-- Dumping data for table `membership_type`
--


-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE IF NOT EXISTS `programs` (
  `program_id` varchar(2) NOT NULL,
  `program_name` varchar(30) NOT NULL,
  PRIMARY KEY (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Programs table';

--
-- Dumping data for table `programs`
--


-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `subject_id` varchar(3) NOT NULL,
  `subject_name` varchar(30) NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Subjects Table';

--
-- Dumping data for table `subjects`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_history`
--
ALTER TABLE `book_history`
  ADD CONSTRAINT `book_history_ibfk_2` FOREIGN KEY (`book_history_member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_history_ibfk_1` FOREIGN KEY (`book_history_acc`) REFERENCES `book` (`book_acc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fine`
--
ALTER TABLE `fine`
  ADD CONSTRAINT `fine_ibfk_2` FOREIGN KEY (`fine_member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fine_ibfk_1` FOREIGN KEY (`fine_book_acc`) REFERENCES `book` (`book_acc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `issue_book`
--
ALTER TABLE `issue_book`
  ADD CONSTRAINT `issue_book_ibfk_1` FOREIGN KEY (`issue_book_acc`) REFERENCES `book` (`book_acc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issue_book_ibfk_2` FOREIGN KEY (`issue_book_member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE;
