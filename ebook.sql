/*
Navicat MySQL Data Transfer

Source Server         : daji
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : ebook

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2020-05-18 09:47:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '小说');
INSERT INTO `category` VALUES ('2', '文学');
INSERT INTO `category` VALUES ('3', '传记');
INSERT INTO `category` VALUES ('4', '艺术');
INSERT INTO `category` VALUES ('5', '少儿');
INSERT INTO `category` VALUES ('6', '经济');
INSERT INTO `category` VALUES ('7', '管理');
INSERT INTO `category` VALUES ('8', '生活');

-- ----------------------------
-- Table structure for entry
-- ----------------------------
DROP TABLE IF EXISTS `entry`;
CREATE TABLE `entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `uploaduser` varchar(255) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entry
-- ----------------------------
INSERT INTO `entry` VALUES ('27', '1', '红楼梦,姑苏城仁清巷内的葫芦庙住着一名叫贾雨村的穷书生，他受乡宦甄士隐的资助，上京赴考，中了进士，做了官。', null, '肖阳', '2020-04-22');
INSERT INTO `entry` VALUES ('28', '1', '红楼梦,姑苏城仁清巷内的葫芦庙住着一名叫贾雨村的穷书生，他受乡宦甄士隐的资助，上京赴考，中了进士，做了官。', null, '肖阳', '2020-04-22');
INSERT INTO `entry` VALUES ('33', '1', '红楼梦,姑苏城仁清巷内的葫芦庙住着一名叫贾雨村的穷书生，他受乡宦甄士隐的资助，上京赴考，中了进士，做了官。', null, '肖阳', '2020-04-22');
INSERT INTO `entry` VALUES ('34', '1', '红楼梦,姑苏城仁清巷内的葫芦庙住着一名叫贾雨村的穷书生，他受乡宦甄士隐的资助，上京赴考，中了进士，做了官。', null, '肖阳', '2020-04-22');
INSERT INTO `entry` VALUES ('35', '1', '红楼梦,姑苏城仁清巷内的葫芦庙住着一名叫贾雨村的穷书生，他受乡宦甄士隐的资助，上京赴考，中了进士，做了官。', null, '肖阳', '2020-04-22');
INSERT INTO `entry` VALUES ('36', '1', '红楼梦,姑苏城仁清巷内的葫芦庙住着一名叫贾雨村的穷书生，他受乡宦甄士隐的资助，上京赴考，中了进士，做了官。', null, '肖阳', '2020-04-22');
INSERT INTO `entry` VALUES ('37', '1', '红楼梦,姑苏城仁清巷内的葫芦庙住着一名叫贾雨村的穷书生，他受乡宦甄士隐的资助，上京赴考，中了进士，做了官。', null, '肖阳', '2020-04-22');
INSERT INTO `entry` VALUES ('38', '2', '红楼梦', '6666', '肖阳', '2020-04-22');
INSERT INTO `entry` VALUES ('43', '2', '红楼梦', '777777777', '肖阳', '2020-04-22');
INSERT INTO `entry` VALUES ('46', '0', null, null, null, null);
INSERT INTO `entry` VALUES ('47', '0', null, null, null, null);
INSERT INTO `entry` VALUES ('48', '0', null, null, null, null);
INSERT INTO `entry` VALUES ('49', '0', null, null, null, null);
INSERT INTO `entry` VALUES ('50', '0', null, null, null, null);
INSERT INTO `entry` VALUES ('51', '0', null, null, null, null);
INSERT INTO `entry` VALUES ('53', '5', '7777', '777', '777', '2020-05-16');
INSERT INTO `entry` VALUES ('54', '6', '888', '888', '888', '2020-05-16');
INSERT INTO `entry` VALUES ('55', '1', '333333', '33333', '333333', '2020-05-16');
