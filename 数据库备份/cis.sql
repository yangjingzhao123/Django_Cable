/*
 Navicat Premium Data Transfer

 Source Server         : 连接
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : cis

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 04/09/2018 12:14:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add 系统模型', 1, 'add_basicmodel');
INSERT INTO `auth_permission` VALUES (2, 'Can change 系统模型', 1, 'change_basicmodel');
INSERT INTO `auth_permission` VALUES (3, 'Can delete 系统模型', 1, 'delete_basicmodel');
INSERT INTO `auth_permission` VALUES (4, 'Can view 系统模型', 1, 'view_basicmodel');
INSERT INTO `auth_permission` VALUES (5, 'Can add basic model extend', 2, 'add_basicmodelextend');
INSERT INTO `auth_permission` VALUES (6, 'Can change basic model extend', 2, 'change_basicmodelextend');
INSERT INTO `auth_permission` VALUES (7, 'Can delete basic model extend', 2, 'delete_basicmodelextend');
INSERT INTO `auth_permission` VALUES (8, 'Can view basic model extend', 2, 'view_basicmodelextend');
INSERT INTO `auth_permission` VALUES (9, 'Can add 2.分类设置', 3, 'add_category');
INSERT INTO `auth_permission` VALUES (10, 'Can change 2.分类设置', 3, 'change_category');
INSERT INTO `auth_permission` VALUES (11, 'Can delete 2.分类设置', 3, 'delete_category');
INSERT INTO `auth_permission` VALUES (12, 'Can view 2.分类设置', 3, 'view_category');
INSERT INTO `auth_permission` VALUES (13, 'Can add 系统编码', 4, 'add_objectcode');
INSERT INTO `auth_permission` VALUES (14, 'Can change 系统编码', 4, 'change_objectcode');
INSERT INTO `auth_permission` VALUES (15, 'Can delete 系统编码', 4, 'delete_objectcode');
INSERT INTO `auth_permission` VALUES (16, 'Can view 系统编码', 4, 'view_objectcode');
INSERT INTO `auth_permission` VALUES (17, 'Can add 3.1.物料编码_扩展属性', 5, 'add_objectextend');
INSERT INTO `auth_permission` VALUES (18, 'Can change 3.1.物料编码_扩展属性', 5, 'change_objectextend');
INSERT INTO `auth_permission` VALUES (19, 'Can delete 3.1.物料编码_扩展属性', 5, 'delete_objectextend');
INSERT INTO `auth_permission` VALUES (20, 'Can view 3.1.物料编码_扩展属性', 5, 'view_objectextend');
INSERT INTO `auth_permission` VALUES (21, 'Can add BOM管理', 6, 'add_bom');
INSERT INTO `auth_permission` VALUES (22, 'Can change BOM管理', 6, 'change_bom');
INSERT INTO `auth_permission` VALUES (23, 'Can delete BOM管理', 6, 'delete_bom');
INSERT INTO `auth_permission` VALUES (24, 'Can view BOM管理', 6, 'view_bom');
INSERT INTO `auth_permission` VALUES (25, 'Can add BOM属性扩展', 7, 'add_bomextend');
INSERT INTO `auth_permission` VALUES (26, 'Can change BOM属性扩展', 7, 'change_bomextend');
INSERT INTO `auth_permission` VALUES (27, 'Can delete BOM属性扩展', 7, 'delete_bomextend');
INSERT INTO `auth_permission` VALUES (28, 'Can view BOM属性扩展', 7, 'view_bomextend');
INSERT INTO `auth_permission` VALUES (29, 'Can add 订单管理', 8, 'add_order');
INSERT INTO `auth_permission` VALUES (30, 'Can change 订单管理', 8, 'change_order');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 订单管理', 8, 'delete_order');
INSERT INTO `auth_permission` VALUES (32, 'Can view 订单管理', 8, 'view_order');
INSERT INTO `auth_permission` VALUES (33, 'Can add log entry', 9, 'add_logentry');
INSERT INTO `auth_permission` VALUES (34, 'Can change log entry', 9, 'change_logentry');
INSERT INTO `auth_permission` VALUES (35, 'Can delete log entry', 9, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (36, 'Can view log entry', 9, 'view_logentry');
INSERT INTO `auth_permission` VALUES (37, 'Can add permission', 10, 'add_permission');
INSERT INTO `auth_permission` VALUES (38, 'Can change permission', 10, 'change_permission');
INSERT INTO `auth_permission` VALUES (39, 'Can delete permission', 10, 'delete_permission');
INSERT INTO `auth_permission` VALUES (40, 'Can view permission', 10, 'view_permission');
INSERT INTO `auth_permission` VALUES (41, 'Can add group', 11, 'add_group');
INSERT INTO `auth_permission` VALUES (42, 'Can change group', 11, 'change_group');
INSERT INTO `auth_permission` VALUES (43, 'Can delete group', 11, 'delete_group');
INSERT INTO `auth_permission` VALUES (44, 'Can view group', 11, 'view_group');
INSERT INTO `auth_permission` VALUES (45, 'Can add user', 12, 'add_user');
INSERT INTO `auth_permission` VALUES (46, 'Can change user', 12, 'change_user');
INSERT INTO `auth_permission` VALUES (47, 'Can delete user', 12, 'delete_user');
INSERT INTO `auth_permission` VALUES (48, 'Can view user', 12, 'view_user');
INSERT INTO `auth_permission` VALUES (49, 'Can add content type', 13, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (50, 'Can change content type', 13, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (51, 'Can delete content type', 13, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (52, 'Can view content type', 13, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (53, 'Can add session', 14, 'add_session');
INSERT INTO `auth_permission` VALUES (54, 'Can change session', 14, 'change_session');
INSERT INTO `auth_permission` VALUES (55, 'Can delete session', 14, 'delete_session');
INSERT INTO `auth_permission` VALUES (56, 'Can view session', 14, 'view_session');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$120000$xMPxAiJI5mrA$kvAEuK1RZuura6AUCa6WlUOM8DeE2fUJdspqIC49WnE=', '2018-08-29 15:11:06.654871', 1, 'admin', '', '', 'admin@163.com', 1, 1, '2018-08-29 15:10:45.081174');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bomman_bom
-- ----------------------------
DROP TABLE IF EXISTS `bomman_bom`;
CREATE TABLE `bomman_bom`  (
  `bom_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `steel_wire_weight` decimal(18, 3) NULL DEFAULT NULL,
  `consume_coefficient_sw` decimal(18, 3) NOT NULL,
  `aluminum_band_weight` decimal(18, 3) NULL DEFAULT NULL,
  `consume_coefficient_ab` decimal(18, 3) NOT NULL,
  `steel_band_weight` decimal(18, 3) NULL DEFAULT NULL,
  `consume_coefficient_sb` decimal(18, 3) NOT NULL,
  `aluminum_band_width` decimal(18, 3) NULL DEFAULT NULL,
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `del_flag` tinyint(1) NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `aluminum_band_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cable_structure_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `steel_band_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `steel_wire_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bom_id`) USING BTREE,
  INDEX `BomMan_bom_aluminum_band_id_4289d479_fk_SysSettin`(`aluminum_band_id`) USING BTREE,
  INDEX `BomMan_bom_cable_structure_id_c6484357_fk_SysSettin`(`cable_structure_id`) USING BTREE,
  INDEX `BomMan_bom_product_id_608ce01e_fk_SysSettin`(`product_id`) USING BTREE,
  INDEX `BomMan_bom_steel_band_id_4e6a0c7d_fk_SysSettin`(`steel_band_id`) USING BTREE,
  INDEX `BomMan_bom_steel_wire_id_60cf6df1_fk_SysSettin`(`steel_wire_id`) USING BTREE,
  INDEX `BomMan_bom_customer_id_243f32a2_fk_SysSettin`(`customer_id`) USING BTREE,
  CONSTRAINT `BomMan_bom_aluminum_band_id_4289d479_fk_SysSettin` FOREIGN KEY (`aluminum_band_id`) REFERENCES `syssetting_objectcode` (`object_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `BomMan_bom_cable_structure_id_c6484357_fk_SysSettin` FOREIGN KEY (`cable_structure_id`) REFERENCES `syssetting_objectcode` (`object_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `BomMan_bom_customer_id_243f32a2_fk_SysSettin` FOREIGN KEY (`customer_id`) REFERENCES `syssetting_objectcode` (`object_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `BomMan_bom_product_id_608ce01e_fk_SysSettin` FOREIGN KEY (`product_id`) REFERENCES `syssetting_objectcode` (`object_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `BomMan_bom_steel_band_id_4e6a0c7d_fk_SysSettin` FOREIGN KEY (`steel_band_id`) REFERENCES `syssetting_objectcode` (`object_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `BomMan_bom_steel_wire_id_60cf6df1_fk_SysSettin` FOREIGN KEY (`steel_wire_id`) REFERENCES `syssetting_objectcode` (`object_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bomman_bom
-- ----------------------------
INSERT INTO `bomman_bom` VALUES ('5fc5f61aade411e89f29448a5b76fe04', 12.084, 1.000, 10.481, 1.000, NULL, 1.000, NULL, NULL, '2018-09-01 12:41:40.602781', NULL, '2018-09-01 12:41:40.602781', NULL, NULL, '0fbfea88abfb11e89664448a5b76fe04', 'b2816d48aba211e8a4ca448a5b76fe04', '52ab9f3eadd011e8b142448a5b76fe04', 'f6fefe5aabfb11e89976448a5b76fe04', '5fa6ad26abfb11e8b526448a5b76fe04', '73ab645aabf911e8ba87448a5b76fe04');
INSERT INTO `bomman_bom` VALUES ('697e7cb4ade411e8b60d448a5b76fe04', 10.481, 1.000, 11.700, 1.000, NULL, 1.000, NULL, NULL, '2018-09-01 12:41:56.920579', NULL, '2018-09-01 12:41:56.920579', NULL, NULL, '0fbfea88abfb11e89664448a5b76fe04', 'e915921aaba211e89bcd448a5b76fe04', '2cf7dbf6add011e88184448a5b76fe04', '0e187a06abfc11e8bb6b448a5b76fe04', '5fa6ad26abfb11e8b526448a5b76fe04', '73ab645aabf911e8ba87448a5b76fe04');
INSERT INTO `bomman_bom` VALUES ('7137df9cade411e88817448a5b76fe04', NULL, 1.000, NULL, 1.000, NULL, 1.000, NULL, NULL, '2018-09-01 12:42:09.876580', NULL, '2018-09-01 12:42:09.876580', NULL, NULL, '285da206abfb11e88e5d448a5b76fe04', '000f058aaba311e89052448a5b76fe04', '2cf7dbf6add011e88184448a5b76fe04', '0e187a06abfc11e8bb6b448a5b76fe04', '7bf16fb8abfb11e8926b448a5b76fe04', '8946cff4abf911e8a295448a5b76fe04');

-- ----------------------------
-- Table structure for bomman_bomextend
-- ----------------------------
DROP TABLE IF EXISTS `bomman_bomextend`;
CREATE TABLE `bomman_bomextend`  (
  `extend_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extend_value` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `del_flag` tinyint(1) NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `basic_model_extend_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bom_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`extend_id`) USING BTREE,
  INDEX `BomMan_bomextend_basic_model_extend_i_d90a36b9_fk_SysSettin`(`basic_model_extend_id`) USING BTREE,
  INDEX `BomMan_bomextend_bom_id_d8f7a237_fk_BomMan_bom_bom_id`(`bom_id`) USING BTREE,
  CONSTRAINT `BomMan_bomextend_basic_model_extend_i_d90a36b9_fk_SysSettin` FOREIGN KEY (`basic_model_extend_id`) REFERENCES `syssetting_basicmodelextend` (`extend_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `BomMan_bomextend_bom_id_d8f7a237_fk_BomMan_bom_bom_id` FOREIGN KEY (`bom_id`) REFERENCES `bomman_bom` (`bom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for conman_order
-- ----------------------------
DROP TABLE IF EXISTS `conman_order`;
CREATE TABLE `conman_order`  (
  `order_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_value` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` decimal(18, 3) NOT NULL,
  `week_no` smallint(6) NOT NULL,
  `steel_wire_weight` decimal(18, 3) NULL DEFAULT NULL,
  `aluminum_band_weight` decimal(18, 3) NULL DEFAULT NULL,
  `steel_band_weight` decimal(18, 3) NULL DEFAULT NULL,
  `aluminum_band_width` decimal(18, 3) NULL DEFAULT NULL,
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `del_flag` tinyint(1) NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bom_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `ConMan_order_bom_id_34126450_fk_BomMan_bom_bom_id`(`bom_id`) USING BTREE,
  CONSTRAINT `ConMan_order_bom_id_34126450_fk_BomMan_bom_bom_id` FOREIGN KEY (`bom_id`) REFERENCES `bomman_bom` (`bom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conman_order
-- ----------------------------
INSERT INTO `conman_order` VALUES ('bb7cee38ae5811e89f0c448a5b76fe04', '2182307', '2182307', 10.000, 1, 120.840, 104.810, NULL, NULL, NULL, '2018-09-02 02:34:36.068204', NULL, '2018-09-02 02:34:36.068204', NULL, NULL, '5fc5f61aade411e89f29448a5b76fe04');
INSERT INTO `conman_order` VALUES ('c269aa10ae5811e8b619448a5b76fe04', '2170356', '2170356', 11.000, 1, 115.291, 128.700, NULL, NULL, NULL, '2018-09-02 02:34:47.695989', NULL, '2018-09-02 02:34:47.695989', NULL, NULL, '697e7cb4ade411e8b60d448a5b76fe04');
INSERT INTO `conman_order` VALUES ('c97e17d0ae5811e8926e448a5b76fe04', '2182307', '2182307', 55.000, 2, 576.455, 643.500, NULL, NULL, NULL, '2018-09-02 02:34:59.563924', NULL, '2018-09-02 02:34:59.563924', NULL, NULL, '697e7cb4ade411e8b60d448a5b76fe04');
INSERT INTO `conman_order` VALUES ('f14352d2ae5911e880bf448a5b76fe04', '2182307', '2182307', 12.000, 4, 125.772, 140.400, NULL, NULL, NULL, '2018-09-02 02:43:15.784366', NULL, '2018-09-02 02:43:15.784366', NULL, NULL, '697e7cb4ade411e8b60d448a5b76fe04');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2018-08-29 15:27:10.190391', 'ff0b330a-ab9f-11e8-bee6-448a5b76fe04', '系统模型', 1, '[{\"added\": {}}]', 1, 1);
INSERT INTO `django_admin_log` VALUES (2, '2018-08-29 15:28:19.311591', '283ce28c-aba0-11e8-a305-448a5b76fe04', '分类设置', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (3, '2018-08-29 15:28:41.529175', '357adde4-aba0-11e8-82fe-448a5b76fe04', '成品分类', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (4, '2018-08-29 15:29:04.262726', '4306d106-aba0-11e8-9941-448a5b76fe04', '原材料分类', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (5, '2018-08-29 15:29:21.276399', '4d2b33b6-aba0-11e8-b470-448a5b76fe04', '设备分类', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (6, '2018-08-29 15:29:40.245989', '587a095c-aba0-11e8-b965-448a5b76fe04', '钢丝编码', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (7, '2018-08-29 15:29:56.495452', '622870c0-aba0-11e8-a2ad-448a5b76fe04', '铝带编码', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (8, '2018-08-29 15:30:20.182844', '70472788-aba0-11e8-a15e-448a5b76fe04', '钢带编码', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (9, '2018-08-29 15:30:39.932176', '7c0de228-aba0-11e8-9560-448a5b76fe04', '光缆编码', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (10, '2018-08-29 15:31:00.409580', '88419280-aba0-11e8-9209-448a5b76fe04', '光缆结构', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (11, '2018-08-29 15:46:30.285823', 'b2816d48-aba2-11e8-a4ca-448a5b76fe04', '光缆结构_1.6*5', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (12, '2018-08-29 15:48:01.855663', 'e915921a-aba2-11e8-9bcd-448a5b76fe04', '光缆结构_1.6*5(12芯以上)', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (13, '2018-08-29 15:48:40.395344', '000f058a-aba3-11e8-9052-448a5b76fe04', '光缆结构_1.6*6', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (14, '2018-08-29 15:49:22.595942', '1935dd50-aba3-11e8-89c2-448a5b76fe04', '光缆结构_1.8*5', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (15, '2018-08-29 15:50:19.512463', '3b2254dc-aba3-11e8-9155-448a5b76fe04', '光缆结构_1.8*5(12芯以上)', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (16, '2018-08-29 15:55:08.719359', 'e7844242-aba3-11e8-80fb-448a5b76fe04', '光缆结构_1.8*6', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (17, '2018-08-29 15:56:48.300091', '22df60b6-aba4-11e8-841f-448a5b76fe04', '光缆结构_1.8*6(12芯以上)', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (18, '2018-08-29 15:57:20.496814', '36100e28-aba4-11e8-92d7-448a5b76fe04', '光缆结构_1.85*5', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (19, '2018-08-29 15:57:39.259446', '413e8c5c-aba4-11e8-8ea9-448a5b76fe04', '光缆结构_12F', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (20, '2018-08-29 15:58:16.150600', '573ac6dc-aba4-11e8-b46d-448a5b76fe04', '光缆结构_2.0*10', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (21, '2018-08-29 15:58:42.526177', '66f4be2c-aba4-11e8-80bb-448a5b76fe04', '光缆结构_2.0*12', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (22, '2018-08-29 15:59:37.402129', '87a9b0e6-aba4-11e8-aec5-448a5b76fe04', '光缆结构_2.0*12/*18', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (23, '2018-08-29 16:00:12.202615', '9c667382-aba4-11e8-be9b-448a5b76fe04', '光缆结构_2.0*5', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (24, '2018-08-29 16:00:36.525389', 'aae7564a-aba4-11e8-b7bd-448a5b76fe04', '光缆结构_2.0*6', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (25, '2018-08-29 16:00:59.357627', 'b883699e-aba4-11e8-95e4-448a5b76fe04', '光缆结构_2.0*8', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (26, '2018-08-30 02:07:31.091869', '73ab645a-abf9-11e8-ba87-448a5b76fe04', '钢丝_1.0', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (27, '2018-08-30 02:08:07.342585', '8946cff4-abf9-11e8-a295-448a5b76fe04', '钢丝_1.4', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (28, '2018-08-30 02:08:38.703193', '9bf99648-abf9-11e8-8bef-448a5b76fe04', '钢丝_1.45', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (29, '2018-08-30 02:09:17.713482', 'b33a15ac-abf9-11e8-8f40-448a5b76fe04', '钢丝_1.5', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (30, '2018-08-30 02:11:43.435527', '0a13fa7a-abfa-11e8-92e9-448a5b76fe04', '钢丝_1.6', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (31, '2018-08-30 02:12:09.936578', '19e13e5e-abfa-11e8-b691-448a5b76fe04', '钢丝_1.7', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (32, '2018-08-30 02:12:35.954909', '29635376-abfa-11e8-92aa-448a5b76fe04', '钢丝_1.8', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (33, '2018-08-30 02:13:10.016262', '3db0ac92-abfa-11e8-a121-448a5b76fe04', '钢丝_1.9', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (34, '2018-08-30 02:15:01.675213', '803e7ad4-abfa-11e8-853c-448a5b76fe04', '钢丝_2.0', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (35, '2018-08-30 02:16:03.306823', 'a4fab794-abfa-11e8-a10c-448a5b76fe04', '钢丝_2.15', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (36, '2018-08-30 02:19:02.437676', '0fbfea88-abfb-11e8-9664-448a5b76fe04', '铝带_19.5', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (37, '2018-08-30 02:19:43.726607', '285da206-abfb-11e8-8e5d-448a5b76fe04', '铝带_20.5', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (38, '2018-08-30 02:20:15.488351', '3b4a9088-abfb-11e8-8779-448a5b76fe04', '铝带_21.5', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (39, '2018-08-30 02:21:16.489992', '5fa6ad26-abfb-11e8-b526-448a5b76fe04', '钢带_20.00', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (40, '2018-08-30 02:22:03.956145', '7bf16fb8-abfb-11e8-926b-448a5b76fe04', '钢带_21.00', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (41, '2018-08-30 02:22:29.546614', '8b323b70-abfb-11e8-9a80-448a5b76fe04', '钢带_21.70', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (42, '2018-08-30 02:25:30.404763', 'f6fefe5a-abfb-11e8-9976-448a5b76fe04', '光缆型号_GYTA_2-12', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (43, '2018-08-30 02:26:09.159353', '0e187a06-abfc-11e8-bb6b-448a5b76fe04', '光缆型号_GYTA_14-30', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (44, '2018-08-30 02:26:50.900602', '26fb3624-abfc-11e8-8b3f-448a5b76fe04', '光缆型号_GYTA_32-36', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (45, '2018-08-30 02:32:35.532003', 'f462bd1e-abfc-11e8-b411-448a5b76fe04', 'DX 光缆型号_GYTA_2-12 钢丝_1.0 光缆结构_1.8*5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (46, '2018-08-30 02:34:27.472787', '371b8bf4-abfd-11e8-81e3-448a5b76fe04', 'YD 光缆型号_GYTA_2-12 钢丝_1.4 光缆结构_1.8*5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (47, '2018-08-30 02:36:00.317847', '6e729422-abfd-11e8-8606-448a5b76fe04', 'LT 光缆型号_GYTA_2-12 钢丝_1.4 光缆结构_1.8*5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (48, '2018-08-30 02:37:10.783005', '9872b550-abfd-11e8-9695-448a5b76fe04', 'ZY 光缆型号_GYTA_2-12 钢丝_1.4 光缆结构_1.6*5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (49, '2018-08-30 03:28:47.881512', 'ce755f14-ac04-11e8-a379-448a5b76fe04', 'DX 光缆型号_GYTA_2-12 钢丝_1.4 光缆结构_1.8*5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (50, '2018-08-30 03:29:38.915170', 'ece1dcc0-ac04-11e8-a6c6-448a5b76fe04', 'YD 光缆型号_GYTA_2-12 钢丝_1.4 光缆结构_1.8*5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (51, '2018-08-30 03:30:28.424008', '0a6428b0-ac05-11e8-9553-448a5b76fe04', 'LT 光缆型号_GYTA_2-12 钢丝_1.4 光缆结构_1.8*5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (52, '2018-08-30 03:31:23.166314', '2b04b6e2-ac05-11e8-a6ca-448a5b76fe04', 'ZY 光缆型号_GYTA_2-12 钢丝_1.4 光缆结构_1.6*5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (53, '2018-08-30 03:37:58.357852', '1695f84a-ac06-11e8-877c-448a5b76fe04', '2182307 2182307', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (54, '2018-08-30 03:44:16.165833', 'f7c6e494-ac06-11e8-8fde-448a5b76fe04', '2182307 2182307', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (55, '2018-08-30 03:44:34.985575', '02fd2f66-ac07-11e8-9fc9-448a5b76fe04', '2182307 2182307', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (56, '2018-09-01 08:37:14.648296', '3a2ceab8-adc2-11e8-a84c-448a5b76fe04', '2170356 2182307', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (57, '2018-09-01 08:56:04.699409', 'dbc14e36-adc4-11e8-9198-448a5b76fe04', '21823078 None', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (58, '2018-09-01 08:56:17.218138', 'e336e6e2-adc4-11e8-bf5e-448a5b76fe04', '2170356 None', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (59, '2018-09-01 08:56:35.664889', '02feb5d0-ac07-11e8-b52f-448a5b76fe04', '2182307 2182307', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (60, '2018-09-01 09:39:44.106843', 'f5097ba2-adca-11e8-abd5-448a5b76fe04', '客户分类', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (61, '2018-09-01 09:40:50.408660', '1c8f672e-adcb-11e8-bae6-448a5b76fe04', '电信', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (62, '2018-09-01 09:41:03.447050', '24542486-adcb-11e8-b1ce-448a5b76fe04', '移动', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (63, '2018-09-01 09:41:38.668351', '3952f1cc-adcb-11e8-a2ea-448a5b76fe04', '联通', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (64, '2018-09-01 09:41:53.042283', '41e4899c-adcb-11e8-8efa-448a5b76fe04', '自营', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (65, '2018-09-01 10:17:05.427401', '2cf7dbf6-add0-11e8-8184-448a5b76fe04', '客户_电信', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (66, '2018-09-01 10:18:08.680194', '52ab9f3e-add0-11e8-b142-448a5b76fe04', '客户_联通', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (67, '2018-09-01 10:18:48.284254', '6a477c02-add0-11e8-af8b-448a5b76fe04', '客户_自营', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (68, '2018-09-01 10:21:49.725991', 'd6697bde-add0-11e8-88f3-448a5b76fe04', '客户_电信 光缆型号_GYTA_2-12 钢丝_1.0 光缆结构_1.6*5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (69, '2018-09-01 10:25:54.400390', '6843577e-add1-11e8-aaea-448a5b76fe04', '客户_移动', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (70, '2018-09-01 10:27:05.910507', '6a477c02-add0-11e8-af8b-448a5b76fe04', '客户_移动', 2, '[{\"changed\": {\"fields\": [\"category\", \"object_name\", \"object_value\", \"type\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (71, '2018-09-01 10:27:26.119234', '6843577e-add1-11e8-aaea-448a5b76fe04', '客户_自营', 2, '[{\"changed\": {\"fields\": [\"category\", \"object_name\", \"object_value\", \"type\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (72, '2018-09-01 10:27:48.140749', 'ac0bff86-add1-11e8-a1dd-448a5b76fe04', '客户_电信 光缆型号_GYTA_14-30 钢丝_1.4 光缆结构_1.6*5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (73, '2018-09-01 10:28:44.222103', 'ac0bff86-add1-11e8-a1dd-448a5b76fe04', '客户_联通 光缆型号_GYTA_14-30 钢丝_1.4 光缆结构_1.6*5', 2, '[{\"changed\": {\"fields\": [\"customer\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (74, '2018-09-01 10:32:30.904654', '5496319a-add2-11e8-ad6d-448a5b76fe04', '客户_联通 光缆型号_GYTA_2-12 钢丝_1.0 光缆结构_1.6*5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (75, '2018-09-01 10:51:58.415282', '0c7aa2b0-add5-11e8-bc68-448a5b76fe04', '运营商 GYTA_32-36 1.4 1.8*5(12芯以上)', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (76, '2018-09-01 12:22:05.557516', '2cf7dbf6-add0-11e8-8184-448a5b76fe04', '电信', 2, '[{\"changed\": {\"fields\": [\"type\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (77, '2018-09-01 12:22:16.419261', '52ab9f3e-add0-11e8-b142-448a5b76fe04', '联通', 2, '[{\"changed\": {\"fields\": [\"type\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (78, '2018-09-01 12:22:26.262500', '6a477c02-add0-11e8-af8b-448a5b76fe04', '移动', 2, '[{\"changed\": {\"fields\": [\"type\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (79, '2018-09-01 12:22:57.559459', 'd6697bde-add0-11e8-88f3-448a5b76fe04', '电信 GYTA_2-12 1.0 1.6*5', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (80, '2018-09-01 12:22:57.600435', 'ac0bff86-add1-11e8-a1dd-448a5b76fe04', '联通 GYTA_14-30 1.4 1.6*5', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (81, '2018-09-01 12:22:57.609428', '5496319a-add2-11e8-ad6d-448a5b76fe04', '联通 GYTA_2-12 1.0 1.6*5', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (82, '2018-09-01 12:22:57.618423', '0c7aa2b0-add5-11e8-bc68-448a5b76fe04', '电信 GYTA_32-36 1.4 1.8*5(12芯以上)', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (83, '2018-09-01 12:41:40.604781', '5fc5f61a-ade4-11e8-9f29-448a5b76fe04', '联通 GYTA_2-12 1.0 1.6*5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (84, '2018-09-01 12:41:56.921578', '697e7cb4-ade4-11e8-b60d-448a5b76fe04', '电信 GYTA_14-30 1.0 1.6*5(12芯以上)', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (85, '2018-09-01 12:42:09.879579', '7137df9c-ade4-11e8-8817-448a5b76fe04', '电信 GYTA_14-30 1.4 1.6*6', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (86, '2018-09-02 02:34:36.078203', 'bb7b67ac-ae58-11e8-a56b-448a5b76fe04', '2182307 None', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (87, '2018-09-02 02:34:47.695989', 'c268237e-ae58-11e8-a866-448a5b76fe04', '2170356 None', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (88, '2018-09-02 02:34:59.563924', 'c97b0aa4-ae58-11e8-bb5d-448a5b76fe04', '2182307 None', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (89, '2018-09-02 02:43:15.794366', 'f141cc3a-ae59-11e8-b2bb-448a5b76fe04', '2182307 None', 1, '[{\"added\": {}}]', 8, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (9, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (11, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (10, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (12, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (6, 'BomMan', 'bom');
INSERT INTO `django_content_type` VALUES (7, 'BomMan', 'bomextend');
INSERT INTO `django_content_type` VALUES (8, 'ConMan', 'order');
INSERT INTO `django_content_type` VALUES (13, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (14, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (1, 'SysSetting', 'basicmodel');
INSERT INTO `django_content_type` VALUES (2, 'SysSetting', 'basicmodelextend');
INSERT INTO `django_content_type` VALUES (3, 'SysSetting', 'category');
INSERT INTO `django_content_type` VALUES (4, 'SysSetting', 'objectcode');
INSERT INTO `django_content_type` VALUES (5, 'SysSetting', 'objectextend');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'SysSetting', '0001_initial', '2018-08-29 15:10:06.951917');
INSERT INTO `django_migrations` VALUES (4, 'contenttypes', '0001_initial', '2018-08-29 15:10:09.037714');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0001_initial', '2018-08-29 15:10:10.939618');
INSERT INTO `django_migrations` VALUES (6, 'admin', '0001_initial', '2018-08-29 15:10:11.386361');
INSERT INTO `django_migrations` VALUES (7, 'admin', '0002_logentry_remove_auto_add', '2018-08-29 15:10:11.404350');
INSERT INTO `django_migrations` VALUES (8, 'admin', '0003_logentry_add_action_flag_choices', '2018-08-29 15:10:11.426339');
INSERT INTO `django_migrations` VALUES (9, 'contenttypes', '0002_remove_content_type_name', '2018-08-29 15:10:11.728163');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0002_alter_permission_name_max_length', '2018-08-29 15:10:11.938042');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0003_alter_user_email_max_length', '2018-08-29 15:10:12.222878');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0004_alter_user_username_opts', '2018-08-29 15:10:12.244865');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0005_alter_user_last_login_null', '2018-08-29 15:10:12.393780');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0006_require_contenttypes_0002', '2018-08-29 15:10:12.409771');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0007_alter_validators_add_error_messages', '2018-08-29 15:10:12.425761');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0008_alter_user_username_max_length', '2018-08-29 15:10:12.627645');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0009_alter_user_last_name_max_length', '2018-08-29 15:10:12.829528');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2018-08-29 15:10:12.959454');
INSERT INTO `django_migrations` VALUES (19, 'SysSetting', '0002_auto_20180829_2343', '2018-08-29 15:43:53.003781');
INSERT INTO `django_migrations` VALUES (25, 'BomMan', '0001_initial', '2018-09-01 10:14:47.924537');
INSERT INTO `django_migrations` VALUES (26, 'BomMan', '0002_auto_20180901_1820', '2018-09-01 10:20:17.489997');
INSERT INTO `django_migrations` VALUES (27, 'ConMan', '0001_initial', '2018-09-02 02:32:36.111414');
INSERT INTO `django_migrations` VALUES (28, 'SysSetting', '0003_auto_20180902_1032', '2018-09-02 02:32:36.131411');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_no` int(11) NULL DEFAULT NULL,
  `customer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GSType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LDType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GDType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GSXQ` decimal(18, 3) NULL DEFAULT NULL,
  `LDXQ` decimal(18, 0) NULL DEFAULT NULL,
  `GDXQ` decimal(18, 0) NULL DEFAULT NULL,
  `quantity` decimal(18, 3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES (1, 1, '客户_联通', '1.0', '1.1', NULL, 10.000, 3, NULL, 10.000);
INSERT INTO `report` VALUES (2, 1, '客户_联通', '1.0', '1.1', NULL, 10.000, 4, NULL, 15.000);
INSERT INTO `report` VALUES (3, 1, '客户_联通', '1.5', '1.2', NULL, 15.000, 5, NULL, 20.000);
INSERT INTO `report` VALUES (4, 1, '客户_联通', '1.5', '1.0', NULL, 11.000, 8, NULL, 13.000);
INSERT INTO `report` VALUES (5, 1, '客户_移动', '1.0', '1.1', NULL, 8.000, 3, NULL, 7.000);
INSERT INTO `report` VALUES (6, 1, '客户_移动', '1.0', '1.3', NULL, 6.000, 33, NULL, 9.000);
INSERT INTO `report` VALUES (7, 1, '客户_移动', '1.5', '1.3', NULL, 5.000, 4, NULL, 7.000);
INSERT INTO `report` VALUES (8, 1, '客户_移动', '2.5', '1.0', NULL, 3.000, 5, NULL, 9.000);
INSERT INTO `report` VALUES (9, 2, '客户_移动', '2.5', '1.0', NULL, 3.000, 6, NULL, 4.000);
INSERT INTO `report` VALUES (10, 2, '客户_移动', '1.0', '1.6', NULL, 5.000, 7, NULL, 10.000);
INSERT INTO `report` VALUES (11, 2, '客户_电信', '2.2', '1.1', NULL, 10.000, 3, NULL, 13.000);
INSERT INTO `report` VALUES (12, 2, '客户_电信', '2.2', '1.1', NULL, 34.000, 8, NULL, 12.000);
INSERT INTO `report` VALUES (13, 2, '客户_电信', '2.5', '1.2', NULL, 11.000, 2, NULL, 11.000);
INSERT INTO `report` VALUES (14, 2, '客户_电信', '2.5', '1.2', NULL, 34.000, 1, NULL, 11.000);
INSERT INTO `report` VALUES (15, 2, '客户_自营', '1.0', '1.3', NULL, 4.000, 4, NULL, 23.000);
INSERT INTO `report` VALUES (16, 2, '客户_自营', '1.0', '1.3', NULL, 5.000, NULL, NULL, 23.000);
INSERT INTO `report` VALUES (17, 2, '客户_自营', '1.0', '1.3', NULL, NULL, 3, NULL, 23.000);
INSERT INTO `report` VALUES (18, 2, '客户_自营', '2.0', '1.2', NULL, 3.000, 3, NULL, 23.000);

-- ----------------------------
-- Table structure for syssetting_basicmodel
-- ----------------------------
DROP TABLE IF EXISTS `syssetting_basicmodel`;
CREATE TABLE `syssetting_basicmodel`  (
  `model_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model_value` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `del_flag` tinyint(1) NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`model_id`) USING BTREE,
  UNIQUE INDEX `model_name`(`model_name`) USING BTREE,
  UNIQUE INDEX `model_value`(`model_value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syssetting_basicmodel
-- ----------------------------
INSERT INTO `syssetting_basicmodel` VALUES ('ff0b330aab9f11e8bee6448a5b76fe04', '系统模型', 'SysModel', NULL, '2018-08-29 15:27:10.188392', NULL, '2018-08-29 15:27:10.189392', NULL, NULL);

-- ----------------------------
-- Table structure for syssetting_basicmodelextend
-- ----------------------------
DROP TABLE IF EXISTS `syssetting_basicmodelextend`;
CREATE TABLE `syssetting_basicmodelextend`  (
  `extend_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extend_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extend_value` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `del_flag` tinyint(1) NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `model_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`extend_id`) USING BTREE,
  UNIQUE INDEX `extend_name`(`extend_name`) USING BTREE,
  UNIQUE INDEX `extend_value`(`extend_value`) USING BTREE,
  INDEX `SysSetting_basicmode_model_id_053f4f1f_fk_SysSettin`(`model_id`) USING BTREE,
  CONSTRAINT `SysSetting_basicmode_model_id_053f4f1f_fk_SysSettin` FOREIGN KEY (`model_id`) REFERENCES `syssetting_basicmodel` (`model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for syssetting_category
-- ----------------------------
DROP TABLE IF EXISTS `syssetting_category`;
CREATE TABLE `syssetting_category`  (
  `category_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_value` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `if_sealed` tinyint(1) NOT NULL,
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `del_flag` tinyint(1) NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lft` int(10) UNSIGNED NOT NULL,
  `rght` int(10) UNSIGNED NOT NULL,
  `tree_id` int(10) UNSIGNED NOT NULL,
  `level` int(10) UNSIGNED NOT NULL,
  `parent_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE,
  INDEX `SysSetting_category_lft_1dc66eb9`(`lft`) USING BTREE,
  INDEX `SysSetting_category_rght_9ed351f5`(`rght`) USING BTREE,
  INDEX `SysSetting_category_tree_id_5a7e4bb3`(`tree_id`) USING BTREE,
  INDEX `SysSetting_category_level_f277bd4e`(`level`) USING BTREE,
  INDEX `SysSetting_category_parent_id_d6d176b4`(`parent_id`) USING BTREE,
  CONSTRAINT `SysSetting_category_parent_id_d6d176b4_fk_SysSettin` FOREIGN KEY (`parent_id`) REFERENCES `syssetting_category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syssetting_category
-- ----------------------------
INSERT INTO `syssetting_category` VALUES ('1c8f672eadcb11e8bae6448a5b76fe04', '电信', 'DX', 1, NULL, '2018-09-01 09:40:50.407662', NULL, '2018-09-01 09:40:50.407662', NULL, NULL, 11, 12, 1, 2, 'f5097ba2adca11e8abd5448a5b76fe04');
INSERT INTO `syssetting_category` VALUES ('24542486adcb11e8b1ce448a5b76fe04', '移动', 'YD', 1, NULL, '2018-09-01 09:41:03.444051', NULL, '2018-09-01 09:41:03.444051', NULL, NULL, 13, 14, 1, 2, 'f5097ba2adca11e8abd5448a5b76fe04');
INSERT INTO `syssetting_category` VALUES ('283ce28caba011e8a305448a5b76fe04', '分类设置', 'Classification', 0, NULL, '2018-08-29 15:28:19.309592', NULL, '2018-08-29 15:28:19.309592', NULL, NULL, 1, 28, 1, 0, NULL);
INSERT INTO `syssetting_category` VALUES ('357adde4aba011e882fe448a5b76fe04', '成品分类', 'ProductClassification', 0, NULL, '2018-08-29 15:28:41.528175', NULL, '2018-08-29 15:28:41.528175', NULL, NULL, 20, 25, 1, 1, '283ce28caba011e8a305448a5b76fe04');
INSERT INTO `syssetting_category` VALUES ('3952f1ccadcb11e8a2ea448a5b76fe04', '联通', 'LT', 1, NULL, '2018-09-01 09:41:38.666352', NULL, '2018-09-01 09:41:38.666352', NULL, NULL, 15, 16, 1, 2, 'f5097ba2adca11e8abd5448a5b76fe04');
INSERT INTO `syssetting_category` VALUES ('41e4899cadcb11e88efa448a5b76fe04', '自营', 'ZY', 1, NULL, '2018-09-01 09:41:53.041284', NULL, '2018-09-01 09:41:53.041284', NULL, NULL, 17, 18, 1, 2, 'f5097ba2adca11e8abd5448a5b76fe04');
INSERT INTO `syssetting_category` VALUES ('4306d106aba011e89941448a5b76fe04', '原材料分类', 'RawClassification', 0, NULL, '2018-08-29 15:29:04.260727', NULL, '2018-08-29 15:29:04.260727', NULL, NULL, 2, 9, 1, 1, '283ce28caba011e8a305448a5b76fe04');
INSERT INTO `syssetting_category` VALUES ('4d2b33b6aba011e8b470448a5b76fe04', '设备分类', 'EquipmentClassification', 0, NULL, '2018-08-29 15:29:21.274401', NULL, '2018-08-29 15:29:21.274401', NULL, NULL, 26, 27, 1, 1, '283ce28caba011e8a305448a5b76fe04');
INSERT INTO `syssetting_category` VALUES ('587a095caba011e8b965448a5b76fe04', '钢丝编码', 'SteelWireCode', 1, NULL, '2018-08-29 15:29:40.243990', NULL, '2018-08-29 15:29:40.243990', NULL, NULL, 3, 4, 1, 2, '4306d106aba011e89941448a5b76fe04');
INSERT INTO `syssetting_category` VALUES ('622870c0aba011e8a2ad448a5b76fe04', '铝带编码', 'AluminumBandCode', 1, NULL, '2018-08-29 15:29:56.493454', NULL, '2018-08-29 15:29:56.493454', NULL, NULL, 7, 8, 1, 2, '4306d106aba011e89941448a5b76fe04');
INSERT INTO `syssetting_category` VALUES ('70472788aba011e8a15e448a5b76fe04', '钢带编码', 'SteelBandCode', 1, NULL, '2018-08-29 15:30:20.181844', NULL, '2018-08-29 15:30:20.181844', NULL, NULL, 5, 6, 1, 2, '4306d106aba011e89941448a5b76fe04');
INSERT INTO `syssetting_category` VALUES ('7c0de228aba011e89560448a5b76fe04', '光缆编码', 'CableCode', 1, NULL, '2018-08-29 15:30:39.930177', NULL, '2018-08-29 15:30:39.930177', NULL, NULL, 23, 24, 1, 2, '357adde4aba011e882fe448a5b76fe04');
INSERT INTO `syssetting_category` VALUES ('88419280aba011e89209448a5b76fe04', '光缆结构', 'CableStructure', 1, NULL, '2018-08-29 15:31:00.408580', NULL, '2018-08-29 15:31:00.408580', NULL, NULL, 21, 22, 1, 2, '357adde4aba011e882fe448a5b76fe04');
INSERT INTO `syssetting_category` VALUES ('f5097ba2adca11e8abd5448a5b76fe04', '客户分类', 'KHFL', 0, NULL, '2018-09-01 09:39:44.104844', NULL, '2018-09-01 09:39:44.104844', NULL, NULL, 10, 19, 1, 1, '283ce28caba011e8a305448a5b76fe04');

-- ----------------------------
-- Table structure for syssetting_objectcode
-- ----------------------------
DROP TABLE IF EXISTS `syssetting_objectcode`;
CREATE TABLE `syssetting_objectcode`  (
  `object_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `object_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `object_value` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `specification` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `del_flag` tinyint(1) NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `model_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`object_id`) USING BTREE,
  INDEX `SysSetting_objectcod_model_id_70c43341_fk_SysSettin`(`model_id`) USING BTREE,
  CONSTRAINT `SysSetting_objectcod_model_id_70c43341_fk_SysSettin` FOREIGN KEY (`model_id`) REFERENCES `syssetting_basicmodel` (`model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syssetting_objectcode
-- ----------------------------
INSERT INTO `syssetting_objectcode` VALUES ('000f058aaba311e89052448a5b76fe04', '光缆结构_1.6*6', 'GLJG_1.6*6', '1.6*6', NULL, NULL, NULL, '2018-08-29 15:48:40.389347', NULL, '2018-08-29 15:48:40.389347', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('0a13fa7aabfa11e892e9448a5b76fe04', '钢丝_1.6', 'GS_1.6', '1.6', NULL, 'kg', NULL, '2018-08-30 02:11:43.425528', NULL, '2018-08-30 02:11:43.425528', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('0e187a06abfc11e8bb6b448a5b76fe04', '光缆型号_GYTA_14-30', 'GLXH_GYTA_14-30', 'GYTA', '14-30', 'km', NULL, '2018-08-30 02:26:09.149354', NULL, '2018-08-30 02:26:09.149354', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('0fbfea88abfb11e89664448a5b76fe04', '铝带_19.5', 'LD_19.5', '19.5', NULL, 'kg', NULL, '2018-08-30 02:19:02.427677', NULL, '2018-08-30 02:19:02.427677', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('1935dd50aba311e889c2448a5b76fe04', '光缆结构_1.8*5', 'GLJG_1.8*5', '1.8*5', NULL, NULL, NULL, '2018-08-29 15:49:22.586946', NULL, '2018-08-29 15:49:22.586946', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('19e13e5eabfa11e8b691448a5b76fe04', '钢丝_1.7', 'GS_1.7', '1.7', NULL, 'kg', NULL, '2018-08-30 02:12:09.926578', NULL, '2018-08-30 02:12:09.926578', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('22df60b6aba411e8841f448a5b76fe04', '光缆结构_1.8*6(12芯以上)', 'GLJG_1.8*6(glt12core)', '1.8*6(12芯以上)', NULL, NULL, NULL, '2018-08-29 15:56:48.294094', NULL, '2018-08-29 15:56:48.294094', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('26fb3624abfc11e88b3f448a5b76fe04', '光缆型号_GYTA_32-36', 'GLXH_GYTA_32-36', 'GYTA', '32-36', 'km', NULL, '2018-08-30 02:26:50.900602', NULL, '2018-08-30 02:26:50.900602', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('285da206abfb11e88e5d448a5b76fe04', '铝带_20.5', 'LD_20.5', '20.5', NULL, 'kg', NULL, '2018-08-30 02:19:43.726607', NULL, '2018-08-30 02:19:43.726607', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('29635376abfa11e892aa448a5b76fe04', '钢丝_1.8', 'GS_1.8', '1.8', NULL, 'kg', NULL, '2018-08-30 02:12:35.944910', NULL, '2018-08-30 02:12:35.944910', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('2cf7dbf6add011e88184448a5b76fe04', '客户_电信', 'KH_DX', '电信', NULL, NULL, NULL, '2018-09-01 10:17:05.415408', NULL, '2018-09-01 12:22:05.552518', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('36100e28aba411e892d7448a5b76fe04', '光缆结构_1.85*5', 'GLJG_1.85*5', '1.85*5', NULL, NULL, NULL, '2018-08-29 15:57:20.487819', NULL, '2018-08-29 15:57:20.488818', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('3b2254dcaba311e89155448a5b76fe04', '光缆结构_1.8*5(12芯以上)', 'GLJG_1.8*5(glt12core)', '1.8*5(12芯以上)', NULL, NULL, NULL, '2018-08-29 15:50:19.502470', NULL, '2018-08-29 15:50:19.502470', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('3b4a9088abfb11e88779448a5b76fe04', '铝带_21.5', 'lD_21.5', '21.5', NULL, 'kg', NULL, '2018-08-30 02:20:15.478351', NULL, '2018-08-30 02:20:15.478351', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('3db0ac92abfa11e8a121448a5b76fe04', '钢丝_1.9', 'GS_1.9', '1.9', NULL, 'kg', NULL, '2018-08-30 02:13:10.006250', NULL, '2018-08-30 02:13:10.006250', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('413e8c5caba411e88ea9448a5b76fe04', '光缆结构_12F', 'GLJG_12F', '12F', NULL, NULL, NULL, '2018-08-29 15:57:39.251450', NULL, '2018-08-29 15:57:39.251450', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('52ab9f3eadd011e8b142448a5b76fe04', '客户_联通', 'KH_LT', '联通', NULL, NULL, NULL, '2018-09-01 10:18:08.668202', NULL, '2018-09-01 12:22:16.412266', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('573ac6dcaba411e8b46d448a5b76fe04', '光缆结构_2.0*10', 'GLJG_2.0*10', '2.0*10', NULL, NULL, NULL, '2018-08-29 15:58:16.140606', NULL, '2018-08-29 15:58:16.140606', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('5fa6ad26abfb11e8b526448a5b76fe04', '钢带_20.00', 'GD_20.00', '20.00', NULL, 'kg', NULL, '2018-08-30 02:21:16.479993', NULL, '2018-08-30 02:21:16.479993', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('66f4be2caba411e880bb448a5b76fe04', '光缆结构_2.0*12', 'GLJG_2.0*12', '2.0*12', NULL, NULL, NULL, '2018-08-29 15:58:42.520180', NULL, '2018-08-29 15:58:42.520180', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('6843577eadd111e8aaea448a5b76fe04', '客户_自营', 'KH_ZY', '自营', NULL, NULL, NULL, '2018-09-01 10:25:54.392394', NULL, '2018-09-01 10:27:26.107241', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('6a477c02add011e8af8b448a5b76fe04', '客户_移动', 'KH_YD', '移动', NULL, NULL, NULL, '2018-09-01 10:18:48.277258', NULL, '2018-09-01 12:22:26.258503', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('73ab645aabf911e8ba87448a5b76fe04', '钢丝_1.0', 'GS_1.0', '1.0', NULL, 'kg', NULL, '2018-08-30 02:07:31.081869', NULL, '2018-08-30 02:07:31.081869', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('7bf16fb8abfb11e8926b448a5b76fe04', '钢带_21.00', 'GD_21.00', '21.00', NULL, 'kg', NULL, '2018-08-30 02:22:03.946145', NULL, '2018-08-30 02:22:03.946145', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('803e7ad4abfa11e8853c448a5b76fe04', '钢丝_2.0', 'GS_2.0', '2.0', NULL, 'kg', NULL, '2018-08-30 02:15:01.665213', NULL, '2018-08-30 02:15:01.665213', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('87a9b0e6aba411e8aec5448a5b76fe04', '光缆结构_2.0*12/*18', 'GLJG_2.0*12/*18', '2.0*12/*18', NULL, NULL, NULL, '2018-08-29 15:59:37.392134', NULL, '2018-08-29 15:59:37.392134', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('8946cff4abf911e8a295448a5b76fe04', '钢丝_1.4', 'GS_1.4', '1.4', NULL, 'kg', NULL, '2018-08-30 02:08:07.322586', NULL, '2018-08-30 02:08:07.322586', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('8b323b70abfb11e89a80448a5b76fe04', '钢带_21.70', 'GD_21.70', '21.70', NULL, 'kg', NULL, '2018-08-30 02:22:29.536616', NULL, '2018-08-30 02:22:29.536616', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('9bf99648abf911e88bef448a5b76fe04', '钢丝_1.45', 'GS_1.45', '1.45', NULL, 'kg', NULL, '2018-08-30 02:08:38.693193', NULL, '2018-08-30 02:08:38.693193', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('9c667382aba411e8be9b448a5b76fe04', '光缆结构_2.0*5', 'GLJG_2.0*5', '2.0*5', NULL, NULL, NULL, '2018-08-29 16:00:12.188623', NULL, '2018-08-29 16:00:12.188623', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('a4fab794abfa11e8a10c448a5b76fe04', '钢丝_2.15', 'GS_2.15', '2.15', NULL, 'kg', NULL, '2018-08-30 02:16:03.296824', NULL, '2018-08-30 02:16:03.296824', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('aae7564aaba411e8b7bd448a5b76fe04', '光缆结构_2.0*6', 'GLJG_2.0*6', '2.0*6', NULL, NULL, NULL, '2018-08-29 16:00:36.518393', NULL, '2018-08-29 16:00:36.518393', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('b2816d48aba211e8a4ca448a5b76fe04', '光缆结构_1.6*5', 'GLJG_1.6*5', '1.6*5', NULL, NULL, NULL, '2018-08-29 15:46:30.276829', NULL, '2018-08-29 15:46:30.276829', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('b33a15acabf911e88f40448a5b76fe04', '钢丝_1.5', 'GS_1.5', '1.5', NULL, 'kg', NULL, '2018-08-30 02:09:17.703482', NULL, '2018-08-30 02:09:17.703482', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('b883699eaba411e895e4448a5b76fe04', '光缆结构_2.0*8', 'GLJG_2.0*8', '2.0*8', NULL, NULL, NULL, '2018-08-29 16:00:59.350630', NULL, '2018-08-29 16:00:59.350630', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('e7844242aba311e880fb448a5b76fe04', '光缆结构_1.8*6', 'GLJG_1.8*6', '1.8*6', NULL, NULL, NULL, '2018-08-29 15:55:08.712363', NULL, '2018-08-29 15:55:08.712363', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('e915921aaba211e89bcd448a5b76fe04', '光缆结构_1.6*5(12芯以上)', 'GLJG_1.6*5(glt12core)', '1.6*5(12芯以上)', NULL, NULL, NULL, '2018-08-29 15:48:01.845669', NULL, '2018-08-29 15:48:01.845669', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');
INSERT INTO `syssetting_objectcode` VALUES ('f6fefe5aabfb11e89976448a5b76fe04', '光缆型号_GYTA_2-12', 'GLXH_GYTA_2-12', 'GYTA', '2-12', 'km', NULL, '2018-08-30 02:25:30.394750', NULL, '2018-08-30 02:25:30.394750', NULL, NULL, 'ff0b330aab9f11e8bee6448a5b76fe04');

-- ----------------------------
-- Table structure for syssetting_objectcode_category
-- ----------------------------
DROP TABLE IF EXISTS `syssetting_objectcode_category`;
CREATE TABLE `syssetting_objectcode_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectcode_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `SysSetting_objectcode_ca_objectcode_id_category_i_8f273997_uniq`(`objectcode_id`, `category_id`) USING BTREE,
  INDEX `SysSetting_objectcod_category_id_3777a651_fk_SysSettin`(`category_id`) USING BTREE,
  CONSTRAINT `SysSetting_objectcod_category_id_3777a651_fk_SysSettin` FOREIGN KEY (`category_id`) REFERENCES `syssetting_category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `SysSetting_objectcod_objectcode_id_e1d72f3e_fk_SysSettin` FOREIGN KEY (`objectcode_id`) REFERENCES `syssetting_objectcode` (`object_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syssetting_objectcode_category
-- ----------------------------
INSERT INTO `syssetting_objectcode_category` VALUES (4, '000f058aaba311e89052448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (21, '0a13fa7aabfa11e892e9448a5b76fe04', '587a095caba011e8b965448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (34, '0e187a06abfc11e8bb6b448a5b76fe04', '7c0de228aba011e89560448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (27, '0fbfea88abfb11e89664448a5b76fe04', '622870c0aba011e8a2ad448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (5, '1935dd50aba311e889c2448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (22, '19e13e5eabfa11e8b691448a5b76fe04', '587a095caba011e8b965448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (8, '22df60b6aba411e8841f448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (35, '26fb3624abfc11e88b3f448a5b76fe04', '7c0de228aba011e89560448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (28, '285da206abfb11e88e5d448a5b76fe04', '622870c0aba011e8a2ad448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (23, '29635376abfa11e892aa448a5b76fe04', '587a095caba011e8b965448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (36, '2cf7dbf6add011e88184448a5b76fe04', '1c8f672eadcb11e8bae6448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (9, '36100e28aba411e892d7448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (6, '3b2254dcaba311e89155448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (29, '3b4a9088abfb11e88779448a5b76fe04', '622870c0aba011e8a2ad448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (24, '3db0ac92abfa11e8a121448a5b76fe04', '587a095caba011e8b965448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (10, '413e8c5caba411e88ea9448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (37, '52ab9f3eadd011e8b142448a5b76fe04', '3952f1ccadcb11e8a2ea448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (11, '573ac6dcaba411e8b46d448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (30, '5fa6ad26abfb11e8b526448a5b76fe04', '70472788aba011e8a15e448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (12, '66f4be2caba411e880bb448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (41, '6843577eadd111e8aaea448a5b76fe04', '41e4899cadcb11e88efa448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (40, '6a477c02add011e8af8b448a5b76fe04', '24542486adcb11e8b1ce448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (17, '73ab645aabf911e8ba87448a5b76fe04', '587a095caba011e8b965448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (31, '7bf16fb8abfb11e8926b448a5b76fe04', '70472788aba011e8a15e448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (25, '803e7ad4abfa11e8853c448a5b76fe04', '587a095caba011e8b965448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (13, '87a9b0e6aba411e8aec5448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (18, '8946cff4abf911e8a295448a5b76fe04', '587a095caba011e8b965448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (32, '8b323b70abfb11e89a80448a5b76fe04', '70472788aba011e8a15e448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (19, '9bf99648abf911e88bef448a5b76fe04', '587a095caba011e8b965448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (14, '9c667382aba411e8be9b448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (26, 'a4fab794abfa11e8a10c448a5b76fe04', '587a095caba011e8b965448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (15, 'aae7564aaba411e8b7bd448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (2, 'b2816d48aba211e8a4ca448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (20, 'b33a15acabf911e88f40448a5b76fe04', '587a095caba011e8b965448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (16, 'b883699eaba411e895e4448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (7, 'e7844242aba311e880fb448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (3, 'e915921aaba211e89bcd448a5b76fe04', '88419280aba011e89209448a5b76fe04');
INSERT INTO `syssetting_objectcode_category` VALUES (33, 'f6fefe5aabfb11e89976448a5b76fe04', '7c0de228aba011e89560448a5b76fe04');

-- ----------------------------
-- Table structure for syssetting_objectextend
-- ----------------------------
DROP TABLE IF EXISTS `syssetting_objectextend`;
CREATE TABLE `syssetting_objectextend`  (
  `extend_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extend_value` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `del_flag` tinyint(1) NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `basic_model_extend_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `object_code_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`extend_id`) USING BTREE,
  INDEX `SysSetting_objectext_basic_model_extend_i_4df13297_fk_SysSettin`(`basic_model_extend_id`) USING BTREE,
  INDEX `SysSetting_objectext_object_code_id_d1a8d1aa_fk_SysSettin`(`object_code_id`) USING BTREE,
  CONSTRAINT `SysSetting_objectext_basic_model_extend_i_4df13297_fk_SysSettin` FOREIGN KEY (`basic_model_extend_id`) REFERENCES `syssetting_basicmodelextend` (`extend_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `SysSetting_objectext_object_code_id_d1a8d1aa_fk_SysSettin` FOREIGN KEY (`object_code_id`) REFERENCES `syssetting_objectcode` (`object_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for bom_ab
-- ----------------------------
DROP VIEW IF EXISTS `bom_ab`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bom_ab` AS select `bomman_bom`.`bom_id` AS `bom_id`,`syssetting_objectcode`.`type` AS `铝带型号` from (`syssetting_objectcode` join `bomman_bom` on((`bomman_bom`.`aluminum_band_id` = `syssetting_objectcode`.`object_id`)));

-- ----------------------------
-- View structure for bom_cus
-- ----------------------------
DROP VIEW IF EXISTS `bom_cus`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bom_cus` AS select `syssetting_objectcode`.`object_name` AS `客户名称`,`bomman_bom`.`bom_id` AS `bom_id` from (`syssetting_objectcode` join `bomman_bom` on((`bomman_bom`.`customer_id` = `syssetting_objectcode`.`object_id`)));

-- ----------------------------
-- View structure for bom_product
-- ----------------------------
DROP VIEW IF EXISTS `bom_product`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bom_product` AS select `bomman_bom`.`bom_id` AS `bom_id`,`syssetting_objectcode`.`type` AS `光缆型号`,`syssetting_objectcode`.`specification` AS `芯数` from (`bomman_bom` join `syssetting_objectcode` on((`bomman_bom`.`product_id` = `syssetting_objectcode`.`object_id`)));

-- ----------------------------
-- View structure for bom_report
-- ----------------------------
DROP VIEW IF EXISTS `bom_report`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bom_report` AS select `conman_order`.`week_no` AS `week_no`,`conman_order`.`order_name` AS `order_no`,`bom_cus`.`客户名称` AS `customer`,`bom_product`.`光缆型号` AS `cable_type`,`bom_product`.`芯数` AS `core`,`bom_structure`.`光缆结构` AS `structure`,`bom_sw`.`钢丝型号` AS `GSType`,`bom_ab`.`铝带型号` AS `LDType`,`bom_sb`.`钢带型号` AS `GDType`,`conman_order`.`quantity` AS `quantity`,`conman_order`.`steel_wire_weight` AS `GSXQ`,`conman_order`.`aluminum_band_weight` AS `LDXQ`,`conman_order`.`steel_band_weight` AS `GDXQ`,`conman_order`.`aluminum_band_width` AS `LDKD`,`bomman_bom`.`steel_wire_weight` AS `BOM_GS`,`bomman_bom`.`aluminum_band_weight` AS `BOM_LD`,`bomman_bom`.`steel_band_weight` AS `BOM_GD`,`bomman_bom`.`consume_coefficient_sw` AS `BOM_GSXS`,`bomman_bom`.`consume_coefficient_ab` AS `BOM_LDXS`,`bomman_bom`.`consume_coefficient_sb` AS `BOM_GDXS`,`bomman_bom`.`aluminum_band_width` AS `BOM_LDKD`,`conman_order`.`create_time` AS `Sysdate` from (((((((`conman_order` join `bomman_bom` on((`conman_order`.`bom_id` = `bomman_bom`.`bom_id`))) join `bom_ab` on((`bom_ab`.`bom_id` = `bomman_bom`.`bom_id`))) join `bom_product` on((`bom_product`.`bom_id` = `bomman_bom`.`bom_id`))) join `bom_sb` on((`bom_sb`.`bom_id` = `bomman_bom`.`bom_id`))) join `bom_structure` on((`bom_structure`.`bom_id` = `bomman_bom`.`bom_id`))) join `bom_sw` on((`bom_sw`.`bom_id` = `bomman_bom`.`bom_id`))) join `bom_cus` on((`bom_cus`.`bom_id` = `bomman_bom`.`bom_id`)));

-- ----------------------------
-- View structure for bom_report_by_w_c_t
-- ----------------------------
DROP VIEW IF EXISTS `bom_report_by_w_c_t`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bom_report_by_w_c_t` AS select `bom_report`.`week_no` AS `week_no`,`bom_report`.`customer` AS `customer`,`bom_report`.`structure` AS `structure`,'钢丝' AS `CaiLiao`,`bom_report`.`GSType` AS `XingHao`,sum(`bom_report`.`GSXQ`) AS `XQSL`,sum(`bom_report`.`quantity`) AS `HeTongL` from `bom_report` group by `bom_report`.`week_no`,`bom_report`.`customer`,`bom_report`.`structure`,`bom_report`.`GSType` having (`XQSL` is not null) union all select `bom_report`.`week_no` AS `week_no`,`bom_report`.`customer` AS `customer`,`bom_report`.`structure` AS `structure`,'铝带' AS `CaiLiao`,`bom_report`.`LDType` AS `XingHao`,sum(`bom_report`.`LDXQ`) AS `XQSL`,sum(`bom_report`.`quantity`) AS `HeTongL` from `bom_report` group by `bom_report`.`week_no`,`bom_report`.`customer`,`bom_report`.`structure`,`bom_report`.`LDType` having (`XQSL` is not null) union all select `bom_report`.`week_no` AS `week_no`,`bom_report`.`customer` AS `customer`,`bom_report`.`structure` AS `structure`,'钢带' AS `CaiLiao`,`bom_report`.`LDType` AS `XingHao`,sum(`bom_report`.`GDXQ`) AS `XQSL`,sum(`bom_report`.`quantity`) AS `HeTongL` from `bom_report` group by `bom_report`.`week_no`,`bom_report`.`customer`,`bom_report`.`structure`,`bom_report`.`GDType` having (`XQSL` is not null) order by `week_no`,`customer`,`structure`,`CaiLiao`;

-- ----------------------------
-- View structure for bom_report_by_w_t
-- ----------------------------
DROP VIEW IF EXISTS `bom_report_by_w_t`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bom_report_by_w_t` AS select `bom_report`.`week_no` AS `week_no`,`bom_report`.`structure` AS `structure`,'钢丝' AS `CaiLiao`,`bom_report`.`GSType` AS `XingHao`,sum(`bom_report`.`GSXQ`) AS `XQSL`,sum(`bom_report`.`quantity`) AS `HeTongL` from `bom_report` group by `bom_report`.`week_no`,`bom_report`.`structure`,`bom_report`.`GSType` having (`XQSL` is not null) union all select `bom_report`.`week_no` AS `week_no`,`bom_report`.`structure` AS `structure`,'铝带' AS `CaiLiao`,`bom_report`.`LDType` AS `XingHao`,sum(`bom_report`.`LDXQ`) AS `XQSL`,sum(`bom_report`.`quantity`) AS `HeTongL` from `bom_report` group by `bom_report`.`week_no`,`bom_report`.`structure`,`bom_report`.`LDType` having (`XQSL` is not null) union all select `bom_report`.`week_no` AS `week_no`,`bom_report`.`structure` AS `structure`,'钢带' AS `CaiLiao`,`bom_report`.`LDType` AS `XingHao`,sum(`bom_report`.`GDXQ`) AS `XQSL`,sum(`bom_report`.`quantity`) AS `HeTongL` from `bom_report` group by `bom_report`.`week_no`,`bom_report`.`structure`,`bom_report`.`GDType` having (`XQSL` is not null) order by `week_no`,`structure`,`CaiLiao`;

-- ----------------------------
-- View structure for bom_sb
-- ----------------------------
DROP VIEW IF EXISTS `bom_sb`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bom_sb` AS select `bomman_bom`.`bom_id` AS `bom_id`,`syssetting_objectcode`.`type` AS `钢带型号` from (`syssetting_objectcode` join `bomman_bom` on((`bomman_bom`.`steel_band_id` = `syssetting_objectcode`.`object_id`)));

-- ----------------------------
-- View structure for bom_structure
-- ----------------------------
DROP VIEW IF EXISTS `bom_structure`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bom_structure` AS select `bomman_bom`.`bom_id` AS `bom_id`,`syssetting_objectcode`.`type` AS `光缆结构` from (`bomman_bom` join `syssetting_objectcode` on((`bomman_bom`.`cable_structure_id` = `syssetting_objectcode`.`object_id`)));

-- ----------------------------
-- View structure for bom_sw
-- ----------------------------
DROP VIEW IF EXISTS `bom_sw`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bom_sw` AS select `bomman_bom`.`bom_id` AS `bom_id`,`syssetting_objectcode`.`type` AS `钢丝型号` from (`bomman_bom` join `syssetting_objectcode` on((`bomman_bom`.`steel_wire_id` = `syssetting_objectcode`.`object_id`)));

SET FOREIGN_KEY_CHECKS = 1;
