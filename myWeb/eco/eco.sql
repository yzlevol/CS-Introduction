/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : eco

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 15/12/2023 13:14:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_address
-- ----------------------------
DROP TABLE IF EXISTS `account_address`;
CREATE TABLE `account_address`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ID',
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address_line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '楼宇',
  `address_line2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细',
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '校区',
  `delivery_instructions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `default` tinyint(1) NULL DEFAULT NULL COMMENT '是否为默认地址\r\n',
  `customer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ODer的编号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_address
-- ----------------------------
INSERT INTO `account_address` VALUES ('f135d02ec05e407aae84e6644b973248', 'test', '12345678912', '1', '同济大学', '2', '四平路', '', '2023-12-07 14:46:53.448158', '2023-12-07 14:46:53.448158', 1, '1');
INSERT INTO `account_address` VALUES ('6f294254755b49f99917c98a28ad843e', '校园咸鱼', '12345678913', '203', '西南一', '203', '四平', '', '2023-12-12 21:06:14.662255', '2023-12-14 21:44:20.732919', 1, '4');
INSERT INTO `account_address` VALUES ('7b626515a5ad497490782d2363d3a6ea', '校园咸鱼', '12345678913', '101', '友园', '101', '嘉定', '', '2023-12-12 21:11:32.107933', '2023-12-12 21:11:32.107933', 0, '4');
INSERT INTO `account_address` VALUES ('ec1b4fe1c2124d30b63c018f2b7a1d7e', '校园咸鱼', '12345678913', NULL, '西北五', '101', '四平', '', '2023-12-12 21:18:37.959630', '2023-12-12 21:18:37.959630', 0, '4');
INSERT INTO `account_address` VALUES ('cb4b55d3fff043a1b662833f9a26e03c', '微风不噪', '12345678910', NULL, '某宿舍', '222', '嘉定', '', '2023-12-15 00:18:36.779621', '2023-12-15 00:18:36.779621', 1, '3');

-- ----------------------------
-- Table structure for account_customer
-- ----------------------------
DROP TABLE IF EXISTS `account_customer`;
CREATE TABLE `account_customer`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `resume` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_customer
-- ----------------------------
INSERT INTO `account_customer` VALUES (1, 'pbkdf2_sha256$260000$WeM8VUdWduvMit4Am2GHXo$uBMImlTID7GuKroXExj880BrLwFAQQGxXVb1FWaCxUQ=', NULL, 0, 'test@tongji.edu.cn', 'test', '', '', 0, 0, '2023-12-07 05:03:33.200423', '2023-12-07 05:03:33.200423');
INSERT INTO `account_customer` VALUES (2, 'pbkdf2_sha256$260000$H94W1rLQefonw5KZbgMCE1$JLDEVaO080V0tLkEPArXbD7xfJNuGBEOLkhnUTEsH4k=', NULL, 0, 'hyongyan@outlook.com', 'test', '', '', 0, 0, '2023-12-07 05:04:24.419015', '2023-12-07 05:04:24.419015');
INSERT INTO `account_customer` VALUES (3, 'pbkdf2_sha256$260000$rcOpOlpTrgca3GS8iE3gz3$SqqqHWwFSvnvpiq8LV8Pe8hu4FX8m0apwlTkiBwI5+g=', '2023-12-15 00:11:22.934358', 0, 'guiyuan_studio@163.com', 'admin', '', '', 1, 0, '2023-12-07 05:58:04.730537', '2023-12-15 00:11:13.872569');
INSERT INTO `account_customer` VALUES (4, 'pbkdf2_sha256$260000$Ov6KXcEQZxLuGGExILI7j6$gLKF2AvC8E8vpSD4MZEqkKINnsuxcrxu8indqaMJW1g=', '2023-12-14 23:44:01.791678', 1, '2864087161@qq.com', 'hyoung', '12345678913', 'test', 1, 1, '2023-12-07 07:01:23.100571', '2023-12-14 01:15:52.245787');
INSERT INTO `account_customer` VALUES (5, 'pbkdf2_sha256$260000$aL8T4XeZE1YsqFH2EZY5zD$1s9BuY4ik8gjFjfeohbGADlbdiEBlw3ySxO18l+titM=', '2023-12-15 12:52:57.967507', 0, 'coplt_et@163.com', 'test3', '', '', 1, 0, '2023-12-07 07:14:48.572029', '2023-12-14 14:47:04.839068');
INSERT INTO `account_customer` VALUES (6, 'pbkdf2_sha256$260000$zPjLOxdWBNfIp1kmDiwuTl$UhGf0RS5vVl6BC+F4g+hrpqBAJz2mbMtNIUhmUFfSEQ=', NULL, 0, '2253156@tongji.edu.cn', '微风不噪', '', '', 0, 0, '2023-12-15 00:09:34.178590', '2023-12-15 00:09:34.178590');

-- ----------------------------
-- Table structure for account_customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `account_customer_groups`;
CREATE TABLE `account_customer_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_customer_groups_customer_id_group_id_d501b316_uniq`(`customer_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `account_customer_groups_group_id_c1cf6611_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `account_customer_gro_customer_id_a98350d1_fk_account_c` FOREIGN KEY (`customer_id`) REFERENCES `account_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_customer_groups_group_id_c1cf6611_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_customer_groups
-- ----------------------------

