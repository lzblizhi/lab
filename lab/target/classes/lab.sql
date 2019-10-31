/*
Navicat MySQL Data Transfer

Source Server         : lizhi
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lab

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-10-17 00:28:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `authority_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `authority_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=970 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('319', '2', '35');
INSERT INTO `authority` VALUES ('320', '2', '36');
INSERT INTO `authority` VALUES ('321', '2', '25');
INSERT INTO `authority` VALUES ('322', '2', '37');
INSERT INTO `authority` VALUES ('323', '2', '39');
INSERT INTO `authority` VALUES ('324', '2', '41');
INSERT INTO `authority` VALUES ('325', '2', '42');
INSERT INTO `authority` VALUES ('326', '2', '43');
INSERT INTO `authority` VALUES ('327', '2', '44');
INSERT INTO `authority` VALUES ('328', '2', '45');
INSERT INTO `authority` VALUES ('329', '2', '46');
INSERT INTO `authority` VALUES ('330', '2', '47');
INSERT INTO `authority` VALUES ('331', '2', '1');
INSERT INTO `authority` VALUES ('332', '2', '14');
INSERT INTO `authority` VALUES ('333', '2', '15');
INSERT INTO `authority` VALUES ('916', '1', '1');
INSERT INTO `authority` VALUES ('917', '1', '5');
INSERT INTO `authority` VALUES ('918', '1', '17');
INSERT INTO `authority` VALUES ('919', '1', '18');
INSERT INTO `authority` VALUES ('920', '1', '19');
INSERT INTO `authority` VALUES ('921', '1', '20');
INSERT INTO `authority` VALUES ('922', '1', '13');
INSERT INTO `authority` VALUES ('923', '1', '21');
INSERT INTO `authority` VALUES ('924', '1', '22');
INSERT INTO `authority` VALUES ('925', '1', '23');
INSERT INTO `authority` VALUES ('926', '1', '35');
INSERT INTO `authority` VALUES ('927', '1', '36');
INSERT INTO `authority` VALUES ('928', '1', '14');
INSERT INTO `authority` VALUES ('929', '1', '15');
INSERT INTO `authority` VALUES ('930', '1', '24');
INSERT INTO `authority` VALUES ('931', '1', '25');
INSERT INTO `authority` VALUES ('932', '1', '26');
INSERT INTO `authority` VALUES ('933', '1', '50');
INSERT INTO `authority` VALUES ('934', '1', '54');
INSERT INTO `authority` VALUES ('935', '1', '55');
INSERT INTO `authority` VALUES ('936', '1', '56');
INSERT INTO `authority` VALUES ('937', '1', '31');
INSERT INTO `authority` VALUES ('938', '1', '32');
INSERT INTO `authority` VALUES ('939', '1', '33');
INSERT INTO `authority` VALUES ('940', '1', '34');
INSERT INTO `authority` VALUES ('941', '1', '52');
INSERT INTO `authority` VALUES ('942', '1', '53');
INSERT INTO `authority` VALUES ('943', '1', '37');
INSERT INTO `authority` VALUES ('944', '1', '39');
INSERT INTO `authority` VALUES ('945', '1', '41');
INSERT INTO `authority` VALUES ('946', '1', '42');
INSERT INTO `authority` VALUES ('947', '1', '43');
INSERT INTO `authority` VALUES ('948', '1', '44');
INSERT INTO `authority` VALUES ('949', '1', '45');
INSERT INTO `authority` VALUES ('950', '1', '46');
INSERT INTO `authority` VALUES ('951', '1', '47');
INSERT INTO `authority` VALUES ('952', '1', '58');
INSERT INTO `authority` VALUES ('953', '1', '59');
INSERT INTO `authority` VALUES ('954', '1', '63');
INSERT INTO `authority` VALUES ('955', '1', '64');
INSERT INTO `authority` VALUES ('956', '1', '65');
INSERT INTO `authority` VALUES ('957', '1', '75');
INSERT INTO `authority` VALUES ('958', '1', '60');
INSERT INTO `authority` VALUES ('959', '1', '66');
INSERT INTO `authority` VALUES ('960', '1', '61');
INSERT INTO `authority` VALUES ('961', '1', '67');
INSERT INTO `authority` VALUES ('962', '1', '68');
INSERT INTO `authority` VALUES ('963', '1', '69');
INSERT INTO `authority` VALUES ('964', '1', '74');
INSERT INTO `authority` VALUES ('965', '1', '62');
INSERT INTO `authority` VALUES ('966', '1', '70');
INSERT INTO `authority` VALUES ('967', '1', '71');
INSERT INTO `authority` VALUES ('968', '1', '72');
INSERT INTO `authority` VALUES ('969', '1', '73');

-- ----------------------------
-- Table structure for `c3p0testtable`
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c3p0testtable
-- ----------------------------

-- ----------------------------
-- Table structure for `devorder`
-- ----------------------------
DROP TABLE IF EXISTS `devorder`;
CREATE TABLE `devorder` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(16) DEFAULT NULL COMMENT '设备名称',
  `uid` int(11) DEFAULT NULL COMMENT '申请人id',
  `useTo` varchar(64) DEFAULT NULL COMMENT '用途',
  `number` int(4) DEFAULT NULL COMMENT '借用数量',
  `btime` date DEFAULT NULL COMMENT '借用时间',
  `rtime` date DEFAULT NULL COMMENT '归还时间',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `astatus` int(4) DEFAULT NULL COMMENT '审核状态',
  `rstatus` int(4) DEFAULT NULL COMMENT '归还状态',
  `part` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dbr_did` (`name`) USING BTREE,
  KEY `dbr_uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157114644206675 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of devorder
-- ----------------------------
INSERT INTO `devorder` VALUES ('1', '示波器', '18', '实验测试', '2', '2019-03-01', '2019-03-02', '1366351403@qq.com', '2', '2', '电子152');
INSERT INTO `devorder` VALUES ('2', '示波器', '18', '实验课', '2', '2019-03-01', '2019-03-02', '1366351403@qq.com', '1', '0', '电子152');
INSERT INTO `devorder` VALUES ('5', '示波器', '18', '111', '1', '2019-05-01', '2019-05-02', '111', '2', '1', '电子152');
INSERT INTO `devorder` VALUES ('6', '示波器', '18', '111', '1', '2019-05-01', '2019-05-02', '111', '1', '0', '电子152');
INSERT INTO `devorder` VALUES ('157114617704467', '开发板', '1', 'test333', '2', '2019-10-15', '2019-10-16', 'li@qq.com', '2', '1', '其他111');
INSERT INTO `devorder` VALUES ('157114641186519', '单片机', '1', 'test444', '2', '2019-10-15', '2019-10-18', 'li@qq.com', '2', '1', '其他111');
INSERT INTO `devorder` VALUES ('157114643192808', '电烙铁', '1', 'test444', '2', '2019-10-15', '2019-10-18', 'li@qq.com', '2', '2', '其他111');

-- ----------------------------
-- Table structure for `lab`
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab` (
  `id` bigint(32) NOT NULL COMMENT '实验室id',
  `name` varchar(16) DEFAULT NULL COMMENT '实验室编号',
  `admin` varchar(16) DEFAULT NULL COMMENT '管理人员',
  `status` int(4) DEFAULT NULL COMMENT '实验室状态 0:空闲， 1:被占用',
  `adminphone` int(16) DEFAULT NULL COMMENT '管理员联系方式',
  `comment` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `lab_uid` (`admin`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab
-- ----------------------------
INSERT INTO `lab` VALUES ('2004', '英东楼801', '华老师', '1', '4234657', '这是备注4');
INSERT INTO `lab` VALUES ('2005', '英东楼802', '华老师', '1', '4234657', '这是备注4');
INSERT INTO `lab` VALUES ('2006', '英东楼803', '华老师', '0', '4234657', '这是备注4');
INSERT INTO `lab` VALUES ('2007', '英东楼701', '华老师', '0', '4234657', '这是备注4');
INSERT INTO `lab` VALUES ('2010', '英东楼702', '华老师', '0', '4234657', '这是备注4');
INSERT INTO `lab` VALUES ('2011', '英东楼703', '华老师', '0', '4234657', '这是备注4');
INSERT INTO `lab` VALUES ('2013', '英东楼601', '华老师', '0', '4234657', '这是备注4');
INSERT INTO `lab` VALUES ('2014', '英东楼602', '华老师', '0', '4234657', '这是备注4');
INSERT INTO `lab` VALUES ('2015', '英东楼603', '华老师', '0', '4234657', '这是备注4');
INSERT INTO `lab` VALUES ('2016', '英东楼621', '华老师', '1', '4234657', '这是备注4');
INSERT INTO `lab` VALUES ('2017', '英东楼610', '华老师', '0', '4234657', '这是备注4');
INSERT INTO `lab` VALUES ('2018', '英东楼710', '华老师', '0', '4234657', '这是备注4');
INSERT INTO `lab` VALUES ('156749895631928', '英东楼704', '华老师', '0', '4234657', '这是备注4');
INSERT INTO `lab` VALUES ('156751289959059', '英东楼501', '华老师', '0', '4234657', '这是备注4');

-- ----------------------------
-- Table structure for `laborder`
-- ----------------------------
DROP TABLE IF EXISTS `laborder`;
CREATE TABLE `laborder` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` bigint(32) NOT NULL COMMENT '申请人id',
  `part` varchar(16) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL COMMENT '实验室名称',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `useTo` varchar(64) DEFAULT NULL COMMENT '用途',
  `day` int(4) DEFAULT NULL COMMENT '借用星期',
  `beginclass` int(4) DEFAULT NULL,
  `endclass` int(4) DEFAULT NULL,
  `astatus` int(4) DEFAULT NULL COMMENT '审核状态：0未审核，1已审核',
  `rstatus` int(4) DEFAULT NULL COMMENT '归还状态：0初始，1未归还，2已归还',
  PRIMARY KEY (`id`),
  KEY `lbr_uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157124027114355 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of laborder
-- ----------------------------
INSERT INTO `laborder` VALUES ('157123799248785', '1', '其他111', '英东楼803', 'li@qq.com', 'test', null, '2', '2', '1', '0');
INSERT INTO `laborder` VALUES ('157123811885910', '1', '其他111', '英东楼803', 'li@qq.com', 'test', null, '2', '2', '1', '0');
INSERT INTO `laborder` VALUES ('157123855901264', '1', '其他111', '英东楼803', 'li@qq.com', 'test', null, '2', '2', '1', '0');
INSERT INTO `laborder` VALUES ('157123864600342', '1', '其他111', '英东楼803', 'li@qq.com', 'test', null, '2', '2', '1', '0');
INSERT INTO `laborder` VALUES ('157123933616461', '1', '其他111', '英东楼803', 'li@qq.com', 'test', null, '2', '2', '1', '0');
INSERT INTO `laborder` VALUES ('157123938600195', '1', '其他111', '英东楼803', 'li@qq.com', 'test', null, '2', '2', '1', '0');
INSERT INTO `laborder` VALUES ('157124015864016', '1', '其他111', '英东楼803', 'li@qq.com', 'test', null, '2', '2', '1', '0');
INSERT INTO `laborder` VALUES ('157124016452431', '1', '其他111', '英东楼803', 'li@qq.com', 'test', null, '2', '2', '1', '0');
INSERT INTO `laborder` VALUES ('157124016536914', '1', '其他111', '英东楼701', 'li@qq.com', 'test', null, '4', '2', '1', '0');
INSERT INTO `laborder` VALUES ('157124027114354', '1', '其他111', '英东楼702', 'li@qq.com', 'test', '5', '2', '2', '1', '0');

-- ----------------------------
-- Table structure for `lab_awards`
-- ----------------------------
DROP TABLE IF EXISTS `lab_awards`;
CREATE TABLE `lab_awards` (
  `aw_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `aw_title` varchar(64) DEFAULT NULL COMMENT '奖项标题',
  `aw_desc` text COMMENT '奖项描述',
  `aw_image` varchar(512) DEFAULT NULL COMMENT '奖项图片',
  PRIMARY KEY (`aw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab_awards
-- ----------------------------
INSERT INTO `lab_awards` VALUES ('1', '一等奖', '蓝桥杯软件大赛的深V发到你不是多个梵蒂冈梵蒂冈收到是大法官是大法官是大法官阿道夫根深蒂固说的话', 'http://192.168.43.133/group1/M00/00/00/wKgrhVy8VVyAfSLhAADbo2ebXmA546.jpg');
INSERT INTO `lab_awards` VALUES ('2', '二等奖', 'it文化节电子趣味大赛副董事长法国第三方广东省分行是电饭锅电饭锅 搜到这个梵蒂冈', null);
INSERT INTO `lab_awards` VALUES ('3', '二等奖', '胜多负少的告诉对方水电费水电费十大歌手发的发生发生防守打法', 'sadas');
INSERT INTO `lab_awards` VALUES ('4', '三等奖', '广东省xxx大赛', 'sadas');
INSERT INTO `lab_awards` VALUES ('6', '阿迪王的我', '1231', 'http://192.168.43.133/group1/M00/00/00/wKgrhVy8VjaAMQz8AAJtgmdkweo786.PNG');

-- ----------------------------
-- Table structure for `lab_class`
-- ----------------------------
DROP TABLE IF EXISTS `lab_class`;
CREATE TABLE `lab_class` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '课程名称',
  `place` varchar(16) DEFAULT NULL COMMENT '地点',
  `class` varchar(16) DEFAULT NULL COMMENT '上课教师',
  `week` int(4) DEFAULT NULL COMMENT '第几节课',
  `jieci` int(4) DEFAULT NULL COMMENT '星期几',
  `pid` bigint(32) DEFAULT NULL COMMENT '单位id',
  PRIMARY KEY (`id`),
  KEY `p_id` (`pid`) USING BTREE,
  CONSTRAINT `lab_class_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `lab_part` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab_class
-- ----------------------------
INSERT INTO `lab_class` VALUES ('2', '近场通信', '英东楼803', '李老师', '2', '3', '2');
INSERT INTO `lab_class` VALUES ('3', 'java se实验', '英东楼801', '赵老师', '3', '1', '3');
INSERT INTO `lab_class` VALUES ('4', '数据结构实验', '英东楼602', '王老师', '4', '3', '3');
INSERT INTO `lab_class` VALUES ('5', '算法实验', '英东楼803', '张老师', '5', '1', '3');
INSERT INTO `lab_class` VALUES ('6', '计算机网络实验', '英东楼801', '李老师', '1', '2', '2');
INSERT INTO `lab_class` VALUES ('7', '软件设计实验', '英东楼601', '赵老师', '2', '3', '3');
INSERT INTO `lab_class` VALUES ('8', 'java web实验', '英东楼803', '张老师', '3', '1', '3');
INSERT INTO `lab_class` VALUES ('9', '高频电子实验', '英东楼602', '李老师', '4', '5', '2');
INSERT INTO `lab_class` VALUES ('10', '大学物理实验', '英东楼801', '赵老师', '5', '4', '3');
INSERT INTO `lab_class` VALUES ('11', '单片机实验', '英东楼803', '张老师', '1', '1', '2');
INSERT INTO `lab_class` VALUES ('13', '计算机', '英东楼701', '鄢琼老师', '2', '7', '3');
INSERT INTO `lab_class` VALUES ('18', '单片机实验', '英东楼803', '赵老师', '2', '3', '2');
INSERT INTO `lab_class` VALUES ('19', 'ces单片机实验', '英东楼803', 'ceshi老师', '3', '1', '3');
INSERT INTO `lab_class` VALUES ('21', '汇编', '英东楼701', '赵老师', '2', '1', '2');
INSERT INTO `lab_class` VALUES ('22', '计算机网络2', '英东楼701', '赵老师', '1', '1', '3');

-- ----------------------------
-- Table structure for `lab_device`
-- ----------------------------
DROP TABLE IF EXISTS `lab_device`;
CREATE TABLE `lab_device` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '设备id',
  `name` varchar(16) DEFAULT NULL COMMENT '设备名称',
  `photo` varchar(500) DEFAULT NULL,
  `quantity` int(4) DEFAULT NULL COMMENT '总数',
  `usable` int(4) DEFAULT NULL COMMENT '可用数',
  `buydate` date DEFAULT NULL COMMENT '购买日期',
  `place` varchar(16) DEFAULT NULL COMMENT '存放地点',
  `comment` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `lab_id` (`place`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157084253581948 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab_device
-- ----------------------------
INSERT INTO `lab_device` VALUES ('1035', '开发板', 'http://localhost:8080/lab/resources/upload/b9920ee1adee4c8d819639b3ccb950db.jpg', '50', '40', '2019-01-02', '仓库室1', '这是备注4');
INSERT INTO `lab_device` VALUES ('1036', '单片机', '/lab/resources/upload/1570884254608.jpg', '100', '40', '2019-04-11', '', '');
INSERT INTO `lab_device` VALUES ('1037', '嵌入式实验箱', '', '50', '50', '2019-04-04', '仓库室1', '111');
INSERT INTO `lab_device` VALUES ('1038', '电烙铁', '', '50', '33', '2019-04-02', '仓库室1', '12');
INSERT INTO `lab_device` VALUES ('1039', '示波器2', '', '10', '5', '2019-07-11', '仓库室1', '');
INSERT INTO `lab_device` VALUES ('1041', '整流器', '', '50', '30', '2019-04-26', '仓库室1', '111');
INSERT INTO `lab_device` VALUES ('156929662573019', '示波器示波器', '/lab/resources/upload/1570884343849.jpg', '100', '46', '2019-08-25', '708', '');
INSERT INTO `lab_device` VALUES ('156954920121581', '触摸屏', '', '456', '456', '2019-08-25', '701', '');
INSERT INTO `lab_device` VALUES ('157084253581947', '示波器', '/lab/resources/upload/1570884296438.jpg', '100', '50', '2018-10-02', '仓库1', '这是备注44');

-- ----------------------------
-- Table structure for `lab_inform`
-- ----------------------------
DROP TABLE IF EXISTS `lab_inform`;
CREATE TABLE `lab_inform` (
  `inf_id` bigint(32) NOT NULL AUTO_INCREMENT,
  `inf_title` varchar(100) DEFAULT NULL,
  `inf_content` text,
  `inf_time` date DEFAULT NULL,
  PRIMARY KEY (`inf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab_inform
-- ----------------------------
INSERT INTO `lab_inform` VALUES ('1', '通知1', '真的要下大雨了', '2019-05-09');
INSERT INTO `lab_inform` VALUES ('5', '喜报！我校......................', '我校在近期的广东省xxx大赛中荣获佳绩', '2019-03-01');
INSERT INTO `lab_inform` VALUES ('6', '教字[2019]18号关于2019做好我校', '教字[2019]18号关于2019做好我校', '2019-03-01');
INSERT INTO `lab_inform` VALUES ('9', '嗯对对对', '好的', '2019-04-23');
INSERT INTO `lab_inform` VALUES ('10', '明天不用上课', '明天真的不用上课', '2019-05-10');
INSERT INTO `lab_inform` VALUES ('11', '今天答辩', '对对对', '2019-05-11');

-- ----------------------------
-- Table structure for `lab_intro`
-- ----------------------------
DROP TABLE IF EXISTS `lab_intro`;
CREATE TABLE `lab_intro` (
  `intr_id` bigint(32) NOT NULL AUTO_INCREMENT,
  `intr_desc` text COMMENT '实验室简介',
  `intr_image` varchar(512) DEFAULT NULL COMMENT '简介图片',
  PRIMARY KEY (`intr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab_intro
-- ----------------------------
INSERT INTO `lab_intro` VALUES ('1001', '实验室依托节能工程与楼宇智能化、计算机应用技术、控制理论与控制工程、市政工程和供热、供燃气、通风及空调工程等学科，围绕智能建筑、建筑节能、智慧城市等研究领域，建有楼宇控制与智能家居好的', 'http://192.168.43.133/group1/M00/00/00/wKgrhVzWXNqAFuyeAABJPcK0Qtc342.png');

-- ----------------------------
-- Table structure for `lab_material`
-- ----------------------------
DROP TABLE IF EXISTS `lab_material`;
CREATE TABLE `lab_material` (
  `m_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `m_name` varchar(16) DEFAULT NULL COMMENT '名称',
  `m_price` bigint(16) DEFAULT NULL COMMENT '价格',
  `m_quantity` int(16) DEFAULT NULL COMMENT '数量',
  `m_usable` int(16) DEFAULT NULL COMMENT '可用数量',
  `place` varchar(16) DEFAULT NULL COMMENT '存放地点',
  `m_comment` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3016 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab_material
-- ----------------------------
INSERT INTO `lab_material` VALUES ('3006', '晶振', '2000', '80', '32', '621', '我是备注');
INSERT INTO `lab_material` VALUES ('3007', '电容', '300', '65', '31', '621', '我是备注');
INSERT INTO `lab_material` VALUES ('3009', '电路板1', '500', '56', '35', '621', '我是备注');
INSERT INTO `lab_material` VALUES ('3011', '焊锡', '200', '78', '35', '621', '我是备注');
INSERT INTO `lab_material` VALUES ('3012', '焊锡膏', '800', '91', '55', '621', '我是备注');
INSERT INTO `lab_material` VALUES ('3013', '开关', '1000', '77', '26', '621', '我是备注');
INSERT INTO `lab_material` VALUES ('3015', '试剂', '400', '33', '22', '801', '备注1');

-- ----------------------------
-- Table structure for `lab_part`
-- ----------------------------
DROP TABLE IF EXISTS `lab_part`;
CREATE TABLE `lab_part` (
  `id` bigint(32) NOT NULL,
  `name` varchar(16) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab_part
-- ----------------------------
INSERT INTO `lab_part` VALUES ('1', '信科院', null);
INSERT INTO `lab_part` VALUES ('2', '电子152', null);
INSERT INTO `lab_part` VALUES ('3', '计机153', null);
INSERT INTO `lab_part` VALUES ('4', '其他111', '');

-- ----------------------------
-- Table structure for `lab_repaire`
-- ----------------------------
DROP TABLE IF EXISTS `lab_repaire`;
CREATE TABLE `lab_repaire` (
  `rep_id` bigint(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `dev_name` varchar(32) DEFAULT NULL,
  `rep_num` int(4) DEFAULT NULL,
  `reason` varchar(512) DEFAULT NULL,
  `rep_date` date DEFAULT NULL,
  PRIMARY KEY (`rep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab_repaire
-- ----------------------------
INSERT INTO `lab_repaire` VALUES ('1', '李老师', '示波器', '1', '电源坏', '2019-05-07');
INSERT INTO `lab_repaire` VALUES ('2', '张老师', '电烙铁', '1', '按键坏', '2019-05-07');
INSERT INTO `lab_repaire` VALUES ('3', '李老师', '嵌入式实验箱', '1', '显示屏坏', '2019-05-07');
INSERT INTO `lab_repaire` VALUES ('4', '李老师', '整流器', '1', '破损', '2019-05-07');
INSERT INTO `lab_repaire` VALUES ('123', null, '电压比爱', '1', '不知道', '2019-05-10');

-- ----------------------------
-- Table structure for `lab_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `lab_schedule`;
CREATE TABLE `lab_schedule` (
  `a_id` bigint(32) NOT NULL AUTO_INCREMENT,
  `a_emailmsg` varchar(500) DEFAULT NULL COMMENT '邮件内容',
  `a_subject` varchar(64) DEFAULT NULL COMMENT '邮件主题',
  `a_time` date DEFAULT NULL COMMENT '提醒时间',
  `a_email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `a_uid` bigint(32) DEFAULT NULL COMMENT '用户id',
  `a_status` int(4) DEFAULT NULL COMMENT '提醒状态',
  PRIMARY KEY (`a_id`),
  KEY `sc_uid` (`a_email`) USING BTREE,
  KEY `sc_uid_2` (`a_uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab_schedule
-- ----------------------------
INSERT INTO `lab_schedule` VALUES ('1', '起床刷牙早餐买菜耕田午饭午觉耕田下午茶晚饭洗澡看书睡觉', '充实的一天', '2019-05-03', '1366351403@qq.com', '2', '1');
INSERT INTO `lab_schedule` VALUES ('2', 'aaaaaaaaaaaaaa', '考试', '2019-02-09', '1366351403@qq.com', '2', '0');
INSERT INTO `lab_schedule` VALUES ('3', 'dsgdfgd', '我的计划', '2019-02-26', '1366351403@qq.com', '2', '1');
INSERT INTO `lab_schedule` VALUES ('4', '这是一封测试邮件，请忽略', '考试', '2019-02-26', '1366351403@qq.com', '2', '0');
INSERT INTO `lab_schedule` VALUES ('6', '这是一封测试邮件，请忽略', '我的计划2', '2019-02-26', '1366351403@qq.com', '1', '1');
INSERT INTO `lab_schedule` VALUES ('9', '这是一封测试邮件，请忽略', '计划', '2019-05-03', '1366351403@qq.com', '1', '1');
INSERT INTO `lab_schedule` VALUES ('10', '这是一封测试邮件，请忽略', '我的计划', '2019-05-03', '1366351403@qq.com', '3', '1');
INSERT INTO `lab_schedule` VALUES ('11', '这是一封测试邮件，请忽略', '我的计划', '2019-05-03', '1366351403@qq.com', '3', '1');
INSERT INTO `lab_schedule` VALUES ('12', '这是一封测试邮件，请忽略', '我的计划', '2019-05-12', '1366351403@qq.com', '3', '0');

-- ----------------------------
-- Table structure for `lab_template`
-- ----------------------------
DROP TABLE IF EXISTS `lab_template`;
CREATE TABLE `lab_template` (
  `te_id` bigint(32) NOT NULL AUTO_INCREMENT,
  `te_name` varchar(64) DEFAULT NULL,
  `te_url` varchar(512) DEFAULT NULL,
  `te_data` date DEFAULT NULL,
  `te_type` int(4) DEFAULT NULL,
  PRIMARY KEY (`te_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab_template
-- ----------------------------
INSERT INTO `lab_template` VALUES ('1', '物资出纳', 'http://192.168.43.133/group1/M00/00/00/wKgrhVzNt1-AfnKRAAAzH-RLXEQ32.docx', '2019-05-05', '1');
INSERT INTO `lab_template` VALUES ('2', '虚拟机搭建服务器步骤', 'http://192.168.43.133/group1/M00/00/00/wKgrhVzNuL2AKmXoAAAzKFXx1fk72.docx', '2019-05-05', '4');
INSERT INTO `lab_template` VALUES ('3', '示波器说明书', 'http://192.168.43.133/group1/M00/00/00/wKgrhVzNuRyAeIM8AAAzJ2gSO4w83.docx', '2019-05-05', '3');
INSERT INTO `lab_template` VALUES ('4', '物力实验报告', 'http://192.168.43.133/group1/M00/00/00/wKgrhVzNufGAUNxmAAAzOLR5-Gk57.docx', '2019-05-05', '2');
INSERT INTO `lab_template` VALUES ('5', 'ppt要求.doc', 'http://192.168.43.133/group1/M00/00/00/wKgrhVzVMuGAUHOvAAAwAM7_NeQ868.doc', '2019-05-10', '2');

-- ----------------------------
-- Table structure for `lab_type`
-- ----------------------------
DROP TABLE IF EXISTS `lab_type`;
CREATE TABLE `lab_type` (
  `tety_id` bigint(32) NOT NULL,
  `tety_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`tety_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab_type
-- ----------------------------
INSERT INTO `lab_type` VALUES ('1', '实验室数据报表');
INSERT INTO `lab_type` VALUES ('2', '实验报告模板');
INSERT INTO `lab_type` VALUES ('3', '使用说明书');
INSERT INTO `lab_type` VALUES ('4', '学习资源');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('13', '用户名为admin的用户登录时输入验证码错误!', '2018-12-16 18:17:30');
INSERT INTO `log` VALUES ('14', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:22:56');
INSERT INTO `log` VALUES ('15', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:37:15');
INSERT INTO `log` VALUES ('16', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:40:21');
INSERT INTO `log` VALUES ('17', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 19:11:49');
INSERT INTO `log` VALUES ('18', '用户名为{admin}，的用户成功修改密码!', '2018-12-16 19:13:32');
INSERT INTO `log` VALUES ('19', '用户名为{admin}，的用户成功修改密码!', '2018-12-16 19:14:01');
INSERT INTO `log` VALUES ('20', '用户名为{猿来入此}，角色为{普通用户}的用户登录成功!', '2018-12-16 19:17:46');
INSERT INTO `log` VALUES ('21', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 16:05:43');
INSERT INTO `log` VALUES ('22', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 16:34:56');
INSERT INTO `log` VALUES ('23', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 16:37:39');
INSERT INTO `log` VALUES ('24', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 18:03:27');
INSERT INTO `log` VALUES ('25', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 18:13:49');
INSERT INTO `log` VALUES ('26', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 18:55:44');
INSERT INTO `log` VALUES ('27', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 19:01:56');
INSERT INTO `log` VALUES ('28', '�û���Ϊ{admin}����ɫΪ{超级管理员}���û���¼�ɹ�!', '2019-10-07 19:17:48');
INSERT INTO `log` VALUES ('29', '�û���Ϊadmin���û���¼ʱ������֤�����!', '2019-10-07 21:08:24');
INSERT INTO `log` VALUES ('30', '�û���Ϊ{admin}����ɫΪ{超级管理员}���û���¼�ɹ�!', '2019-10-07 21:08:36');
INSERT INTO `log` VALUES ('31', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 21:53:55');
INSERT INTO `log` VALUES ('32', '用户名为admin的用户登录时输入密码错误!', '2019-10-07 22:06:36');
INSERT INTO `log` VALUES ('33', '用户名为admin的用户登录时输入密码错误!', '2019-10-07 22:06:46');
INSERT INTO `log` VALUES ('34', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 22:07:00');
INSERT INTO `log` VALUES ('35', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 22:48:16');
INSERT INTO `log` VALUES ('36', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 22:48:49');
INSERT INTO `log` VALUES ('37', '用户名为admin的用户登录时输入验证码错误!', '2019-10-07 22:58:29');
INSERT INTO `log` VALUES ('38', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 22:58:45');
INSERT INTO `log` VALUES ('39', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 23:14:02');
INSERT INTO `log` VALUES ('40', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-07 23:17:43');
INSERT INTO `log` VALUES ('41', '�û���Ϊ{admin}����ɫΪ{超级管理员}���û���¼�ɹ�!', '2019-10-08 10:45:27');
INSERT INTO `log` VALUES ('42', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-08 11:57:26');
INSERT INTO `log` VALUES ('43', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-08 20:34:42');
INSERT INTO `log` VALUES ('44', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-08 23:53:03');
INSERT INTO `log` VALUES ('45', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-09 00:15:13');
INSERT INTO `log` VALUES ('46', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-09 15:13:44');
INSERT INTO `log` VALUES ('47', '用户名为admin的用户登录时输入验证码错误!', '2019-10-09 15:43:15');
INSERT INTO `log` VALUES ('48', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-09 15:43:24');
INSERT INTO `log` VALUES ('49', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-09 22:36:57');
INSERT INTO `log` VALUES ('50', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-09 22:46:57');
INSERT INTO `log` VALUES ('51', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-09 22:56:03');
INSERT INTO `log` VALUES ('52', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-09 22:58:17');
INSERT INTO `log` VALUES ('53', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-09 23:14:28');
INSERT INTO `log` VALUES ('54', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-10 12:33:28');
INSERT INTO `log` VALUES ('55', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-10 12:35:52');
INSERT INTO `log` VALUES ('56', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-10 12:42:52');
INSERT INTO `log` VALUES ('57', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-10 12:57:02');
INSERT INTO `log` VALUES ('58', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-10 12:59:37');
INSERT INTO `log` VALUES ('59', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-10 13:00:36');
INSERT INTO `log` VALUES ('60', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-10 18:48:57');
INSERT INTO `log` VALUES ('61', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-10 19:23:09');
INSERT INTO `log` VALUES ('62', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-10 19:25:42');
INSERT INTO `log` VALUES ('63', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 11:59:20');
INSERT INTO `log` VALUES ('64', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 12:02:58');
INSERT INTO `log` VALUES ('65', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 12:23:56');
INSERT INTO `log` VALUES ('66', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 12:26:45');
INSERT INTO `log` VALUES ('67', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 12:27:59');
INSERT INTO `log` VALUES ('68', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 12:33:58');
INSERT INTO `log` VALUES ('69', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 13:18:33');
INSERT INTO `log` VALUES ('70', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 13:21:00');
INSERT INTO `log` VALUES ('71', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 13:28:05');
INSERT INTO `log` VALUES ('72', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 13:36:42');
INSERT INTO `log` VALUES ('73', '用户名为admin的用户登录时输入验证码错误!', '2019-10-11 13:53:23');
INSERT INTO `log` VALUES ('74', '用户名为admin的用户登录时输入验证码错误!', '2019-10-11 13:53:32');
INSERT INTO `log` VALUES ('75', '用户名为admin的用户登录时输入验证码错误!', '2019-10-11 13:53:42');
INSERT INTO `log` VALUES ('76', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 13:53:56');
INSERT INTO `log` VALUES ('77', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 13:57:38');
INSERT INTO `log` VALUES ('78', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 14:00:13');
INSERT INTO `log` VALUES ('79', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 14:11:25');
INSERT INTO `log` VALUES ('80', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 14:16:35');
INSERT INTO `log` VALUES ('81', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 14:22:38');
INSERT INTO `log` VALUES ('82', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 14:46:59');
INSERT INTO `log` VALUES ('83', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 14:54:15');
INSERT INTO `log` VALUES ('84', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 15:35:40');
INSERT INTO `log` VALUES ('85', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 15:36:01');
INSERT INTO `log` VALUES ('86', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 16:47:42');
INSERT INTO `log` VALUES ('87', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 17:59:07');
INSERT INTO `log` VALUES ('88', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 21:23:29');
INSERT INTO `log` VALUES ('89', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 21:28:08');
INSERT INTO `log` VALUES ('90', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 21:37:38');
INSERT INTO `log` VALUES ('91', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 21:42:26');
INSERT INTO `log` VALUES ('92', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 21:46:17');
INSERT INTO `log` VALUES ('93', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 21:59:01');
INSERT INTO `log` VALUES ('94', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 22:03:37');
INSERT INTO `log` VALUES ('95', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 22:08:16');
INSERT INTO `log` VALUES ('96', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 22:21:46');
INSERT INTO `log` VALUES ('97', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 23:41:10');
INSERT INTO `log` VALUES ('98', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 23:44:12');
INSERT INTO `log` VALUES ('99', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-11 23:46:55');
INSERT INTO `log` VALUES ('100', '用户名为admin的用户登录时输入验证码错误!', '2019-10-12 00:33:58');
INSERT INTO `log` VALUES ('101', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 00:34:07');
INSERT INTO `log` VALUES ('102', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 08:49:27');
INSERT INTO `log` VALUES ('103', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 08:59:40');
INSERT INTO `log` VALUES ('104', '用户名为admin的用户登录时输入验证码错误!', '2019-10-12 09:04:22');
INSERT INTO `log` VALUES ('105', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 09:04:30');
INSERT INTO `log` VALUES ('106', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 09:08:05');
INSERT INTO `log` VALUES ('107', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 09:14:37');
INSERT INTO `log` VALUES ('108', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 09:20:35');
INSERT INTO `log` VALUES ('109', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 09:29:13');
INSERT INTO `log` VALUES ('110', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 09:31:11');
INSERT INTO `log` VALUES ('111', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 09:35:09');
INSERT INTO `log` VALUES ('112', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 10:13:53');
INSERT INTO `log` VALUES ('113', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 10:14:59');
INSERT INTO `log` VALUES ('114', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 10:19:41');
INSERT INTO `log` VALUES ('115', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 10:24:19');
INSERT INTO `log` VALUES ('116', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 10:30:42');
INSERT INTO `log` VALUES ('117', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 11:07:43');
INSERT INTO `log` VALUES ('118', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 11:10:45');
INSERT INTO `log` VALUES ('119', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 11:15:18');
INSERT INTO `log` VALUES ('120', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 11:26:49');
INSERT INTO `log` VALUES ('121', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 11:57:05');
INSERT INTO `log` VALUES ('122', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 12:41:40');
INSERT INTO `log` VALUES ('123', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 12:46:06');
INSERT INTO `log` VALUES ('124', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 16:12:50');
INSERT INTO `log` VALUES ('125', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 16:27:07');
INSERT INTO `log` VALUES ('126', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 16:28:30');
INSERT INTO `log` VALUES ('127', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 16:43:17');
INSERT INTO `log` VALUES ('128', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 16:52:24');
INSERT INTO `log` VALUES ('129', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 16:57:10');
INSERT INTO `log` VALUES ('130', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 19:44:03');
INSERT INTO `log` VALUES ('131', '用户名为admin的用户登录时输入验证码错误!', '2019-10-12 19:51:41');
INSERT INTO `log` VALUES ('132', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 19:51:51');
INSERT INTO `log` VALUES ('133', '用户名为admin的用户登录时输入验证码错误!', '2019-10-12 19:55:29');
INSERT INTO `log` VALUES ('134', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 19:55:37');
INSERT INTO `log` VALUES ('135', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 19:56:52');
INSERT INTO `log` VALUES ('136', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 20:31:04');
INSERT INTO `log` VALUES ('137', '用户名为admin的用户登录时输入验证码错误!', '2019-10-12 20:39:08');
INSERT INTO `log` VALUES ('138', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 20:39:16');
INSERT INTO `log` VALUES ('139', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 20:43:55');
INSERT INTO `log` VALUES ('140', '用户名为{li}，角色为{普通用户}的用户登录成功!', '2019-10-12 21:38:39');
INSERT INTO `log` VALUES ('141', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 21:47:11');
INSERT INTO `log` VALUES ('142', '用户名为{li}，角色为{普通用户}的用户登录成功!', '2019-10-12 21:48:20');
INSERT INTO `log` VALUES ('143', '用户名为{li}，角色为{普通用户}的用户登录成功!', '2019-10-12 21:49:27');
INSERT INTO `log` VALUES ('144', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-12 22:00:44');
INSERT INTO `log` VALUES ('145', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 20:43:29');
INSERT INTO `log` VALUES ('146', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 20:45:09');
INSERT INTO `log` VALUES ('147', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 20:47:38');
INSERT INTO `log` VALUES ('148', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 20:52:47');
INSERT INTO `log` VALUES ('149', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 20:56:36');
INSERT INTO `log` VALUES ('150', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 21:00:52');
INSERT INTO `log` VALUES ('151', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 21:04:22');
INSERT INTO `log` VALUES ('152', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 21:10:47');
INSERT INTO `log` VALUES ('153', '用户名为admin的用户登录时输入密码错误!', '2019-10-13 21:22:19');
INSERT INTO `log` VALUES ('154', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 21:22:30');
INSERT INTO `log` VALUES ('155', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 21:23:57');
INSERT INTO `log` VALUES ('156', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 21:33:15');
INSERT INTO `log` VALUES ('157', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 21:39:49');
INSERT INTO `log` VALUES ('158', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 21:45:42');
INSERT INTO `log` VALUES ('159', '用户名为admin的用户登录时输入验证码错误!', '2019-10-13 22:07:04');
INSERT INTO `log` VALUES ('160', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 22:07:14');
INSERT INTO `log` VALUES ('161', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 22:09:48');
INSERT INTO `log` VALUES ('162', '用户名为admin的用户登录时输入密码错误!', '2019-10-13 22:25:45');
INSERT INTO `log` VALUES ('163', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 22:25:57');
INSERT INTO `log` VALUES ('164', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 22:29:02');
INSERT INTO `log` VALUES ('165', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 22:45:55');
INSERT INTO `log` VALUES ('166', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 22:48:28');
INSERT INTO `log` VALUES ('167', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 22:55:19');
INSERT INTO `log` VALUES ('168', '用户名为admin的用户登录时输入密码错误!', '2019-10-13 22:58:33');
INSERT INTO `log` VALUES ('169', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 22:58:51');
INSERT INTO `log` VALUES ('170', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 23:03:29');
INSERT INTO `log` VALUES ('171', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 23:09:39');
INSERT INTO `log` VALUES ('172', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 23:11:17');
INSERT INTO `log` VALUES ('173', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 23:14:53');
INSERT INTO `log` VALUES ('174', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 23:18:53');
INSERT INTO `log` VALUES ('175', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-13 23:57:55');
INSERT INTO `log` VALUES ('176', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-14 09:18:37');
INSERT INTO `log` VALUES ('177', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-14 09:25:36');
INSERT INTO `log` VALUES ('178', '用户名为admin的用户登录时输入验证码错误!', '2019-10-14 09:26:22');
INSERT INTO `log` VALUES ('179', '用户名为admin的用户登录时输入验证码错误!', '2019-10-14 09:26:31');
INSERT INTO `log` VALUES ('180', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-14 09:26:39');
INSERT INTO `log` VALUES ('181', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-14 10:08:25');
INSERT INTO `log` VALUES ('182', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-14 10:26:52');
INSERT INTO `log` VALUES ('183', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-14 21:38:57');
INSERT INTO `log` VALUES ('184', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-14 22:17:22');
INSERT INTO `log` VALUES ('185', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-14 22:39:48');
INSERT INTO `log` VALUES ('186', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-14 22:53:17');
INSERT INTO `log` VALUES ('187', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-14 23:30:30');
INSERT INTO `log` VALUES ('188', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 00:03:37');
INSERT INTO `log` VALUES ('189', '用户名为admin的用户登录时输入验证码错误!', '2019-10-15 09:28:28');
INSERT INTO `log` VALUES ('190', '用户名为admin的用户登录时输入验证码错误!', '2019-10-15 09:28:39');
INSERT INTO `log` VALUES ('191', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 09:28:46');
INSERT INTO `log` VALUES ('192', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 09:37:01');
INSERT INTO `log` VALUES ('193', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 10:11:50');
INSERT INTO `log` VALUES ('194', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 10:47:52');
INSERT INTO `log` VALUES ('195', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 11:22:06');
INSERT INTO `log` VALUES ('196', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 12:39:42');
INSERT INTO `log` VALUES ('197', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 12:44:18');
INSERT INTO `log` VALUES ('198', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 12:46:26');
INSERT INTO `log` VALUES ('199', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 12:51:41');
INSERT INTO `log` VALUES ('200', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 12:54:26');
INSERT INTO `log` VALUES ('201', '用户名为admin的用户登录时输入密码错误!', '2019-10-15 15:28:49');
INSERT INTO `log` VALUES ('202', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 15:29:03');
INSERT INTO `log` VALUES ('203', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 15:31:41');
INSERT INTO `log` VALUES ('204', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 15:33:55');
INSERT INTO `log` VALUES ('205', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 15:42:27');
INSERT INTO `log` VALUES ('206', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 15:46:47');
INSERT INTO `log` VALUES ('207', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 15:49:35');
INSERT INTO `log` VALUES ('208', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 16:02:01');
INSERT INTO `log` VALUES ('209', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 19:06:47');
INSERT INTO `log` VALUES ('210', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 19:31:11');
INSERT INTO `log` VALUES ('211', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 20:19:45');
INSERT INTO `log` VALUES ('212', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 21:07:00');
INSERT INTO `log` VALUES ('213', '用户名为admin的用户登录时输入验证码错误!', '2019-10-15 21:09:11');
INSERT INTO `log` VALUES ('214', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 21:09:19');
INSERT INTO `log` VALUES ('215', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 21:13:28');
INSERT INTO `log` VALUES ('216', '用户名为admin的用户登录时输入验证码错误!', '2019-10-15 21:19:57');
INSERT INTO `log` VALUES ('217', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 21:20:03');
INSERT INTO `log` VALUES ('218', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 21:27:51');
INSERT INTO `log` VALUES ('219', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 21:58:24');
INSERT INTO `log` VALUES ('220', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 21:59:43');
INSERT INTO `log` VALUES ('221', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 23:05:16');
INSERT INTO `log` VALUES ('222', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 23:07:35');
INSERT INTO `log` VALUES ('223', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 23:11:28');
INSERT INTO `log` VALUES ('224', '用户名为admin的用户登录时输入验证码错误!', '2019-10-15 23:51:09');
INSERT INTO `log` VALUES ('225', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-15 23:51:18');
INSERT INTO `log` VALUES ('226', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 00:26:53');
INSERT INTO `log` VALUES ('227', '用户名为admin的用户登录时输入验证码错误!', '2019-10-16 00:27:25');
INSERT INTO `log` VALUES ('228', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 00:27:33');
INSERT INTO `log` VALUES ('229', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 00:30:41');
INSERT INTO `log` VALUES ('230', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 08:52:57');
INSERT INTO `log` VALUES ('231', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 08:55:18');
INSERT INTO `log` VALUES ('232', '用户名为admin的用户登录时输入验证码错误!', '2019-10-16 08:57:45');
INSERT INTO `log` VALUES ('233', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 08:57:53');
INSERT INTO `log` VALUES ('234', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 09:00:32');
INSERT INTO `log` VALUES ('235', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 10:20:25');
INSERT INTO `log` VALUES ('236', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 10:27:52');
INSERT INTO `log` VALUES ('237', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 10:51:15');
INSERT INTO `log` VALUES ('238', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 11:05:29');
INSERT INTO `log` VALUES ('239', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 11:07:47');
INSERT INTO `log` VALUES ('240', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 11:16:39');
INSERT INTO `log` VALUES ('241', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 11:24:38');
INSERT INTO `log` VALUES ('242', '登录时，用户名为amdin的用户不存在!', '2019-10-16 12:17:44');
INSERT INTO `log` VALUES ('243', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 12:17:57');
INSERT INTO `log` VALUES ('244', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 12:33:42');
INSERT INTO `log` VALUES ('245', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 13:06:36');
INSERT INTO `log` VALUES ('246', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 13:11:47');
INSERT INTO `log` VALUES ('247', '用户名为admin的用户登录时输入验证码错误!', '2019-10-16 13:43:29');
INSERT INTO `log` VALUES ('248', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 13:43:37');
INSERT INTO `log` VALUES ('249', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 13:51:31');
INSERT INTO `log` VALUES ('250', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 14:34:01');
INSERT INTO `log` VALUES ('251', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 17:22:15');
INSERT INTO `log` VALUES ('252', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 17:25:39');
INSERT INTO `log` VALUES ('253', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 17:28:36');
INSERT INTO `log` VALUES ('254', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 17:31:29');
INSERT INTO `log` VALUES ('255', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 18:19:03');
INSERT INTO `log` VALUES ('256', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 18:39:23');
INSERT INTO `log` VALUES ('257', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 19:02:27');
INSERT INTO `log` VALUES ('258', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 19:46:15');
INSERT INTO `log` VALUES ('259', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 20:03:05');
INSERT INTO `log` VALUES ('260', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 20:19:24');
INSERT INTO `log` VALUES ('261', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 20:21:55');
INSERT INTO `log` VALUES ('262', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 20:29:39');
INSERT INTO `log` VALUES ('263', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 20:31:29');
INSERT INTO `log` VALUES ('264', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 22:24:21');
INSERT INTO `log` VALUES ('265', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 22:44:34');
INSERT INTO `log` VALUES ('266', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 22:57:20');
INSERT INTO `log` VALUES ('267', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-16 23:20:45');
INSERT INTO `log` VALUES ('268', '用户名为admin的用户登录时输入验证码错误!', '2019-10-17 00:03:16');
INSERT INTO `log` VALUES ('269', '用户名为admin的用户登录时输入验证码错误!', '2019-10-17 00:03:23');
INSERT INTO `log` VALUES ('270', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-10-17 00:03:34');

-- ----------------------------
-- Table structure for `material_receive`
-- ----------------------------
DROP TABLE IF EXISTS `material_receive`;
CREATE TABLE `material_receive` (
  `mrc_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `u_id` bigint(32) DEFAULT NULL COMMENT '申领人id',
  `m_email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `useTo` varchar(64) DEFAULT NULL COMMENT '用途',
  `mName` varchar(32) DEFAULT NULL COMMENT '耗材名称',
  `mrc_num` int(4) DEFAULT NULL COMMENT '数量',
  `audit_status` int(4) DEFAULT NULL COMMENT '审核状态',
  `time` date DEFAULT NULL COMMENT '申领时间',
  PRIMARY KEY (`mrc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material_receive
-- ----------------------------
INSERT INTO `material_receive` VALUES ('2', '2', '1366351403@qq.com', '实验课2', '电容', '5', '1', '2019-03-08');
INSERT INTO `material_receive` VALUES ('3', '8', '1366351403@qq.com', '实验课3', '电路板1', '5', '0', '2019-03-05');
INSERT INTO `material_receive` VALUES ('4', '9', '1366351403@qq.com', '实验课4', '开关', '3', '1', '2019-03-13');
INSERT INTO `material_receive` VALUES ('5', '2', '1366351403@qq.com', '实验课1', '晶振', '3', '0', '2019-03-01');
INSERT INTO `material_receive` VALUES ('6', '2', null, '测试耗材', '晶振', '1', '0', null);

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(32) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '系统设置', '', 'icon-advancedsettings');
INSERT INTO `menu` VALUES ('5', '1', '菜单管理', '../admin/menu/list', 'icon-chart-organisation');
INSERT INTO `menu` VALUES ('13', '1', '角色管理', '../admin/role/list', 'icon-group-key');
INSERT INTO `menu` VALUES ('14', '0', '用户管理', '', 'icon-group-gear');
INSERT INTO `menu` VALUES ('15', '14', '用户列表', '../admin/user/list', 'icon-group');
INSERT INTO `menu` VALUES ('17', '5', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('18', '5', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('19', '5', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('20', '5', '添加按钮', 'openAddMenu()', 'icon-add');
INSERT INTO `menu` VALUES ('21', '13', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('22', '13', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('23', '13', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('24', '15', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('25', '15', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('26', '15', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('31', '0', '系统日志', '', 'icon-table-cell');
INSERT INTO `menu` VALUES ('32', '31', '日志列表', '../admin/log/list', 'icon-page-white-text');
INSERT INTO `menu` VALUES ('33', '32', '添加日志', 'openAdd()', 'icon-add1');
INSERT INTO `menu` VALUES ('34', '32', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('35', '1', '修改密码', 'edit_password', 'icon-lock-edit');
INSERT INTO `menu` VALUES ('36', '35', '修改密码', 'openAdd()', 'icon-lock-edit');
INSERT INTO `menu` VALUES ('37', '0', '资源管理', '', 'icon-pictures-thumbs');
INSERT INTO `menu` VALUES ('39', '37', '实验室管理', '../admin/lab/list', 'icon-house');
INSERT INTO `menu` VALUES ('41', '39', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('42', '39', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('43', '39', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('44', '37', '设备管理', '../admin/device/list', 'icon-laptop');
INSERT INTO `menu` VALUES ('45', '44', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('46', '44', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('47', '44', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('50', '14', '学院班级', '../admin/part/list', 'icon-building');
INSERT INTO `menu` VALUES ('52', '31', '资源报表', '../admin/resLog/list', 'icon-application-tile-vertical');
INSERT INTO `menu` VALUES ('53', '52', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('54', '50', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('55', '50', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('56', '50', '删除', 'remove()', 'icon-bullet-cross');
INSERT INTO `menu` VALUES ('58', '0', '借用预约', '', 'icon-page-edit');
INSERT INTO `menu` VALUES ('59', '58', '设备申请管理', '../admin/devOrder/list', 'icon-advancedsettings');
INSERT INTO `menu` VALUES ('60', '58', '我的设备申请', '../admin/devOrder/mylist', 'icon-user');
INSERT INTO `menu` VALUES ('61', '58', '实验室申请管理', '../admin/labOrder/list', 'icon-house');
INSERT INTO `menu` VALUES ('62', '58', '我的实验室申请', '../admin/labOrder/mylist', 'icon-user');
INSERT INTO `menu` VALUES ('63', '59', '同意', 'agree()', 'icon-accept');
INSERT INTO `menu` VALUES ('64', '59', '拒绝', 'disagree()', 'icon-cancel');
INSERT INTO `menu` VALUES ('65', '59', '删除', 'remove()', 'icon-delete3');
INSERT INTO `menu` VALUES ('66', '60', '取消申请', 'cancel()', 'icon-cancel');
INSERT INTO `menu` VALUES ('67', '61', '同意', 'agree()', 'icon-accept');
INSERT INTO `menu` VALUES ('68', '61', '拒绝', 'disagree()', 'icon-cancel');
INSERT INTO `menu` VALUES ('69', '61', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('70', '62', '取消申请', 'cancel()', 'icon-cross');
INSERT INTO `menu` VALUES ('71', '0', '实践教学', '', 'icon-chart-curve');
INSERT INTO `menu` VALUES ('72', '71', '课程安排', '../admin/lesson/list', 'icon-application-view-tile');
INSERT INTO `menu` VALUES ('73', '71', '课程表', '../admin/lesson/findByPid', 'icon-application-view-tile');
INSERT INTO `menu` VALUES ('74', '61', '归还', 'ret()', 'icon-arrow-right');
INSERT INTO `menu` VALUES ('75', '59', '归还', 'ret()', 'icon-arrow-right');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '超级管理员拥有一切权限！');
INSERT INTO `role` VALUES ('2', '普通用户', '普通用户，请自由授权！');
INSERT INTO `role` VALUES ('3', '学生', '学生权限少');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `roleId` int(11) NOT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `sex` int(1) NOT NULL DEFAULT '0',
  `age` int(3) NOT NULL DEFAULT '0',
  `address` varchar(128) DEFAULT NULL,
  `pid` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `pid` (`pid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `lab_part` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '1', '/lab/resources/upload/1570885206394.jpg', '1', '1', '上海市浦东新区浦东南路1835号', '4');
INSERT INTO `user` VALUES ('13', '猿来入此', '123456', '2', '', '1', '24', '猿来入此', '1');
INSERT INTO `user` VALUES ('18', '张三', '123456', '2', '', '1', '1', '', '2');
INSERT INTO `user` VALUES ('19', '李四', '123456', '1', '', '2', '1', '', '3');
INSERT INTO `user` VALUES ('20', 'li', '123', '2', '/lab/resources/upload/1570887028425.jpg', '2', '1', '', '3');
