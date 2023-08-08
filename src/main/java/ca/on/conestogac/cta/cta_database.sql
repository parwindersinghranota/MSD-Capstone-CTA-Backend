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
  `message` varchar(2000) DEFAULT NULL,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_ibfk_2_driver` (`driver`),
  KEY `feedback_ibfk_1` (`user`,`driver`),
  CONSTRAINT `feedback_ibfk_2_driver` FOREIGN KEY (`driver`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `feedback_lbfk_1_user` FOREIGN KEY (`user`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (2,'john@conestogac.on.ca','driver@conestogac.on.ca','I had an absolutely fantastic ride experience with Parwinder (driver). From the moment I got in the car, I could tell that this driver prioritizes both safety and comfort. The ride was incredibly smooth, and I appreciated how attentive and considerate they were throughout the journey.','2023-08-08 14:03:56',5),(3,'kelly@conestogac.on.ca','driver@conestogac.on.ca','The car was immaculately clean and well-maintained, which further added to the overall positive experience. I felt completely at ease during the ride, and I couldn\'t have asked for a better driver.','2023-08-08 14:03:56',5),(5,'sandeep@conestogac.on.ca','driver@conestogac.on.ca','I want to express my gratitude to [Driver\'s Name] for not only getting me to my destination safely and efficiently but also for creating a warm and welcoming atmosphere. They truly embody what a great ride should be – professional, courteous, and enjoyable. I\'ll definitely be looking forward to riding with them again in the future. Thank you, [Driver\'s Name], for going above and beyond!','2023-08-08 14:03:56',5),(7,'rider@conestogac.on.ca','driver@conestogac.on.ca','Driver went above and beyond to make sure I was comfortable and had everything I needed. Their friendly demeanor and engaging conversation made the ride enjoyable and time flew by. It\'s evident that they take pride in their work and genuinely care about providing the best experience for their passengers.','2023-08-08 14:10:13',4.5);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'rider@conestogac.on.ca','driver@conestogac.on.ca','2023-08-08 09:44:21',31,'Hello I am interested in this ride. Do we still have seats available ?','MESSAGE',0),(2,'driver@conestogac.on.ca','driver@conestogac.on.ca','2023-08-08 09:45:52',31,'Yes, you can still secure your seat. Please send ride request and profile info.','MESSAGE',0),(3,'rider@conestogac.on.ca','driver@conestogac.on.ca','2023-08-08 09:46:54',31,'PLEASE, ACCEPT MY RIDE REQUEST.','RIDE_REQUEST',1),(4,'rider@conestogac.on.ca','driver@conestogac.on.ca','2023-08-08 09:47:12',31,'PLEASE TAP ON PROFILE BUTTON TO SEE MY CONTACT DETAILS','PROFILE',0),(5,'other_rider@conestogac.on.ca','driver@conestogac.on.ca','2023-08-08 09:53:32',31,'PLEASE, ACCEPT MY RIDE REQUEST.','RIDE_REQUEST',0),(6,'other_rider@conestogac.on.ca','driver@conestogac.on.ca','2023-08-08 09:54:18',31,'Hi, I want to take this ride. Could you please accept my ride request.','MESSAGE',0),(7,'driver@conestogac.on.ca','driver@conestogac.on.ca','2023-08-08 09:56:01',31,'Sorry, I don\'t have space in the car for more people.','MESSAGE',0);
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
  `description` varchar(2000) DEFAULT NULL,
  `available_seats` int DEFAULT '4',
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provider` (`provider`),
  CONSTRAINT `ride_post_ibfk_1` FOREIGN KEY (`provider`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride_post`
--

LOCK TABLES `ride_post` WRITE;
/*!40000 ALTER TABLE `ride_post` DISABLE KEYS */;
INSERT INTO `ride_post` VALUES (27,'driver@conestogac.on.ca','Aug 16, 2023','15:30','Hey there, fellow students! ? If you\'re looking to share a ride and save on commuting costs in the Waterloo Kitchener Cambridge area, I\'ve got you covered! As a student with a car, I\'m offering reliable and affordable ride-sharing options for your daily travels. Let\'s make the journey to campus or work more budget-friendly and enjoyable. DM me to book your spot and let\'s navigate this together! ? #StudentRideShare #AffordableCommute',4,1),(28,'driver@conestogac.on.ca','Aug 17, 2023','8:0','? Attention all students in Waterloo, Kitchener, and Cambridge! ? If you\'re tired of long commutes and high transportation expenses, let\'s team up for a ride-sharing solution. I\'m a student with a car, and I\'m here to offer convenient and cost-effective rides for your daily journeys. Whether it\'s classes, study sessions, or simply exploring the area, let\'s make the most of our resources. Shoot me a message and let\'s ride smarter together! ? #RideSmartStudents #ShareTheJourney',4,1),(29,'driver@conestogac.on.ca','Aug 18, 2023','10:0','Calling all my fellow students! ? If you\'re tired of the usual public transit grind, let\'s make commuting fun and affordable. I\'m a student with wheels, and I\'m opening up my car for ride-sharing adventures in the Waterloo Kitchener Cambridge region. Let\'s tackle traffic together, split costs, and have great conversations along the way. Slide into my DMs, and let\'s make every ride count! ?? #StudentCarPool #CommuteWithFriends',4,1),(30,'driver@conestogac.on.ca','Aug 14, 2023','18:0','?️ Student Ride Share Alert! ? Ready to make your daily commute smoother and lighter on the wallet? Look no further! I\'m a fellow student driving around the Waterloo Kitchener Cambridge area and offering ride-sharing options. With fixed and affordable rates, we can conquer traffic while splitting costs. Let\'s turn the mundane commute into a chance to connect and save. Drop me a line to hop on board! ?? #StudentRideSaver #AffordableTravel',4,1),(31,'driver@conestogac.on.ca','Aug 21, 2023','18:0','Hey, students of Waterloo, Kitchener, and Cambridge! ? Let\'s beat the rush and share some wheels. I\'m a student who\'s all about reducing the hassle of commuting. Offering ride-sharing options that are not only convenient but also budget-friendly. Whether it\'s a daily grind or a weekend adventure, let\'s navigate the roads together. Shoot me a message, and let\'s make travel better for everyone! ?? #StudentCarCompanion #CommuteTogether',4,1),(32,'driver@conestogac.on.ca','Aug 23, 2023','15:35','? Budget-Friendly Travel in KWC ?\nTraveling in Kitchener Waterloo Cambridge has never been this affordable! Our rides come with fixed prices, ensuring you get where you need to go without straining your wallet. Reliable, comfortable, and easy on the pocket – that\'s the way to travel! ? #BudgetTravelKWC #AffordableTransit',4,1);
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
INSERT INTO `survey` VALUES (132,'driver@conestogac.on.ca','I spend more than 30 minutes commuting to college each way.','True',1),(133,'driver@conestogac.on.ca','Which mode of transportation do you primarily use for your commute to college?','Public Transportation (Bus/Train)',1),(134,'driver@conestogac.on.ca','What are the main challenges you face during your commute to college?','dummy answer 3',1),(135,'driver@conestogac.on.ca','I have missed classes due to transportation issues.','True',1),(136,'driver@conestogac.on.ca','How often do you encounter traffic congestion during your commute to college?','Rarely',1),(137,'driver@conestogac.on.ca','Have you ever considered carpooling or ridesharing as a solution to your commuting challenges? Why or why not?','dummy answer 6',1),(138,'driver@conestogac.on.ca','I find the cost of transportation to college a financial burden.','True',1),(139,'driver@conestogac.on.ca','What improvements or solutions would you like to see in transportation options for commuting to college?','More frequent public transportation schedules',1),(140,'driver@conestogac.on.ca','Any other concern(s)','dummy answer 9',1),(141,'driver@conestogac.on.ca','I spend more than 30 minutes commuting to college each way.','True',2),(142,'driver@conestogac.on.ca','Which mode of transportation do you primarily use for your commute to college?','Public Transportation (Bus/Train)',2),(143,'driver@conestogac.on.ca','What are the main challenges you face during your commute to college?','dummy answer 3',2),(144,'driver@conestogac.on.ca','I have missed classes due to transportation issues.','True',2),(145,'driver@conestogac.on.ca','How often do you encounter traffic congestion during your commute to college?','Rarely',2),(146,'driver@conestogac.on.ca','Have you ever considered carpooling or ridesharing as a solution to your commuting challenges? Why or why not?','dummy answer 6',2),(147,'driver@conestogac.on.ca','I find the cost of transportation to college a financial burden.','True',2),(148,'driver@conestogac.on.ca','What improvements or solutions would you like to see in transportation options for commuting to college?','More frequent public transportation schedules',2),(149,'driver@conestogac.on.ca','Any other concern(s)','dummy answer 9',2),(150,'driver@conestogac.on.ca','I spend more than 30 minutes commuting to college each way.','True',3),(151,'driver@conestogac.on.ca','Which mode of transportation do you primarily use for your commute to college?','Public Transportation (Bus/Train)',3),(152,'driver@conestogac.on.ca','What are the main challenges you face during your commute to college?','dummy answer 3',3),(153,'driver@conestogac.on.ca','I have missed classes due to transportation issues.','True',3),(154,'driver@conestogac.on.ca','How often do you encounter traffic congestion during your commute to college?','Rarely',3),(155,'driver@conestogac.on.ca','Have you ever considered carpooling or ridesharing as a solution to your commuting challenges? Why or why not?','dummy answer 6',3),(156,'driver@conestogac.on.ca','I find the cost of transportation to college a financial burden.','True',3),(157,'driver@conestogac.on.ca','What improvements or solutions would you like to see in transportation options for commuting to college?','More frequent public transportation schedules',3),(158,'driver@conestogac.on.ca','Any other concern(s)','dummy answer 9',3);
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
INSERT INTO `user` VALUES ('driver@conestogac.on.ca','abc@123',1,'Parwinder','Singh','What is your favorite movie?','fast and furious','Conestoga','Waterloo','Mobile Solutions Development',NULL,'4565436545'),('john@conestogac.on.ca','abc@123',1,'John','Srey','What is your mother\'s maiden name?','Hello World','Conestoga','Waterloo','Mobile Solutions Development',NULL,'2269876756'),('kelly@conestogac.on.ca','abc@123',1,'Kelly','Tim','What is your mother\'s maiden name?','Hello World','Conestoga','Waterloo','Mobile Solutions Development',NULL,'2269876756'),('other_rider@conestogac.on.ca','abc@123',1,'Parabhjot','Kaur','What is your mother\'s maiden name?','Hello World','Conestoga','Waterloo','Mobile Solutions Development',NULL,'2269786166'),('rider@conestogac.on.ca','abc@123',1,'Chaitanya','Bhargav','What is your favorite color?','Black','Conestoga','Waterloo','Mobile Solutions Development',NULL,'2269786165'),('sandeep@conestogac.on.ca','Hello',1,'Sandeep','Kaur','What is your mother\'s maiden name?','Hello World','Conestoga','Waterloo','Mobile Solutions Development',NULL,'2269876756');
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

-- Dump completed on 2023-08-08 10:33:34
