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

 Date: 17/09/2019 17:47:30
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('Admin', 1, 1565973199);
INSERT INTO `auth_assignment` VALUES ('Administrador', 6, 1568749786);

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `auth_item` VALUES ('/cur-curso/*', 3, NULL, NULL, NULL, 1568749555, 1568749555, NULL);
INSERT INTO `auth_item` VALUES ('/cur-curso/create', 3, NULL, NULL, NULL, 1568749556, 1568749556, NULL);
INSERT INTO `auth_item` VALUES ('/cur-curso/delete', 3, NULL, NULL, NULL, 1568749555, 1568749555, NULL);
INSERT INTO `auth_item` VALUES ('/cur-curso/descargar', 3, NULL, NULL, NULL, 1568749555, 1568749555, NULL);
INSERT INTO `auth_item` VALUES ('/cur-curso/index', 3, NULL, NULL, NULL, 1568749556, 1568749556, NULL);
INSERT INTO `auth_item` VALUES ('/cur-curso/inscritos', 3, NULL, NULL, NULL, 1568749555, 1568749555, NULL);
INSERT INTO `auth_item` VALUES ('/cur-curso/update', 3, NULL, NULL, NULL, 1568749555, 1568749555, NULL);
INSERT INTO `auth_item` VALUES ('/cur-curso/view', 3, NULL, NULL, NULL, 1568749556, 1568749556, NULL);
INSERT INTO `auth_item` VALUES ('/cur-imagenes/*', 3, NULL, NULL, NULL, 1568749554, 1568749554, NULL);
INSERT INTO `auth_item` VALUES ('/cur-imagenes/create', 3, NULL, NULL, NULL, 1568749554, 1568749554, NULL);
INSERT INTO `auth_item` VALUES ('/cur-imagenes/delete', 3, NULL, NULL, NULL, 1568749554, 1568749554, NULL);
INSERT INTO `auth_item` VALUES ('/cur-imagenes/index', 3, NULL, NULL, NULL, 1568749555, 1568749555, NULL);
INSERT INTO `auth_item` VALUES ('/cur-imagenes/update', 3, NULL, NULL, NULL, 1568749554, 1568749554, NULL);
INSERT INTO `auth_item` VALUES ('/cur-imagenes/view', 3, NULL, NULL, NULL, 1568749555, 1568749555, NULL);
INSERT INTO `auth_item` VALUES ('/cur-instructor/*', 3, NULL, NULL, NULL, 1568749553, 1568749553, NULL);
INSERT INTO `auth_item` VALUES ('/cur-instructor/ajax-create', 3, NULL, NULL, NULL, 1568749554, 1568749554, NULL);
INSERT INTO `auth_item` VALUES ('/cur-instructor/create', 3, NULL, NULL, NULL, 1568749554, 1568749554, NULL);
INSERT INTO `auth_item` VALUES ('/cur-instructor/delete', 3, NULL, NULL, NULL, 1568749553, 1568749553, NULL);
INSERT INTO `auth_item` VALUES ('/cur-instructor/index', 3, NULL, NULL, NULL, 1568749554, 1568749554, NULL);
INSERT INTO `auth_item` VALUES ('/cur-instructor/update', 3, NULL, NULL, NULL, 1568749553, 1568749553, NULL);
INSERT INTO `auth_item` VALUES ('/cur-instructor/view', 3, NULL, NULL, NULL, 1568749554, 1568749554, NULL);
INSERT INTO `auth_item` VALUES ('/cur-participante/*', 3, NULL, NULL, NULL, 1568749552, 1568749552, NULL);
INSERT INTO `auth_item` VALUES ('/cur-participante/create', 3, NULL, NULL, NULL, 1568749553, 1568749553, NULL);
INSERT INTO `auth_item` VALUES ('/cur-participante/delete', 3, NULL, NULL, NULL, 1568749553, 1568749553, NULL);
INSERT INTO `auth_item` VALUES ('/cur-participante/index', 3, NULL, NULL, NULL, 1568749553, 1568749553, NULL);
INSERT INTO `auth_item` VALUES ('/cur-participante/reservar', 3, NULL, NULL, NULL, 1568749553, 1568749553, NULL);
INSERT INTO `auth_item` VALUES ('/cur-participante/update', 3, NULL, NULL, NULL, 1568749553, 1568749553, NULL);
INSERT INTO `auth_item` VALUES ('/cur-participante/view', 3, NULL, NULL, NULL, 1568749553, 1568749553, NULL);
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
INSERT INTO `auth_item` VALUES ('adminCursos', 2, 'Administrar Cursos', NULL, NULL, 1568749536, 1568749536, 'Administrador');
INSERT INTO `auth_item` VALUES ('Administrador', 1, 'Administrador', NULL, NULL, 1568749715, 1568749715, NULL);
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-curso/*');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-curso/create');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-curso/delete');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-curso/descargar');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-curso/index');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-curso/inscritos');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-curso/update');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-curso/view');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-instructor/*');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-instructor/ajax-create');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-instructor/create');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-instructor/delete');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-instructor/index');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-instructor/update');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/cur-instructor/view');
INSERT INTO `auth_item_child` VALUES ('adminCursos', '/dashboard/index');
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
INSERT INTO `auth_item_child` VALUES ('Administrador', 'Admin');
INSERT INTO `auth_item_child` VALUES ('Admin', 'adminCursos');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'adminCursos');
INSERT INTO `auth_item_child` VALUES ('Jefe', 'admRequisicion');
INSERT INTO `auth_item_child` VALUES ('Admin', 'changeOwnPassword');
INSERT INTO `auth_item_child` VALUES ('otro', 'Usuario General');
INSERT INTO `auth_item_child` VALUES ('editUserEmail', 'viewUserEmail');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUserRoles');
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item_group
-- ----------------------------
INSERT INTO `auth_item_group` VALUES ('Administrador', 'Administrador', 1568749501, 1568749501);
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cur_curso
-- ----------------------------
INSERT INTO `cur_curso` VALUES (4, 'Curso de Desarrollo de Aplicaciones Web con JAVA EE', '{\"1\":{\"cur_dirigido\":\"Desarrolladores de aplicaciones.\"},\"2\":{\"cur_dirigido\":\"Arquitectos e ingenieros de software.\"},\"3\":{\"cur_dirigido\":\"Líderes de proyecto o equipo.\"},\"4\":{\"cur_dirigido\":\"Consultores Técnicos.\"},\"5\":{\"cur_dirigido\":\"Expertos en tecnología.\"},\"6\":{\"cur_dirigido\":\"Estudiantes de licenciatura o posgrado.\"},\"7\":{\"cur_dirigido\":\"Desarrolladores de Java que desean aprender cómo utilizar todo el poder de Java EE 7.\"},\"8\":{\"cur_dirigido\":\"Profesores.\"}}', 20, '2019-09-07', '2019-10-26', 'Java Enterprise Edition (JAVA EE) es una plataforma de programación para desarrollar y desplegar software de aplicación en el lenguaje de programación java, mediante las tecnologías JSP y SERVLETS.\r\n\r\nLa tecnología JavaServer Pages(TM) (página JSP(TM)) y los servlets son las principales tecnologías de la capa web que forman parte de Java(TM) Platform, Enterprise Edition (plataforma Java EE)\r\n\r\nPor sus características robustas, JAVA EE, es utilizado para el desarrollo de sistemas bancarios, sistemas aeroportuarios, sistemas embebidos, sistemas transaccionales, etcétera. y permite garantizar la automatización de procesos empresariales de gran tamaño.\r\n\r\nEl presente curso DESARROLLO DE APLICACIONES WEB CON JAVA EE, proporciona a los participantes, los conocimientos necesarios para diseñar, construir y administrar aplicaciones web mediante los componentes de la tecnología JAVA Enterprise Edition. ', 'Al finalizar el curso, el participante será capaz de planear, construir y desplegar aplicaciones web con tecnología Java, acceso a datos y generación de reportes, mediante técnicas de orientación a objetos y herramientas de desarrollo profesional, para automatizar diversas áreas en su campo de acción.\r\n\r\nLos participantes, los participantes implementarán tecnologías FRONT-END (html5, jsp, css, javascript, xml, json, ireport) y BACK-END(jsp, servlets, beans, jslt), en el desarrollo de programas y aplicaciones web con la tecnología JAVA EE.\r\n\r\nAdemás, el participante logrará consolidar las habilidades elementales (lógica-matemática, secuenciación, análisis, diferenciación, inferenciación, identificación, relación, comparación, interpretación, comprensión, etc.), que todo desarrollador de aplicaciones requiere, aplicando conocimientos teórico-prácticos en la solución de problemas cotidianos. ', '{\"1\":{\"cur_requisitos\":\"Conocimientos básicos de programación fundamental.\"},\"2\":{\"cur_requisitos\":\"Gusto por la informática.\"},\"3\":{\"cur_requisitos\":\"Estudios mínimos de preparatoria.\"}}', '{\"1\":{\"cur_requerimientos\":\"Preferentemente llevar laptop.\"}}', 40, 'Sesiones: 8 Sábados, Fechas Septiembre 14, 21, 28, Octubre 5, 12, 19, 26, Noviembre 2\r\nHorario: sábados 8 a.m.- 2 p.m.', 4000.00, '{\"3\":{\"cur_formaPago\":\"3 Exhibiciones (Inscripción de $1,000 para iniciar el curso y dos pagos de $1500: El primero el 30 de septiembre y el segundo el 15 de octubre)\"},\"1\":{\"cur_formaPago\":\"1 Exhibición (pago único antes del Miércoles 4 de Septiembre).\"}}', '{\"1\":{\"cur_obtendra\":\"Cuaderno de Trabajo.\"},\"2\":{\"cur_obtendra\":\"Recursos Digitales.\"},\"3\":{\"cur_obtendra\":\"Acceso a página de ejercicios.\"},\"4\":{\"cur_obtendra\":\"Reconocimiento con valor curricular\"}}', 1, '<hr />\r\n<p><strong>M&Oacute;DULO I INTRODUCCI&Oacute;N AL DESARROLLO JAVA EE</strong></p>\r\n\r\n<ul>\r\n	<li>Introducci&oacute;n a las Tecnolog&iacute;as de Aplicaci&oacute;n Web</li>\r\n	<li>Comparaci&oacute;n de Tecnolog&iacute;as para desarrollo Web ( .net vs jsp vs php vs python vs..)</li>\r\n	<li>Grupos de productos de tecnolog&iacute;a java</li>\r\n	<li>Que necesito para programar en java</li>\r\n	<li>Configuraci&oacute;n e instalaci&oacute;n del jdk</li>\r\n	<li>Presentar las API y los servicios de Java EE</li>\r\n	<li>Contenedores Java EE y los Servidores de Aplicaciones Java</li>\r\n	<li>Configuraci&oacute;n e instalaci&oacute;n de Apache Tomcat</li>\r\n	<li>Entornos de desarrollo integrado</li>\r\n	<li>Configuraci&oacute;n e instalaci&oacute;n del IDE eclipse</li>\r\n	<li>Hola Mundo en JSP</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>M&Oacute;DULO II VISI&Oacute;N GENERAL DE LA TECNOLOG&Iacute;A WEB</strong></p>\r\n\r\n<ul>\r\n	<li>Fundamentos de ingenier&iacute;a web\r\n	<ul>\r\n		<li>HTML5\r\n		<ul>\r\n			<li>Hiperv&iacute;nculos</li>\r\n			<li>Im&aacute;genes</li>\r\n			<li>Listas</li>\r\n			<li>Tablas</li>\r\n			<li>Formularios</li>\r\n			<li>M&eacute;todos GET y POST</li>\r\n		</ul>\r\n		</li>\r\n		<li>CSS\r\n		<ul>\r\n			<li>Enlaces a los archivos CSS</li>\r\n			<li>Capas</li>\r\n			<li>Maquetado CSS y DIVs</li>\r\n			<li>Men&uacute;s con CSS</li>\r\n			<li>Formularios con CSS</li>\r\n		</ul>\r\n		</li>\r\n		<li>JS\r\n		<ul>\r\n			<li>Enlaces a los archivos JS</li>\r\n			<li>Variables y Operadores</li>\r\n			<li>Condicionales</li>\r\n			<li>Funciones</li>\r\n			<li>Eventos</li>\r\n			<li>Formularios</li>\r\n			<li>Ajax/Jquery</li>\r\n		</ul>\r\n		</li>\r\n		<li>Representaci&oacute;n de datos\r\n		<ul>\r\n			<li>XML</li>\r\n			<li>JSON</li>\r\n			<li>YAML</li>\r\n		</ul>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>M&Oacute;DULO III PROGRAMACI&Oacute;N ORIENTADA A OBJETOS</strong></p>\r\n\r\n<ul>\r\n	<li>Proceso de compilaci&oacute;n</li>\r\n	<li>Programaci&oacute;n orientada a objetos</li>\r\n	<li>Objetos y representaci&oacute;n de objetos</li>\r\n	<li>Clases en java</li>\r\n	<li>Clases de prueba</li>\r\n	<li>Atributos y acceso a miembros</li>\r\n	<li>Encapsulamiento, setters y getters</li>\r\n	<li>M&eacute;todos comportamientos y referencias</li>\r\n	<li>Constructores y sobrecarga de m&eacute;todos</li>\r\n	<li>Paquetes</li>\r\n	<li>Herencia</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>M&Oacute;DULO IV INTRODUCCI&Oacute;N A LOS SERVLETS</strong></p>\r\n\r\n<ul>\r\n	<li>Ciclo de vida del servlet</li>\r\n	<li>M&eacute;todos init(), service() y destroy()</li>\r\n	<li>M&eacute;todos doGet() y doPost()</li>\r\n	<li>M&eacute;todos de las interfaces HttpServletRequest y HttpServletResponse</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>M&Oacute;DULO V ELEMENTOS DE JSP</strong></p>\r\n\r\n<ul>\r\n	<li>Sintaxis y sem&aacute;ntica de JSP</li>\r\n	<li>Expresiones y scriplets</li>\r\n	<li>Declaraciones</li>\r\n	<li>Directivas de p&aacute;gina\r\n	<ul>\r\n		<li>Objetos impl&iacute;citos en las JSP</li>\r\n	</ul>\r\n	</li>\r\n	<li>Request</li>\r\n	<li>Response</li>\r\n	<li>pageContextPageContext</li>\r\n	<li>Session</li>\r\n	<li>Application</li>\r\n	<li>out</li>\r\n	<li>Config</li>\r\n	<li>Page</li>\r\n	<li>Exception</li>\r\n	<li>Beans</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>M&Oacute;DULO VI ACCESO A LAS BASES DE DATOS</strong></p>\r\n\r\n<ul>\r\n	<li>SGBD</li>\r\n	<li>DDL</li>\r\n	<li>DML</li>\r\n	<li>JDBC</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>MODULO VII PATRONES DE DISE&Ntilde;O</strong></p>\r\n\r\n<ul>\r\n	<li>Arquitectura en capas</li>\r\n	<li>MVC</li>\r\n	<li>DAO-DTO-Interfaces</li>\r\n	<li>Singleton</li>\r\n	<li>Factory</li>\r\n	<li>Facade</li>\r\n	<li>Iterator</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>M&Oacute;DULO VIII ELEMENTOS DE JSP</strong></p>\r\n\r\n<ul>\r\n	<li>Taglibs (Etiquetas personalizadas)\r\n	<ul>\r\n		<li>Directiva taglib</li>\r\n		<li>Etiquetas con atributos</li>\r\n		<li>Etiquetas con contenido en el cuerpo</li>\r\n	</ul>\r\n	</li>\r\n	<li>Cookies\r\n	<ul>\r\n		<li>Creaci&oacute;n de cookies</li>\r\n		<li>Guardar informaci&oacute;n en las cookies</li>\r\n		<li>Recuperar informaci&oacute;n de las cookies</li>\r\n	</ul>\r\n	</li>\r\n	<li>Sesiones\r\n	<ul>\r\n		<li>Creaci&oacute;n de sesiones</li>\r\n		<li>Guardar y recuperar objetos a partir de sesiones</li>\r\n		<li>Destrucci&oacute;n de sesiones</li>\r\n	</ul>\r\n	</li>\r\n	<li>Java Standard Tag Library (JSTL)\r\n	<ul>\r\n		<li>Dise&ntilde;ando p&aacute;ginas JSP con la Bibliotecas de Etiquetas Est&aacute;ndar</li>\r\n		<li>Utilizando una Biblioteca Personalizada de Etiquetas en las P&aacute;ginas JSP</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>MODULO IX REPORTES</strong></p>\r\n\r\n<ul>\r\n	<li>Ireport</li>\r\n	<li>Jasper Report</li>\r\n	<li>Integrando informes en la aplicaci&oacute;n</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>MODULO X INTRODUCCI&Oacute;N AL JPA</strong></p>\r\n\r\n<ul>\r\n	<li>Entidades</li>\r\n	<li>Campos persistentes y propiedades</li>\r\n	<li>Llaves primarias</li>\r\n	<li>Relaciones</li>\r\n	<li>Multiplicidad en las relaciones</li>\r\n</ul>\r\n\r\n<hr />\r\n<p>&nbsp;</p>\r\n', '{\"1\":{\"cur_procedimiento\":\"Paso 1: Realizar depósito en el banco a la cuenta de: Instituto Tecnológico de Villahermosa, Banamex, 7001-228660. ó Transferencia Bancaria con la CLABE INTERBANCARIA: 002790700102286602.\"},\"2\":{\"cur_procedimiento\":\"Paso 2: Entregar boucher de pago y recibir factura en el departamento de recursos financieros ubicado en el edificio A, planta alta del Instituto Tecnológico de Villahermosa.\"},\"3\":{\"cur_procedimiento\":\"Paso 3: Entregar la factura generada por el pago del curso en el departamento de Gestión Tecnológica y Vinculación, ubicado en el edificio de Incubadora CIIE, llenar y firmar el formato de inscripción.\"},\"4\":{\"cur_procedimiento\":\"Te esperamos en el Centro de Incubación el 8 de Septiembre 2019, Recepción 7:30 A.M. \"}}', 'Teléfono 9933-53-02-59\r\nExt. 200 (Centro de Cómputo) Dr. José Manuel Gómez Zea\r\nExt. 610 (Gestión Tecnológica y Vinculación). Lic. Gisela González Brindis\r\nCorreo electrónico: computo@itvillahermosa.edu.mx', '', '/files/archivo_Curso_de_Desarrollo_de_Aplicaciones_Web_con_JAVA_EE.pdf');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cur_imagenes
-- ----------------------------
INSERT INTO `cur_imagenes` VALUES (1, '/img/banners/cursojavaee1.png', 4);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

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
  `par_pagado` double DEFAULT 0,
  `par_observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `par_fkcurso` int(10) NOT NULL,
  `par_reservado` tinyint(4) DEFAULT NULL,
  `par_enteraste` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`par_id`) USING BTREE,
  INDEX `par_fkcurso`(`par_fkcurso`) USING BTREE,
  CONSTRAINT `par_fkcurso` FOREIGN KEY (`par_fkcurso`) REFERENCES `cur_curso` (`cur_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cur_participante
-- ----------------------------
INSERT INTO `cur_participante` VALUES (11, 'Daniel', 'Arcos', 'Guzman', 'H', '', 'informatica@copetab.com', 23, 'Instituto Tecnológico de Villahermosa', 4000, '', 4, NULL, NULL);
INSERT INTO `cur_participante` VALUES (12, 'Edgar', 'Omar', 'Sanchez', 'H', '', 'omar@itvillahermosa.edu.mx', 24, 'Instituto Tecnológico de Villahermosa', 4000, '', 4, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'superadmin', 'kz2px152FAWlkHbkZoCiXgBAd-S8SSjF', '$2y$13$MhlYe12xkGFnSeK0sO2up.Y9kAD9Ct6JS1i9VLP7YAqd1dFsSylz2', NULL, 1, 1, 1426062188, 1426062188, NULL, NULL, NULL, 0);
INSERT INTO `user` VALUES (6, 'eli', 'd2-i4iQTX1uFt6A7RtMqFan2axaXJSwn', '$2y$13$5wf1WOnIp4qPOx8ySgE4GOGpva/eTWK1mUYEBTQGpJCWGLhpsnIRS', NULL, 1, 0, 1568749776, 1568749776, '127.0.0.1', '', '', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 213 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_visit_log
-- ----------------------------
INSERT INTO `user_visit_log` VALUES (1, '5d814bf444022', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 6, 1568754676, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (2, '5d814c07e3a4d', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1568754695, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (3, '5d8150d6b734a', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1568755926, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (4, '5d815512a89c7', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1568757010, 'Chrome', 'Windows');
INSERT INTO `user_visit_log` VALUES (5, '5d81553c6e5f0', '127.0.0.1', 'es', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 1, 1568757052, 'Chrome', 'Windows');

SET FOREIGN_KEY_CHECKS = 1;
