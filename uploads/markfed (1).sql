-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2018 at 07:48 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `markfed`
--

-- --------------------------------------------------------

--
-- Table structure for table `case_info`
--

CREATE TABLE `case_info` (
  `file_number` varchar(50) NOT NULL,
  `case_number` varchar(50) NOT NULL,
  `year` varchar(4) NOT NULL,
  `case_type` varchar(50) NOT NULL,
  `court_name` varchar(50) NOT NULL,
  `lawyer` varchar(50) NOT NULL,
  `location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `case_info`
--

-- INSERT INTO `case_info` (`file_number`, `case_number`, `year`, `case_type`, `court_name`, `lawyer`, `location`) VALUES
-- ('1', '1', '2017', 'NONE', 'NONE', 'NONE', 'NONE'),
-- ('2437', '26817', '2015', 'CWP', 'PUNJAB & HARYANA HIGH COURT', 'SUMIT JAIN', 'CHANDIGARH'),
-- ('2664', '7418', '2016', 'CWP', 'PUNJAB & HARYANA HIGH COURT', 'MEHARDEEP SINGH', 'CHANDIGARH'),
-- ('2937', '10837', '2018', 'CWP', 'PUNJAB & HARYANA HIGH COURT', 'NONE', 'CHANDIGARH'),
-- ('738', '5656', '2017', 'CWP', 'PUNJAB & HARYANA HIGH COURT', 'PARMINDER SINGH', 'CHANDIGARH'),
-- ('LDH-320', '4', '2017', 'REVISION PETITION', 'ARBITRATOR', 'SAURABH GOEL', 'LUDHIANA');

-- --------------------------------------------------------

--
-- Table structure for table `case_proceeding`
--

CREATE TABLE `case_proceeding` (
  `file_number` varchar(50) NOT NULL,
  `proceeding_number` int(100) DEFAULT '1',
  `proceeding_date` date NOT NULL,
  `decision` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `next_hearing_on` date DEFAULT NULL,
  `order_file` longblob,
  `order_file_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `case_proceeding`
--

-- INSERT INTO `case_proceeding` (`file_number`, `proceeding_number`, `proceeding_date`, `decision`, `description`, `next_hearing_on`, `order_file`, `order_file_type`) VALUES
-- ('1', 1, '2017-11-24', 'PENDING', '', '2017-11-24', NULL, NULL),
-- ('2437', 1, '2018-01-22', 'ADJOURNMENT', 'ADJOURNMENT. CASE IS FIXED FOR ARGUEMENTS', '2018-05-25', NULL, NULL),
-- ('2664', 1, '2016-09-05', 'ADJOURNMENT', '1ST DATE OF HEARING.', '2017-03-31', NULL, NULL),
-- ('LDH-320', 1, '2017-03-03', 'ADJOURNMENT', 'ADJOURNMENT', '2018-03-20', NULL, NULL),
-- INSERT INTO `case_proceeding` (`file_number`, `proceeding_number`, `proceeding_date`, `decision`, `description`, `next_hearing_on`, `order_file`, `order_file_type`) VALUES
-- INSERT INTO `case_proceeding` (`file_number`, `proceeding_number`, `proceeding_date`, `decision`, `description`, `next_hearing_on`, `order_file`, `order_file_type`) VALUES
-- ('738', 1, '2017-07-04', 'ADJOURNMENT', '', '2018-06-22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `case_type`
--

CREATE TABLE `case_type` (
  `casetype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `case_type`
--

INSERT INTO `case_type` (`casetype_name`) VALUES
('ACCIDENT CLAIM'),
('ARB'),
('ARB-DC'),
('CA'),
('CIVIL'),
('CM'),
('COCP'),
('CR'),
('CRA'),
('CRIMINAL'),
('CRM-M'),
('CRR'),
('CWP'),
('FAO'),
('GRATUITY'),
('GRATUITY APPEAL'),
('LPA'),
('NONE'),
('REVISION PETITION'),
('RSA');

-- --------------------------------------------------------

--
-- Table structure for table `case_update_log`
--

CREATE TABLE `case_update_log` (
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file_number` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `user_group` varchar(50) NOT NULL,
  `action` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `case_update_log`
--

-- INSERT INTO `case_update_log` (`time`, `file_number`, `username`, `user_group`, `action`) VALUES
-- ('2017-10-30 09:47:04', '1', '', 'Administrator', 'INSERT'),
-- ('2017-10-30 09:48:02', '1-appeal-1', '', 'Administrator', 'INSERT'),
-- ('2017-10-30 11:02:02', '2', 'akhil', 'Administrator', 'INSERT'),
-- ('2017-10-30 11:03:40', '2-appeal-1', 'akhil', 'Administrator', 'INSERT'),
-- ('2017-11-01 10:35:06', '111', '', 'Administrator', 'INSERT'),
-- ('2017-11-02 05:22:50', '22', '', 'Administrator', 'INSERT'),
-- ('2017-11-03 04:28:12', '23', '', 'Administrator', 'INSERT'),
-- ('2017-11-03 04:45:43', '23', '', 'Administrator', 'DELETE'),
-- ('2017-11-03 04:46:32', '23', '', 'Administrator', 'INSERT'),
-- ('2017-11-03 08:42:24', '254', '', 'Administrator', 'INSERT'),
-- ('2017-11-03 08:49:42', '1', '', 'Administrator', 'DELETE'),
-- ('2017-11-03 08:49:47', '2', '', 'Administrator', 'DELETE'),
-- ('2017-11-03 08:49:51', '23', '', 'Administrator', 'DELETE'),
-- ('2017-11-03 08:49:55', '254', '', 'Administrator', 'DELETE'),
-- ('2017-11-03 08:50:08', '1-appeal-1', '', 'Administrator', 'DELETE'),
-- ('2017-11-03 08:50:13', '2-appeal-1', '', 'Administrator', 'DELETE'),
-- ('2017-11-03 08:50:27', '111', '', 'Administrator', 'DELETE'),
-- ('2017-11-03 08:50:43', '22', '', 'Administrator', 'DELETE'),
-- ('2017-11-03 09:43:05', '1', '', 'Administrator', 'INSERT'),
-- ('2017-11-03 09:43:07', '1', 'SYSTEM', 'SYSTEM', 'DELETE'),
-- ('2017-11-03 09:44:28', '1', '', 'Administrator', 'INSERT'),
-- ('2017-11-03 09:44:30', '1', 'SYSTEM', 'SYSTEM', 'DELETE'),
-- ('2017-11-03 09:46:12', '1', '', 'Administrator', 'INSERT'),
-- ('2017-11-03 09:46:14', '1', 'SYSTEM', 'SYSTEM', 'DELETE'),
-- ('2017-11-03 09:46:38', '1', '', 'Administrator', 'INSERT'),
-- ('2017-11-03 09:46:39', '1', 'SYSTEM', 'SYSTEM', 'DELETE'),
-- ('2017-11-03 09:47:53', '1', '', 'Administrator', 'INSERT'),
-- ('2017-11-03 09:47:54', '1', 'SYSTEM', 'SYSTEM', 'DELETE'),
-- ('2017-11-03 09:48:22', '1', '', 'Administrator', 'INSERT'),
-- ('2017-11-03 09:48:23', '1', 'SYSTEM', 'SYSTEM', 'DELETE'),
-- ('2017-11-03 09:49:58', '1', '', 'Administrator', 'INSERT'),
-- ('2018-05-24 05:19:25', '2437', 'gurpreet', 'Operator', 'INSERT'),
-- ('2018-05-24 05:34:22', '2664', 'gurpreet', 'Operator', 'INSERT'),
-- ('2018-05-24 05:36:04', '2664', 'gurpreet', 'Operator', 'INSERT'),
-- ('2018-05-24 05:36:46', '2664', 'gurpreet', 'Operator', 'INSERT'),
-- ('2018-05-24 05:38:04', '2664', 'gurpreet', 'Operator', 'UPDATE'),
-- ('2018-05-24 05:59:53', 'LDH-320', 'taranjit', 'Operator', 'INSERT'),
-- ('2018-05-24 06:02:37', 'LDH-320', 'taranjit', 'Operator', 'UPDATE'),
-- ('2018-05-31 11:14:20', '2937', 'gurpreet', 'Operator', 'INSERT'),
-- ('2018-06-21 05:31:22', '738', 'markfed', 'Administrator', 'INSERT'),
-- ('2018-06-21 05:32:55', '738', 'markfed', 'Administrator', 'UPDATE');

-- --------------------------------------------------------

--
-- Table structure for table `court_type`
--

CREATE TABLE `court_type` (
  `court_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `court_type`
--

INSERT INTO `court_type` (`court_name`) VALUES
('ACCIDENT CLAIMS TRIBUNAL'),
('ADDITIONAL REGISTRAR COOP. '),
('ALC (CENTRAL) CHANDIGARH'),
('ALC (CENTRAL) JALANDHAR'),
('ALC AMRITSAR'),
('ALC BATHINDA'),
('ALC FEROZEPUR'),
('ALC MOGA'),
('ALC MOHALI'),
('ALC PATIALA'),
('ALC SANGRUR'),
('APPELLATE AUTHORITY UNDER THE PAYMENT OF GRATUITY '),
('ARBITRATOR'),
('ARCS'),
('COMPETITION COMMISSION OF INDIA'),
('CONTOLLING AUTHORITY UNDER THE PAYMENT OF GRATUITY'),
('CONTROLLING AUTHORITY UNDER THE PAYMENT OF GRATUIT'),
('DISTRICT COURT, AMRITSAR'),
('DISTRICT COURT, BARNALA'),
('DISTRICT COURT, BHATINDA'),
('DISTRICT COURT, CHANDIGARH'),
('DISTRICT COURT, FATEHGARH SAHIB'),
('DISTRICT COURT, FAZILKA'),
('DISTRICT COURT, FEROZPUR'),
('DISTRICT COURT, GURDASPUR '),
('DISTRICT COURT, HOSHIARPUR'),
('DISTRICT COURT, JALANDHAR'),
('DISTRICT COURT, KAPURTHALA'),
('DISTRICT COURT, LUDHIANA'),
('DISTRICT COURT, MANSA'),
('DISTRICT COURT, MOGA'),
('DISTRICT COURT, MOHALI'),
('DISTRICT COURT, NAWANSHAHR'),
('DISTRICT COURT, PATIALA'),
('DISTRICT COURT, ROPAR'),
('DISTRICT COURT, SAGRUR'),
('DISTRICT COURT, SANGRUR'),
('DISTRICT COURT, SRI MUKTSAR SAHIB'),
('DISTRICT COURT, TARN-TARAN'),
('FINANCIAL COMMISSIONER COOP.'),
('HON\'BLE CALCUTTA HIGH COURT'),
('JRCS'),
('NONE'),
('PUNJAB & HARYANA HIGH COURT'),
('RAILWAYS CLAIM TRIBUNAL'),
('REGIONAL PROVIDEND FUND COMMISSIONER'),
('REGISTRAR COOP. SOCIETIES'),
('SPECIAL SECRETARY COOP.'),
('SUPREME COURT');

-- --------------------------------------------------------

--
-- Table structure for table `date_info`
--

CREATE TABLE `date_info` (
  `file_number` varchar(50) NOT NULL,
  `case_filed_on` date DEFAULT NULL,
  `notice_received_on` date DEFAULT NULL,
  `first_hearing_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `date_info`
--

-- INSERT INTO `date_info` (`file_number`, `case_filed_on`, `notice_received_on`, `first_hearing_on`) VALUES
-- ('1', '2017-11-17', '2017-11-17', '2017-11-18'),
-- ('2437', '2015-11-20', '2015-11-20', '2015-12-22'),
-- ('2664', '2016-04-21', '2016-04-22', '2016-09-05'),
-- ('2937', '2018-04-30', '2018-05-02', '2018-05-02'),
-- ('738', '2017-06-01', '2017-06-22', '2017-07-04'),
-- ('LDH-320', '2017-01-19', '1947-08-15', '2017-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `decision_type`
--

CREATE TABLE `decision_type` (
  `decision` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `decision_type`
--

INSERT INTO `decision_type` (`decision`) VALUES
('ADJOURNMENT'),
('FINAL JUDGEMENT'),
('INTERIM ORDER'),
('PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `latest_proceeding`
--

CREATE TABLE `latest_proceeding` (
  `file_number` varchar(50) NOT NULL,
  `proceeding_number` int(10) NOT NULL,
  `proceeding_date` date NOT NULL,
  `decision` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `next_hearing_on` date DEFAULT NULL,
  `order_file` longblob,
  `order_file_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `latest_proceeding`
--

-- INSERT INTO `latest_proceeding` (`file_number`, `proceeding_number`, `proceeding_date`, `decision`, `description`, `next_hearing_on`, `order_file`, `order_file_type`) VALUES
-- ('1', 1, '2017-11-24', 'PENDING', '', '2017-11-24', NULL, NULL),
-- ('2437', 1, '2018-01-22', 'ADJOURNMENT', 'ADJOURNMENT. CASE IS FIXED FOR ARGUEMENTS', '2018-05-25', NULL, NULL),
-- ('2664', 1, '2016-09-05', 'ADJOURNMENT', '1ST DATE OF HEARING.', '2017-03-31', NULL, NULL);
-- INSERT INTO `latest_proceeding` (`file_number`, `proceeding_number`, `proceeding_date`, `decision`, `description`, `next_hearing_on`, `order_file`, `order_file_type`) VALUES
-- INSERT INTO `latest_proceeding` (`file_number`, `proceeding_number`, `proceeding_date`, `decision`, `description`, `next_hearing_on`, `order_file`, `order_file_type`) VALUES
-- ('738', 1, '2017-07-04', 'ADJOURNMENT', '', '2018-06-22', NULL, NULL),

-- --------------------------------------------------------

--
-- Table structure for table `lawyer`
--

CREATE TABLE `lawyer` (
  `lawyer_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lawyer`
--

INSERT INTO `lawyer` (`lawyer_name`, `email`) VALUES
('A P S MAAN', 'a'),
('A.S WALIA', 'sunnywalia@gmail.com'),
('AJAYPAL SINGH MADAAN', 'ajaysinghc526@gmail.com'),
('AKSHAY BHAN', 'akshaybhan2008@rediffmail.com'),
('AMANDEEP SINGH', 'advocateaman007@gmail.com'),
('AMANDEEP SINGH REHAL', 'adv.amanrehal@gmail.com'),
('AMRINDER SINGH SIDHU', 'amisidhu@gmail.com '),
('ANUJ AHLUWALIA', 'anujwalia@gmail.com'),
('APS MANN', 'adityamann@gmail.com '),
('ARORA VISHWAS KUMAR', 'adv.aroravk@gmail.com '),
('ARSHDEEP BHULLAR', 'bhullar_arsh@hotmail.com'),
('ASEEM RAI', 'aseemadvocate@gmail.com '),
('ASHWARYA BAJAJ', 'bajajlaw59@gmail.com'),
('ATHAR AHMED', 'atharahmed7070@hotmail.com '),
('D.P GUPTA', 'dpgupta.advchd@yahoo.co.in '),
('DEEPAK SABHARWAL', 'deepak.sabherwal.legal@gmail.com'),
('DEEPALI PURI', 'puri.deepali@gmail.com '),
('DILRAJ SINGH BHINDER', 'bhinderdilraj@gmail.com '),
('GAGANDEEP S JAMMU', 'gaganjammu@gmail.com '),
('GAURAV TANGRI', 'gtangri@gmail.com '),
('GEETA GULATI', 'ggulati@lawyer.com '),
('GEETA SHARMA', 'geetasharma.adv@gmail.com '),
('GURINDER SINGH GORAYA', 'gorayags@yahoo.com'),
('HARPREET SINGH MULTANI', 'multaniharpreet98@gmail.com '),
('HEMENDER GOSWAMI', 'hemender_goswami@yahoo.com'),
('ISHTBIR SINGH SIDHU', 'ishtbirsidhu@gmail.com'),
('JAITEJ PARI MITTAL', 'jaitej.mittal@gmail.com '),
('JARNAIL KAUR', 'bsyadavanu@gmail.com'),
('JASLEEN KAUR CHANDOK', 'jasleenchdk@yahoo.co.in'),
('KANWAL S WALIA', 'kanwalwalia8@gmail.com'),
('KARMINDER SINGH', 'adv.karminder@gmail.com '),
('MAYANK MATHUR', 'mayankmathursmail@gmail.com '),
('MEHARDEEP SINGH', 'AdvMehardeep@gmail.com '),
('MS. GAGAN MOHINI', 'gaganmohini29@gmail.com '),
('MS. MANPREET DHALIWAL', 'mandykdhaliwal88@gmail.com'),
('MS. PREETI SINGH', 'preetisingh1324@gmail.com '),
('MS. PUNEET K SEKHON', 'pks@sekhonlawassociates.com '),
('MS. REETA KOHLI', 'reeta.kohli@gmail.com'),
('NITIN KAUSHAL', 'nitinkaushal.adv@gmail.com '),
('NONE', 'NONE'),
('PARMINDER SINGH', 'vikasingh701@yahoo.in'),
('RAHUL SAHDEVA', 'rahulsachdeva88@gmail.com'),
('RAJESH K SHARMA', 'egalneeds4solutions@gmail.com'),
('SANGITA DHANDA', 'dhandasangita@yhoo.com'),
('SARJIT SINGH', 'vikasingh701@yahoo.in'),
('SARTHAK GUPTA', 'sarthakgupta.adv@gmail.com '),
('SAURABH GOEL', 'goelishu@gmail.com'),
('SUMIT JAIN', 'smlawassociates@gmail.com '),
('TARUNVIR SINGH LEHAL', 'tarunlehal@yahoo.in'),
('VIKAS CHATRATH', 'vchatrath@gmail.com '),
('VIKAS KUTHIALA', 'vikaskuthiala@rediffmail.com '),
('VIKAS SINGH', 'vikasingh701@yahoo.in'),
('VISHAL MOUDGILL', 'vishal.moudgill@gmail.com '),
('VISHWAJIT BEDI', 'adv.vishwajitbedi1983@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_name`) VALUES
('AMRITSAR'),
('BATHINDA'),
('CHANDIGARH'),
('FARIDKOT'),
('FATEHGARH SAHIB'),
('FEROZEPUR'),
('GURDASPUR'),
('HARYANA'),
('HIMACHAL PRADESH'),
('HOSHIARPUR'),
('JALANDHAR'),
('KAPURTHALA'),
('KOLKATA'),
('LUDHIANA'),
('MANSA'),
('MOGA'),
('MOHALI'),
('NEW DELHI'),
('NONE'),
('PATHANKOT'),
('PATIALA'),
('RAJASTHAN'),
('ROOPNAGAR'),
('SANGRUR'),
('SHAHEED BHAGAT SINGH NAGAR (NAWANSHAHR)'),
('SRI GANGANAGAR'),
('SRI MUKTSAR SAHIB'),
('TARN-TARAN');

-- --------------------------------------------------------

--
-- Table structure for table `petitioner_respondent_info`
--

CREATE TABLE `petitioner_respondent_info` (
  `file_number` varchar(50) NOT NULL,
  `petitioner_name` varchar(50) NOT NULL,
  `petitioner_email` varchar(100) DEFAULT NULL,
  `petitioner_address` mediumtext NOT NULL,
  `petitioner_file_type` varchar(100) DEFAULT NULL,
  `petitioner_file` longblob,
  `respondent_name` varchar(50) NOT NULL,
  `respondent_email` varchar(100) DEFAULT NULL,
  `respondent_address` mediumtext NOT NULL,
  `respondent_file_type` varchar(100) DEFAULT NULL,
  `respondent_file` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petitioner_respondent_info`
--

-- INSERT INTO `petitioner_respondent_info` (`file_number`, `petitioner_name`, `petitioner_email`, `petitioner_address`, `petitioner_file_type`, `petitioner_file`, `respondent_name`, `respondent_email`, `respondent_address`, `respondent_file_type`, `respondent_file`) VALUES
-- INSERT INTO `petitioner_respondent_info` (`file_number`, `petitioner_name`, `petitioner_email`, `petitioner_address`, `petitioner_file_type`, `petitioner_file`, `respondent_name`, `respondent_email`, `respondent_address`, `respondent_file_type`, `respondent_file`) VALUES
-- ('2437', 'MARKFED', 'legal@markfedpunjab.com', 'MARKFED HOUSE, SECTOR-35\nCHANDIGARH', NULL, NULL, 'PREM KUMAR ', '', 'SANGRUR', NULL, NULL),
-- ('2664', 'KULWANT KAUR', '', 'FARIDKOT', NULL, NULL, 'MARKFED', 'legal@markfedpunjab.com', 'MARKFED HOUSE, SECTOR-35, CHANDIGARH', NULL, NULL),
-- ('2937', 'BHUPINDER SINGH SODHI', '', 'H.NO. 11500/66, GURU NANAK DEV NAGAR, RAAJI COLONY, HAIBIWAL KALAN, LUDHIANA', NULL, NULL, 'MARKFED', 'legal@markfedpunjab.com', 'MARKFED HOUSE, CHANDIGARH', NULL, NULL),
-- ('738', 'HHJHKHLKJ', '', 'BATHINDA', NULL, NULL, 'MARKFED', '', 'CHANDIGARH', NULL, NULL),
-- ('LDH-320', 'MARKFED', 'arbitration@markfedpunjab.com', 'MARKFED HOUSE, SECTOR-35 CHANDIGARH, THROUGH D.M LUDHIANA', NULL, NULL, 'KULWANT SINGH, SBO (RETD.)  GURMAIL SINGH, SALESMA', '', 'LUDHIANA', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `contact` varchar(13) DEFAULT NULL,
  `email_add` varchar(50) DEFAULT NULL,
  `email_password` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `user_group` varchar(50) NOT NULL,
  `status_app` varchar(50) NOT NULL DEFAULT 'OFFLINE',
  `status_web` varchar(50) NOT NULL DEFAULT 'OFFLINE'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`username`, `password`, `full_name`, `contact`, `email_add`, `email_password`, `location`, `user_group`, `status_app`, `status_web`) VALUES
('deepak', 'markfed', 'Deepak Mehta', '+919876086060', 'deepakmehta_deepu75@yahoo.com', 'markfed', NULL, 'Operator', 'OFFLINE', 'OFFLINE'),
('gurpreet', 'markfed', 'Gurpreet Singh Chauhan', '+919888100133', 'lippy140@yahoo.com', 'punshmir', NULL, 'Operator', 'OFFLINE', 'OFFLINE'),
('markfed', 'markfed', 'MarkFed', '', '', '', 'Chandigarh', 'Administrator', 'OFFLINE', 'OFFLINE'),
('taranjit', 'markfed', 'Taranjit Singh', '+919814004390', 'sunnysethi2@rediffmail.com', 'markfed', NULL, 'Operator', 'OFFLINE', 'OFFLINE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `case_info`
--
ALTER TABLE `case_info`
  ADD PRIMARY KEY (`file_number`);

--
-- Indexes for table `case_type`
--
ALTER TABLE `case_type`
  ADD PRIMARY KEY (`casetype_name`);

--
-- Indexes for table `case_update_log`
--
ALTER TABLE `case_update_log`
  ADD PRIMARY KEY (`time`);

--
-- Indexes for table `court_type`
--
ALTER TABLE `court_type`
  ADD PRIMARY KEY (`court_name`);

--
-- Indexes for table `date_info`
--
ALTER TABLE `date_info`
  ADD PRIMARY KEY (`file_number`);

--
-- Indexes for table `decision_type`
--
ALTER TABLE `decision_type`
  ADD PRIMARY KEY (`decision`);

--
-- Indexes for table `latest_proceeding`
--
ALTER TABLE `latest_proceeding`
  ADD PRIMARY KEY (`file_number`);

--
-- Indexes for table `lawyer`
--
ALTER TABLE `lawyer`
  ADD PRIMARY KEY (`lawyer_name`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_name`);

--
-- Indexes for table `petitioner_respondent_info`
--
ALTER TABLE `petitioner_respondent_info`
  ADD PRIMARY KEY (`file_number`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
