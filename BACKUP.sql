-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: orgdb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `CATALOGO_DEDUCCIONESOBRERO`
--

DROP TABLE IF EXISTS `CATALOGO_DEDUCCIONESOBRERO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATALOGO_DEDUCCIONESOBRERO` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `CCSS` double NOT NULL,
  `BANCOPOPULAR` double NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATALOGO_DEDUCCIONESOBRERO`
--

LOCK TABLES `CATALOGO_DEDUCCIONESOBRERO` WRITE;
/*!40000 ALTER TABLE `CATALOGO_DEDUCCIONESOBRERO` DISABLE KEYS */;
INSERT INTO `CATALOGO_DEDUCCIONESOBRERO` VALUES (1,'2023-04-26',8,1);
/*!40000 ALTER TABLE `CATALOGO_DEDUCCIONESOBRERO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATALOGO_DEDUCCIONESPATRONALES`
--

DROP TABLE IF EXISTS `CATALOGO_DEDUCCIONESPATRONALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATALOGO_DEDUCCIONESPATRONALES` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `CCSS` double NOT NULL,
  `Aguinaldo` double NOT NULL,
  `Cesantia` double NOT NULL,
  `Vacaciones` double NOT NULL,
  `INS` double NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATALOGO_DEDUCCIONESPATRONALES`
--

