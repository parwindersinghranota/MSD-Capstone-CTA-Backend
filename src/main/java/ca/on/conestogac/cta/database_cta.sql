-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (x86_64)
--
-- Host: 127.0.0.1    Database: cta
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `driver` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_ibfk_2_driver` (`driver`),
  KEY `feedback_ibfk_1` (`user`,`driver`),
  CONSTRAINT `feedback_ibfk_2_driver` FOREIGN KEY (`driver`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `feedback_lbfk_1_user` FOREIGN KEY (`user`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (16,'sandeep@conestogac.on.ca','pranota@conestogac.on.ca','I had a very nice experience with pranota@conestogac.on.ca. I had 10 rides with this driver. His driving skill is awesome.','2023-07-27 19:56:01',4.5),(17,'kelly@conestogac.on.ca','pranota@conestogac.on.ca','I just asked this guy to drop me little ahead around 3 miles from the original decided drop-off place. But he didn\'t coperate.','2023-07-27 19:56:01',1),(18,'john@conestogac.on.ca','pranota@conestogac.on.ca','Nice experice with this driver. Highly recommended.','2023-07-27 19:56:01',5),(21,'pkaur@conestogac.on.ca','pranota@conestogac.on.ca','Hey everyone, I have a nice experience with this driver. Hello world','2023-07-28 12:29:56',5);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message_from` varchar(255) DEFAULT NULL,
  `message_to` varchar(255) DEFAULT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ride_id` int DEFAULT NULL,
  `message` varchar(1000) NOT NULL,
  `message_type` varchar(15) DEFAULT NULL,
  `ride_confirm` int DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `fk_message_from_idx` (`message_from`),
  KEY `fk_message_to_idx` (`message_to`),
  KEY `fk_ride_id_idx` (`ride_id`),
  CONSTRAINT `fk_message_from` FOREIGN KEY (`message_from`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_message_to` FOREIGN KEY (`message_to`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ride_id` FOREIGN KEY (`ride_id`) REFERENCES `ride_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (63,'pkaur@conestogac.on.ca','pranota@conestogac.on.ca','2023-07-28 08:26:58',24,'hello I am looking for this ride.','MESSAGE',0),(64,'pkaur@conestogac.on.ca','pranota@conestogac.on.ca','2023-07-28 08:27:42',24,'PLEASE, ACCEPT MY RIDE REQUEST.','RIDE_REQUEST',1),(65,'chaitu@conestogac.on.ca','pranota@conestogac.on.ca','2023-07-28 08:28:33',24,'PLEASE, ACCEPT MY RIDE REQUEST.','RIDE_REQUEST',0),(66,'pkaur@conestogac.on.ca','pranota@conestogac.on.ca','2023-07-28 08:32:25',24,'PLEASE TAP ON PROFILE BUTTON TO SEE MY CONTACT DETAILS','PROFILE',0),(67,'pkaur@conestogac.on.ca','chaitu@conestogac.on.ca','2023-08-01 10:22:41',26,'hello Chaitu how are you.','MESSAGE',0),(68,'pkaur@conestogac.on.ca','chaitu@conestogac.on.ca','2023-08-01 10:22:56',26,'PLEASE, ACCEPT MY RIDE REQUEST.','RIDE_REQUEST',1);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ride_details`
--

DROP TABLE IF EXISTS `ride_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ride_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ride_id` int DEFAULT NULL,
  `rider` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ride_id` (`ride_id`),
  KEY `rider` (`rider`),
  KEY `status` (`status`),
  CONSTRAINT `ride_details_ibfk_1` FOREIGN KEY (`ride_id`) REFERENCES `ride_post` (`id`),
  CONSTRAINT `ride_details_ibfk_2` FOREIGN KEY (`rider`) REFERENCES `user` (`email`),
  CONSTRAINT `ride_details_ibfk_3` FOREIGN KEY (`status`) REFERENCES `ride_details_status_lookup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride_details`
--

LOCK TABLES `ride_details` WRITE;
/*!40000 ALTER TABLE `ride_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `ride_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ride_details_status_lookup`
--

DROP TABLE IF EXISTS `ride_details_status_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ride_details_status_lookup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride_details_status_lookup`
--

LOCK TABLES `ride_details_status_lookup` WRITE;
/*!40000 ALTER TABLE `ride_details_status_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ride_details_status_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ride_post`
--

DROP TABLE IF EXISTS `ride_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ride_post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `time` varchar(19) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `available_seats` int DEFAULT '4',
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provider` (`provider`),
  CONSTRAINT `ride_post_ibfk_1` FOREIGN KEY (`provider`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride_post`
--

LOCK TABLES `ride_post` WRITE;
/*!40000 ALTER TABLE `ride_post` DISABLE KEYS */;
INSERT INTO `ride_post` VALUES (19,'pranota@conestogac.on.ca','Aug 3, 2023','18:36','Student Carpool Alert! Heading from Kitchener to Conestoga College in Waterloo every weekday. Offering reliable rides with fellow students. Let\'s save on gas and parking together! DM me for details.',4,1),(20,'pranota@conestogac.on.ca','Aug 10, 2023','7:0','Attention Conestoga College Students! Need a ride to campus? I\'ve got you covered. Offering daily rides from Waterloo to Conestoga College and back. Affordable fares and a comfortable ride guaranteed. Limited spots available. PM me to secure your seat! ',4,1),(23,'pranota@conestogac.on.ca','Jul 24, 2023','21:0','Attention Conestoga College students in Cambridge! Carpooling to campus has never been easier. Join our friendly group of riders for a stress-free commute to Waterloo or Kitchener. Don\'t let transportation be a barrier to your education. Contact me for details.',4,1),(24,'pranota@conestogac.on.ca','Jul 25, 2023','9:30','Calling all Conestoga College students! Carpool opportunity available from Cambridge to campus. Flexible pick-up and drop-off locations in Waterloo, Kitchener, and Cambridge. Say goodbye to traffic and parking hassles. Reserve your seat today!',4,1),(25,'pranota@conestogac.on.ca','Jul 18, 2023','21:15','Carpooling from Kitchener or Waterloo to Conestoga College? Join our group of students and make your daily commute a breeze. We\'ll handle the driving while you relax or study. Limited seats available, so act fast! Reach out for further details.',4,1),(26,'chaitu@conestogac.on.ca','Aug 8, 2023','12:15','Hello this is new ride from Waterloo campus to Cambridge.',4,1);
/*!40000 ALTER TABLE `ride_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ride_request`
--

DROP TABLE IF EXISTS `ride_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ride_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rider` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ride_id` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rider` (`rider`),
  KEY `ride_id` (`ride_id`),
  CONSTRAINT `ride_request_ibfk_1` FOREIGN KEY (`rider`) REFERENCES `user` (`email`),
  CONSTRAINT `ride_request_ibfk_2` FOREIGN KEY (`ride_id`) REFERENCES `ride_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride_request`
--

LOCK TABLES `ride_request` WRITE;
/*!40000 ALTER TABLE `ride_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `ride_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(45) DEFAULT NULL,
  `question` varchar(500) DEFAULT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  `version` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_survey_idx` (`user`),
  CONSTRAINT `fk_user_survey` FOREIGN KEY (`user`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (132,'pranota@conestogac.on.ca','I spend more than 30 minutes commuting to college each way.','True',1),(133,'pranota@conestogac.on.ca','Which mode of transportation do you primarily use for your commute to college?','Public Transportation (Bus/Train)',1),(134,'pranota@conestogac.on.ca','What are the main challenges you face during your commute to college?','dummy answer 3',1),(135,'pranota@conestogac.on.ca','I have missed classes due to transportation issues.','True',1),(136,'pranota@conestogac.on.ca','How often do you encounter traffic congestion during your commute to college?','Rarely',1),(137,'pranota@conestogac.on.ca','Have you ever considered carpooling or ridesharing as a solution to your commuting challenges? Why or why not?','dummy answer 6',1),(138,'pranota@conestogac.on.ca','I find the cost of transportation to college a financial burden.','True',1),(139,'pranota@conestogac.on.ca','What improvements or solutions would you like to see in transportation options for commuting to college?','More frequent public transportation schedules',1),(140,'pranota@conestogac.on.ca','Any other concern(s)','dummy answer 9',1),(141,'pranota@conestogac.on.ca','I spend more than 30 minutes commuting to college each way.','True',2),(142,'pranota@conestogac.on.ca','Which mode of transportation do you primarily use for your commute to college?','Public Transportation (Bus/Train)',2),(143,'pranota@conestogac.on.ca','What are the main challenges you face during your commute to college?','dummy answer 3',2),(144,'pranota@conestogac.on.ca','I have missed classes due to transportation issues.','True',2),(145,'pranota@conestogac.on.ca','How often do you encounter traffic congestion during your commute to college?','Rarely',2),(146,'pranota@conestogac.on.ca','Have you ever considered carpooling or ridesharing as a solution to your commuting challenges? Why or why not?','dummy answer 6',2),(147,'pranota@conestogac.on.ca','I find the cost of transportation to college a financial burden.','True',2),(148,'pranota@conestogac.on.ca','What improvements or solutions would you like to see in transportation options for commuting to college?','More frequent public transportation schedules',2),(149,'pranota@conestogac.on.ca','Any other concern(s)','dummy answer 9',2),(150,'pranota@conestogac.on.ca','I spend more than 30 minutes commuting to college each way.','True',3),(151,'pranota@conestogac.on.ca','Which mode of transportation do you primarily use for your commute to college?','Public Transportation (Bus/Train)',3),(152,'pranota@conestogac.on.ca','What are the main challenges you face during your commute to college?','dummy answer 3',3),(153,'pranota@conestogac.on.ca','I have missed classes due to transportation issues.','True',3),(154,'pranota@conestogac.on.ca','How often do you encounter traffic congestion during your commute to college?','Rarely',3),(155,'pranota@conestogac.on.ca','Have you ever considered carpooling or ridesharing as a solution to your commuting challenges? Why or why not?','dummy answer 6',3),(156,'pranota@conestogac.on.ca','I find the cost of transportation to college a financial burden.','True',3),(157,'pranota@conestogac.on.ca','What improvements or solutions would you like to see in transportation options for commuting to college?','More frequent public transportation schedules',3),(158,'pranota@conestogac.on.ca','Any other concern(s)','dummy answer 9',3);
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `security_question` varchar(255) DEFAULT NULL,
  `security_answer` varchar(255) DEFAULT NULL,
  `college_name` varchar(255) DEFAULT NULL,
  `campus` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `profile_pic` varchar(500) DEFAULT NULL,
  `mobile_no` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('chaitu@conestogac.on.ca','Hello',1,'Chaitanya','Bhargav','What is your favorite color?','Black','Conestoga','Waterloo','Mobile Solutions Development',NULL,'2269786165'),('john@conestogac.on.ca','Hello',1,'John','Srey','What is your mother\'s maiden name?','Hello World','Conestoga','Waterloo','Mobile Solutions Development',NULL,'2269876756'),('kelly@conestogac.on.ca','Hello',1,'Kelly','Tim','What is your mother\'s maiden name?','Hello World','Conestoga','Waterloo','Mobile Solutions Development',NULL,'2269876756'),('pkaur@conestogac.on.ca','Hello',1,'Parabhjot','Kaur','What is your mother\'s maiden name?','Hello World','Conestoga','Waterloo','Mobile Solutions Development',NULL,'2269786166'),('pranota@conestogac.on.ca','Hello',1,'Parwinder','Singh','What is your favorite movie?','fast and furious','Conestoga','Waterloo','Mobile Solutions Development',NULL,'4565436545'),('sandeep@conestogac.on.ca','Hello',1,'Sandeep','Kaur','What is your mother\'s maiden name?','Hello World','Conestoga','Waterloo','Mobile Solutions Development',NULL,'2269876756');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-01 11:01:32
