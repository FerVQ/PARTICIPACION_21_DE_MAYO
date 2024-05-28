/*
 Navicat Premium Data Transfer

 Source Server         : LOCAL
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : bd_ventas

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 28/05/2024 16:12:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `correo` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `celular` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (2, 'Calef Benito', 'benitef@mail.org', '70012345');
INSERT INTO `clientes` VALUES (5, 'Juan Carlos Arce', 'conejo@mail.com', '71512345');
INSERT INTO `clientes` VALUES (6, 'Halee Kirby', 'tiam@tempor.com', '72012345');
INSERT INTO `clientes` VALUES (7, 'Marco Perez', 'marco@mail.com', '71526789');
INSERT INTO `clientes` VALUES (8, 'Pedro Marquez', 'peter@mail.com', '72054578');
INSERT INTO `clientes` VALUES (9, 'Juan de Arco', 'juanita@mail.com', '77112456');
INSERT INTO `clientes` VALUES (10, 'Luis Callejas', 'lucho@mial.com', '77122456');
INSERT INTO `clientes` VALUES (18, 'Jose Manuel', 'manuel@mail.com', '73636364');

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `precio` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (1, 'iPhone 4s', 'Que viene desde Apple', 200);
INSERT INTO `productos` VALUES (2, 'iPhone 5', 'iPhone 5 from Apple', 150);
INSERT INTO `productos` VALUES (3, 'iPhone 5s', 'iPhone 5s is too expensive.', 300.8);
INSERT INTO `productos` VALUES (4, 'iPad Air', 'iPad Air is thin like samurai!', 250);
INSERT INTO `productos` VALUES (5, 'HTC One', 'Best of 2013', 250);
INSERT INTO `productos` VALUES (6, 'God', 'God is not on sale. Sorry.', 132);
INSERT INTO `productos` VALUES (7, 'Lenovo 2020', 'This sword is so sharp that it can slice itself. Good for slicing jellies.', 2000);
INSERT INTO `productos` VALUES (8, 'Latitude e6420', 'Built by ultimate killing machines. For ultimate killing hobies.', 50);
INSERT INTO `productos` VALUES (9, 'Toshiba xd456', 'This jacket could save you from heart attack. And maybe heartbreaks.', 50000);
INSERT INTO `productos` VALUES (10, 'Dell vostro 456', 'This helps you brighten things in the dark.', 650);
INSERT INTO `productos` VALUES (72, 'iPhone 5', 'iPhone 5 from Apple', 120);

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `apellidos` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `correo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (1, 'Admin', 'Istrador', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `usuarios` VALUES (2, 'Bruno', 'Diaz', 'bruno@gmail.com', 'e3928a3bc4be46516aa33a79bbdfdb08');
INSERT INTO `usuarios` VALUES (3, 'Fernando', 'Villca', 'fernandovq@gmail.com', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `usuarios` VALUES (4, 'Emanuel', 'Vargas', 'emanuel@gmail.com', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `usuarios` VALUES (5, 'Sharel', 'Vargas', 'sharel@gmail.com', '21232f297a57a5a743894a0e4a801fc3');

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ventas
-- ----------------------------
INSERT INTO `ventas` VALUES (2, 10, 5, '2018-01-08');
INSERT INTO `ventas` VALUES (4, 7, 2, '2014-07-08');
INSERT INTO `ventas` VALUES (5, 5, 8, '2019-05-07');
INSERT INTO `ventas` VALUES (15, 72, 10, '2021-05-18');
INSERT INTO `ventas` VALUES (16, 1, 2, '2023-06-10');

SET FOREIGN_KEY_CHECKS = 1;
