/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : book

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-12-17 13:45:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `id` int(11) unsigned NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `imagefile` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('Gift card', '55', '1', '1111', 'tian', '64561', 'book_01.jpg');
INSERT INTO `book` VALUES ('Just Enough Research', '46', '2', '56565', 'sun', '7458', 'book_02.jpg');
INSERT INTO `book` VALUES ('Content Strategy', '80', '3', '25', 'yang', '569', 'book_03.jpg');
INSERT INTO `book` VALUES ('Design Is A Job', '46', '4', '46', 't', '111', 'book_04.jpg');
INSERT INTO `book` VALUES ('Mobile First', '90', '5', '66', 'd', '589', 'book_05.jpg');
INSERT INTO `book` VALUES ('DesigningforEmotion', '50', '6', '77', 'D', '666', 'book_06.jpg');
INSERT INTO `book` VALUES ('Web Design', '79', '7', '555', 'w', '626', 'book_07.jpg');
INSERT INTO `book` VALUES ('CSS3', '66', '8', '88', 'q', '8', 'book_09.jpg');
INSERT INTO `book` VALUES ('HTML5', '130', '9', '78', 'r', '898', 'book_08.jpg');
INSERT INTO `book` VALUES ('On Web Typography', '75', '10', '888', 'u', '567', 'book_10.jpg');
INSERT INTO `book` VALUES ('Responsible', '44', '11', '55', 'm', '333', 'book_12.jpg');
INSERT INTO `book` VALUES ('On Web Typography', '42', '12', '333', 's', '64', 'book_11.jpg');

-- ----------------------------
-- Table structure for `booktype`
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `typeid` int(11) NOT NULL,
  `typename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', '整数');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `ordercount` int(11) NOT NULL,
  `ordernumber` int(11) NOT NULL,
  `admincheck` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for `shoppingcart`
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `bookid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `bookname` varchar(255) DEFAULT NULL,
  `bookauthor` varchar(255) DEFAULT NULL,
  `bookimage` varchar(255) DEFAULT NULL,
  `bookprice` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES ('18', '5', '1', '5', 'Gift card', 'tian', 'book_01.jpg', '55');
INSERT INTO `shoppingcart` VALUES ('20', '5', '6', '3', 'DesigningforEmotion', 'D', 'book_06.jpg', '50');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `sex` varchar(255) CHARACTER SET latin1 NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shoppingcartid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('5', 'tian', 'tian', 'male', 'school', '0');
