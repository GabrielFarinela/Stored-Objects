CREATE DATABASE  IF NOT EXISTS `atividade4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `atividade4`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: atividade4
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `amizade`
--

DROP TABLE IF EXISTS `amizade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amizade` (
  `leitor1_id` int DEFAULT NULL,
  `leitor2_id` int DEFAULT NULL,
  KEY `amizade_leitores1_fk` (`leitor1_id`),
  KEY `amizade_leitores2_fk` (`leitor2_id`),
  CONSTRAINT `amizade_leitores1_fk` FOREIGN KEY (`leitor1_id`) REFERENCES `leitores` (`leitor_id`),
  CONSTRAINT `amizade_leitores2_fk` FOREIGN KEY (`leitor2_id`) REFERENCES `leitores` (`leitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amizade`
--

LOCK TABLES `amizade` WRITE;
/*!40000 ALTER TABLE `amizade` DISABLE KEYS */;
/*!40000 ALTER TABLE `amizade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `autor_id` int NOT NULL AUTO_INCREMENT,
  `nome_autor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`autor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Poipur Losio'),(2,'Gahur Dafa'),(3,'Huplor Zaley'),(4,'Bomun Zyure');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca` (
  `biblioteca_id` int NOT NULL,
  `livro_id` int DEFAULT NULL,
  `leitor_id` int DEFAULT NULL,
  PRIMARY KEY (`biblioteca_id`),
  KEY `biblioteca_livros_fk` (`livro_id`),
  KEY `biblioteca_leitores_fk` (`leitor_id`),
  CONSTRAINT `biblioteca_leitores_fk` FOREIGN KEY (`leitor_id`) REFERENCES `leitores` (`leitor_id`),
  CONSTRAINT `biblioteca_livros_fk` FOREIGN KEY (`livro_id`) REFERENCES `livros` (`livro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitores`
--

DROP TABLE IF EXISTS `leitores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitores` (
  `leitor_id` int NOT NULL AUTO_INCREMENT,
  `nome_leitor` varchar(100) NOT NULL,
  `idade` int DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`leitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitores`
--

LOCK TABLES `leitores` WRITE;
/*!40000 ALTER TABLE `leitores` DISABLE KEYS */;
INSERT INTO `leitores` VALUES (1,'Gabriel Farinela',21,'gabriel@gmail.com'),(2,'Guilherme Farinela',21,'guilherme@gmail.com'),(3,'Tailine Farinela',28,'tai@gmail.com'),(4,'Amarildo Farinela',61,'amarildo@gmail.com');
/*!40000 ALTER TABLE `leitores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitura`
--

DROP TABLE IF EXISTS `leitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitura` (
  `classificacao_leitura` varchar(100) DEFAULT NULL,
  `leitor_id` int DEFAULT NULL,
  `livro_id` int DEFAULT NULL,
  KEY `leitura_leitores_fk` (`leitor_id`),
  KEY `leitura_livros_fk` (`livro_id`),
  CONSTRAINT `leitura_leitores_fk` FOREIGN KEY (`leitor_id`) REFERENCES `leitores` (`leitor_id`),
  CONSTRAINT `leitura_livros_fk` FOREIGN KEY (`livro_id`) REFERENCES `livros` (`livro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitura`
--

LOCK TABLES `leitura` WRITE;
/*!40000 ALTER TABLE `leitura` DISABLE KEYS */;
INSERT INTO `leitura` VALUES ('Boa',NULL,NULL),('Regular',NULL,NULL),('Otima',NULL,NULL),('Ruim',NULL,NULL);
/*!40000 ALTER TABLE `leitura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `livro_id` int NOT NULL AUTO_INCREMENT,
  `titulo_livro` varchar(100) NOT NULL,
  `editora` varchar(100) DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `leitor_id` int DEFAULT NULL,
  `autor_id` int DEFAULT NULL,
  PRIMARY KEY (`livro_id`),
  KEY `livros_leitores_fk` (`leitor_id`),
  KEY `livros_autor_fk` (`autor_id`),
  CONSTRAINT `livros_autor_fk` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`autor_id`),
  CONSTRAINT `livros_leitores_fk` FOREIGN KEY (`leitor_id`) REFERENCES `leitores` (`leitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (1,'A Glória dos Romanos','Copec','2000-09-23',NULL,NULL),(2,'Percy Jackson','Copec','2002-12-15',NULL,NULL),(3,'Devs na Prática','Copec','2010-04-03',NULL,NULL),(4,'O esquadrão','Copec','2021-05-10',NULL,NULL);
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'atividade4'
--

--
-- Dumping routines for database 'atividade4'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-11 15:18:28