LOCK TABLES `CATALOGO_DEDUCCIONESPATRONALES` WRITE;
/*!40000 ALTER TABLE `CATALOGO_DEDUCCIONESPATRONALES` DISABLE KEYS */;
INSERT INTO `CATALOGO_DEDUCCIONESPATRONALES` VALUES (1,'2023-04-26',24,8.33,6.33,4.16,1.5);
/*!40000 ALTER TABLE `CATALOGO_DEDUCCIONESPATRONALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATALOGO_IMPUESTORENTA`
--

DROP TABLE IF EXISTS `CATALOGO_IMPUESTORENTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATALOGO_IMPUESTORENTA` (
  `Concepto` varchar(64) NOT NULL,
  `Porcentaje` double NOT NULL,
  `Limite_Inferior` double NOT NULL,
  `Limite_Superior` double NOT NULL,
  PRIMARY KEY (`Concepto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATALOGO_IMPUESTORENTA`
--

LOCK TABLES `CATALOGO_IMPUESTORENTA` WRITE;
/*!40000 ALTER TABLE `CATALOGO_IMPUESTORENTA` DISABLE KEYS */;
INSERT INTO `CATALOGO_IMPUESTORENTA` VALUES ('10%',0.1,863001,1233000),('15%',0.15,1233001,2223000),('20%',0.2,2223001,4445000),('25%',0.25,4445001,999999999999),('Exento',0,0,863000);
/*!40000 ALTER TABLE `CATALOGO_IMPUESTORENTA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEDUCCIONESOBREROS`
--

DROP TABLE IF EXISTS `DEDUCCIONESOBREROS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEDUCCIONESOBREROS` (
  `FECHA` date NOT NULL,
  `CEDULA` int NOT NULL,
  `CCSS` double NOT NULL,
  `BANCOPOPULAR` double NOT NULL,
  `ASOCIACIONSOLIDARISTA` double DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`FECHA`,`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEDUCCIONESOBREROS`
--

LOCK TABLES `DEDUCCIONESOBREROS` WRITE;
/*!40000 ALTER TABLE `DEDUCCIONESOBREROS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DEDUCCIONESOBREROS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEDUCCIONESPATRONALES`
--

DROP TABLE IF EXISTS `DEDUCCIONESPATRONALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEDUCCIONESPATRONALES` (
  `FECHA` date NOT NULL,
  `CEDULA` int NOT NULL,
  `CCSS` double NOT NULL,
  `AGUINALDO` double NOT NULL,
  `CESANTIA` double NOT NULL,
  `VACACIONES` double NOT NULL,
  `RIESGOTRABAJOINS` double NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`FECHA`,`CEDULA`),
  KEY `DEDUCCIONESPATRONALES_EMPLEADO_idx` (`CEDULA`),
  CONSTRAINT `DEDUCCIONESPATRONALES_EMPLEADO` FOREIGN KEY (`CEDULA`) REFERENCES `EMPLEADOS` (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEDUCCIONESPATRONALES`
--

LOCK TABLES `DEDUCCIONESPATRONALES` WRITE;
/*!40000 ALTER TABLE `DEDUCCIONESPATRONALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `DEDUCCIONESPATRONALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLEADOS`
--

DROP TABLE IF EXISTS `EMPLEADOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLEADOS` (
  `CEDULA` int NOT NULL,
  `ISACTIVE` tinyint NOT NULL,
  `NOMBRE` char(45) NOT NULL,
  `APELLIDO1` char(45) NOT NULL,
  `APELLIDO2` char(45) NOT NULL,
  `SALARIO` double NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLEADOS`
--

LOCK TABLES `EMPLEADOS` WRITE;
/*!40000 ALTER TABLE `EMPLEADOS` DISABLE KEYS */;
INSERT INTO `EMPLEADOS` VALUES (208210911,1,'Nombre39','Apellido15','Apellido28',1500000,NULL,NULL),(208210921,1,'Nombre68','Apellido140','Apellido295',560000,NULL,NULL),(208210922,1,'Nombre24','Apellido120','Apellido229',2100000,NULL,NULL),(208210923,1,'Nombre30','Apellido168','Apellido251',1100000,NULL,NULL),(208210932,1,'Nombre84','Apellido154','Apellido221',863000,NULL,NULL),(208210943,1,'Nombre91','Apellido176','Apellido28',870000,NULL,NULL),(208210945,1,'Nombre46','Apellido141','Apellido268',1233000,NULL,NULL),(208210955,1,'Nombre55','Apellido164','Apellido254',3800000,NULL,NULL),(208210965,1,'Nombre20','Apellido184','Apellido258',1300000,NULL,NULL),(208210966,1,'Nombre80','Apellido181','Apellido267',5000000,NULL,NULL);
/*!40000 ALTER TABLE `EMPLEADOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTICIPACIONAS`
--

DROP TABLE IF EXISTS `PARTICIPACIONAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARTICIPACIONAS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CEDULA` int NOT NULL,
  `PORCENTAGE` tinyint NOT NULL,
  PRIMARY KEY (`ID`,`CEDULA`),
  KEY `PARTICIPACION_EMPLEADO_idx` (`CEDULA`),
  CONSTRAINT `PARTICIPACION_EMPLEADO` FOREIGN KEY (`CEDULA`) REFERENCES `EMPLEADOS` (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTICIPACIONAS`
--

LOCK TABLES `PARTICIPACIONAS` WRITE;
/*!40000 ALTER TABLE `PARTICIPACIONAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTICIPACIONAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLANILLAEMPLEADOS`
--

DROP TABLE IF EXISTS `PLANILLAEMPLEADOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLANILLAEMPLEADOS` (
  `NPLANILLA` int NOT NULL AUTO_INCREMENT,
  `CEDULA` int NOT NULL,
  `DEDUCCIONESOBRERO` double NOT NULL,
  `DEDUCCIONESPATRONALES` double NOT NULL,
  `IMPUESTORENTASALARIO` double NOT NULL,
  `SALARIOBRUTO` double NOT NULL,
  `SALARIOTOTAL` double NOT NULL,
  `FECHA` date NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`NPLANILLA`),
  KEY `PLANILLA_EMPLEADO_idx` (`CEDULA`),
  CONSTRAINT `PLANILLA_EMPLEADO` FOREIGN KEY (`CEDULA`) REFERENCES `EMPLEADOS` (`CEDULA`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLANILLAEMPLEADOS`
--

LOCK TABLES `PLANILLAEMPLEADOS` WRITE;
/*!40000 ALTER TABLE `PLANILLAEMPLEADOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLANILLAEMPLEADOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'orgdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `calcular_impueso_renta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calcular_impueso_renta`(
	salario_bruto DOUBLE,
    OUT ir DOUBLE
)
BEGIN
	DECLARE impuesto_renta DOUBLE;
    
    IF salario_bruto <= 863000 THEN
		SET impuesto_renta = 0;
	ELSEIF salario_bruto <= 1233000 THEN
		SET impuesto_renta = (salario_bruto - 863000) * 0.10;
	ELSEIF salario_bruto <= 2223000 THEN
		SET impuesto_renta = (1233000 - 863000) * 0.10 + (salario_bruto - 1233000) * 0.15;
    ELSEIF salario_bruto <= 4445000 THEN
		SET impuesto_renta = (1233000 - 863000) * 0.10 + (2223000 - 1233000) * 0.15 + (salario_bruto - 2223000) * 0.20;
    ELSE
		SET impuesto_renta = (1233000 - 863000) * 0.10 + (2223000 - 1233000) * 0.15 + (4445000 - 2223000) * 0.20 + (salario_bruto - 4445000) * 0.25;
	END IF;
    
    SELECT impuesto_renta into ir;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calcular_impuesto_renta_iterativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`inclutec-db-admin`@`%` PROCEDURE `calcular_impuesto_renta_iterativo`()
BEGIN
	
    SET @i = 1;
	SET @n = (SELECT COUNT(*) FROM EMPLEADO);

	WHILE @i <= @n DO
		SET @salary = (SELECT SALARIO FROM EMPLEADO WHERE CEDULA = @i);
		CALL calcular_impueso_renta(@salary);
		SET @i = @i + 1;
	END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calcular_planilla` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calcular_planilla`()
BEGIN
	
    SET @i = 1;
	SET @n = (SELECT COUNT(*) FROM EMPLEADOS);

	WHILE @i <= @n DO
		SET @asp = (SELECT PORCENTAGE FROM PARTICIPACIONAS WHERE CEDULA = @i);
		SET @salary = (SELECT SALARIO FROM EMPLEADOS WHERE CEDULA = @i);
        -- obero 
        SET @ccsobrero = @salary * 8/100;
        SET @bpobrero = @salary * 1/100;
        SET @totalobrero = @ccsobrero + @bpobrero;
        INSERT INTO DEDUCCIONESOBREROS VALUES (CURDATE(),@i, @ccsobrero, @bpobrero, null, null, null);
        
        -- patronal
		set @csspatronal = @salary * 24/100;
        set @aguinaldo = @salary * 8.33/100;
        set @cesantia = @salary * 6.33/100;
        set @vacaciones = @salary * 4.16/100;
        set @ins = @salary * 1.5/100;
        SET @totalpatronal = @csspatronal + @aguinaldo + @cesantia + @vacaciones + @ins;
        INSERT INTO DEDUCCIONESPATRONALES VALUES (CURDATE(), @i, @csspatronal, @aguinaldo, @cesantia, @vacaciones, @ins, null, null);
        
        -- impuesto de renta al salario
        SET @ir = 0;
        CALL calcular_impueso_renta(@salary, @ir);
        SET @salariofinal = @salary - (@totalobrero + @ir);
        INSERT INTO PLANILLAEMPLEADOS VALUES (null, @i, @totalobrero, @totalpatronal, @ir, @salary, @salariofinal, CURDATE(), null, null);
		SET @i = @i + 1;
	END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calcular_planilla_mes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calcular_planilla_mes`(
    MES INT
)
BEGIN
    DECLARE cedula INT;
	DECLARE `_rollback` BOOL DEFAULT 0;
    -- Declare variables for the columns you want to fetch

    -- Select the rows to iterate over
    DECLARE cur CURSOR FOR SELECT E.CEDULA FROM orgdb.EMPLEADOS AS E WHERE E.CEDULA IS NOT NULL;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET cedula = NULL;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    -- Open the cursor
    OPEN cur;
	START TRANSACTION;
    -- Start iterating over the rows
    iterate_rows: LOOP
        -- Fetch the next row
        FETCH cur INTO cedula;

        -- Exit the loop if no more rows are found
        IF cedula IS NULL THEN
            LEAVE iterate_rows;
        END IF;

        -- Process the row
        -- Do something with the fetched values
        -- ...
        SET @asp = (SELECT PORCENTAGE FROM PARTICIPACIONAS WHERE CEDULA = cedula LIMIT 1);
        SET @salary = (SELECT SALARIO FROM EMPLEADOS WHERE CEDULA = cedula LIMIT 1);
        -- obero
        SET @ccsobrero = @salary * 8/100;
        SET @bpobrero = @salary * 1/100;
        SET @totalobrero = @ccsobrero + @bpobrero;
        INSERT INTO DEDUCCIONESOBREROS VALUES (DATE_ADD(MAKEDATE(YEAR(NOW()), 1), INTERVAL MES - 1 MONTH), cedula, @ccsobrero, @bpobrero, NULL, NULL, NULL);
		IF `_rollback` THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
        -- patronal
        SET @csspatronal = @salary * 24/100;
        SET @aguinaldo = @salary * 8.33/100;
        SET @cesantia = @salary * 6.33/100;
        SET @vacaciones = @salary * 4.16/100;
        SET @ins = @salary * 1.5/100;
        SET @totalpatronal = @csspatronal + @aguinaldo + @cesantia + @vacaciones + @ins;
        INSERT INTO DEDUCCIONESPATRONALES VALUES (DATE_ADD(MAKEDATE(YEAR(NOW()), 1), INTERVAL MES - 1 MONTH), cedula, @csspatronal, @aguinaldo, @cesantia, @vacaciones, @ins, NULL, NULL);
		IF `_rollback` THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
        -- impuesto de renta al salario
        SET @ir = 0;
        CALL orgdb.calcular_impueso_renta(@salary, @ir);
        SET @salariofinal = @salary - (@totalobrero + @ir);
        INSERT INTO PLANILLAEMPLEADOS VALUES (NULL, cedula, @totalobrero, @totalpatronal, @ir, @salary, @salariofinal, DATE_ADD(MAKEDATE(YEAR(NOW()), 1), INTERVAL MES - 1 MONTH), NULL, NULL);
		IF `_rollback` THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END LOOP;

    -- Close the cursor
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-29 17:12:32
