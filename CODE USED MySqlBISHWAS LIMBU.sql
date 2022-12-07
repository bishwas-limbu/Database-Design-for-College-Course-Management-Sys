-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: collegecoursesmanagement
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coursemodule_details`
--

DROP TABLE IF EXISTS `coursemodule_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursemodule_details` (
  `CourseModule_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Course_ID` int(11) NOT NULL,
  `Module_ID` int(11) NOT NULL,
  PRIMARY KEY (`CourseModule_ID`),
  KEY `Course_ID` (`Course_ID`),
  KEY `Module_ID` (`Module_ID`),
  CONSTRAINT `coursemodule_details_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `courses` (`Course_ID`),
  CONSTRAINT `coursemodule_details_ibfk_2` FOREIGN KEY (`Module_ID`) REFERENCES `modules` (`Module_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursemodule_details`
--

LOCK TABLES `coursemodule_details` WRITE;
/*!40000 ALTER TABLE `coursemodule_details` DISABLE KEYS */;
INSERT INTO `coursemodule_details` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,1),(6,2,2),(7,2,4),(8,2,5),(9,2,7),(10,3,6),(11,3,2),(12,3,4),(13,4,8),(14,4,11),(15,5,11),(16,5,9),(17,5,10);
/*!40000 ALTER TABLE `coursemodule_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `Course_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Course_Title` varchar(35) NOT NULL,
  `Course_Duration` varchar(20) DEFAULT 'Not Available',
  `Course_Fees` int(11) NOT NULL,
  PRIMARY KEY (`Course_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Networking And IT Security','3 YEARS',1400000),(2,'Computing','3 YEARS',1300000),(3,'Multimedia','3 YEARS',1450000),(4,'Business','4 YEARS',1250000),(5,'Arts','4 YEARS',1000000);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollments` (
  `Enrollment_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Course_ID` int(11) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  PRIMARY KEY (`Enrollment_ID`),
  KEY `Course_ID` (`Course_ID`),
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `courses` (`Course_ID`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`Student_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,3,6),(7,3,7),(8,3,8),(9,4,9),(10,4,10),(11,5,11),(12,5,12);
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `Module_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Module_Title` varchar(35) NOT NULL,
  `Module_Duration` varchar(20) DEFAULT 'Not Available',
  PRIMARY KEY (`Module_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Information System','12 Week'),(2,'Programing','28 Week'),(3,'communication Engineering','28 Week'),(4,'Fundamental of Computing','12 Week'),(5,'Logic and Problem Solving','12 Week'),(6,'Digital Desgin and Image Making','28 Week'),(7,'Computer Hardware and Software','12 Week'),(8,'Introducton to IT','12 Week'),(9,'Psychology','12 Week'),(10,'Sociology','12 Week'),(11,'Foundational Mathematics','28 Week');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `Student_ID` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(25) NOT NULL,
  `Last_Name` varchar(25) NOT NULL,
  `Mobile_no` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Email` varchar(60) DEFAULT 'Not Available',
  PRIMARY KEY (`Student_ID`),
  UNIQUE KEY `Mobile_no` (`Mobile_no`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Raju','Tamang',9833249,'1993-09-12','Kathmandu','raju@gmail.com'),(2,'Pritam','Shrestha',9833041,'1991-05-14','Pokhara','pritam@gmail.com'),(3,'Hemant','Rana',9801098,'1996-09-23','Bhaktapur','hemant@gmail.com'),(4,'Gaurav','Shrestha',98010222,'1993-04-13','Kannpur','gaurav@gmail.com'),(5,'Jiwan','Limbu',98993344,'1991-05-23','Damak','jiwan@gmail.com'),(6,'Ram','Rai',9833189,'1992-09-12','Itahari','ram@gmail.com'),(7,'Romeo','Rai',98011772,'1994-08-12','Lalitpur','romeo@gmail.com'),(8,'Jiwan','Rai',98011755,'1995-08-02','Biratnagar','jiwanrai@gmail.com'),(9,'Sita','Gurung',98012300,'1995-06-05','Dharan','sita@gmail.com'),(10,'Resham','Gurung',9800566,'1992-01-12','Lalitpur','resham@gmail.com'),(11,'Rosy','Tamang',9882233,'1991-01-12','Itahari','rosy@gmail.com'),(12,'Sonam','Tamang',98112233,'1994-06-17','Dharan','sonam@gmail.com');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachermodule_details`
--

DROP TABLE IF EXISTS `teachermodule_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachermodule_details` (
  `TeacherModule_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Teacher_ID` int(11) NOT NULL,
  `Module_ID` int(11) NOT NULL,
  PRIMARY KEY (`TeacherModule_ID`),
  KEY `Teacher_ID` (`Teacher_ID`),
  KEY `Module_ID` (`Module_ID`),
  CONSTRAINT `teachermodule_details_ibfk_1` FOREIGN KEY (`Teacher_ID`) REFERENCES `teachers` (`Teacher_ID`),
  CONSTRAINT `teachermodule_details_ibfk_2` FOREIGN KEY (`Module_ID`) REFERENCES `modules` (`Module_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachermodule_details`
--

LOCK TABLES `teachermodule_details` WRITE;
/*!40000 ALTER TABLE `teachermodule_details` DISABLE KEYS */;
INSERT INTO `teachermodule_details` VALUES (1,1,1),(2,1,4),(3,2,3),(4,3,3),(5,4,2),(6,5,2),(7,6,1),(8,7,5),(9,8,6),(10,9,7),(11,7,8),(12,10,9),(13,11,10),(14,12,11);
/*!40000 ALTER TABLE `teachermodule_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `Teacher_ID` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(25) NOT NULL,
  `Last_Name` varchar(25) NOT NULL,
  `Mobile_no` int(11) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Email` varchar(60) DEFAULT 'Not Available',
  `Salary` int(11) NOT NULL,
  PRIMARY KEY (`Teacher_ID`),
  UNIQUE KEY `Mobile_no` (`Mobile_no`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Janaki','Chaudary',98083450,'Pokhara','janaki@gmail.com',60000),(2,'Sofiya','Gajurel',980947457,'Kathmandu','sofiya@gmail.com',50000),(3,'Anuj','Shilpakar',9850367,'Kathmandu','anuj@gmail.com',45000),(4,'Pasang','Tamang',9001123,'Dharan','pasang@gmail.com',55000),(5,'Kriti','Rai',9779901,'Itahari','kriti@gmail.com',65000),(6,'Aadit','shrestha',9221990,'Bhaktapur','aadit@gmail.com',67000),(7,'Aafsa','Roy',998190450,'Kannpur','aafsa@gmail.com',59000),(8,'Bishwas','Limbu',980834803,'Dharan','bishwas@gmail.com',43000),(9,'Bisu','Rai',980834812,'Itahari','bisu@gmail.com',47000),(10,'Rajiv','Tamang',9091234,'Pokhara','rajiv@gmail.com',42000),(11,'Sangam','Chhetri',9109160,'Itahari','sangam@gmail.com',44000),(12,'Hari','Gurung',9903450,'Kathmandu','hari@gmail.com',50000);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-26 18:49:37