-- ----------------------------
-- Table structure for account_customer_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `account_customer_user_permissions`;
CREATE TABLE `account_customer_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_customer_user_pe_customer_id_permission_i_05910c6f_uniq`(`customer_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `account_customer_use_permission_id_508cbdb1_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `account_customer_use_customer_id_0eddb67e_fk_account_c` FOREIGN KEY (`customer_id`) REFERENCES `account_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_customer_use_permission_id_508cbdb1_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_customer_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (2, '用户');
INSERT INTO `auth_group` VALUES (1, '管理员');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES (1, 1, 1);
INSERT INTO `auth_group_permissions` VALUES (2, 1, 2);
INSERT INTO `auth_group_permissions` VALUES (3, 1, 3);
INSERT INTO `auth_group_permissions` VALUES (4, 1, 4);
INSERT INTO `auth_group_permissions` VALUES (5, 1, 5);
INSERT INTO `auth_group_permissions` VALUES (6, 1, 6);
INSERT INTO `auth_group_permissions` VALUES (7, 1, 7);
INSERT INTO `auth_group_permissions` VALUES (8, 1, 8);
INSERT INTO `auth_group_permissions` VALUES (9, 1, 9);
INSERT INTO `auth_group_permissions` VALUES (10, 1, 10);
INSERT INTO `auth_group_permissions` VALUES (11, 1, 11);
INSERT INTO `auth_group_permissions` VALUES (12, 1, 12);
INSERT INTO `auth_group_permissions` VALUES (13, 1, 13);
INSERT INTO `auth_group_permissions` VALUES (14, 1, 14);
INSERT INTO `auth_group_permissions` VALUES (15, 1, 15);
INSERT INTO `auth_group_permissions` VALUES (16, 1, 16);
INSERT INTO `auth_group_permissions` VALUES (17, 1, 17);
INSERT INTO `auth_group_permissions` VALUES (18, 1, 18);
INSERT INTO `auth_group_permissions` VALUES (19, 1, 19);
INSERT INTO `auth_group_permissions` VALUES (20, 1, 20);
INSERT INTO `auth_group_permissions` VALUES (21, 1, 21);
INSERT INTO `auth_group_permissions` VALUES (22, 1, 22);
INSERT INTO `auth_group_permissions` VALUES (23, 1, 23);
INSERT INTO `auth_group_permissions` VALUES (24, 1, 24);
INSERT INTO `auth_group_permissions` VALUES (25, 1, 25);
INSERT INTO `auth_group_permissions` VALUES (26, 1, 26);
INSERT INTO `auth_group_permissions` VALUES (27, 1, 27);
INSERT INTO `auth_group_permissions` VALUES (28, 1, 28);
INSERT INTO `auth_group_permissions` VALUES (29, 1, 29);
INSERT INTO `auth_group_permissions` VALUES (30, 1, 30);
INSERT INTO `auth_group_permissions` VALUES (31, 1, 31);
INSERT INTO `auth_group_permissions` VALUES (32, 1, 32);
INSERT INTO `auth_group_permissions` VALUES (33, 1, 33);
INSERT INTO `auth_group_permissions` VALUES (34, 1, 34);
INSERT INTO `auth_group_permissions` VALUES (35, 1, 35);
INSERT INTO `auth_group_permissions` VALUES (36, 1, 36);
INSERT INTO `auth_group_permissions` VALUES (37, 1, 37);
INSERT INTO `auth_group_permissions` VALUES (38, 1, 38);
INSERT INTO `auth_group_permissions` VALUES (39, 1, 39);
INSERT INTO `auth_group_permissions` VALUES (40, 1, 40);
INSERT INTO `auth_group_permissions` VALUES (41, 1, 41);
INSERT INTO `auth_group_permissions` VALUES (42, 1, 42);
INSERT INTO `auth_group_permissions` VALUES (43, 1, 43);
INSERT INTO `auth_group_permissions` VALUES (44, 1, 44);
INSERT INTO `auth_group_permissions` VALUES (45, 1, 45);
INSERT INTO `auth_group_permissions` VALUES (46, 1, 46);
INSERT INTO `auth_group_permissions` VALUES (47, 1, 47);
INSERT INTO `auth_group_permissions` VALUES (48, 1, 48);
INSERT INTO `auth_group_permissions` VALUES (49, 1, 49);
INSERT INTO `auth_group_permissions` VALUES (50, 1, 50);
INSERT INTO `auth_group_permissions` VALUES (51, 1, 51);
INSERT INTO `auth_group_permissions` VALUES (52, 1, 52);
INSERT INTO `auth_group_permissions` VALUES (53, 1, 53);
INSERT INTO `auth_group_permissions` VALUES (54, 1, 54);
INSERT INTO `auth_group_permissions` VALUES (55, 1, 55);
INSERT INTO `auth_group_permissions` VALUES (56, 1, 56);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 类别', 6, 'add_category');
INSERT INTO `auth_permission` VALUES (22, 'Can change 类别', 6, 'change_category');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 类别', 6, 'delete_category');
INSERT INTO `auth_permission` VALUES (24, 'Can view 类别', 6, 'view_category');
INSERT INTO `auth_permission` VALUES (25, 'Can add 商品', 7, 'add_product');
INSERT INTO `auth_permission` VALUES (26, 'Can change 商品', 7, 'change_product');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 商品', 7, 'delete_product');
INSERT INTO `auth_permission` VALUES (28, 'Can view 商品', 7, 'view_product');
INSERT INTO `auth_permission` VALUES (29, 'Can add 商品的图片', 8, 'add_productimage');
INSERT INTO `auth_permission` VALUES (30, 'Can change 商品的图片', 8, 'change_productimage');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 商品的图片', 8, 'delete_productimage');
INSERT INTO `auth_permission` VALUES (32, 'Can view 商品的图片', 8, 'view_productimage');
INSERT INTO `auth_permission` VALUES (33, 'Can add 账户', 9, 'add_customer');
INSERT INTO `auth_permission` VALUES (34, 'Can change 账户', 9, 'change_customer');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 账户', 9, 'delete_customer');
INSERT INTO `auth_permission` VALUES (36, 'Can view 账户', 9, 'view_customer');
INSERT INTO `auth_permission` VALUES (37, 'Can add 地址', 10, 'add_address');
INSERT INTO `auth_permission` VALUES (38, 'Can change 地址', 10, 'change_address');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 地址', 10, 'delete_address');
INSERT INTO `auth_permission` VALUES (40, 'Can view 地址', 10, 'view_address');
INSERT INTO `auth_permission` VALUES (41, 'Can add 运输选项', 11, 'add_deliveryoptions');
INSERT INTO `auth_permission` VALUES (42, 'Can change 运输选项', 11, 'change_deliveryoptions');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 运输选项', 11, 'delete_deliveryoptions');
INSERT INTO `auth_permission` VALUES (44, 'Can view 运输选项', 11, 'view_deliveryoptions');
INSERT INTO `auth_permission` VALUES (45, 'Can add 支付选项', 12, 'add_paymentselections');
INSERT INTO `auth_permission` VALUES (46, 'Can change 支付选项', 12, 'change_paymentselections');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 支付选项', 12, 'delete_paymentselections');
INSERT INTO `auth_permission` VALUES (48, 'Can view 支付选项', 12, 'view_paymentselections');
INSERT INTO `auth_permission` VALUES (49, 'Can add 订单', 13, 'add_order');
INSERT INTO `auth_permission` VALUES (50, 'Can change 订单', 13, 'change_order');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 订单', 13, 'delete_order');
INSERT INTO `auth_permission` VALUES (52, 'Can view 订单', 13, 'view_order');
INSERT INTO `auth_permission` VALUES (53, 'Can add 评论', 14, 'add_comment');
INSERT INTO `auth_permission` VALUES (54, 'Can change 评论', 14, 'change_comment');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 评论', 14, 'delete_comment');
INSERT INTO `auth_permission` VALUES (56, 'Can view 评论', 14, 'view_comment');

-- ----------------------------
-- Table structure for catalogue_category
-- ----------------------------
DROP TABLE IF EXISTS `catalogue_category`;
CREATE TABLE `catalogue_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `brief` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `lft` int UNSIGNED NOT NULL,
  `rght` int UNSIGNED NOT NULL,
  `tree_id` int UNSIGNED NOT NULL,
  `level` int UNSIGNED NOT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE,
  UNIQUE INDEX `slug`(`slug` ASC) USING BTREE,
  INDEX `catalogue_category_tree_id_ac81e92e`(`tree_id` ASC) USING BTREE,
  INDEX `catalogue_category_parent_id_4479cbbf`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `catalogue_category_parent_id_4479cbbf_fk_catalogue_category_id` FOREIGN KEY (`parent_id`) REFERENCES `catalogue_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `catalogue_category_chk_1` CHECK (`lft` >= 0),
  CONSTRAINT `catalogue_category_chk_2` CHECK (`rght` >= 0),
  CONSTRAINT `catalogue_category_chk_3` CHECK (`tree_id` >= 0),
  CONSTRAINT `catalogue_category_chk_4` CHECK (`level` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalogue_category
-- ----------------------------
INSERT INTO `catalogue_category` VALUES (1, '外卖代拿(四平)', '四平校区外卖代拿', 'SPtakeout', 1, 1, 2, 5, 0, NULL);
INSERT INTO `catalogue_category` VALUES (2, '快递代拿(四平)', '四平校区快递代拿', 'SPpackages', 1, 1, 2, 1, 0, NULL);
INSERT INTO `catalogue_category` VALUES (3, '跨校区业务', '跨校区业务', 'cross', 1, 1, 2, 10, 0, NULL);
INSERT INTO `catalogue_category` VALUES (4, '其他', '其他', 'others', 1, 1, 2, 15, 0, NULL);
INSERT INTO `catalogue_category` VALUES (5, '学习资料', '学习资料', 'study', 1, 1, 2, 9, 0, NULL);
INSERT INTO `catalogue_category` VALUES (6, '校园咸鱼', '校园咸鱼', 'schoolsell', 1, 1, 2, 8, 0, NULL);
INSERT INTO `catalogue_category` VALUES (7, '外卖代拿(嘉定)', '嘉定校区外卖代拿', 'JDtakeout', 1, 1, 2, 6, 0, NULL);
INSERT INTO `catalogue_category` VALUES (8, '快递代拿(嘉定)', '嘉定校区快递代拿', 'JDpackages', 1, 1, 2, 4, 0, NULL);
INSERT INTO `catalogue_category` VALUES (9, '出票', '代出票', 'tickets', 1, 1, 2, 7, 0, NULL);
INSERT INTO `catalogue_category` VALUES (10, '代刷锻（四平）', '代刷锻（四平）', 'spdl', 1, 1, 2, 11, 0, NULL);
INSERT INTO `catalogue_category` VALUES (11, '代刷锻（嘉定）', '代刷锻（嘉定）', 'jddl', 1, 1, 2, 12, 0, NULL);
INSERT INTO `catalogue_category` VALUES (12, '原神代抽卡', '原神代抽卡', 'op', 1, 1, 2, 13, 0, NULL);
INSERT INTO `catalogue_category` VALUES (13, '寻物启事(四平)', '寻物启事(四平)', 'SPfind', 1, 1, 2, 3, 0, NULL);
INSERT INTO `catalogue_category` VALUES (14, '寻物启事(嘉定)', '寻物启事(嘉定)', 'JDfind', 1, 1, 2, 2, 0, NULL);
INSERT INTO `catalogue_category` VALUES (15, '作业求助', '作业求助', 'homework', 1, 1, 2, 14, 0, NULL);

-- ----------------------------
-- Table structure for catalogue_product
-- ----------------------------
DROP TABLE IF EXISTS `catalogue_product`;
CREATE TABLE `catalogue_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `quantity` int NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `regular_price` decimal(5, 2) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  `seller_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catalogue_product_category_id_d8eb7fb2_fk_catalogue_category_id`(`category_id` ASC) USING BTREE,
  INDEX `catalogue_product_seller_id_452f13af_fk_account_customer_id`(`seller_id` ASC) USING BTREE,
  CONSTRAINT `catalogue_product_category_id_d8eb7fb2_fk_catalogue_category_id` FOREIGN KEY (`category_id`) REFERENCES `catalogue_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `catalogue_product_seller_id_452f13af_fk_account_customer_id` FOREIGN KEY (`seller_id`) REFERENCES `account_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalogue_product
-- ----------------------------
INSERT INTO `catalogue_product` VALUES (1, '20.35四平代拿外卖', -1, '20.35四平南门代拿外卖，送到西南一楼下', 3.00, 1, '2023-12-07 06:25:29.226459', '2023-12-14 21:44:25.484062', 1, 3);
INSERT INTO `catalogue_product` VALUES (2, '嘉定代取快递', 1, '嘉定校区代取快递，送到宿舍楼下.', 5.00, 1, '2023-12-07 06:27:12.296371', '2023-12-07 06:27:12.296371', 2, 3);
INSERT INTO `catalogue_product` VALUES (3, '急急急！送文件到四平', 1, '12月8日前需要从嘉定送一份文件到四平瑞安楼.\r\n急急急！！！', 30.00, 1, '2023-12-07 06:29:21.808102', '2023-12-07 06:29:21.808102', 3, 3);
INSERT INTO `catalogue_product` VALUES (4, '出数学分析电子资料', 999, '数学分析2020-2023年期中期末考试资料\r\n满绩佬倾情整理，机不可失。', 10.00, 1, '2023-12-07 06:35:40.503035', '2023-12-07 06:35:40.503035', 5, 3);
INSERT INTO `catalogue_product` VALUES (7, '四平出售电脑主机', 0, '因毕业，出售台式电脑主机，使用一两年，配置较好，欢迎各位同学联系。可加微信:tongji123', 99.00, 1, '2023-12-14 01:54:02.125447', '2023-12-15 00:18:40.325657', 6, 4);
INSERT INTO `catalogue_product` VALUES (8, '概率论与数理统计习题答案', 1, '概率论与数理统计习题答案，橙书', 9.99, 1, '2023-12-14 01:56:29.624991', '2023-12-14 01:56:29.624991', 5, 4);
INSERT INTO `catalogue_product` VALUES (10, '求大物资料', 1, '求大物资料', 10.00, 1, '2023-12-14 14:53:56.744609', '2023-12-14 14:53:56.744609', 4, 5);
INSERT INTO `catalogue_product` VALUES (13, '原神启动！', 1, '原神启动！', 999.00, 1, '2023-12-14 23:10:28.909275', '2023-12-14 23:10:28.909275', 12, 4);
INSERT INTO `catalogue_product` VALUES (14, '临近期末，代刷锻，价格优惠!', 99, '临近期末，代刷锻，价格优惠!\r\n纯人工，非软件。\r\n有意加V:tongji456', 15.00, 1, '2023-12-15 00:17:36.622450', '2023-12-15 00:17:36.622450', 10, 3);
INSERT INTO `catalogue_product` VALUES (15, '嘉定代刷锻(跑步/场地)', 87, '嘉定代刷锻(跑步/场地)', 10.00, 1, '2023-12-15 12:54:03.886155', '2023-12-15 12:54:03.886155', 11, 5);
INSERT INTO `catalogue_product` VALUES (16, '我的食物在哪里?', 1, '我的食物在哪里?\r\n嘉定求帮拿外卖，晚八下课到', 5.00, 1, '2023-12-15 12:59:04.717109', '2023-12-15 12:59:04.717109', 7, 5);
INSERT INTO `catalogue_product` VALUES (17, '寻找我的耳机', 1, '下午6.丢在南101后排', 15.00, 1, '2023-12-15 13:04:08.057099', '2023-12-15 13:04:08.057099', 13, 5);
INSERT INTO `catalogue_product` VALUES (18, '南116丢数分书', 1, '南116丢数分书', 10.00, 1, '2023-12-15 13:06:18.861472', '2023-12-15 13:06:18.861472', 14, 5);

-- ----------------------------
-- Table structure for catalogue_product_users_wishlist
-- ----------------------------
DROP TABLE IF EXISTS `catalogue_product_users_wishlist`;
CREATE TABLE `catalogue_product_users_wishlist`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `catalogue_product_users__product_id_customer_id_0e7e08fb_uniq`(`product_id` ASC, `customer_id` ASC) USING BTREE,
  INDEX `catalogue_product_us_customer_id_f0bcf974_fk_account_c`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `catalogue_product_us_customer_id_f0bcf974_fk_account_c` FOREIGN KEY (`customer_id`) REFERENCES `account_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `catalogue_product_us_product_id_5b7ad263_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalogue_product_users_wishlist
-- ----------------------------
INSERT INTO `catalogue_product_users_wishlist` VALUES (3, 1, 4);
INSERT INTO `catalogue_product_users_wishlist` VALUES (6, 2, 4);
INSERT INTO `catalogue_product_users_wishlist` VALUES (4, 2, 5);
INSERT INTO `catalogue_product_users_wishlist` VALUES (11, 3, 4);
INSERT INTO `catalogue_product_users_wishlist` VALUES (2, 4, 4);
INSERT INTO `catalogue_product_users_wishlist` VALUES (12, 7, 3);
INSERT INTO `catalogue_product_users_wishlist` VALUES (7, 7, 4);
INSERT INTO `catalogue_product_users_wishlist` VALUES (8, 7, 5);
INSERT INTO `catalogue_product_users_wishlist` VALUES (9, 8, 4);
INSERT INTO `catalogue_product_users_wishlist` VALUES (10, 10, 4);

-- ----------------------------
-- Table structure for catalogue_productimage
-- ----------------------------
DROP TABLE IF EXISTS `catalogue_productimage`;
CREATE TABLE `catalogue_productimage`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alt_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_feature` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catalogue_productima_product_id_49474fe8_fk_catalogue`(`product_id` ASC) USING BTREE,
  CONSTRAINT `catalogue_productima_product_id_49474fe8_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalogue_productimage
-- ----------------------------
INSERT INTO `catalogue_productimage` VALUES (1, 'images/TJU.png', NULL, 1, '2023-12-07 06:25:29.231460', '2023-12-07 06:25:29.231460', 1);
INSERT INTO `catalogue_productimage` VALUES (2, 'images/马里奥.jpg', NULL, 1, '2023-12-07 06:27:12.301370', '2023-12-07 06:27:12.301370', 2);
INSERT INTO `catalogue_productimage` VALUES (3, 'images/coolHue-F1CA74-A64DB6.png', NULL, 1, '2023-12-07 06:29:21.811102', '2023-12-07 06:29:21.812102', 3);
INSERT INTO `catalogue_productimage` VALUES (4, 'images/数学分析_ZlhyIEy.jpg', NULL, 1, '2023-12-07 06:35:40.507032', '2023-12-07 06:35:40.507032', 4);
INSERT INTO `catalogue_productimage` VALUES (7, 'images/电脑.png', NULL, 1, '2023-12-14 01:54:02.130402', '2023-12-14 01:54:02.130402', 7);
INSERT INTO `catalogue_productimage` VALUES (8, 'images/OIP.jpg', NULL, 1, '2023-12-14 01:56:29.629990', '2023-12-14 01:56:29.629990', 8);
INSERT INTO `catalogue_productimage` VALUES (10, 'images/dd6619c6d2f7ef062644cfde34ba64b.jpg', NULL, 1, '2023-12-14 14:53:56.749631', '2023-12-14 14:53:56.749631', 10);
INSERT INTO `catalogue_productimage` VALUES (13, 'images/TJ_6eT85Ox.jpg', NULL, 1, '2023-12-14 23:10:28.914275', '2023-12-14 23:10:28.914275', 13);
INSERT INTO `catalogue_productimage` VALUES (14, 'images/gxty.png', NULL, 1, '2023-12-15 00:17:36.627449', '2023-12-15 00:17:36.627449', 14);
INSERT INTO `catalogue_productimage` VALUES (15, 'images/url-YPSuwo1vuX6vNx8N.gif', NULL, 1, '2023-12-15 12:54:03.894122', '2023-12-15 12:54:03.894122', 15);
INSERT INTO `catalogue_productimage` VALUES (16, 'images/food.gif', NULL, 1, '2023-12-15 12:59:04.724108', '2023-12-15 12:59:04.724108', 16);
INSERT INTO `catalogue_productimage` VALUES (17, 'images/寻物启事.gif', NULL, 1, '2023-12-15 13:04:08.064098', '2023-12-15 13:04:08.064098', 17);
INSERT INTO `catalogue_productimage` VALUES (18, 'images/fine.gif', NULL, 1, '2023-12-15 13:06:18.867019', '2023-12-15 13:06:18.867019', 18);

-- ----------------------------
-- Table structure for checkout_deliveryoptions
-- ----------------------------
DROP TABLE IF EXISTS `checkout_deliveryoptions`;
CREATE TABLE `checkout_deliveryoptions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `delivery_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `delivery_price` decimal(5, 2) NOT NULL,
  `delivery_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `delivery_timeframe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `delivery_window` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `order` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checkout_deliveryoptions
-- ----------------------------
INSERT INTO `checkout_deliveryoptions` VALUES (1, '上门', 5.00, 'HD', '2023.12.7', '1天', 1, 1);
INSERT INTO `checkout_deliveryoptions` VALUES (2, '自取', 0.00, 'HD', '2023.12.8', '1天', 1, 1);
INSERT INTO `checkout_deliveryoptions` VALUES (3, '网上交易', 0.00, 'DD', '2023.12.7', '0天', 1, 1);

-- ----------------------------
-- Table structure for checkout_paymentselections
-- ----------------------------
DROP TABLE IF EXISTS `checkout_paymentselections`;
CREATE TABLE `checkout_paymentselections`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checkout_paymentselections
-- ----------------------------

-- ----------------------------
-- Table structure for comment_comment
-- ----------------------------
DROP TABLE IF EXISTS `comment_comment`;
CREATE TABLE `comment_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `order_id` bigint NULL DEFAULT NULL,
  `product_id` int NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Anonymous User',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id` ASC) USING BTREE,
  CONSTRAINT `comment_comment_order_id_7066d95e_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_comment
-- ----------------------------
INSERT INTO `comment_comment` VALUES (1, '卖家人很好，电脑配置超值^.^', '2023-12-14 10:08:31.498637', 1, 7, 'Hyoung');
INSERT INTO `comment_comment` VALUES (2, '不错', '2023-12-14 12:47:50.158101', NULL, 7, 'test');
INSERT INTO `comment_comment` VALUES (15, '这个是第几版呀', '2023-12-14 14:38:14.736740', NULL, 8, '4');
INSERT INTO `comment_comment` VALUES (16, '电子版？有目录吗？', '2023-12-14 14:48:31.964222', NULL, 8, '5');
INSERT INTO `comment_comment` VALUES (17, '还需要吗？', '2023-12-14 14:57:53.191413', NULL, 1, '5');
INSERT INTO `comment_comment` VALUES (31, '正需要，谢谢了！', '2023-12-14 15:02:20.608980', NULL, 8, '5');
INSERT INTO `comment_comment` VALUES (32, '我下午正好去四平，我们联系~', '2023-12-14 23:36:27.811068', NULL, 3, '4');
INSERT INTO `comment_comment` VALUES (34, '耶耶耶~抢到了', '2023-12-14 23:39:32.592251', NULL, 1, '4');
INSERT INTO `comment_comment` VALUES (35, 'test', '2023-12-14 23:42:04.354953', NULL, 1, '4');
INSERT INTO `comment_comment` VALUES (36, 'test', '2023-12-14 23:44:28.372918', NULL, 1, '4');
INSERT INTO `comment_comment` VALUES (37, 'test', '2023-12-14 23:54:56.456322', NULL, 13, '4');
INSERT INTO `comment_comment` VALUES (38, 'test', '2023-12-14 23:57:14.754221', NULL, 13, '4');
INSERT INTO `comment_comment` VALUES (39, '1', '2023-12-15 00:03:56.730128', NULL, 13, '4');
INSERT INTO `comment_comment` VALUES (40, '151', '2023-12-15 00:05:34.017149', NULL, 13, '4');
INSERT INTO `comment_comment` VALUES (41, '151', '2023-12-15 00:06:02.532613', NULL, 13, '4');
INSERT INTO `comment_comment` VALUES (42, '151', '2023-12-15 00:06:33.395343', NULL, 13, '4');
INSERT INTO `comment_comment` VALUES (43, '讲真？', '2023-12-15 00:11:50.412102', NULL, 13, '3');
INSERT INTO `comment_comment` VALUES (44, '同济大学，启动！', '2023-12-15 00:13:45.555000', NULL, 13, '3');
INSERT INTO `comment_comment` VALUES (45, '-> 同济大学，启动！', '2023-12-15 00:14:11.821270', NULL, 13, '3');
INSERT INTO `comment_comment` VALUES (46, '有点小贵', '2023-12-15 12:26:26.728736', NULL, 14, '3');
INSERT INTO `comment_comment` VALUES (47, '长什么样子哇', '2023-12-15 13:05:00.838027', NULL, 17, '5');
INSERT INTO `comment_comment` VALUES (48, '我也丢了一本', '2023-12-15 13:09:53.558307', NULL, 18, '5');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_account_customer_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_customer_id` FOREIGN KEY (`user_id`) REFERENCES `account_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2023-12-07 07:04:58.263245', '1', '管理员', 1, '[{\"added\": {}}]', 3, 4);
INSERT INTO `django_admin_log` VALUES (2, '2023-12-07 07:05:01.855849', '1', '管理员', 2, '[]', 3, 4);
INSERT INTO `django_admin_log` VALUES (3, '2023-12-12 09:31:58.852181', '6', '校园咸鱼', 1, '[{\"added\": {}}]', 6, 4);
INSERT INTO `django_admin_log` VALUES (4, '2023-12-13 00:05:16.372190', '2', '用户', 1, '[{\"added\": {}}]', 3, 4);
INSERT INTO `django_admin_log` VALUES (5, '2023-12-13 15:43:41.430223', '1', '外卖代拿(四平)', 2, '[{\"changed\": {\"fields\": [\"\\u7c7b\\u522b\\u540d\", \"\\u7c7b\\u522b\\u7b80\\u4ecb\", \"\\u5b89\\u5168URL\"]}}]', 6, 4);
INSERT INTO `django_admin_log` VALUES (6, '2023-12-13 15:44:12.023069', '7', '外卖代拿(嘉定)', 1, '[{\"added\": {}}]', 6, 4);
INSERT INTO `django_admin_log` VALUES (7, '2023-12-13 15:44:45.659001', '2', '快递代拿(四平)', 2, '[{\"changed\": {\"fields\": [\"\\u7c7b\\u522b\\u540d\", \"\\u7c7b\\u522b\\u7b80\\u4ecb\", \"\\u5b89\\u5168URL\"]}}]', 6, 4);
INSERT INTO `django_admin_log` VALUES (8, '2023-12-13 15:45:12.016316', '8', '快递代拿(嘉定)', 1, '[{\"added\": {}}]', 6, 4);
INSERT INTO `django_admin_log` VALUES (9, '2023-12-14 10:07:54.365502', '1', '2023-12-14 10:07:54.365502', 1, '[{\"added\": {}}]', 13, 4);
INSERT INTO `django_admin_log` VALUES (10, '2023-12-14 10:08:31.498637', '1', '卖家人很好，电脑配置超值^.^', 1, '[{\"added\": {}}]', 14, 4);
INSERT INTO `django_admin_log` VALUES (11, '2023-12-14 15:04:12.005752', '18', '正需要，谢谢了！', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (12, '2023-12-14 15:04:12.011752', '19', '正需要，谢谢了！', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (13, '2023-12-14 15:04:12.013753', '20', '正需要，谢谢了！', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (14, '2023-12-14 15:04:12.015752', '21', '正需要，谢谢了！', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (15, '2023-12-14 15:04:12.017753', '22', '正需要，谢谢了！', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (16, '2023-12-14 15:04:12.019752', '23', '正需要，谢谢了！', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (17, '2023-12-14 15:04:12.021752', '24', '正需要，谢谢了！', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (18, '2023-12-14 15:04:12.023751', '25', '正需要，谢谢了！', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (19, '2023-12-14 15:04:12.025752', '26', '正需要，谢谢了！', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (20, '2023-12-14 15:04:12.027751', '27', '正需要，谢谢了！', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (21, '2023-12-14 15:04:12.029752', '28', '正需要，谢谢了！', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (22, '2023-12-14 15:04:12.031752', '29', '正需要，谢谢了！', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (23, '2023-12-14 15:04:12.033751', '30', '正需要，谢谢了！', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (24, '2023-12-14 15:04:25.877167', '13', '296296', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (25, '2023-12-14 15:04:25.889167', '14', '296296', 3, '', 14, 4);
INSERT INTO `django_admin_log` VALUES (26, '2023-12-14 22:56:24.131042', '9', '出票', 1, '[{\"added\": {}}]', 6, 4);
INSERT INTO `django_admin_log` VALUES (27, '2023-12-14 22:56:58.736556', '10', '代刷锻（四平）', 1, '[{\"added\": {}}]', 6, 4);
INSERT INTO `django_admin_log` VALUES (28, '2023-12-14 22:57:36.841987', '11', '代刷锻（嘉定）', 1, '[{\"added\": {}}]', 6, 4);
INSERT INTO `django_admin_log` VALUES (29, '2023-12-14 22:58:21.312185', '12', '原神代抽卡', 1, '[{\"added\": {}}]', 6, 4);
INSERT INTO `django_admin_log` VALUES (30, '2023-12-15 13:02:11.099675', '13', '寻物启事(四平)', 1, '[{\"added\": {}}]', 6, 4);
INSERT INTO `django_admin_log` VALUES (31, '2023-12-15 13:02:30.383351', '14', '寻物启事(嘉定)', 1, '[{\"added\": {}}]', 6, 4);
INSERT INTO `django_admin_log` VALUES (32, '2023-12-15 13:02:52.605726', '15', '作业求助', 1, '[{\"added\": {}}]', 6, 4);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (10, 'account', 'address');
INSERT INTO `django_content_type` VALUES (9, 'account', 'customer');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (6, 'catalogue', 'category');
INSERT INTO `django_content_type` VALUES (7, 'catalogue', 'product');
INSERT INTO `django_content_type` VALUES (8, 'catalogue', 'productimage');
INSERT INTO `django_content_type` VALUES (11, 'checkout', 'deliveryoptions');
INSERT INTO `django_content_type` VALUES (12, 'checkout', 'paymentselections');
INSERT INTO `django_content_type` VALUES (14, 'comment', 'comment');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (13, 'orders', 'order');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2023-12-07 04:53:14.253794');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2023-12-07 04:53:14.306818');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2023-12-07 04:53:14.481794');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2023-12-07 04:53:14.523794');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2023-12-07 04:53:14.531792');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2023-12-07 04:53:14.539795');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2023-12-07 04:53:14.547794');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2023-12-07 04:53:14.551794');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2023-12-07 04:53:14.557819');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2023-12-07 04:53:14.564793');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2023-12-07 04:53:14.571794');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2023-12-07 04:53:14.598792');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2023-12-07 04:53:14.607792');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2023-12-07 04:53:14.615793');
INSERT INTO `django_migrations` VALUES (15, 'account', '0001_initial', '2023-12-07 04:53:14.880813');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2023-12-07 04:53:14.984791');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2023-12-07 04:53:14.994792');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-07 04:53:15.005792');
INSERT INTO `django_migrations` VALUES (19, 'catalogue', '0001_initial', '2023-12-07 04:53:15.375792');
INSERT INTO `django_migrations` VALUES (20, 'checkout', '0001_initial', '2023-12-07 04:53:15.414792');
INSERT INTO `django_migrations` VALUES (21, 'orders', '0001_initial', '2023-12-07 04:53:15.537792');
INSERT INTO `django_migrations` VALUES (22, 'comment', '0001_initial', '2023-12-07 04:53:15.606793');
INSERT INTO `django_migrations` VALUES (23, 'sessions', '0001_initial', '2023-12-07 04:53:15.636793');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1utabj3ltlwvriztgo1l4p3eb7e5ngzu', 'eyJiYXNrZXQiOnt9fQ:1rB6QE:KbCoxACWuf7_2RLdP58D_GMDOLFccrwGaCN07nyRWZE', '2023-12-21 04:55:38.750679');
INSERT INTO `django_session` VALUES ('3r2pbppo7hdc732o780913kk5x7etdu1', '.eJxVjDEOgzAQBP9ydWTZ-HwJlOl5Azrb50CIQMKmQvw9INHQzszuBp7zKAWabX9Ax2vpuzXL0g0RGkC4Mc9hlOkU8cvTZ1ZhnsoyeHUm6rJZtXOU3_tqbwc95_5Y65cnzVjZZH3ASBQpVTpQMFbXXrQ80wGSESKNbAw66xxSEGeodhFh_wO0ejtT:1rDnsX:JsJQgTdhTqcgLhEP1qpIm0ggnfbOnrMY60YA6eX3JNU', '2023-12-28 23:44:01.795775');
INSERT INTO `django_session` VALUES ('6f1ep6i5oe04s9xkmwrskj1lf020e16l', '.eJxVjDEOgzAMRe-SuYogwk7M2L1nQLYTCqUCicCEuDsgMbTrf--_zTS8Ll2z5jQ3fTS1AfP43YR1SOMF4ofH92R1Gpe5F3sp9qbZvqaYvs_b_Qt0nLvzXRWlR-UW2whYkkMAEBUvWIAjDVEJQmCi6LyXisSpBBRylWdxWJxR4TykxdTbvh-Cizt7:1rB8yQ:aerfwaa1Qg5XKhpyGYKNkwZdTnOx9sfcj1CXIb_iqCQ', '2023-12-21 07:39:06.787065');
INSERT INTO `django_session` VALUES ('7h7lligij2es2i7gq6lem4ounas7svff', 'eyJiYXNrZXQiOnt9fQ:1rE0TX:1pnBeAYV1MXPsTuSWMH13UZiWKchHPqkNCL01gxsyn4', '2023-12-29 13:11:03.731864');
INSERT INTO `django_session` VALUES ('9hdjyccosxm19r0jj53nuvf5qza0pdiq', '.eJy1Vk2PmzAQ_SsR5yRgMB_OsdreWq1aqaeyivxFQgM4snGlVZT_XrtEq41Dds3SngbNPD9m3rMxp2CLdb_fasXltmbBJoDB8nWOYHrgnS2wX7jbiTUVXS9rsraQ9aWq1l8F482nC_aKYI_V3qwGMUpizLMo4iClFa44gjmgDLEojmEKEIEwQrDKEY8RADkwyDQvioxUjCYAWdKWd1oZrp-nMuhwy8tgsyiDL7XqVRkszWNtmhuSFZaLCq9oLWnDh2JrW1S2fL3---dvHqu1bIZaiFlbdyHFPW7ETvPwKAXTtA8HHGbsx7tQA7rAieSYUalbMtKZz2Tn5WLiNOcnW-Y1s1UQRbFLUZY6pzkxIY1jMksb88R3Qj77iPOC_Y_qTBrNFSpxE8Clf3xY2K5mbMbHhw_oLSTjUg3hvtJXKE-N_Qa6lWGisqmbgCPGQY6hCVkGEhtSgqyNVVTNkNswoCiyRKjI0Ue2-p7Tg9B9aPjr31w-i2Nfi069seHvrfC0ZIYSI6L6T-9alLuJbIS-IH87LQgFtkVYUNtwUhQ25DC5faey71T7mjdshZv-XftyTuEdFnv9qBUVu3Hr7BUV7qTQx_tmvcL42_MPhh77bnkN6pqC3EQx6hIdGiZ43lmaRnRzlkRrbvj-Jd4_Qg5wijW-Dc6SyREdADcRjdGzOLM7JE7ymS5MIro5FpQKbcXVqhftWxfKDXKCD94tzhLKld29wUF8fjI_lgSrA--Dzel8_gOxfHP5:1rDKq2:JJVo-rnwDp-zmolp4RoJZ0jtfUTeS8neBm-ngVieLzM', '2023-12-27 16:43:30.025166');
INSERT INTO `django_session` VALUES ('9odfybzi2n9hezclhn2uxycrpc8p8zbs', 'eyJiYXNrZXQiOnt9fQ:1rDRSQ:5lrd90DBXAsva1WPwt950qM9UJshpslVRtY6sJz0tnI', '2023-12-27 23:47:34.368773');
INSERT INTO `django_session` VALUES ('bbrbor3vecw6zb7cnojtvg7ktbhbqeuu', '.eJy1Vk2PmzAQ_SsR5yRgYz6cY6Xe2kMr9VRWkb9IaABHNq60ivLfay_RauPALizqadDM85vxe8ZwCfbEdMe90ULtKx7sAhSs3-YoYSfRugL_Q9qD3DLZdqqiWwfZ3qp6-11yUX-5Ye8IjkQf7WoAcQyJSKNIgISVpBQYZYBxzCMIUQIwRSjCqMywgBiADFhkkuV5SkvOYoAdaSNaoy3X70sRtKQRRbBbFcG3Sne6CNb2sbLD9cmSqFVJNqxSrBZ9sXEjale-X__z648Jq42q-1pIeFO1ISMdqeXBiPCsJDesC3sc4fzXh1ALusGpEoQzZRo6MNmUnV3Xq5m7uT65sqi4q4Iogj5FUZiMZdSGBEK6SBv7JA5SPU8R5xX7H9WZtTVfqNhPgAF6JAiyIU1BbENOqXA9y1QsOKGOqOTRS8COFkcRdiHP8GfsOQp2kqYLbbfqr1DP8txVstXvmDS2YqJVC3QZkPizWvj2JX4CDTWjBLrjEifJQgdnEfmeScWF0n0Y9-kONd2b6aMtEsiXO_MT6TA9egkMuC4oZ-4UxXnuQobix57a9dTHStR8Q-ruQ2MywdAIi_uA6Q2Th2FT3EcuPChpzuOWvMHMMmTppoduvkkb9U3BfiIfdIn1A1Oy9C2ZQ_Rws8nG_iN0r3H8QvOAc6yZOuAimTzRAfAT0RA9h6k7ITDOFrowi-jhtWBMGieu0Z1s3ruvHpAzfJg84iKhfNn9fwAAr0_215QSfRJdsLtcr_8ASriJiQ:1rD5ld:iqDFL4ZgXC_KOTPMabx3BRPFGp1bczBZctFrF_r5ca4', '2023-12-27 00:37:57.953481');
INSERT INTO `django_session` VALUES ('bgant964ui4h7ph11slrht085tr7vpei', 'eyJiYXNrZXQiOnt9fQ:1rB7ND:Es9fX96XwuQXcicM7EwUPUHu1a7nqEhOzY-q2Zbq_cc', '2023-12-21 05:56:35.877957');
INSERT INTO `django_session` VALUES ('csdsn7su03b373k00vexguslny2qvgj4', 'eyJiYXNrZXQiOnt9fQ:1rDQnL:kDt8pxIaRABfPpExr94mM3AlhEoKlskNN7qtAB962rs', '2023-12-27 23:05:07.181570');
INSERT INTO `django_session` VALUES ('dgpqqf7imboioqycswmtxqnmp57jnztu', '.eJy1Vk2PmzAQ_SsR5yRgYz6cY6Xe2kMr9VRWkb9IaABHNq60ivLfay_RqnFgFxbtadDM85vxe8ZwCSjRJ9EFu8t1HeyJ6Y57o4XaVzzYBSi4y1HCTqJ1Bf6HtAe5ZbLtVEW3DrK9VfX2u-Si_nLD3hEciT7a1QDiGBKRRpEACStJKTDKAOOYRxCiBGCKUIRRmWEBMQAZsMgky_OUlpzFADvSRrRGW67flyJoSSOKYLcqgm-V7nQRrO1jZYfrkyVRq5JsWKVYLfpi40bUrny__ufXHxNWG1X3tZDwpmpDRjpSy4MR4VlJblgX9jjC-a93oRZ0g1MlCGfKNHRgsik7u65XM3dzfXJlUXFXBVEEfYqiMBnLqA0JhHSRNvZJHKR6niLOK_YT1Zm1NV-o2E-AAXokCLIhTUFsQ06pcD3LVCw4oY6o5NFLwI4WRxF2Ic_wR-w5CnaSpgttt-qvUM_y3FWy1W-YNLZiolULdBmQ-KNa-PYlfgINNaMEuuMSJ8lCB2cR-Z5JxYXSfRj36Q413Zvpoy0SyJc78xPpMD16CQy4Lihn7hTFee5ChuLHntr11MdK1HxD6u5dYzLB0AiL-4DpDZOHYVPcRy48KGnO45b8h5llyNJND918kzbqm4L9RD7oEusHpmTpWzKH6OFmk439R-he4_iF5gHnWDN1wEUyeaID4CeiIXoOU3dCYJwtdGEW0cNrwZg0TlyjO9m8dV89IGf4MHnERUL5svv_AABen4LrP2UciYk:1rDKXT:CJbabG13uKhutXzmgysUgB13GfVdcnMb2pmooe5d3t8', '2023-12-27 16:24:19.624276');
INSERT INTO `django_session` VALUES ('o7to4p2agu8znub9ze3qzjbq8nvpq6uv', 'eyJiYXNrZXQiOnt9fQ:1rDQnk:bwYnfBT6hnxsKum8Qk1bXpRxRJptTqlF80Z6OUAaaFc', '2023-12-27 23:05:32.183378');
INSERT INTO `django_session` VALUES ('sqsr6aoqz7qcuhe1atpu41xmnwkytzpv', 'eyJiYXNrZXQiOnt9fQ:1rB77k:-spyU0IPpmOI_JYoDLr8bw1RSKnQfUkJ-nWH3QJ7p5U', '2023-12-21 05:40:36.763356');
INSERT INTO `django_session` VALUES ('w4njvoiuz82kfhz0k9r0y46cpkr1qo2i', '.eJy1VV1v2yAU_SsRz3ECNv4gj1X3tqnapD0tVcWXE6-xycBMqqr890GdVQlxWrveXgy653K55xwwz4BR8yhbsHoG2H_2uuISrACCCwjBHPxqn8AKHeYAnaJJAManYHoGOvSB2nb7YI3UD5VwCRicxRjlj7LxgPhJm41acNW0umILn7I4ombxRQm5uznmnhXYUrN1q2HBMkhxnJQJ41hkmcjKGPKMowQSJqHMSxcokcwyiClCOE3SFGdcpigjqfBd7a3mrpr0dNxu1W-pn156jh0NKoSWxnjsOO3ouKIExymO8jRlESYliQhBecRJQeOCigInEngZatlYtxz8eF6DhtZyDVazNfhcmdaswdxNK8e8C5ZUz0oa8UrznezA2vM3Hj5f_-3T1wGrrd512JKKumqWnLZ0pzZWLvdaCcvbZZfnmH1_N9UlHdOZllRwbWvW09kQZof5bCSbw72HZSU8iiCMwxLrtc15ztyQxjGbpI2byY3ST0PEec39j-qMohYKlYQBFJa_u535riYcxrvbD-ittJDadMN1pc-yBmo8jNClDCOVTcMA7jEOS4rdkGUo8UPKiLexhOUEuV0FAqEvRIqcfOSobyV_VLZd_v3bqX1bqca8ceCvrRhoyQQlekQdzj60KA8DWU_5gr10WjCOfIu44L7hpCj8kOPkck_j9zTbSu5ERHftu_blkuMrVfzbZiKuNv3W-fdvudHK7q-bdZIz3J5_QLrvvzWIaGgKCQNFr0u8a5jRaXdpXKGLu6Rq98K3r-P1KxQkjrFmaIOTZApERygMwL7yIs78CYmTfKILowpdXAvOlfXiWtOq-q0H5SJzhA-DW5wkVCh7-IKj-HAPDn8A2gqn2g:1rE0KV:ZVsY6wc_o0E1EyzLc0KKIwZ1JoCAu5mbuWcjvHWjwss', '2023-12-29 13:01:43.231161');

-- ----------------------------
-- Table structure for orders_order
-- ----------------------------
DROP TABLE IF EXISTS `orders_order`;
CREATE TABLE `orders_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int UNSIGNED NOT NULL,
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `country_code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `total_paid` decimal(5, 2) NOT NULL,
  `order_key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `payment_option` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billing_status` tinyint(1) NOT NULL,
  `finish` tinyint(1) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_order_product_id_096244de_fk_catalogue_product_id`(`product_id` ASC) USING BTREE,
  INDEX `orders_order_user_id_e9b59eb1_fk_account_customer_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `orders_order_product_id_096244de_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_account_customer_id` FOREIGN KEY (`user_id`) REFERENCES `account_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_order_chk_1` CHECK (`quantity` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_order
-- ----------------------------
INSERT INTO `orders_order` VALUES (1, 1, '荀子', '2864087161@qq.com', '四平校区', '西南一', '上海', '12345678910', '101', '中国', '2023-12-14 10:07:54.365502', '2023-12-14 21:40:13.289443', 0.00, '1', '1', 1, 1, 7, 4);
INSERT INTO `orders_order` VALUES (2, 1, '校园咸鱼', '', '西南一', '203', '四平', '12345678913', '', '110', '2023-12-14 21:44:25.489062', '2023-12-14 23:39:04.725607', 3.00, '0', 'paypal', 1, 1, 1, 4);
INSERT INTO `orders_order` VALUES (3, 1, '微风不噪', '', '某宿舍', '222', '嘉定', '12345678910', '', '110', '2023-12-15 00:18:40.329656', '2023-12-15 00:18:40.329656', 99.00, '0', 'paypal', 1, 0, 7, 3);

SET FOREIGN_KEY_CHECKS = 1;
