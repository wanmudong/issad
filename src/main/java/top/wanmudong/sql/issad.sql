/*
 Navicat Premium Data Transfer

 Source Server         : wanmudong
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : issad

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 16/03/2019 23:05:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `id` int(11) NOT NULL COMMENT ' ',
  `college_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '学院名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (1, '管理学院');
INSERT INTO `college` VALUES (2, '土木学院');
INSERT INTO `college` VALUES (3, '经济学院');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `id` int(11) NOT NULL,
  `major_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '专业名称',
  `college_id` int(11) DEFAULT NULL COMMENT '专业所在学院id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `college`(`college_id`) USING BTREE COMMENT 'college',
  CONSTRAINT `college_foreign` FOREIGN KEY (`college_id`) REFERENCES `college` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '信息管理与信息系统', 1);
INSERT INTO `major` VALUES (2, '电子商务', 1);
INSERT INTO `major` VALUES (3, '工商管理', 1);
INSERT INTO `major` VALUES (4, '桥梁工程', 2);
INSERT INTO `major` VALUES (5, '工程造价', 2);
INSERT INTO `major` VALUES (6, '工程管理', 2);
INSERT INTO `major` VALUES (7, '政治经济学', 3);
INSERT INTO `major` VALUES (8, '经济史', 3);
INSERT INTO `major` VALUES (9, '西方经济学', 3);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `age` int(16) DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '爱好',
  `college_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '学院',
  `major_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '专业',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (23, 'kiki', 11, '男', '体育,旅游', '2', '6');
INSERT INTO `student` VALUES (31, 'kiki', 11, '男', '体育,旅游', '1', '1');
INSERT INTO `student` VALUES (36, 'coco', 23, '女', '音乐', '1', '1');
INSERT INTO `student` VALUES (41, 'sissy', 199, '女', '音乐', '1', '1');

SET FOREIGN_KEY_CHECKS = 1;
