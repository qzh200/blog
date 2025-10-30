/*
 Navicat Premium Dump SQL

 Source Server         : localhost_33066
 Source Server Type    : MySQL
 Source Server Version : 80044 (8.0.44)
 Source Host           : localhost:33066
 Source Schema         : bbs-pro

 Target Server Type    : MySQL
 Target Server Version : 80044 (8.0.44)
 File Encoding         : 65001

 Date: 30/10/2025 22:29:17
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------

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
-- Table structure for disableusername
-- ----------------------------
DROP TABLE IF EXISTS `disableusername`;
CREATE TABLE `disableusername`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of disableusername
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply
-- ----------------------------

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

-- ----------------------------
-- Table structure for syspermissionresources
-- ----------------------------
DROP TABLE IF EXISTS `syspermissionresources`;
CREATE TABLE `syspermissionresources`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `resourceId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syspermissionresources
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of templates
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thumbnail
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topic
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------

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
