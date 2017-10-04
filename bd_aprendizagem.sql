-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_aprendizagem
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_alunos`
--

DROP TABLE IF EXISTS `tb_alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_alunos` (
  `codaluno` int(11) NOT NULL AUTO_INCREMENT,
  `ra` varchar(20) DEFAULT NULL,
  `tb_usuarios_codusuario` int(11) NOT NULL,
  `tb_realizaravaliacao_codrealizaravaliacao` int(11) NOT NULL,
  `tb_realizaravaliacao_tb_avaliacoes_codavaliacao` int(11) NOT NULL,
  PRIMARY KEY (`codaluno`,`tb_usuarios_codusuario`,`tb_realizaravaliacao_codrealizaravaliacao`,`tb_realizaravaliacao_tb_avaliacoes_codavaliacao`),
  KEY `fk_tb_alunos_tb_usuarios1_idx` (`tb_usuarios_codusuario`),
  KEY `fk_tb_alunos_tb_realizaravaliacao1_idx` (`tb_realizaravaliacao_codrealizaravaliacao`,`tb_realizaravaliacao_tb_avaliacoes_codavaliacao`),
  CONSTRAINT `fk_tb_alunos_tb_realizaravaliacao1` FOREIGN KEY (`tb_realizaravaliacao_codrealizaravaliacao`, `tb_realizaravaliacao_tb_avaliacoes_codavaliacao`) REFERENCES `tb_realizaravaliacao` (`codrealizaravaliacao`, `tb_avaliacoes_codavaliacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_alunos_tb_usuarios1` FOREIGN KEY (`tb_usuarios_codusuario`) REFERENCES `tb_usuarios` (`codusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_alunos`
--

LOCK TABLES `tb_alunos` WRITE;
/*!40000 ALTER TABLE `tb_alunos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_avaliacoes`
--

DROP TABLE IF EXISTS `tb_avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_avaliacoes` (
  `codavaliacao` int(11) NOT NULL AUTO_INCREMENT,
  `perguntas` text,
  `alternativa_a` varchar(2000) DEFAULT NULL,
  `alternativa_b` varchar(2000) DEFAULT NULL,
  `alternativa_c` varchar(2000) DEFAULT NULL,
  `alternativa_d` varchar(2000) DEFAULT NULL,
  `correta` char(1) DEFAULT NULL,
  `tb_materias_codmateria` int(11) NOT NULL,
  PRIMARY KEY (`codavaliacao`,`tb_materias_codmateria`),
  KEY `fk_tb_avaliacoes_tb_materias1_idx` (`tb_materias_codmateria`),
  CONSTRAINT `fk_tb_avaliacoes_tb_materias1` FOREIGN KEY (`tb_materias_codmateria`) REFERENCES `tb_materias` (`codmateria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_avaliacoes`
--

LOCK TABLES `tb_avaliacoes` WRITE;
/*!40000 ALTER TABLE `tb_avaliacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_avaliacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_disciplinas`
--

DROP TABLE IF EXISTS `tb_disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_disciplinas` (
  `coddisciplinas` int(11) NOT NULL AUTO_INCREMENT,
  `nomedisciplina` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`coddisciplinas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_disciplinas`
--

LOCK TABLES `tb_disciplinas` WRITE;
/*!40000 ALTER TABLE `tb_disciplinas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_disciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_materias`
--

DROP TABLE IF EXISTS `tb_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_materias` (
  `codmateria` int(11) NOT NULL AUTO_INCREMENT,
  `anomateria` int(11) DEFAULT NULL,
  `conteudo` text,
  `tb_disciplinas_coddisciplinas` int(11) NOT NULL,
  PRIMARY KEY (`codmateria`,`tb_disciplinas_coddisciplinas`),
  KEY `fk_tb_materias_tb_disciplinas1_idx` (`tb_disciplinas_coddisciplinas`),
  CONSTRAINT `fk_tb_materias_tb_disciplinas1` FOREIGN KEY (`tb_disciplinas_coddisciplinas`) REFERENCES `tb_disciplinas` (`coddisciplinas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_materias`
--

LOCK TABLES `tb_materias` WRITE;
/*!40000 ALTER TABLE `tb_materias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_realizaravaliacao`
--

DROP TABLE IF EXISTS `tb_realizaravaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_realizaravaliacao` (
  `codrealizaravaliacao` int(11) NOT NULL AUTO_INCREMENT,
  `nota` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `tb_avaliacoes_codavaliacao` int(11) NOT NULL,
  PRIMARY KEY (`codrealizaravaliacao`,`tb_avaliacoes_codavaliacao`),
  KEY `fk_tb_realizaravaliacao_tb_avaliacoes1_idx` (`tb_avaliacoes_codavaliacao`),
  CONSTRAINT `fk_tb_realizaravaliacao_tb_avaliacoes1` FOREIGN KEY (`tb_avaliacoes_codavaliacao`) REFERENCES `tb_avaliacoes` (`codavaliacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_realizaravaliacao`
--

LOCK TABLES `tb_realizaravaliacao` WRITE;
/*!40000 ALTER TABLE `tb_realizaravaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_realizaravaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuarios` (
  `codusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `senha` varchar(10) DEFAULT NULL,
  `tipousuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios`
--

LOCK TABLES `tb_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-24 11:22:46
