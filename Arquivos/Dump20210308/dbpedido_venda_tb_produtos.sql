-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbpedido_venda
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `tb_produtos`
--

DROP TABLE IF EXISTS `tb_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_produtos` (
  `CODIGO` varchar(13) NOT NULL,
  `DESCRICAO` varchar(60) DEFAULT NULL,
  `PRECO_VENDA` double DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produtos`
--

LOCK TABLES `tb_produtos` WRITE;
/*!40000 ALTER TABLE `tb_produtos` DISABLE KEYS */;
INSERT INTO `tb_produtos` VALUES ('0000000000001','MONTAGEM',15),('0000000000003','BALCAO LONDRES BRANCO C/FRUTA/ MARMORIZADO',52.5),('0000000000004','FRUTEIRA NOBRE BRANCO C/FRUTA / MARMORIZADO',40),('0000000000005','ACENTO KORINO PRETO',60),('0000000000006','BABY LIGHT D18 SELADO SM 0700X700X01400',145.35),('0000000000007','KIT ESPELHO ROUPEIRO PAMPULHA REF. 683 - ESPELHO',46),('0000000000008','KIT 6PTS PAMPULHA II REF. 683 PRETO/BRANCO/GEOMETRICO PTO',186),('0000000000009','KIT 6PTS PAMPULHA II REF. 683 PRETO/GRIGIO',186),('0000000000010','KIT 6PTS PAMPULHA II REF. 683 PRETO/CARVALHO',186),('0000000000011','KIT C/ 1 ESPELHO ROUP. COLORADO/FILADELFIA/MONT/PARD. IV -',20),('0000000000012','JG C/8 PES DE PLASTICO REF. 705 BRANCO',14),('0000000000013','JG C/8 PES DE PLASTICO REF. 705 CINZA',13),('0000000000014','JG C/8 PES DE PLASTICO REF. 705 TABACO',88.4),('0000000000015','DESPESAS COM FRETE',10),('0000000000016','EXPOSITOR DE COZINHA BRANCO (2444) BRANCO',339),('0000000000017','MESA ELEGANCE LAT MG BECHARA',215),('0000000000018','JG C/4 PES DE PLASTICO REF. 705 TABACO',44.2),('0000000000019','BANCADA TOPAZIO ATACAMA/PRETO',398.4),('0000000000020','MESA FOLHA C.MF BECHARA',25),('0000000000021','PAINEL AMETISTA ATACAMA/PRETO',181.9),('0000000000022','MESA ELEG CENTRO MF BECHARA',84),('0000000000023','DESPESAS COM MANUTEN��O',100),('0000000000024','MESA ELEGANCE LAT MF BECHARA',155.45),('0000000000025','ESTANTE ICARO MG BECHARA',69.8),('0000000000026','ESTANTE ICARO MF BECHARA',78.56),('0000000000027','FRUTEIRA TUBULAR',60),('0000000000028','CONJ C/4LUG TURB QUAD/RED',75),('0000000000029','MESA DIAMANTE P/ CHOCOLATE 1.55',88.4),('0000000000030','CADEIRA DIAMANTE P/CHOCOLATE/ASS.ENC.CHIN BR/MES',32),('0000000000031','PORTA TAUA STATUS ESP 4515 BCO/PRE',831.2);
/*!40000 ALTER TABLE `tb_produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-08  3:39:44
