/*
 Navicat Premium Data Transfer

 Source Server         : 116.62.202.206
 Source Server Type    : MySQL
 Source Server Version : 50637
 Source Host           : 116.62.202.206:3306
 Source Schema         : wechatspider

 Target Server Type    : MySQL
 Target Server Version : 50637
 File Encoding         : 65001

 Date: 09/02/2018 23:14:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` bigint(20) NOT NULL,
  `biz` varchar(100) NOT NULL COMMENT '公众号的唯一标识',
  `nickname` varchar(100) NOT NULL COMMENT '昵称',
  `headimg` varchar(300) DEFAULT NULL COMMENT '公众号LOGO',
  `crawl_time` bigint(20) NOT NULL COMMENT '抓取时间，时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_biz` (`biz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信公众号信息';

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` bigint(20) NOT NULL,
  `biz` varchar(50) NOT NULL COMMENT '公众号唯一标识',
  `title` varchar(100) NOT NULL COMMENT '文章标题',
  `digest` varchar(200) DEFAULT NULL COMMENT '文章副标题',
  `content` text COMMENT '文章内容',
  `content_url` varchar(500) DEFAULT NULL COMMENT '微信的详细连接地址',
  `source_url` varchar(500) DEFAULT NULL COMMENT '原文地址',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `cover` varchar(500) DEFAULT NULL COMMENT '文章图片连接',
  `copyright_stat` int(11) DEFAULT NULL COMMENT '文章是否原创标识 11为原创 100为无原创 101为转发',
  `read_num` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `like_num` int(11) NOT NULL DEFAULT '0' COMMENT '点赞量',
  `datetime` bigint(20) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_biz_title` (`title`,`biz`),
  KEY `idx_biz` (`biz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信公众号文章';

SET FOREIGN_KEY_CHECKS = 1;