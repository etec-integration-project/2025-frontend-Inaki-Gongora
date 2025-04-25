-- MySQL dump 10.13  Distrib 9.3.0, for macos15.4 (arm64)
--
-- Host: localhost    Database: Zephyr
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `carrito_productos`
--

DROP TABLE IF EXISTS `carrito_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carrito_id` varchar(36) DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carrito_id` (`carrito_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `carrito_productos_ibfk_1` FOREIGN KEY (`carrito_id`) REFERENCES `carritos` (`id`),
  CONSTRAINT `carrito_productos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_productos`
--

LOCK TABLES `carrito_productos` WRITE;
/*!40000 ALTER TABLE `carrito_productos` DISABLE KEYS */;
INSERT INTO `carrito_productos` VALUES (9,'24103ccf-71f6-4b0f-9f67-7071b799af56',30,1),(10,'24103ccf-71f6-4b0f-9f67-7071b799af56',8,1),(72,'54543635-747a-49c9-b7cf-72976e64af87',8,1);
/*!40000 ALTER TABLE `carrito_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritos`
--

DROP TABLE IF EXISTS `carritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritos` (
  `id` varchar(36) NOT NULL,
  `usuario_id` int NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `carritos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritos`
--

LOCK TABLES `carritos` WRITE;
/*!40000 ALTER TABLE `carritos` DISABLE KEYS */;
INSERT INTO `carritos` VALUES ('032ab383-5b35-4ca8-81c0-7daf35077845',14,'activo','2024-11-20 14:10:28','2024-11-20 14:10:28'),('24103ccf-71f6-4b0f-9f67-7071b799af56',12,'activo','2024-11-16 14:21:36','2024-11-16 14:21:36'),('29b606d2-5a8e-49a3-b05c-f593c9d8f6f2',13,'activo','2024-11-20 10:57:44','2024-11-20 10:57:44'),('54543635-747a-49c9-b7cf-72976e64af87',4,'activo','2024-11-16 01:05:55','2024-11-16 01:05:55'),('5b37b219-8a37-4f0d-b19a-a4be915c55ea',15,'activo','2024-11-20 14:26:45','2024-11-20 14:26:45'),('f90c642f-f2a7-4168-a0ee-98cc3f981510',16,'activo','2025-03-30 14:14:04','2025-03-30 14:14:04');
/*!40000 ALTER TABLE `carritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Aros pequeños','Categoría de aros'),(2,'Aros pequeños','Categoría de aros');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `tipo` enum('anillo','aro') DEFAULT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `categoria_id` int DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `peso` int DEFAULT NULL,
  `talla` varchar(10) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `disponibilidad` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (8,'Destello de Plata','anillo','Anillo de plata con cristales finamente incrustados.',430.00,2,'Plata','Plateado',50,'9','/images/an1.png',1),(9,'Luna Rosa','anillo','Anillo de bronce con cristales color rosa pálido.',600.00,2,'Bronce','Rosado',30,'6','/images/an2.png',1),(10,'Esplendor Blanco','anillo','Anillo de plata con un diamante blanco brillante.',900.00,2,'Plata','Blanco',70,'11','/images/an3.png',1),(11,'Luz Dorada','anillo','Anillo de oro adornado con diamantes relucientes.',1400.00,2,'Oro','Dorado',30,'8','/images/an4.png',1),(12,'Brisa Celeste','anillo','Anillo de plata con bellos diamantes celestes incrustados.',3400.00,2,'Plata','Plateado',80,'10','/images/an5.png',1),(13,'Rosal Místico','anillo','Anillo de plata con bellos diamantes rosas incrustados.',3200.00,2,'Plata','Plateado',90,'10','/images/an6.png',1),(14,'Oceano Blanco','anillo','Anillo de plata con bellos cristales marinos blancos.',4000.00,2,'Plata','Plateado',40,'7','/images/an7.png',1),(15,'Brillo Puro','anillo','Anillo de plata con diamantes blancos incrustados.',2300.00,2,'Plata','Plateado',50,'10','/images/an8.png',1),(16,'Esencia de Plata','anillo','Anillo de plata fino con gran diamante blanco incrustado.',1200.00,2,'Plata','Plateado',70,'12','/images/an9.png',1),(17,'Bronce Real','anillo','Anillo de bronce con gran diamante blanco incrustado.',3000.00,2,'Bronce','Bronce',30,'5','/images/an10.png',1),(28,'Brillo Lunar','aro','Aros de plata inspirados en la luz de la luna, con cristales finamente incrustados.',480.00,2,'Plata','Plateado',30,'7','/images/ar1.png',1),(29,'Eco Brillante','aro','Aros elegantes de plata con acabado pulido, reflejando un brillo sofisticado.',550.00,2,'Plata','Plateado',35,'8','/images/ar2.png',1),(30,'Amanecer Luminoso','aro','Aros de plata con delicados destellos que evocan la luz del amanecer.',620.00,2,'Plata','Plateado',25,'6','/images/ar3.png',1),(31,'Mar Espejado','aro','Aros de plata con detalles brillantes que recuerdan las aguas del océano.',700.00,2,'Plata','Plateado',28,'5','/images/ar4.png',1),(32,'Aurora de Cristal','aro','Aros de plata adornados con cristales, brillando como una aurora boreal.',900.00,2,'Plata','Plateado',40,'9','/images/ar5.png',1),(33,'Luz Rosada','aro','Aros finos de oro rosa con un diseño clásico y atemporal, perfecto para toda ocasión.',480.00,2,'Oro','Oro rosa',20,'7','/images/ar6.png',1),(34,'Cielo Nocturno','aro','Aros de plata inspirados en el cielo nocturno, con destellos de estrellas.',650.00,2,'Plata','Plateado',36,'10','/images/ar7.png',1),(35,'Rocío de Cristal','aro','Aros de plata con pequeños cristales que imitan gotas de rocío al amanecer.',720.00,2,'Plata','Plateado',32,'8','/images/ar8.png',1),(36,'Esplendor Infinito','aro','Aros de plata con diseño pulido que captura la luz de todos los ángulos.',860.00,2,'Plata','Plateado',50,'6','/images/ar9.png',1),(37,'Brisa Serena','aro','Aros de plata livianos, con una elegancia sutil y brillo natural.',540.00,2,'Plata','Plateado',22,'7','/images/ar10.png',1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `direccion` text,
  `telefono` varchar(20) DEFAULT NULL,
  `rol` enum('usuario','admin') DEFAULT 'usuario',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (4,'Ulises','u@d','$2b$10$GkMPj8JR3DabFzlpXmCRiOzkhzw0Akc.MD24mjK/DdQiYQVrLoqPm','aaaa','1111','usuario'),(12,'iñaki gongora','i@g','$2b$10$.7IyoUxQo8bit1aGx.x4j.bBA2fcdSwATaNfEq0/cVYIPXoqnx7lS','r','421','usuario'),(13,'John','n@nq','$2b$10$UfOGcFaS22TAV0iIqJgviO8xftxUHP.yUWWITRgeWxKWPVGweLboy','b','j','usuario'),(14,'Iñaki Gongora','pruebq@a','$2b$10$wmcZAlcWlGQqmx0JjbyyrOM0wKrYQ/ERMr9fPmJg8Py4UvpfDhCrW','pop','5888','usuario'),(15,'Iñaki Gongora','i@gmail.com','$2b$10$cxN0PX2/juLqFQLf/4DoF.QQhfUPN3Y3gHspLeqjY7dhy/s0.tEb2','hola','5753','usuario'),(16,'prueba','p@gmail.com','$2b$10$Ael9rp7o1GvdcO2vrZNH/OJLAVM0N1yBYDtVBR63theXKvTWW4KvO','kkk','1212','usuario');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('pendiente','enviado','entregado','cancelado') DEFAULT 'pendiente',
  `total` decimal(10,2) NOT NULL,
  `direccion_envio` text,
  `metodo_pago` enum('tarjeta_credito','paypal','transferencia') NOT NULL,
  `numero_transaccion` varchar(255) DEFAULT NULL,
  `comentarios` text,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_productos`
--

DROP TABLE IF EXISTS `ventas_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_productos` (
  `venta_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`venta_id`,`producto_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `ventas_productos_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`),
  CONSTRAINT `ventas_productos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_productos`
--

LOCK TABLES `ventas_productos` WRITE;
/*!40000 ALTER TABLE `ventas_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas_productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-22  9:33:40
