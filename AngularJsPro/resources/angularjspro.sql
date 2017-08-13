/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : angularjspro

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-08-13 16:54:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` varchar(64) NOT NULL,
  `customer_id` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1=活动,2=废弃',
  `update_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `scope` varchar(10) DEFAULT NULL COMMENT '1=中国大陆,2=香港,3=澳门,4=台湾,5=海外',
  `city` varchar(50) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `nick_name` varchar(50) DEFAULT NULL,
  `district` varchar(250) DEFAULT NULL,
  `introduction` varchar(500) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `valid` bit(1) DEFAULT NULL COMMENT '1=true,0=false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('0205b1ec4327407793a56e22e8c87aeb', '0205b1ec4327407793a56e22e8c87aeb', '2017-06-06 19:01:43', '1', '2017-06-06 19:01:43', '上海浦东新区陆家嘴', 'zpclord@sina.com', '120000', '120000', '15574896321', '15574896321', '龙龙', '龙龙', '15574896321', '', '1999-05-11', '');
INSERT INTO `customers` VALUES ('2CED3B1A057447B18302B104D4033C48\r\n', '84D3ED7C4FE911E689E8A3D2369547A7', '2016-07-12 13:41:23', '1', '2016-07-12 13:41:27', '北京顺义', 'zpclord@cmbc.com.cn', '450000', '北京', '15566667777', '010-11223344', '大卫', '书纪', '顺义', '前总结工作 ', '1980-01-09', '');
INSERT INTO `customers` VALUES ('62EC05C90C884FF18E5016323DD783FB', '62EC05C90C884FF18E5016323DD783FB', '2016-07-25 11:40:16', '1', '2016-07-25 13:41:07', '天国', 'dd@vip.acom', '110000', 'Shanghai,China', '+8615900827825', '+8615900827825', '无极', '无极', '', '', '1985-01-24', '');
INSERT INTO `customers` VALUES ('6A36C12213CE45AB8654F5B3D6F2C558', 'AC0F8E114FE911E689E8A3D2369547A7', '2016-07-14 16:24:55', '2', '2016-07-14 16:24:55', '中国大陆上海市闵行区北华路168弄', 'yyy@sina.vip.com', '120000', 'Shanghai,China', '+8615900827811', '13341169872', 'John', '杨浦林', '闵行区', '学习认识古代近东的世界观，能使我们避免犯错，并使我们对经文的理解，与当时的以色列人更接近。', '1988-06-30', '');
INSERT INTO `customers` VALUES ('7dc72611152a4421a276b34e4c0d96bf', '7dc72611152a4421a276b34e4c0d96bf', '2017-06-06 19:31:30', '1', '2017-06-06 19:31:30', '中国香港', 'zpclord@sina.com', '140000', '140000', '15578964123', '15578964123', '李', '李', '15578964123', '', '1980-01-09', '');
INSERT INTO `customers` VALUES ('AD4F49AA1E2142B6A7590601A5175D20', 'DAC81E5731F14EDC8F140BB2BE79F122', '2016-07-12 19:12:31', '1', '2017-03-31 18:30:48', '上海嘉定', 'john@nju.edu.cn', '130000', 'Shanghai,China', '+8615900827825', '+8615900827825', '无极', '暗影行者', '天国', '夺无奇不有vdsssdf sd', '1990-06-28', '\0');
INSERT INTO `customers` VALUES ('B91DB89F4FE911E689E8A3D2369547A7', 'B91DB89F4FE911E689E8A3D2369547A7', '2016-07-12 18:59:41', '1', '2016-07-12 18:59:41', '河南漯河', 'zpclord@sina.com', '140000', '上海', '+8615900827825', '+8615900827825', '约拿单', '原地区', '确有其事', '在此之前', '1989-01-15', '');
INSERT INTO `customers` VALUES ('bbbed24d04044db488633a74a17ff5d8', 'a44265dba4894279bebd51a0d5992f1b', '2017-06-02 11:09:50', '1', '2017-06-02 11:09:50', '北京顺义', 'zpclord@cmbc.com.cn', '440000', '北京', '15566667777', '10', '大卫', '书纪', '顺义', '前总结工作 ', '1980-01-09', '');
INSERT INTO `customers` VALUES ('BBD581F3A5EA4ED6905282C3134CAA7F\r\n', 'B395868E4FE911E689E8A3D2369547A7', '2016-07-12 18:22:07', '2', '2016-07-12 18:22:07', '四川成都', 'peter@usts.edu', '150000', 'Shanghai,China', '+8615900827825', '+8615900827825', '纸盒', '非机动车', '厅魂牵梦萦', '夺无奇不有', '1992-07-02', '');
INSERT INTO `customers` VALUES ('c4089d8ebd9d40d9adb95cad36d9e352', 'c4089d8ebd9d40d9adb95cad36d9e352', '2017-06-06 19:30:53', '1', '2017-06-06 19:30:53', '中国台北', 'zpclord@sina.com', '140000', '140000', '15578964123', '15578964123', '李', '李', '15578964123', '', '1980-01-09', '');
INSERT INTO `customers` VALUES ('DCB2E1E8047A443FAB4F777EF7F631EA', 'CF84A6D74FE911E689E8A3D2369547A7', '2016-07-14 16:35:22', '0', '2016-07-14 16:35:22', '广州天河机场', 'holy@heaven.lord', '220000', '码头', '021-11113455', '13543969872', '康长', '康长', '湾仔', '美索不达米亚', '1999-07-29', '');
INSERT INTO `customers` VALUES ('df301eddbbca46e29d9da1f6f28faf22', '0d26fbf859d34ce98f6c5b2036f14405', '2017-06-02 11:09:19', '1', '2017-06-02 11:09:19', '北京顺义', 'zpclord@cmbc.com.cn', '460000', '北京', '15566667777', '10', '大卫', '书纪', '顺义', '前总结工作 ', '1980-01-09', '');
