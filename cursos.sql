/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : cursos

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 02/09/2019 16:50:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('Admin', 1, 1565973199);
INSERT INTO `auth_assignment` VALUES ('Admin', 4, 1565116170);
INSERT INTO `auth_assignment` VALUES ('Admin', 5, 1565116045);
INSERT INTO `auth_assignment` VALUES ('Jefe', 3, 1565743198);
INSERT INTO `auth_assignment` VALUES ('otro', 4, 1565116323);
INSERT INTO `auth_assignment` VALUES ('otro', 5, 1565116045);

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `group_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  INDEX `fk_auth_item_group_code`(`group_code`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_item_group_code` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//controller', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//crud', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//extension', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//form', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//model', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('//module', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/asset/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/asset/compress', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/asset/template', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/cache/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/cache/flush', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/cache/flush-all', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/cache/flush-schema', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/cache/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/dashboard/*', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/dashboard/create', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/dashboard/delete', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/dashboard/index', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/dashboard/update', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/dashboard/view', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/debug/*', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/*', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/db-explain', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/index', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/debug/default/view', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/debug/user/*', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/debug/user/reset-identity', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/debug/user/set-identity', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/fixture/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/fixture/load', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/fixture/unload', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/action', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/diff', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/preview', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gii/default/view', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/gridview/*', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/gridview/export/*', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/gridview/export/download', 3, NULL, NULL, NULL, 1510367287, 1510367287, NULL);
INSERT INTO `auth_item` VALUES ('/hello/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/hello/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/help/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/help/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/message/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/message/config', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/message/extract', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/create', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/down', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/history', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/mark', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/new', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/redo', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/to', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/migrate/up', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/req-area/*', 3, NULL, NULL, NULL, 1565623698, 1565623698, NULL);
INSERT INTO `auth_item` VALUES ('/req-area/create', 3, NULL, NULL, NULL, 1565623700, 1565623700, NULL);
INSERT INTO `auth_item` VALUES ('/req-area/delete', 3, NULL, NULL, NULL, 1565623698, 1565623698, NULL);
INSERT INTO `auth_item` VALUES ('/req-area/index', 3, NULL, NULL, NULL, 1565623700, 1565623700, NULL);
INSERT INTO `auth_item` VALUES ('/req-area/update', 3, NULL, NULL, NULL, 1565623699, 1565623699, NULL);
INSERT INTO `auth_item` VALUES ('/req-area/view', 3, NULL, NULL, NULL, 1565623700, 1565623700, NULL);
INSERT INTO `auth_item` VALUES ('/req-configuracion/*', 3, NULL, NULL, NULL, 1565623696, 1565623696, NULL);
INSERT INTO `auth_item` VALUES ('/req-configuracion/create', 3, NULL, NULL, NULL, 1565623697, 1565623697, NULL);
INSERT INTO `auth_item` VALUES ('/req-configuracion/delete', 3, NULL, NULL, NULL, 1565623696, 1565623696, NULL);
INSERT INTO `auth_item` VALUES ('/req-configuracion/index', 3, NULL, NULL, NULL, 1565623698, 1565623698, NULL);
INSERT INTO `auth_item` VALUES ('/req-configuracion/update', 3, NULL, NULL, NULL, 1565623697, 1565623697, NULL);
INSERT INTO `auth_item` VALUES ('/req-configuracion/view', 3, NULL, NULL, NULL, 1565623697, 1565623697, NULL);
INSERT INTO `auth_item` VALUES ('/req-detalle/*', 3, NULL, NULL, NULL, 1565623693, 1565623693, NULL);
INSERT INTO `auth_item` VALUES ('/req-detalle/create', 3, NULL, NULL, NULL, 1565623695, 1565623695, NULL);
INSERT INTO `auth_item` VALUES ('/req-detalle/delete', 3, NULL, NULL, NULL, 1565623694, 1565623694, NULL);
INSERT INTO `auth_item` VALUES ('/req-detalle/index', 3, NULL, NULL, NULL, 1565623696, 1565623696, NULL);
INSERT INTO `auth_item` VALUES ('/req-detalle/update', 3, NULL, NULL, NULL, 1565623694, 1565623694, NULL);
INSERT INTO `auth_item` VALUES ('/req-detalle/view', 3, NULL, NULL, NULL, 1565623695, 1565623695, NULL);
INSERT INTO `auth_item` VALUES ('/req-personal/*', 3, NULL, NULL, NULL, 1565623691, 1565623691, NULL);
INSERT INTO `auth_item` VALUES ('/req-personal/create', 3, NULL, NULL, NULL, 1565623692, 1565623692, NULL);
INSERT INTO `auth_item` VALUES ('/req-personal/delete', 3, NULL, NULL, NULL, 1565623691, 1565623691, NULL);
INSERT INTO `auth_item` VALUES ('/req-personal/index', 3, NULL, NULL, NULL, 1565623693, 1565623693, NULL);
INSERT INTO `auth_item` VALUES ('/req-personal/update', 3, NULL, NULL, NULL, 1565623691, 1565623691, NULL);
INSERT INTO `auth_item` VALUES ('/req-personal/view', 3, NULL, NULL, NULL, 1565623693, 1565623693, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/*', 3, NULL, NULL, NULL, 1565623687, 1565623687, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/create', 3, NULL, NULL, NULL, 1565623689, 1565623689, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/delete', 3, NULL, NULL, NULL, 1565623689, 1565623689, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/index', 3, NULL, NULL, NULL, 1565623690, 1565623690, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/report', 3, NULL, NULL, NULL, 1565623688, 1565623688, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/update', 3, NULL, NULL, NULL, 1565623689, 1565623689, NULL);
INSERT INTO `auth_item` VALUES ('/req-requisicion/view', 3, NULL, NULL, NULL, 1565623690, 1565623690, NULL);
INSERT INTO `auth_item` VALUES ('/site/*', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/about', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/captcha', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/contact', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/dash', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/error', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/index', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/login', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/site/logout', 3, NULL, NULL, NULL, 1510367286, 1510367286, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/*', 3, NULL, NULL, NULL, 1565623684, 1565623684, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/contador', 3, NULL, NULL, NULL, 1565623685, 1565623685, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/create', 3, NULL, NULL, NULL, 1565623686, 1565623686, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/delete', 3, NULL, NULL, NULL, 1565623685, 1565623685, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/index', 3, NULL, NULL, NULL, 1565623687, 1565623687, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/submenu', 3, NULL, NULL, NULL, 1565623684, 1565623684, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/update', 3, NULL, NULL, NULL, 1565623685, 1565623685, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboard/view', 3, NULL, NULL, NULL, 1565623686, 1565623686, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboardgrupos/*', 3, NULL, NULL, NULL, 1565623682, 1565623682, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboardgrupos/create', 3, NULL, NULL, NULL, 1565623683, 1565623683, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboardgrupos/delete', 3, NULL, NULL, NULL, 1565623682, 1565623682, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboardgrupos/index', 3, NULL, NULL, NULL, 1565623683, 1565623683, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboardgrupos/update', 3, NULL, NULL, NULL, 1565623682, 1565623682, NULL);
INSERT INTO `auth_item` VALUES ('/sws-dashboardgrupos/view', 3, NULL, NULL, NULL, 1565623683, 1565623683, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-activate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-deactivate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/bulk-delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/create', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/grid-page-size', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/grid-sort', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/toggle-attribute', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/update', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth-item-group/view', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/captcha', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/change-own-password', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-email', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-email-receive', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/confirm-registration-email', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/login', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/logout', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/password-recovery', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/password-recovery-receive', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/auth/registration', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-activate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-deactivate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/bulk-delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/create', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/grid-page-size', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/grid-sort', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/refresh-routes', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/set-child-permissions', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/set-child-routes', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/toggle-attribute', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/update', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/permission/view', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-activate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-deactivate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/bulk-delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/create', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/grid-page-size', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/grid-sort', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/set-child-permissions', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/set-child-roles', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/toggle-attribute', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/update', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/role/view', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-permission/set-roles', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-activate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-deactivate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/bulk-delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/create', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/grid-page-size', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/grid-sort', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/toggle-attribute', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/update', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user-visit-log/view', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/*', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-activate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-deactivate', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/bulk-delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/change-password', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/create', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/delete', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/grid-page-size', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/grid-sort', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/index', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/toggle-attribute', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/update', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('/user-management/user/view', 3, NULL, NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('Admin', 1, 'Admin', NULL, NULL, 1426062189, 1426062189, NULL);
INSERT INTO `auth_item` VALUES ('admRequisicion', 2, 'Administrar requisiciones', NULL, NULL, 1565743098, 1565972287, 'userManagement');
INSERT INTO `auth_item` VALUES ('assignRolesToUsers', 2, 'Assign roles to users', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('bindUserToIp', 2, 'Bind user to IP', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('changeOwnPassword', 2, 'Change own password', NULL, NULL, 1426062189, 1426062189, 'userCommonPermissions');
INSERT INTO `auth_item` VALUES ('changeUserPassword', 2, 'Change user password', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('commonPermission', 2, 'Common permission', NULL, NULL, 1426062188, 1565973105, 'userCommonPermissions');
INSERT INTO `auth_item` VALUES ('createUsers', 2, 'Create users', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('deleteUsers', 2, 'Delete users', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('editUserEmail', 2, 'Edit user email', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('editUsers', 2, 'Edit users', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('Jefe', 1, 'Jefe', NULL, NULL, 1565742958, 1565742958, NULL);
INSERT INTO `auth_item` VALUES ('otro', 1, 'otro', NULL, NULL, 1510364638, 1510364638, NULL);
INSERT INTO `auth_item` VALUES ('Usuario General', 2, 'Usuario General', NULL, NULL, 1510367259, 1510367259, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewRegistrationIp', 2, 'View registration IP', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUserEmail', 2, 'View user email', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUserRoles', 2, 'View user roles', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewUsers', 2, 'View users', NULL, NULL, 1426062189, 1426062189, 'userManagement');
INSERT INTO `auth_item` VALUES ('viewVisitLog', 2, 'View visit log', NULL, NULL, 1426062189, 1426062189, 'userManagement');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-area/*');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-area/create');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-area/delete');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-area/index');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-area/update');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-area/view');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-configuracion/*');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-configuracion/create');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-configuracion/delete');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-configuracion/index');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-configuracion/update');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-configuracion/view');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-personal/*');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-personal/create');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-personal/delete');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-personal/index');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-personal/update');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-personal/view');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-requisicion/*');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/*');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-requisicion/create');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/create');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-requisicion/delete');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/delete');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-requisicion/index');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/index');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-requisicion/report');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/report');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-requisicion/update');
INSERT INTO `auth_item_child` VALUES ('admRequisicion', '/req-requisicion/view');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/req-requisicion/view');
INSERT INTO `auth_item_child` VALUES ('Usuario General', '/sws-dashboard/submenu');
INSERT INTO `auth_item_child` VALUES ('changeOwnPassword', '/user-management/auth/change-own-password');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/user-management/user-permission/set-roles');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/index');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/user-management/user-visit-log/view');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-activate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/bulk-deactivate');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', '/user-management/user/change-password');
INSERT INTO `auth_item_child` VALUES ('createUsers', '/user-management/user/create');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/user-management/user/delete');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/index');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/user-management/user/update');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/user-management/user/view');
INSERT INTO `auth_item_child` VALUES ('Jefe', 'admRequisicion');
INSERT INTO `auth_item_child` VALUES ('Admin', 'assignRolesToUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeOwnPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeUserPassword');
INSERT INTO `auth_item_child` VALUES ('Admin', 'createUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'deleteUsers');
INSERT INTO `auth_item_child` VALUES ('Admin', 'editUsers');
INSERT INTO `auth_item_child` VALUES ('otro', 'Usuario General');
INSERT INTO `auth_item_child` VALUES ('editUserEmail', 'viewUserEmail');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUserRoles');
INSERT INTO `auth_item_child` VALUES ('Admin', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('createUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('editUsers', 'viewUsers');

-- ----------------------------
-- Table structure for auth_item_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_group`;
CREATE TABLE `auth_item_group`  (
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_item_group
-- ----------------------------
INSERT INTO `auth_item_group` VALUES ('userCommonPermissions', 'User common permission', 1426062189, 1426062189);
INSERT INTO `auth_item_group` VALUES ('userManagement', 'User management', 1426062189, 1426062189);

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cur_curso
-- ----------------------------
DROP TABLE IF EXISTS `cur_curso`;
CREATE TABLE `cur_curso`  (
  `cur_id` int(10) NOT NULL AUTO_INCREMENT,
  `cur_nombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cur_dirigido` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cur_cupo` int(5) DEFAULT NULL,
  `cur_fechainicio` date DEFAULT NULL,
  `cur_fechafinal` date DEFAULT NULL,
  `cur_presentacion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cur_objetivo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cur_requisitos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cur_requerimientos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cur_duracion` int(255) DEFAULT NULL COMMENT 'Minutos',
  `cur_horario` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cur_costo` double(10, 2) DEFAULT NULL,
  `cur_formaPago` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cur_obtendra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cur_fkins_id` int(11) DEFAULT NULL,
  `cur_temario` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cur_procedimiento` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cur_contacto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cur_observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cur_archivo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`cur_id`) USING BTREE,
  INDEX `cur_fkins_id`(`cur_fkins_id`) USING BTREE,
  CONSTRAINT `cur_fkins_id` FOREIGN KEY (`cur_fkins_id`) REFERENCES `cur_instructor` (`ins_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cur_curso
-- ----------------------------
INSERT INTO `cur_curso` VALUES (4, 'Curso de Desarrollo de Aplicaciones Web con JAVA EE', '{\"1\":{\"cur_dirigido\":\"Desarrolladores de aplicaciones.\"},\"2\":{\"cur_dirigido\":\"Arquitectos e ingenieros de software.\"},\"3\":{\"cur_dirigido\":\"Líderes de proyecto o equipo.\"},\"4\":{\"cur_dirigido\":\"Consultores Técnicos.\"},\"5\":{\"cur_dirigido\":\"Expertos en tecnología.\"},\"6\":{\"cur_dirigido\":\"Estudiantes de licenciatura o posgrado.\"},\"7\":{\"cur_dirigido\":\"Desarrolladores de Java que desean aprender cómo utilizar todo el poder de Java EE 7.\"},\"8\":{\"cur_dirigido\":\"Profesores.\"}}', 20, '2019-09-07', '2019-10-26', 'Java Enterprise Edition (JAVA EE) es una plataforma de programación para desarrollar y desplegar software de aplicación en el lenguaje de programación java, mediante las tecnologías JSP y SERVLETS.\r\n\r\nLa tecnología JavaServer Pages(TM) (página JSP(TM)) y los servlets son las principales tecnologías de la capa web que forman parte de Java(TM) Platform, Enterprise Edition (plataforma Java EE)\r\n\r\nPor sus características robustas, JAVA EE, es utilizado para el desarrollo de sistemas bancarios, sistemas aeroportuarios, sistemas embebidos, sistemas transaccionales, etcétera. y permite garantizar la automatización de procesos empresariales de gran tamaño.\r\n\r\nEl presente curso DESARROLLO DE APLICACIONES WEB CON JAVA EE, proporciona a los participantes, los conocimientos necesarios para diseñar, construir y administrar aplicaciones web mediante los componentes de la tecnología JAVA Enterprise Edition. ', 'Al finalizar el curso, el participante será capaz de planear, construir y desplegar aplicaciones web con tecnología Java, acceso a datos y generación de reportes, mediante técnicas de orientación a objetos y herramientas de desarrollo profesional, para automatizar diversas áreas en su campo de acción.\r\n\r\nLos participantes, los participantes implementarán tecnologías FRONT-END (html5, jsp, css, javascript, xml, json, ireport) y BACK-END(jsp, servlets, beans, jslt), en el desarrollo de programas y aplicaciones web con la tecnología JAVA EE.\r\n\r\nAdemás, el participante logrará consolidar las habilidades elementales (lógica-matemática, secuenciación, análisis, diferenciación, inferenciación, identificación, relación, comparación, interpretación, comprensión, etc.), que todo desarrollador de aplicaciones requiere, aplicando conocimientos teórico-prácticos en la solución de problemas cotidianos. ', '{\"1\":{\"cur_requisitos\":\"Conocimientos básicos de programación fundamental.\"},\"2\":{\"cur_requisitos\":\"Gusto por la informática.\"},\"3\":{\"cur_requisitos\":\"Estudios mínimos de preparatoria.\"}}', '{\"1\":{\"cur_requerimientos\":\"Preferentemente llevar laptop\"}}', 40, 'Sesiones: 8 Sábados, Fechas Septiembre 7, 14, 21, 28, Octubre 5, 12, 19, 26\r\nHorario: sábados 8 a.m.- 2 p.m.', 4000.00, '{\"1\":{\"cur_formaPago\":\"1 Exhibición (pago único antes del Miércoles 4 de Septiembre)\"},\"2\":{\"cur_formaPago\":\"2 Exhibiciones ($2,000 a partir del 16 de agosto y $2,000 antes del Miercoles 4 de Septiembre)\"}}', '{\"1\":{\"cur_obtendra\":\"Cuaderno de Trabajo\"},\"2\":{\"cur_obtendra\":\"Recursos Digitales\"},\"3\":{\"cur_obtendra\":\"Acceso a página de ejercicios\"},\"4\":{\"cur_obtendra\":\"Reconocimiento con valor curricular\"}}', 1, '<hr />\r\n<p><strong>M&Oacute;DULO I INTRODUCCI&Oacute;N AL DESARROLLO JAVA EE</strong></p>\r\n\r\n<ul>\r\n	<li>Introducci&oacute;n a las Tecnolog&iacute;as de Aplicaci&oacute;n Web</li>\r\n	<li>Comparaci&oacute;n de Tecnolog&iacute;as para desarrollo Web ( .net vs jsp vs php vs python vs..)</li>\r\n	<li>Grupos de productos de tecnolog&iacute;a java</li>\r\n	<li>Que necesito para programar en java</li>\r\n	<li>Configuraci&oacute;n e instalaci&oacute;n del jdk</li>\r\n	<li>Presentar las API y los servicios de Java EE</li>\r\n	<li>Contenedores Java EE y los Servidores de Aplicaciones Java</li>\r\n	<li>Configuraci&oacute;n e instalaci&oacute;n de Apache Tomcat</li>\r\n	<li>Entornos de desarrollo integrado</li>\r\n	<li>Configuraci&oacute;n e instalaci&oacute;n del IDE eclipse</li>\r\n	<li>Hola Mundo en JSP</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>M&Oacute;DULO II VISI&Oacute;N GENERAL DE LA TECNOLOG&Iacute;A WEB</strong></p>\r\n\r\n<ul>\r\n	<li>Fundamentos de ingenier&iacute;a web\r\n	<ul>\r\n		<li>HTML5\r\n		<ul>\r\n			<li>Hiperv&iacute;nculos</li>\r\n			<li>Im&aacute;genes</li>\r\n			<li>Listas</li>\r\n			<li>Tablas</li>\r\n			<li>Formularios</li>\r\n			<li>M&eacute;todos GET y POST</li>\r\n		</ul>\r\n		</li>\r\n		<li>CSS\r\n		<ul>\r\n			<li>Enlaces a los archivos CSS</li>\r\n			<li>Capas</li>\r\n			<li>Maquetado CSS y DIVs</li>\r\n			<li>Men&uacute;s con CSS</li>\r\n			<li>Formularios con CSS</li>\r\n		</ul>\r\n		</li>\r\n		<li>JS\r\n		<ul>\r\n			<li>Enlaces a los archivos JS</li>\r\n			<li>Variables y Operadores</li>\r\n			<li>Condicionales</li>\r\n			<li>Funciones</li>\r\n			<li>Eventos</li>\r\n			<li>Formularios</li>\r\n			<li>Ajax/Jquery</li>\r\n		</ul>\r\n		</li>\r\n		<li>Representaci&oacute;n de datos\r\n		<ul>\r\n			<li>XML</li>\r\n			<li>JSON</li>\r\n			<li>YAML</li>\r\n		</ul>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>M&Oacute;DULO III PROGRAMACI&Oacute;N ORIENTADA A OBJETOS</strong></p>\r\n\r\n<ul>\r\n	<li>Proceso de compilaci&oacute;n</li>\r\n	<li>Programaci&oacute;n orientada a objetos</li>\r\n	<li>Objetos y representaci&oacute;n de objetos</li>\r\n	<li>Clases en java</li>\r\n	<li>Clases de prueba</li>\r\n	<li>Atributos y acceso a miembros</li>\r\n	<li>Encapsulamiento, setters y getters</li>\r\n	<li>M&eacute;todos comportamientos y referencias</li>\r\n	<li>Constructores y sobrecarga de m&eacute;todos</li>\r\n	<li>Paquetes</li>\r\n	<li>Herencia</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>M&Oacute;DULO IV INTRODUCCI&Oacute;N A LOS SERVLETS</strong></p>\r\n\r\n<ul>\r\n	<li>Ciclo de vida del servlet</li>\r\n	<li>M&eacute;todos init(), service() y destroy()</li>\r\n	<li>M&eacute;todos doGet() y doPost()</li>\r\n	<li>M&eacute;todos de las interfaces HttpServletRequest y HttpServletResponse</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>M&Oacute;DULO V ELEMENTOS DE JSP</strong></p>\r\n\r\n<ul>\r\n	<li>Sintaxis y sem&aacute;ntica de JSP</li>\r\n	<li>Expresiones y scriplets</li>\r\n	<li>Declaraciones</li>\r\n	<li>Directivas de p&aacute;gina\r\n	<ul>\r\n		<li>Objetos impl&iacute;citos en las JSP</li>\r\n	</ul>\r\n	</li>\r\n	<li>Request</li>\r\n	<li>Response</li>\r\n	<li>pageContextPageContext</li>\r\n	<li>Session</li>\r\n	<li>Application</li>\r\n	<li>out</li>\r\n	<li>Config</li>\r\n	<li>Page</li>\r\n	<li>Exception</li>\r\n	<li>Beans</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>M&Oacute;DULO VI ACCESO A LAS BASES DE DATOS</strong></p>\r\n\r\n<ul>\r\n	<li>SGBD</li>\r\n	<li>DDL</li>\r\n	<li>DML</li>\r\n	<li>JDBC</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>MODULO VII PATRONES DE DISE&Ntilde;O</strong></p>\r\n\r\n<ul>\r\n	<li>Arquitectura en capas</li>\r\n	<li>MVC</li>\r\n	<li>DAO-DTO-Interfaces</li>\r\n	<li>Singleton</li>\r\n	<li>Factory</li>\r\n	<li>Facade</li>\r\n	<li>Iterator</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>M&Oacute;DULO VIII ELEMENTOS DE JSP</strong></p>\r\n\r\n<ul>\r\n	<li>Taglibs (Etiquetas personalizadas)\r\n	<ul>\r\n		<li>Directiva taglib</li>\r\n		<li>Etiquetas con atributos</li>\r\n		<li>Etiquetas con contenido en el cuerpo</li>\r\n	</ul>\r\n	</li>\r\n	<li>Cookies\r\n	<ul>\r\n		<li>Creaci&oacute;n de cookies</li>\r\n		<li>Guardar informaci&oacute;n en las cookies</li>\r\n		<li>Recuperar informaci&oacute;n de las cookies</li>\r\n	</ul>\r\n	</li>\r\n	<li>Sesiones\r\n	<ul>\r\n		<li>Creaci&oacute;n de sesiones</li>\r\n		<li>Guardar y recuperar objetos a partir de sesiones</li>\r\n		<li>Destrucci&oacute;n de sesiones</li>\r\n	</ul>\r\n	</li>\r\n	<li>Java Standard Tag Library (JSTL)\r\n	<ul>\r\n		<li>Dise&ntilde;ando p&aacute;ginas JSP con la Bibliotecas de Etiquetas Est&aacute;ndar</li>\r\n		<li>Utilizando una Biblioteca Personalizada de Etiquetas en las P&aacute;ginas JSP</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>MODULO IX REPORTES</strong></p>\r\n\r\n<ul>\r\n	<li>Ireport</li>\r\n	<li>Jasper Report</li>\r\n	<li>Integrando informes en la aplicaci&oacute;n</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>MODULO X INTRODUCCI&Oacute;N AL JPA</strong></p>\r\n\r\n<ul>\r\n	<li>Entidades</li>\r\n	<li>Campos persistentes y propiedades</li>\r\n	<li>Llaves primarias</li>\r\n	<li>Relaciones</li>\r\n	<li>Multiplicidad en las relaciones</li>\r\n</ul>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n', '{\"1\":{\"cur_procedimiento\":\"Paso 1: Realizar depósito en el banco a la cuenta de: Instituto Tecnológico de Villahermosa, Banamex, 7001-228660. ó Transferencia Bancaria con la CLABE INTERBANCARIA: 002790700102286602\"},\"2\":{\"cur_procedimiento\":\"Paso 2: Entregar boucher de pago y recibir factura en el departamento de recursos financieros ubicado en el edificio A, planta alta del Instituto Tecnológico de Villahermosa.\"},\"3\":{\"cur_procedimiento\":\"Paso 3: Entregar la factura generada por el pago del curso en el departamento de Gestión Tecnológica y Vinculación, ubicado en el edificio de Incubadora CIIE, llenar y firmar el formato de inscripción.\"},\"4\":{\"cur_procedimiento\":\"Te esperamos en el Centro de Incubación el 8 de Septiembre 2019, Recepción 7:30 A.M. \"}}', 'Teléfono 9933-53-02-59\r\nExt. 200 (Centro de Cómputo) Dr. José Manuel Gómez Zea\r\nExt. 610 (Gestión Tecnológica y Vinculación). Lic. Gisela González Brindis\r\nCorreo electrónico: computo@itvillahermosa.edu.mx', '', '/files/archivo_Curso_de_Desarrollo_de_Aplicaciones_Web_con_JAVA_EE.pdf');

-- ----------------------------
-- Table structure for cur_imagenes
-- ----------------------------
DROP TABLE IF EXISTS `cur_imagenes`;
CREATE TABLE `cur_imagenes`  (
  `ima_id` int(11) NOT NULL AUTO_INCREMENT,
  `ima_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ima_fkcurso` int(10) NOT NULL,
  PRIMARY KEY (`ima_id`) USING BTREE,
  INDEX `ima_fkcurso`(`ima_fkcurso`) USING BTREE,
  CONSTRAINT `ima_fkcurso` FOREIGN KEY (`ima_fkcurso`) REFERENCES `cur_curso` (`cur_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cur_imagenes
-- ----------------------------
INSERT INTO `cur_imagenes` VALUES (1, '/img/banners/cursojavaee.png', 4);

-- ----------------------------
-- Table structure for cur_instructor
-- ----------------------------
DROP TABLE IF EXISTS `cur_instructor`;
CREATE TABLE `cur_instructor`  (
  `ins_id` int(11) NOT NULL AUTO_INCREMENT,
  `ins_titulo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ins_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ins_paterno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ins_materno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ins_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`ins_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cur_instructor
-- ----------------------------
INSERT INTO `cur_instructor` VALUES (1, 'Dr.', 'José Manuel', 'Gómez', 'Zea', 'El Instructor, es catedrático del Instituto Tecnológico de Villahermosa, pertenece a la Academia de Sistemas y Computación de nivel Licenciatura y Posgrado, tiene un Doctorado en Desarrollo Tecnológico y cuenta con más de 15 años de experiencia en trabajo en la industria de las Tecnologías de la Información, en las áreas de desarrollo, consultoría e implementación de software. ');

-- ----------------------------
-- Table structure for cur_participante
-- ----------------------------
DROP TABLE IF EXISTS `cur_participante`;
CREATE TABLE `cur_participante`  (
  `par_id` int(11) NOT NULL AUTO_INCREMENT,
  `par_nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `par_paterno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `par_materno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `par_genero` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'M Mujer y H Hombre',
  `par_telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `par_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `par_edad` int(3) NOT NULL,
  `par_procedencia` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `par_pagado` double NOT NULL DEFAULT 0,
  `par_observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `par_fkcurso` int(10) NOT NULL,
  `par_reservado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`par_id`) USING BTREE,
  INDEX `par_fkcurso`(`par_fkcurso`) USING BTREE,
  CONSTRAINT `par_fkcurso` FOREIGN KEY (`par_fkcurso`) REFERENCES `cur_curso` (`cur_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `confirmation_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `superadmin` smallint(1) DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `registration_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bind_to_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email_confirmed` smallint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'superadmin', 'kz2px152FAWlkHbkZoCiXgBAd-S8SSjF', '$2y$13$MhlYe12xkGFnSeK0sO2up.Y9kAD9Ct6JS1i9VLP7YAqd1dFsSylz2', NULL, 1, 1, 1426062188, 1426062188, NULL, NULL, NULL, 0);
INSERT INTO `user` VALUES (3, 'eli_05', '8O3m-ANawBuevSyFmEZ-9ZcbQWQoY7MW', '$2y$13$uvw5DRoH0rR98cBZvdTghuc.QIcUPajtVKo7.Ct3UDYPfT1GpOwqO', NULL, 1, 1, 1565115964, 1565115964, '127.0.0.1', '', 'elizabeth050698@gmail.com', 1);
INSERT INTO `user` VALUES (4, 'Lanied', 'qLMQJ1UsxBKDkMcL_zBFmsbv7DvYcke-', '$2y$13$9/zFH0sA6LBA.ncDa8T7Sevgs4lha61fRjcr1vDBtiy0YC/9cqOHG', NULL, 1, 1, 1565115978, 1565115978, '127.0.0.1', '', 'hmaforsiv@gmail.com', 1);
INSERT INTO `user` VALUES (5, 'donal_56', 'GLkNLI_OBc9R6L_m03j1MqE4eu1-q4oW', '$2y$13$Yo5xwfnjclnYRImC52m/A.R6.77ASCXzRXmV7Z3ujZeS5Ti2.GgqO', NULL, 1, 1, 1565116002, 1565116002, '127.0.0.1', '', 'donal_56@hotmail.com', 1);

-- ----------------------------
-- Table structure for user_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_log`;
CREATE TABLE `user_visit_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `language` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  `browser` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `os` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_visit_log
-- ----------------------------
INSERT INTO `user_visit_log` VALUES (1, '5cae8867448fc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 1, 1554942055, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (2, '5ce6c3773874d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', 1, 1558627191, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (3, '5ce6e11ae8ecf', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', 1, 1558634778, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (4, '5d4498c5865c1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564776645, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (5, '5d45bd445c2fb', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564851524, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (6, '5d45e15f61432', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564860767, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (7, '5d460468c9a06', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564869736, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (8, '5d4607093c5a1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564870409, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (9, '5d46f19fa574e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564930463, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (10, '5d471f6f04c26', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564942191, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (11, '5d4747f99e9ec', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564952569, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (12, '5d47660d5a87f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1564960269, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (13, '5d479535bafe6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1564972341, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (14, '5d47eba95e663', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1564994473, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (15, '5d47ebbe1988a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', 1, 1564994494, 'Edge', 'Windows');
INSERT INTO `user_visit_log` VALUES (16, '5d48679f7a313', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565026207, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (17, '5d486d75eb7d5', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565027701, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (18, '5d48aa5c08cf1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565043292, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (19, '5d48b02a0ced8', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565044778, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (20, '5d49086e06616', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565067374, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (21, '5d49146bb3ffc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565070443, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (22, '5d49249a90b17', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565074586, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (23, '5d49269258328', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565075090, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (24, '5d492720cbc74', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565075232, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (25, '5d498e4e24b27', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565101646, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (26, '5d49901890e69', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565102104, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (27, '5d4999f327d60', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565104627, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (28, '5d49a0c88215e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565106376, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (29, '5d49a824e9361', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565108260, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (30, '5d49b455971dc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565111381, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (31, '5d49c1c61bae5', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565114822, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (32, '5d49c26467016', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565114980, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (33, '5d49c53077b10', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565115696, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (34, '5d49c5cdc76a1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565115853, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (35, '5d49c663e5112', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 4, 1565116003, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (36, '5d49c672b959c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 3, 1565116018, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (37, '5d49c69265846', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 4, 1565116050, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (38, '5d49c6a32a7c4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565116067, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (39, '5d49c6e47270d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 4, 1565116132, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (40, '5d49c6f20bfa2', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 3, 1565116146, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (41, '5d49c73f62ab6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 4, 1565116223, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (42, '5d49c7400e3a8', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565116224, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (43, '5d49c7bd6f025', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 4, 1565116349, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (44, '5d49c81b02b0b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 3, 1565116443, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (45, '5d49c9635fca0', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 4, 1565116771, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (46, '5d49c97709ed2', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565116791, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (47, '5d49c9cb8e2ce', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565116875, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (48, '5d49c9c9f2fd4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 3, 1565116873, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (49, '5d4a5df3d21d4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565154803, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (50, '5d4ae277adfa1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565188727, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (51, '5d4aec1d5e5be', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 5, 1565191197, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (52, '5d4aec58cf514', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 3, 1565191256, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (53, '5d4b02628a8b4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565196898, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (54, '5d4b02963ac5a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 3, 1565196950, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (55, '5d4b057bd6260', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565197691, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (56, '5d4b14e122cfa', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 5, 1565201633, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (57, '5d4b1ba3d0c83', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565203363, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (58, '5d4c38005d4e2', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, 1565276160, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (59, '5d4c380689d88', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 3, 1565276166, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (60, '5d4c637cc77c6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 3, 1565287292, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (61, '5d4c671518c8b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 3, 1565288213, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (62, '5d4c6898ec1cf', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 3, 1565288600, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (63, '5d4cbfcbd7be0', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565310923, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (64, '5d4d30b08af8a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565339824, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (65, '5d4d55001e14d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565349120, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (66, '5d4d81a87df95', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565360552, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (67, '5d4d86cd26090', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565361869, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (68, '5d4d8b213cba6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565362977, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (69, '5d4d93adcce67', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565365165, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (70, '5d4d9ea8c0e66', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565367976, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (71, '5d4da09a98522', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565368474, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (72, '5d4da3ce13882', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565369294, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (73, '5d4da77ee7646', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565370238, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (74, '5d4fbae759eac', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565506279, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (75, '5d4fbe3d9210b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565507133, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (76, '5d4fc3f0371af', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565508592, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (77, '5d4fc7ccceae9', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565509580, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (78, '5d50640e6348b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565549582, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (79, '5d510427f02b1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565590568, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (80, '5d51807c3b493', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565622396, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (81, '5d5187d209e7e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565624274, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (82, '5d51897d6a040', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565624701, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (83, '5d5189bac039b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565624762, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (84, '5d518a5899c1c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565624920, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (85, '5d518a9277153', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565624978, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (86, '5d518c547dcbd', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565625428, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (87, '5d518ca5628cc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565625509, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (88, '5d51905080b4f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565626448, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (89, '5d51906c9a121', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565626476, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (90, '5d5193dbb4514', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565627355, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (91, '5d5194177eac0', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565627415, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (92, '5d51965534ac1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565627989, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (93, '5d51968f615bc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565628047, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (94, '5d5196f4c9d4a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565628148, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (95, '5d519b1d2492e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565629213, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (96, '5d519b679c36f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565629287, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (97, '5d51a802e4dbe', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565632514, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (98, '5d51ab4d037fb', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565633357, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (99, '5d51ac5ccfe0c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565633628, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (100, '5d51ad4643338', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565633862, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (101, '5d51ad6e196a4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565633902, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (102, '5d51af001726f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565634304, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (103, '5d51f5431a346', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565652291, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (104, '5d51f7f6141d1', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565652982, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (105, '5d51f83fe5368', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565653055, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (106, '5d51ff7c2a60c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565654908, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (107, '5d5200000513f', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565655040, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (108, '5d52003f125b7', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565655103, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (109, '5d52022dcfb43', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565655597, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (110, '5d520f2fcfd89', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565658927, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (111, '5d52d244a1ba5', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565708868, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (112, '5d52d26ed6ee2', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565708910, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (113, '5d52d2977b78d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565708951, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (114, '5d52d2efb028c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565709039, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (115, '5d52dc3781158', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565711415, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (116, '5d52dcb931ef8', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565711545, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (117, '5d52dd2ae4fbd', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565711658, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (118, '5d52ddff66a10', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565711871, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (119, '5d52e36de309a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565713262, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (120, '5d52eff0421a8', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565716464, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (121, '5d52f0f58dc71', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565716725, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (122, '5d52f13712446', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565716791, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (123, '5d52f37da5650', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565717373, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (124, '5d5304fc7f868', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565721852, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (125, '5d535062dd8f2', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565741154, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (126, '5d5350ba6b30b', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565741242, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (127, '5d53592f87591', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 3, 1565743407, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (128, '5d53bde9371d8', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565769193, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (129, '5d543dbc8ce4e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565801916, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (130, '5d54f273e7366', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565848180, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (131, '5d55a585f14f6', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565894022, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (132, '5d55a97b05b8d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565895035, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (133, '5d561f31a9050', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565925169, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (134, '5d56d4d55647a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1565971669, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (135, '5d56da438e891', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1565973059, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (136, '5d56e1ac79316', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1565974956, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (137, '5d56e2d9efc58', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1565975257, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (138, '5d56e621139ad', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565976097, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (139, '5d56e8a8a5b7d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565976744, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (140, '5d56f8fad7559', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, 1565980922, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (141, '5d56f9cb3b3bc', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1565981131, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (142, '5d5795115b5c3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1566020881, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (143, '5d58737bcbef4', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1566077819, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (144, '5d5adf55b80c3', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 4, 1566236501, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (145, '5d5c62542dc66', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1566335572, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (146, '5d5c644e8814c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1566336078, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (147, '5d5c8127e8453', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1566343463, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (148, '5d6002c7dc32e', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1566573255, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (149, '5d60044be46c8', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1566573643, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (150, '5d64654d0f179', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1566860621, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (151, '5d652e6f2c1fe', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1566912111, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (152, '5d658b41549cd', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1566935873, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (153, '5d65b0fe8ac59', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1566945534, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (154, '5d65c0375d174', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 1, 1566949431, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (155, '5d66e6826498c', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', 1, 1567024770, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (156, '5d66edcb0f65a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', 1, 1567026635, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (157, '5d66ef13000ff', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', 1, 1567026963, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (158, '5d682b0103e2a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', 1, 1567107841, 'Firefox', 'Windows');
INSERT INTO `user_visit_log` VALUES (159, '5d6850d6c1eed', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1567117526, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (160, '5d6d8a85f2bfb', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1567459974, 'Chrome', 'Windows');

SET FOREIGN_KEY_CHECKS = 1;
