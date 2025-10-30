/*
 Navicat Premium Dump SQL

 Source Server         : localhost_33066
 Source Server Type    : MySQL
 Source Server Version : 90400 (9.4.0)
 Source Host           : localhost:33066
 Source Schema         : bbs-pro

 Target Server Type    : MySQL
 Target Server Version : 90400 (9.4.0)
 File Encoding         : 65001

 Date: 13/10/2025 19:19:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aiinterface
-- ----------------------------
DROP TABLE IF EXISTS `aiinterface`;
CREATE TABLE `aiinterface`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `dynamicParameter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `enable` bit(1) NOT NULL,
  `interfaceProduct` int NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aiinterface
-- ----------------------------

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adoption` bit(1) NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isMarkdown` bit(1) NULL DEFAULT NULL,
  `isStaff` bit(1) NULL DEFAULT NULL,
  `lastUpdateTime` datetime(6) NULL DEFAULT NULL,
  `markdownContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answer_1_idx`(`questionId` ASC, `status` ASC, `adoption` ASC) USING BTREE,
  INDEX `answer_2_idx`(`userName` ASC, `isStaff` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer
-- ----------------------------

-- ----------------------------
-- Table structure for answerlike_0
-- ----------------------------
DROP TABLE IF EXISTS `answerlike_0`;
CREATE TABLE `answerlike_0`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `answerId` bigint NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answerLike_1_idx`(`answerId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answerlike_0
-- ----------------------------

-- ----------------------------
-- Table structure for answerlike_1
-- ----------------------------
DROP TABLE IF EXISTS `answerlike_1`;
CREATE TABLE `answerlike_1`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `answerId` bigint NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answerLike_1_idx`(`answerId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answerlike_1
-- ----------------------------

-- ----------------------------
-- Table structure for answerlike_2
-- ----------------------------
DROP TABLE IF EXISTS `answerlike_2`;
CREATE TABLE `answerlike_2`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `answerId` bigint NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answerLike_1_idx`(`answerId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answerlike_2
-- ----------------------------

-- ----------------------------
-- Table structure for answerlike_3
-- ----------------------------
DROP TABLE IF EXISTS `answerlike_3`;
CREATE TABLE `answerlike_3`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `answerId` bigint NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answerLike_1_idx`(`answerId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answerlike_3
-- ----------------------------

-- ----------------------------
-- Table structure for answerreply
-- ----------------------------
DROP TABLE IF EXISTS `answerreply`;
CREATE TABLE `answerreply`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `answerId` bigint NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `friendReplyId` bigint NULL DEFAULT NULL,
  `friendReplyIdGroup` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `friendUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isFriendStaff` bit(1) NULL DEFAULT NULL,
  `isStaff` bit(1) NULL DEFAULT NULL,
  `lastUpdateTime` datetime(6) NULL DEFAULT NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answerReply_1_idx`(`answerId` ASC, `status` ASC) USING BTREE,
  INDEX `answerReply_2_idx`(`questionId` ASC) USING BTREE,
  INDEX `answerReply_3_idx`(`userName` ASC, `isStaff` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answerreply
-- ----------------------------

-- ----------------------------
-- Table structure for answerreplylike_0
-- ----------------------------
DROP TABLE IF EXISTS `answerreplylike_0`;
CREATE TABLE `answerreplylike_0`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `replyId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answerReply_1_idx`(`replyId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answerreplylike_0
-- ----------------------------

-- ----------------------------
-- Table structure for answerreplylike_1
-- ----------------------------
DROP TABLE IF EXISTS `answerreplylike_1`;
CREATE TABLE `answerreplylike_1`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `replyId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answerReplyLike_1_idx`(`replyId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answerreplylike_1
-- ----------------------------

-- ----------------------------
-- Table structure for answerreplylike_2
-- ----------------------------
DROP TABLE IF EXISTS `answerreplylike_2`;
CREATE TABLE `answerreplylike_2`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `replyId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answerReplyLike_1_idx`(`replyId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answerreplylike_2
-- ----------------------------

-- ----------------------------
-- Table structure for answerreplylike_3
-- ----------------------------
DROP TABLE IF EXISTS `answerreplylike_3`;
CREATE TABLE `answerreplylike_3`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `replyId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answerReplyLike_1_idx`(`replyId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answerreplylike_3
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isMarkdown` bit(1) NULL DEFAULT NULL,
  `isStaff` bit(1) NULL DEFAULT NULL,
  `lastUpdateTime` datetime(6) NULL DEFAULT NULL,
  `markdownContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `quote` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `quoteIdGroup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `quoteUpdateId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_1_idx`(`topicId` ASC, `status` ASC) USING BTREE,
  INDEX `comment_2_idx`(`quoteIdGroup` ASC) USING BTREE,
  INDEX `comment_3_idx`(`userName` ASC, `isStaff` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '<p>\n	1\n</p>\n<p>\n	<br>\n</p>', '127.0.0.1', b'0', b'0', NULL, NULL, '2025-10-13 18:29:09.841000', NULL, ',', ',', 20, 1, 'u5RmNvNUs5WHrgl9h6S');

-- ----------------------------
-- Table structure for commentlike_0
-- ----------------------------
DROP TABLE IF EXISTS `commentlike_0`;
CREATE TABLE `commentlike_0`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `commentId` bigint NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `commentLike_1_idx`(`commentId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commentlike_0
-- ----------------------------

-- ----------------------------
-- Table structure for commentlike_1
-- ----------------------------
DROP TABLE IF EXISTS `commentlike_1`;
CREATE TABLE `commentlike_1`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `commentId` bigint NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `commentLike_1_idx`(`commentId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commentlike_1
-- ----------------------------

-- ----------------------------
-- Table structure for commentlike_2
-- ----------------------------
DROP TABLE IF EXISTS `commentlike_2`;
CREATE TABLE `commentlike_2`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `commentId` bigint NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `commentLike_1_idx`(`commentId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commentlike_2
-- ----------------------------

-- ----------------------------
-- Table structure for commentlike_3
-- ----------------------------
DROP TABLE IF EXISTS `commentlike_3`;
CREATE TABLE `commentlike_3`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `commentId` bigint NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `commentLike_1_idx`(`commentId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commentlike_3
-- ----------------------------

-- ----------------------------
-- Table structure for commentreplylike_0
-- ----------------------------
DROP TABLE IF EXISTS `commentreplylike_0`;
CREATE TABLE `commentreplylike_0`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `replyId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `commentReply_1_idx`(`replyId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commentreplylike_0
-- ----------------------------

-- ----------------------------
-- Table structure for commentreplylike_1
-- ----------------------------
DROP TABLE IF EXISTS `commentreplylike_1`;
CREATE TABLE `commentreplylike_1`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `replyId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `commentReplyLike_1_idx`(`replyId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commentreplylike_1
-- ----------------------------

-- ----------------------------
-- Table structure for commentreplylike_2
-- ----------------------------
DROP TABLE IF EXISTS `commentreplylike_2`;
CREATE TABLE `commentreplylike_2`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `replyId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `commentReplyLike_1_idx`(`replyId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commentreplylike_2
-- ----------------------------

-- ----------------------------
-- Table structure for commentreplylike_3
-- ----------------------------
DROP TABLE IF EXISTS `commentreplylike_3`;
CREATE TABLE `commentreplylike_3`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `replyId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `commentReplyLike_1_idx`(`replyId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commentreplylike_3
-- ----------------------------

-- ----------------------------
-- Table structure for customreply
-- ----------------------------
DROP TABLE IF EXISTS `customreply`;
CREATE TABLE `customreply`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `customCommentId` bigint NULL DEFAULT NULL,
  `customItemId` bigint NULL DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `staff` bit(1) NOT NULL,
  `times` datetime NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customReply_1_idx`(`customCommentId` ASC) USING BTREE,
  INDEX `customReply_2_idx`(`customItemId` ASC) USING BTREE,
  INDEX `customReply_3_idx`(`userName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customreply
-- ----------------------------

-- ----------------------------
-- Table structure for disableusername
-- ----------------------------
DROP TABLE IF EXISTS `disableusername`;
CREATE TABLE `disableusername`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of disableusername
-- ----------------------------
INSERT INTO `disableusername` VALUES (1, '*admin*');
INSERT INTO `disableusername` VALUES (2, '*@*');
INSERT INTO `disableusername` VALUES (3, '*#*');
INSERT INTO `disableusername` VALUES (4, '*!*');
INSERT INTO `disableusername` VALUES (5, '*\\*');

-- ----------------------------
-- Table structure for emailsetting
-- ----------------------------
DROP TABLE IF EXISTS `emailsetting`;
CREATE TABLE `emailsetting`  (
  `id` int NOT NULL,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `port` int NULL DEFAULT NULL,
  `supportedMailboxes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `version` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emailsetting
-- ----------------------------

-- ----------------------------
-- Table structure for favorites_0
-- ----------------------------
DROP TABLE IF EXISTS `favorites_0`;
CREATE TABLE `favorites_0`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `favorites_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorites_0
-- ----------------------------

-- ----------------------------
-- Table structure for favorites_1
-- ----------------------------
DROP TABLE IF EXISTS `favorites_1`;
CREATE TABLE `favorites_1`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `favorites_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorites_1
-- ----------------------------

-- ----------------------------
-- Table structure for favorites_2
-- ----------------------------
DROP TABLE IF EXISTS `favorites_2`;
CREATE TABLE `favorites_2`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `favorites_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorites_2
-- ----------------------------

-- ----------------------------
-- Table structure for favorites_3
-- ----------------------------
DROP TABLE IF EXISTS `favorites_3`;
CREATE TABLE `favorites_3`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `favorites_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorites_3
-- ----------------------------

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contact` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `createDate` datetime(6) NULL DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `feedback_1_idx`(`createDate` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------

-- ----------------------------
-- Table structure for follow_0
-- ----------------------------
DROP TABLE IF EXISTS `follow_0`;
CREATE TABLE `follow_0`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `friendUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `follow_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follow_0
-- ----------------------------

-- ----------------------------
-- Table structure for follow_1
-- ----------------------------
DROP TABLE IF EXISTS `follow_1`;
CREATE TABLE `follow_1`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `friendUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `follow_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follow_1
-- ----------------------------

-- ----------------------------
-- Table structure for follow_2
-- ----------------------------
DROP TABLE IF EXISTS `follow_2`;
CREATE TABLE `follow_2`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `friendUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `follow_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follow_2
-- ----------------------------

-- ----------------------------
-- Table structure for follow_3
-- ----------------------------
DROP TABLE IF EXISTS `follow_3`;
CREATE TABLE `follow_3`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `friendUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `follow_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follow_3
-- ----------------------------

-- ----------------------------
-- Table structure for follower_0
-- ----------------------------
DROP TABLE IF EXISTS `follower_0`;
CREATE TABLE `follower_0`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `friendUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `follower_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follower_0
-- ----------------------------

-- ----------------------------
-- Table structure for follower_1
-- ----------------------------
DROP TABLE IF EXISTS `follower_1`;
CREATE TABLE `follower_1`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `friendUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `follower_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follower_1
-- ----------------------------

-- ----------------------------
-- Table structure for follower_2
-- ----------------------------
DROP TABLE IF EXISTS `follower_2`;
CREATE TABLE `follower_2`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `friendUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `follower_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follower_2
-- ----------------------------

-- ----------------------------
-- Table structure for follower_3
-- ----------------------------
DROP TABLE IF EXISTS `follower_3`;
CREATE TABLE `follower_3`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `friendUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `follower_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follower_3
-- ----------------------------

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `dirName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `displayType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `formValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `forumChildType` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `forumType` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `invokeMethod` int NULL DEFAULT NULL,
  `layoutFile` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `layoutId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `layoutType` int NULL DEFAULT NULL,
  `module` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `queryMode` int NULL DEFAULT NULL,
  `referenceCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES (1, 'default', 'page', '{\"topic_id\":\"4a52e57deb194acd881262f4bb2eb20b\",\"topic_quantity\":null,\"topic_sort\":1,\"topic_more\":null,\"topic_moreValue\":null,\"topic_maxResult\":30,\"topic_pageCount\":10,\"topic_tagId\":null,\"topic_tagName\":null,\"topic_tag_transferPrameter\":true,\"topic_recommendTopicList\":{}}', '话题列表', '话题', 1, 'index.html', '32df80989f8d4b4ebc359364bef9a07d', 1, 'topicRelated_topic_page_default', '话题列表', 0, 'topicRelated_topic_1');
INSERT INTO `forum` VALUES (4, 'default', 'entityBean', NULL, '话题内容', '话题', 2, 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', 4, 'topicRelated_topicContent_entityBean_default', '话题内容', 0, 'topicRelated_topicContent_1');
INSERT INTO `forum` VALUES (5, 'default', 'page', '{\"comment_id\":\"88c04787605d40b1aa25fc689ae3de88\",\"comment_maxResult\":8,\"comment_pageCount\":null,\"comment_sort\":1}', '评论列表', '话题', 1, 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', 4, 'topicRelated_comment_page_default', '评论列表', 0, 'topicRelated_comment_2');
INSERT INTO `forum` VALUES (6, 'default', 'collection', NULL, '添加评论', '话题', 1, 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', 4, 'topicRelated_addComment_collection_default', '添加评论', 0, 'topicRelated_addComment_1');
INSERT INTO `forum` VALUES (7, 'default', 'collection', NULL, '回复评论', '话题', 1, 'blank_2.html', 'e447aa94ad9e47e4be5d58482d75dc23', 4, 'topicRelated_replyComment_collection_default', '回复评论', 0, 'topicRelated_replyComment_1');
INSERT INTO `forum` VALUES (8, 'default', 'collection', NULL, '引用评论', '话题', 1, 'blank_3.html', '72242bb3ca3a463eae46ed0c07826f4f', 4, 'topicRelated_quoteComment_collection_default', '引用评论', 0, 'topicRelated_quoteComment_1');
INSERT INTO `forum` VALUES (9, 'default', 'collection', NULL, '添加话题', '话题', 1, 'index.html', '32df80989f8d4b4ebc359364bef9a07d', 1, 'topicRelated_addTopic_collection_default', '添加话题', 0, 'topicRelated_addTopic_1');
INSERT INTO `forum` VALUES (11, 'default', 'collection', NULL, '标签列表', '话题', 1, NULL, '1c3a08c1f26e49d2a31be02187010ef3', 6, 'topicRelated_tag_collection_default', '标签列表', 0, 'quote_1');
INSERT INTO `forum` VALUES (12, 'default', 'collection', NULL, '标签列表', '话题', 2, 'index.html', '32df80989f8d4b4ebc359364bef9a07d', 1, 'topicRelated_tag_collection_default', '标签列表', 0, 'topicRelated_tag_1');
INSERT INTO `forum` VALUES (13, 'default', 'collection', NULL, '站点栏目列表', '站点栏目', 1, 'newPublic_2.html', '90e9a5ef12b843adb3d282332fbd27df', 5, 'columnRelated_column_collection_default', '站点栏目', 0, 'columnRelated_column_1');
INSERT INTO `forum` VALUES (14, 'default', 'collection', NULL, '标签列表', '话题', 1, 'index.html', '32df80989f8d4b4ebc359364bef9a07d', 1, 'topicRelated_tag_collection_navigation', '标签导航', 0, 'topicRelated_tag_2');
INSERT INTO `forum` VALUES (15, 'default', 'collection', NULL, '标签列表', '话题', 1, 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', 4, 'topicRelated_tag_collection_navigation2', '导航标签', 0, 'topicRelated_tag_3');
INSERT INTO `forum` VALUES (16, 'default', 'entityBean', '{\"html_id\":\"f0b49796852644acb8a6e557390b54c0\",\"html_content\":\"欢迎您注册成为本站用户！<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 请仔细阅读下面的协议，只有接受协议才能继续进行注册。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1．服务条款的确认和接纳<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站用户服务的所有权和运作权归本站拥有。本站所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与本站达成协议并接受所有的服务条款。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2． 本站服务简介<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户必须： <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;2)个人上网和支付与此服务有关的电话费用、网络费用。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户同意： <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;1)提供及时、详尽及准确的个人资料。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，本站合理地认为用户的行为可能违反上述法律、法规，本站可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3． 服务条款的修改<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4． 服务修订<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站保留随时修改或中断服务而不需知照用户的权利。本站行使修改或中断服务的权利，不需对用户或第三方负责。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5． 用户隐私制度<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;尊重用户个人隐私是本站的基本政策。本站不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或本站在诚信的基础上认为透露这些信息在以下三种情况是必要的： <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;1)遵守有关法律规定，遵从合法服务程序。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;2)保持维护本站的商标所有权。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;4)符合其他相关的要求。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6．用户的帐号，密码和安全性<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;一旦注册成功成为本站用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知本站。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7． 免责条款<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户明确同意网站服务的使用由用户个人承担风险。 &emsp;&emsp; <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过本站服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8．有限责任<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站对任何直接、间接、偶然、特殊及继起的损害不负责任。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9． 不提供零售和商业性服务 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经本站同意，不能利用网站服务进行销售或其他商业用途。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10．用户责任 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户单独承担传输内容的责任。用户必须遵循： <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;1)从中国境内向外传输技术性资料时必须符合中国有关法规。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;2)使用网站服务不作非法用途。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;3)不干扰或混乱网络服务。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;4)不在论坛BBS或留言簿发表任何与政治相关的信息。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;5)遵守所有使用网站服务的网络协议、规定、程序和惯例。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;7)不得利用本站制作、复制和传播下列信息： <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;1、煽动抗拒、破坏宪法和法律、行政法规实施的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;2、煽动颠覆国家政权，推翻社会主义制度的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;3、煽动分裂国家、破坏国家统一的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;4、煽动民族仇恨、民族歧视，破坏民族团结的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;8、损害国家机关信誉的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;9、其他违反宪法和法律行政法规的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;10、进行商业广告行为的。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，本站将取消用户服务帐号。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11．网站内容的所有权<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；本站为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本站和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12．附加信息服务<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户在享用本站提供的免费服务的同时，同意接受本站提供的各类附加信息服务。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13．解释权<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本注册协议的解释权归本站所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。\"}', '用户自定义HTML', '自定义版块', 1, NULL, '4ecf97fde2584bd9a5f495ac447dd091', 4, 'customForumRelated_customHTML_entityBean_default', '服务条款', 0, 'customForumRelated_customHTML_1');
INSERT INTO `forum` VALUES (17, 'default', 'page', '{\"topic_id\":\"6b3b554e2c354275bab82771e8dc803a\",\"topic_quantity\":null,\"topic_sort\":1,\"topic_more\":null,\"topic_moreValue\":null,\"topic_maxResult\":30,\"topic_pageCount\":null,\"topic_tagId\":null,\"topic_tagName\":null,\"topic_tag_transferPrameter\":true,\"topic_recommendTopicList\":{}}', '话题列表', '话题', 1, NULL, '51c556e4c09a44f8bbf2721b2fde7c55', 4, 'topicRelated_topic_page_default', '话题列表', 0, 'topicRelated_topic_2');
INSERT INTO `forum` VALUES (18, 'default', 'collection', NULL, '标签列表', '话题', 1, NULL, '79065de632934072944d1dcfb224ea28', 4, 'topicRelated_tag_collection_default', '全部标签', 0, 'topicRelated_tag_4');
INSERT INTO `forum` VALUES (19, 'default', 'entityBean', NULL, '话题内容', '话题', 1, NULL, 'a70dcb211a154bbba81697508113668b', 4, 'topicRelated_topicContent_entityBean_default', '话题内容', 0, 'topicRelated_topicContent_2');
INSERT INTO `forum` VALUES (20, 'default', 'page', '{\"comment_id\":\"c64441bfb1b6433781bac22264e65bf6\",\"comment_maxResult\":30,\"comment_pageCount\":null,\"comment_sort\":2}', '评论列表', '话题', 1, NULL, '375cd75aaa974f779a3efd448b6ef483', 4, 'topicRelated_comment_page_default', '评论列表', 0, 'topicRelated_comment_3');
INSERT INTO `forum` VALUES (21, 'default', 'collection', NULL, '添加话题', '话题', 1, NULL, '55fd045cac664aea8704b7f821f074a2', 4, 'topicRelated_addTopic_collection_default', '发表话题', 0, 'topicRelated_addTopic_2');
INSERT INTO `forum` VALUES (22, 'default', 'collection', NULL, '添加评论', '话题', 1, NULL, '6f1b6d4452b64c5ea3cbffff1dab6b6e', 4, 'topicRelated_addComment_collection_default', '添加评论', 0, 'topicRelated_addComment_2');
INSERT INTO `forum` VALUES (23, 'default', 'collection', NULL, '引用评论', '话题', 1, NULL, '88f5becc14d34ec6969feaf39a637b69', 4, 'topicRelated_quoteComment_collection_default', '引用评论', 0, 'topicRelated_quoteComment_2');
INSERT INTO `forum` VALUES (24, 'default', 'collection', NULL, '回复评论', '话题', 1, NULL, '730fec12b0e846a1acfa81e9c4c99efc', 4, 'topicRelated_replyComment_collection_default', '回复评论', 0, 'topicRelated_replyComment_2');
INSERT INTO `forum` VALUES (25, 'default', 'collection', NULL, '友情链接列表', '友情链接', 1, 'index.html', '32df80989f8d4b4ebc359364bef9a07d', 1, 'linksRelated_links_collection_default', '友情链接', 0, 'linksRelated_links_1');
INSERT INTO `forum` VALUES (26, 'default', 'collection', NULL, '添加在线留言', '在线留言', 1, 'blank_4.html', 'e906542026964981b8251aac0894c494', 4, 'feedbackRelated_addFeedback_collection_default', '添加在线留言', 0, 'feedbackRelated_addFeedback_1');
INSERT INTO `forum` VALUES (28, 'default', 'entityBean', NULL, '话题会员收藏总数', '收藏夹', 1, NULL, '5b37a52dc0604914881d767664f39ca2', 4, 'favoriteRelated_favoriteCount_entityBean_default', '查询话题会员收藏总数', 0, 'favoriteRelated_favoriteCount_1');
INSERT INTO `forum` VALUES (29, 'default', 'entityBean', NULL, '用户是否已经收藏话题', '收藏夹', 1, NULL, '4a9681cc36d54a88be3ca330c28d1675', 4, 'favoriteRelated_alreadyCollected_entityBean_default', '查询用户是否已收藏话题', 0, 'favoriteRelated_alreadyCollected_1');
INSERT INTO `forum` VALUES (30, 'default', 'collection', NULL, '加入收藏夹', '收藏夹', 1, 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', 4, 'favoriteRelated_addFavorite_collection_default', '加入收藏夹', 0, 'favoriteRelated_addFavorite_1');
INSERT INTO `forum` VALUES (31, 'default', 'collection', NULL, '话题取消隐藏', '话题', 1, 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', 4, 'topicRelated_topicUnhide_collection_default', '话题取消隐藏', 0, 'topicRelated_topicUnhide_1');
INSERT INTO `forum` VALUES (32, 'default', 'collection', NULL, '话题取消隐藏', '话题', 1, 'userDynamicList.html', '5c7624ced2c845b28741c724594b6b0c', 1, 'topicRelated_topicUnhide_collection_default', '话题取消隐藏', 0, 'topicRelated_topicUnhide_2');
INSERT INTO `forum` VALUES (33, 'default', 'collection', NULL, '给话题点赞', '点赞', 1, 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', 4, 'likeRelated_addLike_collection_default', '给话题点赞', 0, 'likeRelated_addLike_1');
INSERT INTO `forum` VALUES (34, 'default', 'entityBean', NULL, '话题点赞总数', '点赞', 1, NULL, '91fcfa258f41472096f57db6308856cf', 4, 'likeRelated_likeCount_entityBean_default', '话题点赞总数', 0, 'likeRelated_likeCount_1');
INSERT INTO `forum` VALUES (35, 'default', 'entityBean', NULL, '用户是否已经点赞该话题', '点赞', 1, NULL, '402eabef91f246859d854838997e6eb6', 4, 'likeRelated_alreadyLiked_entityBean_default', '用户是否已经点赞该话题', 0, 'likeRelated_alreadyLiked_1');
INSERT INTO `forum` VALUES (36, 'default', 'collection', NULL, '关注用户', '关注', 1, 'home.html', '440b1b2f202d4de38f450226083ca174', 1, 'followRelated_addFollow_collection_default', '关注用户', 0, 'followRelated_addFollow_1');
INSERT INTO `forum` VALUES (37, 'default', 'entityBean', NULL, '粉丝总数', '关注', 1, NULL, '65735bf28feb47088a5102ff644a0d77', 4, 'followRelated_followerCount_entityBean_default', '查询粉丝总数', 0, 'followRelated_followerCount_1');
INSERT INTO `forum` VALUES (38, 'default', 'entityBean', NULL, '是否已经关注该用户', '关注', 1, NULL, '6c6f77c044024be0a56486f0336df56c', 4, 'followRelated_following_entityBean_default', '查询是否已经关注该用户', 0, 'followRelated_following_1');
INSERT INTO `forum` VALUES (39, 'default', 'collection', '{\"likeTopic_id\":\"1642cff6571245dabe16ae94a8ced94e\",\"likeTopic_maxResult\":10}', '相似话题', '话题', 1, 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', 4, 'topicRelated_likeTopic_collection_default', '相似话题', 0, 'topicRelated_likeTopic_1');
INSERT INTO `forum` VALUES (40, 'default', 'collection', NULL, '会员卡列表', '会员卡', 1, 'blank_5.html', '7f2d29e0c92d43b4844e0c9400b62ebd', 4, 'membershipCardRelated_membershipCard_collection_default', '会员卡列表', 0, 'membershipCardRelated_membershipCard_1');
INSERT INTO `forum` VALUES (41, 'default', 'entityBean', NULL, '会员卡内容', '会员卡', 1, 'blank_6.html', '8bf2670aafb9429a92a2dab3c1f08d60', 4, 'membershipCardRelated_membershipCardContent_entityBean_default', '会员卡内容', 0, 'membershipCardRelated_membershipCardContent_1');
INSERT INTO `forum` VALUES (42, 'default', 'collection', NULL, '购买会员卡', '会员卡', 1, 'blank_6.html', '8bf2670aafb9429a92a2dab3c1f08d60', 4, 'membershipCardRelated_buyMembershipCard_collection_default', '购买会员卡', 0, 'membershipCardRelated_buyMembershipCard_1');
INSERT INTO `forum` VALUES (43, 'default', 'collection', NULL, '会员卡列表', '会员卡', 1, NULL, 'd548ee0e9d84456c8f616671022d043b', 4, 'membershipCardRelated_membershipCard_collection_default', '查询会员卡列表', 0, 'membershipCardRelated_membershipCard_2');
INSERT INTO `forum` VALUES (44, 'default', 'entityBean', NULL, '会员卡内容', '会员卡', 1, NULL, '5d6067bbc62646f7a22f8095cca01f98', 4, 'membershipCardRelated_membershipCardContent_entityBean_default', '会员卡内容', 0, 'membershipCardRelated_membershipCardContent_2');
INSERT INTO `forum` VALUES (45, 'default', 'collection', NULL, '修改话题', '话题', 1, 'blank_7.html', '0f667ec7b1884604a164a22c0fe037e0', 4, 'topicRelated_editTopic_collection_default', '修改话题', 0, 'topicRelated_editTopic_1');
INSERT INTO `forum` VALUES (46, 'default', 'collection', NULL, '修改话题', '话题', 1, NULL, '0f61e4a78bba476faa52040b15c25597', 4, 'topicRelated_editTopic_collection_default', '修改话题', 0, 'topicRelated_editTopic_2');
INSERT INTO `forum` VALUES (47, 'default', 'page', '{\"question_id\":\"94cbe208feb5483a82b98cc12f1bcf4f\",\"question_quantity\":null,\"question_sort\":1,\"question_more\":null,\"question_moreValue\":null,\"question_maxResult\":30,\"question_pageCount\":null,\"question_tagId\":null,\"question_tagName\":null,\"question_tag_transferPrameter\":true,\"question_filterCondition\":null,\"question_filterCondition_transferPrameter\":true,\"question_recommendQuestionList\":{}}', '问题列表', '问答', 1, 'blank_8.html', '197fb4524ba0483d8406ee25fdc21487', 4, 'questionRelated_question_page_default', '问题列表', 0, 'questionRelated_question_1');
INSERT INTO `forum` VALUES (48, 'default', 'entityBean', NULL, '问题内容', '问答', 2, 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', 4, 'questionRelated_questionContent_entityBean_default', '问题内容', 0, 'questionRelated_questionContent_1');
INSERT INTO `forum` VALUES (49, 'default', 'collection', NULL, '关注用户', '关注', 1, 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', 4, 'followRelated_addFollow_collection_default', '关注用户', 0, 'followRelated_addFollow_2');
INSERT INTO `forum` VALUES (50, 'default', 'page', '{\"answer_id\":\"6cbe1e2efad64c85a245da5ff9d1a4c8\",\"answer_maxResult\":15,\"answer_pageCount\":null,\"answer_sort\":2}', '答案列表', '问答', 1, 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', 4, 'questionRelated_answer_page_default', '答案列表', 0, 'questionRelated_answer_1');
INSERT INTO `forum` VALUES (51, 'default', 'collection', NULL, '问题标签列表', '问答', 1, 'blank_8.html', '197fb4524ba0483d8406ee25fdc21487', 4, 'questionRelated_questionTag_collection_default', '问题标签', 0, 'questionRelated_questionTag_1');
INSERT INTO `forum` VALUES (52, 'default', 'collection', NULL, '添加问题', '问答', 1, 'blank_10.html', '9e9cafbe93314ca585aedbe98f3b4e11', 4, 'questionRelated_addQuestion_collection_default', '添加问题', 0, 'questionRelated_addQuestion_1');
INSERT INTO `forum` VALUES (53, 'default', 'collection', NULL, '问题标签列表', '问答', 1, NULL, '7c79820f306143378169167088f17cc2', 4, 'questionRelated_questionTag_collection_default', '问题标签', 0, 'questionRelated_questionTag_2');
INSERT INTO `forum` VALUES (54, 'default', 'collection', NULL, '添加答案', '问答', 1, 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', 4, 'questionRelated_addAnswer_collection_default', '添加答案', 0, 'questionRelated_addAnswer_1');
INSERT INTO `forum` VALUES (55, 'default', 'collection', NULL, '回复答案', '问答', 1, 'blank_11.html', '894c1ee85cb34067a0f2c82364178a66', 4, 'questionRelated_replyAnswer_collection_default', '回复答案', 0, 'questionRelated_replyAnswer_1');
INSERT INTO `forum` VALUES (56, 'default', 'collection', NULL, '采纳答案', '问答', 1, 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', 4, 'questionRelated_adoptionAnswer_collection_default', '采纳答案', 0, 'questionRelated_adoptionAnswer_1');
INSERT INTO `forum` VALUES (57, 'default', 'entityBean', NULL, '关注总数', '关注', 1, NULL, '4605cd9bb304408883ecc648ba911e37', 4, 'followRelated_followCount_entityBean_default', '关注总数', 0, 'followRelated_followCount_1');
INSERT INTO `forum` VALUES (58, 'default', 'entityBean', NULL, '回答总数', '问答', 1, NULL, 'b9d3684fd5004247b4820ca5b9a5bff3', 4, 'questionRelated_answerCount_entityBean_default', '回答总数', 0, 'questionRelated_answerCount_1');
INSERT INTO `forum` VALUES (59, 'default', 'collection', '{\"likeQuestion_id\":\"1e2c10a7a96241bb9e7572eea9830b7e\",\"likeQuestion_maxResult\":10}', '相似问题', '问答', 1, 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', 4, 'questionRelated_likeQuestion_collection_default', '相似问题', 0, 'questionRelated_likeQuestion_1');
INSERT INTO `forum` VALUES (60, 'default', 'page', '{\"question_id\":\"9075b80be5aa4b719bc2d38eab3ab017\",\"question_quantity\":null,\"question_sort\":1,\"question_more\":null,\"question_moreValue\":null,\"question_maxResult\":30,\"question_pageCount\":null,\"question_tagId\":null,\"question_tagName\":null,\"question_tag_transferPrameter\":true,\"question_filterCondition\":null,\"question_filterCondition_transferPrameter\":true,\"question_recommendQuestionList\":{}}', '问题列表', '问答', 1, NULL, '4f98b0ca689c4fb495c0a12cafe5a650', 4, 'questionRelated_question_page_default', '问题列表', 0, 'questionRelated_question_2');
INSERT INTO `forum` VALUES (61, 'default', 'entityBean', NULL, '问题内容', '问答', 1, NULL, '1d95af33c5ff4eff96c56a79d3ec68dd', 4, 'questionRelated_questionContent_entityBean_default', '问题内容', 0, 'questionRelated_questionContent_2');
INSERT INTO `forum` VALUES (62, 'default', 'page', '{\"answer_id\":\"44936843f7b24741a92ffabf8f41e2a7\",\"answer_maxResult\":15,\"answer_pageCount\":null,\"answer_sort\":2}', '答案列表', '问答', 1, NULL, '69b1d61a5afa47a0a05760c5ac7ac282', 4, 'questionRelated_answer_page_default', '答案列表', 0, 'questionRelated_answer_2');
INSERT INTO `forum` VALUES (63, 'default', 'collection', NULL, '添加问题', '问答', 1, NULL, '31f359bb910044749c8073b861fa2909', 4, 'questionRelated_addQuestion_collection_default', '添加问题', 0, 'questionRelated_addQuestion_2');
INSERT INTO `forum` VALUES (64, 'default', 'collection', NULL, '添加答案', '问答', 1, NULL, 'd734da046f784ff2a80dc79515b93646', 4, 'questionRelated_addAnswer_collection_default', '添加答案', 0, 'questionRelated_addAnswer_2');
INSERT INTO `forum` VALUES (65, 'default', 'collection', NULL, '回复答案', '问答', 1, NULL, '62077b6844e2413d9f5e73d1996c7ee9', 4, 'questionRelated_replyAnswer_collection_default', '回复答案', 0, 'questionRelated_replyAnswer_2');
INSERT INTO `forum` VALUES (66, 'default', 'collection', NULL, '关注用户', '关注', 1, 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', 4, 'followRelated_addFollow_collection_default', '关注用户', 0, 'followRelated_addFollow_3');
INSERT INTO `forum` VALUES (67, 'default', 'collection', NULL, '追加问题', '问答', 1, 'blank_12.html', '53349d99e80c4667883ffffdd9ff9e8e', 4, 'questionRelated_appendQuestion_collection_default', '追加提问', 0, 'questionRelated_appendQuestion_1');
INSERT INTO `forum` VALUES (68, 'default', 'collection', NULL, '追加问题', '问答', 1, NULL, 'eee858f7902c49e5b7adf4e23fc41960', 4, 'questionRelated_appendQuestion_collection_default', '追加提问', 0, 'questionRelated_appendQuestion_2');
INSERT INTO `forum` VALUES (69, 'default', 'collection', NULL, '加入收藏夹', '收藏夹', 1, 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', 4, 'favoriteRelated_addFavorite_collection_question', '加入收藏夹', 0, 'favoriteRelated_addFavorite_2');
INSERT INTO `forum` VALUES (70, 'default', 'entityBean', NULL, '用户是否已经收藏问题', '收藏夹', 1, NULL, 'eccf8e7e476c4714845687037d6daf96', 4, 'favoriteRelated_alreadyFavoriteQuestion_entityBean_default', '用户是否已收藏该问题', 0, 'favoriteRelated_alreadyFavoriteQuestion_1');
INSERT INTO `forum` VALUES (71, 'default', 'entityBean', NULL, '问题会员收藏总数', '收藏夹', 1, NULL, '843e3bf4f6b645dca42522ee2779d691', 4, 'favoriteRelated_questionFavoriteCount_entityBean_default', '用户问题收藏总数', 0, 'favoriteRelated_questionFavoriteCount_1');
INSERT INTO `forum` VALUES (72, 'default', 'collection', NULL, '修改评论', '话题', 1, 'blank_13.html', 'dc8425d53c864352b24969d889177321', 4, 'topicRelated_editComment_collection_default', '修改评论', 0, 'topicRelated_editComment_1');
INSERT INTO `forum` VALUES (73, 'default', 'collection', NULL, '修改评论回复', '话题', 1, 'blank_14.html', '20f3f5229e244aaa9640fa4458f2451e', 4, 'topicRelated_editReply_collection_default', '修改评论回复', 0, 'topicRelated_editReply_1');
INSERT INTO `forum` VALUES (74, 'default', 'collection', NULL, '修改评论', '话题', 1, NULL, 'e3f72ab4c65745a8a2a4bdd8ffa65a04', 4, 'topicRelated_editComment_collection_default', '修改评论', 0, 'topicRelated_editComment_2');
INSERT INTO `forum` VALUES (75, 'default', 'collection', NULL, '修改评论回复', '话题', 1, NULL, 'b35b9b31d4584b65a1109203b6119476', 4, 'topicRelated_editReply_collection_default', '修改评论回复', 0, 'topicRelated_editReply_2');
INSERT INTO `forum` VALUES (76, 'default', 'collection', NULL, '第三方登录', '系统', 1, 'login.html', '0133f7f7319441138e4a70248c33829b', 1, 'systemRelated_thirdPartyLogin_collection_default', '第三方登录', 0, 'systemRelated_thirdPartyLogin_1');
INSERT INTO `forum` VALUES (77, 'default', 'collection', NULL, '第三方登录', '系统', 1, NULL, 'a808d04033b74c288cd7e5226d222176', 4, 'systemRelated_thirdPartyLogin_collection_default', '第三方登录', 0, 'systemRelated_thirdPartyLogin_2');
INSERT INTO `forum` VALUES (78, 'default', 'collection', NULL, '修改答案', '问答', 1, 'blank_15.html', '02619989d8fe4ca6b60d0cd855cf57a9', 4, 'questionRelated_editAnswer_collection_default', '修改答案', 0, 'questionRelated_editAnswer_1');
INSERT INTO `forum` VALUES (79, 'default', 'collection', NULL, '修改答案回复', '问答', 1, 'blank_16.html', 'a86967d780014f3d850efcf9d5b0fcba', 4, 'questionRelated_editReply_collection_default', '修改答案回复', 0, 'questionRelated_editReply_1');
INSERT INTO `forum` VALUES (80, 'default', 'collection', NULL, '修改答案', '问答', 1, NULL, '4f6397a608a548be8b09a6b06c788e50', 4, 'questionRelated_editAnswer_collection_default', '修改答案', 0, 'questionRelated_editAnswer_2');
INSERT INTO `forum` VALUES (81, 'default', 'collection', NULL, '修改答案回复', '问答', 1, NULL, '4f99621be57642109a3040138ad3afca', 4, 'questionRelated_editReply_collection_default', '修改答案回复', 0, 'questionRelated_editReply_2');
INSERT INTO `forum` VALUES (82, 'default', 'entityBean', NULL, '发红包内容', '红包', 1, 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', 4, 'redEnvelopeRelated_giveRedEnvelopeContent_entityBean_default', '发红包内容', 0, 'redEnvelopeRelated_giveRedEnvelopeContent_1');
INSERT INTO `forum` VALUES (83, 'default', 'page', '{\"receiveRedEnvelopeUser_id\":\"9440a764a0c04c8daaef6d08255abb36\",\"receiveRedEnvelopeUser_maxResult\":12,\"receiveRedEnvelopeUser_sort\":10}', '领取红包用户列表', '红包', 1, NULL, 'd627809654484be288ae30b32457a2d6', 4, 'redEnvelopeRelated_receiveRedEnvelopeUser_page_default', '领取红包用户列表', 0, 'redEnvelopeRelated_receiveRedEnvelopeUser_1');
INSERT INTO `forum` VALUES (84, 'default', 'entityBean', NULL, '发红包内容', '红包', 1, NULL, 'e6da1f7084864f91992a61f32fbaafc0', 4, 'redEnvelopeRelated_giveRedEnvelopeContent_entityBean_default', '发红包', 0, 'redEnvelopeRelated_giveRedEnvelopeContent_2');
INSERT INTO `forum` VALUES (85, 'default', 'collection', NULL, '在线帮助分类', '在线帮助', 1, 'blank_17.html', '339ad4fabe7c4362ace884fa0f56feea', 4, 'helpRelated_helpType_collection_default', '在线帮助分类', 0, 'helpRelated_helpType_1');
INSERT INTO `forum` VALUES (86, 'default', 'entityBean', NULL, '在线帮助内容', '在线帮助', 2, 'blank_18.html', '96ada50db91c4afbb6c1074300939b22', 4, 'helpRelated_helpContent_entityBean_default', '在线帮助内容', 0, 'helpRelated_helpContent_1');
INSERT INTO `forum` VALUES (87, 'default', 'collection', NULL, '在线帮助列表', '在线帮助', 2, 'blank_18.html', '96ada50db91c4afbb6c1074300939b22', 4, 'helpRelated_help_collection_default', '在线帮助列表', 0, 'helpRelated_help_1');
INSERT INTO `forum` VALUES (88, 'default', 'collection', NULL, '在线帮助导航', '在线帮助', 2, 'blank_18.html', '96ada50db91c4afbb6c1074300939b22', 4, 'helpRelated_helpNavigation_collection_default', '在线帮助导航', 0, 'helpRelated_helpNavigation_1');
INSERT INTO `forum` VALUES (89, 'default', 'collection', NULL, '在线帮助分类', '在线帮助', 1, NULL, '66a96e7ee8304694ba86dd75836afdcb', 4, 'helpRelated_helpType_collection_default', '在线帮助分类', 0, 'helpRelated_helpType_2');
INSERT INTO `forum` VALUES (90, 'default', 'entityBean', NULL, '在线帮助内容', '在线帮助', 1, NULL, '13f0e445ce6d416fb33a63558ce70b4b', 4, 'helpRelated_helpContent_entityBean_default', '在线帮助内容', 0, 'helpRelated_helpContent_2');
INSERT INTO `forum` VALUES (91, 'default', 'collection', NULL, '在线帮助列表', '在线帮助', 1, NULL, '419e6748fc534966a67ad4e8443dc216', 4, 'helpRelated_help_collection_default', '在线帮助列表', 0, 'helpRelated_help_2');
INSERT INTO `forum` VALUES (92, 'default', 'collection', NULL, '在线帮助导航', '在线帮助', 1, NULL, 'c8ad33d6f9a24809ae348ce44de1b4c1', 4, 'helpRelated_helpNavigation_collection_default', '在线帮助导航', 0, 'helpRelated_helpNavigation_2');
INSERT INTO `forum` VALUES (93, 'api', 'collection', NULL, '站点栏目列表', '站点栏目', 1, NULL, '139c10a2b22b43f38aa2b8680be5cf2c', 4, 'columnRelated_column_collection_default', '站点栏目', 0, 'columnRelated_column_1');
INSERT INTO `forum` VALUES (94, 'api', 'entityBean', NULL, '粉丝总数', '关注', 1, NULL, '9283ad4a07a343828c145200f1fd272c', 4, 'followRelated_followerCount_entityBean_default', '粉丝总数', 0, 'followRelated_followerCount_1');
INSERT INTO `forum` VALUES (95, 'api', 'entityBean', NULL, '是否已经关注该用户', '关注', 1, NULL, '9b78793395bd415fa6349d889226089c', 4, 'followRelated_following_entityBean_default', '查询是否已关注该用户', 0, 'followRelated_following_1');
INSERT INTO `forum` VALUES (96, 'api', 'collection', NULL, '第三方登录', '系统', 1, NULL, 'f119cd0e918742838000f096ec42358d', 4, 'systemRelated_thirdPartyLogin_collection_default', '第三方登录', 0, 'systemRelated_thirdPartyLogin_1');
INSERT INTO `forum` VALUES (97, 'api', 'entityBean', NULL, '话题内容', '话题', 1, NULL, 'afd68d68b7e4405ca555fa1fafb3681e', 4, 'topicRelated_topicContent_entityBean_default', '话题内容', 0, 'topicRelated_topicContent_1');
INSERT INTO `forum` VALUES (98, 'api', 'entityBean', NULL, '问题内容', '问答', 1, NULL, 'babfe2e086b34463933149b07932e265', 4, 'questionRelated_questionContent_entityBean_default', '查询问题内容', 0, 'questionRelated_questionContent_1');
INSERT INTO `forum` VALUES (99, 'api', 'entityBean', '{\"html_id\":\"d314eabc722044feae325de61d9199ac\",\"html_content\":\"欢迎您注册成为本站用户！<br />\\r\\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 <br />\\r\\n1．服务条款的确认和接纳<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; 本站用户服务的所有权和运作权归本站拥有。本站所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与本站达成协议并接受所有的服务条款。<br />\\r\\n2． 本站服务简介<br />\\r\\n&nbsp; &nbsp; &nbsp; 本站通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。<br />\\r\\n&nbsp; &nbsp; &nbsp; 用户必须： <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2)个人上网和支付与此服务有关的电话费用、网络费用。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;用户同意： <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;1)提供及时、详尽及准确的个人资料。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，本站合理地认为用户的行为可能违反上述法律、法规，本站可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。<br />\\r\\n3． 服务条款的修改<br />\\r\\n&nbsp; &nbsp; &nbsp; 本站会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。<br />\\r\\n4． 服务修订<br />\\r\\n&nbsp; &nbsp; &nbsp; 本站保留随时修改或中断服务而不需知照用户的权利。本站行使修改或中断服务的权利，不需对用户或第三方负责。<br />\\r\\n5． 用户隐私制度<br />\\r\\n&nbsp; &nbsp; &nbsp; 尊重用户个人隐私是本站的基本政策。本站不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或本站在诚信的基础上认为透露这些信息在以下三种情况是必要的： <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1)遵守有关法律规定，遵从合法服务程序。 <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2)保持维护本站的商标所有权。 <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4)符合其他相关的要求。 <br />\\r\\n6．用户的帐号，密码和安全性<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;一旦注册成功成为本站用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知本站。<br />\\r\\n7． 免责条款<br />\\r\\n&nbsp; &nbsp; &nbsp; 用户明确同意网站服务的使用由用户个人承担风险。 &emsp;&emsp; <br />\\r\\n&nbsp; &nbsp; &nbsp; 本站不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过本站服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 <br />\\r\\n8．有限责任<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;本站对任何直接、间接、偶然、特殊及继起的损害不负责任。<br />\\r\\n9． 不提供零售和商业性服务 <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经本站同意，不能利用网站服务进行销售或其他商业用途。<br />\\r\\n10．用户责任 <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;用户单独承担传输内容的责任。用户必须遵循： <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;1)从中国境内向外传输技术性资料时必须符合中国有关法规。 <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;2)使用网站服务不作非法用途。 <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;3)不干扰或混乱网络服务。 <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;4)不在论坛BBS或留言簿发表任何与政治相关的信息。 <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;5)遵守所有使用网站服务的网络协议、规定、程序和惯例。<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;7)不得利用本站制作、复制和传播下列信息： <br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1、煽动抗拒、破坏宪法和法律、行政法规实施的；<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2、煽动颠覆国家政权，推翻社会主义制度的；<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3、煽动分裂国家、破坏国家统一的；<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4、煽动民族仇恨、民族歧视，破坏民族团结的；<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8、损害国家机关信誉的；<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;9、其他违反宪法和法律行政法规的；<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10、进行商业广告行为的。<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，本站将取消用户服务帐号。<br />\\r\\n11．网站内容的所有权<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;本站定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；本站为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本站和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。<br />\\r\\n12．附加信息服务<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;用户在享用本站提供的免费服务的同时，同意接受本站提供的各类附加信息服务。<br />\\r\\n13．解释权<br />\\r\\n&nbsp; &nbsp; &nbsp; &nbsp;本注册协议的解释权归本站所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。\"}', '用户自定义HTML', '自定义版块', 1, NULL, 'fd72dab269d94795ac112b59364017ed', 4, 'customForumRelated_customHTML_entityBean_default', '服务条款', 0, 'customForumRelated_customHTML_1');
INSERT INTO `forum` VALUES (100, 'api', 'collection', NULL, '标签列表', '话题', 1, NULL, 'a4fe0c6f3c2a4b1eb776065c702781b3', 4, 'topicRelated_tag_collection_default', '全部标签', 0, 'topicRelated_tag_1');
INSERT INTO `forum` VALUES (101, 'api', 'page', '{\"topic_id\":\"8ccee10d032141a28336d5860f7db116\",\"topic_quantity\":null,\"topic_sort\":1,\"topic_more\":null,\"topic_moreValue\":null,\"topic_maxResult\":30,\"topic_pageCount\":null,\"topic_tagId\":null,\"topic_tagName\":null,\"topic_tag_transferPrameter\":true,\"topic_recommendTopicList\":{}}', '话题列表', '话题', 1, NULL, 'eb22678d375740a78e11c5cbcb24be0d', 4, 'topicRelated_topic_page_default', '话题分页', 0, 'topicRelated_topic_1');
INSERT INTO `forum` VALUES (102, 'api', 'collection', NULL, '友情链接列表', '友情链接', 1, NULL, '8c25652471eb476b8f293f7bb20632ca', 4, 'linksRelated_links_collection_default', '友情链接列表', 0, 'linksRelated_links_1');
INSERT INTO `forum` VALUES (103, 'api', 'collection', NULL, '添加话题', '话题', 1, NULL, 'e8126fd3b06645b1963d0dc7a6f96e65', 4, 'topicRelated_addTopic_collection_default', '发表话题', 0, 'topicRelated_addTopic_1');
INSERT INTO `forum` VALUES (104, 'api', 'entityBean', NULL, '话题会员收藏总数', '收藏夹', 1, NULL, 'a920fd623ff74d7b97f25378c3567f0c', 4, 'favoriteRelated_favoriteCount_entityBean_default', '话题会员收藏总数', 0, 'favoriteRelated_favoriteCount_1');
INSERT INTO `forum` VALUES (105, 'api', 'entityBean', NULL, '用户是否已经收藏话题', '收藏夹', 1, NULL, 'c22f985f3d0a436ba0b5c6479a121f5b', 4, 'favoriteRelated_alreadyCollected_entityBean_default', '用户是否已收藏话题', 0, 'favoriteRelated_alreadyCollected_1');
INSERT INTO `forum` VALUES (106, 'api', 'entityBean', NULL, '话题点赞总数', '点赞', 1, NULL, 'baecca44ee9b4b3bb6f6cada63b70389', 4, 'likeRelated_likeCount_entityBean_default', '话题点赞总数', 0, 'likeRelated_likeCount_1');
INSERT INTO `forum` VALUES (107, 'api', 'entityBean', NULL, '用户是否已经点赞该话题', '点赞', 1, NULL, 'f1e60813417c4c12840613da6b01726c', 4, 'likeRelated_alreadyLiked_entityBean_default', '用户是否已点赞该话题', 0, 'likeRelated_alreadyLiked_1');
INSERT INTO `forum` VALUES (108, 'api', 'collection', NULL, '修改话题', '话题', 1, NULL, '4ddaf163935e4e3cad6b3901cfb38d19', 4, 'topicRelated_editTopic_collection_default', '修改话题', 0, 'topicRelated_editTopic_1');
INSERT INTO `forum` VALUES (109, 'api', 'page', '{\"comment_id\":\"f949c71b2a914b12b147d8254a528eec\",\"comment_maxResult\":30,\"comment_pageCount\":null,\"comment_sort\":2}', '评论列表', '话题', 1, NULL, 'fbbbf2ec6fbe43f79b489b8cce26f2a6', 4, 'topicRelated_comment_page_default', '评论列表', 0, 'topicRelated_comment_1');
INSERT INTO `forum` VALUES (110, 'api', 'collection', NULL, '添加评论', '话题', 1, NULL, '9954217a647445648bf46666c826bed4', 4, 'topicRelated_addComment_collection_default', '添加评论', 0, 'topicRelated_addComment_1');
INSERT INTO `forum` VALUES (111, 'api', 'collection', NULL, '修改评论', '话题', 1, NULL, '4888f0f582df41c68c7bc98deba72711', 4, 'topicRelated_editComment_collection_default', '修改评论', 0, 'topicRelated_editComment_1');
INSERT INTO `forum` VALUES (112, 'api', 'collection', NULL, '引用评论', '话题', 1, NULL, '6f06fcbed64144d4a0a87d68e5e1ac5a', 4, 'topicRelated_quoteComment_collection_default', '引用评论', 0, 'topicRelated_quoteComment_1');
INSERT INTO `forum` VALUES (113, 'api', 'collection', NULL, '回复评论', '话题', 1, NULL, 'fb7526585c4d4ffa9e19a5bbfcadd730', 4, 'topicRelated_replyComment_collection_default', '回复评论', 0, 'topicRelated_replyComment_1');
INSERT INTO `forum` VALUES (114, 'api', 'collection', NULL, '修改评论回复', '话题', 1, NULL, 'b3ce59d4049a4a609a70480681b3d119', 4, 'topicRelated_editReply_collection_default', '修改评论回复', 0, 'topicRelated_editReply_1');
INSERT INTO `forum` VALUES (115, 'api', 'entityBean', NULL, '回答总数', '问答', 1, NULL, 'ea282240f21c46688de3e70a6a9e1925', 4, 'questionRelated_answerCount_entityBean_default', '回答总数', 0, 'questionRelated_answerCount_1');
INSERT INTO `forum` VALUES (116, 'api', 'entityBean', NULL, '关注总数', '关注', 1, NULL, '80b64ce95e2b41848c8dfe13e76f6c0d', 4, 'followRelated_followCount_entityBean_default', '关注总数', 0, 'followRelated_followCount_1');
INSERT INTO `forum` VALUES (117, 'api', 'entityBean', NULL, '发红包内容', '红包', 1, NULL, 'd738e25ac96e4e74812cdf63a639352e', 4, 'redEnvelopeRelated_giveRedEnvelopeContent_entityBean_default', '发红包内容', 0, 'redEnvelopeRelated_giveRedEnvelopeContent_1');
INSERT INTO `forum` VALUES (118, 'api', 'page', '{\"receiveRedEnvelopeUser_id\":\"4a3b6942052a48618b783f1434a51d2b\",\"receiveRedEnvelopeUser_maxResult\":13,\"receiveRedEnvelopeUser_sort\":10}', '领取红包用户列表', '红包', 1, NULL, 'c5d387ee29764c2a829278a17c629e17', 4, 'redEnvelopeRelated_receiveRedEnvelopeUser_page_default', '领取红包用户列表', 0, 'redEnvelopeRelated_receiveRedEnvelopeUser_1');
INSERT INTO `forum` VALUES (119, 'api', 'collection', '{\"likeTopic_id\":\"53b696d99f9846f3949632b426238ec4\",\"likeTopic_maxResult\":15}', '相似话题', '话题', 1, NULL, 'bfb54b63a24c4c9c91775991d0f53dcc', 4, 'topicRelated_likeTopic_collection_default', '相似话题', 0, 'topicRelated_likeTopic_1');
INSERT INTO `forum` VALUES (120, 'api', 'collection', NULL, '问题标签列表', '问答', 1, NULL, '2eb34391373643b59430301b390d87f8', 4, 'questionRelated_questionTag_collection_default', '问题标签', 0, 'questionRelated_questionTag_1');
INSERT INTO `forum` VALUES (121, 'api', 'page', '{\"question_id\":\"d3fdb4ae0d114a0d90180200eb78b626\",\"question_quantity\":null,\"question_sort\":1,\"question_more\":null,\"question_moreValue\":null,\"question_maxResult\":30,\"question_pageCount\":null,\"question_tagId\":null,\"question_tagName\":null,\"question_tag_transferPrameter\":true,\"question_filterCondition\":null,\"question_filterCondition_transferPrameter\":true,\"question_recommendQuestionList\":{}}', '问题列表', '问答', 1, NULL, 'f7676ca40900427e821f2999185d1ca0', 4, 'questionRelated_question_page_default', '问题列表', 0, 'questionRelated_question_1');
INSERT INTO `forum` VALUES (122, 'api', 'collection', NULL, '添加问题', '问答', 1, NULL, 'f7db737de89b410d8416f271247a3cad', 4, 'questionRelated_addQuestion_collection_default', '添加问题', 0, 'questionRelated_addQuestion_1');
INSERT INTO `forum` VALUES (123, 'api', 'collection', NULL, '追加问题', '问答', 1, NULL, 'd8a30fd190ad4fd1a89a5d8f9c7df573', 4, 'questionRelated_appendQuestion_collection_default', '追加问题', 0, 'questionRelated_appendQuestion_1');
INSERT INTO `forum` VALUES (124, 'api', 'entityBean', NULL, '用户是否已经收藏问题', '收藏夹', 1, NULL, '2286b0ba46bc4ca29d1528b9832d115b', 4, 'favoriteRelated_alreadyFavoriteQuestion_entityBean_default', '用户是否已经收藏该问题', 0, 'favoriteRelated_alreadyFavoriteQuestion_1');
INSERT INTO `forum` VALUES (125, 'api', 'entityBean', NULL, '问题会员收藏总数', '收藏夹', 1, NULL, 'b017258bf1b244ed8a86d24eda1ad3bf', 4, 'favoriteRelated_questionFavoriteCount_entityBean_default', '问题会员收藏总数', 0, 'favoriteRelated_questionFavoriteCount_1');
INSERT INTO `forum` VALUES (126, 'api', 'collection', NULL, '添加答案', '问答', 1, NULL, '9a4c7ba616db4c1489a5ab3b3587ed12', 4, 'questionRelated_addAnswer_collection_default', '添加答案', 0, 'questionRelated_addAnswer_1');
INSERT INTO `forum` VALUES (127, 'api', 'page', '{\"answer_id\":\"afc349e6f5d9418a95b8ad0e379b97c4\",\"answer_maxResult\":30,\"answer_pageCount\":null,\"answer_sort\":2}', '答案列表', '问答', 1, NULL, '46e93b23a0fe49eebaafe1c8c4705238', 4, 'questionRelated_answer_page_default', '答案列表', 0, 'questionRelated_answer_1');
INSERT INTO `forum` VALUES (128, 'api', 'collection', NULL, '回复答案', '问答', 1, NULL, 'a8e08924952e4501ae1c19766487bfb3', 4, 'questionRelated_replyAnswer_collection_default', '回复答案', 0, 'questionRelated_replyAnswer_1');
INSERT INTO `forum` VALUES (129, 'api', 'collection', NULL, '修改答案', '问答', 1, NULL, '890eb44b2c2d4b9db90955951a0123a4', 4, 'questionRelated_editAnswer_collection_default', '修改答案', 0, 'questionRelated_editAnswer_1');
INSERT INTO `forum` VALUES (130, 'api', 'collection', NULL, '修改答案回复', '问答', 1, NULL, '6ab3b63990bd43bd92c16b2373a09c8a', 4, 'questionRelated_editReply_collection_default', '修改答案回复', 0, 'questionRelated_editReply_1');
INSERT INTO `forum` VALUES (131, 'api', 'collection', '{\"likeQuestion_id\":\"886271ee491f47db8bf169e4101ade02\",\"likeQuestion_maxResult\":15}', '相似问题', '问答', 1, NULL, 'b3211fc921684203a0b5e5960e140274', 4, 'questionRelated_likeQuestion_collection_default', '相似问题', 0, 'questionRelated_likeQuestion_1');
INSERT INTO `forum` VALUES (132, 'api', 'collection', NULL, '会员卡列表', '会员卡', 1, NULL, 'ba307b042784455aa64cf886d0fce20e', 4, 'membershipCardRelated_membershipCard_collection_default', '会员卡列表', 0, 'membershipCardRelated_membershipCard_1');
INSERT INTO `forum` VALUES (133, 'api', 'entityBean', NULL, '会员卡内容', '会员卡', 1, NULL, '27a1ac573f9546ddb811417129d6ab52', 4, 'membershipCardRelated_membershipCardContent_entityBean_default', '会员卡内容', 0, 'membershipCardRelated_membershipCardContent_1');
INSERT INTO `forum` VALUES (134, 'api', 'collection', NULL, '在线帮助分类', '在线帮助', 1, NULL, '554557f4f99f484eb678ba20fa451073', 4, 'helpRelated_helpType_collection_default', '在线帮助分类', 0, 'helpRelated_helpType_1');
INSERT INTO `forum` VALUES (135, 'api', 'collection', NULL, '在线帮助导航', '在线帮助', 1, NULL, '6b34109ea214408d9a215fab47b47016', 4, 'helpRelated_helpNavigation_collection_default', '在线帮助导航', 0, 'helpRelated_helpNavigation_1');
INSERT INTO `forum` VALUES (136, 'api', 'collection', NULL, '在线帮助列表', '在线帮助', 1, NULL, '030d51bc3c7a4f85a9a8b27f59b8dc91', 4, 'helpRelated_help_collection_default', '在线帮助列表', 0, 'helpRelated_help_1');
INSERT INTO `forum` VALUES (137, 'api', 'entityBean', NULL, '在线帮助内容', '在线帮助', 1, NULL, 'aca9f3a710f14f61934c49c257d35002', 4, 'helpRelated_helpContent_entityBean_default', '在线帮助内容', 0, 'helpRelated_helpContent_1');
INSERT INTO `forum` VALUES (138, 'api', 'collection', NULL, '添加在线留言', '在线留言', 1, NULL, '4c0ff429df524417999b1bdcd2e34549', 4, 'feedbackRelated_addFeedback_collection_default', '添加在线留言', 0, 'feedbackRelated_addFeedback_1');
INSERT INTO `forum` VALUES (139, 'default', 'collection', NULL, '添加举报', '举报', 1, 'blank_19.html', '52432df32db44bd9b37f97bfd68f5dfd', 4, 'reportRelated_addReport_collection_default', '添加举报', 0, 'reportRelated_addReport_1');
INSERT INTO `forum` VALUES (140, 'default', 'collection', NULL, '添加举报', '举报', 1, NULL, '2b91af2b82c24f568e8ce88708343023', 4, 'reportRelated_addReport_collection_default', '添加举报', 0, 'reportRelated_addReport_2');
INSERT INTO `forum` VALUES (141, 'api', 'collection', NULL, '添加举报', '举报', 1, NULL, 'c677cbc3806e4cd191523eb758c538b0', 4, 'reportRelated_addReport_collection_default', '添加举报', 0, 'reportRelated_addReport_1');
INSERT INTO `forum` VALUES (143, 'api', 'collection', '{\"hotTopic_id\":\"a90bd6b46e1c4077b06e48b7262895bb\",\"hotTopic_maxResult\":8}', '热门话题', '话题', 1, NULL, 'd07b94ad410e43fdab473029f44c67c8', 4, 'topicRelated_hotTopic_collection_default', '热门话题', 0, 'topicRelated_hotTopic_1');
INSERT INTO `forum` VALUES (144, 'api', 'collection', NULL, 'AI助手', '系统', 1, NULL, '6037f3c12d0d4f6ab5657714aeaa4344', 4, 'systemRelated_aiAssistant_collection_default', '查询AI助手', 0, 'systemRelated_aiAssistant_1');
INSERT INTO `forum` VALUES (145, 'api', 'page', '{\"topicEssence_id\":\"197193e6a23946daa78eea1647f4a760\",\"topicEssence_sort\":1,\"topicEssence_maxResult\":30,\"topicEssence_pageCount\":null}', '话题精华列表', '话题', 1, NULL, '0a765767a02f4893b3a5e0b957a91755', 4, 'topicRelated_topicEssence_page_default', '话题精华列表', 0, 'topicRelated_topicEssence_1');

-- ----------------------------
-- Table structure for giveredenvelope
-- ----------------------------
DROP TABLE IF EXISTS `giveredenvelope`;
CREATE TABLE `giveredenvelope`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bindTopicId` bigint NULL DEFAULT NULL,
  `distributionAmountGroup` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `giveQuantity` int NULL DEFAULT NULL,
  `giveTime` datetime(6) NULL DEFAULT NULL,
  `grabRedEnvelopeUserIdGroup` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `refundAmount` decimal(12, 2) NULL DEFAULT NULL,
  `remainingQuantity` int NULL DEFAULT NULL,
  `singleAmount` decimal(12, 2) NULL DEFAULT NULL,
  `totalAmount` decimal(12, 2) NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `wishes` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `giveRedEnvelope_1_idx`(`bindTopicId` ASC) USING BTREE,
  INDEX `giveRedEnvelope_2_idx`(`userId` ASC, `giveTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of giveredenvelope
-- ----------------------------

-- ----------------------------
-- Table structure for help
-- ----------------------------
DROP TABLE IF EXISTS `help`;
CREATE TABLE `help`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `helpTypeId` bigint NULL DEFAULT NULL,
  `isMarkdown` bit(1) NULL DEFAULT NULL,
  `markdownContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `times` datetime(6) NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `visible` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `help_idx`(`helpTypeId` ASC, `visible` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of help
-- ----------------------------

-- ----------------------------
-- Table structure for helptype
-- ----------------------------
DROP TABLE IF EXISTS `helptype`;
CREATE TABLE `helptype`  (
  `id` bigint NOT NULL,
  `childNodeNumber` int NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `helpQuantity` bigint NULL DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mergerTypeId` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parentId` bigint NULL DEFAULT NULL,
  `parentIdGroup` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `totalHelp` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `helpType_1_idx`(`parentId` ASC) USING BTREE,
  INDEX `helpType_2_idx`(`parentIdGroup` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of helptype
-- ----------------------------

-- ----------------------------
-- Table structure for layout
-- ----------------------------
DROP TABLE IF EXISTS `layout`;
CREATE TABLE `layout`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `accessRequireLogin` bit(1) NOT NULL,
  `dirName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `forumData` int NULL DEFAULT NULL,
  `layoutFile` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `referenceCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `returnData` int NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of layout
-- ----------------------------
INSERT INTO `layout` VALUES ('0133f7f7319441138e4a70248c33829b', b'0', 'default', -1, 'login.html', '登录页', 'login', 0, 160, 1);
INSERT INTO `layout` VALUES ('0146a94f857542fa8868706d43712cf0', b'0', 'api', -1, 'followerList.html', '粉丝列表', 'user/control/followerList', 0, 1300, 1);
INSERT INTO `layout` VALUES ('0237f9d88e6d42b88339832be56da0b2', b'0', 'api', -1, 'giveRedEnvelopeList.html', '发红包列表', 'user/control/giveRedEnvelopeList', 0, 2200, 1);
INSERT INTO `layout` VALUES ('02619989d8fe4ca6b60d0cd855cf57a9', b'0', 'default', -1, 'blank_15.html', '修改答案', 'user/editAnswer', 0, 2180, 4);
INSERT INTO `layout` VALUES ('030d51bc3c7a4f85a9a8b27f59b8dc91', b'0', 'api', -1, NULL, '查询帮助列表', 'queryHelpList', 1, 2840, 4);
INSERT INTO `layout` VALUES ('03961f034c7f406f9208f16d199512a2', b'0', 'default', -1, 'updatePhoneBinding_step1.html', '更换绑定手机第一步', 'user/control/updatePhoneBinding/step1', 0, 276, 1);
INSERT INTO `layout` VALUES ('03d87267e62e45348c5be7b6a7d12907', b'0', 'api', -1, 'paymentCompleted.html', '付款完成页面', 'paymentCompleted', 0, 1600, 1);
INSERT INTO `layout` VALUES ('0539cfc710694d57abbd55f40836d853', b'0', 'api', -1, 'payment.html', '付款页面', 'user/control/payment', 0, 1500, 1);
INSERT INTO `layout` VALUES ('05c03df92de74379bd46f800a9861625', b'0', 'api', -1, 'userDynamicList.html', '用户动态列表', 'user/control/userDynamicList', 0, 900, 1);
INSERT INTO `layout` VALUES ('0a765767a02f4893b3a5e0b957a91755', b'0', 'api', -1, NULL, '话题精华列表', 'queryTopicEssenceList', 1, 2900, 4);
INSERT INTO `layout` VALUES ('0d062401879945608b9abdd30670db64', b'0', 'api', -1, 'replyList.html', '我的回复', 'user/control/replyList', 0, 180, 1);
INSERT INTO `layout` VALUES ('0de585bdbffa4862bcd3342c6361b928', b'0', 'api', -1, 'userLoginLogList.html', '用户登录日志列表', 'user/control/userLoginLogList', 0, 310, 1);
INSERT INTO `layout` VALUES ('0f61e4a78bba476faa52040b15c25597', b'0', 'default', -1, NULL, '修改话题(移动版)', 'queryEditTopic', 1, 1740, 4);
INSERT INTO `layout` VALUES ('0f667ec7b1884604a164a22c0fe037e0', b'0', 'default', -1, 'blank_7.html', '修改话题', 'user/editTopic', 0, 1730, 4);
INSERT INTO `layout` VALUES ('10494f8de46746e0886518832a168d9c', b'0', 'default', -1, 'balance.html', '余额', 'user/control/balance', 0, 1400, 1);
INSERT INTO `layout` VALUES ('139c10a2b22b43f38aa2b8680be5cf2c', b'0', 'api', -1, NULL, '栏目列表', 'columnList', 1, 2410, 4);
INSERT INTO `layout` VALUES ('13f0e445ce6d416fb33a63558ce70b4b', b'0', 'default', -1, NULL, '查询帮助内容(移动端)', 'queryHelpContent', 1, 2460, 4);
INSERT INTO `layout` VALUES ('1768830e9027429ba66d7ac824128fd7', b'0', 'api', -1, 'findPassWord_step1.html', '找回密码第一步', 'findPassWord/step1', 0, 136, 1);
INSERT INTO `layout` VALUES ('197fb4524ba0483d8406ee25fdc21487', b'0', 'default', -1, 'blank_8.html', '问题列表', 'askList', 0, 1750, 4);
INSERT INTO `layout` VALUES ('1a03c7d8ad84478ea63187f1fbd8ebc7', b'0', 'api', -1, 'register.html', '注册页', 'register', 0, 130, 1);
INSERT INTO `layout` VALUES ('1a22c5bcf0db4a229c3d3db8e1b96e53', b'0', 'api', -1, 'updatePhoneBinding_step2.html', '更换绑定手机第二步', 'user/control/updatePhoneBinding/step2', 0, 277, 1);
INSERT INTO `layout` VALUES ('1aae84f9973743078b7da1914d4117cf', b'0', 'api', -1, 'systemNotifyList.html', '系统通知列表', 'user/control/systemNotifyList', 0, 500, 1);
INSERT INTO `layout` VALUES ('1c3a08c1f26e49d2a31be02187010ef3', b'0', 'default', -1, NULL, '标签列表', 'quote_1', 0, 390, 6);
INSERT INTO `layout` VALUES ('1d95af33c5ff4eff96c56a79d3ec68dd', b'0', 'default', -1, NULL, '问题内容(移动版)', 'queryQuestionContent', 1, 2040, 4);
INSERT INTO `layout` VALUES ('1e409d85a5e744f19970258e8ca87f48', b'0', 'default', -1, 'agreement.html', '用户协议', 'agreement', 0, 135, 1);
INSERT INTO `layout` VALUES ('20a1d2ffa25c4f4299b94e905b098218', b'0', 'default', -1, 'newPublic_5.html', '单页应用模板(移动版)', 'newPublic_5', 0, 400, 5);
INSERT INTO `layout` VALUES ('20f3f5229e244aaa9640fa4458f2451e', b'0', 'default', -1, 'blank_14.html', '修改评论回复', 'user/editCommentReply', 0, 2140, 4);
INSERT INTO `layout` VALUES ('2286b0ba46bc4ca29d1528b9832d115b', b'0', 'api', -1, NULL, '查询用户是否已经收藏该问题', 'queryAlreadyFavoriteQuestion', 1, 2720, 4);
INSERT INTO `layout` VALUES ('24475e3169834022a2e9da4d55a30614', b'0', 'api', -1, 'balance.html', '余额', 'user/control/balance', 0, 1400, 1);
INSERT INTO `layout` VALUES ('264de55f35114b2f94e8048de00d7c29', b'0', 'default', -1, 'newPublic_4.html', '服务导航', 'newPublic_4', 0, 380, 5);
INSERT INTO `layout` VALUES ('27a1ac573f9546ddb811417129d6ab52', b'0', 'api', -1, NULL, '查询会员卡', 'queryMembershipCard', 1, 2810, 4);
INSERT INTO `layout` VALUES ('27ce9c5cba6b477882cddf32d3c4046e', b'0', 'api', -1, 'privateMessageList.html', '私信列表', 'user/control/privateMessageList', 0, 350, 1);
INSERT INTO `layout` VALUES ('29381b0502b24fb5838f52a96a7b9c7a', b'0', 'api', -1, 'home.html', '用户中心页', 'user/control/home', 0, 170, 1);
INSERT INTO `layout` VALUES ('2b91af2b82c24f568e8ce88708343023', b'0', 'default', -1, NULL, '添加举报(移动端)', 'user/queryAddReport', 1, 2490, 4);
INSERT INTO `layout` VALUES ('2bbbed906eac4491b0878573e8211406', b'0', 'default', -1, 'point.html', '积分', 'user/control/point', 0, 220, 1);
INSERT INTO `layout` VALUES ('2eb34391373643b59430301b390d87f8', b'0', 'api', -1, NULL, '查询所有问题标签', 'queryAllQuestionTag', 1, 2680, 4);
INSERT INTO `layout` VALUES ('2f0b565a37f24ed5a874ee587dda4394', b'0', 'default', -1, 'topicFavoriteList.html', '话题收藏列表', 'user/control/topicFavoriteList', 0, 700, 1);
INSERT INTO `layout` VALUES ('31f359bb910044749c8073b861fa2909', b'0', 'default', -1, NULL, '发表问题(移动版)', 'queryAddQuestion', 1, 2060, 4);
INSERT INTO `layout` VALUES ('32df80989f8d4b4ebc359364bef9a07d', b'0', 'default', -1, 'index.html', '首页', 'index', 0, 10, 1);
INSERT INTO `layout` VALUES ('339ad4fabe7c4362ace884fa0f56feea', b'0', 'default', -1, 'blank_17.html', '帮助中心', 'help', 0, 2430, 4);
INSERT INTO `layout` VALUES ('35c54a00b15148eb93ba8068fae4a8e1', b'0', 'default', -1, 'updatePhoneBinding_step2.html', '更换绑定手机第二步', 'user/control/updatePhoneBinding/step2', 0, 277, 1);
INSERT INTO `layout` VALUES ('3736da6867314018be676c56a28a582a', b'0', 'api', -1, 'index.html', '首页', 'index', 0, 10, 1);
INSERT INTO `layout` VALUES ('375cd75aaa974f779a3efd448b6ef483', b'0', 'default', -1, NULL, '评论列表(移动版)', 'queryCommentList', 1, 450, 4);
INSERT INTO `layout` VALUES ('3ada0d609b9b47388cdadfcbb1b02a6c', b'0', 'default', -1, 'userLoginLogList.html', '用户登录日志列表', 'user/control/userLoginLogList', 0, 310, 1);
INSERT INTO `layout` VALUES ('3e03f55f72804dde9a9874d94f15d7d5', b'0', 'api', -1, 'answerList.html', '我的答案', 'user/control/answerList', 0, 1900, 1);
INSERT INTO `layout` VALUES ('402eabef91f246859d854838997e6eb6', b'0', 'default', -1, NULL, '查询用户是否已经点赞该话题', 'queryAlreadyLiked', 1, 920, 4);
INSERT INTO `layout` VALUES ('417ea9d80bf3488aa312cc1bb8c6a3f9', b'0', 'api', -1, 'topicFavoriteList.html', '话题收藏列表', 'user/control/topicFavoriteList', 0, 700, 1);
INSERT INTO `layout` VALUES ('419e6748fc534966a67ad4e8443dc216', b'0', 'default', -1, NULL, '查询帮助列表(移动端)', 'queryHelpList', 1, 2470, 4);
INSERT INTO `layout` VALUES ('440b1b2f202d4de38f450226083ca174', b'0', 'default', -1, 'home.html', '用户中心页', 'user/control/home', 0, 170, 1);
INSERT INTO `layout` VALUES ('444c325c26504de9913e844f8648ce1e', b'0', 'default', -1, 'followerList.html', '粉丝列表', 'user/control/followerList', 0, 1300, 1);
INSERT INTO `layout` VALUES ('4605cd9bb304408883ecc648ba911e37', b'0', 'default', -1, NULL, '查询关注总数', 'queryFollowCount', 1, 2010, 4);
INSERT INTO `layout` VALUES ('46e93b23a0fe49eebaafe1c8c4705238', b'0', 'api', -1, NULL, '查询答案列表', 'queryAnswerList', 1, 2750, 4);
INSERT INTO `layout` VALUES ('4888f0f582df41c68c7bc98deba72711', b'0', 'api', -1, NULL, '查询修改评论表单', 'user/queryEditComment', 1, 2590, 4);
INSERT INTO `layout` VALUES ('4908dc43828d484d80cc1235b7f1c572', b'0', 'api', -1, 'topicLikeList.html', '话题点赞列表', 'user/control/topicLikeList', 0, 1100, 1);
INSERT INTO `layout` VALUES ('4a9681cc36d54a88be3ca330c28d1675', b'0', 'default', -1, NULL, '查询用户是否已收藏话题', 'queryAlreadyCollected', 1, 720, 4);
INSERT INTO `layout` VALUES ('4c0ff429df524417999b1bdcd2e34549', b'0', 'api', -1, NULL, '查询添加在线留言表单', 'queryAddFeedback', 1, 2860, 4);
INSERT INTO `layout` VALUES ('4dd50167d54b43f48089e1fc433baff7', b'0', 'api', 3, 'more_help.html', '在线帮助\'更多\'', 'more', 0, 60, 1);
INSERT INTO `layout` VALUES ('4ddaf163935e4e3cad6b3901cfb38d19', b'0', 'api', -1, NULL, '修改话题', 'user/editTopic', 1, 2560, 4);
INSERT INTO `layout` VALUES ('4ecf97fde2584bd9a5f495ac447dd091', b'0', 'default', -1, NULL, '服务条款(移动版)', 'termsService', 1, 410, 4);
INSERT INTO `layout` VALUES ('4f6397a608a548be8b09a6b06c788e50', b'0', 'default', -1, NULL, '修改答案(移动版)', 'queryEditAnswer', 1, 2200, 4);
INSERT INTO `layout` VALUES ('4f98b0ca689c4fb495c0a12cafe5a650', b'0', 'default', -1, NULL, '问题列表(移动版)', 'queryQuestionList', 1, 2030, 4);
INSERT INTO `layout` VALUES ('4f99621be57642109a3040138ad3afca', b'0', 'default', -1, NULL, '修改答案回复(移动版)', 'queryEditAnswerReply', 1, 2210, 4);
INSERT INTO `layout` VALUES ('50f0a08d6cf34fa699f549a95aa5bc47', b'0', 'default', -1, 'remindList.html', '提醒列表', 'user/control/remindList', 0, 550, 1);
INSERT INTO `layout` VALUES ('5174250d9377410085e2b66f9e6866f2', b'0', 'api', -1, 'search.html', '话题搜索页', 'search', 0, 30, 1);
INSERT INTO `layout` VALUES ('51c556e4c09a44f8bbf2721b2fde7c55', b'0', 'default', -1, NULL, '话题列表(移动版)', 'queryTopicList', 1, 420, 4);
INSERT INTO `layout` VALUES ('51ff5c4c03634e1f9776916ff28e3f64', b'0', 'api', -1, 'privateMessageChatList.html', '私信对话列表', 'user/control/privateMessageChatList', 0, 400, 1);
INSERT INTO `layout` VALUES ('52432df32db44bd9b37f97bfd68f5dfd', b'0', 'default', -1, 'blank_19.html', '添加举报', 'user/addReport', 0, 2500, 4);
INSERT INTO `layout` VALUES ('53349d99e80c4667883ffffdd9ff9e8e', b'0', 'default', -1, 'blank_12.html', '追加提问', 'user/appendQuestion', 0, 2090, 4);
INSERT INTO `layout` VALUES ('554557f4f99f484eb678ba20fa451073', b'0', 'api', -1, NULL, '查询帮助分类', 'queryHelpTypeList', 1, 2820, 4);
INSERT INTO `layout` VALUES ('55fd045cac664aea8704b7f821f074a2', b'0', 'default', -1, NULL, '发表话题(移动版)', 'queryAddTopic', 1, 460, 4);
INSERT INTO `layout` VALUES ('56ac118fbdc14057923af976ac5b92d0', b'0', 'default', -1, 'topicUnhideList.html', '话题取消隐藏用户列表', 'user/control/topicUnhideList', 0, 800, 1);
INSERT INTO `layout` VALUES ('57557f26652742b4bd2abe84ba24a054', b'0', 'api', -1, 'addPrivateMessage.html', '添加私信', 'user/control/addPrivateMessage', 0, 450, 1);
INSERT INTO `layout` VALUES ('59963311443649299e1d86ae80c8e33c', b'0', 'api', -1, 'answerReplyList.html', '我的答案回复', 'user/control/answerReplyList', 0, 2000, 1);
INSERT INTO `layout` VALUES ('5a4c852fc55f4ad9aade573003ddc546', b'0', 'default', -1, 'message.html', '默认消息页', 'message', 0, 150, 1);
INSERT INTO `layout` VALUES ('5b37a52dc0604914881d767664f39ca2', b'0', 'default', -1, NULL, '查询话题会员收藏总数', 'queryFavoriteCount', 1, 710, 4);
INSERT INTO `layout` VALUES ('5bb7f175bfb848dbb1fc8f1b0094a4f6', b'0', 'api', -1, 'commentList.html', '我的评论', 'user/control/commentList', 0, 180, 1);
INSERT INTO `layout` VALUES ('5bd647d07828441d86ec647466dba3b1', b'0', 'default', -1, 'newPublic_3.html', '页脚', 'newPublic_3', 0, 370, 5);
INSERT INTO `layout` VALUES ('5c7624ced2c845b28741c724594b6b0c', b'0', 'default', -1, 'userDynamicList.html', '用户动态列表', 'user/control/userDynamicList', 0, 900, 1);
INSERT INTO `layout` VALUES ('5d03785446d44a0a9dbcc3966ffb377c', b'0', 'default', -1, 'newPublic_1.html', '分页', 'newPublic_1', 0, 320, 5);
INSERT INTO `layout` VALUES ('5d6067bbc62646f7a22f8095cca01f98', b'0', 'default', -1, NULL, '会员卡(移动版)', 'queryMembershipCard', 1, 1720, 4);
INSERT INTO `layout` VALUES ('6037f3c12d0d4f6ab5657714aeaa4344', b'1', 'api', -1, NULL, '查询AI助手表单', 'queryAiAssistant', 1, 2890, 4);
INSERT INTO `layout` VALUES ('62077b6844e2413d9f5e73d1996c7ee9', b'0', 'default', -1, NULL, '发表答案回复(移动版)', 'queryAddAnswerReply', 1, 2080, 4);
INSERT INTO `layout` VALUES ('65735bf28feb47088a5102ff644a0d77', b'0', 'default', -1, NULL, '查询粉丝总数', 'queryFollowerCount', 1, 1110, 4);
INSERT INTO `layout` VALUES ('66a96e7ee8304694ba86dd75836afdcb', b'0', 'default', -1, NULL, '查询帮助分类(移动端)', 'queryHelpTypeList', 1, 2450, 4);
INSERT INTO `layout` VALUES ('68fabb2c63e942a48c0c8ff7c2dd99c3', b'0', 'api', -1, 'questionFavoriteList.html', '问题收藏列表', 'user/control/questionFavoriteList', 0, 2100, 1);
INSERT INTO `layout` VALUES ('69b1d61a5afa47a0a05760c5ac7ac282', b'0', 'default', -1, NULL, '答案列表(移动版)', 'queryAnswerList', 1, 2050, 4);
INSERT INTO `layout` VALUES ('69ee523bbe154dd5a506e1c0cebf71e8', b'0', 'default', -1, 'findPassWord_step2.html', '找回密码第二步', 'findPassWord/step2', 0, 137, 1);
INSERT INTO `layout` VALUES ('6ab3b63990bd43bd92c16b2373a09c8a', b'0', 'api', -1, NULL, '查询修改答案回复表单', 'user/queryEditAnswerReply', 1, 2780, 4);
INSERT INTO `layout` VALUES ('6b34109ea214408d9a215fab47b47016', b'0', 'api', -1, NULL, '查询帮助导航', 'queryHelpNavigation', 1, 2830, 4);
INSERT INTO `layout` VALUES ('6c6f77c044024be0a56486f0336df56c', b'0', 'default', -1, NULL, '查询是否已经关注该用户', 'queryFollowing', 1, 1120, 4);
INSERT INTO `layout` VALUES ('6c93b3c854804de983ccd807ade0da3c', b'0', 'default', -1, 'questionList.html', '我的问题', 'user/control/questionList', 0, 1800, 1);
INSERT INTO `layout` VALUES ('6f06fcbed64144d4a0a87d68e5e1ac5a', b'0', 'api', -1, NULL, '查询引用评论表单', 'user/queryQuoteComment', 1, 2600, 4);
INSERT INTO `layout` VALUES ('6f1b6d4452b64c5ea3cbffff1dab6b6e', b'0', 'default', -1, NULL, '发表评论(移动版) ', 'queryAddComment', 1, 470, 4);
INSERT INTO `layout` VALUES ('704793a98bc241e7869a5e72c6fa3600', b'0', 'api', -1, 'remindList.html', '提醒列表', 'user/control/remindList', 0, 550, 1);
INSERT INTO `layout` VALUES ('72242bb3ca3a463eae46ed0c07826f4f', b'0', 'default', -1, 'blank_3.html', '评论引用', 'comment_quote', 0, 350, 4);
INSERT INTO `layout` VALUES ('723dcb4988ab4d1eb1114f01c79f4402', b'0', 'api', -1, 'realNameAuthentication.html', '实名认证', 'user/control/realNameAuthentication', 0, 274, 1);
INSERT INTO `layout` VALUES ('725640fa18ce499e8c425689c8bdd134', b'0', 'default', -1, 'likeList.html', '点赞列表', 'user/control/likeList', 0, 1000, 1);
INSERT INTO `layout` VALUES ('730fec12b0e846a1acfa81e9c4c99efc', b'0', 'default', -1, NULL, '发表回复(移动版)', 'queryAddReply', 1, 490, 4);
INSERT INTO `layout` VALUES ('7747c7fa3dd6451783f94d01f1678a0b', b'0', 'default', -1, 'blank_1.html', '话题内容', 'thread', 0, 330, 4);
INSERT INTO `layout` VALUES ('78c4d33956394003927421d221d57dd1', b'0', 'default', -1, 'phoneBinding.html', '绑定手机', 'user/control/phoneBinding', 0, 275, 1);
INSERT INTO `layout` VALUES ('79065de632934072944d1dcfb224ea28', b'0', 'default', -1, NULL, '全部标签(移动版) ', 'allTag', 1, 430, 4);
INSERT INTO `layout` VALUES ('7c4b56d66c0e4b69ba3d8750ebff87f8', b'0', 'api', -1, 'topicUnhideList.html', '话题取消隐藏用户列表', 'user/control/topicUnhideList', 0, 800, 1);
INSERT INTO `layout` VALUES ('7c79820f306143378169167088f17cc2', b'0', 'default', -1, NULL, '查询全部问题标签(json)', 'queryAllQuestionTag', 1, 1780, 4);
INSERT INTO `layout` VALUES ('7f2d29e0c92d43b4844e0c9400b62ebd', b'0', 'default', -1, 'blank_5.html', '会员卡列表', 'membershipCardList', 0, 1310, 4);
INSERT INTO `layout` VALUES ('7f5b0839442446148b5f56f0f2648d45', b'0', 'default', -1, 'followList.html', '关注列表', 'user/control/followList', 0, 1200, 1);
INSERT INTO `layout` VALUES ('7f92073f42c84b67bf89b64b3ba3f5d1', b'0', 'default', -1, 'favoriteList.html', '收藏夹列表', 'user/control/favoriteList', 0, 600, 1);
INSERT INTO `layout` VALUES ('7fa8d0be2433401289eddf315eda75b4', b'0', 'default', -1, 'reportList.html', '举报列表', 'user/control/reportList', 0, 2500, 1);
INSERT INTO `layout` VALUES ('8033f5686cf7445cbb65fb6a0c184657', b'0', 'api', -1, 'reportList.html', '举报列表', 'user/control/reportList', 0, 2500, 1);
INSERT INTO `layout` VALUES ('80b64ce95e2b41848c8dfe13e76f6c0d', b'0', 'api', -1, NULL, '查询关注总数', 'queryFollowCount', 1, 2640, 4);
INSERT INTO `layout` VALUES ('82df735f38f245ccb8160120e717c9ba', b'0', 'default', -1, 'register.html', '注册页', 'register', 0, 130, 1);
INSERT INTO `layout` VALUES ('837ba035b57d4ff19358c0a10710313d', b'0', 'api', -1, 'updatePhoneBinding_step1.html', '更换绑定手机第一步', 'user/control/updatePhoneBinding/step1', 0, 276, 1);
INSERT INTO `layout` VALUES ('843e3bf4f6b645dca42522ee2779d691', b'0', 'default', -1, NULL, '查询用户问题收藏总数', 'queryQuestionFavoriteCount', 1, 2120, 4);
INSERT INTO `layout` VALUES ('85b9fb209cdb437e9f50e849d2c7402b', b'0', 'default', 3, 'more_help.html', '在线帮助\'更多\'', 'more', 0, 60, 1);
INSERT INTO `layout` VALUES ('88f5becc14d34ec6969feaf39a637b69', b'0', 'default', -1, NULL, '引用评论(移动版)', 'queryAddQuote', 1, 480, 4);
INSERT INTO `layout` VALUES ('890eb44b2c2d4b9db90955951a0123a4', b'0', 'api', -1, NULL, '查询修改答案表单', 'user/queryEditAnswer', 1, 2770, 4);
INSERT INTO `layout` VALUES ('894c1ee85cb34067a0f2c82364178a66', b'0', 'default', -1, 'blank_11.html', '答案回复', 'answer_reply', 0, 1790, 4);
INSERT INTO `layout` VALUES ('8b5dd591aa3548e78fd8688230f8cd76', b'0', 'default', -1, 'topicList.html', '我的话题', 'user/control/topicList', 0, 180, 1);
INSERT INTO `layout` VALUES ('8ba23e3d267c427da37de1b8b037edff', b'0', 'default', -1, 'findPassWord_step1.html', '找回密码第一步', 'findPassWord/step1', 0, 136, 1);
INSERT INTO `layout` VALUES ('8bf2670aafb9429a92a2dab3c1f08d60', b'0', 'default', -1, 'blank_6.html', '会员卡', 'membershipCard', 0, 1320, 4);
INSERT INTO `layout` VALUES ('8c25652471eb476b8f293f7bb20632ca', b'0', 'api', -1, NULL, '查询友情链接', 'queryLink', 1, 2500, 4);
INSERT INTO `layout` VALUES ('8fea6a5b0d4148cea24ed8c648c26107', b'0', 'default', -1, 'realNameAuthentication.html', '实名认证', 'user/control/realNameAuthentication', 0, 274, 1);
INSERT INTO `layout` VALUES ('90e9a5ef12b843adb3d282332fbd27df', b'0', 'default', -1, 'newPublic_2.html', '页头', 'newPublic_2', 0, 360, 5);
INSERT INTO `layout` VALUES ('917e2578460641838e8b93355744b748', b'0', 'api', -1, 'likeList.html', '点赞列表', 'user/control/likeList', 0, 1000, 1);
INSERT INTO `layout` VALUES ('91fcfa258f41472096f57db6308856cf', b'0', 'default', -1, NULL, '查询话题点赞总数', 'queryLikeCount', 1, 910, 4);
INSERT INTO `layout` VALUES ('9283ad4a07a343828c145200f1fd272c', b'0', 'api', -1, NULL, '查询粉丝总数', 'queryFollowerCount', 1, 2420, 4);
INSERT INTO `layout` VALUES ('96ada50db91c4afbb6c1074300939b22', b'0', 'default', -1, 'blank_18.html', '帮助内容', 'helpDetail', 0, 2440, 4);
INSERT INTO `layout` VALUES ('9954217a647445648bf46666c826bed4', b'0', 'api', -1, NULL, '查询添加评论表单', 'queryAddComment', 1, 2580, 4);
INSERT INTO `layout` VALUES ('9a4c7ba616db4c1489a5ab3b3587ed12', b'0', 'api', -1, NULL, '查询添加答案表单', 'user/queryAddAnswer', 1, 2740, 4);
INSERT INTO `layout` VALUES ('9b78793395bd415fa6349d889226089c', b'0', 'api', -1, NULL, '查询是否已经关注该用户', 'queryFollowing', 1, 2430, 4);
INSERT INTO `layout` VALUES ('9e9cafbe93314ca585aedbe98f3b4e11', b'0', 'default', -1, 'blank_10.html', '发表问题', 'user/addQuestion', 0, 1770, 4);
INSERT INTO `layout` VALUES ('9fdd67aa7e3d4dd7aabbe1ab0fd324e5', b'0', 'default', -1, 'answerReplyList.html', '我的答案回复', 'user/control/answerReplyList', 0, 2000, 1);
INSERT INTO `layout` VALUES ('a14b8228d72b4c72b306111be88fc1bb', b'0', 'default', -1, 'membershipCardOrderList.html', '会员卡订单列表', 'user/control/membershipCardOrderList', 0, 1700, 1);
INSERT INTO `layout` VALUES ('a4a0399a222f48039c84acd45e4df52f', b'0', 'default', -1, 'addPrivateMessage.html', '添加私信', 'user/control/addPrivateMessage', 0, 450, 1);
INSERT INTO `layout` VALUES ('a4fe0c6f3c2a4b1eb776065c702781b3', b'0', 'api', -1, NULL, '全部标签', 'allTag', 1, 2480, 4);
INSERT INTO `layout` VALUES ('a70dcb211a154bbba81697508113668b', b'0', 'default', -1, NULL, '话题内容(移动版)', 'queryTopicContent', 1, 440, 4);
INSERT INTO `layout` VALUES ('a808d04033b74c288cd7e5226d222176', b'0', 'default', -1, NULL, '查询第三方登录', 'queryThirdPartyLogin', 1, 2170, 4);
INSERT INTO `layout` VALUES ('a86967d780014f3d850efcf9d5b0fcba', b'0', 'default', -1, 'blank_16.html', '修改答案回复', 'user/editAnswerReply', 0, 2190, 4);
INSERT INTO `layout` VALUES ('a8e08924952e4501ae1c19766487bfb3', b'0', 'api', -1, NULL, '查询添加答案回复表单', 'user/queryAddAnswerReply', 1, 2760, 4);
INSERT INTO `layout` VALUES ('a920fd623ff74d7b97f25378c3567f0c', b'0', 'api', -1, NULL, '查询话题会员收藏总数', 'queryFavoriteCount', 1, 2520, 4);
INSERT INTO `layout` VALUES ('abb3fc5ca2354ea287fd87d816c2d0bb', b'0', 'default', -1, 'commentList.html', '我的评论', 'user/control/commentList', 0, 180, 1);
INSERT INTO `layout` VALUES ('aca9f3a710f14f61934c49c257d35002', b'0', 'api', -1, NULL, '查询帮助', 'queryHelp', 1, 2850, 4);
INSERT INTO `layout` VALUES ('acbffd6b80804f58a3457edf57b5ee1d', b'0', 'default', -1, 'privateMessageChatList.html', '私信对话列表', 'user/control/privateMessageChatList', 0, 400, 1);
INSERT INTO `layout` VALUES ('ae570158ef4848a3acffe14b870eda86', b'0', 'default', -1, 'redEnvelopeAmountDistributionList.html', '发红包金额分配列表', 'user/control/redEnvelopeAmountDistributionList', 0, 2300, 1);
INSERT INTO `layout` VALUES ('afd68d68b7e4405ca555fa1fafb3681e', b'0', 'api', -1, NULL, '查询话题内容', 'thread', 1, 2450, 4);
INSERT INTO `layout` VALUES ('b017258bf1b244ed8a86d24eda1ad3bf', b'0', 'api', -1, NULL, '查询问题用户收藏总数', 'queryQuestionFavoriteCount', 1, 2730, 4);
INSERT INTO `layout` VALUES ('b16e8eee7474475cbc0fc9b81e2ea603', b'0', 'default', -1, 'giveRedEnvelopeList.html', '发红包列表', 'user/control/giveRedEnvelopeList', 0, 2200, 1);
INSERT INTO `layout` VALUES ('b2fbec2d094d41e49e7d1111c120098c', b'0', 'default', -1, 'replyList.html', '我的回复', 'user/control/replyList', 0, 180, 1);
INSERT INTO `layout` VALUES ('b3211fc921684203a0b5e5960e140274', b'0', 'api', -1, NULL, '查询相似问题', 'queryLikeQuestion', 1, 2790, 4);
INSERT INTO `layout` VALUES ('b35b9b31d4584b65a1109203b6119476', b'0', 'default', -1, NULL, '修改评论回复(移动版)', 'queryEditCommentReply', 1, 2160, 4);
INSERT INTO `layout` VALUES ('b3ce59d4049a4a609a70480681b3d119', b'0', 'api', -1, NULL, '查询话题修改回复表单', 'user/queryEditReply', 1, 2620, 4);
INSERT INTO `layout` VALUES ('b5b0e4b3c19145b497bc7cb529bf2519', b'0', 'default', -1, 'privateMessageList.html', '私信列表', 'user/control/privateMessageList', 0, 350, 1);
INSERT INTO `layout` VALUES ('b7fb6d10945342d9be7366f0fe79426d', b'0', 'api', -1, 'receiveRedEnvelopeList.html', '收红包列表', 'user/control/receiveRedEnvelopeList', 0, 2400, 1);
INSERT INTO `layout` VALUES ('b8aea98e976b45b0933c2e6c79e1b5aa', b'0', 'api', -1, 'point.html', '积分', 'user/control/point', 0, 220, 1);
INSERT INTO `layout` VALUES ('b9070f6f929c4a7999d5c8aa2ac29b45', b'0', 'api', -1, 'editUser.html', '修改会员', 'user/control/editUser', 0, 270, 1);
INSERT INTO `layout` VALUES ('b9cb01a67efc459b8ef3ba5c88e5ab6e', b'0', 'api', -1, 'membershipCardOrderList.html', '会员卡订单列表', 'user/control/membershipCardOrderList', 0, 1700, 1);
INSERT INTO `layout` VALUES ('b9d3684fd5004247b4820ca5b9a5bff3', b'0', 'default', -1, NULL, '查询回答总数', 'queryAnswerCount', 1, 2020, 4);
INSERT INTO `layout` VALUES ('ba307b042784455aa64cf886d0fce20e', b'0', 'api', -1, NULL, '查询会员卡列表', 'queryMembershipCardList', 1, 2800, 4);
INSERT INTO `layout` VALUES ('ba85aac8b3924ea980ad39087d0a722f', b'0', 'default', -1, 'systemNotifyList.html', '系统通知列表', 'user/control/systemNotifyList', 0, 500, 1);
INSERT INTO `layout` VALUES ('babfe2e086b34463933149b07932e265', b'0', 'api', -1, NULL, '查询问题内容', 'question', 1, 2460, 4);
INSERT INTO `layout` VALUES ('baecca44ee9b4b3bb6f6cada63b70389', b'0', 'api', -1, NULL, '查询话题点赞总数', 'queryLikeCount', 1, 2540, 4);
INSERT INTO `layout` VALUES ('bc920d0af10443828316bbc8bcb2b4c3', b'0', 'default', -1, 'payment.html', '付款页面', 'user/control/payment', 0, 1500, 1);
INSERT INTO `layout` VALUES ('bfb54b63a24c4c9c91775991d0f53dcc', b'0', 'api', -1, NULL, '查询相似话题', 'queryLikeTopic', 1, 2670, 4);
INSERT INTO `layout` VALUES ('bfe17faef78d4971b14e598541ba3414', b'0', 'api', -1, 'login.html', '登录页', 'login', 0, 160, 1);
INSERT INTO `layout` VALUES ('c22f985f3d0a436ba0b5c6479a121f5b', b'0', 'api', -1, NULL, '查询用户是否已收藏该话题', 'queryAlreadyCollected', 1, 2530, 4);
INSERT INTO `layout` VALUES ('c53be46778cb48eb8971a18a4ee2680f', b'0', 'api', -1, 'favoriteList.html', '收藏夹列表', 'user/control/favoriteList', 0, 600, 1);
INSERT INTO `layout` VALUES ('c5d387ee29764c2a829278a17c629e17', b'0', 'api', -1, NULL, '查询领取红包用户', 'queryReceiveRedEnvelopeUser', 1, 2660, 4);
INSERT INTO `layout` VALUES ('c677cbc3806e4cd191523eb758c538b0', b'0', 'api', -1, NULL, '查询举报表单', 'user/queryAddReport', 1, 2870, 4);
INSERT INTO `layout` VALUES ('c686755a48ca4ca191d7380545a9f56a', b'0', 'api', -1, 'findPassWord_step2.html', '找回密码第二步', 'findPassWord/step2', 0, 137, 1);
INSERT INTO `layout` VALUES ('c7b55917354243199f3c354532957590', b'0', 'default', -1, 'receiveRedEnvelopeList.html', '收红包列表', 'user/control/receiveRedEnvelopeList', 0, 2400, 1);
INSERT INTO `layout` VALUES ('c8ad33d6f9a24809ae348ce44de1b4c1', b'0', 'default', -1, NULL, '查询帮助导航(移动端)', 'queryHelpNavigation', 1, 2480, 4);
INSERT INTO `layout` VALUES ('c9a85b0657264a5aac06cf7e6555d5ff', b'0', 'api', -1, 'topicList.html', '我的话题', 'user/control/topicList', 0, 180, 1);
INSERT INTO `layout` VALUES ('cef07a74185940109969afa9f3899899', b'0', 'api', -1, 'message.html', '默认消息页', 'message', 0, 150, 1);
INSERT INTO `layout` VALUES ('d07b94ad410e43fdab473029f44c67c8', b'0', 'api', -1, NULL, '查询热门话题', 'queryHotTopic', 1, 2880, 4);
INSERT INTO `layout` VALUES ('d40efbb845cc446ea520eec7e732cf4f', b'0', 'default', -1, 'questionFavoriteList.html', '问题收藏列表', 'user/control/questionFavoriteList', 0, 2100, 1);
INSERT INTO `layout` VALUES ('d548ee0e9d84456c8f616671022d043b', b'0', 'default', -1, NULL, '查询会员卡列表(移动版)', 'queryMembershipCardList', 1, 1710, 4);
INSERT INTO `layout` VALUES ('d5bad6d68fc24cafbbe2b8920c9d289c', b'0', 'api', -1, 'questionList.html', '我的问题', 'user/control/questionList', 0, 1800, 1);
INSERT INTO `layout` VALUES ('d627809654484be288ae30b32457a2d6', b'0', 'default', -1, NULL, '查询领取红包用户列表', 'queryReceiveRedEnvelopeUser', 1, 2410, 4);
INSERT INTO `layout` VALUES ('d734da046f784ff2a80dc79515b93646', b'0', 'default', -1, NULL, '发表答案(移动版)', 'queryAddAnswer', 1, 2070, 4);
INSERT INTO `layout` VALUES ('d738e25ac96e4e74812cdf63a639352e', b'0', 'api', -1, NULL, '查询发红包内容', 'queryGiveRedEnvelopeContent', 1, 2650, 4);
INSERT INTO `layout` VALUES ('d7e5fcb22e1b463cb2616616e42d3b63', b'0', 'default', -1, 'blank_9.html', '问题内容', 'question', 0, 1760, 4);
INSERT INTO `layout` VALUES ('d8a30fd190ad4fd1a89a5d8f9c7df573', b'0', 'api', -1, NULL, '查询追加问题表单', 'user/queryAppendQuestion', 1, 2710, 4);
INSERT INTO `layout` VALUES ('d9bc3f88bc184f6a98a8bf2d7429653e', b'0', 'default', -1, 'jump.html', '默认跳转页', 'jump', 0, 140, 1);
INSERT INTO `layout` VALUES ('dbda9575f6e0415fa1bfee47f3301293', b'0', 'api', -1, 'phoneBinding.html', '绑定手机', 'user/control/phoneBinding', 0, 275, 1);
INSERT INTO `layout` VALUES ('dc8425d53c864352b24969d889177321', b'0', 'default', -1, 'blank_13.html', '修改评论', 'user/editComment', 0, 2130, 4);
INSERT INTO `layout` VALUES ('de0e6f72232547798f687a5ac54092d4', b'0', 'api', -1, 'agreement.html', '用户协议', 'agreement', 0, 135, 1);
INSERT INTO `layout` VALUES ('e165692880c2439ea24164a545477616', b'0', 'default', -1, 'paymentCompleted.html', '付款完成页面', 'paymentCompleted', 0, 1600, 1);
INSERT INTO `layout` VALUES ('e3f72ab4c65745a8a2a4bdd8ffa65a04', b'0', 'default', -1, NULL, '修改评论(移动版)', 'queryEditComment', 1, 2150, 4);
INSERT INTO `layout` VALUES ('e447aa94ad9e47e4be5d58482d75dc23', b'0', 'default', -1, 'blank_2.html', '评论回复', 'comment_reply', 0, 340, 4);
INSERT INTO `layout` VALUES ('e55ba5ae4efe4ba4b55857d00cfaab0d', b'0', 'default', -1, 'search.html', '话题搜索页', 'search', 0, 30, 1);
INSERT INTO `layout` VALUES ('e6da1f7084864f91992a61f32fbaafc0', b'0', 'default', -1, NULL, '查询发红包(移动端)', 'queryGiveRedEnvelope', 1, 2420, 4);
INSERT INTO `layout` VALUES ('e8126fd3b06645b1963d0dc7a6f96e65', b'0', 'api', -1, NULL, '查询添加话题表单', 'user/queryAddTopic', 1, 2510, 4);
INSERT INTO `layout` VALUES ('e906542026964981b8251aac0894c494', b'0', 'default', -1, 'blank_4.html', '在线留言', 'feedback', 0, 500, 4);
INSERT INTO `layout` VALUES ('ea282240f21c46688de3e70a6a9e1925', b'0', 'api', -1, NULL, '查询回答总数', 'queryAnswerCount', 1, 2630, 4);
INSERT INTO `layout` VALUES ('eb22678d375740a78e11c5cbcb24be0d', b'0', 'api', -1, NULL, '话题列表', 'queryTopicList', 1, 2490, 4);
INSERT INTO `layout` VALUES ('eccf8e7e476c4714845687037d6daf96', b'0', 'default', -1, NULL, '查询用户是否已收藏问题', 'queryAlreadyFavoriteQuestion', 1, 2110, 4);
INSERT INTO `layout` VALUES ('eee858f7902c49e5b7adf4e23fc41960', b'0', 'default', -1, NULL, '追加提问(移动版)', 'queryAppendQuestion', 1, 2100, 4);
INSERT INTO `layout` VALUES ('f119cd0e918742838000f096ec42358d', b'0', 'api', -1, NULL, '第三方登录', 'queryThirdPartyLogin', 1, 2440, 4);
INSERT INTO `layout` VALUES ('f1e60813417c4c12840613da6b01726c', b'0', 'api', -1, NULL, '查询用户是否已经点赞该话题', 'queryAlreadyLiked', 1, 2550, 4);
INSERT INTO `layout` VALUES ('f24e26d8f5fb4f408f32fdff4089d083', b'0', 'default', -1, 'answerList.html', '我的答案', 'user/control/answerList', 0, 1900, 1);
INSERT INTO `layout` VALUES ('f7676ca40900427e821f2999185d1ca0', b'0', 'api', -1, NULL, '问题列表', 'queryQuestionList', 1, 2690, 4);
INSERT INTO `layout` VALUES ('f7db737de89b410d8416f271247a3cad', b'0', 'api', -1, NULL, '查询提问题表单', 'user/queryAddQuestion', 1, 2700, 4);
INSERT INTO `layout` VALUES ('f7efe75775064ae496f9008e220ec3f5', b'0', 'api', -1, 'redEnvelopeAmountDistributionList.html', '发红包金额分配列表', 'user/control/redEnvelopeAmountDistributionList', 0, 2300, 1);
INSERT INTO `layout` VALUES ('fad5de351ed7453d95f53e5b5efdf0dc', b'0', 'api', -1, 'jump.html', '默认跳转页', 'jump', 0, 140, 1);
INSERT INTO `layout` VALUES ('fb7526585c4d4ffa9e19a5bbfcadd730', b'0', 'api', -1, NULL, '查询话题添加回复表单', 'user/queryAddReply', 1, 2610, 4);
INSERT INTO `layout` VALUES ('fbbbf2ec6fbe43f79b489b8cce26f2a6', b'0', 'api', -1, NULL, '评论列表', 'queryCommentList', 1, 2570, 4);
INSERT INTO `layout` VALUES ('fc0b41f454dd4a10916be238d295a0b9', b'0', 'default', -1, 'editUser.html', '修改会员', 'user/control/editUser', 0, 270, 1);
INSERT INTO `layout` VALUES ('fd72dab269d94795ac112b59364017ed', b'0', 'api', -1, NULL, '服务条款', 'queryTermsService', 1, 2470, 4);
INSERT INTO `layout` VALUES ('ffbc4af71a024cbd861e5dd621bf45a1', b'0', 'default', -1, 'topicLikeList.html', '话题点赞列表', 'user/control/topicLikeList', 0, 1100, 1);
INSERT INTO `layout` VALUES ('ffd38d63c405486f800d29cc43f804db', b'0', 'api', -1, 'followList.html', '关注列表', 'user/control/followList', 0, 1200, 1);

-- ----------------------------
-- Table structure for like_0
-- ----------------------------
DROP TABLE IF EXISTS `like_0`;
CREATE TABLE `like_0`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `answerId` bigint NULL DEFAULT NULL,
  `answerReplyId` bigint NULL DEFAULT NULL,
  `commentId` bigint NULL DEFAULT NULL,
  `commentReplyId` bigint NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `like_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of like_0
-- ----------------------------

-- ----------------------------
-- Table structure for like_1
-- ----------------------------
DROP TABLE IF EXISTS `like_1`;
CREATE TABLE `like_1`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `answerId` bigint NULL DEFAULT NULL,
  `answerReplyId` bigint NULL DEFAULT NULL,
  `commentId` bigint NULL DEFAULT NULL,
  `commentReplyId` bigint NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `like_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of like_1
-- ----------------------------

-- ----------------------------
-- Table structure for like_2
-- ----------------------------
DROP TABLE IF EXISTS `like_2`;
CREATE TABLE `like_2`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `answerId` bigint NULL DEFAULT NULL,
  `answerReplyId` bigint NULL DEFAULT NULL,
  `commentId` bigint NULL DEFAULT NULL,
  `commentReplyId` bigint NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `like_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of like_2
-- ----------------------------

-- ----------------------------
-- Table structure for like_3
-- ----------------------------
DROP TABLE IF EXISTS `like_3`;
CREATE TABLE `like_3`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `answerId` bigint NULL DEFAULT NULL,
  `answerReplyId` bigint NULL DEFAULT NULL,
  `commentId` bigint NULL DEFAULT NULL,
  `commentReplyId` bigint NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `like_1_idx`(`userName` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of like_3
-- ----------------------------

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `createDate` datetime(6) NULL DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `website` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of links
-- ----------------------------

-- ----------------------------
-- Table structure for mediaprocessqueue
-- ----------------------------
DROP TABLE IF EXISTS `mediaprocessqueue`;
CREATE TABLE `mediaprocessqueue`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `errorInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `fileName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `parameter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `processProgress` double NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mediaProcessQueue_1_idx`(`processProgress` ASC) USING BTREE,
  INDEX `mediaProcessQueue_2_idx`(`fileName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mediaprocessqueue
-- ----------------------------

-- ----------------------------
-- Table structure for mediaprocesssetting
-- ----------------------------
DROP TABLE IF EXISTS `mediaprocesssetting`;
CREATE TABLE `mediaprocesssetting`  (
  `id` int NOT NULL,
  `remoteSegmentSecret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `segmentLocation` int NULL DEFAULT NULL,
  `segmentTime` int NULL DEFAULT NULL,
  `version` bigint NULL DEFAULT NULL,
  `videoFrameRate` int NULL DEFAULT NULL,
  `watermark` bit(1) NULL DEFAULT NULL,
  `watermarkDistance_x` int NULL DEFAULT NULL,
  `watermarkDistance_y` int NULL DEFAULT NULL,
  `watermarkFullPathName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `watermarkPosition` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mediaprocesssetting
-- ----------------------------

-- ----------------------------
-- Table structure for membershipcard
-- ----------------------------
DROP TABLE IF EXISTS `membershipcard`;
CREATE TABLE `membershipcard`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime(6) NULL DEFAULT NULL,
  `descriptionTagFormat` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `highestPoint` bigint NULL DEFAULT NULL,
  `highestPrice` decimal(12, 2) NULL DEFAULT NULL,
  `introduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `lowestPoint` bigint NULL DEFAULT NULL,
  `lowestPrice` decimal(12, 2) NULL DEFAULT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `subtitle` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userRoleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `membershipCard_1_idx`(`createDate` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of membershipcard
-- ----------------------------

-- ----------------------------
-- Table structure for membershipcardgiftitem_0
-- ----------------------------
DROP TABLE IF EXISTS `membershipcardgiftitem_0`;
CREATE TABLE `membershipcardgiftitem_0`  (
  `id` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `duration` int NULL DEFAULT NULL,
  `membershipCardGiftTaskId` bigint NULL DEFAULT NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `restriction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `type` int NULL DEFAULT NULL,
  `unit` int NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `membershipCardGiftItem_idx`(`membershipCardGiftTaskId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of membershipcardgiftitem_0
-- ----------------------------

-- ----------------------------
-- Table structure for membershipcardgiftitem_1
-- ----------------------------
DROP TABLE IF EXISTS `membershipcardgiftitem_1`;
CREATE TABLE `membershipcardgiftitem_1`  (
  `id` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `duration` int NULL DEFAULT NULL,
  `membershipCardGiftTaskId` bigint NULL DEFAULT NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `restriction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `type` int NULL DEFAULT NULL,
  `unit` int NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `membershipCardGiftItem_idx`(`membershipCardGiftTaskId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of membershipcardgiftitem_1
-- ----------------------------

-- ----------------------------
-- Table structure for membershipcardgiftitem_2
-- ----------------------------
DROP TABLE IF EXISTS `membershipcardgiftitem_2`;
CREATE TABLE `membershipcardgiftitem_2`  (
  `id` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `duration` int NULL DEFAULT NULL,
  `membershipCardGiftTaskId` bigint NULL DEFAULT NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `restriction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `type` int NULL DEFAULT NULL,
  `unit` int NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `membershipCardGiftItem_idx`(`membershipCardGiftTaskId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of membershipcardgiftitem_2
-- ----------------------------

-- ----------------------------
-- Table structure for membershipcardgiftitem_3
-- ----------------------------
DROP TABLE IF EXISTS `membershipcardgiftitem_3`;
CREATE TABLE `membershipcardgiftitem_3`  (
  `id` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `duration` int NULL DEFAULT NULL,
  `membershipCardGiftTaskId` bigint NULL DEFAULT NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `restriction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `type` int NULL DEFAULT NULL,
  `unit` int NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `membershipCardGiftItem_idx`(`membershipCardGiftTaskId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of membershipcardgiftitem_3
-- ----------------------------

-- ----------------------------
-- Table structure for membershipcardgifttask
-- ----------------------------
DROP TABLE IF EXISTS `membershipcardgifttask`;
CREATE TABLE `membershipcardgifttask`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime(6) NULL DEFAULT NULL,
  `duration` int NULL DEFAULT NULL,
  `enable` bit(1) NULL DEFAULT NULL,
  `expirationDate_end` datetime(6) NULL DEFAULT NULL,
  `expirationDate_start` datetime(6) NULL DEFAULT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `restriction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `type` int NULL DEFAULT NULL,
  `unit` int NULL DEFAULT NULL,
  `userRoleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userRoleName` varchar(192) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `membershipCardGiftTask_1_idx`(`expirationDate_start` ASC, `expirationDate_end` ASC, `type` ASC, `enable` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of membershipcardgifttask
-- ----------------------------

-- ----------------------------
-- Table structure for membershipcardorder
-- ----------------------------
DROP TABLE IF EXISTS `membershipcardorder`;
CREATE TABLE `membershipcardorder`  (
  `orderId` bigint NOT NULL,
  `accountPayable` decimal(12, 2) NOT NULL,
  `accountPoint` bigint NULL DEFAULT NULL,
  `createDate` datetime(6) NULL DEFAULT NULL,
  `duration` int NULL DEFAULT NULL,
  `membershipCardId` bigint NULL DEFAULT NULL,
  `paymentAmount` decimal(12, 2) NOT NULL,
  `paymentPoint` bigint NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `roleName` varchar(192) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `specificationId` bigint NULL DEFAULT NULL,
  `specificationName` varchar(192) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `unit` int NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userRoleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  PRIMARY KEY (`orderId`) USING BTREE,
  INDEX `membershipCardOrder_1_idx`(`userName` ASC, `createDate` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of membershipcardorder
-- ----------------------------

-- ----------------------------
-- Table structure for onlinepaymentinterface
-- ----------------------------
DROP TABLE IF EXISTS `onlinepaymentinterface`;
CREATE TABLE `onlinepaymentinterface`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `dynamicParameter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `enable` bit(1) NOT NULL,
  `interfaceProduct` int NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `supportEquipment` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of onlinepaymentinterface
-- ----------------------------

-- ----------------------------
-- Table structure for paymentlog_0
-- ----------------------------
DROP TABLE IF EXISTS `paymentlog_0`;
CREATE TABLE `paymentlog_0`  (
  `paymentRunningNumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(14, 4) NOT NULL,
  `amountState` int NOT NULL,
  `interfaceProduct` int NULL DEFAULT NULL,
  `operationUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operationUserType` int NULL DEFAULT NULL,
  `paymentModule` int NULL DEFAULT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sourceParameterId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `times` datetime(6) NULL DEFAULT NULL,
  `tradeNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`paymentRunningNumber`) USING BTREE,
  INDEX `paymentlog_idx`(`userName` ASC, `times` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paymentlog_0
-- ----------------------------

-- ----------------------------
-- Table structure for paymentlog_1
-- ----------------------------
DROP TABLE IF EXISTS `paymentlog_1`;
CREATE TABLE `paymentlog_1`  (
  `paymentRunningNumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(14, 4) NOT NULL,
  `amountState` int NOT NULL,
  `interfaceProduct` int NULL DEFAULT NULL,
  `operationUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operationUserType` int NULL DEFAULT NULL,
  `paymentModule` int NULL DEFAULT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sourceParameterId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `times` datetime(6) NULL DEFAULT NULL,
  `tradeNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`paymentRunningNumber`) USING BTREE,
  INDEX `paymentlog_idx`(`userName` ASC, `times` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paymentlog_1
-- ----------------------------

-- ----------------------------
-- Table structure for paymentlog_2
-- ----------------------------
DROP TABLE IF EXISTS `paymentlog_2`;
CREATE TABLE `paymentlog_2`  (
  `paymentRunningNumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(14, 4) NOT NULL,
  `amountState` int NOT NULL,
  `interfaceProduct` int NULL DEFAULT NULL,
  `operationUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operationUserType` int NULL DEFAULT NULL,
  `paymentModule` int NULL DEFAULT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sourceParameterId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `times` datetime(6) NULL DEFAULT NULL,
  `tradeNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`paymentRunningNumber`) USING BTREE,
  INDEX `paymentlog_idx`(`userName` ASC, `times` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paymentlog_2
-- ----------------------------

-- ----------------------------
-- Table structure for paymentlog_3
-- ----------------------------
DROP TABLE IF EXISTS `paymentlog_3`;
CREATE TABLE `paymentlog_3`  (
  `paymentRunningNumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(14, 4) NOT NULL,
  `amountState` int NOT NULL,
  `interfaceProduct` int NULL DEFAULT NULL,
  `operationUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operationUserType` int NULL DEFAULT NULL,
  `paymentModule` int NULL DEFAULT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sourceParameterId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `times` datetime(6) NULL DEFAULT NULL,
  `tradeNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`paymentRunningNumber`) USING BTREE,
  INDEX `paymentlog_idx`(`userName` ASC, `times` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paymentlog_3
-- ----------------------------

-- ----------------------------
-- Table structure for paymentverificationlog
-- ----------------------------
DROP TABLE IF EXISTS `paymentverificationlog`;
CREATE TABLE `paymentverificationlog`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parameterId` bigint NULL DEFAULT NULL,
  `paymentAmount` decimal(12, 2) NOT NULL,
  `paymentModule` int NULL DEFAULT NULL,
  `times` datetime(6) NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userName_idx`(`parameterId` ASC, `userName` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paymentverificationlog
-- ----------------------------

-- ----------------------------
-- Table structure for pointlog_0
-- ----------------------------
DROP TABLE IF EXISTS `pointlog_0`;
CREATE TABLE `pointlog_0`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `module` int NULL DEFAULT NULL,
  `operationUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operationUserType` int NULL DEFAULT NULL,
  `parameterId` bigint NULL DEFAULT NULL,
  `point` bigint NULL DEFAULT NULL,
  `pointState` int NOT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `times` datetime(6) NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pointlog_idx`(`userName` ASC, `times` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pointlog_0
-- ----------------------------

-- ----------------------------
-- Table structure for pointlog_1
-- ----------------------------
DROP TABLE IF EXISTS `pointlog_1`;
CREATE TABLE `pointlog_1`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `module` int NULL DEFAULT NULL,
  `operationUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operationUserType` int NULL DEFAULT NULL,
  `parameterId` bigint NULL DEFAULT NULL,
  `point` bigint NULL DEFAULT NULL,
  `pointState` int NOT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `times` datetime(6) NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pointlog_idx`(`userName` ASC, `times` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pointlog_1
-- ----------------------------
INSERT INTO `pointlog_1` VALUES ('1e2f97cb4bc54674bac58a4cf70fa45b0001', 200, 'u5RmNvNUs5WHrgl9h6S', 2, 1, 5, 1, '', '2025-10-13 18:29:09.855000', 'u5RmNvNUs5WHrgl9h6S');
INSERT INTO `pointlog_1` VALUES ('5659bae8280941009827d47e235c17dc0001', 100, 'u5RmNvNUs5WHrgl9h6S', 2, 1, 10, 1, '', '2025-10-13 18:28:59.587000', 'u5RmNvNUs5WHrgl9h6S');
INSERT INTO `pointlog_1` VALUES ('ddc964b141344cc1bc7984d927c7615e0001', 300, 'u5RmNvNUs5WHrgl9h6S', 2, 1, 5, 1, '', '2025-10-13 18:29:17.976000', 'u5RmNvNUs5WHrgl9h6S');

-- ----------------------------
-- Table structure for pointlog_2
-- ----------------------------
DROP TABLE IF EXISTS `pointlog_2`;
CREATE TABLE `pointlog_2`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `module` int NULL DEFAULT NULL,
  `operationUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operationUserType` int NULL DEFAULT NULL,
  `parameterId` bigint NULL DEFAULT NULL,
  `point` bigint NULL DEFAULT NULL,
  `pointState` int NOT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `times` datetime(6) NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pointlog_idx`(`userName` ASC, `times` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pointlog_2
-- ----------------------------

-- ----------------------------
-- Table structure for pointlog_3
-- ----------------------------
DROP TABLE IF EXISTS `pointlog_3`;
CREATE TABLE `pointlog_3`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `module` int NULL DEFAULT NULL,
  `operationUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operationUserType` int NULL DEFAULT NULL,
  `parameterId` bigint NULL DEFAULT NULL,
  `point` bigint NULL DEFAULT NULL,
  `pointState` int NOT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `times` datetime(6) NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pointlog_idx`(`userName` ASC, `times` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pointlog_3
-- ----------------------------

-- ----------------------------
-- Table structure for privatemessage_0
-- ----------------------------
DROP TABLE IF EXISTS `privatemessage_0`;
CREATE TABLE `privatemessage_0`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `friendUserId` bigint NULL DEFAULT NULL,
  `messageContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `readTimeFormat` bigint NULL DEFAULT NULL,
  `receiverUserId` bigint NULL DEFAULT NULL,
  `sendTimeFormat` bigint NULL DEFAULT NULL,
  `senderUserId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `privateMessage_1_idx`(`userId` ASC, `status` ASC, `sendTimeFormat` ASC) USING BTREE,
  INDEX `privateMessage_2_idx`(`userId` ASC, `friendUserId` ASC, `status` ASC, `sendTimeFormat` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of privatemessage_0
-- ----------------------------

-- ----------------------------
-- Table structure for privatemessage_1
-- ----------------------------
DROP TABLE IF EXISTS `privatemessage_1`;
CREATE TABLE `privatemessage_1`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `friendUserId` bigint NULL DEFAULT NULL,
  `messageContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `readTimeFormat` bigint NULL DEFAULT NULL,
  `receiverUserId` bigint NULL DEFAULT NULL,
  `sendTimeFormat` bigint NULL DEFAULT NULL,
  `senderUserId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `privateMessage_1_idx`(`userId` ASC, `status` ASC, `sendTimeFormat` ASC) USING BTREE,
  INDEX `privateMessage_2_idx`(`userId` ASC, `friendUserId` ASC, `status` ASC, `sendTimeFormat` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of privatemessage_1
-- ----------------------------

-- ----------------------------
-- Table structure for privatemessage_2
-- ----------------------------
DROP TABLE IF EXISTS `privatemessage_2`;
CREATE TABLE `privatemessage_2`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `friendUserId` bigint NULL DEFAULT NULL,
  `messageContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `readTimeFormat` bigint NULL DEFAULT NULL,
  `receiverUserId` bigint NULL DEFAULT NULL,
  `sendTimeFormat` bigint NULL DEFAULT NULL,
  `senderUserId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `privateMessage_1_idx`(`userId` ASC, `status` ASC, `sendTimeFormat` ASC) USING BTREE,
  INDEX `privateMessage_2_idx`(`userId` ASC, `friendUserId` ASC, `status` ASC, `sendTimeFormat` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of privatemessage_2
-- ----------------------------

-- ----------------------------
-- Table structure for privatemessage_3
-- ----------------------------
DROP TABLE IF EXISTS `privatemessage_3`;
CREATE TABLE `privatemessage_3`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `friendUserId` bigint NULL DEFAULT NULL,
  `messageContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `readTimeFormat` bigint NULL DEFAULT NULL,
  `receiverUserId` bigint NULL DEFAULT NULL,
  `sendTimeFormat` bigint NULL DEFAULT NULL,
  `senderUserId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `privateMessage_1_idx`(`userId` ASC, `status` ASC, `sendTimeFormat` ASC) USING BTREE,
  INDEX `privateMessage_2_idx`(`userId` ASC, `friendUserId` ASC, `status` ASC, `sendTimeFormat` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of privatemessage_3
-- ----------------------------

-- ----------------------------
-- Table structure for pv
-- ----------------------------
DROP TABLE IF EXISTS `pv`;
CREATE TABLE `pv`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `browserName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deviceType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operatingSystem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `referrer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `times` datetime(6) NULL DEFAULT NULL,
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pv_1_idx`(`times` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pv
-- ----------------------------
INSERT INTO `pv` VALUES ('00243ad8b2ac46249c54d32442e086d4', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:25:32.320000', 'http://127.0.0.1:8080/sm/e582157475fc7314fac04d0665132cf63fa5ac3025c8d2be36a36cd7641c25b2.map');
INSERT INTO `pv` VALUES ('05ff14df3e564f908430485f85bae3bb', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:20:29.981000', 'http://127.0.0.1:8080/sm/e582157475fc7314fac04d0665132cf63fa5ac3025c8d2be36a36cd7641c25b2.map');
INSERT INTO `pv` VALUES ('10be4d496b944c199cf5d207480d80f3', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:24:32.471000', 'http://127.0.0.1:8080/sm/e582157475fc7314fac04d0665132cf63fa5ac3025c8d2be36a36cd7641c25b2.map');
INSERT INTO `pv` VALUES ('125b4e048a054155b526530aeddab6a0', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:24:48.556000', 'http://127.0.0.1:8080/.well-known/appspecific/com.chrome.devtools.json');
INSERT INTO `pv` VALUES ('1533295cbb484cfaac870d684dbecc76', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:48:08.763000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('15c8cec0b5654ad19b8b8db2d618f443', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:59:31.803000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('181c61a268cb4fd6be40a121933e625c', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/login?jumpUrl=aW5kZXg', '2025-10-13 18:28:17.494000', 'http://127.0.0.1:8080/index');
INSERT INTO `pv` VALUES ('1f3913c2bca6409397fbb61d4c2dfb38', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/register?jumpUrl=aW5kZXg', '2025-10-13 18:19:17.688000', 'http://127.0.0.1:8080/index');
INSERT INTO `pv` VALUES ('244f91fc6ae44072afbda398b8d1a6ce', 'Chrome 14 141.0.0.0', '电脑', '172.18.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:07:56.161000', 'http://127.0.0.1:8080/templates/default/pc/index');
INSERT INTO `pv` VALUES ('24927c1e7cbf466b907c7a1d1ff08810', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:28:08.134000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('294e5ca489444b0abc5efe736a53482e', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/thread?topicId=1', '2025-10-13 18:29:15.289000', 'http://127.0.0.1:8080/comment_reply?commentId=1&timestamp=1760351355283');
INSERT INTO `pv` VALUES ('36d44f1211674643853eb7104a0a0abb', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:16:11.650000', 'http://127.0.0.1:8080/templates/default/pc/message');
INSERT INTO `pv` VALUES ('39478e06e39e4478a8f40ccb3b32ca55', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:16:15.564000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('3953935bebca42268bbbc32309bd771e', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/admin/control/manage/home', '2025-10-13 18:19:01.663000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('40131f3532ef417c911e93ae5882cbc8', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/', '2025-10-13 18:28:11.082000', 'http://127.0.0.1:8080/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('429538b630154a4792880f9f53331a01', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:44:03.044000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('4c9a6bb024514a5eacfdff0f36f2b684', 'Chrome 14 141.0.0.0', '电脑', '172.18.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:08:41.455000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('4da3d49ccc2644409ff00c2a49891f83', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:40:24.068000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('5185b078404b408b9ee596cfc357307b', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:50:38.469000', 'http://127.0.0.1:8080/templates/default/pc/index');
INSERT INTO `pv` VALUES ('55b42cf6d25247c28694ba266fae630a', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:16:15.578000', 'http://127.0.0.1:8080/templates/default/pc/message');
INSERT INTO `pv` VALUES ('5999437e49a249eda28046e522e93d17', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:45:58.732000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('5a84c3749d394026ba23729f257b2a32', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:50:38.486000', 'http://127.0.0.1:8080/templates/default/pc/message');
INSERT INTO `pv` VALUES ('5e1991ce0006403da7912320b780a740', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/index', '2025-10-13 18:28:52.017000', 'http://127.0.0.1:8080/index');
INSERT INTO `pv` VALUES ('62d0f2064a9b40ad81726fbb44be7598', 'Chrome 14 141.0.0.0', '电脑', '172.18.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:08:41.477000', 'http://127.0.0.1:8080/templates/default/pc/message');
INSERT INTO `pv` VALUES ('62fffb53a6514ab2b1b614641df2cfe7', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/index', '2025-10-13 18:19:22.121000', 'http://127.0.0.1:8080/askList');
INSERT INTO `pv` VALUES ('65770176e4a543f2b02d6fefff5145ab', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/index', '2025-10-13 18:19:40.563000', 'http://127.0.0.1:8080/register?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('6917f76c533a49259b9abe9844a9eb53', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/index', '2025-10-13 18:29:05.575000', 'http://127.0.0.1:8080/thread?topicId=1');
INSERT INTO `pv` VALUES ('69879bcb350343cf8d1c3487f3aa47b5', 'Chrome 14 141.0.0.0', '电脑', '172.18.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:07:56.176000', 'http://127.0.0.1:8080/templates/default/pc/message');
INSERT INTO `pv` VALUES ('6c0b95eb0bfb41fd94d62609db1d5ae4', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/thread?topicId=1', '2025-10-13 18:29:13.109000', 'http://127.0.0.1:8080/thread?topicId=1');
INSERT INTO `pv` VALUES ('6d8378bd0c1e4da4b3b609d6f7640209', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:17:35.343000', 'http://127.0.0.1:8080/templates/default/pc/index');
INSERT INTO `pv` VALUES ('6fb383e162064cb58ec0fdc3b7cc297f', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/help', '2025-10-13 18:19:23.751000', 'http://127.0.0.1:8080/index');
INSERT INTO `pv` VALUES ('73ad8ab188704686b8f27f4fdd8e266a', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:16:11.616000', 'http://127.0.0.1:8080/templates/default/pc/index');
INSERT INTO `pv` VALUES ('7b797074e8534ae9becaf34801c16f0e', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:56:36.733000', 'http://127.0.0.1:8080/templates/default/pc/index');
INSERT INTO `pv` VALUES ('7b7dd6b4642543059b364beb3c4d6882', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:16:16.876000', 'http://127.0.0.1:8080/templates/default/pc/message');
INSERT INTO `pv` VALUES ('7bced2f7ac55430188984842db7a8462', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:16:16.865000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('7c96f4e2683241b5a4c91a20369e5fdc', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/index', '2025-10-13 18:19:19.122000', 'http://127.0.0.1:8080/membershipCardList');
INSERT INTO `pv` VALUES ('7d3a311f637047d5a05aa672487e81b3', 'Chrome 14 141.0.0.0', '电脑', '172.18.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:08:41.468000', 'http://127.0.0.1:8080/templates/default/pc/index');
INSERT INTO `pv` VALUES ('871aede48b05402cb6e682bacf42afee', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:16:15.573000', 'http://127.0.0.1:8080/templates/default/pc/index');
INSERT INTO `pv` VALUES ('897cd2debe9940e78aa8dc1935b40537', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:56:36.747000', 'http://127.0.0.1:8080/templates/default/pc/message');
INSERT INTO `pv` VALUES ('8bc1402395794e37b47addce43690c2b', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:24:48.914000', 'http://127.0.0.1:8080/sm/e582157475fc7314fac04d0665132cf63fa5ac3025c8d2be36a36cd7641c25b2.map');
INSERT INTO `pv` VALUES ('8f4ec3e3774c4d53b60327ccbc56c6cf', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:27:25.378000', 'http://127.0.0.1:8080/sm/e582157475fc7314fac04d0665132cf63fa5ac3025c8d2be36a36cd7641c25b2.map');
INSERT INTO `pv` VALUES ('93165c910a1a4922a6535bf071adb6c4', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:48:08.894000', 'http://127.0.0.1:8080/templates/default/pc/message');
INSERT INTO `pv` VALUES ('98cde09b71f745c994579dfb11f36b72', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/askList', '2025-10-13 18:19:22.661000', 'http://127.0.0.1:8080/help');
INSERT INTO `pv` VALUES ('a48758e5c1f54bf4b2fe72a244cf556b', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/index', '2025-10-13 18:29:02.651000', 'http://127.0.0.1:8080/index');
INSERT INTO `pv` VALUES ('a74da97fc24340b887d33d725f0c8821', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:44:03.165000', 'http://127.0.0.1:8080/templates/default/pc/message');
INSERT INTO `pv` VALUES ('a87ace753bc241158266807a0e84cf2b', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:40:24.179000', 'http://127.0.0.1:8080/templates/default/pc/index');
INSERT INTO `pv` VALUES ('ac9a086becc84e4d9c6d47ac9d8ea462', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:25:31.953000', 'http://127.0.0.1:8080/.well-known/appspecific/com.chrome.devtools.json');
INSERT INTO `pv` VALUES ('adf1c3d8131b426e95d5dd1aeb1ee557', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:20:38.584000', 'http://127.0.0.1:8080/sm/e582157475fc7314fac04d0665132cf63fa5ac3025c8d2be36a36cd7641c25b2.map');
INSERT INTO `pv` VALUES ('b45cb12cb5e94ab5ae80468422613e5b', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:20:29.317000', 'http://127.0.0.1:8080/.well-known/appspecific/com.chrome.devtools.json');
INSERT INTO `pv` VALUES ('bdbe4b9aeed74aaebdb120ac7116a332', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:24:32.048000', 'http://127.0.0.1:8080/.well-known/appspecific/com.chrome.devtools.json');
INSERT INTO `pv` VALUES ('bf173338854b4d35afae5de23b96c6f5', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/index', '2025-10-13 18:28:32.981000', 'http://127.0.0.1:8080/index');
INSERT INTO `pv` VALUES ('c10357194c7a4f1b8b8a5ec4e85d1325', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/user/control/home', '2025-10-13 18:28:30.431000', 'http://127.0.0.1:8080/index');
INSERT INTO `pv` VALUES ('c2c8ac85ee494ca08da66e8599d2503f', 'Chrome 14 141.0.0.0', '电脑', '172.18.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:07:56.047000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('c3d477340cf948c4bed530f063bb9aa4', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/index', '2025-10-13 18:28:22.944000', 'http://127.0.0.1:8080/user/control/home');
INSERT INTO `pv` VALUES ('c84ecee2ed624f4ea2bff55b4a102b15', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:59:31.957000', 'http://127.0.0.1:8080/templates/default/pc/message');
INSERT INTO `pv` VALUES ('cf9248d94ceb4179b63c7b7caaed612b', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:56:36.627000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('d1adaad0e37549c99fd3f1b8ae3444ca', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/index', '2025-10-13 18:28:20.276000', 'http://127.0.0.1:8080/index');
INSERT INTO `pv` VALUES ('d8b723c745d44a3eb80b528ea2927dee', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:45:58.860000', 'http://127.0.0.1:8080/templates/default/pc/message');
INSERT INTO `pv` VALUES ('d9557ee240ca45a28a58e3dc8c5a9291', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:59:31.939000', 'http://127.0.0.1:8080/templates/default/pc/index');
INSERT INTO `pv` VALUES ('e179f8253d1c430b984d7b52de2b7670', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/thread?topicId=1', '2025-10-13 18:29:21.232000', 'http://127.0.0.1:8080/thread?topicId=1');
INSERT INTO `pv` VALUES ('e19a2d94866e4e5aaff0486ca4e05e5f', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:48:08.880000', 'http://127.0.0.1:8080/templates/default/pc/index');
INSERT INTO `pv` VALUES ('e1b41ef6e74d45c7bb60fee53e7ead89', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:17:35.246000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('e1ca8edb657e45d183370d238059c2f4', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:27:25.091000', 'http://127.0.0.1:8080/.well-known/appspecific/com.chrome.devtools.json');
INSERT INTO `pv` VALUES ('e431b8f4924a4810a3760d4f97e86e67', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:40:24.196000', 'http://127.0.0.1:8080/templates/default/pc/message');
INSERT INTO `pv` VALUES ('e4a0cad9c67745feac65ea5ad6418997', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/askList', '2025-10-13 18:19:20.963000', 'http://127.0.0.1:8080/membershipCardList');
INSERT INTO `pv` VALUES ('e4baf73cd4e4480a9059d7ccdf843b34', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:20:38.176000', 'http://127.0.0.1:8080/.well-known/appspecific/com.chrome.devtools.json');
INSERT INTO `pv` VALUES ('ee470c5a4e6d447698b2a0505c206364', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:17:35.357000', 'http://127.0.0.1:8080/templates/default/pc/message');
INSERT INTO `pv` VALUES ('f029f406945d4ad6b91c50a76c2209d1', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:16:16.872000', 'http://127.0.0.1:8080/templates/default/pc/index');
INSERT INTO `pv` VALUES ('f66ce57cda20427ea599666d7e286a5d', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', NULL, '2025-10-13 19:16:11.333000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('f709c684a19e43c6ba19c773f686a522', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/membershipCardList', '2025-10-13 18:19:21.530000', 'http://127.0.0.1:8080/index');
INSERT INTO `pv` VALUES ('f7d63dd477ec482a8a5571033a8c620d', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/', '2025-10-13 18:19:14.846000', 'http://127.0.0.1:8080/register?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('f92ea2e405c7406286f68142ff4824fc', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:50:38.355000', 'http://127.0.0.1:8080/');
INSERT INTO `pv` VALUES ('fd0280d989b94088beadc16d2af3a191', 'Chrome 14 141.0.0.0', '电脑', '127.0.0.1', 'WINDOWS_10', 'http://127.0.0.1:8080/membershipCardList', '2025-10-13 18:19:20.118000', 'http://127.0.0.1:8080/askList');
INSERT INTO `pv` VALUES ('fef3c44c241f4b3eafa01fd6b2a4c78a', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:45:58.844000', 'http://127.0.0.1:8080/templates/default/pc/index');
INSERT INTO `pv` VALUES ('ff80524cdb7b4a2c87b1ca8467ab0f95', 'Chrome 14 141.0.0.0', '电脑', '172.19.0.1', 'WINDOWS_10', NULL, '2025-10-13 18:44:03.150000', 'http://127.0.0.1:8080/templates/default/pc/index');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adoptionAnswerId` bigint NULL DEFAULT NULL,
  `allow` bit(1) NOT NULL,
  `amount` decimal(12, 2) NOT NULL,
  `answerTotal` bigint NULL DEFAULT NULL,
  `appendContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isMarkdown` bit(1) NULL DEFAULT NULL,
  `isStaff` bit(1) NULL DEFAULT NULL,
  `lastAnswerTime` datetime(6) NULL DEFAULT NULL,
  `lastUpdateTime` datetime(6) NULL DEFAULT NULL,
  `markdownContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `point` bigint NULL DEFAULT NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `viewTotal` bigint NULL DEFAULT NULL,
  `voteThemeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `question_1_idx`(`userName` ASC, `postTime` ASC) USING BTREE,
  INDEX `question_4_idx`(`status` ASC, `sort` ASC, `lastAnswerTime` ASC) USING BTREE,
  INDEX `question_5_idx`(`adoptionAnswerId` ASC, `status` ASC, `sort` ASC, `lastAnswerTime` ASC) USING BTREE,
  INDEX `question_6_idx`(`point` ASC, `status` ASC, `sort` ASC, `lastAnswerTime` ASC) USING BTREE,
  INDEX `question_7_idx`(`amount` ASC, `status` ASC, `sort` ASC, `lastAnswerTime` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------

-- ----------------------------
-- Table structure for questionfavorite_0
-- ----------------------------
DROP TABLE IF EXISTS `questionfavorite_0`;
CREATE TABLE `questionfavorite_0`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `favoriteId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionFavorite_1_idx`(`questionId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionfavorite_0
-- ----------------------------

-- ----------------------------
-- Table structure for questionfavorite_1
-- ----------------------------
DROP TABLE IF EXISTS `questionfavorite_1`;
CREATE TABLE `questionfavorite_1`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `favoriteId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionFavorite_1_idx`(`questionId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionfavorite_1
-- ----------------------------

-- ----------------------------
-- Table structure for questionfavorite_2
-- ----------------------------
DROP TABLE IF EXISTS `questionfavorite_2`;
CREATE TABLE `questionfavorite_2`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `favoriteId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionFavorite_1_idx`(`questionId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionfavorite_2
-- ----------------------------

-- ----------------------------
-- Table structure for questionfavorite_3
-- ----------------------------
DROP TABLE IF EXISTS `questionfavorite_3`;
CREATE TABLE `questionfavorite_3`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `favoriteId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionFavorite_1_idx`(`questionId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionfavorite_3
-- ----------------------------

-- ----------------------------
-- Table structure for questionindex
-- ----------------------------
DROP TABLE IF EXISTS `questionindex`;
CREATE TABLE `questionindex`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dataId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `indexState` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionindex
-- ----------------------------

-- ----------------------------
-- Table structure for questionlike_0
-- ----------------------------
DROP TABLE IF EXISTS `questionlike_0`;
CREATE TABLE `questionlike_0`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `question_1_idx`(`questionId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionlike_0
-- ----------------------------

-- ----------------------------
-- Table structure for questionlike_1
-- ----------------------------
DROP TABLE IF EXISTS `questionlike_1`;
CREATE TABLE `questionlike_1`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionLike_1_idx`(`questionId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionlike_1
-- ----------------------------

-- ----------------------------
-- Table structure for questionlike_2
-- ----------------------------
DROP TABLE IF EXISTS `questionlike_2`;
CREATE TABLE `questionlike_2`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionLike_1_idx`(`questionId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionlike_2
-- ----------------------------

-- ----------------------------
-- Table structure for questionlike_3
-- ----------------------------
DROP TABLE IF EXISTS `questionlike_3`;
CREATE TABLE `questionlike_3`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionLike_1_idx`(`questionId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionlike_3
-- ----------------------------

-- ----------------------------
-- Table structure for questionrewardplatformshare
-- ----------------------------
DROP TABLE IF EXISTS `questionrewardplatformshare`;
CREATE TABLE `questionrewardplatformshare`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adoptionTime` datetime(6) NULL DEFAULT NULL,
  `answerUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `answerUserShareRunningNumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `platformShareProportion` int NULL DEFAULT NULL,
  `postUserName` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `shareAmount` decimal(14, 4) NOT NULL,
  `staff` bit(1) NOT NULL,
  `totalAmount` decimal(12, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionRewardPlatformShare_1_idx`(`adoptionTime` ASC) USING BTREE,
  INDEX `questionRewardPlatformShare_2_idx`(`questionId` ASC, `answerUserName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionrewardplatformshare
-- ----------------------------

-- ----------------------------
-- Table structure for questiontag
-- ----------------------------
DROP TABLE IF EXISTS `questiontag`;
CREATE TABLE `questiontag`  (
  `id` bigint NOT NULL,
  `childNodeNumber` int NULL DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `multiLanguageExtension` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parentId` bigint NULL DEFAULT NULL,
  `parentIdGroup` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionTag_1_idx`(`sort` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questiontag
-- ----------------------------

-- ----------------------------
-- Table structure for questiontagassociation
-- ----------------------------
DROP TABLE IF EXISTS `questiontagassociation`;
CREATE TABLE `questiontagassociation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint NULL DEFAULT NULL,
  `questionTagId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionTagAssociation_1_idx`(`questionId` ASC) USING BTREE,
  INDEX `questionTagAssociation_2_idx`(`questionTagId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questiontagassociation
-- ----------------------------

-- ----------------------------
-- Table structure for receiveredenvelope_0
-- ----------------------------
DROP TABLE IF EXISTS `receiveredenvelope_0`;
CREATE TABLE `receiveredenvelope_0`  (
  `id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(12, 2) NULL DEFAULT NULL,
  `giveRedEnvelopeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `giveUserId` bigint NULL DEFAULT NULL,
  `receiveTime` datetime(6) NULL DEFAULT NULL,
  `receiveUserId` bigint NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `receiveRedEnvelope_1_idx`(`receiveUserId` ASC, `receiveTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receiveredenvelope_0
-- ----------------------------

-- ----------------------------
-- Table structure for receiveredenvelope_1
-- ----------------------------
DROP TABLE IF EXISTS `receiveredenvelope_1`;
CREATE TABLE `receiveredenvelope_1`  (
  `id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(12, 2) NULL DEFAULT NULL,
  `giveRedEnvelopeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `giveUserId` bigint NULL DEFAULT NULL,
  `receiveTime` datetime(6) NULL DEFAULT NULL,
  `receiveUserId` bigint NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `receiveRedEnvelope_1_idx`(`receiveUserId` ASC, `receiveTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receiveredenvelope_1
-- ----------------------------

-- ----------------------------
-- Table structure for receiveredenvelope_2
-- ----------------------------
DROP TABLE IF EXISTS `receiveredenvelope_2`;
CREATE TABLE `receiveredenvelope_2`  (
  `id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(12, 2) NULL DEFAULT NULL,
  `giveRedEnvelopeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `giveUserId` bigint NULL DEFAULT NULL,
  `receiveTime` datetime(6) NULL DEFAULT NULL,
  `receiveUserId` bigint NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `receiveRedEnvelope_1_idx`(`receiveUserId` ASC, `receiveTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receiveredenvelope_2
-- ----------------------------

-- ----------------------------
-- Table structure for receiveredenvelope_3
-- ----------------------------
DROP TABLE IF EXISTS `receiveredenvelope_3`;
CREATE TABLE `receiveredenvelope_3`  (
  `id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(12, 2) NULL DEFAULT NULL,
  `giveRedEnvelopeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `giveUserId` bigint NULL DEFAULT NULL,
  `receiveTime` datetime(6) NULL DEFAULT NULL,
  `receiveUserId` bigint NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `receiveRedEnvelope_1_idx`(`receiveUserId` ASC, `receiveTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receiveredenvelope_3
-- ----------------------------

-- ----------------------------
-- Table structure for remind_0
-- ----------------------------
DROP TABLE IF EXISTS `remind_0`;
CREATE TABLE `remind_0`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `friendQuestionAnswerId` bigint NULL DEFAULT NULL,
  `friendQuestionReplyId` bigint NULL DEFAULT NULL,
  `friendTopicCommentId` bigint NULL DEFAULT NULL,
  `friendTopicReplyId` bigint NULL DEFAULT NULL,
  `questionAnswerId` bigint NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `questionReplyId` bigint NULL DEFAULT NULL,
  `readTimeFormat` bigint NULL DEFAULT NULL,
  `receiverUserId` bigint NULL DEFAULT NULL,
  `sendTimeFormat` bigint NULL DEFAULT NULL,
  `senderUserId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `topicCommentId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `topicReplyId` bigint NULL DEFAULT NULL,
  `typeCode` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `remind_1_idx`(`receiverUserId` ASC, `status` ASC, `sendTimeFormat` ASC) USING BTREE,
  INDEX `remind_2_idx`(`topicId` ASC) USING BTREE,
  INDEX `remind_3_idx`(`receiverUserId` ASC, `typeCode` ASC, `sendTimeFormat` ASC) USING BTREE,
  INDEX `remind_4_idx`(`questionId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remind_0
-- ----------------------------

-- ----------------------------
-- Table structure for remind_1
-- ----------------------------
DROP TABLE IF EXISTS `remind_1`;
CREATE TABLE `remind_1`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `friendQuestionAnswerId` bigint NULL DEFAULT NULL,
  `friendQuestionReplyId` bigint NULL DEFAULT NULL,
  `friendTopicCommentId` bigint NULL DEFAULT NULL,
  `friendTopicReplyId` bigint NULL DEFAULT NULL,
  `questionAnswerId` bigint NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `questionReplyId` bigint NULL DEFAULT NULL,
  `readTimeFormat` bigint NULL DEFAULT NULL,
  `receiverUserId` bigint NULL DEFAULT NULL,
  `sendTimeFormat` bigint NULL DEFAULT NULL,
  `senderUserId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `topicCommentId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `topicReplyId` bigint NULL DEFAULT NULL,
  `typeCode` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `remind_1_idx`(`receiverUserId` ASC, `status` ASC, `sendTimeFormat` ASC) USING BTREE,
  INDEX `remind_2_idx`(`topicId` ASC) USING BTREE,
  INDEX `remind_3_idx`(`receiverUserId` ASC, `typeCode` ASC, `sendTimeFormat` ASC) USING BTREE,
  INDEX `remind_4_idx`(`questionId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remind_1
-- ----------------------------

-- ----------------------------
-- Table structure for remind_2
-- ----------------------------
DROP TABLE IF EXISTS `remind_2`;
CREATE TABLE `remind_2`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `friendQuestionAnswerId` bigint NULL DEFAULT NULL,
  `friendQuestionReplyId` bigint NULL DEFAULT NULL,
  `friendTopicCommentId` bigint NULL DEFAULT NULL,
  `friendTopicReplyId` bigint NULL DEFAULT NULL,
  `questionAnswerId` bigint NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `questionReplyId` bigint NULL DEFAULT NULL,
  `readTimeFormat` bigint NULL DEFAULT NULL,
  `receiverUserId` bigint NULL DEFAULT NULL,
  `sendTimeFormat` bigint NULL DEFAULT NULL,
  `senderUserId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `topicCommentId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `topicReplyId` bigint NULL DEFAULT NULL,
  `typeCode` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `remind_1_idx`(`receiverUserId` ASC, `status` ASC, `sendTimeFormat` ASC) USING BTREE,
  INDEX `remind_2_idx`(`topicId` ASC) USING BTREE,
  INDEX `remind_3_idx`(`receiverUserId` ASC, `typeCode` ASC, `sendTimeFormat` ASC) USING BTREE,
  INDEX `remind_4_idx`(`questionId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remind_2
-- ----------------------------

-- ----------------------------
-- Table structure for remind_3
-- ----------------------------
DROP TABLE IF EXISTS `remind_3`;
CREATE TABLE `remind_3`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `friendQuestionAnswerId` bigint NULL DEFAULT NULL,
  `friendQuestionReplyId` bigint NULL DEFAULT NULL,
  `friendTopicCommentId` bigint NULL DEFAULT NULL,
  `friendTopicReplyId` bigint NULL DEFAULT NULL,
  `questionAnswerId` bigint NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `questionReplyId` bigint NULL DEFAULT NULL,
  `readTimeFormat` bigint NULL DEFAULT NULL,
  `receiverUserId` bigint NULL DEFAULT NULL,
  `sendTimeFormat` bigint NULL DEFAULT NULL,
  `senderUserId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `topicCommentId` bigint NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `topicReplyId` bigint NULL DEFAULT NULL,
  `typeCode` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `remind_1_idx`(`receiverUserId` ASC, `status` ASC, `sendTimeFormat` ASC) USING BTREE,
  INDEX `remind_2_idx`(`topicId` ASC) USING BTREE,
  INDEX `remind_3_idx`(`receiverUserId` ASC, `typeCode` ASC, `sendTimeFormat` ASC) USING BTREE,
  INDEX `remind_4_idx`(`questionId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remind_3
-- ----------------------------

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `commentId` bigint NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `friendReplyId` bigint NULL DEFAULT NULL,
  `friendReplyIdGroup` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `friendUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isFriendStaff` bit(1) NULL DEFAULT NULL,
  `isStaff` bit(1) NULL DEFAULT NULL,
  `lastUpdateTime` datetime(6) NULL DEFAULT NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reply_1_idx`(`commentId` ASC, `status` ASC) USING BTREE,
  INDEX `reply_2_idx`(`topicId` ASC) USING BTREE,
  INDEX `reply_3_idx`(`userName` ASC, `isStaff` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES (1, 1, '1', NULL, ',0,', NULL, '127.0.0.1', b'0', b'0', NULL, '2025-10-13 18:29:17.966000', 20, 1, 'u5RmNvNUs5WHrgl9h6S');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `extraParameterId` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `imageData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `parameterId` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `processCompleteTime` datetime(6) NULL DEFAULT NULL,
  `processResult` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `reportTypeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `staffAccount` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `report_1_idx`(`parameterId` ASC, `module` ASC, `status` ASC) USING BTREE,
  INDEX `report_2_idx`(`userName` ASC, `status` ASC) USING BTREE,
  INDEX `report_3_idx`(`parameterId` ASC, `userName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------

-- ----------------------------
-- Table structure for reporttype
-- ----------------------------
DROP TABLE IF EXISTS `reporttype`;
CREATE TABLE `reporttype`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `childNodeNumber` int NULL DEFAULT NULL,
  `giveReason` bit(1) NULL DEFAULT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parentId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parentIdGroup` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reportType_1_idx`(`sort` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reporttype
-- ----------------------------

-- ----------------------------
-- Table structure for sendsmslog
-- ----------------------------
DROP TABLE IF EXISTS `sendsmslog`;
CREATE TABLE `sendsmslog`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createDate` datetime(6) NULL DEFAULT NULL,
  `interfaceProduct` int NULL DEFAULT NULL,
  `message` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `platformUserId` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `serviceId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sendsmslog
-- ----------------------------

-- ----------------------------
-- Table structure for smsinterface
-- ----------------------------
DROP TABLE IF EXISTS `smsinterface`;
CREATE TABLE `smsinterface`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `dynamicParameter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `enable` bit(1) NOT NULL,
  `interfaceProduct` int NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sendService` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sort` int NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smsinterface
-- ----------------------------

-- ----------------------------
-- Table structure for specification
-- ----------------------------
DROP TABLE IF EXISTS `specification`;
CREATE TABLE `specification`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `duration` int NULL DEFAULT NULL,
  `enable` bit(1) NOT NULL,
  `marketPrice` decimal(12, 2) NULL DEFAULT NULL,
  `membershipCardId` bigint NULL DEFAULT NULL,
  `point` bigint NULL DEFAULT NULL,
  `sellingPrice` decimal(12, 2) NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `specificationName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stock` bigint NULL DEFAULT NULL,
  `stockOccupy` bigint NULL DEFAULT NULL,
  `unit` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `specification_1_idx`(`membershipCardId` ASC, `sort` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of specification
-- ----------------------------

-- ----------------------------
-- Table structure for staffloginlog_0
-- ----------------------------
DROP TABLE IF EXISTS `staffloginlog_0`;
CREATE TABLE `staffloginlog_0`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logonTime` datetime(6) NULL DEFAULT NULL,
  `staffId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `staffLoginLog_idx`(`staffId` ASC, `logonTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staffloginlog_0
-- ----------------------------
INSERT INTO `staffloginlog_0` VALUES ('6a807d058c0c4d73b1effd4fd91cbddb7572', '127.0.0.1', '2025-10-13 18:18:54.850000', '42ea45e889e94e31820eec3c2b3f3dd5');
INSERT INTO `staffloginlog_0` VALUES ('785bd8340258489089e6f37d3c2262507572', '127.0.0.1', '2025-10-13 18:27:33.130000', '42ea45e889e94e31820eec3c2b3f3dd5');
INSERT INTO `staffloginlog_0` VALUES ('969931d70a2649bca9722267c7aa933b7572', '127.0.0.1', '2025-10-13 18:24:41.095000', '42ea45e889e94e31820eec3c2b3f3dd5');
INSERT INTO `staffloginlog_0` VALUES ('bcd4aa7d4abb41fc81baf65262f42ab17572', '127.0.0.1', '2025-10-13 18:25:42.651000', '42ea45e889e94e31820eec3c2b3f3dd5');
INSERT INTO `staffloginlog_0` VALUES ('d624e757c56b46a68e698e3aa8ce6c077572', '127.0.0.1', '2025-10-13 18:12:11.065000', '42ea45e889e94e31820eec3c2b3f3dd5');

-- ----------------------------
-- Table structure for staffloginlog_1
-- ----------------------------
DROP TABLE IF EXISTS `staffloginlog_1`;
CREATE TABLE `staffloginlog_1`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logonTime` datetime(6) NULL DEFAULT NULL,
  `staffId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `staffLoginLog_idx`(`staffId` ASC, `logonTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staffloginlog_1
-- ----------------------------

-- ----------------------------
-- Table structure for staffloginlog_2
-- ----------------------------
DROP TABLE IF EXISTS `staffloginlog_2`;
CREATE TABLE `staffloginlog_2`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logonTime` datetime(6) NULL DEFAULT NULL,
  `staffId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `staffLoginLog_idx`(`staffId` ASC, `logonTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staffloginlog_2
-- ----------------------------

-- ----------------------------
-- Table structure for staffloginlog_3
-- ----------------------------
DROP TABLE IF EXISTS `staffloginlog_3`;
CREATE TABLE `staffloginlog_3`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logonTime` datetime(6) NULL DEFAULT NULL,
  `staffId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `staffLoginLog_idx`(`staffId` ASC, `logonTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staffloginlog_3
-- ----------------------------

-- ----------------------------
-- Table structure for subscriptionsystemnotify_0
-- ----------------------------
DROP TABLE IF EXISTS `subscriptionsystemnotify_0`;
CREATE TABLE `subscriptionsystemnotify_0`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `readTime` datetime(6) NULL DEFAULT NULL,
  `sendTime` datetime(6) NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `systemNotifyId` bigint NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subscriptionSystemNotify_1_idx`(`systemNotifyId` ASC) USING BTREE,
  INDEX `subscriptionSystemNotify_2_idx`(`userId` ASC, `status` ASC, `systemNotifyId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subscriptionsystemnotify_0
-- ----------------------------

-- ----------------------------
-- Table structure for subscriptionsystemnotify_1
-- ----------------------------
DROP TABLE IF EXISTS `subscriptionsystemnotify_1`;
CREATE TABLE `subscriptionsystemnotify_1`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `readTime` datetime(6) NULL DEFAULT NULL,
  `sendTime` datetime(6) NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `systemNotifyId` bigint NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subscriptionSystemNotify_1_idx`(`systemNotifyId` ASC) USING BTREE,
  INDEX `subscriptionSystemNotify_2_idx`(`userId` ASC, `status` ASC, `systemNotifyId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subscriptionsystemnotify_1
-- ----------------------------

-- ----------------------------
-- Table structure for subscriptionsystemnotify_2
-- ----------------------------
DROP TABLE IF EXISTS `subscriptionsystemnotify_2`;
CREATE TABLE `subscriptionsystemnotify_2`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `readTime` datetime(6) NULL DEFAULT NULL,
  `sendTime` datetime(6) NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `systemNotifyId` bigint NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subscriptionSystemNotify_1_idx`(`systemNotifyId` ASC) USING BTREE,
  INDEX `subscriptionSystemNotify_2_idx`(`userId` ASC, `status` ASC, `systemNotifyId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subscriptionsystemnotify_2
-- ----------------------------

-- ----------------------------
-- Table structure for subscriptionsystemnotify_3
-- ----------------------------
DROP TABLE IF EXISTS `subscriptionsystemnotify_3`;
CREATE TABLE `subscriptionsystemnotify_3`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `readTime` datetime(6) NULL DEFAULT NULL,
  `sendTime` datetime(6) NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `systemNotifyId` bigint NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subscriptionSystemNotify_1_idx`(`systemNotifyId` ASC) USING BTREE,
  INDEX `subscriptionSystemNotify_2_idx`(`userId` ASC, `status` ASC, `systemNotifyId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subscriptionsystemnotify_3
-- ----------------------------

-- ----------------------------
-- Table structure for syspermission
-- ----------------------------
DROP TABLE IF EXISTS `syspermission`;
CREATE TABLE `syspermission`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `methods` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `priority` int NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syspermission
-- ----------------------------
INSERT INTO `syspermission` VALUES ('030ebf82676c4160920670728bce3cb2', 'POST', 'AUTH_d0482512ccd5439bb6610672c11f0cb2_POST_DELETE', 1, '删除模板');
INSERT INTO `syspermission` VALUES ('048060184aa747db94413aef590e6b97', 'POST', 'AUTH_fd848496836843b49ee6ed3ccdf6c14d_POST_UPDATE', 1, '审核话题');
INSERT INTO `syspermission` VALUES ('04931b8ad2db4512bb8c49d48f600b18', 'POST', 'AUTH_8dd0e634ff4647e0b438b75fbde1148f_POST_UPDATE', 1, '修改会员卡');
INSERT INTO `syspermission` VALUES ('05bd42ccee274a6393edf7e5be2ed902', 'GET', 'AUTH_b9512c1642a54356b453ef6e9df32aee_GET_READ', 1, '模板列表');
INSERT INTO `syspermission` VALUES ('0998399706604b298db6533ef23ec0ac', 'POST', 'AUTH_52bc2dbe4c0e437ebf93ce8b6575c6bb_POST_UPDATE', 2, '修改');
INSERT INTO `syspermission` VALUES ('0aa99e1b05ff46f48e4356db9c42a182', 'GET', 'AUTH_ab714c30b67345048aee5397c9f34ffe_GET_READ', 1, '收红包');
INSERT INTO `syspermission` VALUES ('0b9dd9f7be554a4eb07ff7bf716a81b9', 'POST', 'AUTH_0d87e1fe8fdd45d48c5f259b8e423b2e_POST_UPDATE', 2, '布局编辑');
INSERT INTO `syspermission` VALUES ('0bee0cbdc5514c02adf8f0910971c90f', 'GET', 'AUTH_9246901afe1b4d3fb501c3fc51be23c5_GET_READ', 1, '修改等级页');
INSERT INTO `syspermission` VALUES ('0c1ff61fb5664ba5b41d844b2bcbc5c5', 'POST', 'AUTH_70889956fee3475fb8487313d46f94c7_POST_ADD', 2, '添加模板');
INSERT INTO `syspermission` VALUES ('0cb6e21b9d254dd881c201b577fa46f6', 'POST', 'AUTH_71e587d45b384855831dcfa5db98f8fe_POST_UPDATE', 2, '修改答案回复');
INSERT INTO `syspermission` VALUES ('0e0d51db38d54019883a97efae6a613c', 'GET', 'AUTH_08a343e33ec44fe59228442dd56e96a3_GET_READ', 1, '缩略图列表');
INSERT INTO `syspermission` VALUES ('0e5fa569a5584aacadc631e738257aeb', 'GET', 'AUTH_a02b3694e4d542398d3a39f4156e992f_GET_READ', 1, '添加页');
INSERT INTO `syspermission` VALUES ('0f0ec2999fbb44f8846a20d58e828e59', 'POST', 'AUTH_45f5ca24bf7441c08680d66b3aa6a8f6_POST_DELETE', 1, '删除');
INSERT INTO `syspermission` VALUES ('0f7d3d4af8954ad18178b62d2f25d7f9', 'GET', 'AUTH_0ae67eaf13ab4fc199a4406126dbaef4_GET_READ', 1, '发表的评论');
INSERT INTO `syspermission` VALUES ('10aefb57f2f247b290c91e2253e8ce2d', 'GET', 'AUTH_d297f75ec0514aa1953d9d1738634090_GET_READ', 1, '下载压缩文件');
INSERT INTO `syspermission` VALUES ('115cccb921fd423e9dd8fb31b2e6437b', 'GET', 'AUTH_43bfdc37ca5a4473af0d483500390fe9_GET_READ', 1, '红包分配');
INSERT INTO `syspermission` VALUES ('11ac0bb2d9074573bdfcb40511a302b9', 'GET', 'AUTH_5417c2d6e8a8453b972682fee374ec3a_GET_READ', 1, '在线帮助列表');
INSERT INTO `syspermission` VALUES ('12d63c0e375a47728d4c182372529b8e', 'POST', 'AUTH_3b87a0950675425d9b46b0a9526acb46_POST_ADD', 2, '追加问题');
INSERT INTO `syspermission` VALUES ('1313b93cb906494d896c059eca62762a', 'POST', 'AUTH_fb9bce585d7d4aa89ddf30262540e660_POST_DELETE', 1, '删除导出模板');
INSERT INTO `syspermission` VALUES ('139ded1d586348f78e3751c9dc8dec13', 'GET', 'AUTH_7e6b62b229a84c0fa739373313f381c0_GET_READ', 1, '修改追加问题页');
INSERT INTO `syspermission` VALUES ('13f7169f2a0b48a591e701d5f5a034d0', 'GET', 'AUTH_2bf084e1e8d84e89a1c2da9c5f6c8f5d_GET_READ', 1, '私信对话列表');
INSERT INTO `syspermission` VALUES ('1474318f7e2240739d00a85ff21778d1', 'GET', 'AUTH_98e03673f0c847a2bc8f93008b1729ef_GET_READ', 1, '点赞用户');
INSERT INTO `syspermission` VALUES ('15c5191b69af4eb0a1862930c6fe176d', 'GET', 'AUTH_a4775968ad2e4b238ed49b4e4808a011_GET_READ', 1, '修改回复页');
INSERT INTO `syspermission` VALUES ('1889c935ddca4f81bf1046dccfcfe906', 'POST', 'AUTH_d75adb28b87d496e8627c11272b47476_POST_DELETE', 1, '删除在线帮助');
INSERT INTO `syspermission` VALUES ('18d7283440854ef68e30bcc83671777f', 'GET', 'AUTH_24bac9f0b1c84b0394a39c8933c7739d_GET_READ', 1, '资源文件查看');
INSERT INTO `syspermission` VALUES ('1931aeb8dd194f8282ebbd4085166f52', 'POST', 'AUTH_62c2facd01254ffe99ce7692def6815f_POST_DELETE', 1, '删除答案回复');
INSERT INTO `syspermission` VALUES ('194e1a7a1fdc4a6eae2bd4db1dea2661', 'GET', 'AUTH_922f6908c5a1434aba4b0f6f8f008c1c_GET_READ', 1, '添加版块页');
INSERT INTO `syspermission` VALUES ('19b5f1637e174a31a91c4ddcef3bb4c0', 'GET', 'AUTH_5af3e8652bd14b48aea03fac91e1e0b7_GET_READ', 1, '修改布局页');
INSERT INTO `syspermission` VALUES ('19facbaf34104cad9e532d40286753e7', 'GET', 'AUTH_27af89b4f9344c73b1b792334e7fdfe2_GET_READ', 1, '会员注册项列表');
INSERT INTO `syspermission` VALUES ('1a362749eebe4b1f8d41643521125336', 'POST', 'AUTH_fc8554db852a4f128bdee595b4cd1ed8_POST_UPDATE', 1, '更换头像');
INSERT INTO `syspermission` VALUES ('1a631db6c36e499cafd7d5211e61939f', 'GET', 'AUTH_061d18aeb1044870b94cf6144a6004ea_GET_READ', 1, '话题列表');
INSERT INTO `syspermission` VALUES ('1b7916b970e142888fe14821c935f579', 'GET', 'AUTH_3e88a83fff2a476392eccffb64d25b1e_GET_READ', 1, '查询会员卡赠送任务');
INSERT INTO `syspermission` VALUES ('1b80ca8dc02c4591997d420cc917d80b', 'GET', 'AUTH_53ae04bf6468464ea15826a8d1bb7417_GET_READ', 1, '留言列表');
INSERT INTO `syspermission` VALUES ('1cc026a6afec4d2c823901413e192bee', 'GET', 'AUTH_d71d35ca222a43e2bec6ceb76ac8097f_GET_READ', 1, '添加会员卡页');
INSERT INTO `syspermission` VALUES ('1d34b3ce43ae4d8f962a8b27381a3dec', 'POST', 'AUTH_670eb3b034d34a82a6053de088e27d0a_POST_UPDATE', 1, '还原问题');
INSERT INTO `syspermission` VALUES ('1e480a95e4c14abf954953d813054a6d', 'GET', 'AUTH_dede44542c5644a69b72180e1abc368b_GET_READ', 1, '红包分配');
INSERT INTO `syspermission` VALUES ('1e5cbc88d0d8489cabf925e70094b882', 'POST', 'AUTH_838e778a22c0424ab11914d1e3b44379_POST_UPDATE', 2, '修改角色');
INSERT INTO `syspermission` VALUES ('1f0ae8efec9840f09a8b34e7acd16f5f', 'POST', 'AUTH_39adfb4206024d14ab38822555314e7a_POST_UPDATE', 2, '修改举报');
INSERT INTO `syspermission` VALUES ('1f394709c4b74ac5a982ceea26a42d6e', 'POST', 'AUTH_efa66bc116bc409fbf7bf23e4882d2d9_POST_ADD', 2, '添加员工');
INSERT INTO `syspermission` VALUES ('1f8a51f44c3f4dfe878c0b978a5720d6', 'GET', 'AUTH_0d87e1fe8fdd45d48c5f259b8e423b2e_GET_READ', 1, '布局编辑页');
INSERT INTO `syspermission` VALUES ('2059b44286c3402c84e89d5d449eb305', 'POST', 'AUTH_a02b3694e4d542398d3a39f4156e992f_POST_ADD', 2, '添加');
INSERT INTO `syspermission` VALUES ('211fa9879cdc41b7b7e8ed3fe308278e', 'POST', 'AUTH_decb896d7fee40f09a958647cf14b849_POST_UPDATE', 1, '审核问题');
INSERT INTO `syspermission` VALUES ('21d93e122d3a4df4ac1b4748ef5a99a7', 'GET', 'AUTH_bee77a45dcdb428db42dcb2317648fe9_GET_READ', 1, '修改员工页');
INSERT INTO `syspermission` VALUES ('22262588cd464d568f4d756512152c3d', 'POST', 'AUTH_8ce45be5ea284190b9d76138d8d5f6b2_POST_ADD', 2, '打包文件');
INSERT INTO `syspermission` VALUES ('22d30d3080cc422e8878470f6db173fc', 'POST', 'AUTH_9246901afe1b4d3fb501c3fc51be23c5_POST_UPDATE', 2, '修改等级');
INSERT INTO `syspermission` VALUES ('238bd1047afc4fc0a220977c44a07336', 'GET', 'AUTH_d613442d18c1465d8a981f420b3aa8cd_GET_READ', 1, '维护数据页');
INSERT INTO `syspermission` VALUES ('25ba6537e4ef4bc8ad0530534975e426', 'GET', 'AUTH_879f7ed98c6d4af5b07a7dd2c98833d5_GET_READ', 1, '积分日志明细');
INSERT INTO `syspermission` VALUES ('260db4f1552c4f09a5f6f999e896cdac', 'GET', 'AUTH_9be9600772e3420a91ee019acc3ba379_GET_READ', 1, '添加答案回复页');
INSERT INTO `syspermission` VALUES ('26767c89eeb84e56a411f686b3242491', 'GET', 'AUTH_b805b7dbbf0140b2a2fcb962e3fe4a4d_GET_READ', 1, '修改分类页');
INSERT INTO `syspermission` VALUES ('27464511268442c39980b0a8a25c2663', 'GET', 'AUTH_f2ddeb0bb4c94342854c6a2461869fb4_GET_READ', 1, '提醒列表');
INSERT INTO `syspermission` VALUES ('283b82e93f0f45e9aebe62a6fa3194bd', 'POST', 'AUTH_9c3ddbaa3457496ab9315ce6f271db8d_POST_UPDATE', 1, '还原在线帮助');
INSERT INTO `syspermission` VALUES ('2857b3c00f5841c4920497ac57beac6b', 'POST', 'AUTH_32ae2070e23d42ba8dc38de061e7ed47_POST_DELETE', 1, '删除');
INSERT INTO `syspermission` VALUES ('294be5897f7c4770b7b2d0190e0a6bdd', 'POST', 'AUTH_7d7842f34d6940738a767b3d7dd9a6ec_POST_ADD', 1, '充值');
INSERT INTO `syspermission` VALUES ('2a3de832f5d44914a4b568991aa282dc', 'POST', 'AUTH_f14133ca94274ff197996e059a26ad49_POST_UPDATE', 2, '修改会员卡赠送任务');
INSERT INTO `syspermission` VALUES ('2a881ff2307942a888e84ce2b7cb9a57', 'POST', 'AUTH_d71d35ca222a43e2bec6ceb76ac8097f_POST_ADD', 2, '添加会员卡');
INSERT INTO `syspermission` VALUES ('2b07e05a06784b4c8095ce0345b407a1', 'GET', 'AUTH_f365c635400e47eda1fc10589d7dbbcd_GET_READ', 1, '会员搜索');
INSERT INTO `syspermission` VALUES ('2bb181ae95ef4fe39a78b5737616f448', 'POST', 'AUTH_04acd924ee1f4ef8b60efd03a35998a3_POST_UPDATE', 1, '设置默认角色');
INSERT INTO `syspermission` VALUES ('2bc126b7b8034d899bb6bf2887c86aad', 'POST', 'AUTH_4a47d671d3294386a2ac9871d4f1425d_POST_DELETE', 1, '删除举报');
INSERT INTO `syspermission` VALUES ('2d05a9c495ea48598814eb46f3852102', 'GET', 'AUTH_75a262c3c48d4e21817541cd87fac000_GET_READ', 1, '合并分类页');
INSERT INTO `syspermission` VALUES ('2d5b3555fd764225bbdd1e8787d8198f', 'POST', 'AUTH_513d70ed7f3e46eb91f8ea4bbfc89317_POST_DELETE', 1, '删除会员注册项');
INSERT INTO `syspermission` VALUES ('2dabdbe7ec924ed2b8a15d8f06f9f457', 'POST', 'AUTH_281466f5c0654966a68653b7383c6d9a_POST_ADD', 2, '添加评论');
INSERT INTO `syspermission` VALUES ('2eb3a442ae964e03b0626dee0115a7cd', 'GET', 'AUTH_efa66bc116bc409fbf7bf23e4882d2d9_GET_READ', 1, '添加员工页');
INSERT INTO `syspermission` VALUES ('2f44f50ef9184640b7578bd1eeb9888c', 'GET', 'AUTH_4ab032ea2c53438799d6b32b0eebb60b_GET_READ', 1, '问题标签列表');
INSERT INTO `syspermission` VALUES ('3093827bb1314f9ab1ba5068fa94bdf6', 'GET', 'AUTH_37f5d0f7095b4093a772593dd4e28a39_GET_READ', 1, '提交的问题');
INSERT INTO `syspermission` VALUES ('3107b49684c54d51b54c45a7307228e0', 'POST', 'AUTH_3338673059d44af39b27bf4cddc15bcc_POST_UPDATE', 1, '还原提醒');
INSERT INTO `syspermission` VALUES ('3402b228fb604030a83eac3c0e94373f', 'GET', 'AUTH_d5290b702acf41f286dc3d66c659d081_GET_READ', 1, '会员卡订单');
INSERT INTO `syspermission` VALUES ('34b600ff3fd4494cb3c34af2910b9c5e', 'POST', 'AUTH_c673918d949d4cc3aa38b43660b354b8_POST_ADD', 2, '添加在线帮助');
INSERT INTO `syspermission` VALUES ('356b58ddff4a4f85aa3dd1f874964314', 'POST', 'AUTH_2a03829ee62c4283913dc440537f3fe9_POST_UPDATE', 2, '修改角色');
INSERT INTO `syspermission` VALUES ('35e6084d7dc44b1ca8e9033302969275', 'POST', 'AUTH_bd36d2aa14774c8d81b56fc7fde02b4f_POST_DELETE', 1, '删除短信接口');
INSERT INTO `syspermission` VALUES ('36001fdc50254da8a40de770517d148e', 'POST', 'AUTH_7caf26294048452cafbb5972ef502d88_POST_UPDATE', 1, '还原系统通知');
INSERT INTO `syspermission` VALUES ('36107be91fc241a282eb7de274b0fc69', 'POST', 'AUTH_7867d6ca24c94edcbd52fdb8cfe4a8de_POST_UPDATE', 1, '恢复评论');
INSERT INTO `syspermission` VALUES ('36aaf8e88b324c3b8ce50276cb83e901', 'GET', 'AUTH_ad17b7a816ea45b09be8084be966ba4b_GET_READ', 1, '问题搜索');
INSERT INTO `syspermission` VALUES ('370562231d9447c797d9c9d4df04413b', 'GET', 'AUTH_5ef5747987074212be7ef9cc9fdb50af_GET_READ', 1, '修改在线帮助页');
INSERT INTO `syspermission` VALUES ('381f2e01b83742149361cb116c106e12', 'POST', 'AUTH_da63bf83542e47bdacdada8a8abf8166_POST_DELETE', 1, '删除在线支付接口');
INSERT INTO `syspermission` VALUES ('3944c3265a08408db9c8ac3a95862cfe', 'GET', 'AUTH_a15cab18081d4ec7b85b03646b873166_GET_READ', 1, '查看支付日志');
INSERT INTO `syspermission` VALUES ('3a459f7f04b64379bea2ae724cf3f78a', 'GET', 'AUTH_ca0e7a1a86384639a025a3fab07bd963_GET_READ', 1, '问题列表');
INSERT INTO `syspermission` VALUES ('3aa152ed6319424097a29e41f3dd14d4', 'POST', 'AUTH_ef3e2b9c32634f4088f4066880c70677_POST_UPDATE', 2, '修改版块');
INSERT INTO `syspermission` VALUES ('3add22feb0064256bc19c209d14b5aeb', 'GET', 'AUTH_3d630529412f44c8be0c409bf12bbba7_GET_READ', 1, '资源文件下载');
INSERT INTO `syspermission` VALUES ('3bca1bc44826413db5693edc927dd863', 'POST', 'AUTH_2f4d3ec6741b4552a27d20781426df12_POST_UPDATE', 1, '还原');
INSERT INTO `syspermission` VALUES ('3c05fdd591c8470b8622091893ff004c', 'GET', 'AUTH_4ce5c77610864d8885298a21793732ad_GET_READ', 1, '修改标签页');
INSERT INTO `syspermission` VALUES ('3c6e8be51c62407c9d6a9072866c728d', 'GET', 'AUTH_05568f678d8e43018b884f0bba9dd600_GET_READ', 1, '在线支付接口列表');
INSERT INTO `syspermission` VALUES ('3d795b3a0b1849fb8da486151cba9b8b', 'POST', 'AUTH_aa355abf953e42078517a3dded03e785_POST_UPDATE', 2, '修改系统通知');
INSERT INTO `syspermission` VALUES ('3ddf4b633d8f474f9a8aaffd73db0482', 'GET', 'AUTH_07dc355d349a41379673ede8b926520e_GET_READ', 1, '短信发送错误日志');
INSERT INTO `syspermission` VALUES ('3f59fbbaac5c4618a7766c775050bee5', 'GET', 'AUTH_b47dd6012f88406795205481d2916fd2_GET_READ', 1, '引用评论页');
INSERT INTO `syspermission` VALUES ('3fcd60e96e85430fa99e85886804dbc5', 'POST', 'AUTH_5ef5747987074212be7ef9cc9fdb50af_POST_UPDATE', 2, '修改在线帮助');
INSERT INTO `syspermission` VALUES ('40609cc4a8d24b1cae714d3b26549718', 'POST', 'AUTH_aa971ce1dc6f43e3b026d235fa7263e6_POST_ADD', 1, '添加版块代码');
INSERT INTO `syspermission` VALUES ('4174d434346d4043935285874652531e', 'POST', 'AUTH_a5cb52cd59a040a1b34a7f401361fe31_POST_DELETE', 1, '删除私信');
INSERT INTO `syspermission` VALUES ('4474d3586efb45278d6ede01e03865c2', 'GET', 'AUTH_f0eeb58d820b48cba5368da6b80184bf_GET_READ', 1, '举报分类列表');
INSERT INTO `syspermission` VALUES ('447a7075ee9241b4b39e8976aa24709d', 'GET', 'AUTH_aa355abf953e42078517a3dded03e785_GET_READ', 1, '修改系统通知页');
INSERT INTO `syspermission` VALUES ('44b76b0928494c6d90886568188c849a', 'POST', 'AUTH_a10f02c6ecc1470fbf6d449d5b84181e_POST_DELETE', 1, '删除第三方登录接口');
INSERT INTO `syspermission` VALUES ('45cac3b5741644998511a4982e06acde', 'POST', 'AUTH_374f5b9bffd443b9b2b4a830112951cb_POST_UPDATE', 1, '恢复答案回复');
INSERT INTO `syspermission` VALUES ('46c8721b9f004ba395201bd86c49375c', 'POST', 'AUTH_43210759422e407da5f5ac5cc1f7fe3d_POST_UPDATE', 2, '修改员工自身信息');
INSERT INTO `syspermission` VALUES ('47d2591d01cf49dd8122cc9a77d16094', 'POST', 'AUTH_521ab07ea093458b8c0711c9783cfdec_POST_UPDATE', 2, '审核回复');
INSERT INTO `syspermission` VALUES ('4831ce8be1af4dd9862ab173a19907d3', 'POST', 'AUTH_8b9594bb5b8343dbadca64a4f8066b6e_POST_ADD', 2, '添加回复');
INSERT INTO `syspermission` VALUES ('490b90c22bd74cc49ffac5a8bf339cc3', 'GET', 'AUTH_d72acdb07d1540bab400c194ba3329f8_GET_READ', 1, '资源列表');
INSERT INTO `syspermission` VALUES ('4c701cb29334419fa58b66c9913532ea', 'GET', 'AUTH_82462825c1dd4ecdb3ce22e68b70f5e9_GET_READ', 1, '添加等级页');
INSERT INTO `syspermission` VALUES ('4c87a7846ac54b09bb723808825be222', 'GET', 'AUTH_1f706068a9d547dea69f89a64c89a741_GET_READ', 1, '查看');
INSERT INTO `syspermission` VALUES ('4ca50a54e8f54bb6ab063331f78a96d8', 'GET', 'AUTH_b83b0d29f07e4249b70067e00f54ef67_GET_READ', 1, '添加禁止的用户名称页');
INSERT INTO `syspermission` VALUES ('4ce1fa996a4445849b169415cfb89826', 'POST', 'AUTH_82462825c1dd4ecdb3ce22e68b70f5e9_POST_ADD', 2, '添加等级');
INSERT INTO `syspermission` VALUES ('4dbb7acd1a964ccfac105ca77368552e', 'POST', 'AUTH_2690d4cb2beb425daa06ff9faf8d97ec_POST_UPDATE', 1, '修改栏目');
INSERT INTO `syspermission` VALUES ('4e150361440b4132baf9d65563ccb6c7', 'GET', 'AUTH_5a8bd389628a4faaa96194435a14b384_GET_READ', 1, '全部待审核答案回复');
INSERT INTO `syspermission` VALUES ('4f4d36de8c024d8b8befca963b969f2e', 'GET', 'AUTH_adb6277a6b4f404faa45d94216ba30ff_GET_READ', 1, '会员卡赠送任务列表');
INSERT INTO `syspermission` VALUES ('50eb45ee72014011a3828b594988af72', 'GET', 'AUTH_088ec0225b114039aab46c17888125f2_GET_READ', 1, '点赞列表');
INSERT INTO `syspermission` VALUES ('5357d79b9cad4dc4b6b3ee3434977281', 'POST', 'AUTH_97bc7db41f8743978c70a104e49dd1c5_POST_DELETE', 1, '删除会员卡');
INSERT INTO `syspermission` VALUES ('53c95658c1a94f35bf5088be357f2d38', 'POST', 'AUTH_21a24ac2443043fbae750e4d6897e4be_POST_ADD', 2, '添加分类');
INSERT INTO `syspermission` VALUES ('5532bf13ebbc4881925c21c1aa96302c', 'GET', 'AUTH_5b89f2dc65b54197940c9f1b614c669e_GET_READ', 1, '布局列表');
INSERT INTO `syspermission` VALUES ('563c1db3575241deb84e5209af4d9df9', 'GET', 'AUTH_0faa6ccdb1d741a99f45d8ad80d7d984_GET_READ', 1, '举报列表');
INSERT INTO `syspermission` VALUES ('56d01e5582ce44b5a1cbe553a3336f21', 'GET', 'AUTH_673e0fdf492e4d97a19a761f8dcc203b_GET_READ', 1, '短信接口列表');
INSERT INTO `syspermission` VALUES ('5774f59a2f3e46388dffe8f67986c9e3', 'GET', 'AUTH_403e8ffa7ac9419a8ad7a2b4bdb27899_GET_READ', 1, '第三方登录接口列表');
INSERT INTO `syspermission` VALUES ('57ceef23523041babd9cec2026f3fd7b', 'GET', 'AUTH_44406f79d290492aa113d528da21b317_GET_READ', 1, '添加在线支付接口页');
INSERT INTO `syspermission` VALUES ('57f777df1fd84e7a9ce88da91459c4dd', 'GET', 'AUTH_ef3e2b9c32634f4088f4066880c70677_GET_READ', 1, '修改版块页');
INSERT INTO `syspermission` VALUES ('58429820b3764a56a8fda45833ec4737', 'GET', 'AUTH_453b956048b044cfb4f3df143624aa68_GET_READ', 1, '解锁话题隐藏内容分成');
INSERT INTO `syspermission` VALUES ('59e5dcf269e54f09a85a4cd474d2bf14', 'POST', 'AUTH_c51b715175a54b968e7fdfa0883cb08e_POST_DELETE', 1, '删除会员卡赠送任务');
INSERT INTO `syspermission` VALUES ('5b9a0913454e47b4bef6d3e31ae38734', 'GET', 'AUTH_9e9721bf5cad43bdba3a7adecb47726f_GET_READ', 1, '添加页');
INSERT INTO `syspermission` VALUES ('5d52c02bc2754881b37cda5efcd765c5', 'GET', 'AUTH_3c98bf1cf2294c059cf0241fba5cfa00_GET_READ', 1, '导入模板列表');
INSERT INTO `syspermission` VALUES ('5e6c9bdfffbf4622854aedb55bd2eabf', 'GET', 'AUTH_35b5f850ff1c40fcbc9e57c1f2124a1b_GET_READ', 1, '积分日志');
INSERT INTO `syspermission` VALUES ('5f2c77490e4a4106b2b4c22fb0c59aaf', 'POST', 'AUTH_922f6908c5a1434aba4b0f6f8f008c1c_POST_ADD', 2, '添加版块');
INSERT INTO `syspermission` VALUES ('5f8d5f1735d145b59282e5eb840459f7', 'POST', 'AUTH_685794fae29a45b6a5d61416b39d7f71_POST_DELETE', 1, '删除版块');
INSERT INTO `syspermission` VALUES ('606368bc5d894dc69213360eeb3f3c1d', 'GET', 'AUTH_10f76770be4040a4bf50d0efb4dce35a_GET_READ', 1, '查看敏感词');
INSERT INTO `syspermission` VALUES ('61b55531648c46f89fd561cdcea09a64', 'POST', 'AUTH_607bbd310ec147519e8f988adf4c30a6_POST_UPDATE', 2, '修改评论');
INSERT INTO `syspermission` VALUES ('621036c4c1e94863a8600c3f771ed176', 'POST', 'AUTH_a046d8a39d3b44d694d8c7720cd6a7d2_POST_DELETE', 1, '删除答案');
INSERT INTO `syspermission` VALUES ('6271f4f215a349538099bd5ac40a5ddc', 'POST', 'AUTH_9be9600772e3420a91ee019acc3ba379_POST_ADD', 2, '添加答案回复');
INSERT INTO `syspermission` VALUES ('633e13950b7540eebf0d07022784962f', 'GET', 'AUTH_11f96911716c4498b562658224750b02_GET_READ', 1, '栏目列表');
INSERT INTO `syspermission` VALUES ('6446b6074a744354a67ca2fa983c213f', 'GET', 'AUTH_e25b31db1abd48eeb81f13881e314f91_GET_READ', 1, '会员列表');
INSERT INTO `syspermission` VALUES ('64cd7f08d9f941a4965f07aaf876b41b', 'POST', 'AUTH_e7443c7b35bc44a1a60f5f6a7530905b_POST_ADD', 1, '上传敏感词库');
INSERT INTO `syspermission` VALUES ('64e00e15204f4b9e8a87a03e161d2cd6', 'GET', 'AUTH_95a1e6ab0ea64972ab36f85f2940d8e9_GET_READ', 1, '提交的答案');
INSERT INTO `syspermission` VALUES ('657d2b2dcbd44934aad101f1e304e465', 'POST', 'AUTH_afa39379327e4461b3444cf9b416efae_POST_ADD', 2, '添加系统通知');
INSERT INTO `syspermission` VALUES ('66218378244c4c4fbe640f367b170a2a', 'GET', 'AUTH_1a95dfe74bec4c0b986e9f96b001bc7e_GET_READ', 1, '取消隐藏用户');
INSERT INTO `syspermission` VALUES ('66bca0f5d7064f0fa3217eb1b4b3dff9', 'POST', 'AUTH_ab10d2b5dc5e48a69727a6292ca072b4_POST_ADD', 2, '添加缩略图裁剪尺寸');
INSERT INTO `syspermission` VALUES ('6716c5bd261d4808ba41700b69f061e8', 'POST', 'AUTH_7ed8aa6ff34241329b9183e2f114ca64_POST_ADD', 2, '添加角色');
INSERT INTO `syspermission` VALUES ('694588ee74f9488ab0d647e6e722ccc4', 'GET', 'AUTH_01fe645ae71e4925892c159e948063e9_GET_READ', 1, '私信列表');
INSERT INTO `syspermission` VALUES ('697107528fb949c5a719e3208cd00908', 'GET', 'AUTH_c76fd58d86fd44c3ac6accebc12ae7fa_GET_READ', 1, '添加角色页');
INSERT INTO `syspermission` VALUES ('6ade5a05842c4d17ba41346b74724acd', 'GET', 'AUTH_bce6c687ee5645cda651cd6dfff74fa4_GET_READ', 1, '标签列表');
INSERT INTO `syspermission` VALUES ('6b0484a6e0a54374b82846816e108b46', 'GET', 'AUTH_838e778a22c0424ab11914d1e3b44379_GET_READ', 1, '修改角色页');
INSERT INTO `syspermission` VALUES ('6be1d4d0c2e04294b83075a44f4c5a87', 'POST', 'AUTH_5d697fdf29434ff4bbcd5bc6f1a9a415_POST_ADD', 1, '立即升级');
INSERT INTO `syspermission` VALUES ('6e9b4ddd5cf34072a01953fc220a2fd5', 'GET', 'AUTH_412fd399deac43cb8354a15db3b47bbf_GET_READ', 1, '添加布局页');
INSERT INTO `syspermission` VALUES ('7058d03b34d749f78d942940581cdbca', 'POST', 'AUTH_c128236bfefd4cf3b241357733581002_POST_UPDATE', 1, '审核答案');
INSERT INTO `syspermission` VALUES ('70a4210d51a246e396fd336a83e6397e', 'GET', 'AUTH_822e43c8499149d59fd5ee6f77153d35_GET_READ', 1, '发表的回复');
INSERT INTO `syspermission` VALUES ('70aa9bea6b8b4cd4aef87b9f28782d51', 'GET', 'AUTH_a2b73c63005149699adb7fb395467b49_GET_READ', 1, '版块代码源码编辑页');
INSERT INTO `syspermission` VALUES ('72ea89819e2248a3951dbe0be592f55f', 'POST', 'AUTH_b47dd6012f88406795205481d2916fd2_POST_ADD', 2, '引用评论');
INSERT INTO `syspermission` VALUES ('73e33d43deed43ae8f631f61ea4c7d93', 'POST', 'AUTH_ab73276d43184b2db5fa5a6bd76b1def_POST_DELETE', 1, '删除布局');
INSERT INTO `syspermission` VALUES ('74e6343d6b144a24a219185e6fab2f4f', 'GET', 'AUTH_c459ab7aa99e4f528c961dd45df4d8e5_GET_READ', 1, '会员详细');
INSERT INTO `syspermission` VALUES ('7565855bdad4464a9b2ef86ae988b163', 'POST', 'AUTH_bc413423f03f4f1d8d37178ae73eb9ed_POST_UPDATE', 2, '修改在线支付接口');
INSERT INTO `syspermission` VALUES ('75e4692e5c614f5abc7d7b5810cf59d9', 'GET', 'AUTH_1a93fe93805849d68e478bb91c28480b_GET_READ', 1, '添加问题页');
INSERT INTO `syspermission` VALUES ('7607f3a5a4cf436e8186aefc5e49622d', 'POST', 'AUTH_d38488d83afa42b8a53e530ed870b2b5_POST_UPDATE', 1, '还原举报');
INSERT INTO `syspermission` VALUES ('763dd4de4298424387cf13c099fef025', 'POST', 'AUTH_cbe2d7086fee4d5390afe686e9cddad1_POST_UPDATE', 2, '修改模板');
INSERT INTO `syspermission` VALUES ('764fd678f9894d759a278734fb63d460', 'GET', 'AUTH_0e17c398c3dc46ef90657028e5a81b0f_GET_READ', 1, '问答悬赏平台分成');
INSERT INTO `syspermission` VALUES ('76ad5ec096c540d983dd318969a64f6f', 'GET', 'AUTH_c6d4bed764194be0a377be158ecdee4d_GET_READ', 1, '会员注册禁止用户名称列表');
INSERT INTO `syspermission` VALUES ('774d0cdd7c8c443e868c8192d787ff3b', 'POST', 'AUTH_9f27719619c244879c74ef032bf67684_POST_UPDATE', 2, '修改问题');
INSERT INTO `syspermission` VALUES ('7753d328281740808acf1ae0eadcbb3b', 'GET', 'AUTH_fbee16533927408789b4c0a096413635_GET_READ', 1, '角色列表');
INSERT INTO `syspermission` VALUES ('778a695cbabb4defb7e5e7d728c1ce97', 'POST', 'AUTH_59bb52174d2e4f318e0c5ed09f9bedb3_POST_ADD', 1, '资源文件上传');
INSERT INTO `syspermission` VALUES ('778b7933eb5c4171a2b53e167e22cd08', 'POST', 'AUTH_f58f9516975847fbbd8a2cd0230973f5_POST_DELETE', 1, '删除等级');
INSERT INTO `syspermission` VALUES ('78d335071bb0422badf8832a6faed506', 'GET', 'AUTH_c6e0d05a7d8a4a63b7d8b0c5ed44207f_GET_READ', 1, '登录日志');
INSERT INTO `syspermission` VALUES ('78f7f0b1dee44977a383578846eed604', 'GET', 'AUTH_64730717bf3e42169b22ff5f4529b0a8_GET_READ', 1, '话题搜索');
INSERT INTO `syspermission` VALUES ('7b4fdeb8d7014269aadf0744468743f7', 'GET', 'AUTH_d0f97697d6984656927b6dbcc9f9c4a0_GET_READ', 1, '登录日志');
INSERT INTO `syspermission` VALUES ('7dd2f764c9dd4af7aca79c1ac4c7d6ef', 'POST', 'AUTH_72f0a0a4b44f4f21a0edd0858a6bbcc5_POST_UPDATE', 1, '举报处理');
INSERT INTO `syspermission` VALUES ('7dfbd05de7a14c9f87928c90bdda2192', 'GET', 'AUTH_ae66d24114ea4cf28923f5fe8757e4e6_GET_READ', 1, '服务器节点参数');
INSERT INTO `syspermission` VALUES ('7f29278f5aaf461988e0ca6ae380c212', 'POST', 'AUTH_bc248879066f4af58c99a822f4228015_POST_DELETE', 1, '删除资源');
INSERT INTO `syspermission` VALUES ('7f4f7787832a4455aaa125a41ffad75b', 'GET', 'AUTH_95bbc26180f3435f89803a95c630a39e_GET_READ', 1, '添加会员卡赠送任务页');
INSERT INTO `syspermission` VALUES ('80fdfc5251234915924d6b310d510af7', 'GET', 'AUTH_c673918d949d4cc3aa38b43660b354b8_GET_READ', 1, '添加在线帮助页');
INSERT INTO `syspermission` VALUES ('81aec7f346434308beb898b261c90aee', 'POST', 'AUTH_4ce5c77610864d8885298a21793732ad_POST_UPDATE', 2, '修改标签');
INSERT INTO `syspermission` VALUES ('829f7bb9b92a46aab434622e36d229f8', 'GET', 'AUTH_43210759422e407da5f5ac5cc1f7fe3d_GET_READ', 1, '修改员工自身信息页');
INSERT INTO `syspermission` VALUES ('8540783c287245698b4e41c14c56e606', 'POST', 'AUTH_9c443950eb9746b49c7314dbf8e3d523_POST_UPDATE', 2, '基本设置');
INSERT INTO `syspermission` VALUES ('8556d08d0aa1479a980a2068dad291e5', 'GET', 'AUTH_90cd4aa4e6ef4154849630ae701fe37d_GET_READ', 1, '版块代码列表');
INSERT INTO `syspermission` VALUES ('857de602ce344890822d00925e094269', 'GET', 'AUTH_19d55187b06946ceac2a6c929935fa68_GET_READ', 1, '问答举报');
INSERT INTO `syspermission` VALUES ('86610021504e4daa814b0724804ff87d', 'GET', 'AUTH_21a24ac2443043fbae750e4d6897e4be_GET_READ', 1, '添加分类页');
INSERT INTO `syspermission` VALUES ('86d67b11fc0149bfad3a4189e2b94f36', 'POST', 'AUTH_e0aa4b8b3c51428eb6dd8227ffffe283_POST_UPDATE', 1, '导出模板');
INSERT INTO `syspermission` VALUES ('8761b202576a4f7189faffd32bf299ba', 'GET', 'AUTH_862368fdca464ebbb2937623648880d1_GET_READ', 1, '全部待审核话题');
INSERT INTO `syspermission` VALUES ('87af232710634e8ebab31d8d432c51da', 'GET', 'AUTH_afa39379327e4461b3444cf9b416efae_GET_READ', 1, '添加系统通知页');
INSERT INTO `syspermission` VALUES ('89404919a18c4bc5b68828c5d08a6598', 'GET', 'AUTH_cbe2d7086fee4d5390afe686e9cddad1_GET_READ', 1, '修改模板页');
INSERT INTO `syspermission` VALUES ('897746313447415da446fdb1fcae070c', 'POST', 'AUTH_c76fd58d86fd44c3ac6accebc12ae7fa_POST_ADD', 2, '添加角色');
INSERT INTO `syspermission` VALUES ('8987621aa88a4479b62d665b09e309e6', 'GET', 'AUTH_71b0cd5212874f21a2eb46d87278bc25_GET_READ', 1, '添加问题标签页');
INSERT INTO `syspermission` VALUES ('8acdceb3d436410b95c33ab0943df4bb', 'POST', 'AUTH_3a3f2b720eb74733b2e661de78decea0_POST_UPDATE', 1, '审核答案回复');
INSERT INTO `syspermission` VALUES ('8ad5245678b9413a94c7f27a181998bf', 'POST', 'AUTH_b83b0d29f07e4249b70067e00f54ef67_POST_ADD', 2, '添加禁止的用户名称');
INSERT INTO `syspermission` VALUES ('8ca6b8d1b2a74fc79126bbf910396c18', 'POST', 'AUTH_70737a78770041a18bccc71b4d17ecf8_POST_UPDATE', 1, '修改版块代码');
INSERT INTO `syspermission` VALUES ('8d30d9070cd24b5c8c42c01ab072fa47', 'GET', 'AUTH_13bc9bdcb780479bbc5cb6a43b316b27_GET_READ', 1, '添加举报分类页');
INSERT INTO `syspermission` VALUES ('8d35c5c4667747619886eda5b61e80f1', 'POST', 'AUTH_214f40c320124e839e7d0d7b00af2cbd_POST_UPDATE', 1, '删除浏览量数据');
INSERT INTO `syspermission` VALUES ('8e87baf20e6b4926979c6296e79a38ec', 'POST', 'AUTH_bf7e0ea48b264555a194ccedddf25de5_POST_UPDATE', 2, '修改第三方登录接口');
INSERT INTO `syspermission` VALUES ('8f0d0bef28c34fc59c3a643eea3ad0f2', 'GET', 'AUTH_2a90880355b44225a7e42e3a394d020c_GET_READ', 1, '升级列表');
INSERT INTO `syspermission` VALUES ('8faaec7f982d4d3b9847b955fc8d973c', 'POST', 'AUTH_1a93fe93805849d68e478bb91c28480b_POST_ADD', 2, '添加问题');
INSERT INTO `syspermission` VALUES ('8fc70392b4fd405aabdb48c7a3bae7ed', 'POST', 'AUTH_7e6b62b229a84c0fa739373313f381c0_POST_UPDATE', 2, '修改追加问题');
INSERT INTO `syspermission` VALUES ('906235e44bc1410681174f4b350bac22', 'GET', 'AUTH_be324f36fad2467688724082c285d16e_GET_READ', 1, '后台框架');
INSERT INTO `syspermission` VALUES ('90acac5c5e9e4969b2a78f0613ee6b9a', 'POST', 'AUTH_412fd399deac43cb8354a15db3b47bbf_POST_ADD', 2, '添加布局');
INSERT INTO `syspermission` VALUES ('90b572963b2747ec960c020fa46a8694', 'GET', 'AUTH_a9f67a215b034107952d40f592cf1056_GET_READ', 1, '话题举报');
INSERT INTO `syspermission` VALUES ('9117004d87d84d68992d737742a7fc98', 'GET', 'AUTH_74e391ff7c0d41aeab64e9373f16776a_GET_READ', 1, '会员卡列表');
INSERT INTO `syspermission` VALUES ('929524e601fd458993317a4f8a8be33a', 'POST', 'AUTH_75a262c3c48d4e21817541cd87fac000_POST_UPDATE', 2, '合并分类');
INSERT INTO `syspermission` VALUES ('9546840461a64c81bd080fcfffd3df0e', 'GET', 'AUTH_c09977cf64ef4a008e672a4ba8d8e004_GET_READ', 1, '全部待审核评论 ');
INSERT INTO `syspermission` VALUES ('958dd7d75ef547ea8ea0af5ed2a816c1', 'GET', 'AUTH_dcd7b0f0c5e44566b116694b96dac0e1_GET_READ', 1, '系统通知列表');
INSERT INTO `syspermission` VALUES ('9676a76072744b9b893b080389667675', 'POST', 'AUTH_a8b4ea7341944f03b4c468b0354371cc_POST_UPDATE', 1, '资源重命名');
INSERT INTO `syspermission` VALUES ('967733f255964ca3ac38a5cfdd4b3cd0', 'GET', 'AUTH_84b8ba7c751a488885fbfdeb25a0eca3_GET_READ', 1, '全部待审核问题');
INSERT INTO `syspermission` VALUES ('983b4609b07f403390d2df8b7a738bfe', 'POST', 'AUTH_baa1c014792c40edae687b4e169657ef_POST_UPDATE', 1, '重建话题索引');
INSERT INTO `syspermission` VALUES ('99014ba26f30421dbac81e489c444ebe', 'GET', 'AUTH_dd231daf558d4526bf0d95ee6cc6970e_GET_READ', 1, '数据库备份/还原列表');
INSERT INTO `syspermission` VALUES ('99175b2b7be34a6fb29d4a7fc953a56f', 'GET', 'AUTH_bf7e0ea48b264555a194ccedddf25de5_GET_READ', 1, '修改第三方登录接口页');
INSERT INTO `syspermission` VALUES ('99999999999999999999999999999999', NULL, 'AUTH_ADMIN', 99999999, '查看');
INSERT INTO `syspermission` VALUES ('99d76e6d914d42cf9765ff1b6927d1f7', 'POST', 'AUTH_8dab213a3c11412795f51a834ba6bd05_POST_UPDATE', 1, '采纳答案');
INSERT INTO `syspermission` VALUES ('9b6b32f8e1d74a12ae60eff39caa5e1e', 'GET', 'AUTH_4de9ba43424146678772a69d0cd6ea4d_GET_READ', 1, '下载导出模板');
INSERT INTO `syspermission` VALUES ('9cd6aa6943934ec9b1b5dbe67edd6308', 'GET', 'AUTH_9c443950eb9746b49c7314dbf8e3d523_GET_READ', 1, '基本设置页');
INSERT INTO `syspermission` VALUES ('9ced5b62c30940c7ba9a7b4f33d46ad3', 'GET', 'AUTH_0667a23692b244178cda49b8c8aa66bb_GET_READ', 1, '发红包');
INSERT INTO `syspermission` VALUES ('9f6f4a6813354cd99d2ffa4bf5397759', 'POST', 'AUTH_6b17f9cef55a4705a8ff445c5eb37e0e_POST_UPDATE', 1, '资源文件编辑');
INSERT INTO `syspermission` VALUES ('9fc9acd39cfb42e1960472bda97f87ce', 'POST', 'AUTH_0e2aa6a61c994088819af6a79c519ebf_POST_ADD', 1, '添加栏目');
INSERT INTO `syspermission` VALUES ('a1b1c49fc8f64d9aa7497d5b25816eee', 'GET', 'AUTH_407a285c7ec744a4b284b85339c296ec_GET_READ', 1, '查看话题');
INSERT INTO `syspermission` VALUES ('a2265142da1a43cd93794d3450935e03', 'POST', 'AUTH_face85b769b94dc489e719551eb58bbd_POST_UPDATE', 2, '修改');
INSERT INTO `syspermission` VALUES ('a3358191e3084c8a906fdd3fcd23cf65', 'GET', 'AUTH_71e587d45b384855831dcfa5db98f8fe_GET_READ', 1, '修改答案回复页');
INSERT INTO `syspermission` VALUES ('a39091a91e8146ba89b69577970cabfe', 'POST', 'AUTH_13bc9bdcb780479bbc5cb6a43b316b27_POST_ADD', 2, '添加举报分类');
INSERT INTO `syspermission` VALUES ('a4421d798f254077ab73cb440d23b126', 'POST', 'AUTH_a2b73c63005149699adb7fb395467b49_POST_UPDATE', 2, '版块代码源码编辑');
INSERT INTO `syspermission` VALUES ('a65e7b106ae7449880200557e60d014e', 'POST', 'AUTH_0e80dcd0f37940658faf50a8f3f9c331_POST_UPDATE', 1, '清空系统所有缓存');
INSERT INTO `syspermission` VALUES ('a6a211b1bc5b4c31a4b444ccddfc9c1b', 'GET', 'AUTH_7dee9a00f4dc474fa502cf0f8bc83224_GET_READ', 1, '添加会员注册项页');
INSERT INTO `syspermission` VALUES ('a75786d463494a21b2d8e0664141e92a', 'GET', 'AUTH_76ffb8fb053647c5b5905b0f605104fe_GET_READ', 1, '全部待审核答案');
INSERT INTO `syspermission` VALUES ('a8e77195a8ba42b3880f4d6935f8d1a1', 'GET', 'AUTH_8f440666921741ed8c4804732b34d75d_GET_READ', 1, '修改话题页');
INSERT INTO `syspermission` VALUES ('a97915e1f0864c9c93a88f268284df5f', 'GET', 'AUTH_8b9594bb5b8343dbadca64a4f8066b6e_GET_READ', 1, '添加回复页');
INSERT INTO `syspermission` VALUES ('a97984e18c42486bae7b5b9709309981', 'GET', 'AUTH_a7f6e1dcc5e943f48f4270dcfa056557_GET_READ', 1, '粉丝列表');
INSERT INTO `syspermission` VALUES ('aa7e41324b0d49f085fcbb400355f970', 'POST', 'AUTH_9e9721bf5cad43bdba3a7adecb47726f_POST_ADD', 2, '添加');
INSERT INTO `syspermission` VALUES ('aa95f8a8cc5542ee828b889f22583210', 'POST', 'AUTH_c4ab05ec118740c4bb01395e5e519332_POST_DELETE', 1, '删除');
INSERT INTO `syspermission` VALUES ('ace2d0e6f02f4189b08a63380f4f6b5a', 'POST', 'AUTH_ff3bfef595c1473a9dd2a1ba279ca010_POST_ADD', 1, '上传升级包');
INSERT INTO `syspermission` VALUES ('ad186f105f5344908a66dac76dbf7d06', 'POST', 'AUTH_5af3e8652bd14b48aea03fac91e1e0b7_POST_UPDATE', 2, '修改布局');
INSERT INTO `syspermission` VALUES ('ae95e0c103e7461f980bd9ab9fe50535', 'GET', 'AUTH_c5d0d01bf7b544828e1fbf3d61b9dd8a_GET_READ', 1, '用户举报');
INSERT INTO `syspermission` VALUES ('aeb1ad5106554199bb6c16dfe6597c92', 'GET', 'AUTH_f6518fc5a5f84c11a5a569c493218f8f_GET_READ', 1, '压缩文件列表');
INSERT INTO `syspermission` VALUES ('aeb36a2e6c8848a7a35223e8961cfed4', 'POST', 'AUTH_7dee9a00f4dc474fa502cf0f8bc83224_POST_ADD', 2, '添加会员注册项');
INSERT INTO `syspermission` VALUES ('afb57aa600074540a550b5762f7aa6db', 'POST', 'AUTH_b697a7d318d34693b5e1f50988bcb325_POST_UPDATE', 1, '恢复评论回复');
INSERT INTO `syspermission` VALUES ('afd21f54283045338293c83b9d287603', 'POST', 'AUTH_38c92008f5754e348302c79498961747_POST_DELETE', 1, '删除举报分类');
INSERT INTO `syspermission` VALUES ('aff1310185ef404ba5fae9faff402468', 'GET', 'AUTH_8dd0e634ff4647e0b438b75fbde1148f_GET_READ', 1, '修改会员卡页');
INSERT INTO `syspermission` VALUES ('b0087f154eaf40be87fa3675768fd414', 'GET', 'AUTH_336407134b204deebb6d335ffe080612_GET_READ', 1, '修改问题标签页');
INSERT INTO `syspermission` VALUES ('b01cdaa1a9b14ba6970a31506f56ff23', 'POST', 'AUTH_eadf2a9785af45b08c5c42d6b1263133_POST_UPDATE', 1, '重建问题索引');
INSERT INTO `syspermission` VALUES ('b09e8b722bd6426388e7694a371cd9fd', 'POST', 'AUTH_e08a84e681ea4850be0a33c1f6d4c5f0_POST_DELETE', 1, '删除回复');
INSERT INTO `syspermission` VALUES ('b0d6061db5e24b2aa9b648b82acbca5e', 'POST', 'AUTH_5e5fc2f249c144f198b3aad24f665cdd_POST_DELETE', 1, '删除压缩文件');
INSERT INTO `syspermission` VALUES ('b1d0484dce464b06900be842cb6487a9', 'POST', 'AUTH_a0116147816444319d37e0e1562189b0_POST_DELETE', 1, '删除版块代码');
INSERT INTO `syspermission` VALUES ('b2b558e723eb4d75ae4c35c8b36b5c64', 'POST', 'AUTH_a1e816f03692448698b01a7ac01d2964_POST_ADD', 2, '添加话题');
INSERT INTO `syspermission` VALUES ('b343696f562c437facda8fb136de09c9', 'POST', 'AUTH_c370e4821b0e45b6946a7ab3181b3844_POST_DELETE', 1, '删除系统通知');
INSERT INTO `syspermission` VALUES ('b3db3d9edfc54405b520c044d805c496', 'GET', 'AUTH_db27cdfec51a4c30a066319ff6f08bb9_GET_READ', 1, '会员卡赠送项列表(获赠用户)');
INSERT INTO `syspermission` VALUES ('b5c65a65008a46e3a9894825b98b182e', 'GET', 'AUTH_2e51f370f3c34d0bbfaf4a9f1ca7ee02_GET_READ', 1, '数据库还原页');
INSERT INTO `syspermission` VALUES ('b6506ade40334589b8d7f9a469645be5', 'GET', 'AUTH_ef3c77fb708c4775988e888f0e9186d4_GET_READ', 1, '员工列表');
INSERT INTO `syspermission` VALUES ('b6d19989f45c4c918a5588d5d339893a', 'POST', 'AUTH_c74888ede5e74dce8a656d722836d8b1_POST_UPDATE', 2, '修改答案');
INSERT INTO `syspermission` VALUES ('b6e330a0c462407590a51a6e1063677a', 'POST', 'AUTH_b0857fe7e73e487798150bd09b2063f6_POST_UPDATE', 1, '取消采纳答案');
INSERT INTO `syspermission` VALUES ('b6eeebf8952b4bc9a74b2e143911441d', 'GET', 'AUTH_6b12cf5fb0ce4927979775f3c76419ab_GET_READ', 1, '数据库备份页');
INSERT INTO `syspermission` VALUES ('b7b2dba53e1e41c98c15f1689a90d00b', 'POST', 'AUTH_27ac945d8df8433894da098a1192476d_POST_DELETE', 1, '删除角色');
INSERT INTO `syspermission` VALUES ('b8c3e2f7114e414b8fb99e001bdc1ca4', 'GET', 'AUTH_87ad98da3e7642e68109c33199968181_GET_READ', 1, '在线帮助分类列表');
INSERT INTO `syspermission` VALUES ('b98179ff230b4c8baf7abd8affb33468', 'GET', 'AUTH_fd7988fae4484db7a98a1d67b6d54cdc_GET_READ', 1, '全部待审核回复');
INSERT INTO `syspermission` VALUES ('bb1867da82bc4bf9ba1c404f7de7e0a4', 'GET', 'AUTH_607bbd310ec147519e8f988adf4c30a6_GET_READ', 1, '修改评论页');
INSERT INTO `syspermission` VALUES ('bb27abfac38e466db47a10922057429c', 'GET', 'AUTH_5c9e1ad37d2241d6b5eebe4d591f5da5_GET_READ', 1, '支付日志');
INSERT INTO `syspermission` VALUES ('bb4ca5ddf1884eb38e667274445372d7', 'GET', 'AUTH_e050f5451e4f4f7dba6c2cb51f7c393e_GET_READ', 1, '修改短信接口页');
INSERT INTO `syspermission` VALUES ('bb8ada1fcff747a7868d17bebda7e0f2', 'POST', 'AUTH_5485ebcbc00541458cd96eb6deda2eab_POST_UPDATE', 1, '审核评论');
INSERT INTO `syspermission` VALUES ('bc3cdb8d556f48098fdbb1bbb06bd273', 'POST', 'AUTH_71b0cd5212874f21a2eb46d87278bc25_POST_ADD', 2, '添加问题标签');
INSERT INTO `syspermission` VALUES ('c095eeeee5064a739c7856ffaf8a7e60', 'GET', 'AUTH_3b87a0950675425d9b46b0a9526acb46_GET_READ', 1, '追加问题页');
INSERT INTO `syspermission` VALUES ('c2442a047cc940cb862f97ae1fb4a21f', 'GET', 'AUTH_2a34da73c3ca436e9fb658f8a1639895_GET_READ', 1, '提交的答案回复');
INSERT INTO `syspermission` VALUES ('c418cc0799d1495aa02ab635819bf6fb', 'POST', 'AUTH_bee77a45dcdb428db42dcb2317648fe9_POST_UPDATE', 2, '修改员工');
INSERT INTO `syspermission` VALUES ('c4a175eaf6eb4e34b94bea54018391b1', 'GET', 'AUTH_042dc8a1921d4232bf4b01817011a960_GET_READ', 1, '发表的话题');
INSERT INTO `syspermission` VALUES ('c4c47e534e3048ed839d5a637b07020c', 'POST', 'AUTH_6b12cf5fb0ce4927979775f3c76419ab_POST_ADD', 2, '数据库备份');
INSERT INTO `syspermission` VALUES ('c511a5d43fd2483c9980a3ddd774caa7', 'GET', 'AUTH_8ce45be5ea284190b9d76138d8d5f6b2_GET_READ', 1, '打包文件页');
INSERT INTO `syspermission` VALUES ('c5491e097dfa4571b8a0b7117c79c978', 'POST', 'AUTH_d885d220f87a4b1a928e3eb93f922c02_POST_DELETE', 1, '删除升级包');
INSERT INTO `syspermission` VALUES ('c59de06e2db1498e97920d0d51ce8f32', 'POST', 'AUTH_d3f057d1100a4a79b97ab9715e01be04_POST_ADD_POST_UPDATE', 2, '添加标签');
INSERT INTO `syspermission` VALUES ('c60995081b5a434eab404e350a181d66', 'GET', 'AUTH_9a797b54d630450cb3cfadb1f2d94243_GET_READ', 1, '会员卡订单列表');
INSERT INTO `syspermission` VALUES ('c706d0be75314aefadedad63df77b056', 'POST', 'AUTH_336407134b204deebb6d335ffe080612_POST_UPDATE', 2, '修改问题标签');
INSERT INTO `syspermission` VALUES ('c767b5f6098c46deb20d0d0dd943e5a5', 'GET', 'AUTH_b0e69631d5a34c12acdf7125e5598d84_GET_READ', 1, '添加第三方登录接口页');
INSERT INTO `syspermission` VALUES ('c78f3947c772431bb95dfbad58fe0fc3', 'GET', 'AUTH_75349725155243d2932fc754cea5f3ab_GET_READ', 1, '浏览量列表');
INSERT INTO `syspermission` VALUES ('c875a39da823436e8a77f4c251096dd4', 'POST', 'AUTH_0d5362ae1983422fa01bc03c079c850f_POST_DELETE', 1, '删除评论');
INSERT INTO `syspermission` VALUES ('c932f31b97a947d4a123222d8ae7fe92', 'GET', 'AUTH_557735f0f8ba4626b78224719e77cea3_GET_READ', 1, '修改禁止的用户名称页');
INSERT INTO `syspermission` VALUES ('ca00b2ec92d54b21b57b823a72f1024e', 'GET', 'AUTH_4bac717853cb4a7faf79905ea6cad412_GET_READ', 1, '版块源码编辑页');
INSERT INTO `syspermission` VALUES ('caeb9888ba65418d8a757ed91c69fe26', 'POST', 'AUTH_43c2cd191bd14af18ecabe5fa81b60cc_POST_DELETE', 1, '删除分类');
INSERT INTO `syspermission` VALUES ('cb3b881e83474c4cb19990a573d3b0da', 'POST', 'AUTH_95bbc26180f3435f89803a95c630a39e_POST_ADD', 2, '添加会员卡赠送任务');
INSERT INTO `syspermission` VALUES ('cb607ae60b204da3b2c80c85929a190d', 'GET', 'AUTH_52bc2dbe4c0e437ebf93ce8b6575c6bb_GET_READ', 1, '修改页');
INSERT INTO `syspermission` VALUES ('cb64a997e4c3494e861899acc09c6a28', 'POST', 'AUTH_b0e69631d5a34c12acdf7125e5598d84_POST_ADD', 2, '添加第三方登录接口');
INSERT INTO `syspermission` VALUES ('cbc6da71f75d4ac582d0e88f257e7669', 'POST', 'AUTH_c027259a21a240d48b73c1683a346056_POST_DELETE', 1, '删除禁止的用户名称');
INSERT INTO `syspermission` VALUES ('cc2b89e39e374669980b67dabbd727eb', 'GET', 'AUTH_bc413423f03f4f1d8d37178ae73eb9ed_GET_READ', 1, '修改在线支付接口页');
INSERT INTO `syspermission` VALUES ('cc4fc4640905436a8fafe8533ffbe18f', 'GET', 'AUTH_face85b769b94dc489e719551eb58bbd_GET_READ', 1, '修改页');
INSERT INTO `syspermission` VALUES ('cd62c57b27af4b95bf3e9b868c318e98', 'GET', 'AUTH_399207e1956d465a8eb536e80ee5f5f0_GET_READ', 1, '系统通知列表');
INSERT INTO `syspermission` VALUES ('cd6e65c8117d47d6b905cd699953440d', 'POST', 'AUTH_e4d93f4f930a455f85868cfd5480f5d0_POST_DELETE', 1, '删除缩略图裁剪尺寸');
INSERT INTO `syspermission` VALUES ('ceb28608464548d58f191f29e987c858', 'GET', 'AUTH_607959c1d66c4900835c30532ebf656e_GET_READ', 1, '查看问题');
INSERT INTO `syspermission` VALUES ('cfe10d0e303b4eb1acfb725110af3570', 'GET', 'AUTH_c74888ede5e74dce8a656d722836d8b1_GET_READ', 1, '修改答案页');
INSERT INTO `syspermission` VALUES ('d17cf7897d1f42cbbfdc509ebf5f38de', 'GET', 'AUTH_515cd5fbdd72423ca083d3f44217fd25_GET_READ', 1, '添加短信接口页');
INSERT INTO `syspermission` VALUES ('d1c449631db742d79f5426739f8bbed7', 'POST', 'AUTH_557735f0f8ba4626b78224719e77cea3_POST_UPDATE', 2, '修改禁止的用户名称');
INSERT INTO `syspermission` VALUES ('d2912b5dd3b84ab396c0a87210e3ab30', 'POST', 'AUTH_b77f796a65694fed859fe1684d365589_POST_UPDATE', 1, '目录重命名');
INSERT INTO `syspermission` VALUES ('d39647de8f5b4b2b844a4eb9fc089c8e', 'GET', 'AUTH_d8ad4df8213e491c96bd143e1eec7b4c_GET_READ', 1, '收藏用户');
INSERT INTO `syspermission` VALUES ('d443ecbbb48d48a0adb0df74140510da', 'POST', 'AUTH_8f440666921741ed8c4804732b34d75d_POST_UPDATE', 2, '修改话题');
INSERT INTO `syspermission` VALUES ('d53a434d16b14b23b79bf31dee90a1ea', 'POST', 'AUTH_51a9dc467fb54948a1c71dc2365b5049_POST_UPDATE', 1, '删除用户登录日志数据');
INSERT INTO `syspermission` VALUES ('d7afdec202d44a85ad3239987d2fcf00', 'POST', 'AUTH_000d1e49b1984cceacaf4dbc2a38be86_POST_DELETE', 1, '删除标签');
INSERT INTO `syspermission` VALUES ('d7b687d7dd9e4b758dbc143625915076', 'POST', 'AUTH_4bac717853cb4a7faf79905ea6cad412_POST_UPDATE', 2, '版块源码编辑');
INSERT INTO `syspermission` VALUES ('d98a8e8c57b64a8fb89f7a0d994978eb', 'POST', 'AUTH_a4775968ad2e4b238ed49b4e4808a011_POST_UPDATE', 2, '修改回复');
INSERT INTO `syspermission` VALUES ('da0dad28fa434e9190fe67619c28bf59', 'POST', 'AUTH_c418c587feb14ecfabd9690d9f52d440_POST_UPDATE', 1, '还原私信');
INSERT INTO `syspermission` VALUES ('da332d9db98e4ce7b9023a9e76752ad3', 'GET', 'AUTH_a1e816f03692448698b01a7ac01d2964_GET_READ', 1, '添加话题页');
INSERT INTO `syspermission` VALUES ('dbc37f628d514de99469585bb89d4a45', 'POST', 'AUTH_31f98ef57f0a48a69c0ebb36c920dd1f_POST_DELETE', 1, '删除角色');
INSERT INTO `syspermission` VALUES ('dc1ba71e0da24d53a552beb64d1e3505', 'POST', 'AUTH_129aa71dc14049ccb0715268f24281aa_POST_ADD', 1, '上传模板');
INSERT INTO `syspermission` VALUES ('dca0b9b3bf664e9795c63bcf78633946', 'POST', 'AUTH_938b9dff2a27416abf6ae6ac21eaaaad_POST_DELETE', 1, '删除问题');
INSERT INTO `syspermission` VALUES ('dd280caa96f24e5b96a586071a7e6ff1', 'POST', 'AUTH_515cd5fbdd72423ca083d3f44217fd25_POST_ADD', 2, '添加短信接口');
INSERT INTO `syspermission` VALUES ('ddab9ef583b84da78fb60d2505430396', 'POST', 'AUTH_66af4e938332484f8a4f6e764a1d106c_POST_UPDATE', 2, '修改会员注册项');
INSERT INTO `syspermission` VALUES ('de2ae43b2077478ead903fa969172e1c', 'POST', 'AUTH_c0b306017906415abce45445b5606bd6_POST_ADD', 2, '添加答案');
INSERT INTO `syspermission` VALUES ('de484d1d48ce4b42b086f51b62af403f', 'GET', 'AUTH_9f27719619c244879c74ef032bf67684_GET_READ', 1, '修改问题页');
INSERT INTO `syspermission` VALUES ('dec929f879a74636a22f2f4992470c5d', 'POST', 'AUTH_b805b7dbbf0140b2a2fcb962e3fe4a4d_POST_UPDATE', 2, '修改分类');
INSERT INTO `syspermission` VALUES ('dfe6741a3fce4ba0832d21843099a5ea', 'POST', 'AUTH_0d91dbfe06594b8c82e72d525d9dc229_POST_UPDATE', 1, '注销账号');
INSERT INTO `syspermission` VALUES ('e04459a1d0b749ff9d619941fe747750', 'GET', 'AUTH_d2a54b45642a42fcac64fb15f1ac78e2_GET_READ', 1, '友情链接列表');
INSERT INTO `syspermission` VALUES ('e189c9ff166d48f19369852c9bee511a', 'GET', 'AUTH_58dc8b9d637a4ceda36b7083cd94bb76_GET_READ', 1, '关注列表');
INSERT INTO `syspermission` VALUES ('e2623b25d9884cfe9cb0a93b785d8362', 'GET', 'AUTH_7db8b118e2ec4ce9992e027eddda1648_GET_READ', 1, '版块列表');
INSERT INTO `syspermission` VALUES ('e2e27149dde94c078489038669e19e58', 'GET', 'AUTH_d3f057d1100a4a79b97ab9715e01be04_GET_READ', 1, '添加标签页');
INSERT INTO `syspermission` VALUES ('e38df097dc62482382dcf1bafe82ab6b', 'GET', 'AUTH_2a03829ee62c4283913dc440537f3fe9_GET_READ', 1, '修改角色页');
INSERT INTO `syspermission` VALUES ('e3e1aa79ab624d338eca2ba5be687262', 'GET', 'AUTH_32361852ba844d1f9ccdb220ce3b3cb1_GET_READ', 1, '版块引用代码');
INSERT INTO `syspermission` VALUES ('e3f8ebac87ad41559185caeaab6b5f3f', 'POST', 'AUTH_3507e6049b6843c39d8d31b6e384818f_POST_UPDATE', 2, '修改举报分类');
INSERT INTO `syspermission` VALUES ('e4033ddf5bf14ea19249242cf83e5662', 'POST', 'AUTH_1ac87d3f1c0f4c99b9fdd9b713e304bf_POST_UPDATE', 1, '移动在线帮助');
INSERT INTO `syspermission` VALUES ('e587d664edc04f1199c76922c6444a43', 'GET', 'AUTH_66af4e938332484f8a4f6e764a1d106c_GET_READ', 1, '修改会员注册项页');
INSERT INTO `syspermission` VALUES ('e5b92c26f1d24283898773c273b6aaab', 'GET', 'AUTH_ab10d2b5dc5e48a69727a6292ca072b4_GET_READ', 1, '添加缩略图裁剪尺寸页');
INSERT INTO `syspermission` VALUES ('e76cfef15b7846b9a5e76f735e7f6026', 'GET', 'AUTH_f14133ca94274ff197996e059a26ad49_GET_READ', 1, '修改会员卡赠送任务页');
INSERT INTO `syspermission` VALUES ('e96baee9362449d7b498fb527dec1d54', 'POST', 'AUTH_7f22ef589ea74b1c874b10fa6cd36b99_POST_DELETE', 1, '删除话题');
INSERT INTO `syspermission` VALUES ('e9e06c93c05e4ccb9ad29c8eb7872905', 'GET', 'AUTH_3507e6049b6843c39d8d31b6e384818f_GET_READ', 1, '修改举报分类页');
INSERT INTO `syspermission` VALUES ('eaa9d9d6a58b4e999ced0cd59194968a', 'GET', 'AUTH_7c539b8a982e45339ce7fb108e7b67ad_GET_READ', 1, '问答点赞用户');
INSERT INTO `syspermission` VALUES ('eb186fe0b20447fba47e45846b51c344', 'POST', 'AUTH_e050f5451e4f4f7dba6c2cb51f7c393e_POST_UPDATE', 2, '修改短信接口');
INSERT INTO `syspermission` VALUES ('ec871e4a3c7842309abc22e3f6b9a1c3', 'POST', 'AUTH_9c5bebaa673b45bd9d1c5cba7a9dead9_POST_ADD', 1, '导入模板');
INSERT INTO `syspermission` VALUES ('ecd38983cce54e65b9b465c70c9c484e', 'GET', 'AUTH_7ed8aa6ff34241329b9183e2f114ca64_GET_READ', 1, '添加角色页');
INSERT INTO `syspermission` VALUES ('ed9b869a6fec4b63a8ab2b6ad181e301', 'GET', 'AUTH_39adfb4206024d14ab38822555314e7a_GET_READ', 1, '修改举报页');
INSERT INTO `syspermission` VALUES ('edcfef9b3d58434cbccebb85cc192bf7', 'GET', 'AUTH_803dc508fa8542f1a2be86cdb85b19f1_GET_READ', 1, '会员角色列表');
INSERT INTO `syspermission` VALUES ('ede920bcd4a7443ab7bc61e24994468e', 'POST', 'AUTH_032710d13fbe479686fff302b9e2a2ce_POST_UPDATE', 1, '还原话题');
INSERT INTO `syspermission` VALUES ('f0da7798ecc74190ab17da47634e5401', 'POST', 'AUTH_2c60d084290e4ac196c490864a292ae1_POST_UPDATE', 1, '启用短信接口');
INSERT INTO `syspermission` VALUES ('f1939cc01644444bba162f2a8325b91a', 'POST', 'AUTH_3aa16023dbcd43cb8ccba4352f9b7e58_POST_DELETE', 1, '删除追加问题');
INSERT INTO `syspermission` VALUES ('f19ccdc2eeea49939b4ed4c0cd3c0b49', 'GET', 'AUTH_abdea9b5ed4c4636a55062cf4f36ea0a_GET_READ', 1, '查看在线帮助');
INSERT INTO `syspermission` VALUES ('f2516b2ddfb44106a6c0c2f74201f4e9', 'GET', 'AUTH_6a87425f50f14afc98ebcc42c1e54637_GET_READ', 1, '会员等级列表');
INSERT INTO `syspermission` VALUES ('f25dd684c4954768ab254a9693a3b8af', 'POST', 'AUTH_1800baca07bc44ac986556dd30d37254_POST_ADD', 1, '资源新建文件夹');
INSERT INTO `syspermission` VALUES ('f36038f6f48040d9ba40b94342490736', 'POST', 'AUTH_f285c691b0f74b9ca549344722e5d780_POST_DELETE', 1, '删除栏目');
INSERT INTO `syspermission` VALUES ('f399670d423442909dadfe3238915cb8', 'GET', 'AUTH_70889956fee3475fb8487313d46f94c7_GET_READ', 1, '添加模板页');
INSERT INTO `syspermission` VALUES ('f574660f6bd24202aec13b86d95e7da9', 'POST', 'AUTH_7e763e0f214d42bfb2ba3cbeb9178c56_POST_DELETE', 1, '删除员工');
INSERT INTO `syspermission` VALUES ('f871f8eb397e40b9bd69b4496942875b', 'POST', 'AUTH_2e51f370f3c34d0bbfaf4a9f1ca7ee02_POST_ADD', 2, '数据库还原');
INSERT INTO `syspermission` VALUES ('fa3278919bba435e857a341de20f95c2', 'POST', 'AUTH_44406f79d290492aa113d528da21b317_POST_ADD', 2, '添加在线支付接口');
INSERT INTO `syspermission` VALUES ('fab2055b35d040d9b28f02c6630c630f', 'POST', 'AUTH_3c7306248d7a4788894ca4d9107e233e_POST_UPDATE', 1, '修改数据库密码');
INSERT INTO `syspermission` VALUES ('fb848a5fa3bf46919f54044aa3bb7c6f', 'GET', 'AUTH_4c891b4c92af4f6783e6b7d1b245e345_GET_READ', 1, '收藏夹列表');
INSERT INTO `syspermission` VALUES ('fc7adea930dc418886e8f791fce7dd8f', 'POST', 'AUTH_ad32af8a5d784a979da7b5362ca77882_POST_UPDATE', 1, '模板设为使用');
INSERT INTO `syspermission` VALUES ('fcd89db7a4fc4c25ad967366a3f9d19f', 'GET', 'AUTH_3b5ccd12071e49ccac480cc55b3f520a_GET_READ', 1, '收藏用户');
INSERT INTO `syspermission` VALUES ('fdde776dc2f44554871b0706b5fe89fc', 'POST', 'AUTH_7710a45b7cfa484183ee104ffe20f6c4_POST_DELETE', 1, '删除问题标签');

-- ----------------------------
-- Table structure for syspermissionresources
-- ----------------------------
DROP TABLE IF EXISTS `syspermissionresources`;
CREATE TABLE `syspermissionresources`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `resourceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1558 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syspermissionresources
-- ----------------------------
INSERT INTO `syspermissionresources` VALUES (48, '99999999999999999999999999999999', '4da6c6c0d67b49b7879bc160eac08c32');
INSERT INTO `syspermissionresources` VALUES (399, '2b07e05a06784b4c8095ce0345b407a1', 'f365c635400e47eda1fc10589d7dbbcd');
INSERT INTO `syspermissionresources` VALUES (400, '6446b6074a744354a67ca2fa983c213f', 'e25b31db1abd48eeb81f13881e314f91');
INSERT INTO `syspermissionresources` VALUES (401, '0e5fa569a5584aacadc631e738257aeb', 'a02b3694e4d542398d3a39f4156e992f');
INSERT INTO `syspermissionresources` VALUES (402, '2059b44286c3402c84e89d5d449eb305', 'a02b3694e4d542398d3a39f4156e992f');
INSERT INTO `syspermissionresources` VALUES (405, 'aa95f8a8cc5542ee828b889f22583210', 'c4ab05ec118740c4bb01395e5e519332');
INSERT INTO `syspermissionresources` VALUES (406, '3bca1bc44826413db5693edc927dd863', '2f4d3ec6741b4552a27d20781426df12');
INSERT INTO `syspermissionresources` VALUES (413, 'cc4fc4640905436a8fafe8533ffbe18f', 'face85b769b94dc489e719551eb58bbd');
INSERT INTO `syspermissionresources` VALUES (414, 'a2265142da1a43cd93794d3450935e03', 'face85b769b94dc489e719551eb58bbd');
INSERT INTO `syspermissionresources` VALUES (425, '5e6c9bdfffbf4622854aedb55bd2eabf', '35b5f850ff1c40fcbc9e57c1f2124a1b');
INSERT INTO `syspermissionresources` VALUES (426, '7b4fdeb8d7014269aadf0744468743f7', 'd0f97697d6984656927b6dbcc9f9c4a0');
INSERT INTO `syspermissionresources` VALUES (431, 'f2516b2ddfb44106a6c0c2f74201f4e9', '6a87425f50f14afc98ebcc42c1e54637');
INSERT INTO `syspermissionresources` VALUES (432, '4c701cb29334419fa58b66c9913532ea', '82462825c1dd4ecdb3ce22e68b70f5e9');
INSERT INTO `syspermissionresources` VALUES (433, '4ce1fa996a4445849b169415cfb89826', '82462825c1dd4ecdb3ce22e68b70f5e9');
INSERT INTO `syspermissionresources` VALUES (434, '0bee0cbdc5514c02adf8f0910971c90f', '9246901afe1b4d3fb501c3fc51be23c5');
INSERT INTO `syspermissionresources` VALUES (435, '22d30d3080cc422e8878470f6db173fc', '9246901afe1b4d3fb501c3fc51be23c5');
INSERT INTO `syspermissionresources` VALUES (437, '778b7933eb5c4171a2b53e167e22cd08', 'f58f9516975847fbbd8a2cd0230973f5');
INSERT INTO `syspermissionresources` VALUES (438, '19facbaf34104cad9e532d40286753e7', '27af89b4f9344c73b1b792334e7fdfe2');
INSERT INTO `syspermissionresources` VALUES (439, 'a6a211b1bc5b4c31a4b444ccddfc9c1b', '7dee9a00f4dc474fa502cf0f8bc83224');
INSERT INTO `syspermissionresources` VALUES (440, 'aeb36a2e6c8848a7a35223e8961cfed4', '7dee9a00f4dc474fa502cf0f8bc83224');
INSERT INTO `syspermissionresources` VALUES (441, 'e587d664edc04f1199c76922c6444a43', '66af4e938332484f8a4f6e764a1d106c');
INSERT INTO `syspermissionresources` VALUES (442, 'ddab9ef583b84da78fb60d2505430396', '66af4e938332484f8a4f6e764a1d106c');
INSERT INTO `syspermissionresources` VALUES (444, '2d5b3555fd764225bbdd1e8787d8198f', '513d70ed7f3e46eb91f8ea4bbfc89317');
INSERT INTO `syspermissionresources` VALUES (448, 'b6506ade40334589b8d7f9a469645be5', 'ef3c77fb708c4775988e888f0e9186d4');
INSERT INTO `syspermissionresources` VALUES (454, '78d335071bb0422badf8832a6faed506', 'c6e0d05a7d8a4a63b7d8b0c5ed44207f');
INSERT INTO `syspermissionresources` VALUES (456, '7753d328281740808acf1ae0eadcbb3b', 'fbee16533927408789b4c0a096413635');
INSERT INTO `syspermissionresources` VALUES (457, '697107528fb949c5a719e3208cd00908', 'c76fd58d86fd44c3ac6accebc12ae7fa');
INSERT INTO `syspermissionresources` VALUES (458, '897746313447415da446fdb1fcae070c', 'c76fd58d86fd44c3ac6accebc12ae7fa');
INSERT INTO `syspermissionresources` VALUES (462, 'e38df097dc62482382dcf1bafe82ab6b', '2a03829ee62c4283913dc440537f3fe9');
INSERT INTO `syspermissionresources` VALUES (463, '356b58ddff4a4f85aa3dd1f874964314', '2a03829ee62c4283913dc440537f3fe9');
INSERT INTO `syspermissionresources` VALUES (467, '2eb3a442ae964e03b0626dee0115a7cd', 'efa66bc116bc409fbf7bf23e4882d2d9');
INSERT INTO `syspermissionresources` VALUES (468, '1f394709c4b74ac5a982ceea26a42d6e', 'efa66bc116bc409fbf7bf23e4882d2d9');
INSERT INTO `syspermissionresources` VALUES (469, '21d93e122d3a4df4ac1b4748ef5a99a7', 'bee77a45dcdb428db42dcb2317648fe9');
INSERT INTO `syspermissionresources` VALUES (470, 'c418cc0799d1495aa02ab635819bf6fb', 'bee77a45dcdb428db42dcb2317648fe9');
INSERT INTO `syspermissionresources` VALUES (471, 'f574660f6bd24202aec13b86d95e7da9', '7e763e0f214d42bfb2ba3cbeb9178c56');
INSERT INTO `syspermissionresources` VALUES (472, 'b7b2dba53e1e41c98c15f1689a90d00b', '27ac945d8df8433894da098a1192476d');
INSERT INTO `syspermissionresources` VALUES (614, 'b8c3e2f7114e414b8fb99e001bdc1ca4', '87ad98da3e7642e68109c33199968181');
INSERT INTO `syspermissionresources` VALUES (615, '86610021504e4daa814b0724804ff87d', '21a24ac2443043fbae750e4d6897e4be');
INSERT INTO `syspermissionresources` VALUES (616, '53c95658c1a94f35bf5088be357f2d38', '21a24ac2443043fbae750e4d6897e4be');
INSERT INTO `syspermissionresources` VALUES (619, 'caeb9888ba65418d8a757ed91c69fe26', '43c2cd191bd14af18ecabe5fa81b60cc');
INSERT INTO `syspermissionresources` VALUES (626, '2d05a9c495ea48598814eb46f3852102', '75a262c3c48d4e21817541cd87fac000');
INSERT INTO `syspermissionresources` VALUES (627, '929524e601fd458993317a4f8a8be33a', '75a262c3c48d4e21817541cd87fac000');
INSERT INTO `syspermissionresources` VALUES (628, '2d05a9c495ea48598814eb46f3852102', 'cec90ad171374546b81868015755f9f8');
INSERT INTO `syspermissionresources` VALUES (631, '11ac0bb2d9074573bdfcb40511a302b9', '5417c2d6e8a8453b972682fee374ec3a');
INSERT INTO `syspermissionresources` VALUES (632, '11ac0bb2d9074573bdfcb40511a302b9', 'a6bc8f310a2642d7ad537e620eff3f85');
INSERT INTO `syspermissionresources` VALUES (639, '80fdfc5251234915924d6b310d510af7', 'c673918d949d4cc3aa38b43660b354b8');
INSERT INTO `syspermissionresources` VALUES (640, '34b600ff3fd4494cb3c34af2910b9c5e', 'c673918d949d4cc3aa38b43660b354b8');
INSERT INTO `syspermissionresources` VALUES (641, '80fdfc5251234915924d6b310d510af7', 'd692c8ee90394774b449fc4060ee711d');
INSERT INTO `syspermissionresources` VALUES (642, '34b600ff3fd4494cb3c34af2910b9c5e', 'b306453ca1f24bdabc62261b687e44a2');
INSERT INTO `syspermissionresources` VALUES (659, '1889c935ddca4f81bf1046dccfcfe906', 'd75adb28b87d496e8627c11272b47476');
INSERT INTO `syspermissionresources` VALUES (661, 'e4033ddf5bf14ea19249242cf83e5662', '1ac87d3f1c0f4c99b9fdd9b713e304bf');
INSERT INTO `syspermissionresources` VALUES (662, '283b82e93f0f45e9aebe62a6fa3194bd', '9c3ddbaa3457496ab9315ce6f271db8d');
INSERT INTO `syspermissionresources` VALUES (663, 'f19ccdc2eeea49939b4ed4c0cd3c0b49', 'abdea9b5ed4c4636a55062cf4f36ea0a');
INSERT INTO `syspermissionresources` VALUES (665, '26767c89eeb84e56a411f686b3242491', 'b805b7dbbf0140b2a2fcb962e3fe4a4d');
INSERT INTO `syspermissionresources` VALUES (666, 'dec929f879a74636a22f2f4992470c5d', 'b805b7dbbf0140b2a2fcb962e3fe4a4d');
INSERT INTO `syspermissionresources` VALUES (667, '370562231d9447c797d9c9d4df04413b', '5ef5747987074212be7ef9cc9fdb50af');
INSERT INTO `syspermissionresources` VALUES (668, '3fcd60e96e85430fa99e85886804dbc5', '5ef5747987074212be7ef9cc9fdb50af');
INSERT INTO `syspermissionresources` VALUES (669, '370562231d9447c797d9c9d4df04413b', '2f6e1c7e19024a23ad13442f8a082e45');
INSERT INTO `syspermissionresources` VALUES (670, '3fcd60e96e85430fa99e85886804dbc5', 'da59992eae3a4181bd14d31476aa8714');
INSERT INTO `syspermissionresources` VALUES (772, '05bd42ccee274a6393edf7e5be2ed902', 'b9512c1642a54356b453ef6e9df32aee');
INSERT INTO `syspermissionresources` VALUES (773, 'f399670d423442909dadfe3238915cb8', '70889956fee3475fb8487313d46f94c7');
INSERT INTO `syspermissionresources` VALUES (774, '0c1ff61fb5664ba5b41d844b2bcbc5c5', '70889956fee3475fb8487313d46f94c7');
INSERT INTO `syspermissionresources` VALUES (775, '89404919a18c4bc5b68828c5d08a6598', 'cbe2d7086fee4d5390afe686e9cddad1');
INSERT INTO `syspermissionresources` VALUES (776, '763dd4de4298424387cf13c099fef025', 'cbe2d7086fee4d5390afe686e9cddad1');
INSERT INTO `syspermissionresources` VALUES (784, '030ebf82676c4160920670728bce3cb2', 'd0482512ccd5439bb6610672c11f0cb2');
INSERT INTO `syspermissionresources` VALUES (785, '8556d08d0aa1479a980a2068dad291e5', '90cd4aa4e6ef4154849630ae701fe37d');
INSERT INTO `syspermissionresources` VALUES (786, '8556d08d0aa1479a980a2068dad291e5', 'fdbe57ac70804feea4e8679a190740ed');
INSERT INTO `syspermissionresources` VALUES (787, '8556d08d0aa1479a980a2068dad291e5', '7df278798d2f448a90ea0be3f76fc629');
INSERT INTO `syspermissionresources` VALUES (788, '40609cc4a8d24b1cae714d3b26549718', 'aa971ce1dc6f43e3b026d235fa7263e6');
INSERT INTO `syspermissionresources` VALUES (789, '8ca6b8d1b2a74fc79126bbf910396c18', '70737a78770041a18bccc71b4d17ecf8');
INSERT INTO `syspermissionresources` VALUES (790, 'b1d0484dce464b06900be842cb6487a9', 'a0116147816444319d37e0e1562189b0');
INSERT INTO `syspermissionresources` VALUES (794, '490b90c22bd74cc49ffac5a8bf339cc3', 'd72acdb07d1540bab400c194ba3329f8');
INSERT INTO `syspermissionresources` VALUES (795, '490b90c22bd74cc49ffac5a8bf339cc3', '8b1d44fee22c460dabb3381e97f1820f');
INSERT INTO `syspermissionresources` VALUES (801, '7f29278f5aaf461988e0ca6ae380c212', 'bc248879066f4af58c99a822f4228015');
INSERT INTO `syspermissionresources` VALUES (803, '5532bf13ebbc4881925c21c1aa96302c', '5b89f2dc65b54197940c9f1b614c669e');
INSERT INTO `syspermissionresources` VALUES (804, '9b6b32f8e1d74a12ae60eff39caa5e1e', '4de9ba43424146678772a69d0cd6ea4d');
INSERT INTO `syspermissionresources` VALUES (805, '1313b93cb906494d896c059eca62762a', 'fb9bce585d7d4aa89ddf30262540e660');
INSERT INTO `syspermissionresources` VALUES (810, '19b5f1637e174a31a91c4ddcef3bb4c0', '5af3e8652bd14b48aea03fac91e1e0b7');
INSERT INTO `syspermissionresources` VALUES (811, '19b5f1637e174a31a91c4ddcef3bb4c0', '5dad80e6fa6e4255b34181bd17c5fe02');
INSERT INTO `syspermissionresources` VALUES (812, '19b5f1637e174a31a91c4ddcef3bb4c0', '77b721b60c014517a73134daaad021d9');
INSERT INTO `syspermissionresources` VALUES (813, 'ad186f105f5344908a66dac76dbf7d06', '5af3e8652bd14b48aea03fac91e1e0b7');
INSERT INTO `syspermissionresources` VALUES (814, '6e9b4ddd5cf34072a01953fc220a2fd5', '412fd399deac43cb8354a15db3b47bbf');
INSERT INTO `syspermissionresources` VALUES (815, '90acac5c5e9e4969b2a78f0613ee6b9a', '412fd399deac43cb8354a15db3b47bbf');
INSERT INTO `syspermissionresources` VALUES (816, '6e9b4ddd5cf34072a01953fc220a2fd5', '86307e97f57a4c8daecd6b13ea4a60e8');
INSERT INTO `syspermissionresources` VALUES (817, '6e9b4ddd5cf34072a01953fc220a2fd5', 'd73f435972544a7fb03b6618948c07eb');
INSERT INTO `syspermissionresources` VALUES (818, '70aa9bea6b8b4cd4aef87b9f28782d51', 'a2b73c63005149699adb7fb395467b49');
INSERT INTO `syspermissionresources` VALUES (819, 'a4421d798f254077ab73cb440d23b126', 'a2b73c63005149699adb7fb395467b49');
INSERT INTO `syspermissionresources` VALUES (820, '73e33d43deed43ae8f631f61ea4c7d93', 'ab73276d43184b2db5fa5a6bd76b1def');
INSERT INTO `syspermissionresources` VALUES (821, '1f8a51f44c3f4dfe878c0b978a5720d6', '0d87e1fe8fdd45d48c5f259b8e423b2e');
INSERT INTO `syspermissionresources` VALUES (822, '0b9dd9f7be554a4eb07ff7bf716a81b9', '0d87e1fe8fdd45d48c5f259b8e423b2e');
INSERT INTO `syspermissionresources` VALUES (823, 'e2623b25d9884cfe9cb0a93b785d8362', '7db8b118e2ec4ce9992e027eddda1648');
INSERT INTO `syspermissionresources` VALUES (866, '5f8d5f1735d145b59282e5eb840459f7', '685794fae29a45b6a5d61416b39d7f71');
INSERT INTO `syspermissionresources` VALUES (889, '57f777df1fd84e7a9ce88da91459c4dd', 'ef3e2b9c32634f4088f4066880c70677');
INSERT INTO `syspermissionresources` VALUES (890, '3aa152ed6319424097a29e41f3dd14d4', 'ef3e2b9c32634f4088f4066880c70677');
INSERT INTO `syspermissionresources` VALUES (891, '57f777df1fd84e7a9ce88da91459c4dd', '41a824d4663243b39b2d34256eb3dbf2');
INSERT INTO `syspermissionresources` VALUES (892, '57f777df1fd84e7a9ce88da91459c4dd', 'b002385af8e245aa823bf75adbd96eac');
INSERT INTO `syspermissionresources` VALUES (893, '57f777df1fd84e7a9ce88da91459c4dd', '1d36080345f74b9a919b16bec5c235a6');
INSERT INTO `syspermissionresources` VALUES (894, '57f777df1fd84e7a9ce88da91459c4dd', 'ef310b9be13a4630b40c99fe3baf1e4a');
INSERT INTO `syspermissionresources` VALUES (895, '57f777df1fd84e7a9ce88da91459c4dd', 'd96a00544fcf470e98a4f062bc017559');
INSERT INTO `syspermissionresources` VALUES (896, '57f777df1fd84e7a9ce88da91459c4dd', 'caedcace4fe746499146e97459919bb4');
INSERT INTO `syspermissionresources` VALUES (897, '57f777df1fd84e7a9ce88da91459c4dd', '77b55fcc33184a009e1376e20e294eca');
INSERT INTO `syspermissionresources` VALUES (898, '57f777df1fd84e7a9ce88da91459c4dd', 'de86a8fa661041ca9794a78275d0fcb1');
INSERT INTO `syspermissionresources` VALUES (899, '57f777df1fd84e7a9ce88da91459c4dd', '120c74ce95624dbfacd192b90923958b');
INSERT INTO `syspermissionresources` VALUES (900, '57f777df1fd84e7a9ce88da91459c4dd', 'c34676a187044553a4c42c56257413fd');
INSERT INTO `syspermissionresources` VALUES (901, '57f777df1fd84e7a9ce88da91459c4dd', '567f89abd7e04a1988c08b9764cf918c');
INSERT INTO `syspermissionresources` VALUES (902, '57f777df1fd84e7a9ce88da91459c4dd', '53662c3fbcd145068ba4760a6d1d39a9');
INSERT INTO `syspermissionresources` VALUES (903, '3aa152ed6319424097a29e41f3dd14d4', '16f7e69c2af54ccda1d8414b6cef7d32');
INSERT INTO `syspermissionresources` VALUES (906, 'ca00b2ec92d54b21b57b823a72f1024e', '4bac717853cb4a7faf79905ea6cad412');
INSERT INTO `syspermissionresources` VALUES (907, 'd7b687d7dd9e4b758dbc143625915076', '4bac717853cb4a7faf79905ea6cad412');
INSERT INTO `syspermissionresources` VALUES (916, 'fc7adea930dc418886e8f791fce7dd8f', 'ad32af8a5d784a979da7b5362ca77882');
INSERT INTO `syspermissionresources` VALUES (917, '5d52c02bc2754881b37cda5efcd765c5', '3c98bf1cf2294c059cf0241fba5cfa00');
INSERT INTO `syspermissionresources` VALUES (918, '86d67b11fc0149bfad3a4189e2b94f36', 'e0aa4b8b3c51428eb6dd8227ffffe283');
INSERT INTO `syspermissionresources` VALUES (919, 'ec871e4a3c7842309abc22e3f6b9a1c3', '9c5bebaa673b45bd9d1c5cba7a9dead9');
INSERT INTO `syspermissionresources` VALUES (920, '18d7283440854ef68e30bcc83671777f', '24bac9f0b1c84b0394a39c8933c7739d');
INSERT INTO `syspermissionresources` VALUES (921, '778a695cbabb4defb7e5e7d728c1ce97', '59bb52174d2e4f318e0c5ed09f9bedb3');
INSERT INTO `syspermissionresources` VALUES (923, 'f25dd684c4954768ab254a9693a3b8af', '1800baca07bc44ac986556dd30d37254');
INSERT INTO `syspermissionresources` VALUES (924, '9676a76072744b9b893b080389667675', 'a8b4ea7341944f03b4c468b0354371cc');
INSERT INTO `syspermissionresources` VALUES (925, '3add22feb0064256bc19c209d14b5aeb', '3d630529412f44c8be0c409bf12bbba7');
INSERT INTO `syspermissionresources` VALUES (926, '633e13950b7540eebf0d07022784962f', '11f96911716c4498b562658224750b02');
INSERT INTO `syspermissionresources` VALUES (927, '633e13950b7540eebf0d07022784962f', 'bdfb84d1d65b4325aa8a74a61a70a6a3');
INSERT INTO `syspermissionresources` VALUES (928, '194e1a7a1fdc4a6eae2bd4db1dea2661', '922f6908c5a1434aba4b0f6f8f008c1c');
INSERT INTO `syspermissionresources` VALUES (929, '5f2c77490e4a4106b2b4c22fb0c59aaf', '922f6908c5a1434aba4b0f6f8f008c1c');
INSERT INTO `syspermissionresources` VALUES (930, '194e1a7a1fdc4a6eae2bd4db1dea2661', 'd93b927d889a41f487efc41845f9c4ea');
INSERT INTO `syspermissionresources` VALUES (931, '194e1a7a1fdc4a6eae2bd4db1dea2661', 'a7bdf3297cc2431f9dd3f748374bf877');
INSERT INTO `syspermissionresources` VALUES (932, '194e1a7a1fdc4a6eae2bd4db1dea2661', 'b794e4584425495a8070fdc71d09258b');
INSERT INTO `syspermissionresources` VALUES (933, '194e1a7a1fdc4a6eae2bd4db1dea2661', 'a92781bed96b4a6e9f8348321ac2ddbc');
INSERT INTO `syspermissionresources` VALUES (934, '194e1a7a1fdc4a6eae2bd4db1dea2661', 'c7936b830e654abba9a0c1e76895747a');
INSERT INTO `syspermissionresources` VALUES (935, '194e1a7a1fdc4a6eae2bd4db1dea2661', '81d79685ac4240c281dcda09bba59b53');
INSERT INTO `syspermissionresources` VALUES (936, '194e1a7a1fdc4a6eae2bd4db1dea2661', '9c44a7e09b2744d58bccef05d11cdca7');
INSERT INTO `syspermissionresources` VALUES (937, '194e1a7a1fdc4a6eae2bd4db1dea2661', 'ec17504e564f4c958cb679377a39715d');
INSERT INTO `syspermissionresources` VALUES (938, '194e1a7a1fdc4a6eae2bd4db1dea2661', 'e8cfa842e1c24b54b67f1bbc6b828dbe');
INSERT INTO `syspermissionresources` VALUES (939, '194e1a7a1fdc4a6eae2bd4db1dea2661', '7f520a1fe9ef45f79c7ac1d01a8c2e56');
INSERT INTO `syspermissionresources` VALUES (940, '194e1a7a1fdc4a6eae2bd4db1dea2661', '0321d480f7604cc797b765d0ad0753a6');
INSERT INTO `syspermissionresources` VALUES (941, '194e1a7a1fdc4a6eae2bd4db1dea2661', 'ae6eeb2fbd23472d89022d9a7366b0cd');
INSERT INTO `syspermissionresources` VALUES (942, '194e1a7a1fdc4a6eae2bd4db1dea2661', 'c930706b667749d1b5784c37c6a4ffd4');
INSERT INTO `syspermissionresources` VALUES (943, '5f2c77490e4a4106b2b4c22fb0c59aaf', 'c9791f2412c04860a0f8b4ddfc64cecb');
INSERT INTO `syspermissionresources` VALUES (945, 'f36038f6f48040d9ba40b94342490736', 'f285c691b0f74b9ca549344722e5d780');
INSERT INTO `syspermissionresources` VALUES (946, '4dbb7acd1a964ccfac105ca77368552e', '2690d4cb2beb425daa06ff9faf8d97ec');
INSERT INTO `syspermissionresources` VALUES (947, '9fc9acd39cfb42e1960472bda97f87ce', '0e2aa6a61c994088819af6a79c519ebf');
INSERT INTO `syspermissionresources` VALUES (948, 'e3e1aa79ab624d338eca2ba5be687262', '32361852ba844d1f9ccdb220ce3b3cb1');
INSERT INTO `syspermissionresources` VALUES (1077, '74e6343d6b144a24a219185e6fab2f4f', 'c459ab7aa99e4f528c961dd45df4d8e5');
INSERT INTO `syspermissionresources` VALUES (1078, '74e6343d6b144a24a219185e6fab2f4f', '3cb6db13692b4bebb71da2045154efe7');
INSERT INTO `syspermissionresources` VALUES (1079, '74e6343d6b144a24a219185e6fab2f4f', '67cc5e6e087c4c6192d8448402765751');
INSERT INTO `syspermissionresources` VALUES (1080, '74e6343d6b144a24a219185e6fab2f4f', 'c912c21f92ca46e693b8645e7ad89a8d');
INSERT INTO `syspermissionresources` VALUES (1127, '9cd6aa6943934ec9b1b5dbe67edd6308', '9c443950eb9746b49c7314dbf8e3d523');
INSERT INTO `syspermissionresources` VALUES (1128, '8540783c287245698b4e41c14c56e606', '9c443950eb9746b49c7314dbf8e3d523');
INSERT INTO `syspermissionresources` VALUES (1129, '238bd1047afc4fc0a220977c44a07336', 'd613442d18c1465d8a981f420b3aa8cd');
INSERT INTO `syspermissionresources` VALUES (1133, 'd53a434d16b14b23b79bf31dee90a1ea', '51a9dc467fb54948a1c71dc2365b5049');
INSERT INTO `syspermissionresources` VALUES (1134, '99014ba26f30421dbac81e489c444ebe', 'dd231daf558d4526bf0d95ee6cc6970e');
INSERT INTO `syspermissionresources` VALUES (1138, 'b6eeebf8952b4bc9a74b2e143911441d', '6b12cf5fb0ce4927979775f3c76419ab');
INSERT INTO `syspermissionresources` VALUES (1139, 'c4c47e534e3048ed839d5a637b07020c', '6b12cf5fb0ce4927979775f3c76419ab');
INSERT INTO `syspermissionresources` VALUES (1140, 'b6eeebf8952b4bc9a74b2e143911441d', 'da89532f94ed4e4193f9980c48609aac');
INSERT INTO `syspermissionresources` VALUES (1141, 'b5c65a65008a46e3a9894825b98b182e', '2e51f370f3c34d0bbfaf4a9f1ca7ee02');
INSERT INTO `syspermissionresources` VALUES (1142, 'b5c65a65008a46e3a9894825b98b182e', 'a5068ccfff8b42cf920f56aa780cbdad');
INSERT INTO `syspermissionresources` VALUES (1143, 'f871f8eb397e40b9bd69b4496942875b', '2e51f370f3c34d0bbfaf4a9f1ca7ee02');
INSERT INTO `syspermissionresources` VALUES (1145, '7dfbd05de7a14c9f87928c90bdda2192', 'ae66d24114ea4cf28923f5fe8757e4e6');
INSERT INTO `syspermissionresources` VALUES (1146, '8f0d0bef28c34fc59c3a643eea3ad0f2', '2a90880355b44225a7e42e3a394d020c');
INSERT INTO `syspermissionresources` VALUES (1147, '8f0d0bef28c34fc59c3a643eea3ad0f2', 'cee7dda9dd5e4a739b42f0dfa8b4b16d');
INSERT INTO `syspermissionresources` VALUES (1148, '8f0d0bef28c34fc59c3a643eea3ad0f2', '3686068be6704f78a2ec5e30b78f043f');
INSERT INTO `syspermissionresources` VALUES (1150, '6be1d4d0c2e04294b83075a44f4c5a87', '5d697fdf29434ff4bbcd5bc6f1a9a415');
INSERT INTO `syspermissionresources` VALUES (1151, '6be1d4d0c2e04294b83075a44f4c5a87', 'ee03a28bd12f41b4a1e243ec05ca062b');
INSERT INTO `syspermissionresources` VALUES (1152, 'ace2d0e6f02f4189b08a63380f4f6b5a', 'ff3bfef595c1473a9dd2a1ba279ca010');
INSERT INTO `syspermissionresources` VALUES (1153, 'c5491e097dfa4571b8a0b7117c79c978', 'd885d220f87a4b1a928e3eb93f922c02');
INSERT INTO `syspermissionresources` VALUES (1211, '0e0d51db38d54019883a97efae6a613c', '08a343e33ec44fe59228442dd56e96a3');
INSERT INTO `syspermissionresources` VALUES (1212, 'e5b92c26f1d24283898773c273b6aaab', 'ab10d2b5dc5e48a69727a6292ca072b4');
INSERT INTO `syspermissionresources` VALUES (1213, '66bca0f5d7064f0fa3217eb1b4b3dff9', 'ab10d2b5dc5e48a69727a6292ca072b4');
INSERT INTO `syspermissionresources` VALUES (1214, 'cd6e65c8117d47d6b905cd699953440d', 'e4d93f4f930a455f85868cfd5480f5d0');
INSERT INTO `syspermissionresources` VALUES (1237, 'a65e7b106ae7449880200557e60d014e', '0e80dcd0f37940658faf50a8f3f9c331');
INSERT INTO `syspermissionresources` VALUES (1238, 'fab2055b35d040d9b28f02c6630c630f', '3c7306248d7a4788894ca4d9107e233e');
INSERT INTO `syspermissionresources` VALUES (1250, '906235e44bc1410681174f4b350bac22', 'be324f36fad2467688724082c285d16e');
INSERT INTO `syspermissionresources` VALUES (1251, '906235e44bc1410681174f4b350bac22', '47b25f8c2c6844c39025bce8ddfaa7fb');
INSERT INTO `syspermissionresources` VALUES (1252, '56d01e5582ce44b5a1cbe553a3336f21', '673e0fdf492e4d97a19a761f8dcc203b');
INSERT INTO `syspermissionresources` VALUES (1255, 'd17cf7897d1f42cbbfdc509ebf5f38de', '515cd5fbdd72423ca083d3f44217fd25');
INSERT INTO `syspermissionresources` VALUES (1256, 'dd280caa96f24e5b96a586071a7e6ff1', '515cd5fbdd72423ca083d3f44217fd25');
INSERT INTO `syspermissionresources` VALUES (1257, 'bb4ca5ddf1884eb38e667274445372d7', 'e050f5451e4f4f7dba6c2cb51f7c393e');
INSERT INTO `syspermissionresources` VALUES (1258, 'eb186fe0b20447fba47e45846b51c344', 'e050f5451e4f4f7dba6c2cb51f7c393e');
INSERT INTO `syspermissionresources` VALUES (1259, 'f0da7798ecc74190ab17da47634e5401', '2c60d084290e4ac196c490864a292ae1');
INSERT INTO `syspermissionresources` VALUES (1260, '35e6084d7dc44b1ca8e9033302969275', 'bd36d2aa14774c8d81b56fc7fde02b4f');
INSERT INTO `syspermissionresources` VALUES (1261, '3ddf4b633d8f474f9a8aaffd73db0482', '07dc355d349a41379673ede8b926520e');
INSERT INTO `syspermissionresources` VALUES (1262, '76ad5ec096c540d983dd318969a64f6f', 'c6d4bed764194be0a377be158ecdee4d');
INSERT INTO `syspermissionresources` VALUES (1263, '4ca50a54e8f54bb6ab063331f78a96d8', 'b83b0d29f07e4249b70067e00f54ef67');
INSERT INTO `syspermissionresources` VALUES (1264, '8ad5245678b9413a94c7f27a181998bf', 'b83b0d29f07e4249b70067e00f54ef67');
INSERT INTO `syspermissionresources` VALUES (1265, 'c932f31b97a947d4a123222d8ae7fe92', '557735f0f8ba4626b78224719e77cea3');
INSERT INTO `syspermissionresources` VALUES (1266, 'd1c449631db742d79f5426739f8bbed7', '557735f0f8ba4626b78224719e77cea3');
INSERT INTO `syspermissionresources` VALUES (1267, 'cbc6da71f75d4ac582d0e88f257e7669', 'c027259a21a240d48b73c1683a346056');
INSERT INTO `syspermissionresources` VALUES (1305, 'dc1ba71e0da24d53a552beb64d1e3505', '129aa71dc14049ccb0715268f24281aa');
INSERT INTO `syspermissionresources` VALUES (1306, 'd2912b5dd3b84ab396c0a87210e3ab30', 'b77f796a65694fed859fe1684d365589');
INSERT INTO `syspermissionresources` VALUES (1321, '1a631db6c36e499cafd7d5211e61939f', '061d18aeb1044870b94cf6144a6004ea');
INSERT INTO `syspermissionresources` VALUES (1328, 'da332d9db98e4ce7b9023a9e76752ad3', 'a1e816f03692448698b01a7ac01d2964');
INSERT INTO `syspermissionresources` VALUES (1329, 'b2b558e723eb4d75ae4c35c8b36b5c64', 'a1e816f03692448698b01a7ac01d2964');
INSERT INTO `syspermissionresources` VALUES (1330, 'da332d9db98e4ce7b9023a9e76752ad3', '657208b0b240489da050e672cbe10a85');
INSERT INTO `syspermissionresources` VALUES (1331, 'b2b558e723eb4d75ae4c35c8b36b5c64', '517d8e1ea108440ebf3f01ca0f7bd322');
INSERT INTO `syspermissionresources` VALUES (1332, 'a8e77195a8ba42b3880f4d6935f8d1a1', '8f440666921741ed8c4804732b34d75d');
INSERT INTO `syspermissionresources` VALUES (1333, 'd443ecbbb48d48a0adb0df74140510da', '8f440666921741ed8c4804732b34d75d');
INSERT INTO `syspermissionresources` VALUES (1334, 'a8e77195a8ba42b3880f4d6935f8d1a1', '559123bb91364943b1853c875901a598');
INSERT INTO `syspermissionresources` VALUES (1335, 'd443ecbbb48d48a0adb0df74140510da', 'a9c55c3b3b45494dacef8fb058c7e7a7');
INSERT INTO `syspermissionresources` VALUES (1336, 'e96baee9362449d7b498fb527dec1d54', '7f22ef589ea74b1c874b10fa6cd36b99');
INSERT INTO `syspermissionresources` VALUES (1337, 'ede920bcd4a7443ab7bc61e24994468e', '032710d13fbe479686fff302b9e2a2ce');
INSERT INTO `syspermissionresources` VALUES (1338, '78f7f0b1dee44977a383578846eed604', '64730717bf3e42169b22ff5f4529b0a8');
INSERT INTO `syspermissionresources` VALUES (1339, '78f7f0b1dee44977a383578846eed604', 'b15ff404e0b64afcaa888311b1d0b0c8');
INSERT INTO `syspermissionresources` VALUES (1340, '048060184aa747db94413aef590e6b97', 'fd848496836843b49ee6ed3ccdf6c14d');
INSERT INTO `syspermissionresources` VALUES (1343, '2dabdbe7ec924ed2b8a15d8f06f9f457', '281466f5c0654966a68653b7383c6d9a');
INSERT INTO `syspermissionresources` VALUES (1344, '2dabdbe7ec924ed2b8a15d8f06f9f457', '901d1d332b214483a90b5ef1738077a1');
INSERT INTO `syspermissionresources` VALUES (1348, '3f59fbbaac5c4618a7766c775050bee5', 'b47dd6012f88406795205481d2916fd2');
INSERT INTO `syspermissionresources` VALUES (1349, '72ea89819e2248a3951dbe0be592f55f', 'b47dd6012f88406795205481d2916fd2');
INSERT INTO `syspermissionresources` VALUES (1350, '72ea89819e2248a3951dbe0be592f55f', '5ad1e2bb0bc846a1a0fa4da30031a719');
INSERT INTO `syspermissionresources` VALUES (1351, 'bb1867da82bc4bf9ba1c404f7de7e0a4', '607bbd310ec147519e8f988adf4c30a6');
INSERT INTO `syspermissionresources` VALUES (1352, '61b55531648c46f89fd561cdcea09a64', '607bbd310ec147519e8f988adf4c30a6');
INSERT INTO `syspermissionresources` VALUES (1353, '61b55531648c46f89fd561cdcea09a64', 'd4b7953538294b67843c56f721d51a58');
INSERT INTO `syspermissionresources` VALUES (1354, 'c875a39da823436e8a77f4c251096dd4', '0d5362ae1983422fa01bc03c079c850f');
INSERT INTO `syspermissionresources` VALUES (1355, 'bb8ada1fcff747a7868d17bebda7e0f2', '5485ebcbc00541458cd96eb6deda2eab');
INSERT INTO `syspermissionresources` VALUES (1356, 'a97915e1f0864c9c93a88f268284df5f', '8b9594bb5b8343dbadca64a4f8066b6e');
INSERT INTO `syspermissionresources` VALUES (1357, '4831ce8be1af4dd9862ab173a19907d3', '8b9594bb5b8343dbadca64a4f8066b6e');
INSERT INTO `syspermissionresources` VALUES (1358, '15c5191b69af4eb0a1862930c6fe176d', 'a4775968ad2e4b238ed49b4e4808a011');
INSERT INTO `syspermissionresources` VALUES (1359, 'd98a8e8c57b64a8fb89f7a0d994978eb', 'a4775968ad2e4b238ed49b4e4808a011');
INSERT INTO `syspermissionresources` VALUES (1360, 'b09e8b722bd6426388e7694a371cd9fd', 'e08a84e681ea4850be0a33c1f6d4c5f0');
INSERT INTO `syspermissionresources` VALUES (1361, '47d2591d01cf49dd8122cc9a77d16094', '521ab07ea093458b8c0711c9783cfdec');
INSERT INTO `syspermissionresources` VALUES (1362, '6ade5a05842c4d17ba41346b74724acd', 'bce6c687ee5645cda651cd6dfff74fa4');
INSERT INTO `syspermissionresources` VALUES (1363, 'e2e27149dde94c078489038669e19e58', 'd3f057d1100a4a79b97ab9715e01be04');
INSERT INTO `syspermissionresources` VALUES (1364, 'c59de06e2db1498e97920d0d51ce8f32', 'd3f057d1100a4a79b97ab9715e01be04');
INSERT INTO `syspermissionresources` VALUES (1367, '3c05fdd591c8470b8622091893ff004c', '4ce5c77610864d8885298a21793732ad');
INSERT INTO `syspermissionresources` VALUES (1368, '81aec7f346434308beb898b261c90aee', '4ce5c77610864d8885298a21793732ad');
INSERT INTO `syspermissionresources` VALUES (1370, 'd7afdec202d44a85ad3239987d2fcf00', '000d1e49b1984cceacaf4dbc2a38be86');
INSERT INTO `syspermissionresources` VALUES (1371, '8761b202576a4f7189faffd32bf299ba', '862368fdca464ebbb2937623648880d1');
INSERT INTO `syspermissionresources` VALUES (1372, '9546840461a64c81bd080fcfffd3df0e', 'c09977cf64ef4a008e672a4ba8d8e004');
INSERT INTO `syspermissionresources` VALUES (1373, 'b98179ff230b4c8baf7abd8affb33468', 'fd7988fae4484db7a98a1d67b6d54cdc');
INSERT INTO `syspermissionresources` VALUES (1374, '1b80ca8dc02c4591997d420cc917d80b', '53ae04bf6468464ea15826a8d1bb7417');
INSERT INTO `syspermissionresources` VALUES (1375, '4c87a7846ac54b09bb723808825be222', '1f706068a9d547dea69f89a64c89a741');
INSERT INTO `syspermissionresources` VALUES (1376, '2857b3c00f5841c4920497ac57beac6b', '32ae2070e23d42ba8dc38de061e7ed47');
INSERT INTO `syspermissionresources` VALUES (1377, 'e04459a1d0b749ff9d619941fe747750', 'd2a54b45642a42fcac64fb15f1ac78e2');
INSERT INTO `syspermissionresources` VALUES (1378, '5b9a0913454e47b4bef6d3e31ae38734', '9e9721bf5cad43bdba3a7adecb47726f');
INSERT INTO `syspermissionresources` VALUES (1379, 'aa7e41324b0d49f085fcbb400355f970', '9e9721bf5cad43bdba3a7adecb47726f');
INSERT INTO `syspermissionresources` VALUES (1380, 'cb607ae60b204da3b2c80c85929a190d', '52bc2dbe4c0e437ebf93ce8b6575c6bb');
INSERT INTO `syspermissionresources` VALUES (1381, '0998399706604b298db6533ef23ec0ac', '52bc2dbe4c0e437ebf93ce8b6575c6bb');
INSERT INTO `syspermissionresources` VALUES (1382, '0f0ec2999fbb44f8846a20d58e828e59', '45f5ca24bf7441c08680d66b3aa6a8f6');
INSERT INTO `syspermissionresources` VALUES (1383, 'c78f3947c772431bb95dfbad58fe0fc3', '75349725155243d2932fc754cea5f3ab');
INSERT INTO `syspermissionresources` VALUES (1384, '983b4609b07f403390d2df8b7a738bfe', 'baa1c014792c40edae687b4e169657ef');
INSERT INTO `syspermissionresources` VALUES (1385, '8d35c5c4667747619886eda5b61e80f1', '214f40c320124e839e7d0d7b00af2cbd');
INSERT INTO `syspermissionresources` VALUES (1386, 'a1b1c49fc8f64d9aa7497d5b25816eee', '407a285c7ec744a4b284b85339c296ec');
INSERT INTO `syspermissionresources` VALUES (1387, '606368bc5d894dc69213360eeb3f3c1d', '10f76770be4040a4bf50d0efb4dce35a');
INSERT INTO `syspermissionresources` VALUES (1388, '64cd7f08d9f941a4965f07aaf876b41b', 'e7443c7b35bc44a1a60f5f6a7530905b');
INSERT INTO `syspermissionresources` VALUES (1389, 'c4a175eaf6eb4e34b94bea54018391b1', '042dc8a1921d4232bf4b01817011a960');
INSERT INTO `syspermissionresources` VALUES (1390, '0f7d3d4af8954ad18178b62d2f25d7f9', '0ae67eaf13ab4fc199a4406126dbaef4');
INSERT INTO `syspermissionresources` VALUES (1391, '70a4210d51a246e396fd336a83e6397e', '822e43c8499149d59fd5ee6f77153d35');
INSERT INTO `syspermissionresources` VALUES (1392, 'aeb1ad5106554199bb6c16dfe6597c92', 'f6518fc5a5f84c11a5a569c493218f8f');
INSERT INTO `syspermissionresources` VALUES (1404, '10aefb57f2f247b290c91e2253e8ce2d', 'd297f75ec0514aa1953d9d1738634090');
INSERT INTO `syspermissionresources` VALUES (1405, 'b0d6061db5e24b2aa9b648b82acbca5e', '5e5fc2f249c144f198b3aad24f665cdd');
INSERT INTO `syspermissionresources` VALUES (1406, 'c511a5d43fd2483c9980a3ddd774caa7', '8ce45be5ea284190b9d76138d8d5f6b2');
INSERT INTO `syspermissionresources` VALUES (1407, '22262588cd464d568f4d756512152c3d', '8ce45be5ea284190b9d76138d8d5f6b2');
INSERT INTO `syspermissionresources` VALUES (1408, 'c511a5d43fd2483c9980a3ddd774caa7', '0afab98ea71c4550a3020156aea1e7c3');
INSERT INTO `syspermissionresources` VALUES (1409, '694588ee74f9488ab0d647e6e722ccc4', '01fe645ae71e4925892c159e948063e9');
INSERT INTO `syspermissionresources` VALUES (1410, '13f7169f2a0b48a591e701d5f5a034d0', '2bf084e1e8d84e89a1c2da9c5f6c8f5d');
INSERT INTO `syspermissionresources` VALUES (1411, 'da0dad28fa434e9190fe67619c28bf59', 'c418c587feb14ecfabd9690d9f52d440');
INSERT INTO `syspermissionresources` VALUES (1412, '4174d434346d4043935285874652531e', 'a5cb52cd59a040a1b34a7f401361fe31');
INSERT INTO `syspermissionresources` VALUES (1413, '958dd7d75ef547ea8ea0af5ed2a816c1', 'dcd7b0f0c5e44566b116694b96dac0e1');
INSERT INTO `syspermissionresources` VALUES (1414, '36001fdc50254da8a40de770517d148e', '7caf26294048452cafbb5972ef502d88');
INSERT INTO `syspermissionresources` VALUES (1415, 'cd62c57b27af4b95bf3e9b868c318e98', '399207e1956d465a8eb536e80ee5f5f0');
INSERT INTO `syspermissionresources` VALUES (1416, '87af232710634e8ebab31d8d432c51da', 'afa39379327e4461b3444cf9b416efae');
INSERT INTO `syspermissionresources` VALUES (1417, '657d2b2dcbd44934aad101f1e304e465', 'afa39379327e4461b3444cf9b416efae');
INSERT INTO `syspermissionresources` VALUES (1418, '447a7075ee9241b4b39e8976aa24709d', 'aa355abf953e42078517a3dded03e785');
INSERT INTO `syspermissionresources` VALUES (1419, '3d795b3a0b1849fb8da486151cba9b8b', 'aa355abf953e42078517a3dded03e785');
INSERT INTO `syspermissionresources` VALUES (1420, 'b343696f562c437facda8fb136de09c9', 'c370e4821b0e45b6946a7ab3181b3844');
INSERT INTO `syspermissionresources` VALUES (1421, '1a362749eebe4b1f8d41643521125336', 'fc8554db852a4f128bdee595b4cd1ed8');
INSERT INTO `syspermissionresources` VALUES (1428, '27464511268442c39980b0a8a25c2663', 'f2ddeb0bb4c94342854c6a2461869fb4');
INSERT INTO `syspermissionresources` VALUES (1429, '3107b49684c54d51b54c45a7307228e0', '3338673059d44af39b27bf4cddc15bcc');
INSERT INTO `syspermissionresources` VALUES (1430, 'fb848a5fa3bf46919f54044aa3bb7c6f', '4c891b4c92af4f6783e6b7d1b245e345');
INSERT INTO `syspermissionresources` VALUES (1431, 'fcd89db7a4fc4c25ad967366a3f9d19f', '3b5ccd12071e49ccac480cc55b3f520a');
INSERT INTO `syspermissionresources` VALUES (1432, '66218378244c4c4fbe640f367b170a2a', '1a95dfe74bec4c0b986e9f96b001bc7e');
INSERT INTO `syspermissionresources` VALUES (1433, '1474318f7e2240739d00a85ff21778d1', '98e03673f0c847a2bc8f93008b1729ef');
INSERT INTO `syspermissionresources` VALUES (1434, '50eb45ee72014011a3828b594988af72', '088ec0225b114039aab46c17888125f2');
INSERT INTO `syspermissionresources` VALUES (1435, 'e189c9ff166d48f19369852c9bee511a', '58dc8b9d637a4ceda36b7083cd94bb76');
INSERT INTO `syspermissionresources` VALUES (1436, 'a97984e18c42486bae7b5b9709309981', 'a7f6e1dcc5e943f48f4270dcfa056557');
INSERT INTO `syspermissionresources` VALUES (1437, 'edcfef9b3d58434cbccebb85cc192bf7', '803dc508fa8542f1a2be86cdb85b19f1');
INSERT INTO `syspermissionresources` VALUES (1438, 'ecd38983cce54e65b9b465c70c9c484e', '7ed8aa6ff34241329b9183e2f114ca64');
INSERT INTO `syspermissionresources` VALUES (1439, '6716c5bd261d4808ba41700b69f061e8', '7ed8aa6ff34241329b9183e2f114ca64');
INSERT INTO `syspermissionresources` VALUES (1440, '6b0484a6e0a54374b82846816e108b46', '838e778a22c0424ab11914d1e3b44379');
INSERT INTO `syspermissionresources` VALUES (1441, '1e5cbc88d0d8489cabf925e70094b882', '838e778a22c0424ab11914d1e3b44379');
INSERT INTO `syspermissionresources` VALUES (1442, 'dbc37f628d514de99469585bb89d4a45', '31f98ef57f0a48a69c0ebb36c920dd1f');
INSERT INTO `syspermissionresources` VALUES (1443, '3402b228fb604030a83eac3c0e94373f', 'd5290b702acf41f286dc3d66c659d081');
INSERT INTO `syspermissionresources` VALUES (1444, 'bb27abfac38e466db47a10922057429c', '5c9e1ad37d2241d6b5eebe4d591f5da5');
INSERT INTO `syspermissionresources` VALUES (1445, '3944c3265a08408db9c8ac3a95862cfe', 'a15cab18081d4ec7b85b03646b873166');
INSERT INTO `syspermissionresources` VALUES (1446, '294be5897f7c4770b7b2d0190e0a6bdd', '7d7842f34d6940738a767b3d7dd9a6ec');
INSERT INTO `syspermissionresources` VALUES (1447, '9117004d87d84d68992d737742a7fc98', '74e391ff7c0d41aeab64e9373f16776a');
INSERT INTO `syspermissionresources` VALUES (1448, '1cc026a6afec4d2c823901413e192bee', 'd71d35ca222a43e2bec6ceb76ac8097f');
INSERT INTO `syspermissionresources` VALUES (1449, '2a881ff2307942a888e84ce2b7cb9a57', 'd71d35ca222a43e2bec6ceb76ac8097f');
INSERT INTO `syspermissionresources` VALUES (1450, 'aff1310185ef404ba5fae9faff402468', '8dd0e634ff4647e0b438b75fbde1148f');
INSERT INTO `syspermissionresources` VALUES (1451, '04931b8ad2db4512bb8c49d48f600b18', '8dd0e634ff4647e0b438b75fbde1148f');
INSERT INTO `syspermissionresources` VALUES (1452, '5357d79b9cad4dc4b6b3ee3434977281', '97bc7db41f8743978c70a104e49dd1c5');
INSERT INTO `syspermissionresources` VALUES (1453, 'c60995081b5a434eab404e350a181d66', '9a797b54d630450cb3cfadb1f2d94243');
INSERT INTO `syspermissionresources` VALUES (1454, '58429820b3764a56a8fda45833ec4737', '453b956048b044cfb4f3df143624aa68');
INSERT INTO `syspermissionresources` VALUES (1455, '3c6e8be51c62407c9d6a9072866c728d', '05568f678d8e43018b884f0bba9dd600');
INSERT INTO `syspermissionresources` VALUES (1456, '57ceef23523041babd9cec2026f3fd7b', '44406f79d290492aa113d528da21b317');
INSERT INTO `syspermissionresources` VALUES (1457, 'fa3278919bba435e857a341de20f95c2', '44406f79d290492aa113d528da21b317');
INSERT INTO `syspermissionresources` VALUES (1458, 'cc2b89e39e374669980b67dabbd727eb', 'bc413423f03f4f1d8d37178ae73eb9ed');
INSERT INTO `syspermissionresources` VALUES (1459, '7565855bdad4464a9b2ef86ae988b163', 'bc413423f03f4f1d8d37178ae73eb9ed');
INSERT INTO `syspermissionresources` VALUES (1460, '381f2e01b83742149361cb116c106e12', 'da63bf83542e47bdacdada8a8abf8166');
INSERT INTO `syspermissionresources` VALUES (1461, '3a459f7f04b64379bea2ae724cf3f78a', 'ca0e7a1a86384639a025a3fab07bd963');
INSERT INTO `syspermissionresources` VALUES (1462, 'ceb28608464548d58f191f29e987c858', '607959c1d66c4900835c30532ebf656e');
INSERT INTO `syspermissionresources` VALUES (1463, '75e4692e5c614f5abc7d7b5810cf59d9', '1a93fe93805849d68e478bb91c28480b');
INSERT INTO `syspermissionresources` VALUES (1464, '8faaec7f982d4d3b9847b955fc8d973c', '1a93fe93805849d68e478bb91c28480b');
INSERT INTO `syspermissionresources` VALUES (1465, '75e4692e5c614f5abc7d7b5810cf59d9', 'b4f51bedcc8d45448e980aec0f32a79f');
INSERT INTO `syspermissionresources` VALUES (1466, '8faaec7f982d4d3b9847b955fc8d973c', '680e74218d4e4703b6f672cb7d51b7b9');
INSERT INTO `syspermissionresources` VALUES (1467, 'de484d1d48ce4b42b086f51b62af403f', '9f27719619c244879c74ef032bf67684');
INSERT INTO `syspermissionresources` VALUES (1468, '774d0cdd7c8c443e868c8192d787ff3b', '9f27719619c244879c74ef032bf67684');
INSERT INTO `syspermissionresources` VALUES (1469, 'de484d1d48ce4b42b086f51b62af403f', '669021ae338942df96d09b1ffe0729b9');
INSERT INTO `syspermissionresources` VALUES (1470, '774d0cdd7c8c443e868c8192d787ff3b', '8f22d9489e3b488d8ee59a76377ee96b');
INSERT INTO `syspermissionresources` VALUES (1471, 'dca0b9b3bf664e9795c63bcf78633946', '938b9dff2a27416abf6ae6ac21eaaaad');
INSERT INTO `syspermissionresources` VALUES (1472, '1d34b3ce43ae4d8f962a8b27381a3dec', '670eb3b034d34a82a6053de088e27d0a');
INSERT INTO `syspermissionresources` VALUES (1473, '211fa9879cdc41b7b7e8ed3fe308278e', 'decb896d7fee40f09a958647cf14b849');
INSERT INTO `syspermissionresources` VALUES (1474, '99d76e6d914d42cf9765ff1b6927d1f7', '8dab213a3c11412795f51a834ba6bd05');
INSERT INTO `syspermissionresources` VALUES (1475, 'b6e330a0c462407590a51a6e1063677a', 'b0857fe7e73e487798150bd09b2063f6');
INSERT INTO `syspermissionresources` VALUES (1476, 'de2ae43b2077478ead903fa969172e1c', 'c0b306017906415abce45445b5606bd6');
INSERT INTO `syspermissionresources` VALUES (1477, 'de2ae43b2077478ead903fa969172e1c', 'ef1afb617a754220a0b27ec0cb01efa8');
INSERT INTO `syspermissionresources` VALUES (1478, 'cfe10d0e303b4eb1acfb725110af3570', 'c74888ede5e74dce8a656d722836d8b1');
INSERT INTO `syspermissionresources` VALUES (1479, 'b6d19989f45c4c918a5588d5d339893a', 'c74888ede5e74dce8a656d722836d8b1');
INSERT INTO `syspermissionresources` VALUES (1480, 'b6d19989f45c4c918a5588d5d339893a', 'cf8e8bd2ea2549ae9a4cfe7356c04be4');
INSERT INTO `syspermissionresources` VALUES (1481, '621036c4c1e94863a8600c3f771ed176', 'a046d8a39d3b44d694d8c7720cd6a7d2');
INSERT INTO `syspermissionresources` VALUES (1482, 'a3358191e3084c8a906fdd3fcd23cf65', '71e587d45b384855831dcfa5db98f8fe');
INSERT INTO `syspermissionresources` VALUES (1483, '0cb6e21b9d254dd881c201b577fa46f6', '71e587d45b384855831dcfa5db98f8fe');
INSERT INTO `syspermissionresources` VALUES (1484, '260db4f1552c4f09a5f6f999e896cdac', '9be9600772e3420a91ee019acc3ba379');
INSERT INTO `syspermissionresources` VALUES (1485, '6271f4f215a349538099bd5ac40a5ddc', '9be9600772e3420a91ee019acc3ba379');
INSERT INTO `syspermissionresources` VALUES (1486, '1931aeb8dd194f8282ebbd4085166f52', '62c2facd01254ffe99ce7692def6815f');
INSERT INTO `syspermissionresources` VALUES (1487, '7058d03b34d749f78d942940581cdbca', 'c128236bfefd4cf3b241357733581002');
INSERT INTO `syspermissionresources` VALUES (1488, '8acdceb3d436410b95c33ab0943df4bb', '3a3f2b720eb74733b2e661de78decea0');
INSERT INTO `syspermissionresources` VALUES (1489, '2f44f50ef9184640b7578bd1eeb9888c', '4ab032ea2c53438799d6b32b0eebb60b');
INSERT INTO `syspermissionresources` VALUES (1490, '8987621aa88a4479b62d665b09e309e6', '71b0cd5212874f21a2eb46d87278bc25');
INSERT INTO `syspermissionresources` VALUES (1491, 'bc3cdb8d556f48098fdbb1bbb06bd273', '71b0cd5212874f21a2eb46d87278bc25');
INSERT INTO `syspermissionresources` VALUES (1492, 'b0087f154eaf40be87fa3675768fd414', '336407134b204deebb6d335ffe080612');
INSERT INTO `syspermissionresources` VALUES (1493, 'c706d0be75314aefadedad63df77b056', '336407134b204deebb6d335ffe080612');
INSERT INTO `syspermissionresources` VALUES (1494, 'fdde776dc2f44554871b0706b5fe89fc', '7710a45b7cfa484183ee104ffe20f6c4');
INSERT INTO `syspermissionresources` VALUES (1495, '967733f255964ca3ac38a5cfdd4b3cd0', '84b8ba7c751a488885fbfdeb25a0eca3');
INSERT INTO `syspermissionresources` VALUES (1496, 'a75786d463494a21b2d8e0664141e92a', '76ffb8fb053647c5b5905b0f605104fe');
INSERT INTO `syspermissionresources` VALUES (1497, '4e150361440b4132baf9d65563ccb6c7', '5a8bd389628a4faaa96194435a14b384');
INSERT INTO `syspermissionresources` VALUES (1498, '36aaf8e88b324c3b8ce50276cb83e901', 'ad17b7a816ea45b09be8084be966ba4b');
INSERT INTO `syspermissionresources` VALUES (1499, '36aaf8e88b324c3b8ce50276cb83e901', '6c6b8190a0864463b68f9f514b1ad4d0');
INSERT INTO `syspermissionresources` VALUES (1500, '3093827bb1314f9ab1ba5068fa94bdf6', '37f5d0f7095b4093a772593dd4e28a39');
INSERT INTO `syspermissionresources` VALUES (1501, '64e00e15204f4b9e8a87a03e161d2cd6', '95a1e6ab0ea64972ab36f85f2940d8e9');
INSERT INTO `syspermissionresources` VALUES (1502, 'c2442a047cc940cb862f97ae1fb4a21f', '2a34da73c3ca436e9fb658f8a1639895');
INSERT INTO `syspermissionresources` VALUES (1503, 'b01cdaa1a9b14ba6970a31506f56ff23', 'eadf2a9785af45b08c5c42d6b1263133');
INSERT INTO `syspermissionresources` VALUES (1504, 'c095eeeee5064a739c7856ffaf8a7e60', '3b87a0950675425d9b46b0a9526acb46');
INSERT INTO `syspermissionresources` VALUES (1505, '12d63c0e375a47728d4c182372529b8e', '3b87a0950675425d9b46b0a9526acb46');
INSERT INTO `syspermissionresources` VALUES (1506, '12d63c0e375a47728d4c182372529b8e', '44b819a086634eb894a353009c49fc9d');
INSERT INTO `syspermissionresources` VALUES (1507, '139ded1d586348f78e3751c9dc8dec13', '7e6b62b229a84c0fa739373313f381c0');
INSERT INTO `syspermissionresources` VALUES (1508, '8fc70392b4fd405aabdb48c7a3bae7ed', '7e6b62b229a84c0fa739373313f381c0');
INSERT INTO `syspermissionresources` VALUES (1509, '8fc70392b4fd405aabdb48c7a3bae7ed', '005a590d129146aeb8a1989690235b30');
INSERT INTO `syspermissionresources` VALUES (1510, 'f1939cc01644444bba162f2a8325b91a', '3aa16023dbcd43cb8ccba4352f9b7e58');
INSERT INTO `syspermissionresources` VALUES (1511, 'd39647de8f5b4b2b844a4eb9fc089c8e', 'd8ad4df8213e491c96bd143e1eec7b4c');
INSERT INTO `syspermissionresources` VALUES (1512, '764fd678f9894d759a278734fb63d460', '0e17c398c3dc46ef90657028e5a81b0f');
INSERT INTO `syspermissionresources` VALUES (1513, '5774f59a2f3e46388dffe8f67986c9e3', '403e8ffa7ac9419a8ad7a2b4bdb27899');
INSERT INTO `syspermissionresources` VALUES (1514, 'c767b5f6098c46deb20d0d0dd943e5a5', 'b0e69631d5a34c12acdf7125e5598d84');
INSERT INTO `syspermissionresources` VALUES (1515, 'cb64a997e4c3494e861899acc09c6a28', 'b0e69631d5a34c12acdf7125e5598d84');
INSERT INTO `syspermissionresources` VALUES (1516, '99175b2b7be34a6fb29d4a7fc953a56f', 'bf7e0ea48b264555a194ccedddf25de5');
INSERT INTO `syspermissionresources` VALUES (1517, '8e87baf20e6b4926979c6296e79a38ec', 'bf7e0ea48b264555a194ccedddf25de5');
INSERT INTO `syspermissionresources` VALUES (1518, '44b76b0928494c6d90886568188c849a', 'a10f02c6ecc1470fbf6d449d5b84181e');
INSERT INTO `syspermissionresources` VALUES (1519, '9f6f4a6813354cd99d2ffa4bf5397759', '6b17f9cef55a4705a8ff445c5eb37e0e');
INSERT INTO `syspermissionresources` VALUES (1520, '1e480a95e4c14abf954953d813054a6d', 'dede44542c5644a69b72180e1abc368b');
INSERT INTO `syspermissionresources` VALUES (1521, '9ced5b62c30940c7ba9a7b4f33d46ad3', '0667a23692b244178cda49b8c8aa66bb');
INSERT INTO `syspermissionresources` VALUES (1522, '115cccb921fd423e9dd8fb31b2e6437b', '43bfdc37ca5a4473af0d483500390fe9');
INSERT INTO `syspermissionresources` VALUES (1523, '0aa99e1b05ff46f48e4356db9c42a182', 'ab714c30b67345048aee5397c9f34ffe');
INSERT INTO `syspermissionresources` VALUES (1524, '36107be91fc241a282eb7de274b0fc69', '7867d6ca24c94edcbd52fdb8cfe4a8de');
INSERT INTO `syspermissionresources` VALUES (1525, 'afb57aa600074540a550b5762f7aa6db', 'b697a7d318d34693b5e1f50988bcb325');
INSERT INTO `syspermissionresources` VALUES (1526, '4f4d36de8c024d8b8befca963b969f2e', 'adb6277a6b4f404faa45d94216ba30ff');
INSERT INTO `syspermissionresources` VALUES (1527, '7f4f7787832a4455aaa125a41ffad75b', '95bbc26180f3435f89803a95c630a39e');
INSERT INTO `syspermissionresources` VALUES (1528, 'cb3b881e83474c4cb19990a573d3b0da', '95bbc26180f3435f89803a95c630a39e');
INSERT INTO `syspermissionresources` VALUES (1529, 'e76cfef15b7846b9a5e76f735e7f6026', 'f14133ca94274ff197996e059a26ad49');
INSERT INTO `syspermissionresources` VALUES (1530, '2a3de832f5d44914a4b568991aa282dc', 'f14133ca94274ff197996e059a26ad49');
INSERT INTO `syspermissionresources` VALUES (1531, '59e5dcf269e54f09a85a4cd474d2bf14', 'c51b715175a54b968e7fdfa0883cb08e');
INSERT INTO `syspermissionresources` VALUES (1532, '1b7916b970e142888fe14821c935f579', '3e88a83fff2a476392eccffb64d25b1e');
INSERT INTO `syspermissionresources` VALUES (1533, 'b3db3d9edfc54405b520c044d805c496', 'db27cdfec51a4c30a066319ff6f08bb9');
INSERT INTO `syspermissionresources` VALUES (1534, 'dfe6741a3fce4ba0832d21843099a5ea', '0d91dbfe06594b8c82e72d525d9dc229');
INSERT INTO `syspermissionresources` VALUES (1535, '90b572963b2747ec960c020fa46a8694', 'a9f67a215b034107952d40f592cf1056');
INSERT INTO `syspermissionresources` VALUES (1536, '857de602ce344890822d00925e094269', '19d55187b06946ceac2a6c929935fa68');
INSERT INTO `syspermissionresources` VALUES (1537, 'ae95e0c103e7461f980bd9ab9fe50535', 'c5d0d01bf7b544828e1fbf3d61b9dd8a');
INSERT INTO `syspermissionresources` VALUES (1538, '4474d3586efb45278d6ede01e03865c2', 'f0eeb58d820b48cba5368da6b80184bf');
INSERT INTO `syspermissionresources` VALUES (1539, '8d30d9070cd24b5c8c42c01ab072fa47', '13bc9bdcb780479bbc5cb6a43b316b27');
INSERT INTO `syspermissionresources` VALUES (1540, 'a39091a91e8146ba89b69577970cabfe', '13bc9bdcb780479bbc5cb6a43b316b27');
INSERT INTO `syspermissionresources` VALUES (1541, 'e9e06c93c05e4ccb9ad29c8eb7872905', '3507e6049b6843c39d8d31b6e384818f');
INSERT INTO `syspermissionresources` VALUES (1542, 'e3f8ebac87ad41559185caeaab6b5f3f', '3507e6049b6843c39d8d31b6e384818f');
INSERT INTO `syspermissionresources` VALUES (1543, 'afd21f54283045338293c83b9d287603', '38c92008f5754e348302c79498961747');
INSERT INTO `syspermissionresources` VALUES (1544, '563c1db3575241deb84e5209af4d9df9', '0faa6ccdb1d741a99f45d8ad80d7d984');
INSERT INTO `syspermissionresources` VALUES (1545, '7dd2f764c9dd4af7aca79c1ac4c7d6ef', '72f0a0a4b44f4f21a0edd0858a6bbcc5');
INSERT INTO `syspermissionresources` VALUES (1546, '2bc126b7b8034d899bb6bf2887c86aad', '4a47d671d3294386a2ac9871d4f1425d');
INSERT INTO `syspermissionresources` VALUES (1547, '7607f3a5a4cf436e8186aefc5e49622d', 'd38488d83afa42b8a53e530ed870b2b5');
INSERT INTO `syspermissionresources` VALUES (1548, 'ed9b869a6fec4b63a8ab2b6ad181e301', '39adfb4206024d14ab38822555314e7a');
INSERT INTO `syspermissionresources` VALUES (1549, '1f0ae8efec9840f09a8b34e7acd16f5f', '39adfb4206024d14ab38822555314e7a');
INSERT INTO `syspermissionresources` VALUES (1550, 'ed9b869a6fec4b63a8ab2b6ad181e301', 'f4f131913fe64f07b212bccedd2852a1');
INSERT INTO `syspermissionresources` VALUES (1551, '829f7bb9b92a46aab434622e36d229f8', '43210759422e407da5f5ac5cc1f7fe3d');
INSERT INTO `syspermissionresources` VALUES (1552, '46c8721b9f004ba395201bd86c49375c', '43210759422e407da5f5ac5cc1f7fe3d');
INSERT INTO `syspermissionresources` VALUES (1553, '45cac3b5741644998511a4982e06acde', '374f5b9bffd443b9b2b4a830112951cb');
INSERT INTO `syspermissionresources` VALUES (1554, '25ba6537e4ef4bc8ad0530534975e426', '879f7ed98c6d4af5b07a7dd2c98833d5');
INSERT INTO `syspermissionresources` VALUES (1555, '2bb181ae95ef4fe39a78b5737616f448', '04acd924ee1f4ef8b60efd03a35998a3');
INSERT INTO `syspermissionresources` VALUES (1556, 'eaa9d9d6a58b4e999ced0cd59194968a', '7c539b8a982e45339ce7fb108e7b67ad');
INSERT INTO `syspermissionresources` VALUES (1557, '74e6343d6b144a24a219185e6fab2f4f', 'faa4855e9fbd4e208da026cfdfffd4f0');

-- ----------------------------
-- Table structure for sysresources
-- ----------------------------
DROP TABLE IF EXISTS `sysresources`;
CREATE TABLE `sysresources`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `priority` int NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `urlParentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `urlType` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysresources
-- ----------------------------
INSERT INTO `sysresources` VALUES ('000d1e49b1984cceacaf4dbc2a38be86', '话题管理', '删除标签', 15500, NULL, '/control/tag/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('005a590d129146aeb8a1989690235b30', '问答管理', '文件上传', 0, NULL, '/control/question/manage?method=upload&*', '7e6b62b229a84c0fa739373313f381c0', 2);
INSERT INTO `sysresources` VALUES ('01fe645ae71e4925892c159e948063e9', '会员管理', '私信列表', 27000, NULL, '/control/privateMessage/manage?method=privateMessageList&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('0321d480f7604cc797b765d0ad0753a6', '模板管理', '查询在线帮助分类', 10, NULL, '/control/helpType/manage?method=helpTypePageSelect&*', '922f6908c5a1434aba4b0f6f8f008c1c', 1);
INSERT INTO `sysresources` VALUES ('032710d13fbe479686fff302b9e2a2ce', '话题管理', '还原话题', 12600, NULL, '/control/topic/manage?method=reduction*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('042dc8a1921d4232bf4b01817011a960', '会员管理', '发表的话题', 26700, NULL, '/control/user/manage?method=allTopic*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('04acd924ee1f4ef8b60efd03a35998a3', '会员管理', '设置默认角色', 27850, '', '/control/userRole/manage?method=setAsDefault*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('05568f678d8e43018b884f0bba9dd600', '支付管理', '在线支付接口列表', 52000, NULL, '/control/onlinePaymentInterface/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('061d18aeb1044870b94cf6144a6004ea', '话题管理', '话题列表', 10000, NULL, '/control/topic/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('0667a23692b244178cda49b8c8aa66bb', '会员管理', '发红包', 27580, NULL, '/control/redEnvelope/giveRedEnvelope/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('07dc355d349a41379673ede8b926520e', '短信管理', '短信发送错误日志列表', 48550, NULL, '/control/sendSmsLog/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('088ec0225b114039aab46c17888125f2', '会员管理', '点赞列表', 27465, NULL, '/control/like/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('08a343e33ec44fe59228442dd56e96a3', '样式缩略图管理', '缩略图列表', 59000, NULL, '/control/thumbnail/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('0ae67eaf13ab4fc199a4406126dbaef4', '会员管理', '发表的评论', 26800, NULL, '/control/user/manage?method=allComment*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('0afab98ea71c4550a3020156aea1e7c3', '文件打包管理', '查询子目录', 0, NULL, '/control/filePackage/manage?method=querySubdirectory&*', '8ce45be5ea284190b9d76138d8d5f6b2', 1);
INSERT INTO `sysresources` VALUES ('0d5362ae1983422fa01bc03c079c850f', '话题管理', '删除评论', 13500, NULL, '/control/comment/manage?method=deleteComment*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('0d87e1fe8fdd45d48c5f259b8e423b2e', '模板管理', '布局编辑', 42600, NULL, '/control/layout/manage?method=editLayoutCode&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('0d91dbfe06594b8c82e72d525d9dc229', '会员管理', '注销账号', 27750, '', '/control/user/manage?method=cancelAccount*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('0e17c398c3dc46ef90657028e5a81b0f', '平台收益管理', '问答悬赏平台分成', 46450, NULL, '/control/questionRewardPlatformShare/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('0e2aa6a61c994088819af6a79c519ebf', '模板管理', '添加栏目', 43400, NULL, '/control/column/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('0e80dcd0f37940658faf50a8f3f9c331', '全站设置', '清空系统所有缓存', 49240, NULL, '/control/systemSetting/manage?method=clearAllCache&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('0faa6ccdb1d741a99f45d8ad80d7d984', '举报管理', '举报列表', 48572, '', '/control/report/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('10f76770be4040a4bf50d0efb4dce35a', '全站设置', '查看敏感词', 49550, NULL, '/control/filterWord/manage?method=view*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('11f96911716c4498b562658224750b02', '模板管理', '栏目列表', 43200, NULL, '/control/column/manage?method=list&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('120c74ce95624dbfacd192b90923958b', '模板管理', '查询资讯分页', 8, NULL, '/control/information/manage?method=ajax_searchInformationPage&*', 'ef3e2b9c32634f4088f4066880c70677', 1);
INSERT INTO `sysresources` VALUES ('129aa71dc14049ccb0715268f24281aa', '模板管理', '上传模板', 40550, NULL, '/control/template/manage?method=upload*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('13bc9bdcb780479bbc5cb6a43b316b27', '举报管理', '添加举报分类', 48563, '', '/control/reportType/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('16f7e69c2af54ccda1d8414b6cef7d32', '模板管理', '文件上传', 0, NULL, '/control/forum/manage?method=upload&*', 'ef3e2b9c32634f4088f4066880c70677', 2);
INSERT INTO `sysresources` VALUES ('1800baca07bc44ac986556dd30d37254', '模板管理', '资源新建文件夹', 41800, NULL, '/control/resource/manage?method=newFolder*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('19d55187b06946ceac2a6c929935fa68', '问答管理', '问答举报', 20630, '', '/control/questionReport/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('1a93fe93805849d68e478bb91c28480b', '问答管理', '添加问题', 20200, NULL, '/control/question/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('1a95dfe74bec4c0b986e9f96b001bc7e', '话题管理', '取消隐藏用户', 12630, NULL, '/control/topic/topicUnhideList*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('1ac87d3f1c0f4c99b9fdd9b713e304bf', '在线帮助管理', '移动在线帮助', 38900, NULL, '/control/help/manage?method=move*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('1d36080345f74b9a919b16bec5c235a6', '模板管理', '查询商品分类属性', 2, NULL, '/control/productTypeAttribute/manage?method=queryProductTypeAttribute&*', 'ef3e2b9c32634f4088f4066880c70677', 1);
INSERT INTO `sysresources` VALUES ('1f706068a9d547dea69f89a64c89a741', '留言管理', '查看', 16100, NULL, '/control/feedback/manage?method=view*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('214f40c320124e839e7d0d7b00af2cbd', '全站设置', '删除浏览量数据', 49300, NULL, '/control/systemSetting/manage?method=deletePageViewData&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('21a24ac2443043fbae750e4d6897e4be', '在线帮助管理', '添加分类', 38100, NULL, '/control/helpType/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('24bac9f0b1c84b0394a39c8933c7739d', '模板管理', '资源文件查看', 41600, NULL, '/control/resource/manage?method=showFileUI&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('2690d4cb2beb425daa06ff9faf8d97ec', '模板管理', '修改栏目', 43500, NULL, '/control/column/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('27ac945d8df8433894da098a1192476d', '员工管理', '删除角色', 31600, NULL, '/control/acl/manage?method=deleteRoles*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('27af89b4f9344c73b1b792334e7fdfe2', '会员管理', '会员注册项列表', 28400, NULL, '/control/userCustom/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('281466f5c0654966a68653b7383c6d9a', '话题管理', '添加评论', 13100, NULL, '/control/comment/manage?method=addComment*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('2a03829ee62c4283913dc440537f3fe9', '员工管理', '修改角色', 31500, NULL, '/control/acl/manage?method=editRoles*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('2a34da73c3ca436e9fb658f8a1639895', '会员管理', '提交的答案回复', 26970, NULL, '/control/user/manage?method=allAnswerReply*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('2a90880355b44225a7e42e3a394d020c', '全站设置', '升级列表', 50000, NULL, '/control/upgrade/manage?method=upgradeSystemList*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('2bf084e1e8d84e89a1c2da9c5f6c8f5d', '会员管理', '私信对话列表', 27100, NULL, '/control/privateMessage/manage?method=privateMessageChatList&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('2c60d084290e4ac196c490864a292ae1', '短信管理', '启用短信接口', 48530, NULL, '/control/smsInterface/manage?method=enableInterface*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('2e51f370f3c34d0bbfaf4a9f1ca7ee02', '全站设置', '数据库还原', 49800, NULL, '/control/dataBase/manage?method=reset&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('2f4d3ec6741b4552a27d20781426df12', '会员管理', '还原', 26500, NULL, '/control/user/manage?method=reduction*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('2f6e1c7e19024a23ad13442f8a082e45', '在线帮助管理', '查询帮助分类', 0, NULL, '/control/helpType/manage?method=helpTypePageSelect_move&*', '5ef5747987074212be7ef9cc9fdb50af', 1);
INSERT INTO `sysresources` VALUES ('31f98ef57f0a48a69c0ebb36c920dd1f', '会员管理', '删除角色', 27830, NULL, '/control/userRole/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('32361852ba844d1f9ccdb220ce3b3cb1', '模板管理', '版块引用代码', 43300, NULL, '/control/template/referenceCode*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('32ae2070e23d42ba8dc38de061e7ed47', '留言管理', '删除', 16300, NULL, '/control/feedback/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('3338673059d44af39b27bf4cddc15bcc', '会员管理', '还原提醒', 27450, NULL, '/control/remind/manage?method=reductionRemind&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('336407134b204deebb6d335ffe080612', '问答管理', '修改问题标签', 22200, NULL, '/control/questionTag/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('3507e6049b6843c39d8d31b6e384818f', '举报管理', '修改举报分类', 48566, '', '/control/reportType/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('35b5f850ff1c40fcbc9e57c1f2124a1b', '会员管理', '积分日志', 27500, NULL, '/control/pointLog/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('3686068be6704f78a2ec5e30b78f043f', '全站设置', '查询升级包列表', 1, NULL, '/control/upgrade/manage?method=queryUpgradePackageList&*', '2a90880355b44225a7e42e3a394d020c', 1);
INSERT INTO `sysresources` VALUES ('374f5b9bffd443b9b2b4a830112951cb', '问答管理', '恢复答案回复', 21550, '', '/control/answer/manage?method=recoveryReply*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('37f5d0f7095b4093a772593dd4e28a39', '会员管理', '提交的问题', 26950, NULL, '/control/user/manage?method=allQuestion*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('38c92008f5754e348302c79498961747', '举报管理', '删除举报分类', 48569, '', '/control/reportType/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('399207e1956d465a8eb536e80ee5f5f0', '系统通知管理', '系统通知列表', 46000, NULL, '/control/systemNotify/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('39adfb4206024d14ab38822555314e7a', '举报管理', '修改举报', 48578, '', '/control/report/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('3a3f2b720eb74733b2e661de78decea0', '问答管理', '审核答案回复', 21600, NULL, '/control/answer/manage?method=auditAnswerReply&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('3aa16023dbcd43cb8ccba4352f9b7e58', '问答管理', '删除追加问题', 20670, NULL, '/control/question/manage?method=deleteAppendQuestion*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('3b5ccd12071e49ccac480cc55b3f520a', '话题管理', '收藏用户', 12620, NULL, '/control/topicFavorite/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('3b87a0950675425d9b46b0a9526acb46', '问答管理', '追加问题', 20650, NULL, '/control/question/manage?method=appendQuestion*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('3c7306248d7a4788894ca4d9107e233e', '全站设置', '修改数据库密码', 49230, NULL, '/control/systemSetting/manage?method=updateDatabasePassword&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('3c98bf1cf2294c059cf0241fba5cfa00', '模板管理', '导入模板列表', 40500, NULL, '/control/template/manage?method=importTemplateList*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('3cb6db13692b4bebb71da2045154efe7', '会员管理', '支付校验日志分页', 0, NULL, '/control/paymentLog/manage?method=ajax_paymentVerificationLogPage&*', 'c459ab7aa99e4f528c961dd45df4d8e5', 1);
INSERT INTO `sysresources` VALUES ('3d630529412f44c8be0c409bf12bbba7', '模板管理', '资源文件下载', 42000, NULL, '/control/resource/manage?method=download*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('3e88a83fff2a476392eccffb64d25b1e', '会员卡管理', '查看会员卡赠送任务', 28778, '', '/control/membershipCardGiftTask/manage?method=view*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('403e8ffa7ac9419a8ad7a2b4bdb27899', '第三方服务管理', '第三方登录接口列表', 54000, NULL, '/control/thirdPartyLoginInterface/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('407a285c7ec744a4b284b85339c296ec', '话题管理', '查看话题', 12000, NULL, '/control/topic/manage?method=view*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('412fd399deac43cb8354a15db3b47bbf', '模板管理', '添加布局', 42300, NULL, '/control/layout/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('41a824d4663243b39b2d34256eb3dbf2', '模板管理', '查询\'更多\'', 0, NULL, '/control/layout/manage?method=ajax_more&*', 'ef3e2b9c32634f4088f4066880c70677', 1);
INSERT INTO `sysresources` VALUES ('43210759422e407da5f5ac5cc1f7fe3d', '员工管理', '修改员工自身信息', 30100, '', '/control/staff/manage?method=editSelfInfo*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('43bfdc37ca5a4473af0d483500390fe9', '会员管理', '红包分配', 27585, NULL, '/control/redEnvelope/redEnvelopeAmountDistribution/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('43c2cd191bd14af18ecabe5fa81b60cc', '在线帮助管理', '删除分类', 38300, NULL, '/control/helpType/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('44406f79d290492aa113d528da21b317', '支付管理', '添加在线支付接口', 52100, NULL, '/control/onlinePaymentInterface/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('44b819a086634eb894a353009c49fc9d', '问答管理', '文件上传', 0, NULL, '/control/question/manage?method=upload&*', '3b87a0950675425d9b46b0a9526acb46', 2);
INSERT INTO `sysresources` VALUES ('453b956048b044cfb4f3df143624aa68', '平台收益管理', '解锁话题隐藏内容分成', 46400, NULL, '/control/topicUnhidePlatformShare/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('45f5ca24bf7441c08680d66b3aa6a8f6', '友情链接管理', '删除', 17300, NULL, '/control/links/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('47b25f8c2c6844c39025bce8ddfaa7fb', '系统', '后台首页', 0, NULL, '/control/manage/home*', 'be324f36fad2467688724082c285d16e', 1);
INSERT INTO `sysresources` VALUES ('4a47d671d3294386a2ac9871d4f1425d', '举报管理', '删除举报', 48581, '', '/control/report/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('4ab032ea2c53438799d6b32b0eebb60b', '问答管理', '问题标签列表', 22000, NULL, '/control/questionTag/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('4bac717853cb4a7faf79905ea6cad412', '模板管理', '版块源码编辑', 43100, NULL, '/control/forumCode/manage?method=source&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('4c891b4c92af4f6783e6b7d1b245e345', '会员管理', '收藏夹列表', 27460, NULL, '/control/favorite/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('4ce5c77610864d8885298a21793732ad', '话题管理', '修改标签', 15300, NULL, '/control/tag/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('4da6c6c0d67b49b7879bc160eac08c32', '系统', '系统后台', 99999999, NULL, '/control/**', NULL, 3);
INSERT INTO `sysresources` VALUES ('4de9ba43424146678772a69d0cd6ea4d', '模板管理', '下载导出模板', 40800, NULL, '/control/template/manage?method=templateDownload&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('513d70ed7f3e46eb91f8ea4bbfc89317', '会员管理', '删除会员注册项', 28700, NULL, '/control/userCustom/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('515cd5fbdd72423ca083d3f44217fd25', '短信管理', '添加短信接口', 48510, NULL, '/control/smsInterface/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('517d8e1ea108440ebf3f01ca0f7bd322', '话题管理', '文件上传', 0, NULL, '/control/topic/manage?method=upload&*', 'a1e816f03692448698b01a7ac01d2964', 2);
INSERT INTO `sysresources` VALUES ('51a9dc467fb54948a1c71dc2365b5049', '全站设置', '删除用户登录日志数据', 49500, NULL, '/control/systemSetting/manage?method=deleteUserLoginLogData&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('521ab07ea093458b8c0711c9783cfdec', '话题管理', '审核回复', 14600, NULL, '/control/comment/manage?method=auditReply*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('52bc2dbe4c0e437ebf93ce8b6575c6bb', '友情链接管理', '修改', 17200, NULL, '/control/links/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('53662c3fbcd145068ba4760a6d1d39a9', '模板管理', '查询问题标签分页', 11, NULL, '/control/questionTag/manage?method=questionTagPage&*', 'ef3e2b9c32634f4088f4066880c70677', 1);
INSERT INTO `sysresources` VALUES ('53ae04bf6468464ea15826a8d1bb7417', '留言管理', '留言列表', 16000, NULL, '/control/feedback/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('5417c2d6e8a8453b972682fee374ec3a', '在线帮助管理', '在线帮助列表', 38500, NULL, '/control/help/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('5485ebcbc00541458cd96eb6deda2eab', '话题管理', '审核评论', 13600, NULL, '/control/comment/manage?method=auditComment*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('557735f0f8ba4626b78224719e77cea3', '会员管理', '修改禁止的用户名称', 28760, NULL, '/control/disableUserName/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('559123bb91364943b1853c875901a598', '话题管理', '查询标签', 0, NULL, '/control/tag/manage?method=allTag&*', '8f440666921741ed8c4804732b34d75d', 1);
INSERT INTO `sysresources` VALUES ('567f89abd7e04a1988c08b9764cf918c', '模板管理', '查询在线帮助分页', 10, NULL, '/control/help/manage?method=ajax_searchHelpPage&*', 'ef3e2b9c32634f4088f4066880c70677', 1);
INSERT INTO `sysresources` VALUES ('58dc8b9d637a4ceda36b7083cd94bb76', '会员管理', '关注列表', 27470, NULL, '/control/follow/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('59bb52174d2e4f318e0c5ed09f9bedb3', '模板管理', '资源文件上传', 41700, NULL, '/control/resource/manage?method=upload&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('5a8bd389628a4faaa96194435a14b384', '问答管理', '全部待审核答案回复', 22600, NULL, '/control/question/allAuditAnswerReply*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('5ad1e2bb0bc846a1a0fa4da30031a719', '话题管理', '图片上传', 0, NULL, '/control/comment/manage?method=uploadImage&*', 'b47dd6012f88406795205481d2916fd2', 2);
INSERT INTO `sysresources` VALUES ('5af3e8652bd14b48aea03fac91e1e0b7', '模板管理', '修改布局', 42400, NULL, '/control/layout/manage?method=editLayout&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('5b89f2dc65b54197940c9f1b614c669e', '模板管理', '布局列表', 42200, NULL, '/control/layout/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('5c9e1ad37d2241d6b5eebe4d591f5da5', '会员管理', '支付日志', 27560, NULL, '/control/paymentLog/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('5d697fdf29434ff4bbcd5bc6f1a9a415', '全站设置', '立即升级', 51100, NULL, '/control/upgrade/manage?method=upgradeNow&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('5dad80e6fa6e4255b34181bd17c5fe02', '模板管理', '校验url名称', 0, NULL, '/control/layout/manage?method=checkUrlName&*', '5af3e8652bd14b48aea03fac91e1e0b7', 1);
INSERT INTO `sysresources` VALUES ('5e5fc2f249c144f198b3aad24f665cdd', '文件打包管理', '删除压缩文件', 45200, NULL, '/control/filePackage/manage?method=delete&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('5ef5747987074212be7ef9cc9fdb50af', '在线帮助管理', '修改在线帮助', 38700, NULL, '/control/help/manage?method=edit&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('607959c1d66c4900835c30532ebf656e', '问答管理', '查看问题', 20100, NULL, '/control/question/manage?method=view*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('607bbd310ec147519e8f988adf4c30a6', '话题管理', '修改评论', 13300, NULL, '/control/comment/manage?method=editComment*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('62c2facd01254ffe99ce7692def6815f', '问答管理', '删除答案回复', 21500, NULL, '/control/answer/manage?method=deleteAnswerReply*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('64730717bf3e42169b22ff5f4529b0a8', '话题管理', '话题搜索', 12700, NULL, '/control/topic/search*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('657208b0b240489da050e672cbe10a85', '话题管理', '查询标签', 0, NULL, '/control/tag/manage?method=allTag&*', 'a1e816f03692448698b01a7ac01d2964', 1);
INSERT INTO `sysresources` VALUES ('669021ae338942df96d09b1ffe0729b9', '问答管理', '查询标签', 0, NULL, '/control/questionTag/manage?method=allTag&*', '9f27719619c244879c74ef032bf67684', 1);
INSERT INTO `sysresources` VALUES ('66af4e938332484f8a4f6e764a1d106c', '会员管理', '修改会员注册项', 28600, NULL, '/control/userCustom/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('670eb3b034d34a82a6053de088e27d0a', '问答管理', '还原问题', 20500, NULL, '/control/question/manage?method=reduction*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('673e0fdf492e4d97a19a761f8dcc203b', '短信管理', '短信接口列表', 48500, NULL, '/control/smsInterface/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('67cc5e6e087c4c6192d8448402765751', '会员管理', '提现校验', 1, NULL, '/control/user/manage?method=withdrawVerification&*', 'c459ab7aa99e4f528c961dd45df4d8e5', 1);
INSERT INTO `sysresources` VALUES ('680e74218d4e4703b6f672cb7d51b7b9', '问答管理', '文件上传', 0, NULL, '/control/question/manage?method=upload&*', '1a93fe93805849d68e478bb91c28480b', 2);
INSERT INTO `sysresources` VALUES ('685794fae29a45b6a5d61416b39d7f71', '模板管理', '删除版块', 43000, NULL, '/control/forum/manage?method=delete&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('6a87425f50f14afc98ebcc42c1e54637', '会员管理', '会员等级列表', 28000, NULL, '/control/userGrade/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('6b12cf5fb0ce4927979775f3c76419ab', '全站设置', '数据库备份', 49700, NULL, '/control/dataBase/manage?method=backup*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('6b17f9cef55a4705a8ff445c5eb37e0e', '模板管理', '资源文件编辑', 41650, NULL, '/control/resource/manage?method=editFile*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('6c6b8190a0864463b68f9f514b1ad4d0', '问答管理', '查询标签', 0, NULL, '/control/questionTag/manage?method=questionTagPage&*', 'ad17b7a816ea45b09be8084be966ba4b', 1);
INSERT INTO `sysresources` VALUES ('70737a78770041a18bccc71b4d17ecf8', '模板管理', '修改版块代码', 41200, NULL, '/control/forumCode/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('70889956fee3475fb8487313d46f94c7', '模板管理', '添加模板', 40100, NULL, '/control/template/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('71b0cd5212874f21a2eb46d87278bc25', '问答管理', '添加问题标签', 22100, NULL, '/control/questionTag/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('71e587d45b384855831dcfa5db98f8fe', '问答管理', '修改答案回复', 21400, NULL, '/control/answer/manage?method=editAnswerReply*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('72f0a0a4b44f4f21a0edd0858a6bbcc5', '举报管理', '举报处理', 48575, '', '/control/report/manage?method=reportHandle*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('74e391ff7c0d41aeab64e9373f16776a', '会员卡管理', '会员卡列表', 28780, NULL, '/control/membershipCard/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('75349725155243d2932fc754cea5f3ab', '浏览量管理', '浏览量列表', 44000, NULL, '/control/pageView/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('75a262c3c48d4e21817541cd87fac000', '在线帮助管理', '合并分类', 38400, NULL, '/control/helpType/manage?method=merger*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('76ffb8fb053647c5b5905b0f605104fe', '问答管理', '全部待审核答案', 22500, NULL, '/control/question/allAuditAnswer*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('7710a45b7cfa484183ee104ffe20f6c4', '问答管理', '删除问题标签', 22300, NULL, '/control/questionTag/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('77b55fcc33184a009e1376e20e294eca', '模板管理', '查询话题标签', 6, NULL, '/control/tag/manage?method=allTag&*', 'ef3e2b9c32634f4088f4066880c70677', 1);
INSERT INTO `sysresources` VALUES ('77b721b60c014517a73134daaad021d9', '模板管理', '查询商品分类', 1, NULL, '/control/product/type/manage?method=productTypePageSelect&*', '5af3e8652bd14b48aea03fac91e1e0b7', 1);
INSERT INTO `sysresources` VALUES ('7867d6ca24c94edcbd52fdb8cfe4a8de', '话题管理', '恢复评论', 13550, NULL, '/control/comment/manage?method=recoveryComment*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('7c539b8a982e45339ce7fb108e7b67ad', '问答管理', '问答点赞用户', 20680, '', '/control/questionLike/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('7caf26294048452cafbb5972ef502d88', '会员管理', '还原系统通知', 27350, NULL, '/control/systemNotify/manage?method=reductionSubscriptionSystemNotify&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('7d7842f34d6940738a767b3d7dd9a6ec', '会员管理', '充值', 27570, NULL, '/control/user/manage?method=payment&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('7db8b118e2ec4ce9992e027eddda1648', '模板管理', '版块列表', 42700, NULL, '/control/forum/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('7dee9a00f4dc474fa502cf0f8bc83224', '会员管理', '添加会员注册项', 28500, NULL, '/control/userCustom/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('7df278798d2f448a90ea0be3f76fc629', '模板管理', '查询版块代码', 1, NULL, '/control/forumCode/query?method=forumCode*', '90cd4aa4e6ef4154849630ae701fe37d', 1);
INSERT INTO `sysresources` VALUES ('7e6b62b229a84c0fa739373313f381c0', '问答管理', '修改追加问题', 20660, NULL, '/control/question/manage?method=editAppendQuestion*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('7e763e0f214d42bfb2ba3cbeb9178c56', '员工管理', '删除员工', 31100, NULL, '/control/staff/manage?method=deleteStaff*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('7ed8aa6ff34241329b9183e2f114ca64', '会员管理', '添加角色', 27810, NULL, '/control/userRole/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('7f22ef589ea74b1c874b10fa6cd36b99', '话题管理', '删除话题', 12500, NULL, '/control/topic/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('7f520a1fe9ef45f79c7ac1d01a8c2e56', '模板管理', '查询资讯分页', 9, NULL, '/control/information/manage?method=ajax_searchInformationPage&*', '922f6908c5a1434aba4b0f6f8f008c1c', 1);
INSERT INTO `sysresources` VALUES ('803dc508fa8542f1a2be86cdb85b19f1', '会员管理', '会员角色列表', 27800, NULL, '/control/userRole/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('81d79685ac4240c281dcda09bba59b53', '模板管理', '查询商品扩展属性', 5, NULL, '/control/productAttribute/manage?method=ajax_productAttributeExpansion&*', '922f6908c5a1434aba4b0f6f8f008c1c', 1);
INSERT INTO `sysresources` VALUES ('822e43c8499149d59fd5ee6f77153d35', '会员管理', '发表的回复', 26900, NULL, '/control/user/manage?method=allReply*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('82462825c1dd4ecdb3ce22e68b70f5e9', '会员管理', '添加等级', 28100, NULL, '/control/userGrade/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('838e778a22c0424ab11914d1e3b44379', '会员管理', '修改角色', 27820, NULL, '/control/userRole/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('84b8ba7c751a488885fbfdeb25a0eca3', '问答管理', '全部待审核问题', 22400, NULL, '/control/question/allAuditQuestion*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('862368fdca464ebbb2937623648880d1', '话题管理', '全部待审核话题', 15600, NULL, '/control/topic/allAuditTopic*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('86307e97f57a4c8daecd6b13ea4a60e8', '模板管理', '校验url名称', 0, NULL, '/control/layout/manage?method=checkUrlName&*', '412fd399deac43cb8354a15db3b47bbf', 1);
INSERT INTO `sysresources` VALUES ('879f7ed98c6d4af5b07a7dd2c98833d5', '会员管理', '积分日志明细', 27510, '', '/control/pointLog/manage?method=show&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('87ad98da3e7642e68109c33199968181', '在线帮助管理', '在线帮助分类列表', 38000, NULL, '/control/helpType/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('8b1d44fee22c460dabb3381e97f1820f', '模板管理', '查询资源子节点', 0, NULL, '/control/resource/query*', 'd72acdb07d1540bab400c194ba3329f8', 1);
INSERT INTO `sysresources` VALUES ('8b9594bb5b8343dbadca64a4f8066b6e', '话题管理', '添加回复', 14100, NULL, '/control/comment/manage?method=addReply*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('8ce45be5ea284190b9d76138d8d5f6b2', '文件打包管理', '打包文件', 45500, NULL, '/control/filePackage/manage?method=package*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('8dab213a3c11412795f51a834ba6bd05', '问答管理', '采纳答案', 20700, NULL, '/control/answer/manage?method=adoptionAnswer*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('8dd0e634ff4647e0b438b75fbde1148f', '会员卡管理', '修改会员卡', 28790, NULL, '/control/membershipCard/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('8f22d9489e3b488d8ee59a76377ee96b', '问答管理', '文件上传', 0, NULL, '/control/question/manage?method=upload&*', '9f27719619c244879c74ef032bf67684', 2);
INSERT INTO `sysresources` VALUES ('8f440666921741ed8c4804732b34d75d', '话题管理', '修改话题', 12300, NULL, '/control/topic/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('901d1d332b214483a90b5ef1738077a1', '话题管理', '图片上传', 0, NULL, '/control/comment/manage?method=uploadImage&*', '281466f5c0654966a68653b7383c6d9a', 2);
INSERT INTO `sysresources` VALUES ('90cd4aa4e6ef4154849630ae701fe37d', '模板管理', '版块代码列表', 41000, NULL, '/control/forumCode/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('922f6908c5a1434aba4b0f6f8f008c1c', '模板管理', '添加版块', 42800, NULL, '/control/forum/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('9246901afe1b4d3fb501c3fc51be23c5', '会员管理', '修改等级', 28200, NULL, '/control/userGrade/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('938b9dff2a27416abf6ae6ac21eaaaad', '问答管理', '删除问题', 20400, NULL, '/control/question/manage?method=deleteQuestion*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('95a1e6ab0ea64972ab36f85f2940d8e9', '会员管理', '提交的答案', 26960, NULL, '/control/user/manage?method=allAnswer*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('95bbc26180f3435f89803a95c630a39e', '会员卡管理', '添加会员卡赠送任务', 28772, '', '/control/membershipCardGiftTask/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('97bc7db41f8743978c70a104e49dd1c5', '会员卡管理', '删除会员卡', 28795, NULL, '/control/membershipCard/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('98e03673f0c847a2bc8f93008b1729ef', '话题管理', '点赞用户', 12625, NULL, '/control/topicLike/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('9a797b54d630450cb3cfadb1f2d94243', '会员卡管理', '会员卡订单列表', 28797, NULL, '/control/membershipCardOrder/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('9be9600772e3420a91ee019acc3ba379', '问答管理', '添加答案回复', 21300, NULL, '/control/answer/manage?method=addAnswerReply*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('9c3ddbaa3457496ab9315ce6f271db8d', '在线帮助管理', '还原在线帮助', 39000, NULL, '/control/help/manage?method=reduction*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('9c443950eb9746b49c7314dbf8e3d523', '全站设置', '基本设置', 49000, NULL, '/control/systemSetting/manage/edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('9c44a7e09b2744d58bccef05d11cdca7', '模板管理', '查询品牌分页', 6, NULL, '/control/brand/manage?method=ajax_queryBrandSelect&*', '922f6908c5a1434aba4b0f6f8f008c1c', 1);
INSERT INTO `sysresources` VALUES ('9c5bebaa673b45bd9d1c5cba7a9dead9', '模板管理', '导入模板', 40600, NULL, '/control/template/manage?method=import&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('9e9721bf5cad43bdba3a7adecb47726f', '友情链接管理', '添加', 17100, NULL, '/control/links/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('9f27719619c244879c74ef032bf67684', '问答管理', '修改问题', 20300, NULL, '/control/question/manage?method=editQuestion*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('a0116147816444319d37e0e1562189b0', '模板管理', '删除版块代码', 41300, NULL, '/control/forumCode/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('a02b3694e4d542398d3a39f4156e992f', '会员管理', '添加', 26200, NULL, '/control/user/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('a046d8a39d3b44d694d8c7720cd6a7d2', '问答管理', '删除答案', 21100, NULL, '/control/answer/manage?method=delete&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('a10f02c6ecc1470fbf6d449d5b84181e', '第三方服务管理', '删除第三方登录接口', 54300, NULL, '/control/thirdPartyLoginInterface/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('a15cab18081d4ec7b85b03646b873166', '会员管理', '查看支付日志', 27565, NULL, '/control/paymentLog/manage?method=show&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('a1e816f03692448698b01a7ac01d2964', '话题管理', '添加话题', 12100, NULL, '/control/topic/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('a2b73c63005149699adb7fb395467b49', '模板管理', '版块代码源码编辑', 41400, NULL, '/control/forumCode/manage?method=forumSource&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('a4775968ad2e4b238ed49b4e4808a011', '话题管理', '修改回复', 14300, NULL, '/control/comment/manage?method=editReply*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('a5068ccfff8b42cf920f56aa780cbdad', '全站设置', '查询还原进度', 0, NULL, '/control/dataBase/manage?method=queryResetProgress&*', '2e51f370f3c34d0bbfaf4a9f1ca7ee02', 1);
INSERT INTO `sysresources` VALUES ('a5cb52cd59a040a1b34a7f401361fe31', '会员管理', '删除私信', 27200, NULL, '/control/privateMessage/manage?method=deletePrivateMessageChat&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('a6bc8f310a2642d7ad537e620eff3f85', '在线帮助管理', '查询帮助分类', 0, NULL, '/control/helpType/manage?method=helpTypePageSelect_move&*', '5417c2d6e8a8453b972682fee374ec3a', 1);
INSERT INTO `sysresources` VALUES ('a7bdf3297cc2431f9dd3f748374bf877', '模板管理', '查询\'更多\'', 1, NULL, '/control/layout/manage?method=ajax_more&*', '922f6908c5a1434aba4b0f6f8f008c1c', 1);
INSERT INTO `sysresources` VALUES ('a7f6e1dcc5e943f48f4270dcfa056557', '会员管理', '粉丝列表', 27475, NULL, '/control/follower/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('a8b4ea7341944f03b4c468b0354371cc', '模板管理', '资源重命名', 41900, NULL, '/control/resource/manage?method=rename*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('a92781bed96b4a6e9f8348321ac2ddbc', '模板管理', '查询商品分类属性', 3, NULL, '/control/productTypeAttribute/manage?method=queryProductTypeAttribute&*', '922f6908c5a1434aba4b0f6f8f008c1c', 1);
INSERT INTO `sysresources` VALUES ('a9c55c3b3b45494dacef8fb058c7e7a7', '话题管理', '文件上传', 0, NULL, '/control/topic/manage?method=upload&*', '8f440666921741ed8c4804732b34d75d', 2);
INSERT INTO `sysresources` VALUES ('a9f67a215b034107952d40f592cf1056', '话题管理', '话题举报', 12650, '', '/control/topicReport/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('aa355abf953e42078517a3dded03e785', '系统通知管理', '修改系统通知', 46200, NULL, '/control/systemNotify/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('aa971ce1dc6f43e3b026d235fa7263e6', '模板管理', '添加版块代码', 41100, NULL, '/control/forumCode/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('ab10d2b5dc5e48a69727a6292ca072b4', '样式缩略图管理', '添加缩略图裁剪尺寸', 59100, NULL, '/control/thumbnail/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('ab714c30b67345048aee5397c9f34ffe', '会员管理', '收红包', 27590, NULL, '/control/redEnvelope/receiveRedEnvelope/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('ab73276d43184b2db5fa5a6bd76b1def', '模板管理', '删除布局', 42500, NULL, '/control/layout/manage?method=deleteLayout&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('abdea9b5ed4c4636a55062cf4f36ea0a', '在线帮助管理', '查看在线帮助', 39100, NULL, '/control/help/manage?method=view&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('ad17b7a816ea45b09be8084be966ba4b', '问答管理', '问题搜索', 22700, NULL, '/control/question/search*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('ad32af8a5d784a979da7b5362ca77882', '模板管理', '模板设为使用', 40400, NULL, '/control/template/manage?method=setTemplate*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('adb6277a6b4f404faa45d94216ba30ff', '会员卡管理', '会员卡赠送任务列表', 28770, '', '/control/membershipCardGiftTask/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('ae66d24114ea4cf28923f5fe8757e4e6', '全站设置', '服务器节点参数', 49900, NULL, '/control/systemSetting/manage?method=nodeParameter*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('ae6eeb2fbd23472d89022d9a7366b0cd', '模板管理', '查询在线帮助分页', 11, NULL, '/control/help/manage?method=ajax_searchHelpPage&*', '922f6908c5a1434aba4b0f6f8f008c1c', 1);
INSERT INTO `sysresources` VALUES ('afa39379327e4461b3444cf9b416efae', '系统通知管理', '添加系统通知', 46100, NULL, '/control/systemNotify/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('b002385af8e245aa823bf75adbd96eac', '模板管理', '查询商品分类', 1, NULL, '/control/product/type/manage?method=productTypePageSelect&*', 'ef3e2b9c32634f4088f4066880c70677', 1);
INSERT INTO `sysresources` VALUES ('b0857fe7e73e487798150bd09b2063f6', '问答管理', '取消采纳答案', 20800, NULL, '/control/answer/manage?method=cancelAdoptionAnswer*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('b0e69631d5a34c12acdf7125e5598d84', '第三方服务管理', '添加第三方登录接口', 54100, NULL, '/control/thirdPartyLoginInterface/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('b15ff404e0b64afcaa888311b1d0b0c8', '话题管理', '查询标签', 0, NULL, '/control/tag/manage?method=allTag&*', '64730717bf3e42169b22ff5f4529b0a8', 1);
INSERT INTO `sysresources` VALUES ('b306453ca1f24bdabc62261b687e44a2', '在线帮助管理', '文件上传', 0, NULL, '/control/help/manage?method=upload&*', 'c673918d949d4cc3aa38b43660b354b8', 2);
INSERT INTO `sysresources` VALUES ('b47dd6012f88406795205481d2916fd2', '话题管理', '引用评论', 13400, NULL, '/control/comment/manage?method=addQuote*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('b4f51bedcc8d45448e980aec0f32a79f', '问答管理', '查询标签', 0, NULL, '/control/questionTag/manage?method=allTag&*', '1a93fe93805849d68e478bb91c28480b', 1);
INSERT INTO `sysresources` VALUES ('b697a7d318d34693b5e1f50988bcb325', '话题管理', '恢复评论回复', 14550, NULL, '/control/comment/manage?method=recoveryReply*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('b77f796a65694fed859fe1684d365589', '模板管理', '目录重命名', 40560, NULL, '/control/template/manage?method=directoryRename&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('b794e4584425495a8070fdc71d09258b', '模板管理', '查询商品分类', 2, NULL, '/control/product/type/manage?method=productTypePageSelect&*', '922f6908c5a1434aba4b0f6f8f008c1c', 1);
INSERT INTO `sysresources` VALUES ('b805b7dbbf0140b2a2fcb962e3fe4a4d', '在线帮助管理', '修改分类', 38200, NULL, '/control/helpType/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('b83b0d29f07e4249b70067e00f54ef67', '会员管理', '添加禁止的用户名称', 28755, NULL, '/control/disableUserName/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('b9512c1642a54356b453ef6e9df32aee', '模板管理', '模板列表', 40000, NULL, '/control/template/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('baa1c014792c40edae687b4e169657ef', '全站设置', '重建话题索引', 49200, NULL, '/control/systemSetting/manage?method=rebuildTopicIndex&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('bc248879066f4af58c99a822f4228015', '模板管理', '删除资源', 42100, NULL, '/control/resource/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('bc413423f03f4f1d8d37178ae73eb9ed', '支付管理', '修改在线支付接口', 52200, NULL, '/control/onlinePaymentInterface/manage?method=edit&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('bce6c687ee5645cda651cd6dfff74fa4', '话题管理', '标签列表', 14800, NULL, '/control/tag/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('bd36d2aa14774c8d81b56fc7fde02b4f', '短信管理', '删除短信接口', 48540, NULL, '/control/smsInterface/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('bdfb84d1d65b4325aa8a74a61a70a6a3', '模板管理', '查询栏目', 0, NULL, '/control/column/manage?method=queryColumn*', '11f96911716c4498b562658224750b02', 1);
INSERT INTO `sysresources` VALUES ('be324f36fad2467688724082c285d16e', '系统', '后台框架', 88888888, NULL, '/control/manage/index*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('bee77a45dcdb428db42dcb2317648fe9', '员工管理', '修改员工', 30000, NULL, '/control/staff/manage?method=editStaff*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('bf7e0ea48b264555a194ccedddf25de5', '第三方服务管理', '修改第三方登录接口', 54200, NULL, '/control/thirdPartyLoginInterface/manage?method=edit&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c027259a21a240d48b73c1683a346056', '会员管理', '删除禁止的用户名称', 28765, NULL, '/control/disableUserName/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c09977cf64ef4a008e672a4ba8d8e004', '话题管理', '全部待审核评论 ', 15800, NULL, '/control/topic/allAuditComment*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c0b306017906415abce45445b5606bd6', '问答管理', '添加答案', 20900, NULL, '/control/answer/manage?method=add&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c128236bfefd4cf3b241357733581002', '问答管理', '审核答案', 21200, NULL, '/control/answer/manage?method=auditAnswer&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c34676a187044553a4c42c56257413fd', '模板管理', '查询在线帮助分类', 9, NULL, '/control/helpType/manage?method=helpTypePageSelect&*', 'ef3e2b9c32634f4088f4066880c70677', 1);
INSERT INTO `sysresources` VALUES ('c370e4821b0e45b6946a7ab3181b3844', '系统通知管理', '删除系统通知', 46300, NULL, '/control/systemNotify/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c418c587feb14ecfabd9690d9f52d440', '会员管理', '还原私信', 27150, NULL, '/control/privateMessage/manage?method=reductionPrivateMessage&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c459ab7aa99e4f528c961dd45df4d8e5', '会员管理', '会员详细', 26600, NULL, '/control/user/manage?method=show*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c4ab05ec118740c4bb01395e5e519332', '会员管理', '删除', 26400, NULL, '/control/user/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c51b715175a54b968e7fdfa0883cb08e', '会员卡管理', '删除会员卡赠送任务', 28776, '', '/control/membershipCardGiftTask/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c5d0d01bf7b544828e1fbf3d61b9dd8a', '会员管理', '用户举报', 27595, '', '/control/userReport/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c673918d949d4cc3aa38b43660b354b8', '在线帮助管理', '添加在线帮助', 38600, NULL, '/control/help/manage?method=add&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c6d4bed764194be0a377be158ecdee4d', '会员管理', '会员注册禁止用户名称列表', 28750, NULL, '/control/disableUserName/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c6e0d05a7d8a4a63b7d8b0c5ed44207f', '员工管理', '登录日志', 31200, NULL, '/control/staffLoginLog/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c74888ede5e74dce8a656d722836d8b1', '问答管理', '修改答案', 21000, NULL, '/control/answer/manage?method=edit&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c76fd58d86fd44c3ac6accebc12ae7fa', '员工管理', '添加角色', 31400, NULL, '/control/acl/manage?method=addRoles*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('c7936b830e654abba9a0c1e76895747a', '模板管理', '查询商品属性分页', 4, NULL, '/control/productAttribute/manage?method=ajax_queryProductAttributeSelect&*', '922f6908c5a1434aba4b0f6f8f008c1c', 1);
INSERT INTO `sysresources` VALUES ('c912c21f92ca46e693b8645e7ad89a8d', '会员管理', '查询银行', 2, NULL, '/control/systemSetting/manage?method=queryBankName&*', 'c459ab7aa99e4f528c961dd45df4d8e5', 1);
INSERT INTO `sysresources` VALUES ('c930706b667749d1b5784c37c6a4ffd4', '模板管理', '查询问题标签分页', 12, NULL, '/control/questionTag/manage?method=questionTagPage&*', '922f6908c5a1434aba4b0f6f8f008c1c', 1);
INSERT INTO `sysresources` VALUES ('c9791f2412c04860a0f8b4ddfc64cecb', '模板管理', '文件上传', 0, NULL, '/control/forum/manage?method=upload&*', '922f6908c5a1434aba4b0f6f8f008c1c', 2);
INSERT INTO `sysresources` VALUES ('ca0e7a1a86384639a025a3fab07bd963', '问答管理', '问题列表', 20000, NULL, '/control/question/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('caedcace4fe746499146e97459919bb4', '模板管理', '查询品牌分页', 5, NULL, '/control/brand/manage?method=ajax_queryBrandSelect&*', 'ef3e2b9c32634f4088f4066880c70677', 1);
INSERT INTO `sysresources` VALUES ('cbe2d7086fee4d5390afe686e9cddad1', '模板管理', '修改模板', 40200, NULL, '/control/template/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('cec90ad171374546b81868015755f9f8', '在线帮助管理', '查询帮助分类', 0, NULL, '/control/helpType/manage?method=helpTypePageSelect&*', '75a262c3c48d4e21817541cd87fac000', 1);
INSERT INTO `sysresources` VALUES ('cee7dda9dd5e4a739b42f0dfa8b4b16d', '全站设置', '查询说明', 0, NULL, '/control/upgrade/manage?method=queryUpgrade&*', '2a90880355b44225a7e42e3a394d020c', 1);
INSERT INTO `sysresources` VALUES ('cf8e8bd2ea2549ae9a4cfe7356c04be4', '问答管理', '图片上传', 0, NULL, '/control/answer/manage?method=uploadImage&*', 'c74888ede5e74dce8a656d722836d8b1', 2);
INSERT INTO `sysresources` VALUES ('d0482512ccd5439bb6610672c11f0cb2', '模板管理', '删除模板', 40300, NULL, '/control/template/manage?method=delete&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('d0f97697d6984656927b6dbcc9f9c4a0', '会员管理', '登录日志', 27600, NULL, '/control/userLoginLog/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('d297f75ec0514aa1953d9d1738634090', '文件打包管理', '下载压缩文件', 45100, NULL, '/control/filePackage/manage?method=download&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('d2a54b45642a42fcac64fb15f1ac78e2', '友情链接管理', '友情链接列表', 17000, NULL, '/control/links/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('d38488d83afa42b8a53e530ed870b2b5', '举报管理', '还原举报', 48583, '', '/control/report/manage?method=reduction*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('d3f057d1100a4a79b97ab9715e01be04', '话题管理', '添加标签', 14900, NULL, '/control/tag/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('d4b7953538294b67843c56f721d51a58', '话题管理', '图片上传', 0, NULL, '/control/comment/manage?method=uploadImage&*', '607bbd310ec147519e8f988adf4c30a6', 2);
INSERT INTO `sysresources` VALUES ('d5290b702acf41f286dc3d66c659d081', '会员管理', '会员卡订单', 27550, NULL, '/control/membershipCard/manage?method=membershipCardOrderList*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('d613442d18c1465d8a981f420b3aa8cd', '全站设置', '维护数据', 49100, NULL, '/control/systemSetting/manage?method=maintainData*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('d692c8ee90394774b449fc4060ee711d', '在线帮助管理', '查询帮助分类', 0, NULL, '/control/helpType/manage?method=helpTypePageSelect_move&*', 'c673918d949d4cc3aa38b43660b354b8', 1);
INSERT INTO `sysresources` VALUES ('d71d35ca222a43e2bec6ceb76ac8097f', '会员卡管理', '添加会员卡', 28785, NULL, '/control/membershipCard/manage?method=add*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('d72acdb07d1540bab400c194ba3329f8', '模板管理', '资源列表', 41500, NULL, '/control/resource/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('d73f435972544a7fb03b6618948c07eb', '模板管理', '查询商品分类', 1, NULL, '/control/product/type/manage?method=productTypePageSelect&*', '412fd399deac43cb8354a15db3b47bbf', 1);
INSERT INTO `sysresources` VALUES ('d75adb28b87d496e8627c11272b47476', '在线帮助管理', '删除在线帮助', 38800, NULL, '/control/help/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('d885d220f87a4b1a928e3eb93f922c02', '全站设置', '删除升级包', 51300, NULL, '/control/upgrade/manage?method=deleteUpgradePackage&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('d8ad4df8213e491c96bd143e1eec7b4c', '问答管理', '收藏用户', 20620, NULL, '/control/questionFavorite/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('d93b927d889a41f487efc41845f9c4ea', '模板管理', '查询版块模板', 0, NULL, '/control/forum/manage?method=forumTemplateFileNameUI&*', '922f6908c5a1434aba4b0f6f8f008c1c', 1);
INSERT INTO `sysresources` VALUES ('d96a00544fcf470e98a4f062bc017559', '模板管理', '查询商品扩展属性', 4, NULL, '/control/productAttribute/manage?method=ajax_productAttributeExpansion&*', 'ef3e2b9c32634f4088f4066880c70677', 1);
INSERT INTO `sysresources` VALUES ('da59992eae3a4181bd14d31476aa8714', '在线帮助管理', '文件上传', 0, NULL, '/control/help/manage?method=upload&*', '5ef5747987074212be7ef9cc9fdb50af', 2);
INSERT INTO `sysresources` VALUES ('da63bf83542e47bdacdada8a8abf8166', '支付管理', '删除在线支付接口', 52300, NULL, '/control/onlinePaymentInterface/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('da89532f94ed4e4193f9980c48609aac', '全站设置', '查询备份进度', 0, NULL, '/control/dataBase/manage?method=queryBackupProgress&*', '6b12cf5fb0ce4927979775f3c76419ab', 1);
INSERT INTO `sysresources` VALUES ('db27cdfec51a4c30a066319ff6f08bb9', '会员卡管理', '会员卡赠送项列表(获赠用户)', 28779, '', '/control/membershipCardGiftTask/manage?method=membershipCardGiftItemList*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('dcd7b0f0c5e44566b116694b96dac0e1', '会员管理', '系统通知列表', 27300, NULL, '/control/systemNotify/manage?method=subscriptionSystemNotifyList&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('dd231daf558d4526bf0d95ee6cc6970e', '全站设置', '数据库备份/还原列表', 49600, NULL, '/control/dataBase/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('de86a8fa661041ca9794a78275d0fcb1', '模板管理', '查询资讯分类', 7, NULL, '/control/informationType/manage?method=informationTypePageSelect&*', 'ef3e2b9c32634f4088f4066880c70677', 1);
INSERT INTO `sysresources` VALUES ('decb896d7fee40f09a958647cf14b849', '问答管理', '审核问题', 20600, NULL, '/control/question/manage?method=auditQuestion*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('dede44542c5644a69b72180e1abc368b', '话题管理', '红包分配', 12640, NULL, '/control/redEnvelope/redEnvelopeAmountDistribution/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('e050f5451e4f4f7dba6c2cb51f7c393e', '短信管理', '修改短信接口', 48520, NULL, '/control/smsInterface/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('e08a84e681ea4850be0a33c1f6d4c5f0', '话题管理', '删除回复', 14500, NULL, '/control/comment/manage?method=deleteReply*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('e0aa4b8b3c51428eb6dd8227ffffe283', '模板管理', '导出模板', 40700, NULL, '/control/template/manage?method=export*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('e25b31db1abd48eeb81f13881e314f91', '会员管理', '会员列表', 26100, NULL, '/control/user/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('e4d93f4f930a455f85868cfd5480f5d0', '样式缩略图管理', '删除缩略图裁剪尺寸', 59200, NULL, '/control/thumbnail/manage?method=delete&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('e7443c7b35bc44a1a60f5f6a7530905b', '全站设置', '上传敏感词库', 49560, NULL, '/control/filterWord/manage?method=uploadFilterWord*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('e8cfa842e1c24b54b67f1bbc6b828dbe', '模板管理', '查询资讯分类', 8, NULL, '/control/informationType/manage?method=informationTypePageSelect&*', '922f6908c5a1434aba4b0f6f8f008c1c', 1);
INSERT INTO `sysresources` VALUES ('eadf2a9785af45b08c5c42d6b1263133', '全站设置', '重建问题索引', 49210, NULL, '/control/systemSetting/manage?method=rebuildQuestionIndex&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('ec17504e564f4c958cb679377a39715d', '模板管理', '查询话题标签', 7, NULL, '/control/tag/manage?method=allTag&*', '922f6908c5a1434aba4b0f6f8f008c1c', 1);
INSERT INTO `sysresources` VALUES ('ee03a28bd12f41b4a1e243ec05ca062b', '全站设置', '继续升级', 0, NULL, '/control/upgrade/manage?method=continueUpgrade&*', '5d697fdf29434ff4bbcd5bc6f1a9a415', 2);
INSERT INTO `sysresources` VALUES ('ef1afb617a754220a0b27ec0cb01efa8', '问答管理', '图片上传', 0, NULL, '/cms/control/answer/manage?method=uploadImage&*', 'c0b306017906415abce45445b5606bd6', 2);
INSERT INTO `sysresources` VALUES ('ef310b9be13a4630b40c99fe3baf1e4a', '模板管理', '查询商品属性分页', 3, NULL, '/control/productAttribute/manage?method=ajax_queryProductAttributeSelect&*', 'ef3e2b9c32634f4088f4066880c70677', 1);
INSERT INTO `sysresources` VALUES ('ef3c77fb708c4775988e888f0e9186d4', '员工管理', '员工列表', 28800, NULL, '/control/staff/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('ef3e2b9c32634f4088f4066880c70677', '模板管理', '修改版块', 42900, NULL, '/control/forum/manage?method=edit&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('efa66bc116bc409fbf7bf23e4882d2d9', '员工管理', '添加员工', 28900, NULL, '/control/staff/manage?method=addStaff*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('f0eeb58d820b48cba5368da6b80184bf', '举报管理', '举报分类列表', 48560, '', '/control/reportType/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('f14133ca94274ff197996e059a26ad49', '会员卡管理', '修改会员卡赠送任务', 28774, '', '/control/membershipCardGiftTask/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('f285c691b0f74b9ca549344722e5d780', '模板管理', '删除栏目', 43600, NULL, '/control/column/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('f2ddeb0bb4c94342854c6a2461869fb4', '会员管理', '提醒列表', 27400, NULL, '/control/remind/manage?method=remindList&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('f365c635400e47eda1fc10589d7dbbcd', '会员管理', '会员搜索', 26000, NULL, '/control/user/search*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('f4f131913fe64f07b212bccedd2852a1', '举报管理', '查询所有举报分类', 0, NULL, '/control/reportType/manage?method=allType*', '39adfb4206024d14ab38822555314e7a', 1);
INSERT INTO `sysresources` VALUES ('f58f9516975847fbbd8a2cd0230973f5', '会员管理', '删除等级', 28300, NULL, '/control/userGrade/manage?method=delete*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('f6518fc5a5f84c11a5a569c493218f8f', '文件打包管理', '压缩文件列表', 45000, NULL, '/control/filePackage/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('faa4855e9fbd4e208da026cfdfffd4f0', '会员管理', '查询用户', 3, NULL, '/control/user/queryUser*', 'c459ab7aa99e4f528c961dd45df4d8e5', 1);
INSERT INTO `sysresources` VALUES ('face85b769b94dc489e719551eb58bbd', '会员管理', '修改', 26300, NULL, '/control/user/manage?method=edit*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('fb9bce585d7d4aa89ddf30262540e660', '模板管理', '删除导出模板', 40900, NULL, '/control/template/manage?method=deleteExport&*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('fbee16533927408789b4c0a096413635', '员工管理', '角色列表', 31300, NULL, '/control/roles/list*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('fc8554db852a4f128bdee595b4cd1ed8', '会员管理', '更换头像', 27700, NULL, '/control/user/manage?method=updateAvatar*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('fd7988fae4484db7a98a1d67b6d54cdc', '话题管理', '全部待审核回复', 15840, NULL, '/control/topic/allAuditReply*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('fd848496836843b49ee6ed3ccdf6c14d', '话题管理', '审核话题', 12610, NULL, '/control/topic/manage?method=auditTopic*', NULL, NULL);
INSERT INTO `sysresources` VALUES ('fdbe57ac70804feea4e8679a190740ed', '模板管理', '查询版块目录', 0, NULL, '/control/forumCode/query?method=directory*', '90cd4aa4e6ef4154849630ae701fe37d', 1);
INSERT INTO `sysresources` VALUES ('ff3bfef595c1473a9dd2a1ba279ca010', '全站设置', '上传升级包', 51200, NULL, '/control/upgrade/manage?method=uploadUpgradePackage*', NULL, NULL);

-- ----------------------------
-- Table structure for sysroles
-- ----------------------------
DROP TABLE IF EXISTS `sysroles`;
CREATE TABLE `sysroles`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysroles
-- ----------------------------

-- ----------------------------
-- Table structure for sysrolespermission
-- ----------------------------
DROP TABLE IF EXISTS `sysrolespermission`;
CREATE TABLE `sysrolespermission`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `permissionId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `roleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysrolespermission
-- ----------------------------

-- ----------------------------
-- Table structure for systemnotify
-- ----------------------------
DROP TABLE IF EXISTS `systemnotify`;
CREATE TABLE `systemnotify`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sendTime` datetime(6) NULL DEFAULT NULL,
  `staffName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `systemNotify_1_idx`(`sendTime` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of systemnotify
-- ----------------------------

-- ----------------------------
-- Table structure for systemsetting
-- ----------------------------
DROP TABLE IF EXISTS `systemsetting`;
CREATE TABLE `systemsetting`  (
  `id` int NOT NULL,
  `aiAssistant_submitQuantity` int NULL DEFAULT NULL,
  `allowAnswer` bit(1) NOT NULL,
  `allowComment` bit(1) NOT NULL,
  `allowFeedback` bit(1) NOT NULL,
  `allowFilterWord` bit(1) NOT NULL,
  `allowLoginAccountType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `allowMentionMaxNumber` int NULL DEFAULT NULL,
  `allowQuestion` bit(1) NOT NULL,
  `allowRegisterAccountType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `allowReport` bit(1) NOT NULL,
  `allowTopic` bit(1) NOT NULL,
  `answerEditorTag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `answerReply_review` int NULL DEFAULT NULL,
  `answerReply_rewardPoint` bigint NULL DEFAULT NULL,
  `answer_review` int NULL DEFAULT NULL,
  `answer_rewardPoint` bigint NULL DEFAULT NULL,
  `answer_submitQuantity` int NULL DEFAULT NULL,
  `backstagePageNumber` int NULL DEFAULT NULL,
  `closeSite` int NULL DEFAULT NULL,
  `closeSitePrompt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `comment_review` int NULL DEFAULT NULL,
  `comment_rewardPoint` bigint NULL DEFAULT NULL,
  `comment_submitQuantity` int NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editorTag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `fileSecureLinkExpire` bigint NULL DEFAULT NULL,
  `fileSecureLinkSecret` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filterWordReplace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `forestagePageNumber` int NULL DEFAULT NULL,
  `giveRedEnvelopeAmountMax` decimal(12, 2) NULL DEFAULT NULL,
  `giveRedEnvelopeAmountMin` decimal(12, 2) NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `languageFormExtension` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `languageSwitching` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `login_submitQuantity` int NULL DEFAULT NULL,
  `maxQuestionTagQuantity` int NULL DEFAULT NULL,
  `privateMessage_submitQuantity` int NULL DEFAULT NULL,
  `questionEditorTag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `questionMaxVoteOptions` int NULL DEFAULT NULL,
  `questionRewardAmountMax` decimal(12, 2) NULL DEFAULT NULL,
  `questionRewardAmountMin` decimal(12, 2) NOT NULL,
  `questionRewardPlatformShareProportion` int NULL DEFAULT NULL,
  `questionRewardPointMax` bigint NULL DEFAULT NULL,
  `questionRewardPointMin` bigint NULL DEFAULT NULL,
  `question_review` int NULL DEFAULT NULL,
  `question_rewardPoint` bigint NULL DEFAULT NULL,
  `question_submitQuantity` int NULL DEFAULT NULL,
  `realNameUserAllowAnswer` bit(1) NOT NULL,
  `realNameUserAllowComment` bit(1) NOT NULL,
  `realNameUserAllowQuestion` bit(1) NOT NULL,
  `realNameUserAllowTopic` bit(1) NOT NULL,
  `registerCaptcha` bit(1) NOT NULL,
  `reply_review` int NULL DEFAULT NULL,
  `reply_rewardPoint` bigint NULL DEFAULT NULL,
  `reportMaxImageUpload` int NULL DEFAULT NULL,
  `report_submitQuantity` int NULL DEFAULT NULL,
  `showIpAddress` bit(1) NOT NULL,
  `supportAccessDevice` int NULL DEFAULT NULL,
  `supportEditor` int NULL DEFAULT NULL,
  `temporaryFileValidPeriod` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicEditorTag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `topicHeatFactor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicHotRecommendedTime` int NULL DEFAULT NULL,
  `topicMaxVoteOptions` int NULL DEFAULT NULL,
  `topicUnhidePlatformShareProportion` int NULL DEFAULT NULL,
  `topic_review` int NULL DEFAULT NULL,
  `topic_rewardPoint` bigint NULL DEFAULT NULL,
  `topic_submitQuantity` int NULL DEFAULT NULL,
  `userSentSmsCount` int NULL DEFAULT NULL,
  `version` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of systemsetting
-- ----------------------------
INSERT INTO `systemsetting` VALUES (1, 5, b'1', b'1', b'1', b'0', '[10]', 30, b'1', '[10]', b'1', b'1', '{\"fontname\":false,\"fontsize\":true,\"forecolor\":true,\"hilitecolor\":true,\"bold\":true,\"italic\":true,\"underline\":true,\"removeformat\":true,\"link\":true,\"unlink\":true,\"justifyleft\":true,\"justifycenter\":true,\"justifyright\":true,\"insertorderedlist\":true,\"insertunorderedlist\":true,\"code\":true,\"emoticons\":true,\"image\":true,\"imageFormat\":[\"jpg\",\"jpeg\",\"bmp\",\"png\",\"gif\"],\"imageSize\":\"5000\",\"file\":false,\"fileFormat\":[],\"fileSize\":null,\"embedVideo\":false,\"uploadVideo\":false,\"videoFormat\":[],\"videoSize\":null,\"hidePassword\":false,\"hideComment\":false,\"hideGrade\":false,\"hidePoint\":false,\"hideAmount\":false,\"fullscreen\":true,\"mention\":false,\"ai\":false}', 50, 5, 50, 5, 5, 30, 1, '网站暂时关闭', 50, 5, 5, '巡云轻论坛演示站', '{\"fontname\":false,\"fontsize\":true,\"forecolor\":true,\"hilitecolor\":true,\"bold\":true,\"italic\":true,\"underline\":true,\"removeformat\":true,\"link\":true,\"unlink\":true,\"justifyleft\":true,\"justifycenter\":true,\"justifyright\":true,\"insertorderedlist\":true,\"insertunorderedlist\":true,\"code\":true,\"emoticons\":true,\"image\":true,\"imageFormat\":[\"jpg\",\"jpeg\",\"bmp\",\"png\",\"gif\"],\"imageSize\":\"5000\",\"file\":false,\"fileFormat\":[],\"fileSize\":null,\"embedVideo\":false,\"uploadVideo\":false,\"videoFormat\":[],\"videoSize\":null,\"hidePassword\":false,\"hideComment\":false,\"hideGrade\":false,\"hidePoint\":false,\"hideAmount\":false,\"fullscreen\":true,\"mention\":false,\"ai\":false}', 300, '1234567890123456', '*', 30, 200.00, 0.01, '巡云轻论坛演示站', NULL, NULL, 3, 5, 5, '{\"fontname\":false,\"fontsize\":true,\"forecolor\":true,\"hilitecolor\":true,\"bold\":true,\"italic\":true,\"underline\":true,\"removeformat\":true,\"link\":true,\"unlink\":true,\"justifyleft\":true,\"justifycenter\":true,\"justifyright\":true,\"insertorderedlist\":true,\"insertunorderedlist\":true,\"code\":true,\"emoticons\":true,\"image\":true,\"imageFormat\":[\"jpg\",\"jpeg\",\"bmp\",\"png\",\"gif\"],\"imageSize\":\"5000\",\"file\":false,\"fileFormat\":[],\"fileSize\":null,\"embedVideo\":false,\"uploadVideo\":false,\"videoFormat\":[],\"videoSize\":null,\"hidePassword\":false,\"hideComment\":false,\"hideGrade\":false,\"hidePoint\":false,\"hideAmount\":false,\"fullscreen\":true,\"mention\":false,\"ai\":false}', 0, NULL, 0.00, 1, NULL, 0, 50, 10, 5, b'0', b'0', b'0', b'0', b'1', 50, 5, 3, 5, b'1', 1, 10, 120, '巡云轻论坛演示站', '{\"fontname\":false,\"fontsize\":true,\"forecolor\":true,\"hilitecolor\":true,\"bold\":true,\"italic\":true,\"underline\":true,\"removeformat\":true,\"link\":true,\"unlink\":true,\"justifyleft\":true,\"justifycenter\":true,\"justifyright\":true,\"insertorderedlist\":true,\"insertunorderedlist\":true,\"code\":true,\"emoticons\":true,\"image\":true,\"imageFormat\":[\"jpg\",\"jpeg\",\"bmp\",\"png\",\"gif\"],\"imageSize\":\"5000\",\"file\":true,\"fileFormat\":[\"mp4\",\"avi\",\"mkv\",\"wmv\",\"wav\",\"rm\",\"rmvb\",\"mp3\",\"flac\",\"ape\",\"zip\",\"rar\",\"7z\",\"txt\",\"docx\",\"doc\",\"pptx\",\"ppt\",\"xlsx\",\"xls\"],\"fileSize\":\"5000\",\"embedVideo\":true,\"uploadVideo\":true,\"videoFormat\":[\"mp4\",\"avi\",\"mkv\",\"wmv\",\"rm\",\"rmvb\"],\"videoSize\":\"50000\",\"hidePassword\":true,\"hideComment\":true,\"hideGrade\":true,\"hidePoint\":true,\"hideAmount\":true,\"fullscreen\":true,\"mention\":false,\"ai\":false}', '评论=20|点赞=10|浏览量=1|重力因子=1.8', NULL, 0, 1, 50, 10, 5, 10, 1742392585263);

-- ----------------------------
-- Table structure for sysusers
-- ----------------------------
DROP TABLE IF EXISTS `sysusers`;
CREATE TABLE `sysusers`  (
  `userId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatarName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `fullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `issys` bit(1) NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `securityDigest` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userAccount` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userDesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userDuty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `UKi13uxat3wa9pt2glvqr05g7rn`(`userAccount` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysusers
-- ----------------------------
INSERT INTO `sysusers` VALUES ('42ea45e889e94e31820eec3c2b3f3dd5', NULL, b'1', 'admin', b'1', NULL, '30f539fb6f3b4fdda7d18023d7215ce0', 'admin', NULL, '管理员', '$2a$10$H5OnTy57/HxG8UXlmOUaBOLs5NL5tr/2y3hLpl5Q/9q0UE6Ej7RPG');

-- ----------------------------
-- Table structure for sysusersroles
-- ----------------------------
DROP TABLE IF EXISTS `sysusersroles`;
CREATE TABLE `sysusersroles`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `roleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userAccount` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysusersroles
-- ----------------------------

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` bigint NOT NULL,
  `childNodeNumber` int NULL DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `multiLanguageExtension` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parentId` bigint NULL DEFAULT NULL,
  `parentIdGroup` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tag_1_idx`(`sort` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (49807246654275, 0, '', NULL, 'test', 0, ',0,', 0);

-- ----------------------------
-- Table structure for templates
-- ----------------------------
DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `columns` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `dirName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `introduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `thumbnailSuffix` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `uses` bit(1) NOT NULL,
  `verifyCSRF` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of templates
-- ----------------------------
INSERT INTO `templates` VALUES (1, '[{\"id\":1,\"name\":\"首页\",\"parentId\":0,\"childColumn\":[],\"sort\":100,\"linkMode\":3,\"url\":\"index\"},{\"id\":3,\"name\":\"问答\",\"parentId\":0,\"childColumn\":[],\"sort\":75,\"linkMode\":3,\"url\":\"askList\"},{\"id\":2,\"name\":\"会员卡\",\"parentId\":0,\"childColumn\":[],\"sort\":50,\"linkMode\":3,\"url\":\"membershipCardList\"},{\"id\":4,\"name\":\"帮助中心\",\"parentId\":0,\"childColumn\":[],\"sort\":0,\"linkMode\":3,\"url\":\"help\"}]', 'default', NULL, '默认', 'jpg', b'1', b'1');
INSERT INTO `templates` VALUES (2, '[{\"id\":1,\"name\":\"首页\",\"parentId\":0,\"childColumn\":[],\"sort\":100,\"linkMode\":3,\"url\":\"index\"},{\"id\":2,\"name\":\"问答\",\"parentId\":0,\"childColumn\":[],\"sort\":75,\"linkMode\":3,\"url\":\"askList\"},{\"id\":3,\"name\":\"会员卡\",\"parentId\":0,\"childColumn\":[],\"sort\":50,\"linkMode\":3,\"url\":\"membershipCardList\"},{\"id\":4,\"name\":\"帮助中心\",\"parentId\":0,\"childColumn\":[],\"sort\":30,\"linkMode\":3,\"url\":\"help\"}]', 'api', '前后端分离模板，本模板仅提供API接口,前端代码需要另外部署', '前后端分离模板', 'jpg', b'0', b'0');

-- ----------------------------
-- Table structure for thirdpartylogininterface
-- ----------------------------
DROP TABLE IF EXISTS `thirdpartylogininterface`;
CREATE TABLE `thirdpartylogininterface`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `dynamicParameter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `enable` bit(1) NOT NULL,
  `interfaceProduct` int NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `supportEquipment` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thirdpartylogininterface
-- ----------------------------

-- ----------------------------
-- Table structure for thumbnail
-- ----------------------------
DROP TABLE IF EXISTS `thumbnail`;
CREATE TABLE `thumbnail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `high` int NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `specificationGroup` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `width` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKi1c51f71y0grwc0d7wyoe5mig`(`specificationGroup` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thumbnail
-- ----------------------------
INSERT INTO `thumbnail` VALUES (2, 240, '240乘240', '240x240', 240);

-- ----------------------------
-- Table structure for timetask
-- ----------------------------
DROP TABLE IF EXISTS `timetask`;
CREATE TABLE `timetask`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cron` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `misfireInstruction` int NULL DEFAULT NULL,
  `performType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of timetask
-- ----------------------------

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `allow` bit(1) NOT NULL,
  `commentTotal` bigint NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `essence` bit(1) NULL DEFAULT NULL,
  `giveRedEnvelopeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isMarkdown` bit(1) NULL DEFAULT NULL,
  `isStaff` bit(1) NULL DEFAULT NULL,
  `lastReplyTime` datetime(6) NULL DEFAULT NULL,
  `lastUpdateTime` datetime(6) NULL DEFAULT NULL,
  `markdownContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `tagId` bigint NULL DEFAULT NULL,
  `tagIdGroup` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `viewTotal` bigint NULL DEFAULT NULL,
  `voteThemeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `weight` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topic_3_idx`(`userName` ASC, `postTime` ASC) USING BTREE,
  INDEX `topic_5_idx`(`status` ASC, `sort` ASC, `lastReplyTime` ASC) USING BTREE,
  INDEX `topic_6_idx`(`weight` ASC) USING BTREE,
  INDEX `topic_7_idx`(`tagIdGroup` ASC, `status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES (1, b'1', 1, 'test', b'0', NULL, NULL, '127.0.0.1', b'0', b'0', '2025-10-13 18:29:17.991000', NULL, NULL, '2025-10-13 18:28:59.565000', 0, 20, 'test..', 49807246654275, ',0,49807246654275,', 'test', 'u5RmNvNUs5WHrgl9h6S', 0, NULL, 0);

-- ----------------------------
-- Table structure for topicfavorite_0
-- ----------------------------
DROP TABLE IF EXISTS `topicfavorite_0`;
CREATE TABLE `topicfavorite_0`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `favoriteId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topicFavorite_1_idx`(`topicId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topicfavorite_0
-- ----------------------------

-- ----------------------------
-- Table structure for topicfavorite_1
-- ----------------------------
DROP TABLE IF EXISTS `topicfavorite_1`;
CREATE TABLE `topicfavorite_1`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `favoriteId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topicFavorite_1_idx`(`topicId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topicfavorite_1
-- ----------------------------

-- ----------------------------
-- Table structure for topicfavorite_2
-- ----------------------------
DROP TABLE IF EXISTS `topicfavorite_2`;
CREATE TABLE `topicfavorite_2`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `favoriteId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topicFavorite_1_idx`(`topicId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topicfavorite_2
-- ----------------------------

-- ----------------------------
-- Table structure for topicfavorite_3
-- ----------------------------
DROP TABLE IF EXISTS `topicfavorite_3`;
CREATE TABLE `topicfavorite_3`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `favoriteId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topicFavorite_1_idx`(`topicId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topicfavorite_3
-- ----------------------------

-- ----------------------------
-- Table structure for topicindex
-- ----------------------------
DROP TABLE IF EXISTS `topicindex`;
CREATE TABLE `topicindex`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dataId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `indexState` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topicindex
-- ----------------------------

-- ----------------------------
-- Table structure for topiclike_0
-- ----------------------------
DROP TABLE IF EXISTS `topiclike_0`;
CREATE TABLE `topiclike_0`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topicLike_1_idx`(`topicId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topiclike_0
-- ----------------------------

-- ----------------------------
-- Table structure for topiclike_1
-- ----------------------------
DROP TABLE IF EXISTS `topiclike_1`;
CREATE TABLE `topiclike_1`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topicLike_1_idx`(`topicId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topiclike_1
-- ----------------------------

-- ----------------------------
-- Table structure for topiclike_2
-- ----------------------------
DROP TABLE IF EXISTS `topiclike_2`;
CREATE TABLE `topiclike_2`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topicLike_1_idx`(`topicId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topiclike_2
-- ----------------------------

-- ----------------------------
-- Table structure for topiclike_3
-- ----------------------------
DROP TABLE IF EXISTS `topiclike_3`;
CREATE TABLE `topiclike_3`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addtime` datetime(6) NULL DEFAULT NULL,
  `likeId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topicLike_1_idx`(`topicId` ASC, `addtime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topiclike_3
-- ----------------------------

-- ----------------------------
-- Table structure for topicunhide_0
-- ----------------------------
DROP TABLE IF EXISTS `topicunhide_0`;
CREATE TABLE `topicunhide_0`  (
  `id` varchar(43) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(19, 2) NULL DEFAULT NULL,
  `cancelTime` datetime(6) NULL DEFAULT NULL,
  `hideTagType` int NULL DEFAULT NULL,
  `point` bigint NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topicUnhide_1_idx`(`topicId` ASC, `cancelTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topicunhide_0
-- ----------------------------

-- ----------------------------
-- Table structure for topicunhide_1
-- ----------------------------
DROP TABLE IF EXISTS `topicunhide_1`;
CREATE TABLE `topicunhide_1`  (
  `id` varchar(43) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(19, 2) NULL DEFAULT NULL,
  `cancelTime` datetime(6) NULL DEFAULT NULL,
  `hideTagType` int NULL DEFAULT NULL,
  `point` bigint NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topicunhide_1_idx`(`topicId` ASC, `cancelTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topicunhide_1
-- ----------------------------

-- ----------------------------
-- Table structure for topicunhide_2
-- ----------------------------
DROP TABLE IF EXISTS `topicunhide_2`;
CREATE TABLE `topicunhide_2`  (
  `id` varchar(43) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(19, 2) NULL DEFAULT NULL,
  `cancelTime` datetime(6) NULL DEFAULT NULL,
  `hideTagType` int NULL DEFAULT NULL,
  `point` bigint NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topicunhide_1_idx`(`topicId` ASC, `cancelTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topicunhide_2
-- ----------------------------

-- ----------------------------
-- Table structure for topicunhide_3
-- ----------------------------
DROP TABLE IF EXISTS `topicunhide_3`;
CREATE TABLE `topicunhide_3`  (
  `id` varchar(43) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(19, 2) NULL DEFAULT NULL,
  `cancelTime` datetime(6) NULL DEFAULT NULL,
  `hideTagType` int NULL DEFAULT NULL,
  `point` bigint NULL DEFAULT NULL,
  `postUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topicunhide_1_idx`(`topicId` ASC, `cancelTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topicunhide_3
-- ----------------------------

-- ----------------------------
-- Table structure for topicunhideplatformshare
-- ----------------------------
DROP TABLE IF EXISTS `topicunhideplatformshare`;
CREATE TABLE `topicunhideplatformshare`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `platformShareProportion` int NULL DEFAULT NULL,
  `postUserName` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `postUserShareRunningNumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shareAmount` decimal(14, 4) NOT NULL,
  `staff` bit(1) NOT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `totalAmount` decimal(12, 2) NOT NULL,
  `unlockTime` datetime(6) NULL DEFAULT NULL,
  `unlockUserName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topicUnhidePlatformShare_1_idx`(`unlockTime` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topicunhideplatformshare
-- ----------------------------

-- ----------------------------
-- Table structure for upgradesystem
-- ----------------------------
DROP TABLE IF EXISTS `upgradesystem`;
CREATE TABLE `upgradesystem`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `deleteFilePath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `explanation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `interruptStatus` int NULL DEFAULT NULL,
  `oldSystemVersion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `runningStatus` int NULL DEFAULT NULL,
  `sort` bigint NULL DEFAULT NULL,
  `updatePackageFirstDirectory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updatePackageName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updatePackageTime` datetime(6) NULL DEFAULT NULL,
  `updatePackageVersion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `upgradeLog` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `upgradeTime` datetime(6) NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upgradesystem
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `allowUserDynamic` bit(1) NULL DEFAULT NULL,
  `answer` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatarName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cancelAccountTime` bigint NULL DEFAULT NULL,
  `deposit` decimal(14, 4) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `issue` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `platformUserId` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `point` bigint NULL DEFAULT NULL,
  `realNameAuthentication` bit(1) NOT NULL,
  `registrationDate` datetime(6) NULL DEFAULT NULL,
  `remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `salt` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `securityDigest` bigint NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userVersion` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKdnq7r8jcmlft7l8l4j79l1h74`(`account` ASC) USING BTREE,
  UNIQUE INDEX `UKmtrfpdps3j0ce18c8xglgjf7n`(`platformUserId` ASC) USING BTREE,
  INDEX `user_idx`(`state` ASC) USING BTREE,
  INDEX `user_2_idx`(`userName` ASC) USING BTREE,
  INDEX `user_3_idx`(`nickname` ASC) USING BTREE,
  INDEX `user_4_idx`(`mobile` ASC) USING BTREE,
  INDEX `user_5_idx`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'test', b'1', '49dc52e6bf2abe5ef6e2bb5b0f1ee2d765b922ae6cc8b95d39dc06c21c848f8c', NULL, -1, 0.0000, '', '123456', '', NULL, '0a91c3e881f9ee814d8d4bc55d629d174e341929908b7f7b4e5e5ae5022511fe', 'u5RmNvNUs5WHrgl9h6S', 20, b'1', '2025-10-13 18:20:15.269000', '', '0227dfa157ec4494a68d07df69f4b606', 1760350815269, 1, 10, 'u5RmNvNUs5WHrgl9h6S', 3);

-- ----------------------------
-- Table structure for usercustom
-- ----------------------------
DROP TABLE IF EXISTS `usercustom`;
CREATE TABLE `usercustom`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `chooseType` int NULL DEFAULT NULL,
  `cols` int NULL DEFAULT NULL,
  `fieldFilter` int NULL DEFAULT NULL,
  `maxlength` int NULL DEFAULT NULL,
  `multiple` bit(1) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `regular` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `required` bit(1) NOT NULL,
  `rows` int NULL DEFAULT NULL,
  `search` bit(1) NOT NULL,
  `selete_size` int NULL DEFAULT NULL,
  `size` int NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `tip` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `visible` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usercustom
-- ----------------------------

-- ----------------------------
-- Table structure for userdynamic_0
-- ----------------------------
DROP TABLE IF EXISTS `userdynamic_0`;
CREATE TABLE `userdynamic_0`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answerId` bigint NULL DEFAULT NULL,
  `answerReplyId` bigint NULL DEFAULT NULL,
  `commentId` bigint NULL DEFAULT NULL,
  `functionIdGroup` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `quoteCommentId` bigint NULL DEFAULT NULL,
  `replyId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userDynamic_1_idx`(`userName` ASC, `status` ASC, `postTime` ASC) USING BTREE,
  INDEX `userDynamic_5_idx`(`functionIdGroup` ASC, `userName` ASC, `module` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userdynamic_0
-- ----------------------------

-- ----------------------------
-- Table structure for userdynamic_1
-- ----------------------------
DROP TABLE IF EXISTS `userdynamic_1`;
CREATE TABLE `userdynamic_1`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answerId` bigint NULL DEFAULT NULL,
  `answerReplyId` bigint NULL DEFAULT NULL,
  `commentId` bigint NULL DEFAULT NULL,
  `functionIdGroup` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `quoteCommentId` bigint NULL DEFAULT NULL,
  `replyId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userDynamic_1_idx`(`userName` ASC, `status` ASC, `postTime` ASC) USING BTREE,
  INDEX `userDynamic_5_idx`(`functionIdGroup` ASC, `userName` ASC, `module` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userdynamic_1
-- ----------------------------
INSERT INTO `userdynamic_1` VALUES ('14fb0f4540e3425897a09dec0425a25b0001', -1, -1, 1, ',1,1,1,', 400, '2025-10-13 18:29:17.966000', -1, -1, 1, 20, 1, 'u5RmNvNUs5WHrgl9h6S');
INSERT INTO `userdynamic_1` VALUES ('75b529a60ba0444dbc0e1cc1be5b47ed0001', -1, -1, 1, ',1,1,', 200, '2025-10-13 18:29:09.841000', -1, -1, -1, 20, 1, 'u5RmNvNUs5WHrgl9h6S');
INSERT INTO `userdynamic_1` VALUES ('bcbb6d8718cd41b0bad563d59b5c41fc0001', -1, -1, -1, ',1,', 100, '2025-10-13 18:28:59.565000', -1, -1, -1, 20, 1, 'u5RmNvNUs5WHrgl9h6S');

-- ----------------------------
-- Table structure for userdynamic_2
-- ----------------------------
DROP TABLE IF EXISTS `userdynamic_2`;
CREATE TABLE `userdynamic_2`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answerId` bigint NULL DEFAULT NULL,
  `answerReplyId` bigint NULL DEFAULT NULL,
  `commentId` bigint NULL DEFAULT NULL,
  `functionIdGroup` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `quoteCommentId` bigint NULL DEFAULT NULL,
  `replyId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userDynamic_1_idx`(`userName` ASC, `status` ASC, `postTime` ASC) USING BTREE,
  INDEX `userDynamic_5_idx`(`functionIdGroup` ASC, `userName` ASC, `module` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userdynamic_2
-- ----------------------------

-- ----------------------------
-- Table structure for userdynamic_3
-- ----------------------------
DROP TABLE IF EXISTS `userdynamic_3`;
CREATE TABLE `userdynamic_3`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answerId` bigint NULL DEFAULT NULL,
  `answerReplyId` bigint NULL DEFAULT NULL,
  `commentId` bigint NULL DEFAULT NULL,
  `functionIdGroup` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `module` int NULL DEFAULT NULL,
  `postTime` datetime(6) NULL DEFAULT NULL,
  `questionId` bigint NULL DEFAULT NULL,
  `quoteCommentId` bigint NULL DEFAULT NULL,
  `replyId` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `topicId` bigint NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userDynamic_1_idx`(`userName` ASC, `status` ASC, `postTime` ASC) USING BTREE,
  INDEX `userDynamic_5_idx`(`functionIdGroup` ASC, `userName` ASC, `module` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userdynamic_3
-- ----------------------------

-- ----------------------------
-- Table structure for usergrade
-- ----------------------------
DROP TABLE IF EXISTS `usergrade`;
CREATE TABLE `usergrade`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `needPoint` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usergrade
-- ----------------------------

-- ----------------------------
-- Table structure for userinputvalue
-- ----------------------------
DROP TABLE IF EXISTS `userinputvalue`;
CREATE TABLE `userinputvalue`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `options` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userCustomId` int NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userinputvalue_idx`(`userId` ASC, `options` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinputvalue
-- ----------------------------

-- ----------------------------
-- Table structure for userloginlog_0
-- ----------------------------
DROP TABLE IF EXISTS `userloginlog_0`;
CREATE TABLE `userloginlog_0`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logonTime` datetime(6) NULL DEFAULT NULL,
  `typeNumber` int NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userLoginLog_idx`(`userId` ASC, `logonTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userloginlog_0
-- ----------------------------

-- ----------------------------
-- Table structure for userloginlog_1
-- ----------------------------
DROP TABLE IF EXISTS `userloginlog_1`;
CREATE TABLE `userloginlog_1`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logonTime` datetime(6) NULL DEFAULT NULL,
  `typeNumber` int NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userLoginLog_idx`(`userId` ASC, `logonTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userloginlog_1
-- ----------------------------
INSERT INTO `userloginlog_1` VALUES ('89667147f0804e118e263482d397c1690001', '127.0.0.1', '2025-10-13 18:28:17.422000', 10, 1);

-- ----------------------------
-- Table structure for userloginlog_2
-- ----------------------------
DROP TABLE IF EXISTS `userloginlog_2`;
CREATE TABLE `userloginlog_2`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logonTime` datetime(6) NULL DEFAULT NULL,
  `typeNumber` int NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userLoginLog_idx`(`userId` ASC, `logonTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userloginlog_2
-- ----------------------------

-- ----------------------------
-- Table structure for userloginlog_3
-- ----------------------------
DROP TABLE IF EXISTS `userloginlog_3`;
CREATE TABLE `userloginlog_3`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logonTime` datetime(6) NULL DEFAULT NULL,
  `typeNumber` int NULL DEFAULT NULL,
  `userId` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userLoginLog_idx`(`userId` ASC, `logonTime` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userloginlog_3
-- ----------------------------

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `defaultRole` bit(1) NULL DEFAULT NULL,
  `multiLanguageExtension` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sort` int NULL DEFAULT NULL,
  `userResourceFormat` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userrole
-- ----------------------------

-- ----------------------------
-- Table structure for userrolegroup
-- ----------------------------
DROP TABLE IF EXISTS `userrolegroup`;
CREATE TABLE `userrolegroup`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userRoleId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `validPeriodEnd` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userRoleGroup_1_idx`(`userName` ASC, `validPeriodEnd` ASC) USING BTREE,
  INDEX `userRoleGroup_3_idx`(`userRoleId` ASC, `userName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userrolegroup
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
