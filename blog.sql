/*
 Navicat Premium Data Transfer

 Source Server         : docker-mysql
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 192.168.224.128:13306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 21/08/2020 15:48:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article`  (
  `blog_id` int(11) NOT NULL,
  `blog_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blog_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blog_author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blog_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `like_count` int(11) NULL DEFAULT NULL,
  `comment_count` int(11) NULL DEFAULT NULL,
  `view_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`blog_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1, '第一篇', '记录生活', 'eli', '开始写博客', '2020-08-21 11:12:19', '2020-08-21 11:12:24', 0, 0, 0);

-- ----------------------------
-- Table structure for blog_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_comment`;
CREATE TABLE `blog_article_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NULL DEFAULT NULL,
  `blog_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_to_comment`(`comment_id`) USING BTREE,
  INDEX `fk_to_article`(`blog_id`) USING BTREE,
  CONSTRAINT `fk_to_article` FOREIGN KEY (`blog_id`) REFERENCES `blog_article` (`blog_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_to_comment` FOREIGN KEY (`comment_id`) REFERENCES `blog_comment` (`comment_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_comment
-- ----------------------------
INSERT INTO `blog_article_comment` VALUES (1, 1, 1);
INSERT INTO `blog_article_comment` VALUES (2, 2, 1);

-- ----------------------------
-- Table structure for blog_article_sort
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_sort`;
CREATE TABLE `blog_article_sort`  (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NULL DEFAULT NULL,
  `sort_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_sort`(`sort_id`) USING BTREE,
  INDEX `fk_article_sort`(`blog_id`) USING BTREE,
  CONSTRAINT `fk_sort` FOREIGN KEY (`sort_id`) REFERENCES `blog_sort` (`sort_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_article_sort` FOREIGN KEY (`blog_id`) REFERENCES `blog_article` (`blog_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_sort
-- ----------------------------
INSERT INTO `blog_article_sort` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tag`;
CREATE TABLE `blog_article_tag`  (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NULL DEFAULT NULL,
  `tag_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_article_tag`(`blog_id`) USING BTREE,
  INDEX `fk_tag`(`tag_id`) USING BTREE,
  CONSTRAINT `fk_article_tag` FOREIGN KEY (`blog_id`) REFERENCES `blog_article` (`blog_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_tag` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`tag_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------
INSERT INTO `blog_article_tag` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `comment_id` int(11) NOT NULL,
  `parent_coment_id` int(11) NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `comment`(`comment`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES (1, 0, 'aaaaaaa', '2020-08-21 13:26:00');
INSERT INTO `blog_comment` VALUES (2, 1, 'bbbbb', '2020-08-21 13:29:18');

-- ----------------------------
-- Table structure for blog_manager
-- ----------------------------
DROP TABLE IF EXISTS `blog_manager`;
CREATE TABLE `blog_manager`  (
  `manager_id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`manager_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_manager
-- ----------------------------
INSERT INTO `blog_manager` VALUES (1, 'admin', '123456', NULL);
INSERT INTO `blog_manager` VALUES (2, 'guest', '123456', NULL);

-- ----------------------------
-- Table structure for blog_manager_role
-- ----------------------------
DROP TABLE IF EXISTS `blog_manager_role`;
CREATE TABLE `blog_manager_role`  (
  `id` int(11) NOT NULL,
  `manager_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_manager_role
-- ----------------------------
INSERT INTO `blog_manager_role` VALUES (1, 1, 1);
INSERT INTO `blog_manager_role` VALUES (2, 2, 2);

-- ----------------------------
-- Table structure for blog_permission
-- ----------------------------
DROP TABLE IF EXISTS `blog_permission`;
CREATE TABLE `blog_permission`  (
  `permission_id` int(11) NOT NULL,
  `parent_permission_id` int(11) NULL DEFAULT NULL,
  `permission_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_permission
-- ----------------------------
INSERT INTO `blog_permission` VALUES (1, 0, 'All');
INSERT INTO `blog_permission` VALUES (2, 1, 'blog:article');
INSERT INTO `blog_permission` VALUES (3, 1, 'blog:sort');
INSERT INTO `blog_permission` VALUES (4, 1, 'blog:tag');
INSERT INTO `blog_permission` VALUES (5, 1, 'blog:comment');
INSERT INTO `blog_permission` VALUES (6, 2, 'article:add');
INSERT INTO `blog_permission` VALUES (7, 2, 'article:update');
INSERT INTO `blog_permission` VALUES (8, 2, 'article:delete');

-- ----------------------------
-- Table structure for blog_role
-- ----------------------------
DROP TABLE IF EXISTS `blog_role`;
CREATE TABLE `blog_role`  (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_role
-- ----------------------------
INSERT INTO `blog_role` VALUES (1, 'admin');
INSERT INTO `blog_role` VALUES (2, 'guest');

-- ----------------------------
-- Table structure for blog_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `blog_role_permission`;
CREATE TABLE `blog_role_permission`  (
  `id` int(11) NOT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  `permission_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_role_permission
-- ----------------------------
INSERT INTO `blog_role_permission` VALUES (1, 1, 1);
INSERT INTO `blog_role_permission` VALUES (2, 2, 2);

-- ----------------------------
-- Table structure for blog_sort
-- ----------------------------
DROP TABLE IF EXISTS `blog_sort`;
CREATE TABLE `blog_sort`  (
  `sort_id` int(11) NOT NULL,
  `sort_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sort_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_sort
-- ----------------------------
INSERT INTO `blog_sort` VALUES (1, '生活');
INSERT INTO `blog_sort` VALUES (2, '学习');
INSERT INTO `blog_sort` VALUES (3, '工作');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES (1, '行千里');
INSERT INTO `blog_tag` VALUES (2, '读万卷');

SET FOREIGN_KEY_CHECKS = 1;
