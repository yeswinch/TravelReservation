-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: airlinedb
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `airlines`
--

DROP TABLE IF EXISTS `airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airlines` (
  `aline_ID` char(2) NOT NULL,
  `aline_name` char(20) NOT NULL,
  PRIMARY KEY (`aline_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlines`
--

LOCK TABLES `airlines` WRITE;
/*!40000 ALTER TABLE `airlines` DISABLE KEYS */;
INSERT INTO `airlines` VALUES ('AG','Allegiant'),('AI','AirIndia'),('AL','Alaska'),('AM','American'),('DA','Delta'),('DC','DeccanAviation'),('EN','Envoy'),('FR','Frontier'),('GA','GoAir'),('GJ','GujuratAir'),('HW','Hawaiian'),('IN','Indian'),('JB','JetBlue'),('JT','Jet'),('RP','Republic'),('RU','RUAir'),('SK','SkyWest'),('SS','Spirit'),('SW','SouthWest'),('UN','United');
/*!40000 ALTER TABLE `airlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airports` (
  `aportID` char(3) NOT NULL,
  `aport_name` varchar(75) DEFAULT NULL,
  `acity` varchar(50) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`aportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airports`
--

LOCK TABLES `airports` WRITE;
/*!40000 ALTER TABLE `airports` DISABLE KEYS */;
INSERT INTO `airports` VALUES ('AMD','Sardar VP International Airport','Ahmedabad, Gujurat','India'),('ATL','Hartsfield-Jackson Atlanta International Airport','Atlanta, GA','USA'),('BOM','Chhatrapati SM International Airport','Mumbai, Maharashtra','India'),('COK','Cochin International Airport','Kochi, Kerala','India'),('DEL','Indira Gandhi International Airport','Delhi, Delhi','India'),('DEN','Denver International Airport','Denver, CO','USA'),('EWR','Newark International Airport','Newark, NJ','USA'),('GOI','Goa International Airport','Dabolim, Goa','India'),('HYD','Rajiv Gandhi International Airport','Hyderabad, Telangana','India'),('JAI','Jaipur International Airport','Jaipur, Rajasthan','India'),('JFK','John F. Kennedy','New York City, NY','USA'),('LAS','McCarran International Airport','Las Vegas, NV','USA'),('LAX','Los Angeles International Airport','Los Angeles, CA','USA'),('MAA','Chennai International Airport','Chennai, Tamil Nadu','India'),('MCO','Orlando International Airport','Orlando, FL','USA'),('ORD','OHare International Airport','Chicago, IL','USA'),('PHL','Philadelphia International Airport','Philadelphia, PA','USA'),('PNQ','Pune Airport','Pune, Maharashtra','India'),('SFO','San Francisco International Airport','San Francisco, CA','USA'),('SXR','Sheikh ul-Alam International Airport','Srinagar, Jammu and Kashmir','India');
/*!40000 ALTER TABLE `airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consists_of`
--

DROP TABLE IF EXISTS `consists_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consists_of` (
  `res_num` char(20) NOT NULL,
  `flight_num` char(10) NOT NULL,
  `aline_ID` char(2) NOT NULL,
  `from_airport` char(20) NOT NULL,
  `to_airport` char(20) NOT NULL,
  PRIMARY KEY (`res_num`,`flight_num`,`aline_ID`,`from_airport`,`to_airport`),
  KEY `consists_of_ibfk_2` (`flight_num`),
  KEY `consists_of_ibfk_3` (`aline_ID`),
  KEY `consists_of_ibfk_4` (`from_airport`),
  KEY `consists_of_ibfk_5` (`to_airport`),
  CONSTRAINT `consists_of_ibfk_1` FOREIGN KEY (`res_num`) REFERENCES `reservations` (`res_num`) ON UPDATE CASCADE,
  CONSTRAINT `consists_of_ibfk_2` FOREIGN KEY (`flight_num`) REFERENCES `legs` (`flight_num`) ON UPDATE CASCADE,
  CONSTRAINT `consists_of_ibfk_3` FOREIGN KEY (`aline_ID`) REFERENCES `legs` (`aline_ID`) ON UPDATE CASCADE,
  CONSTRAINT `consists_of_ibfk_4` FOREIGN KEY (`from_airport`) REFERENCES `legs` (`from_airport`) ON UPDATE CASCADE,
  CONSTRAINT `consists_of_ibfk_5` FOREIGN KEY (`to_airport`) REFERENCES `legs` (`to_airport`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consists_of`
--

LOCK TABLES `consists_of` WRITE;
/*!40000 ALTER TABLE `consists_of` DISABLE KEYS */;
INSERT INTO `consists_of` VALUES ('5','5','AG','EWR','JFK'),('4','4','AL','DEN','PHL'),('6','6','AM','JFK','LAX'),('1','1','DA','JFK','EWR'),('7','7','FR','LAX','DEN'),('3','3','RU','EWR','DEN'),('2','2','UN','JFK','LAS');
/*!40000 ALTER TABLE `consists_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `c_acc` char(10) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `acc_create_date` date NOT NULL,
  `phone_num` char(11) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `pswd` varchar(20) NOT NULL,
  `credit_card` char(16) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `zip_code` char(5) DEFAULT NULL,
  PRIMARY KEY (`c_acc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('cust1','c','c','2020-04-10',NULL,'c1@c.com','12345678',NULL,NULL,NULL,NULL),('cust2','c2','c2','2020-04-01',NULL,'c2@c.com','12345678',NULL,NULL,NULL,NULL),('cust3','c3','c3','2020-04-22',NULL,'c3@c.com','12345678',NULL,NULL,NULL,NULL),('cust4','c4','c4','2020-04-25',NULL,'c4@c.com','12345678',NULL,NULL,NULL,NULL),('cust5','c5','c5','2020-04-10',NULL,'c5@c.com','12345678',NULL,NULL,NULL,NULL),('cust6','c6','c6','2020-04-10',NULL,'c6@c.com','12345678',NULL,NULL,NULL,NULL),('cust7','c7','c7','2020-04-10',NULL,'c7@c.com','12345678',NULL,NULL,NULL,NULL),('demo','dem','demo','2020-05-05','','demo@demo.com','12345678','','','',''),('example','exL','exF','2020-05-05','','ex@ex.com','12345678','','','',''),('try2','tryUp','try2','2020-04-28','6092986654','try2@gmail.com','12345678','','New Brunswick','NJ','08084'),('update1-9','UpLast3','UpFirst2','2020-04-28','','update4@update.com','45678901','','','',''),('Yeswinch','Yeswin','Chinta','2020-04-30','','yeswin@example.com','12345678','','','','');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `eID` char(10) NOT NULL,
  `e_acc` char(10) DEFAULT NULL,
  `passwrd` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`eID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('1','manager1','password1'),('10','manager10','password10'),('2','manager2','password2'),('3','manager3','password3'),('4','manager4','password4'),('5','manager5','password5'),('6','manager6','password6'),('7','manager7','password7'),('8','manager8','password8'),('9','manager9','password9'),('999','admin','admin');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `flight_num` char(10) NOT NULL,
  `aline_ID` char(2) NOT NULL,
  `num_of_seats` int DEFAULT NULL,
  `work_day` date DEFAULT NULL,
  `fare` decimal(10,2) DEFAULT NULL,
  `punctuality` char(8) DEFAULT 'ON-TIME',
  PRIMARY KEY (`flight_num`,`aline_ID`),
  KEY `flights_ibfk_1` (`aline_ID`),
  CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`aline_ID`) REFERENCES `airlines` (`aline_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES ('1','DA',300,NULL,87.00,'ON-TIME'),('10','SW',150,NULL,78.00,'DELAYED'),('11','SS',300,NULL,26.00,'DELAYED'),('12','EN',150,NULL,65.00,'ON-TIME'),('13','RP',150,NULL,45.00,'ON-TIME'),('14','SK',150,NULL,78.70,'ON-TIME'),('15','AI',150,NULL,96.69,'ON-TIME'),('16','DC',300,NULL,139.00,'ON-TIME'),('17','GA',300,NULL,160.00,'ON-TIME'),('18','GJ',300,NULL,210.00,'ON-TIME'),('19','IN',300,NULL,155.55,'ON-TIME'),('2','UN',300,NULL,79.00,'ON-TIME'),('20','JT',300,NULL,169.13,'ON-TIME'),('21','RU',35,NULL,3.50,'DELAYED'),('22','SS',250,NULL,55.99,'ON-TIME'),('23','SS',220,NULL,56.77,'ON-TIME'),('24','DA',300,NULL,67.32,'ON-TIME'),('25','AI',300,NULL,130.28,'DELAYED'),('3','RU',25,NULL,2.50,'ON-TIME'),('4','AL',300,NULL,45.00,'ON-TIME'),('5','AG',300,NULL,67.00,'ON-TIME'),('6','AM',300,NULL,69.00,'ON-TIME'),('7','FR',300,NULL,96.00,'ON-TIME'),('8','HW',300,NULL,119.00,'ON-TIME'),('9','JB',300,NULL,87.00,'ON-TIME');
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legs`
--

DROP TABLE IF EXISTS `legs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legs` (
  `flight_num` char(10) NOT NULL,
  `aline_ID` char(2) NOT NULL,
  `from_airport` char(3) NOT NULL,
  `to_airport` char(3) NOT NULL,
  `departure_date` date NOT NULL,
  `arrival_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `seat_number` char(3) NOT NULL,
  `special_meal` varchar(20) DEFAULT NULL,
  `class` varchar(20) NOT NULL,
  PRIMARY KEY (`flight_num`,`aline_ID`,`from_airport`,`to_airport`),
  UNIQUE KEY `flight_num_UNIQUE` (`flight_num`),
  KEY `legs_ibfk_2` (`aline_ID`),
  KEY `legs_ibfk_3` (`from_airport`),
  KEY `legs_ibfk_4` (`to_airport`),
  CONSTRAINT `legs_ibfk_1` FOREIGN KEY (`flight_num`) REFERENCES `flights` (`flight_num`) ON UPDATE CASCADE,
  CONSTRAINT `legs_ibfk_2` FOREIGN KEY (`aline_ID`) REFERENCES `flights` (`aline_ID`) ON UPDATE CASCADE,
  CONSTRAINT `legs_ibfk_3` FOREIGN KEY (`from_airport`) REFERENCES `airports` (`aportID`) ON UPDATE CASCADE,
  CONSTRAINT `legs_ibfk_4` FOREIGN KEY (`to_airport`) REFERENCES `airports` (`aportID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legs`
--

LOCK TABLES `legs` WRITE;
/*!40000 ALTER TABLE `legs` DISABLE KEYS */;
INSERT INTO `legs` VALUES ('1','DA','JFK','EWR','2020-03-14','2020-03-14','12:00:00','13:00:00','24A',NULL,'Economy'),('10','SW','LAX','DEN','2020-03-15','2020-03-15','07:30:00','08:30:00','24A',NULL,'Economy'),('11','SS','JFK','DEN','2020-03-15','2020-03-15','09:30:00','10:30:00','24A',NULL,'Economy'),('12','EN','EWR','DEN','2020-03-15','2020-03-15','11:30:00','12:30:00','24A',NULL,'Economy'),('2','UN','JFK','LAS','2020-05-14','2020-03-15','09:15:00','10:16:00','24A',NULL,'Economy'),('3','RU','EWR','DEN','2020-05-14','2020-03-15','09:15:00','10:16:00','24A',NULL,'Economy'),('4','AL','DEN','PHL','2020-03-14','2020-03-15','10:15:00','11:15:00','24A',NULL,'Economy'),('5','AG','EWR','JFK','2020-03-14','2020-03-16','08:15:00','10:15:00','24A',NULL,'Economy'),('6','AM','JFK','LAX','2020-03-15','2020-03-15','08:15:00','10:15:00','24A',NULL,'Economy'),('7','FR','LAX','DEN','2020-03-14','2020-03-15','08:15:00','10:15:00','24A',NULL,'Economy'),('8','HW','DEN','LAX','2020-03-14','2020-03-14','09:15:00','10:15:00','24A',NULL,'Economy'),('9','JB','LAX','JFK','2020-03-14','2020-03-14','10:30:00','11:30:00','24A',NULL,'Economy');
/*!40000 ALTER TABLE `legs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manages`
--

DROP TABLE IF EXISTS `manages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manages` (
  `res_num` char(20) NOT NULL,
  `eID` char(10) NOT NULL,
  PRIMARY KEY (`res_num`),
  KEY `eID` (`eID`),
  CONSTRAINT `manages_ibfk_1` FOREIGN KEY (`res_num`) REFERENCES `reservations` (`res_num`),
  CONSTRAINT `manages_ibfk_2` FOREIGN KEY (`eID`) REFERENCES `employees` (`eID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manages`
--

LOCK TABLES `manages` WRITE;
/*!40000 ALTER TABLE `manages` DISABLE KEYS */;
/*!40000 ALTER TABLE `manages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operates`
--

DROP TABLE IF EXISTS `operates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operates` (
  `flight_num` char(10) NOT NULL,
  `f_alineID` char(2) NOT NULL,
  `a_alineID` char(2) NOT NULL,
  PRIMARY KEY (`flight_num`,`f_alineID`),
  KEY `f_alineID` (`f_alineID`),
  KEY `a_alineID` (`a_alineID`),
  CONSTRAINT `operates_ibfk_1` FOREIGN KEY (`flight_num`) REFERENCES `flights` (`flight_num`),
  CONSTRAINT `operates_ibfk_2` FOREIGN KEY (`f_alineID`) REFERENCES `flights` (`aline_ID`),
  CONSTRAINT `operates_ibfk_3` FOREIGN KEY (`a_alineID`) REFERENCES `airlines` (`aline_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operates`
--

LOCK TABLES `operates` WRITE;
/*!40000 ALTER TABLE `operates` DISABLE KEYS */;
/*!40000 ALTER TABLE `operates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_of`
--

DROP TABLE IF EXISTS `part_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_of` (
  `l_flight_num` char(10) NOT NULL,
  `l_alineID` char(2) NOT NULL,
  `from_airport` char(20) NOT NULL,
  `to_airport` char(20) NOT NULL,
  `f_flight_num` char(10) NOT NULL,
  `f_alineID` char(2) NOT NULL,
  PRIMARY KEY (`l_flight_num`,`l_alineID`,`from_airport`,`to_airport`),
  KEY `f_flight_num` (`f_flight_num`),
  KEY `l_alineID` (`l_alineID`),
  KEY `f_alineID` (`f_alineID`),
  KEY `from_airport` (`from_airport`),
  KEY `to_airport` (`to_airport`),
  CONSTRAINT `part_of_ibfk_1` FOREIGN KEY (`l_flight_num`) REFERENCES `legs` (`flight_num`),
  CONSTRAINT `part_of_ibfk_2` FOREIGN KEY (`f_flight_num`) REFERENCES `flights` (`flight_num`),
  CONSTRAINT `part_of_ibfk_3` FOREIGN KEY (`l_alineID`) REFERENCES `legs` (`aline_ID`),
  CONSTRAINT `part_of_ibfk_4` FOREIGN KEY (`f_alineID`) REFERENCES `flights` (`aline_ID`),
  CONSTRAINT `part_of_ibfk_5` FOREIGN KEY (`from_airport`) REFERENCES `legs` (`from_airport`),
  CONSTRAINT `part_of_ibfk_6` FOREIGN KEY (`to_airport`) REFERENCES `legs` (`to_airport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_of`
--

LOCK TABLES `part_of` WRITE;
/*!40000 ALTER TABLE `part_of` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `c_acc` char(10) NOT NULL,
  `seat` int NOT NULL,
  `meal` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`c_acc`,`seat`),
  CONSTRAINT `preferences_ibfk_1` FOREIGN KEY (`c_acc`) REFERENCES `customers` (`c_acc`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `res_num` char(20) NOT NULL,
  `cust_acc` char(10) NOT NULL,
  `date_` date NOT NULL,
  `num_of_passengers` int NOT NULL,
  `booking_fee` double NOT NULL,
  `total_fare` double NOT NULL,
  `fare_restrict` varchar(100) DEFAULT NULL,
  `customer_rep` char(10) DEFAULT NULL,
  PRIMARY KEY (`res_num`),
  KEY `reservations_ibfk_1` (`cust_acc`),
  KEY `reservations_ibfk_2` (`customer_rep`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`cust_acc`) REFERENCES `customers` (`c_acc`) ON UPDATE CASCADE,
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`customer_rep`) REFERENCES `employees` (`eID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES ('1','cust1','2020-03-14',1,40,200,NULL,NULL),('2','cust2','2020-05-14',2,20,200,NULL,NULL),('3','cust3','2020-05-14',1,20,200,NULL,NULL),('4','cust4','2020-03-14',1,40,250,NULL,NULL),('42886','demo','2020-03-15',1,2.6,28.6,NULL,'5'),('5','cust5','2020-03-14',1,40,200,NULL,NULL),('6','cust6','2020-03-15',1,40,200,NULL,NULL),('7','cust7','2020-03-14',1,40,200,NULL,NULL),('83078','example','2020-03-14',1,8.700000000000001,95.7,NULL,'8');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stops`
--

DROP TABLE IF EXISTS `stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stops` (
  `arrive_time` time NOT NULL,
  `depart_time` time NOT NULL,
  `aportID` char(3) NOT NULL,
  `aline_ID` char(2) NOT NULL,
  `flight_num` char(10) NOT NULL,
  PRIMARY KEY (`flight_num`,`aline_ID`),
  KEY `aportID` (`aportID`),
  KEY `aline_ID` (`aline_ID`),
  CONSTRAINT `stops_ibfk_1` FOREIGN KEY (`aportID`) REFERENCES `airports` (`aportID`),
  CONSTRAINT `stops_ibfk_2` FOREIGN KEY (`aline_ID`) REFERENCES `flights` (`aline_ID`),
  CONSTRAINT `stops_ibfk_3` FOREIGN KEY (`flight_num`) REFERENCES `flights` (`flight_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stops`
--

LOCK TABLES `stops` WRITE;
/*!40000 ALTER TABLE `stops` DISABLE KEYS */;
/*!40000 ALTER TABLE `stops` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-19  0:25:56
