/*
 Navicat Premium Data Transfer

 Source Server         : 远程数据库
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : 192.168.41.110:3306
 Source Schema         : simple_admin

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 20/06/2024 14:14:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apms_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `apms_operation_log`;
CREATE TABLE `apms_operation_log`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'User ID | 用户 ID',
  `operator_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Operator ID | 操作人 ID',
  `change` bigint NOT NULL COMMENT 'Balance modification | 配额改变',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Remark | 备注信息',
  `permission_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Permission ID | 权限 ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operationlog_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apms_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for apms_permission
-- ----------------------------
DROP TABLE IF EXISTS `apms_permission`;
CREATE TABLE `apms_permission`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT 'State true: normal false: ban | 状态 true 正常 false 禁用',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Delete Time | 删除日期',
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'User ID | 用户 ID',
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'core' COMMENT 'Service Name | 服务名称',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'POST' COMMENT 'HTTP Method | HTTP 请求方式',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Request api path | 请求API地址',
  `balance` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Balance | 余额',
  `expired_at` timestamp NOT NULL COMMENT 'Expired Time | 到期时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `permission_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apms_permission
-- ----------------------------

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `v0` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `v1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `v2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `v3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `v4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `v5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_casbin_rule`(`ptype` ASC, `v0` ASC, `v1` ASC, `v2` ASC, `v3` ASC, `v4` ASC, `v5` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------

-- ----------------------------
-- Table structure for casbin_rules
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rules`;
CREATE TABLE `casbin_rules`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ptype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `v0` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `v1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `v2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `v3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `v4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `v5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25091 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of casbin_rules
-- ----------------------------
INSERT INTO `casbin_rules` VALUES (24929, 'p', '001', '/user/login', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24930, 'p', '001', '/user/register', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24931, 'p', '001', '/user/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24932, 'p', '001', '/user/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24933, 'p', '001', '/user/change_password', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24934, 'p', '001', '/user/info', 'GET', '', '', '');
INSERT INTO `casbin_rules` VALUES (24935, 'p', '001', '/user/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24936, 'p', '001', '/user/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24937, 'p', '001', '/user/perm', 'GET', '', '', '');
INSERT INTO `casbin_rules` VALUES (24938, 'p', '001', '/user/profile', 'GET', '', '', '');
INSERT INTO `casbin_rules` VALUES (24939, 'p', '001', '/user/profile', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24940, 'p', '001', '/user/logout', 'GET', '', '', '');
INSERT INTO `casbin_rules` VALUES (24941, 'p', '001', '/user', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24942, 'p', '001', '/role/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24943, 'p', '001', '/role/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24944, 'p', '001', '/role/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24945, 'p', '001', '/role/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24946, 'p', '001', '/role', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24947, 'p', '001', '/menu/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24948, 'p', '001', '/menu/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24949, 'p', '001', '/menu/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24950, 'p', '001', '/menu/list', 'GET', '', '', '');
INSERT INTO `casbin_rules` VALUES (24951, 'p', '001', '/menu/role/list', 'GET', '', '', '');
INSERT INTO `casbin_rules` VALUES (24952, 'p', '001', '/menu_param/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24953, 'p', '001', '/menu_param/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24954, 'p', '001', '/menu_param/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24955, 'p', '001', '/menu_param/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24956, 'p', '001', '/menu_param', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24957, 'p', '001', '/menu', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24958, 'p', '001', '/captcha', 'GET', '', '', '');
INSERT INTO `casbin_rules` VALUES (24959, 'p', '001', '/authority/api/create_or_update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24960, 'p', '001', '/authority/api/role', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24961, 'p', '001', '/authority/menu/create_or_update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24962, 'p', '001', '/authority/menu/role', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24963, 'p', '001', '/api/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24964, 'p', '001', '/api/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24965, 'p', '001', '/api/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24966, 'p', '001', '/api/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24967, 'p', '001', '/api', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24968, 'p', '001', '/dictionary', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24969, 'p', '001', '/dictionary/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24970, 'p', '001', '/dictionary/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24971, 'p', '001', '/dictionary/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24972, 'p', '001', '/dictionary_detail/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24973, 'p', '001', '/dictionary_detail', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24974, 'p', '001', '/dictionary_detail/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24975, 'p', '001', '/dictionary_detail/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24976, 'p', '001', '/dictionary_detail/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24977, 'p', '001', '/dictionary/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24978, 'p', '001', '/dict/:name', 'GET', '', '', '');
INSERT INTO `casbin_rules` VALUES (24979, 'p', '001', '/oauth_provider/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24980, 'p', '001', '/oauth_provider/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24981, 'p', '001', '/oauth_provider/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24982, 'p', '001', '/oauth_provider/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24983, 'p', '001', '/oauth/login', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24984, 'p', '001', '/oauth_provider', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24985, 'p', '001', '/token/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24986, 'p', '001', '/token/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24987, 'p', '001', '/token/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24988, 'p', '001', '/token/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24989, 'p', '001', '/token/logout', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24990, 'p', '001', '/token', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24991, 'p', '001', '/department/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24992, 'p', '001', '/department/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24993, 'p', '001', '/department/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24994, 'p', '001', '/department/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24995, 'p', '001', '/department', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24996, 'p', '001', '/position/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24997, 'p', '001', '/position/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24998, 'p', '001', '/position/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (24999, 'p', '001', '/position/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25000, 'p', '001', '/position', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25001, 'p', '001', '/task/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25002, 'p', '001', '/task/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25003, 'p', '001', '/task/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25004, 'p', '001', '/task/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25005, 'p', '001', '/task', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25006, 'p', '001', '/task_log/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25007, 'p', '001', '/task_log/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25008, 'p', '001', '/task_log/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25009, 'p', '001', '/task_log/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25010, 'p', '001', '/task_log', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25011, 'p', '001', '/email_log/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25012, 'p', '001', '/email_log/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25013, 'p', '001', '/email_log/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25014, 'p', '001', '/email_log/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25015, 'p', '001', '/email_log', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25016, 'p', '001', '/email_provider/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25017, 'p', '001', '/email_provider/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25018, 'p', '001', '/email_provider/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25019, 'p', '001', '/email_provider/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25020, 'p', '001', '/email_provider', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25021, 'p', '001', '/sms_log/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25022, 'p', '001', '/sms_log/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25023, 'p', '001', '/sms_log/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25024, 'p', '001', '/sms_log/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25025, 'p', '001', '/sms_log', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25026, 'p', '001', '/sms_provider/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25027, 'p', '001', '/sms_provider/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25028, 'p', '001', '/sms_provider/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25029, 'p', '001', '/sms_provider/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25030, 'p', '001', '/sms_provider', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25031, 'p', '001', '/sms/send', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25032, 'p', '001', '/email/send', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25033, 'p', '001', '/upload', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25034, 'p', '001', '/file/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25035, 'p', '001', '/file/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25036, 'p', '001', '/file/status', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25037, 'p', '001', '/file/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25038, 'p', '001', '/file/download/:id', 'GET', '', '', '');
INSERT INTO `casbin_rules` VALUES (25039, 'p', '001', '/file_tag/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25040, 'p', '001', '/file_tag/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25041, 'p', '001', '/file_tag/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25042, 'p', '001', '/file_tag/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25043, 'p', '001', '/file_tag', 'Post', '', '', '');
INSERT INTO `casbin_rules` VALUES (25044, 'p', '001', '/storage_provider/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25045, 'p', '001', '/storage_provider/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25046, 'p', '001', '/storage_provider/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25047, 'p', '001', '/storage_provider/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25048, 'p', '001', '/storage_provider', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25049, 'p', '001', '/cloud_file/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25050, 'p', '001', '/cloud_file/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25051, 'p', '001', '/cloud_file/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25052, 'p', '001', '/cloud_file/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25053, 'p', '001', '/cloud_file', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25054, 'p', '001', '/cloud_file/upload', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25055, 'p', '001', '/cloud_file_tag/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25056, 'p', '001', '/cloud_file_tag/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25057, 'p', '001', '/cloud_file_tag/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25058, 'p', '001', '/cloud_file_tag/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25059, 'p', '001', '/cloud_file_tag', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25060, 'p', '001', '/member/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25061, 'p', '001', '/member/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25062, 'p', '001', '/member/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25063, 'p', '001', '/member/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25064, 'p', '001', '/member', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25065, 'p', '001', '/member_rank/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25066, 'p', '001', '/member_rank/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25067, 'p', '001', '/member_rank/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25068, 'p', '001', '/member_rank/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25069, 'p', '001', '/member_rank', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25070, 'p', '001', '/student/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25071, 'p', '001', '/student/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25072, 'p', '001', '/student/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25073, 'p', '001', '/student/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25074, 'p', '001', '/student', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25075, 'p', '001', '/teacher/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25076, 'p', '001', '/teacher/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25077, 'p', '001', '/teacher/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25078, 'p', '001', '/teacher/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25079, 'p', '001', '/teacher', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25080, 'p', '001', '/permission/test', 'GET', '', '', '');
INSERT INTO `casbin_rules` VALUES (25081, 'p', '001', '/operation_log/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25082, 'p', '001', '/operation_log/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25083, 'p', '001', '/operation_log/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25084, 'p', '001', '/operation_log/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25085, 'p', '001', '/operation_log', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25086, 'p', '001', '/permission/create', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25087, 'p', '001', '/permission/update', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25088, 'p', '001', '/permission/delete', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25089, 'p', '001', '/permission/list', 'POST', '', '', '');
INSERT INTO `casbin_rules` VALUES (25090, 'p', '001', '/permission', 'POST', '', '', '');

-- ----------------------------
-- Table structure for cloud_file_tag_cloud_files
-- ----------------------------
DROP TABLE IF EXISTS `cloud_file_tag_cloud_files`;
CREATE TABLE `cloud_file_tag_cloud_files`  (
  `cloud_file_tag_id` bigint UNSIGNED NOT NULL,
  `cloud_file_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`cloud_file_tag_id`, `cloud_file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cloud_file_tag_cloud_files
-- ----------------------------

-- ----------------------------
-- Table structure for file_tag_files
-- ----------------------------
DROP TABLE IF EXISTS `file_tag_files`;
CREATE TABLE `file_tag_files`  (
  `file_tag_id` bigint UNSIGNED NOT NULL,
  `file_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`file_tag_id`, `file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_tag_files
-- ----------------------------

-- ----------------------------
-- Table structure for fms_cloud_file_tags
-- ----------------------------
DROP TABLE IF EXISTS `fms_cloud_file_tags`;
CREATE TABLE `fms_cloud_file_tags`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT 'Status 1: normal 2: ban | 状态 1 正常 2 禁用',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'CloudFileTag\'s name | 标签名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'The remark of tag | 标签的备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cloudfiletag_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fms_cloud_file_tags
-- ----------------------------

-- ----------------------------
-- Table structure for fms_cloud_files
-- ----------------------------
DROP TABLE IF EXISTS `fms_cloud_files`;
CREATE TABLE `fms_cloud_files`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT 'State true: normal false: ban | 状态 true 正常 false 禁用',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The file\'s name | 文件名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The file\'s url | 文件地址',
  `size` bigint UNSIGNED NOT NULL COMMENT 'The file\'s size | 文件大小',
  `file_type` tinyint UNSIGNED NOT NULL COMMENT 'The file\'s type | 文件类型',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The user who upload the file | 上传用户的 ID',
  `cloud_file_storage_providers` bigint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cloudfile_name`(`name` ASC) USING BTREE,
  INDEX `cloudfile_file_type`(`file_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fms_cloud_files
-- ----------------------------

-- ----------------------------
-- Table structure for fms_file_tags
-- ----------------------------
DROP TABLE IF EXISTS `fms_file_tags`;
CREATE TABLE `fms_file_tags`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT 'Status 1: normal 2: ban | 状态 1 正常 2 禁用',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'FileTag\'s name | 标签名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'The remark of tag | 标签的备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `filetag_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fms_file_tags
-- ----------------------------

-- ----------------------------
-- Table structure for fms_files
-- ----------------------------
DROP TABLE IF EXISTS `fms_files`;
CREATE TABLE `fms_files`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT 'Status 1: normal 2: ban | 状态 1 正常 2 禁用',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'File\'s name | 文件名称',
  `file_type` tinyint UNSIGNED NOT NULL COMMENT 'File\'s type | 文件类型',
  `size` bigint UNSIGNED NOT NULL COMMENT 'File\'s size | 文件大小',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'User\'s UUID | 用户的 UUID',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The md5 of the file | 文件的 md5',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `file_user_id`(`user_id` ASC) USING BTREE,
  INDEX `file_file_type`(`file_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fms_files
-- ----------------------------

-- ----------------------------
-- Table structure for fms_storage_providers
-- ----------------------------
DROP TABLE IF EXISTS `fms_storage_providers`;
CREATE TABLE `fms_storage_providers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT 'State true: normal false: ban | 状态 true 正常 false 禁用',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The cloud storage service name | 服务名称',
  `bucket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The cloud storage bucket name | 云存储服务的存储桶',
  `secret_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The secret ID | 密钥 ID',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The secret key | 密钥 Key',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The service URL | 服务器地址',
  `folder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'The folder in cloud | 云服务目标文件夹',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The service region | 服务器所在地区',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is it the default provider | 是否为默认提供商',
  `use_cdn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Does it use CDN | 是否使用 CDN',
  `cdn_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'CDN URL | CDN 地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fms_storage_providers
-- ----------------------------

-- ----------------------------
-- Table structure for mcms_email_logs
-- ----------------------------
DROP TABLE IF EXISTS `mcms_email_logs`;
CREATE TABLE `mcms_email_logs`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The target email address | 目标邮箱地址',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The subject | 发送的标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The content | 发送的内容',
  `send_status` tinyint UNSIGNED NOT NULL COMMENT 'The send status, 0 unknown 1 success 2 failed | 发送的状态, 0 未知， 1 成功， 2 失败',
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The sms service provider | 短信服务提供商',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mcms_email_logs
-- ----------------------------

-- ----------------------------
-- Table structure for mcms_email_providers
-- ----------------------------
DROP TABLE IF EXISTS `mcms_email_providers`;
CREATE TABLE `mcms_email_providers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The email provider name | 电子邮件服务的提供商',
  `auth_type` tinyint UNSIGNED NOT NULL COMMENT 'The auth type, supported plain, CRAMMD5 | 鉴权类型, 支持 plain, CRAMMD5',
  `email_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The email address | 邮箱地址',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'The email\'s password | 电子邮件的密码',
  `host_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The host name is the email service\'s host address | 电子邮箱服务的服务器地址',
  `identify` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'The identify info, for CRAMMD5 | 身份信息, 支持 CRAMMD5',
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'The secret, for CRAMMD5 | 邮箱密钥, 用于 CRAMMD5',
  `port` int UNSIGNED NULL DEFAULT NULL COMMENT 'The port of the host | 服务器端口',
  `tls` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Whether to use TLS | 是否采用 tls 加密',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is it the default provider | 是否为默认提供商',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mcms_email_providers
-- ----------------------------
INSERT INTO `mcms_email_providers` VALUES (1, '2024-05-17 13:02:12', '2024-05-17 13:02:12', 'tencent', 1, 'input your email address', 'input your password', 'smtp.qq.com', NULL, NULL, 465, 1, 1);

-- ----------------------------
-- Table structure for mcms_sms_logs
-- ----------------------------
DROP TABLE IF EXISTS `mcms_sms_logs`;
CREATE TABLE `mcms_sms_logs`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The target phone number | 目标电话',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The content | 发送的内容',
  `send_status` tinyint UNSIGNED NOT NULL COMMENT 'The send status, 0 unknown 1 success 2 failed | 发送的状态, 0 未知， 1 成功， 2 失败',
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The sms service provider | 短信服务提供商',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mcms_sms_logs
-- ----------------------------

-- ----------------------------
-- Table structure for mcms_sms_providers
-- ----------------------------
DROP TABLE IF EXISTS `mcms_sms_providers`;
CREATE TABLE `mcms_sms_providers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SMS provider name | 短信服务的提供商',
  `secret_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The secret ID | 密钥 ID',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The secret key | 密钥 Key',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The service region | 服务器所在地区',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is it the default provider | 是否为默认提供商',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mcms_sms_providers
-- ----------------------------
INSERT INTO `mcms_sms_providers` VALUES (1, '2024-05-17 13:02:12', '2024-05-17 13:02:12', 'tencent', 'input your secret ID', 'input your secret key', 'ap-nanjing', 1);

-- ----------------------------
-- Table structure for mms_members
-- ----------------------------
DROP TABLE IF EXISTS `mms_members`;
CREATE TABLE `mms_members`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT 'Status 1: normal 2: ban | 状态 1 正常 2 禁用',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Member\'s login name | 登录名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Password | 密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Nickname | 昵称',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Mobile number | 手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Email | 邮箱号',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'Avatar | 头像路径',
  `wechat_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Wechat Open ID | 微信 Open ID',
  `expired_at` datetime NULL DEFAULT NULL COMMENT 'Member expired time | 会员到期时间',
  `rank_id` bigint UNSIGNED NULL DEFAULT 2 COMMENT 'Member Rank ID | 会员等级ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `nickname`(`nickname` ASC) USING BTREE,
  UNIQUE INDEX `member_username_email`(`username` ASC, `email` ASC) USING BTREE,
  UNIQUE INDEX `member_wechat_open_id`(`wechat_open_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mms_members
-- ----------------------------
INSERT INTO `mms_members` VALUES ('018f8aa0-afd6-7d3a-996b-99c4a4e48695', '2024-05-18 07:35:38', '2024-05-18 07:35:38', 1, 'normalMember', '$2a$10$ssYivZWZTnXrZowprmww9eHV0QpF1Nfq5ld.ztSbt9ZBz2fRQGWRW', 'Normal Member', '18888888888', 'simpleadmin@gmail.com', '', NULL, '2098-12-31 16:00:00', 1);
INSERT INTO `mms_members` VALUES ('018f8aa0-afd6-7d3b-ba23-4608fa1969af', '2024-05-18 07:35:38', '2024-05-18 07:35:38', 1, 'VIPMember', '$2a$10$a9g3xntQTZDoQMr/plnYYeh9/065sWZW/e8wkfqaCuwzBXFbGHI0K', 'VIP Member', '18888888889', 'vip@gmail.com', '', NULL, '2098-12-31 16:00:00', 2);

-- ----------------------------
-- Table structure for mms_oauth_providers
-- ----------------------------
DROP TABLE IF EXISTS `mms_oauth_providers`;
CREATE TABLE `mms_oauth_providers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The provider\'s name | 提供商名称',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The client id | 客户端 id',
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The client secret | 客户端密钥',
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The redirect url | 跳转地址',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The scopes | 权限范围',
  `auth_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The auth url of the provider | 认证地址',
  `token_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The token url of the provider | 获取 token地址',
  `auth_style` bigint UNSIGNED NOT NULL COMMENT 'The auth style, 0: auto detect 1: third party log in 2: log in with username and password',
  `info_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The URL to request user information by token | 用户信息请求地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mms_oauth_providers
-- ----------------------------
INSERT INTO `mms_oauth_providers` VALUES (1, '2024-05-18 07:35:38', '2024-05-18 07:35:38', 'google', 'your client id', 'your client secret', 'http://localhost:3100/oauth/login/callback', 'email openid', 'https://accounts.google.com/o/oauth2/auth', 'https://oauth2.googleapis.com/token', 1, 'https://www.googleapis.com/oauth2/v2/userinfo?access_token=TOKEN');
INSERT INTO `mms_oauth_providers` VALUES (2, '2024-05-18 07:35:38', '2024-05-18 07:35:38', 'github', 'your client id', 'your client secret', 'http://localhost:3100/oauth/login/callback', 'email openid', 'https://github.com/login/oauth/authorize', 'https://github.com/login/oauth/access_token', 2, 'https://api.github.com/user');

-- ----------------------------
-- Table structure for mms_ranks
-- ----------------------------
DROP TABLE IF EXISTS `mms_ranks`;
CREATE TABLE `mms_ranks`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `memberrank_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mms_ranks
-- ----------------------------
INSERT INTO `mms_ranks` VALUES (1, '2024-05-18 07:35:38', '2024-05-18 07:35:38', 'memberRank.normal', '001', '普通会员 | Normal Member', '普通会员 | Normal Member');
INSERT INTO `mms_ranks` VALUES (2, '2024-05-18 07:35:38', '2024-05-18 07:35:38', 'memberRank.vip', '002', 'VIP', 'VIP');

-- ----------------------------
-- Table structure for mms_tokens
-- ----------------------------
DROP TABLE IF EXISTS `mms_tokens`;
CREATE TABLE `mms_tokens`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT 'Status 1: normal 2: ban | 状态 1 正常 2 禁用',
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT ' User\'s UUID | 用户的UUID',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Token string | Token 字符串',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'unknown' COMMENT 'Username | 用户名',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Log in source such as GitHub | Token 来源 （本地为core, 第三方如github等）',
  `expired_at` timestamp NOT NULL COMMENT ' Expire time | 过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mms_token_uuid`(`uuid` ASC) USING BTREE,
  INDEX `mms_token_expired_at`(`expired_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mms_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for role_menus
-- ----------------------------
DROP TABLE IF EXISTS `role_menus`;
CREATE TABLE `role_menus`  (
  `role_id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menus
-- ----------------------------
INSERT INTO `role_menus` VALUES (1, 1);
INSERT INTO `role_menus` VALUES (1, 2);
INSERT INTO `role_menus` VALUES (1, 3);
INSERT INTO `role_menus` VALUES (1, 4);
INSERT INTO `role_menus` VALUES (1, 5);
INSERT INTO `role_menus` VALUES (1, 6);
INSERT INTO `role_menus` VALUES (1, 7);
INSERT INTO `role_menus` VALUES (1, 8);
INSERT INTO `role_menus` VALUES (1, 9);
INSERT INTO `role_menus` VALUES (1, 10);
INSERT INTO `role_menus` VALUES (1, 11);
INSERT INTO `role_menus` VALUES (1, 12);
INSERT INTO `role_menus` VALUES (1, 13);
INSERT INTO `role_menus` VALUES (1, 14);
INSERT INTO `role_menus` VALUES (1, 15);
INSERT INTO `role_menus` VALUES (1, 25);
INSERT INTO `role_menus` VALUES (1, 26);
INSERT INTO `role_menus` VALUES (1, 27);
INSERT INTO `role_menus` VALUES (1, 28);
INSERT INTO `role_menus` VALUES (1, 29);
INSERT INTO `role_menus` VALUES (2, 17);
INSERT INTO `role_menus` VALUES (2, 18);
INSERT INTO `role_menus` VALUES (2, 19);

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Student name | 学生姓名',
  `age` smallint NOT NULL COMMENT 'Student age | 学生年龄',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Student\'s home address | 学生家庭住址 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('018f8b56-4ede-79db-8be6-8a958e2cfd7e', '2024-05-18 10:54:00', '2024-05-18 10:54:00', 'key', 18, 'dubai');

-- ----------------------------
-- Table structure for sys_apis
-- ----------------------------
DROP TABLE IF EXISTS `sys_apis`;
CREATE TABLE `sys_apis`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'API path | API 路径',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'API description | API 描述',
  `api_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'API group | API 分组',
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'Other' COMMENT 'Service name | 服务名称',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'POST' COMMENT 'HTTP method | HTTP 请求类型',
  `is_required` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Whether is required | 是否必选',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `api_path_method`(`path` ASC, `method` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 192 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_apis
-- ----------------------------
INSERT INTO `sys_apis` VALUES (1, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/user/login', 'apiDesc.userLogin', 'user', 'Core', 'POST', 1);
INSERT INTO `sys_apis` VALUES (2, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/user/register', 'apiDesc.userRegister', 'user', 'Core', 'POST', 1);
INSERT INTO `sys_apis` VALUES (3, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/user/create', 'apiDesc.createUser', 'user', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (4, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/user/update', 'apiDesc.updateUser', 'user', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (5, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/user/change_password', 'apiDesc.userChangePassword', 'user', 'Core', 'POST', 1);
INSERT INTO `sys_apis` VALUES (6, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/user/info', 'apiDesc.userInfo', 'user', 'Core', 'GET', 1);
INSERT INTO `sys_apis` VALUES (7, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/user/list', 'apiDesc.userList', 'user', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (8, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/user/delete', 'apiDesc.deleteUser', 'user', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (9, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/user/perm', 'apiDesc.userPermissions', 'user', 'Core', 'GET', 1);
INSERT INTO `sys_apis` VALUES (10, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/user/profile', 'apiDesc.userProfile', 'user', 'Core', 'GET', 1);
INSERT INTO `sys_apis` VALUES (11, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/user/profile', 'apiDesc.updateProfile', 'user', 'Core', 'POST', 1);
INSERT INTO `sys_apis` VALUES (12, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/user/logout', 'apiDesc.logout', 'user', 'Core', 'GET', 1);
INSERT INTO `sys_apis` VALUES (13, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/user', 'apiDesc.getUserById', 'user', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (14, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/role/create', 'apiDesc.createRole', 'role', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (15, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/role/update', 'apiDesc.updateRole', 'role', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (16, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/role/delete', 'apiDesc.deleteRole', 'role', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (17, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/role/list', 'apiDesc.roleList', 'role', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (18, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/role', 'apiDesc.getRoleById', 'role', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (19, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/menu/create', 'apiDesc.createMenu', 'menu', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (20, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/menu/update', 'apiDesc.updateMenu', 'menu', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (21, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/menu/delete', 'apiDesc.deleteMenu', 'menu', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (22, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/menu/list', 'apiDesc.menuList', 'menu', 'Core', 'GET', 0);
INSERT INTO `sys_apis` VALUES (23, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/menu/role/list', 'apiDesc.menuRoleList', 'authority', 'Core', 'GET', 1);
INSERT INTO `sys_apis` VALUES (24, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/menu_param/create', 'apiDesc.createMenuParam', 'menu', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (25, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/menu_param/update', 'apiDesc.updateMenuParam', 'menu', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (26, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/menu_param/list', 'apiDesc.menuParamListByMenuId', 'menu', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (27, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/menu_param/delete', 'apiDesc.deleteMenuParam', 'menu', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (28, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/menu_param', 'apiDesc.getMenuParamById', 'menu', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (29, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/menu', 'apiDesc.getMenuById', 'menu', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (30, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/captcha', 'apiDesc.captcha', 'captcha', 'Core', 'GET', 1);
INSERT INTO `sys_apis` VALUES (31, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/authority/api/create_or_update', 'apiDesc.createOrUpdateApiAuthority', 'authority', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (32, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/authority/api/role', 'apiDesc.APIAuthorityOfRole', 'authority', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (33, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/authority/menu/create_or_update', 'apiDesc.createOrUpdateMenuAuthority', 'authority', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (34, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/authority/menu/role', 'apiDesc.menuAuthorityOfRole', 'authority', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (35, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/api/create', 'apiDesc.createApi', 'api', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (36, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/api/update', 'apiDesc.updateApi', 'api', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (37, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/api/delete', 'apiDesc.deleteAPI', 'api', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (38, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/api/list', 'apiDesc.APIList', 'api', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (39, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/api', 'apiDesc.getApiById', 'api', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (40, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/dictionary', 'apiDesc.getDictionaryById', 'dictionary', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (41, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/dictionary/create', 'apiDesc.createDictionary', 'dictionary', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (42, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/dictionary/update', 'apiDesc.updateDictionary', 'dictionary', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (43, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/dictionary/delete', 'apiDesc.deleteDictionary', 'dictionary', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (44, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/dictionary_detail/delete', 'apiDesc.deleteDictionaryDetail', 'dictionary', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (45, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/dictionary_detail', 'apiDesc.getDictionaryDetailById', 'dictionary', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (46, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/dictionary_detail/create', 'apiDesc.createDictionaryDetail', 'dictionary', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (47, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/dictionary_detail/update', 'apiDesc.updateDictionaryDetail', 'dictionary', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (48, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/dictionary_detail/list', 'apiDesc.getDictionaryListDetail', 'dictionary', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (49, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/dictionary/list', 'apiDesc.getDictionaryList', 'dictionary', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (50, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/dict/:name', 'apiDesc.getDictionaryDetailByDictionaryName', 'dictionary', 'Core', 'GET', 0);
INSERT INTO `sys_apis` VALUES (51, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/oauth_provider/create', 'apiDesc.createProvider', 'oauth', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (52, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/oauth_provider/update', 'apiDesc.updateProvider', 'oauth', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (53, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/oauth_provider/delete', 'apiDesc.deleteProvider', 'oauth', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (54, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/oauth_provider/list', 'apiDesc.getProviderList', 'oauth', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (55, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/oauth/login', 'apiDesc.oauthLogin', 'oauth', 'Core', 'POST', 1);
INSERT INTO `sys_apis` VALUES (56, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/oauth_provider', 'apiDesc.getProviderById', 'oauth', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (57, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/token/create', 'apiDesc.createToken', 'token', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (58, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/token/update', 'apiDesc.updateToken', 'token', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (59, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/token/delete', 'apiDesc.deleteToken', 'token', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (60, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/token/list', 'apiDesc.getTokenList', 'token', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (61, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/token/logout', 'apiDesc.forceLoggingOut', 'token', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (62, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/token', 'apiDesc.getTokenById', 'token', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (63, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/department/create', 'apiDesc.createDepartment', 'department', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (64, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/department/update', 'apiDesc.updateDepartment', 'department', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (65, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/department/delete', 'apiDesc.deleteDepartment', 'department', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (66, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/department/list', 'apiDesc.getDepartmentList', 'department', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (67, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/department', 'apiDesc.getDepartmentById', 'department', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (68, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/position/create', 'apiDesc.createPosition', 'position', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (69, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/position/update', 'apiDesc.updatePosition', 'position', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (70, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/position/delete', 'apiDesc.deletePosition', 'position', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (71, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/position/list', 'apiDesc.getPositionList', 'position', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (72, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/position', 'apiDesc.getPositionById', 'position', 'Core', 'POST', 0);
INSERT INTO `sys_apis` VALUES (73, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/task/create', 'apiDesc.createTask', 'task', 'Job', 'POST', 0);
INSERT INTO `sys_apis` VALUES (74, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/task/update', 'apiDesc.updateTask', 'task', 'Job', 'POST', 0);
INSERT INTO `sys_apis` VALUES (75, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/task/delete', 'apiDesc.deleteTask', 'task', 'Job', 'POST', 0);
INSERT INTO `sys_apis` VALUES (76, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/task/list', 'apiDesc.getTaskList', 'task', 'Job', 'POST', 0);
INSERT INTO `sys_apis` VALUES (77, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/task', 'apiDesc.getTaskById', 'task', 'Job', 'POST', 0);
INSERT INTO `sys_apis` VALUES (78, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/task_log/create', 'apiDesc.createTaskLog', 'task_log', 'Job', 'POST', 0);
INSERT INTO `sys_apis` VALUES (79, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/task_log/update', 'apiDesc.updateTaskLog', 'task_log', 'Job', 'POST', 0);
INSERT INTO `sys_apis` VALUES (80, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/task_log/delete', 'apiDesc.deleteTaskLog', 'task_log', 'Job', 'POST', 0);
INSERT INTO `sys_apis` VALUES (81, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/task_log/list', 'apiDesc.getTaskLogList', 'task_log', 'Job', 'POST', 0);
INSERT INTO `sys_apis` VALUES (82, '2024-05-17 13:01:15', '2024-05-17 13:01:15', '/task_log', 'apiDesc.getTaskLogById', 'task_log', 'Job', 'POST', 0);
INSERT INTO `sys_apis` VALUES (83, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/email_log/create', 'apiDesc.createEmailLog', 'email_log', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (84, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/email_log/update', 'apiDesc.updateEmailLog', 'email_log', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (85, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/email_log/delete', 'apiDesc.deleteEmailLog', 'email_log', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (86, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/email_log/list', 'apiDesc.getEmailLogList', 'email_log', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (87, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/email_log', 'apiDesc.getEmailLogById', 'email_log', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (88, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/email_provider/create', 'apiDesc.createEmailProvider', 'email_provider', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (89, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/email_provider/update', 'apiDesc.updateEmailProvider', 'email_provider', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (90, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/email_provider/delete', 'apiDesc.deleteEmailProvider', 'email_provider', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (91, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/email_provider/list', 'apiDesc.getEmailProviderList', 'email_provider', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (92, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/email_provider', 'apiDesc.getEmailProviderById', 'email_provider', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (93, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/sms_log/create', 'apiDesc.createSmsLog', 'sms_log', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (94, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/sms_log/update', 'apiDesc.updateSmsLog', 'sms_log', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (95, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/sms_log/delete', 'apiDesc.deleteSmsLog', 'sms_log', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (96, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/sms_log/list', 'apiDesc.getSmsLogList', 'sms_log', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (97, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/sms_log', 'apiDesc.getSmsLogById', 'sms_log', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (98, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/sms_provider/create', 'apiDesc.createSmsProvider', 'sms_provider', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (99, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/sms_provider/update', 'apiDesc.updateSmsProvider', 'sms_provider', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (100, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/sms_provider/delete', 'apiDesc.deleteSmsProvider', 'sms_provider', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (101, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/sms_provider/list', 'apiDesc.getSmsProviderList', 'sms_provider', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (102, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/sms_provider', 'apiDesc.getSmsProviderById', 'sms_provider', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (103, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/sms/send', 'apiDesc.sendSms', 'message_sender', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (104, '2024-05-17 13:02:12', '2024-05-17 13:02:12', '/email/send', 'apiDesc.sendEmail', 'message_sender', 'Mcms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (105, '2024-05-18 07:26:01', '2024-05-18 07:26:01', '/upload', 'apiDesc.uploadFile', 'file', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (106, '2024-05-18 07:26:01', '2024-05-18 07:26:01', '/file/list', 'apiDesc.fileList', 'file', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (107, '2024-05-18 07:26:01', '2024-05-18 07:26:01', '/file/update', 'apiDesc.updateFileInfo', 'file', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (108, '2024-05-18 07:26:01', '2024-05-18 07:26:01', '/file/status', 'apiDesc.setPublicStatus', 'file', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (109, '2024-05-18 07:26:01', '2024-05-18 07:26:01', '/file/delete', 'apiDesc.deleteFile', 'file', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (110, '2024-05-18 07:26:01', '2024-05-18 07:26:01', '/file/download/:id', 'apiDesc.downloadFile', 'file', 'Fms', 'GET', 0);
INSERT INTO `sys_apis` VALUES (111, '2024-05-18 07:26:01', '2024-05-18 07:26:01', '/file_tag/create', 'apiDesc.createFileTag', 'file_tag', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (112, '2024-05-18 07:26:01', '2024-05-18 07:26:01', '/file_tag/update', 'apiDesc.updateFileTag', 'file_tag', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (113, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/file_tag/delete', 'apiDesc.deleteFileTag', 'file_tag', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (114, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/file_tag/list', 'apiDesc.getFileTagList', 'file_tag', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (115, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/file_tag', 'apiDesc.getFileTagById', 'file_tag', 'Fms', 'Post', 0);
INSERT INTO `sys_apis` VALUES (116, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/storage_provider/create', 'apiDesc.createStorageProvider', 'storage_provider', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (117, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/storage_provider/update', 'apiDesc.updateStorageProvider', 'storage_provider', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (118, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/storage_provider/delete', 'apiDesc.deleteStorageProvider', 'storage_provider', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (119, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/storage_provider/list', 'apiDesc.getStorageProviderList', 'storage_provider', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (120, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/storage_provider', 'apiDesc.getStorageProviderById', 'storage_provider', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (121, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/cloud_file/create', 'apiDesc.createCloudFile', 'cloud_file', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (122, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/cloud_file/update', 'apiDesc.updateCloudFile', 'cloud_file', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (123, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/cloud_file/delete', 'apiDesc.deleteCloudFile', 'cloud_file', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (124, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/cloud_file/list', 'apiDesc.getCloudFileList', 'cloud_file', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (125, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/cloud_file', 'apiDesc.getCloudFileById', 'cloud_file', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (126, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/cloud_file/upload', 'apiDesc.uploadFileToCloud', 'cloud_file', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (127, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/cloud_file_tag/create', 'apiDesc.createCloudFileTag', 'cloud_file_tag', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (128, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/cloud_file_tag/update', 'apiDesc.updateCloudFileTag', 'cloud_file_tag', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (129, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/cloud_file_tag/delete', 'apiDesc.deleteCloudFileTag', 'cloud_file_tag', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (130, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/cloud_file_tag/list', 'apiDesc.getCloudFileTagList', 'cloud_file_tag', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (131, '2024-05-18 07:26:02', '2024-05-18 07:26:02', '/cloud_file_tag', 'apiDesc.getCloudFileTagById', 'cloud_file_tag', 'Fms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (133, '2024-05-18 07:35:38', '2024-05-18 07:35:38', '/member/create', 'apiDesc.createMember', 'member', 'Mms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (134, '2024-05-18 07:35:38', '2024-05-18 07:35:38', '/member/update', 'apiDesc.updateMember', 'member', 'Mms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (135, '2024-05-18 07:35:38', '2024-05-18 07:35:38', '/member/delete', 'apiDesc.deleteMember', 'member', 'Mms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (136, '2024-05-18 07:35:38', '2024-05-18 07:35:38', '/member/list', 'apiDesc.getMemberList', 'member', 'Mms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (137, '2024-05-18 07:35:38', '2024-05-18 07:35:38', '/member', 'apiDesc.getMemberById', 'member', 'Mms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (138, '2024-05-18 07:35:38', '2024-05-18 07:35:38', '/member_rank/create', 'apiDesc.createMemberRank', 'member_rank', 'Mms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (139, '2024-05-18 07:35:38', '2024-05-18 07:35:38', '/member_rank/update', 'apiDesc.updateMemberRank', 'member_rank', 'Mms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (140, '2024-05-18 07:35:38', '2024-05-18 07:35:38', '/member_rank/delete', 'apiDesc.deleteMemberRank', 'member_rank', 'Mms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (141, '2024-05-18 07:35:38', '2024-05-18 07:35:38', '/member_rank/list', 'apiDesc.getMemberRankList', 'member_rank', 'Mms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (142, '2024-05-18 07:35:38', '2024-05-18 07:35:38', '/member_rank', 'apiDesc.getMemberRankById', 'member_rank', 'Mms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (165, '2024-05-18 14:12:28', '2024-05-18 14:12:28', '/student/create', 'student', 'student', 'student', 'POST', 0);
INSERT INTO `sys_apis` VALUES (166, '2024-05-18 14:12:42', '2024-05-18 14:12:42', '/student/update', 'student', 'student', 'student', 'POST', 0);
INSERT INTO `sys_apis` VALUES (167, '2024-05-18 14:12:58', '2024-05-18 14:12:58', '/student/delete', 'student', 'student', 'student', 'POST', 0);
INSERT INTO `sys_apis` VALUES (168, '2024-05-18 14:13:16', '2024-05-18 14:13:16', '/student/list', 'student', 'student', 'student', 'POST', 0);
INSERT INTO `sys_apis` VALUES (169, '2024-05-18 14:13:30', '2024-05-18 14:13:30', '/student', 'student', 'student', 'student', 'POST', 0);
INSERT INTO `sys_apis` VALUES (170, '2024-05-18 14:13:47', '2024-05-18 14:13:47', '/teacher/create', 'teacher', 'teacher', 'teacher', 'POST', 0);
INSERT INTO `sys_apis` VALUES (171, '2024-05-18 14:14:01', '2024-05-18 14:14:01', '/teacher/update', 'teacher', 'teacher', 'teacher', 'POST', 0);
INSERT INTO `sys_apis` VALUES (172, '2024-05-18 14:14:14', '2024-05-18 14:14:14', '/teacher/delete', 'teacher', 'teacher', 'teacher', 'POST', 0);
INSERT INTO `sys_apis` VALUES (173, '2024-05-18 14:14:28', '2024-05-18 14:14:28', '/teacher/list', 'teacher', 'teacher', 'teacher', 'POST', 0);
INSERT INTO `sys_apis` VALUES (174, '2024-05-18 14:14:41', '2024-05-18 14:14:41', '/teacher', 'teacher', 'teacher', 'teacher', 'POST', 0);
INSERT INTO `sys_apis` VALUES (180, '2024-05-31 06:25:04', '2024-05-31 06:25:04', '/permission/test', 'apiDesc.permissionTest', 'permission', 'Apms', 'GET', 0);
INSERT INTO `sys_apis` VALUES (181, '2024-05-31 06:25:04', '2024-05-31 06:25:04', '/operation_log/create', 'apiDesc.createOperationLog', 'operation_log', 'Apms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (182, '2024-05-31 06:25:04', '2024-05-31 06:25:04', '/operation_log/update', 'apiDesc.updateOperationLog', 'operation_log', 'Apms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (183, '2024-05-31 06:25:04', '2024-05-31 06:25:04', '/operation_log/delete', 'apiDesc.deleteOperationLog', 'operation_log', 'Apms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (184, '2024-05-31 06:25:04', '2024-05-31 06:25:04', '/operation_log/list', 'apiDesc.getOperationLogList', 'operation_log', 'Apms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (185, '2024-05-31 06:25:04', '2024-05-31 06:25:04', '/operation_log', 'apiDesc.getOperationLogById', 'operation_log', 'Apms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (186, '2024-05-31 06:25:04', '2024-05-31 06:25:04', '/permission/create', 'apiDesc.createPermission', 'permission', 'Apms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (187, '2024-05-31 06:25:04', '2024-05-31 06:25:04', '/permission/update', 'apiDesc.updatePermission', 'permission', 'Apms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (188, '2024-05-31 06:25:04', '2024-05-31 06:25:04', '/permission/delete', 'apiDesc.deletePermission', 'permission', 'Apms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (189, '2024-05-31 06:25:04', '2024-05-31 06:25:04', '/permission/list', 'apiDesc.getPermissionList', 'permission', 'Apms', 'POST', 0);
INSERT INTO `sys_apis` VALUES (190, '2024-05-31 06:25:04', '2024-05-31 06:25:04', '/permission', 'apiDesc.getPermissionById', 'permission', 'Apms', 'POST', 0);

-- ----------------------------
-- Table structure for sys_departments
-- ----------------------------
DROP TABLE IF EXISTS `sys_departments`;
CREATE TABLE `sys_departments`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT 'Status 1: normal 2: ban | 状态 1 正常 2 禁用',
  `sort` int UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Sort Number | 排序编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Department name | 部门名称',
  `ancestors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Parents\' IDs | 父级列表',
  `leader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Department leader | 部门负责人',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Leader\'s phone number | 负责人电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Leader\'s email | 部门负责人电子邮箱',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Remark | 备注',
  `parent_id` bigint UNSIGNED NULL DEFAULT 0 COMMENT 'Parent department ID | 父级部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_departments
-- ----------------------------
INSERT INTO `sys_departments` VALUES (1, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 1, 1, 'department.managementDepartment', '', 'admin', '18888888888', 'simpleadmin@gmail.com', 'Super Administrator', 1000000);
INSERT INTO `sys_departments` VALUES (2, '2024-05-29 15:39:52', '2024-05-29 15:39:52', 1, 1, 'abc', NULL, 'abc', '13998789887', 'abcd@gmail.com', '123', 1);
INSERT INTO `sys_departments` VALUES (4, '2024-05-29 15:42:06', '2024-06-17 05:54:14', 1, 2, 'efg', '2,1', 'fanny', '13998766666', 'abc@gmail.com', 'abcd', 2);
INSERT INTO `sys_departments` VALUES (5, '2024-05-29 15:42:21', '2024-05-29 15:42:21', 1, 1, 'abc', NULL, 'abc', '13998789887', 'abcd@gmail.com', '123', 88);
INSERT INTO `sys_departments` VALUES (6, '2024-05-29 15:53:08', '2024-05-29 15:53:08', 1, 1, 'abcd', NULL, 'abcd', '13998789887', 'abcde@gmail.com', '666', 8998);
INSERT INTO `sys_departments` VALUES (7, '2024-05-30 18:45:53', '2024-05-30 18:45:53', 1, 1, '', NULL, NULL, NULL, NULL, NULL, 2998);

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT 'Status 1: normal 2: ban | 状态 1 正常 2 禁用',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The title shown in the ui | 展示名称 （建议配合i18n）',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The name of dictionary for search | 字典搜索名称',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'The description of dictionary | 字典的描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dictionary_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary_details`;
CREATE TABLE `sys_dictionary_details`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT 'Status 1: normal 2: ban | 状态 1 正常 2 禁用',
  `sort` int UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Sort Number | 排序编号',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The title shown in the ui | 展示名称 （建议配合i18n）',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'key | 键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'value | 值',
  `dictionary_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT 'Dictionary ID | 字典ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary_details
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE `sys_menus`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `sort` int UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Sort Number | 排序编号',
  `menu_level` int UNSIGNED NOT NULL COMMENT 'Menu level | 菜单层级',
  `menu_type` int UNSIGNED NOT NULL COMMENT 'Menu type | 菜单类型 （菜单或目录）0 目录 1 菜单',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'Index path | 菜单路由路径',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Index name | 菜单名称',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'Redirect path | 跳转路径 （外链）',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'The path of vue file | 组件路径',
  `disabled` tinyint(1) NULL DEFAULT 0 COMMENT 'Disable status | 是否停用',
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'Other' COMMENT 'Service Name | 服务名称',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Menu name | 菜单显示标题',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Menu icon | 菜单图标',
  `hide_menu` tinyint(1) NULL DEFAULT 0 COMMENT 'Hide menu | 是否隐藏菜单',
  `hide_breadcrumb` tinyint(1) NULL DEFAULT 0 COMMENT 'Hide the breadcrumb | 隐藏面包屑',
  `ignore_keep_alive` tinyint(1) NULL DEFAULT 0 COMMENT 'Do not keep alive the tab | 取消页面缓存',
  `hide_tab` tinyint(1) NULL DEFAULT 0 COMMENT 'Hide the tab header | 隐藏页头',
  `frame_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'Show iframe | 内嵌 iframe',
  `carry_param` tinyint(1) NULL DEFAULT 0 COMMENT 'The route carries parameters or not | 携带参数',
  `hide_children_in_menu` tinyint(1) NULL DEFAULT 0 COMMENT 'Hide children menu or not | 隐藏所有子菜单',
  `affix` tinyint(1) NULL DEFAULT 0 COMMENT 'Affix tab | Tab 固定',
  `dynamic_level` int UNSIGNED NULL DEFAULT 20 COMMENT 'The maximum number of pages the router can open | 能打开的子TAB数',
  `real_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'The real path of the route without dynamic part | 菜单路由不包含参数部分',
  `parent_id` bigint UNSIGNED NULL DEFAULT 100000 COMMENT 'Parent menu ID | 父菜单ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menu_name`(`name` ASC) USING BTREE,
  UNIQUE INDEX `menu_path`(`path` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES (1, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 0, 1, 1, '/dashboard', 'Dashboard', '', '/dashboard/workbench/index', 0, 'Core', 'route.dashboard', 'ant-design:home-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 1000000);
INSERT INTO `sys_menus` VALUES (2, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 999, 1, 0, '/system', 'SystemManagement', '', 'LAYOUT', 0, 'Core', 'route.systemManagementTitle', 'ant-design:tool-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 1000000);
INSERT INTO `sys_menus` VALUES (3, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 1, 2, 1, '/menu', 'MenuManagement', '', '/sys/menu/index', 0, 'Core', 'route.menuManagementTitle', 'ant-design:bars-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 2);
INSERT INTO `sys_menus` VALUES (4, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 2, 2, 1, '/role', 'RoleManagement', '', '/sys/role/index', 0, 'Core', 'route.roleManagementTitle', 'ant-design:user-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 2);
INSERT INTO `sys_menus` VALUES (5, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 3, 2, 1, '/user', 'UserManagement', '', '/sys/user/index', 0, 'Core', 'route.userManagementTitle', 'ant-design:user-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 2);
INSERT INTO `sys_menus` VALUES (6, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 4, 2, 1, '/department', 'DepartmentManagement', '', '/sys/department/index', 0, 'Core', 'route.departmentManagement', 'ic:outline-people-alt', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 2);
INSERT INTO `sys_menus` VALUES (7, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 5, 2, 1, '/api', 'APIManagement', '', '/sys/api/index', 0, 'Core', 'route.apiManagementTitle', 'ant-design:api-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 2);
INSERT INTO `sys_menus` VALUES (8, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 6, 2, 1, '/dictionary', 'DictionaryManagement', '', '/sys/dictionary/index', 0, 'Core', 'route.dictionaryManagementTitle', 'ant-design:book-outlined', 0, 0, 0, 0, '', 0, 1, 0, 20, '', 2);
INSERT INTO `sys_menus` VALUES (9, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 1000, 1, 0, '/other', 'OtherPages', '', 'LAYOUT', 0, 'Core', 'route.otherPages', 'ant-design:question-circle-outlined', 1, 0, 0, 0, '', 0, 0, 0, 20, '', 1000000);
INSERT INTO `sys_menus` VALUES (10, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 1, 2, 1, '/dictionary/detail/:dictionaryId', 'DictionaryDetail', '', '/sys/dictionaryDetail/index', 0, 'Core', 'route.dictionaryDetailManagementTitle', 'ant-design:align-left-outlined', 1, 0, 0, 0, '', 0, 0, 0, 20, '', 8);
INSERT INTO `sys_menus` VALUES (11, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 3, 1, 1, '/profile', 'Profile', '', '/sys/profile/index', 0, 'Core', 'route.userProfileTitle', 'ant-design:profile-outlined', 1, 0, 0, 0, '', 0, 0, 0, 20, '', 9);
INSERT INTO `sys_menus` VALUES (12, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 6, 2, 1, '/oauth', 'OauthManagement', '', '/sys/oauth/index', 0, 'Core', 'route.oauthManagement', 'ant-design:unlock-filled', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 2);
INSERT INTO `sys_menus` VALUES (13, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 7, 2, 1, '/token', 'TokenManagement', '', '/sys/token/index', 0, 'Core', 'route.tokenManagement', 'ant-design:lock-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 2);
INSERT INTO `sys_menus` VALUES (14, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 8, 2, 1, '/position', 'PositionManagement', '', '/sys/position/index', 0, 'Core', 'route.positionManagement', 'ic:twotone-work-outline', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 2);
INSERT INTO `sys_menus` VALUES (15, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 8, 2, 1, '/task', 'TaskManagement', '', '/sys/task/index', 0, 'Job', 'route.taskManagement', 'ic:baseline-access-alarm', 1, 0, 0, 0, '', 0, 0, 0, 20, '', 1000000);
INSERT INTO `sys_menus` VALUES (16, '2024-05-17 13:02:12', '2024-05-17 13:02:12', 4, 1, 1, '/mcms_dir', 'MessageCenterManagement', '', 'LAYOUT', 0, 'Mcms', 'route.messageCenterManagement', 'clarity:email-line', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 1000000);
INSERT INTO `sys_menus` VALUES (17, '2024-05-17 13:02:12', '2024-05-17 13:02:12', 1, 2, 2, '/mcms_email_provider', 'EmailProviderManagement', '', '/mcms/emailProvider/index', 0, 'Mcms', 'route.emailProviderManagement', 'clarity:email-line', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 16);
INSERT INTO `sys_menus` VALUES (18, '2024-05-17 13:02:12', '2024-05-17 13:02:12', 2, 2, 2, '/mcms_sms_provider', 'SmsProviderManagement', '', '/mcms/smsProvider/index', 0, 'Mcms', 'route.smsProviderManagement', 'clarity:mobile-line', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 16);
INSERT INTO `sys_menus` VALUES (19, '2024-05-18 07:26:02', '2024-05-18 07:26:02', 3, 1, 1, '/fms_dir', 'FileManagementDirectory', '', 'LAYOUT', 0, 'Fms', 'route.fileManagement', 'ant-design:folder-open-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 1000000);
INSERT INTO `sys_menus` VALUES (20, '2024-05-18 07:26:02', '2024-05-18 07:26:02', 1, 2, 1, '/fms/file', 'FileManagement', '', '/fms/file/index', 0, 'Fms', 'route.fileManagement', 'ant-design:folder-open-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 19);
INSERT INTO `sys_menus` VALUES (21, '2024-05-18 07:26:02', '2024-05-18 07:26:02', 2, 2, 1, '/fms/file_tag', 'FileTagManagement', '', '/fms/fileTag/index', 0, 'Fms', 'route.fileTagManagement', 'ant-design:book-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 19);
INSERT INTO `sys_menus` VALUES (22, '2024-05-18 07:26:02', '2024-05-18 07:26:02', 3, 2, 1, '/fms/storage_provider', 'StorageProviderManagement', '', '/fms/storageProvider/index', 0, 'Fms', 'route.storageProviderManagement', 'mdi:cloud-outline', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 19);
INSERT INTO `sys_menus` VALUES (23, '2024-05-18 07:26:02', '2024-05-18 07:26:02', 4, 2, 1, '/fms/cloud_file', 'CloudFileManagement', '', '/fms/cloudFile/index', 0, 'Fms', 'route.cloudFileManagement', 'ant-design:folder-open-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 19);
INSERT INTO `sys_menus` VALUES (24, '2024-05-18 07:26:02', '2024-05-18 07:26:02', 5, 2, 1, '/fms/cloud_file_tag', 'CloudFileTagManagement', '', '/fms/cloudFileTag/index', 0, 'Fms', 'route.cloudFileTagManagement', 'ant-design:book-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 19);
INSERT INTO `sys_menus` VALUES (25, '2024-05-18 07:35:38', '2024-05-18 07:35:38', 1, 1, 0, '/member_dir', 'MemberManagementDirectory', '', 'LAYOUT', 0, 'Mms', 'route.memberManagement', 'ic:round-person-outline', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 1000000);
INSERT INTO `sys_menus` VALUES (26, '2024-05-18 07:35:38', '2024-05-18 07:35:38', 1, 2, 1, '/member', 'MemberManagement', '', '/mms/member/index', 0, 'Mms', 'route.memberManagement', 'ic:round-person-outline', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 25);
INSERT INTO `sys_menus` VALUES (27, '2024-05-18 07:35:38', '2024-05-18 07:35:38', 2, 2, 1, '/member_rank', 'MemberRankManagement', '', '/mms/memberRank/index', 0, 'Mms', 'route.memberRankManagement', 'ant-design:crown-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 25);
INSERT INTO `sys_menus` VALUES (28, '2024-05-18 07:35:38', '2024-05-18 07:35:38', 3, 2, 1, '/member_token', 'MemberTokenManagement', '', '/mms/token/index', 0, 'Mms', 'route.tokenManagement', 'ant-design:lock-outlined', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 25);
INSERT INTO `sys_menus` VALUES (29, '2024-05-18 07:35:38', '2024-05-18 07:35:38', 3, 2, 1, '/member_oauth', 'MemberOauthManagement', '', '/mms/oauth/index', 0, 'Mms', 'route.oauthManagement', 'ant-design:unlock-filled', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 25);
INSERT INTO `sys_menus` VALUES (30, '2024-05-31 06:25:04', '2024-05-31 06:25:04', 6, 1, 0, '/apms_dir', 'APMSDirectory', '', 'LAYOUT', 0, 'Other', 'route.apiPermissionManagement', 'arcticons:app-lock', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 1000000);
INSERT INTO `sys_menus` VALUES (31, '2024-05-31 06:25:04', '2024-05-31 06:25:04', 1, 2, 1, '/apms/permisson/index', 'PermissionManagement', '', '/apms/permission/index', 0, 'Apms', 'route.permissionManagement', 'arcticons:app-lock', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 30);
INSERT INTO `sys_menus` VALUES (32, '2024-05-31 06:25:04', '2024-05-31 06:25:04', 2, 2, 1, '/apms/operation_log/index', 'OperationLogManagement', '', '/apms/operationLog/index', 0, 'Apms', 'route.operationLogManagement', 'octicon:log-16', 0, 0, 0, 0, '', 0, 0, 0, 20, '', 30);

-- ----------------------------
-- Table structure for sys_oauth_providers
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_providers`;
CREATE TABLE `sys_oauth_providers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The provider\'s name | 提供商名称',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The client id | 客户端 id',
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The client secret | 客户端密钥',
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The redirect url | 跳转地址',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The scopes | 权限范围',
  `auth_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The auth url of the provider | 认证地址',
  `token_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The token url of the provider | 获取 token地址',
  `auth_style` bigint UNSIGNED NOT NULL COMMENT 'The auth style, 0: auto detect 1: third party log in 2: log in with username and password | 鉴权方式 0 自动 1 第三方登录 2 使用用户名密码',
  `info_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The URL to request user information by token | 用户信息请求地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oauth_providers
-- ----------------------------
INSERT INTO `sys_oauth_providers` VALUES (1, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 'google', 'your client id', 'your client secret', 'http://localhost:3100/oauth/login/callback', 'email openid', 'https://accounts.google.com/o/oauth2/auth', 'https://oauth2.googleapis.com/token', 1, 'https://www.googleapis.com/oauth2/v2/userinfo?access_token=TOKEN');
INSERT INTO `sys_oauth_providers` VALUES (2, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 'github', 'your client id', 'your client secret', 'http://localhost:3100/oauth/login/callback', 'email openid', 'https://github.com/login/oauth/authorize', 'https://github.com/login/oauth/access_token', 2, 'https://api.github.com/user');

-- ----------------------------
-- Table structure for sys_positions
-- ----------------------------
DROP TABLE IF EXISTS `sys_positions`;
CREATE TABLE `sys_positions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT 'Status 1: normal 2: ban | 状态 1 正常 2 禁用',
  `sort` int UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Sort Number | 排序编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Position Name | 职位名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The code of position | 职位编码',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Remark | 备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `position_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_positions
-- ----------------------------
INSERT INTO `sys_positions` VALUES (1, '2024-05-17 13:01:15', '2024-05-17 13:01:15', 1, 1, 'position.ceo', '001', 'CEO');

-- ----------------------------
-- Table structure for sys_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT 'Status 1: normal 2: ban | 状态 1 正常 2 禁用',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Role name | 角色名',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Role code for permission control in front end | 角色码，用于前端权限控制',
  `default_router` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'dashboard' COMMENT 'Default menu : dashboard | 默认登录页面',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'Remark | 备注',
  `sort` int UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Order number | 排序编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code` ASC) USING BTREE,
  UNIQUE INDEX `role_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES (1, '2024-05-17 13:01:15', '2024-05-18 07:39:13', 1, 'role.admin', '001', 'dashboard', '超级管理员', 1);

-- ----------------------------
-- Table structure for sys_task_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_logs`;
CREATE TABLE `sys_task_logs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `started_at` timestamp NOT NULL COMMENT 'Task Started Time | 任务启动时间',
  `finished_at` timestamp NOT NULL COMMENT 'Task Finished Time | 任务完成时间',
  `result` tinyint UNSIGNED NOT NULL COMMENT 'The Task Process Result | 任务执行结果',
  `task_task_logs` bigint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2079 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_task_logs
-- ----------------------------
INSERT INTO `sys_task_logs` VALUES (2033, '2024-06-10 04:59:35', '2024-06-10 04:59:35', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2034, '2024-06-10 05:05:50', '2024-06-10 05:05:55', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2035, '2024-06-10 05:06:28', '2024-06-10 05:06:28', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2036, '2024-06-10 05:07:05', '2024-06-10 05:07:05', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2037, '2024-06-10 05:07:45', '2024-06-10 05:07:45', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2038, '2024-06-10 05:08:44', '2024-06-10 05:08:44', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2039, '2024-06-10 05:09:44', '2024-06-10 05:09:44', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2040, '2024-06-10 05:10:44', '2024-06-10 05:10:44', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2041, '2024-06-10 05:11:44', '2024-06-10 05:11:44', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2042, '2024-06-12 17:22:02', '2024-06-12 17:22:02', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2043, '2024-06-12 17:23:02', '2024-06-12 17:23:02', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2044, '2024-06-12 17:24:02', '2024-06-12 17:24:02', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2045, '2024-06-12 17:25:02', '2024-06-12 17:25:02', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2046, '2024-06-20 05:25:13', '2024-06-20 05:25:13', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2047, '2024-06-20 05:26:13', '2024-06-20 05:26:13', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2048, '2024-06-20 05:27:13', '2024-06-20 05:27:13', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2049, '2024-06-20 05:28:13', '2024-06-20 05:28:13', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2050, '2024-06-20 05:29:13', '2024-06-20 05:29:13', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2051, '2024-06-20 05:30:13', '2024-06-20 05:30:13', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2052, '2024-06-20 05:34:03', '2024-06-20 05:34:03', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2053, '2024-06-20 05:35:03', '2024-06-20 05:35:03', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2054, '2024-06-20 05:42:23', '2024-06-20 05:42:23', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2055, '2024-06-20 05:46:15', '2024-06-20 05:46:15', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2056, '2024-06-20 05:47:15', '2024-06-20 05:47:15', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2057, '2024-06-20 05:48:15', '2024-06-20 05:48:15', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2058, '2024-06-20 05:49:15', '2024-06-20 05:49:15', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2059, '2024-06-20 05:50:15', '2024-06-20 05:50:15', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2060, '2024-06-20 05:51:15', '2024-06-20 05:51:15', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2061, '2024-06-20 05:52:15', '2024-06-20 05:52:15', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2062, '2024-06-20 05:53:14', '2024-06-20 05:53:14', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2063, '2024-06-20 05:54:14', '2024-06-20 05:54:14', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2064, '2024-06-20 05:55:14', '2024-06-20 05:55:14', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2065, '2024-06-20 05:57:59', '2024-06-20 05:57:59', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2066, '2024-06-20 05:58:59', '2024-06-20 05:58:59', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2067, '2024-06-20 06:00:00', '2024-06-20 06:00:00', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2068, '2024-06-20 06:01:00', '2024-06-20 06:01:00', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2069, '2024-06-20 06:02:00', '2024-06-20 06:02:00', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2070, '2024-06-20 06:03:00', '2024-06-20 06:03:00', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2071, '2024-06-20 06:04:00', '2024-06-20 06:04:00', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2072, '2024-06-20 06:06:31', '2024-06-20 06:06:31', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2073, '2024-06-20 06:07:31', '2024-06-20 06:07:31', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2074, '2024-06-20 06:08:31', '2024-06-20 06:08:31', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2075, '2024-06-20 06:09:31', '2024-06-20 06:09:31', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2076, '2024-06-20 06:10:31', '2024-06-20 06:10:31', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2077, '2024-06-20 06:13:03', '2024-06-20 06:13:03', 1, 1);
INSERT INTO `sys_task_logs` VALUES (2078, '2024-06-20 06:14:03', '2024-06-20 06:14:03', 1, 1);

-- ----------------------------
-- Table structure for sys_tasks
-- ----------------------------
DROP TABLE IF EXISTS `sys_tasks`;
CREATE TABLE `sys_tasks`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT 'Status 1: normal 2: ban | 状态 1 正常 2 禁用',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `task_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `pattern` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `payload` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `task_pattern`(`pattern` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tasks
-- ----------------------------
INSERT INTO `sys_tasks` VALUES (1, '2024-05-17 13:02:10', '2024-05-17 13:02:10', 1, 'hello_world', 'base', '@every 60s', 'hello_world', '{\"name\": \"Mike (DPTask 60s)\"}');

-- ----------------------------
-- Table structure for sys_tokens
-- ----------------------------
DROP TABLE IF EXISTS `sys_tokens`;
CREATE TABLE `sys_tokens`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT 'Status 1: normal 2: ban | 状态 1 正常 2 禁用',
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT ' User\'s UUID | 用户的UUID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'unknown' COMMENT 'Username | 用户名',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Token string | Token 字符串',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Log in source such as GitHub | Token 来源 （本地为core, 第三方如github等）',
  `expired_at` timestamp NOT NULL COMMENT ' Expire time | 过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `token_uuid`(`uuid` ASC) USING BTREE,
  INDEX `token_expired_at`(`expired_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT 'Status 1: normal 2: ban | 状态 1 正常 2 禁用',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Delete Time | 删除日期',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'User\'s login name | 登录名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Password | 密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Nickname | 昵称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'The description of user | 用户的描述信息',
  `home_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '/dashboard' COMMENT 'The home page that the user enters after logging in | 用户登陆后进入的首页',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Mobile number | 手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Email | 邮箱号',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'Avatar | 头像路径',
  `department_id` bigint UNSIGNED NULL DEFAULT 1 COMMENT 'Department ID | 部门ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `nickname`(`nickname` ASC) USING BTREE,
  UNIQUE INDEX `user_username_email`(`username` ASC, `email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES ('018f86a4-720e-7f5d-a06e-356edaad9cfc', '2024-05-17 13:01:15', '2024-06-18 07:08:58', 1, NULL, 'admin', '$2a$10$4bAF2TtdZzA3rQQ7aVOq.exgB.RocUDBs/sgrpOiIF4k6U1eS3Yni', 'admin', 'usernamepasssword', '/dashboard', '13636369663', 'key@gmail.com', '123', 1);
INSERT INTO `sys_users` VALUES ('0190277e-fd7a-7a36-9698-042cb4152d4e', '2024-06-17 18:39:12', '2024-06-17 18:39:12', 1, NULL, 'key', '$2a$10$ozqgNaH0lc80USJwJLEC9ukt7Wy2mj.DQHDSPkmU5MldFJTzotf3K', 'key', 'key', 'key', '13663636363', 'key@gmail.com', 'key', 1);

-- ----------------------------
-- Table structure for teacher_students
-- ----------------------------
DROP TABLE IF EXISTS `teacher_students`;
CREATE TABLE `teacher_students`  (
  `teacher_id` bigint UNSIGNED NOT NULL,
  `student_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`teacher_id`, `student_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_students
-- ----------------------------

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL COMMENT 'Create Time | 创建日期',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time | 修改日期',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Teacher\'s name | 教师姓名',
  `age` smallint NOT NULL COMMENT 'Teacher\'s age | 教师年龄',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teachers
-- ----------------------------

-- ----------------------------
-- Table structure for user_positions
-- ----------------------------
DROP TABLE IF EXISTS `user_positions`;
CREATE TABLE `user_positions`  (
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `position_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `position_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_positions
-- ----------------------------
INSERT INTO `user_positions` VALUES ('018f86a4-720e-7f5d-a06e-356edaad9cfc', 1);
INSERT INTO `user_positions` VALUES ('018f86a4-720e-7f5d-a06e-356edaad9cfc', 2);
INSERT INTO `user_positions` VALUES ('018f86a4-720e-7f5d-a06e-356edaad9cfc', 3);
INSERT INTO `user_positions` VALUES ('0190277e-fd7a-7a36-9698-042cb4152d4e', 1);
INSERT INTO `user_positions` VALUES ('0190277e-fd7a-7a36-9698-042cb4152d4e', 2);
INSERT INTO `user_positions` VALUES ('0190277e-fd7a-7a36-9698-042cb4152d4e', 3);

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('018f86a4-720e-7f5d-a06e-356edaad9abc', 2);
INSERT INTO `user_roles` VALUES ('018f86a4-720e-7f5d-a06e-356edaad9cfc', 1);
INSERT INTO `user_roles` VALUES ('018f86a4-720e-7f5d-a06e-356edaad9cfc', 2);

SET FOREIGN_KEY_CHECKS = 1;
