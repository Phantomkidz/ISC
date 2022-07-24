/*
 Navicat Premium Data Transfer

 Source Server         : isc
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : isc

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 24/07/2022 17:19:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `od_id` int NOT NULL AUTO_INCREMENT,
  `o_id` int NOT NULL COMMENT 'FK order',
  `p_id` int NULL DEFAULT NULL COMMENT 'FK product',
  PRIMARY KEY (`od_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, 1, 3);
INSERT INTO `order_detail` VALUES (2, 1, 4);
INSERT INTO `order_detail` VALUES (3, 2, 5);
INSERT INTO `order_detail` VALUES (4, 4, 3);
INSERT INTO `order_detail` VALUES (5, 4, 4);
INSERT INTO `order_detail` VALUES (6, 4, 5);
INSERT INTO `order_detail` VALUES (7, 5, 3);
INSERT INTO `order_detail` VALUES (8, 5, 4);
INSERT INTO `order_detail` VALUES (9, 5, 5);
INSERT INTO `order_detail` VALUES (10, 6, 3);
INSERT INTO `order_detail` VALUES (11, 6, 4);
INSERT INTO `order_detail` VALUES (12, 6, 5);
INSERT INTO `order_detail` VALUES (16, 3, 3);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `o_id` int NOT NULL AUTO_INCREMENT,
  `o_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `o_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_date` datetime(0) NULL DEFAULT NULL,
  `end_date` datetime(0) NULL DEFAULT NULL,
  `paid_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`o_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '130/15', 'paid', '2022-07-23 16:05:54', '2022-07-25 16:05:57', '2022-07-23 16:58:22');
INSERT INTO `orders` VALUES (2, '99/3', 'completed', '2022-07-24 10:17:21', '2022-07-31 10:17:24', '2022-07-25 10:17:29');
INSERT INTO `orders` VALUES (3, '150/77', 'paid', '2022-07-23 16:05:54', '2022-07-25 16:05:57', '2022-07-23 16:58:22');
INSERT INTO `orders` VALUES (4, '15/3', 'place_order', '2022-07-23 16:05:54', '2022-07-25 16:05:57', NULL);
INSERT INTO `orders` VALUES (5, '15/3', 'place_order', '2022-07-23 16:05:54', '2022-07-25 16:05:57', NULL);
INSERT INTO `orders` VALUES (6, '15/3', 'place_order', '2022-07-23 16:05:54', '2022-07-25 16:05:57', '2022-07-23 16:58:22');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `p_style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `p_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `p_price` int NULL DEFAULT NULL,
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (3, 'Men', 'Plain Color / Red', 'XS', 400);
INSERT INTO `product` VALUES (4, 'Men', 'Plain Color / Red', 'S', 400);
INSERT INTO `product` VALUES (5, 'Men', 'Plain Color / Red', 'M', 420);
INSERT INTO `product` VALUES (6, 'Men', 'Plain Color / Red', 'L', 430);
INSERT INTO `product` VALUES (7, 'Men', 'Plain Color / Red', 'XL ', 450);
INSERT INTO `product` VALUES (8, 'Women', 'Plain Color / Black', 'XS', 290);
INSERT INTO `product` VALUES (9, 'Women', 'Plain Color / Black', 'S', 290);
INSERT INTO `product` VALUES (10, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (11, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (12, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (13, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (14, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (15, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (16, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (17, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (18, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (19, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (20, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (21, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (22, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (23, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (24, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (25, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (26, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (27, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (28, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (29, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (30, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (31, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (32, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (33, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (34, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (35, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (36, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (37, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (38, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (39, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (40, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (41, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (42, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (43, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (44, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (45, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (46, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (47, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (48, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (49, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (50, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (51, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (52, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (53, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (54, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (55, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (56, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (57, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (58, 'Men', 'Plain Color / Red', 'XL', 500);
INSERT INTO `product` VALUES (59, 'Men', 'Plain Color / Red', 'XL', 500);

SET FOREIGN_KEY_CHECKS = 1;
