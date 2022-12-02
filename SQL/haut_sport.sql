/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : haut_sport

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 02/12/2022 00:00:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `b_id` int NOT NULL AUTO_INCREMENT COMMENT '借出id',
  `b_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借用人id',
  `b_eid` int NOT NULL COMMENT '借出器材id',
  `b_num` int NOT NULL COMMENT '借出数量',
  `b_startTime` datetime NOT NULL COMMENT '借出时间',
  `b_endTime` datetime NULL DEFAULT NULL COMMENT '归还时间',
  `b_state` bit(1) NOT NULL COMMENT '归还状态',
  `b_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '借用理由',
  PRIMARY KEY (`b_id`) USING BTREE,
  INDEX `fk_bno_uid`(`b_no`) USING BTREE,
  INDEX `fk_beid_eid`(`b_eid`) USING BTREE,
  CONSTRAINT `fk_beid_eid` FOREIGN KEY (`b_eid`) REFERENCES `equipment` (`e_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bno_uid` FOREIGN KEY (`b_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (1, 'V1001', 2, 3, '2022-11-30 19:33:34', '2022-11-30 19:33:37', b'0', '111');
INSERT INTO `borrow` VALUES (2, 'V1001', 2, 2, '2022-11-30 19:39:56', '2022-11-30 23:09:49', b'1', '1');
INSERT INTO `borrow` VALUES (3, 'V1001', 2, 1, '2022-11-30 23:10:43', NULL, b'0', '有用');

-- ----------------------------
-- Table structure for broadcast
-- ----------------------------
DROP TABLE IF EXISTS `broadcast`;
CREATE TABLE `broadcast`  (
  `b_id` int NOT NULL AUTO_INCREMENT COMMENT '广播id',
  `b_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广播主题',
  `b_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广播内容',
  `b_time` datetime NOT NULL COMMENT '播出时间',
  `b_sportmeetingid` int NOT NULL COMMENT ' 运动会id',
  PRIMARY KEY (`b_id`) USING BTREE,
  INDEX `fk_bsportmeetingid_sid`(`b_sportmeetingid`) USING BTREE,
  CONSTRAINT `fk_bsportmeetingid_sid` FOREIGN KEY (`b_sportmeetingid`) REFERENCES `sportmeeting` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of broadcast
-- ----------------------------
INSERT INTO `broadcast` VALUES (1, '自己的光彩，迎接胜利的喝彩。', '自己的光彩，迎接胜利的喝彩。', '2022-03-22 17:37:19', 2022);
INSERT INTO `broadcast` VALUES (2, '包括许多比赛项目的运动比赛', '只是范围不同。最早的运动会就是古希腊的古代', '2021-03-20 11:59:00', 2021);
INSERT INTO `broadcast` VALUES (3, '包括许多比赛项目的运动比赛', '运动会，只是范', '2021-03-20 11:59:00', 2021);
INSERT INTO `broadcast` VALUES (4, '包括许多比赛项目的运动比赛', '自己的光彩，迎接胜利的喝彩。', '2022-03-20 11:08:52', 2022);
INSERT INTO `broadcast` VALUES (5, '包括许多比赛项目的运动比赛', '自己的光彩，迎接胜利的喝彩。', '2022-03-20 10:52:38', 2022);

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `c_id` int NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `c_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  `c_headmasterid` int NULL DEFAULT NULL COMMENT '班主任id',
  `c_major` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业',
  `c_deptid` int NOT NULL COMMENT '学院id',
  PRIMARY KEY (`c_id`) USING BTREE,
  INDEX `fk_cdeptid_did`(`c_deptid`) USING BTREE,
  INDEX `fk_cheadmasterid_tid`(`c_headmasterid`) USING BTREE,
  CONSTRAINT `fk_cdeptid_did` FOREIGN KEY (`c_deptid`) REFERENCES `department` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cheadmasterid_tid` FOREIGN KEY (`c_headmasterid`) REFERENCES `teacher` (`t_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (1, '软件2001', 1, '软件工程', 1);
INSERT INTO `classes` VALUES (2, '软件2002', 2, '软件工程', 1);
INSERT INTO `classes` VALUES (3, '软件2003', 4, '软件工程', 1);
INSERT INTO `classes` VALUES (4, '软件2004', 3, '软件工程', 1);
INSERT INTO `classes` VALUES (5, '计科2001', 10, '计算机科学与技术', 2);
INSERT INTO `classes` VALUES (6, '计科2002', 5, '计算机科学与技术', 2);
INSERT INTO `classes` VALUES (7, '计科2003', 7, '计算机科学与技术', 2);
INSERT INTO `classes` VALUES (8, '电信2001', 8, '电子信息工程', 2);
INSERT INTO `classes` VALUES (9, '大数据2001', 6, '数据科学与大数据技术', 1);
INSERT INTO `classes` VALUES (10, '人智2001', 11, '人工智能', 1);
INSERT INTO `classes` VALUES (11, '食工2001', 17, '食品科学与工程', 3);
INSERT INTO `classes` VALUES (12, '环工2005', 19, '环境工程', 4);
INSERT INTO `classes` VALUES (13, '环工2006', 15, '环境工程', 4);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `d_id` int NOT NULL AUTO_INCREMENT COMMENT '学院id',
  `d_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院名称',
  `d_deanid` int NULL DEFAULT NULL COMMENT '院长id',
  PRIMARY KEY (`d_id`) USING BTREE,
  INDEX `fk_ddeanid_tid`(`d_deanid`) USING BTREE,
  CONSTRAINT `fk_ddeanid_tid` FOREIGN KEY (`d_deanid`) REFERENCES `teacher` (`t_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '人工智能与大数据学院', 1);
INSERT INTO `department` VALUES (2, '信息科学与工程学院', 2);
INSERT INTO `department` VALUES (3, '粮油食品学院', 3);
INSERT INTO `department` VALUES (4, '环境工程学院', 10);
INSERT INTO `department` VALUES (5, '机电工程学院', 12);
INSERT INTO `department` VALUES (6, '国际教育学院', 17);

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment`  (
  `e_id` int NOT NULL AUTO_INCREMENT COMMENT '器材id',
  `e_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '器材名称',
  `e_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '器材型号',
  `e_place` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '器材放置地点',
  `e_sum` int NOT NULL COMMENT '器材总数',
  `e_buyTime` datetime NULL DEFAULT NULL COMMENT '器材采购时间',
  PRIMARY KEY (`e_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES (1, '网球拍', 'dvap9', '体育馆一楼105', 70, '2022-12-01 23:58:54');
INSERT INTO `equipment` VALUES (2, '篮球', 'frahz', '体育馆一楼101', 720, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (3, '排球', '7putq', '体育馆一楼101', 29, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (4, '乒乓球', '44zqb', '体育馆一楼101', 65, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (5, '乒乓球拍', 'q1cop', '体育馆一楼101', 54, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (6, '排球网', 'evjf6', '体育馆一楼101', 70, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (7, '羽毛球', '7yylz', '体育馆一楼101', 100, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (8, '跳绳', 'yc8ug', '体育馆一楼101', 40, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (9, '羽毛球网', '6dc8x', '体育馆一楼101', 60, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (11, '乒乓球台', 'pxxfe', '体育馆一楼104', 85, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (12, '室内双杠', '8pv5k', '体育馆一楼104', 60, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (13, '室内单杠', 'fw6a3', '体育馆一楼104', 41, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (14, '短剑', 'dj7of', '体育馆一楼104', 75, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (15, '轮滑桩', 'q8f6i', '体育馆一楼104', 81, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (16, '轮滑护具', 'jx1ay', '体育馆一楼104', 50, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (17, '记录仪', 'o4wzl', '体育馆一楼104', 100, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (18, '计时器', 'y85in', '体育馆一楼104', 97, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (19, '口哨', 'a93v7', '体育馆一楼104', 80, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (21, '纪录牌', 'v1iak', '体育馆一楼104', 40, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (22, '瑜伽垫', 'z30wg', '体育馆一楼104', 70, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (23, '游泳浮板', 'ccl27', '体育馆一楼104', 89, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (24, '毽子', 'wwqf2', '体育馆一楼104', 58, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (25, '气枪', 'bt3hf', '体育馆一楼104', 67, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (26, '举重铃50kg', '19zd9', '体育馆一楼104', 57, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (27, '举重铃20kg', 'plul4', '体育馆一楼104', 48, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (28, '哑铃10kg', 'w55rx', '体育馆一楼104', 70, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (29, '女子健身哑铃5kg', 'evyp9', '体育馆一楼104', 66, '2020-01-11 22:46:22');

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `e_id` int NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `e_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `e_place` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目举办地点',
  `e_gender` bit(1) NOT NULL COMMENT '项目性别限制',
  `e_date` datetime NOT NULL COMMENT '项目举办日期',
  `e_startTime` datetime NOT NULL COMMENT '报名开始时间',
  `e_endTime` datetime NOT NULL COMMENT '报名结束时间',
  `e_sportmeetingid` int NOT NULL COMMENT '运动会id',
  `e_rules` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目规则',
  `e_judgementid` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目裁判id',
  `e_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目成绩记录单位',
  PRIMARY KEY (`e_id`) USING BTREE,
  INDEX `fk_esportmeetingid_sid`(`e_sportmeetingid`) USING BTREE,
  INDEX `fk_ejudgementid_uid`(`e_judgementid`) USING BTREE,
  CONSTRAINT `fk_ejudgementid_uid` FOREIGN KEY (`e_judgementid`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_esportmeetingid_sid` FOREIGN KEY (`e_sportmeetingid`) REFERENCES `sportmeeting` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES (1, '男子100米', '体育馆一楼', b'1', '2022-01-11 22:44:57', '2022-01-11 22:44:57', '2022-01-11 22:44:57', 2022, '男子100米', 'J1001', '秒');
INSERT INTO `event` VALUES (2, '女子100米', '体育馆一楼', b'0', '2022-01-11 22:44:57', '2022-01-11 22:44:57', '2022-01-11 22:44:57', 2022, '女子100米', 'J1002', '秒');
INSERT INTO `event` VALUES (3, '男子200米', '体育馆二楼', b'1', '2022-01-11 22:44:57', '2022-01-11 22:44:57', '2022-01-11 22:44:57', 2022, '男子200米', 'J1003', '秒');
INSERT INTO `event` VALUES (5, '100M跑步', '第二田径场', b'1', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2022, '田径场（Track-and-Field Ground [1]  ）', 'J1005', 's');
INSERT INTO `event` VALUES (6, '立定跳远', '第二田径场', b'1', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2022, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1006', 'm');
INSERT INTO `event` VALUES (7, '跳高', '第二田径场', b'1', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2022, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1007', 'm');
INSERT INTO `event` VALUES (8, '1000M长跑', '第二田径场', b'0', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2022, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1008', 's');
INSERT INTO `event` VALUES (9, '100m接力赛', '第二田径场', b'0', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2022, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1009', 's');
INSERT INTO `event` VALUES (10, '射击', '第二田径场', b'1', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2022, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1010', '环');
INSERT INTO `event` VALUES (11, '射击', '第二田径场', b'0', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2022, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1011', '环');
INSERT INTO `event` VALUES (12, '三级跳远', '第二田径场', b'1', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2022, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1012', 'm');
INSERT INTO `event` VALUES (13, '仰卧起坐', '第二田径场', b'1', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2022, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1013', '个');
INSERT INTO `event` VALUES (14, '引体向上', '第二田径场', b'1', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2022, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1014', '个');
INSERT INTO `event` VALUES (15, '100M跑步', '第二田径场', b'1', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2022, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1015', 'm');
INSERT INTO `event` VALUES (16, '立定跳远', '第二田径场', b'1', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2022, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1016', 'm');
INSERT INTO `event` VALUES (17, '跳高', '第二田径场', b'1', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1017', 'm');
INSERT INTO `event` VALUES (18, '1000M长跑', '第二田径场', b'0', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1018', 's');
INSERT INTO `event` VALUES (19, '100m接力赛', '第二田径场', b'0', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1019', 's');
INSERT INTO `event` VALUES (20, '射击', '第二田径场', b'1', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1020', '环');
INSERT INTO `event` VALUES (21, '射击', '第二田径场', b'1', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1021', '环');
INSERT INTO `event` VALUES (22, '三级跳远', '第二田径场', b'1', '2022-04-13 13:14:07', '2022-04-13 13:14:08', '2022-04-13 13:14:09', 2020, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1022', 'm');
INSERT INTO `event` VALUES (23, '仰卧起坐', '第二田径场', b'1', '2022-01-18 15:24:47', '2022-01-18 15:24:47', '2022-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1023', '个');
INSERT INTO `event` VALUES (24, '引体向上2', '第2田径场', b'0', '2022-04-13 13:13:54', '2022-04-13 13:13:56', '2022-04-13 13:13:57', 2020, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', 'J1024', '个');

-- ----------------------------
-- Table structure for judge
-- ----------------------------
DROP TABLE IF EXISTS `judge`;
CREATE TABLE `judge`  (
  `j_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `j_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '裁判号',
  `j_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `j_gender` bit(1) NOT NULL DEFAULT b'1' COMMENT '性别',
  `j_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `j_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `j_IDcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`j_id`) USING BTREE,
  INDEX `j_no`(`j_no`) USING BTREE,
  CONSTRAINT `fk_jno_uid` FOREIGN KEY (`j_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of judge
-- ----------------------------
INSERT INTO `judge` VALUES (1, 'J1001', '荣瑶翠', b'0', '13404428674', '3yczovnmq@ask.com', '62061519');
INSERT INTO `judge` VALUES (2, 'J1002', '司楠', b'1', '13306986310', 'fl73q6@gmail.com', '610403198107056882');
INSERT INTO `judge` VALUES (3, 'J1003', '后元先', b'0', '13804720259', '2bh7l8@sina.com', '451325199205313721');
INSERT INTO `judge` VALUES (4, 'J1004', '丘振峰', b'1', '15904144313', '6nduvw9ee3@gmail.com', '140814198012079519');
INSERT INTO `judge` VALUES (5, 'J1005', '胥香婉', b'0', '13105904900', 'yjigg@ask.com', '340123197811023957');
INSERT INTO `judge` VALUES (6, 'J1006', '公鸣利', b'0', '13308701067', 'qdcix@126.com', '650718197105228438');
INSERT INTO `judge` VALUES (7, 'J1007', '公泰', b'0', '13101555053', 'lm7mvu9q@163.net', '410727198608061536');
INSERT INTO `judge` VALUES (8, 'J1008', '古榕', b'0', '15200736021', 'hl7ikv@yahoo.com', '810102199601216458');
INSERT INTO `judge` VALUES (9, 'J1009', '能彬永', b'0', '15102906965', '6in4ggkd16@msn.com', '331405199801213132');
INSERT INTO `judge` VALUES (10, 'J1010', '岳彩娥', b'1', '15107393110', 'zexrqq@163.com', '370310199904023652');
INSERT INTO `judge` VALUES (11, 'J1011', '钱翠', b'0', '15307729033', 'bx8297e@live.com', '311426197609175971');
INSERT INTO `judge` VALUES (12, 'J1012', '荣海', b'0', '13103219082', '8pcpt@yahoo.com', '420604198312038857');
INSERT INTO `judge` VALUES (13, 'J1013', '管梅香', b'1', '13007747666', 'n0pvh@3721.net', '630505199901202036');
INSERT INTO `judge` VALUES (14, 'J1014', '严豪', b'1', '13706623695', 'wp4f3@0355.net', '211415199001056037');
INSERT INTO `judge` VALUES (15, 'J1015', '马婕娴', b'0', '13904794478', '1btnaef4c@126.com', '610913199312295777');
INSERT INTO `judge` VALUES (16, 'J1016', '邬哲勇', b'1', '13605434568', 'nm7ity7kdt@yahoo.com.cn', '640901197103122151');
INSERT INTO `judge` VALUES (17, 'J1017', '余昭莎', b'0', '13008870257', 'b5sp81@live.com', '231817198201044129');
INSERT INTO `judge` VALUES (18, 'J1018', '卫贵顺', b'0', '13007991753', 'aeerpbev@hotmail.com', '520522198606293016');
INSERT INTO `judge` VALUES (19, 'J1019', '爱鸣坚', b'0', '13607783440', '2qzfleb19@live.com', '620422198708146784');
INSERT INTO `judge` VALUES (20, 'J1020', '广龙', b'1', '13503357316', '86ka98yhb9@gmail.com', '411812197109155475');
INSERT INTO `judge` VALUES (21, 'J1021', '邓慧梅', b'1', '13402562598', 'kh950fu7t@0355.net', '150728198807101139');
INSERT INTO `judge` VALUES (22, 'J1022', '贝风', b'1', '13005925226', '7xzp5@0355.net', '110428199602204721');
INSERT INTO `judge` VALUES (23, 'J1023', '阙蓓', b'0', '13902655423', 'xj0dhhvowy@googlemail.com', '631701199304179704');
INSERT INTO `judge` VALUES (24, 'J1024', '宫舒莺', b'0', '15306118019', 'p5ezb@163.net', '641618199212135947');
INSERT INTO `judge` VALUES (25, 'J1025', '充思琳', b'1', '13805012982', 'r6qd37@gmail.com', '631504197312266183');
INSERT INTO `judge` VALUES (26, 'J1026', '离璧', b'0', '15905986216', 'x0wsm@0355.net', '421506197611073754');
INSERT INTO `judge` VALUES (27, 'J1027', '简晨轮', b'1', '13800220763', 'he7cj@0355.net', '121124198104179856');
INSERT INTO `judge` VALUES (28, 'J1028', '离勇', b'0', '15503637480', 'k258skd@gmail.com', '230104199202287576');
INSERT INTO `judge` VALUES (29, 'J1029', '郗生兴', b'0', '15804058095', 'hggws25ac@163.net', '630705198109158233');

-- ----------------------------
-- Table structure for matches
-- ----------------------------
DROP TABLE IF EXISTS `matches`;
CREATE TABLE `matches`  (
  `m_id` int NOT NULL AUTO_INCREMENT COMMENT '赛事id',
  `m_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参赛人id',
  `m_eid` int NOT NULL COMMENT '参赛项目',
  `m_sort` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '将参赛人分组分道',
  `m_score` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '赛事成绩',
  `m_rank` int NULL DEFAULT NULL COMMENT '成绩排名',
  PRIMARY KEY (`m_id`) USING BTREE,
  INDEX `fk_mno_uid`(`m_no`) USING BTREE,
  INDEX `fk_meid_eid`(`m_eid`) USING BTREE,
  CONSTRAINT `fk_meid_eid` FOREIGN KEY (`m_eid`) REFERENCES `event` (`e_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mno_uid` FOREIGN KEY (`m_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of matches
-- ----------------------------
INSERT INTO `matches` VALUES (1, 'stu', 1, '第2场', NULL, NULL);
INSERT INTO `matches` VALUES (2, 'stu', 2, '第一场', NULL, NULL);
INSERT INTO `matches` VALUES (3, '201624131202', 5, '第一道', '10', 1);
INSERT INTO `matches` VALUES (4, '201624131203', 5, '第二道', '11', 2);
INSERT INTO `matches` VALUES (5, '201624131204', 6, 'A组', NULL, NULL);
INSERT INTO `matches` VALUES (6, '201624131208', 7, 'B组', NULL, NULL);
INSERT INTO `matches` VALUES (7, '201624131209', 10, '第一道', NULL, NULL);
INSERT INTO `matches` VALUES (8, '201624131207', 17, 'B组', NULL, NULL);
INSERT INTO `matches` VALUES (9, '201624131210', 18, '第三道', NULL, NULL);
INSERT INTO `matches` VALUES (10, '201624131211', 19, '第四道', NULL, NULL);
INSERT INTO `matches` VALUES (11, '201624131212', 5, '第三道', '12', 3);
INSERT INTO `matches` VALUES (12, '201624131213', 6, 'B组', NULL, NULL);
INSERT INTO `matches` VALUES (13, '201624131214', 18, '第六道', NULL, NULL);
INSERT INTO `matches` VALUES (14, '201624131215', 10, '第二道', NULL, NULL);
INSERT INTO `matches` VALUES (15, '201624131216', 19, '第二道', NULL, NULL);
INSERT INTO `matches` VALUES (16, '201624131217', 7, 'A组', NULL, NULL);
INSERT INTO `matches` VALUES (17, '201624131218', 17, 'C组', NULL, NULL);
INSERT INTO `matches` VALUES (18, '201624131219', 18, '第一道', NULL, NULL);
INSERT INTO `matches` VALUES (19, '202013040507', 6, 'A组', NULL, NULL);
INSERT INTO `matches` VALUES (20, '202013040507', 3, '第一道', NULL, NULL);
INSERT INTO `matches` VALUES (21, '201624131220', 3, '第二道', NULL, NULL);
INSERT INTO `matches` VALUES (22, '201624131221', 3, '第三道', NULL, NULL);
INSERT INTO `matches` VALUES (23, '202013040507', 10, 'D组', NULL, NULL);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `m_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `m_sno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生ID',
  `m_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `m_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `m_time` datetime NOT NULL COMMENT '发布时间',
  `m_sender` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送者',
  `status` int NOT NULL COMMENT '消息状态',
  PRIMARY KEY (`m_id`) USING BTREE,
  INDEX `m_sender`(`m_sender`) USING BTREE,
  CONSTRAINT `fk_m_sender` FOREIGN KEY (`m_sender`) REFERENCES `volunteer` (`v_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, 'stu', '标题2', '内容1', '2022-11-30 17:46:07', 'V1001', 0);
INSERT INTO `message` VALUES (2, '202013040507', '他', '他病了', '2022-11-30 23:10:24', 'V1001', 0);

-- ----------------------------
-- Table structure for other
-- ----------------------------
DROP TABLE IF EXISTS `other`;
CREATE TABLE `other`  (
  `o_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `o_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '其他用户标识号',
  `o_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '其他用户名',
  PRIMARY KEY (`o_id`) USING BTREE,
  INDEX `fk_ono_uid`(`o_no`) USING BTREE,
  CONSTRAINT `fk_ono_uid` FOREIGN KEY (`o_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of other
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `r_id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `r_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `r_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'STUDENT', '学生');
INSERT INTO `role` VALUES (2, 'ADMIN', '管理员');
INSERT INTO `role` VALUES (3, 'JUDGE', '裁判');
INSERT INTO `role` VALUES (4, 'VOLUNTEER', '志愿者');
INSERT INTO `role` VALUES (5, 'TEACHER', '教师');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user`  (
  `r_id` int NOT NULL,
  `u_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`r_id`, `u_id`) USING BTREE,
  INDEX `fk_uid`(`u_id`) USING BTREE,
  CONSTRAINT `fk_rid2` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_uid` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES (5, '10100011');
INSERT INTO `role_user` VALUES (5, '10100012');
INSERT INTO `role_user` VALUES (5, '10100013');
INSERT INTO `role_user` VALUES (5, '10100014');
INSERT INTO `role_user` VALUES (5, '10100015');
INSERT INTO `role_user` VALUES (5, '10100016');
INSERT INTO `role_user` VALUES (5, '10100017');
INSERT INTO `role_user` VALUES (5, '10100018');
INSERT INTO `role_user` VALUES (5, '10100019');
INSERT INTO `role_user` VALUES (5, '10100020');
INSERT INTO `role_user` VALUES (5, '10100021');
INSERT INTO `role_user` VALUES (5, '10100022');
INSERT INTO `role_user` VALUES (5, '10100023');
INSERT INTO `role_user` VALUES (5, '10100024');
INSERT INTO `role_user` VALUES (5, '10100025');
INSERT INTO `role_user` VALUES (5, '10100026');
INSERT INTO `role_user` VALUES (5, '10100027');
INSERT INTO `role_user` VALUES (5, '10100028');
INSERT INTO `role_user` VALUES (5, '10100029');
INSERT INTO `role_user` VALUES (5, '10100030');
INSERT INTO `role_user` VALUES (1, '123456');
INSERT INTO `role_user` VALUES (1, '201624131202');
INSERT INTO `role_user` VALUES (1, '201624131203');
INSERT INTO `role_user` VALUES (1, '201624131204');
INSERT INTO `role_user` VALUES (1, '201624131207');
INSERT INTO `role_user` VALUES (1, '201624131208');
INSERT INTO `role_user` VALUES (1, '201624131209');
INSERT INTO `role_user` VALUES (1, '201624131210');
INSERT INTO `role_user` VALUES (1, '201624131211');
INSERT INTO `role_user` VALUES (1, '201624131212');
INSERT INTO `role_user` VALUES (1, '201624131213');
INSERT INTO `role_user` VALUES (1, '201624131214');
INSERT INTO `role_user` VALUES (1, '201624131215');
INSERT INTO `role_user` VALUES (1, '201624131216');
INSERT INTO `role_user` VALUES (1, '201624131217');
INSERT INTO `role_user` VALUES (1, '201624131218');
INSERT INTO `role_user` VALUES (1, '201624131219');
INSERT INTO `role_user` VALUES (1, '201624131220');
INSERT INTO `role_user` VALUES (2, '201624131220');
INSERT INTO `role_user` VALUES (1, '201624131221');
INSERT INTO `role_user` VALUES (1, '201624131222');
INSERT INTO `role_user` VALUES (1, '201624131223');
INSERT INTO `role_user` VALUES (1, '201624131224');
INSERT INTO `role_user` VALUES (1, '201624131225');
INSERT INTO `role_user` VALUES (1, '201624131226');
INSERT INTO `role_user` VALUES (1, '201624131227');
INSERT INTO `role_user` VALUES (1, '201624131228');
INSERT INTO `role_user` VALUES (1, '201624131229');
INSERT INTO `role_user` VALUES (1, '201624131230');
INSERT INTO `role_user` VALUES (1, '201624131231');
INSERT INTO `role_user` VALUES (1, '201624131232');
INSERT INTO `role_user` VALUES (1, '201624131233');
INSERT INTO `role_user` VALUES (1, '201624131234');
INSERT INTO `role_user` VALUES (1, '201624131235');
INSERT INTO `role_user` VALUES (1, '201624131236');
INSERT INTO `role_user` VALUES (1, '201624131237');
INSERT INTO `role_user` VALUES (1, '201624131238');
INSERT INTO `role_user` VALUES (1, '201624131239');
INSERT INTO `role_user` VALUES (1, '201624131240');
INSERT INTO `role_user` VALUES (1, '201624131241');
INSERT INTO `role_user` VALUES (1, '201624131242');
INSERT INTO `role_user` VALUES (1, '201624131243');
INSERT INTO `role_user` VALUES (1, '201624131244');
INSERT INTO `role_user` VALUES (1, '201624131245');
INSERT INTO `role_user` VALUES (1, '201624131246');
INSERT INTO `role_user` VALUES (1, '201624131247');
INSERT INTO `role_user` VALUES (1, '201624131248');
INSERT INTO `role_user` VALUES (1, '201624131249');
INSERT INTO `role_user` VALUES (1, '201624131250');
INSERT INTO `role_user` VALUES (1, '201624131251');
INSERT INTO `role_user` VALUES (1, '201624131252');
INSERT INTO `role_user` VALUES (1, '201624131253');
INSERT INTO `role_user` VALUES (1, '201624131254');
INSERT INTO `role_user` VALUES (1, '201624131255');
INSERT INTO `role_user` VALUES (1, '201624131256');
INSERT INTO `role_user` VALUES (1, '201624131257');
INSERT INTO `role_user` VALUES (1, '201624131258');
INSERT INTO `role_user` VALUES (1, '201624131259');
INSERT INTO `role_user` VALUES (1, '201624131260');
INSERT INTO `role_user` VALUES (1, '201624131261');
INSERT INTO `role_user` VALUES (1, '201624131262');
INSERT INTO `role_user` VALUES (1, '201624131263');
INSERT INTO `role_user` VALUES (1, '201624131264');
INSERT INTO `role_user` VALUES (1, '201624131265');
INSERT INTO `role_user` VALUES (1, '201624131266');
INSERT INTO `role_user` VALUES (1, '201624131267');
INSERT INTO `role_user` VALUES (1, '201624131268');
INSERT INTO `role_user` VALUES (1, '201624131269');
INSERT INTO `role_user` VALUES (1, '201624131270');
INSERT INTO `role_user` VALUES (1, '202013040507');
INSERT INTO `role_user` VALUES (1, '202013040508');
INSERT INTO `role_user` VALUES (2, 'admin');
INSERT INTO `role_user` VALUES (3, 'J1001');
INSERT INTO `role_user` VALUES (3, 'J1002');
INSERT INTO `role_user` VALUES (3, 'J1003');
INSERT INTO `role_user` VALUES (3, 'J1004');
INSERT INTO `role_user` VALUES (3, 'J1005');
INSERT INTO `role_user` VALUES (3, 'J1006');
INSERT INTO `role_user` VALUES (3, 'J1007');
INSERT INTO `role_user` VALUES (3, 'J1008');
INSERT INTO `role_user` VALUES (3, 'J1009');
INSERT INTO `role_user` VALUES (3, 'J1010');
INSERT INTO `role_user` VALUES (3, 'J1011');
INSERT INTO `role_user` VALUES (3, 'J1012');
INSERT INTO `role_user` VALUES (3, 'J1013');
INSERT INTO `role_user` VALUES (3, 'J1014');
INSERT INTO `role_user` VALUES (3, 'J1015');
INSERT INTO `role_user` VALUES (3, 'J1016');
INSERT INTO `role_user` VALUES (3, 'J1017');
INSERT INTO `role_user` VALUES (3, 'J1018');
INSERT INTO `role_user` VALUES (3, 'J1019');
INSERT INTO `role_user` VALUES (3, 'J1020');
INSERT INTO `role_user` VALUES (3, 'J1021');
INSERT INTO `role_user` VALUES (3, 'J1022');
INSERT INTO `role_user` VALUES (3, 'J1023');
INSERT INTO `role_user` VALUES (3, 'J1024');
INSERT INTO `role_user` VALUES (3, 'J1025');
INSERT INTO `role_user` VALUES (3, 'J1026');
INSERT INTO `role_user` VALUES (3, 'J1027');
INSERT INTO `role_user` VALUES (3, 'J1028');
INSERT INTO `role_user` VALUES (3, 'J1029');
INSERT INTO `role_user` VALUES (1, 'stu');
INSERT INTO `role_user` VALUES (1, 'Test');
INSERT INTO `role_user` VALUES (4, 'V1001');
INSERT INTO `role_user` VALUES (4, 'V1002');
INSERT INTO `role_user` VALUES (4, 'V1003');
INSERT INTO `role_user` VALUES (4, 'V1004');
INSERT INTO `role_user` VALUES (4, 'V1005');
INSERT INTO `role_user` VALUES (4, 'V1006');
INSERT INTO `role_user` VALUES (4, 'V1007');
INSERT INTO `role_user` VALUES (4, 'V1008');
INSERT INTO `role_user` VALUES (4, 'V1009');
INSERT INTO `role_user` VALUES (4, 'V1010');
INSERT INTO `role_user` VALUES (4, 'V1011');
INSERT INTO `role_user` VALUES (4, 'V1012');
INSERT INTO `role_user` VALUES (4, 'V1013');
INSERT INTO `role_user` VALUES (4, 'V1014');
INSERT INTO `role_user` VALUES (4, 'V1015');
INSERT INTO `role_user` VALUES (4, 'V1016');
INSERT INTO `role_user` VALUES (4, 'V1017');
INSERT INTO `role_user` VALUES (4, 'V1018');
INSERT INTO `role_user` VALUES (4, 'V1019');
INSERT INTO `role_user` VALUES (4, 'V1020');
INSERT INTO `role_user` VALUES (4, 'V1021');
INSERT INTO `role_user` VALUES (4, 'V1022');
INSERT INTO `role_user` VALUES (4, 'V1023');
INSERT INTO `role_user` VALUES (4, 'V1024');
INSERT INTO `role_user` VALUES (4, 'V1025');
INSERT INTO `role_user` VALUES (4, 'V1026');
INSERT INTO `role_user` VALUES (4, 'V1027');
INSERT INTO `role_user` VALUES (4, 'V1028');
INSERT INTO `role_user` VALUES (4, 'V1029');
INSERT INTO `role_user` VALUES (4, 'V1030');

-- ----------------------------
-- Table structure for sportmeeting
-- ----------------------------
DROP TABLE IF EXISTS `sportmeeting`;
CREATE TABLE `sportmeeting`  (
  `s_id` int NOT NULL COMMENT '运动会id',
  `s_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运动会名称',
  `s_theme` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运动会主题',
  `s_place` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举办地点',
  `s_date` datetime NOT NULL COMMENT '举办时间',
  `s_startTime` datetime NOT NULL COMMENT '开始时间',
  `s_endTime` datetime NOT NULL COMMENT '结束时间',
  `s_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `s_status` bit(1) NOT NULL COMMENT '开启关闭',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sportmeeting
-- ----------------------------
INSERT INTO `sportmeeting` VALUES (2019, '第八届运动会', '运动运动', '第一田径场', '2019-01-24 12:15:00', '2019-01-24 12:15:00', '2019-01-24 12:15:00', '运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。', b'0');
INSERT INTO `sportmeeting` VALUES (2020, '第九届运动会', '赛出成绩，赛出精彩', '第二田径场', '2020-01-11 00:09:00', '2020-01-11 00:09:00', '2020-01-15 00:09:00', '运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。', b'0');
INSERT INTO `sportmeeting` VALUES (2021, '第十届运动会', '放飞自我，飞得更高', '第一田径场', '2021-01-11 00:09:00', '2021-01-11 00:09:00', '2021-01-15 00:09:00', '无运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。', b'0');
INSERT INTO `sportmeeting` VALUES (2022, '第十一届运动会', '运动快乐', '体育馆', '2022-04-13 09:31:26', '2022-04-13 09:31:31', '2022-04-13 09:31:32', '运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。', b'1');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `s_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `s_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `s_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `s_gender` bit(1) NOT NULL DEFAULT b'1' COMMENT '性别',
  `s_classid` int NOT NULL DEFAULT 0 COMMENT '班级号',
  `s_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `s_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `s_IDcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`s_id`) USING BTREE,
  INDEX `s_no`(`s_no`) USING BTREE,
  INDEX `fk_sclassid_cid`(`s_classid`) USING BTREE,
  CONSTRAINT `fk_sno_uid` FOREIGN KEY (`s_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'stu', '王培栋', b'1', 12, '1101', '1612702983@qq.com', '123');
INSERT INTO `student` VALUES (2, '201624131202', '司楠', b'1', 1, '13306986310', 'fl73q6@gmail.com', '610403198107056882');
INSERT INTO `student` VALUES (3, '201624131203', '后元先', b'0', 2, '13804720259', '2bh7l8@sina.com', '451325199205313721');
INSERT INTO `student` VALUES (4, '201624131204', '丘振峰', b'1', 3, '15904144313', '6nduvw9ee3@gmail.com', '140814198012079519');
INSERT INTO `student` VALUES (5, '202013040507', '李元昊', b'1', 2, '17513212776', 'liyuanhaovip@163.com', '123');
INSERT INTO `student` VALUES (6, '202013040508', '孙宁', b'1', 12, '17513212777', 'liyuanhaovip@163.com', '154189498181');
INSERT INTO `student` VALUES (7, '201624131207', '公泰', b'0', 4, '13101555053', 'lm7mvu9q@163.net', '410727198608061536');
INSERT INTO `student` VALUES (8, '201624131208', '古榕', b'0', 5, '15200736021', 'hl7ikv@yahoo.com', '810102199601216458');
INSERT INTO `student` VALUES (9, '201624131209', '能彬永', b'0', 6, '15102906965', '6in4ggkd16@msn.com', '331405199801213132');
INSERT INTO `student` VALUES (10, '201624131210', '岳彩娥', b'1', 7, '15107393110', 'zexrqq@163.com', '370310199904023652');
INSERT INTO `student` VALUES (11, '201624131211', '钱翠', b'0', 8, '15307729033', 'bx8297e@live.com', '311426197609175971');
INSERT INTO `student` VALUES (12, '201624131212', '荣海', b'0', 9, '13103219082', '8pcpt@yahoo.com', '420604198312038857');
INSERT INTO `student` VALUES (13, '201624131213', '管梅香', b'1', 10, '13007747666', 'n0pvh@3721.net', '630505199901202036');
INSERT INTO `student` VALUES (14, '201624131214', '严豪', b'1', 11, '13706623695', 'wp4f3@0355.net', '211415199001056037');
INSERT INTO `student` VALUES (15, '201624131215', '马婕娴', b'0', 12, '13904794478', '1btnaef4c@126.com', '610913199312295777');
INSERT INTO `student` VALUES (16, '201624131216', '邬哲勇', b'1', 13, '13605434568', 'nm7ity7kdt@yahoo.com.cn', '640901197103122151');
INSERT INTO `student` VALUES (17, '201624131217', '余昭莎', b'0', 1, '13008870257', 'b5sp81@live.com', '231817198201044129');
INSERT INTO `student` VALUES (18, '201624131218', '卫贵顺', b'0', 2, '13007991753', 'aeerpbev@hotmail.com', '520522198606293016');
INSERT INTO `student` VALUES (19, '201624131219', '爱鸣坚', b'0', 3, '13607783440', '2qzfleb19@live.com', '620422198708146784');
INSERT INTO `student` VALUES (20, '201624131220', '广龙', b'1', 4, '13503357316', '86ka98yhb9@gmail.com', '411812197109155475');
INSERT INTO `student` VALUES (21, '201624131221', '邓慧梅', b'1', 6, '13402562598', 'kh950fu7t@0355.net', '150728198807101139');
INSERT INTO `student` VALUES (22, '201624131222', '贝风', b'1', 5, '13005925226', '7xzp5@0355.net', '110428199602204721');
INSERT INTO `student` VALUES (23, '201624131223', '阙蓓', b'0', 7, '13902655423', 'xj0dhhvowy@googlemail.com', '631701199304179704');
INSERT INTO `student` VALUES (24, '201624131224', '宫舒莺', b'0', 8, '15306118019', 'p5ezb@163.net', '641618199212135947');
INSERT INTO `student` VALUES (25, '201624131225', '充思琳', b'1', 9, '13805012982', 'r6qd37@gmail.com', '631504197312266183');
INSERT INTO `student` VALUES (26, '201624131226', '离璧', b'0', 10, '15905986216', 'x0wsm@0355.net', '421506197611073754');
INSERT INTO `student` VALUES (27, '201624131227', '简晨轮', b'1', 11, '13800220763', 'he7cj@0355.net', '121124198104179856');
INSERT INTO `student` VALUES (28, '201624131228', '离勇', b'0', 12, '15503637480', 'k258skd@gmail.com', '230104199202287576');
INSERT INTO `student` VALUES (29, '201624131229', '郗生兴', b'0', 13, '15804058095', 'hggws25ac@163.net', '630705198109158233');
INSERT INTO `student` VALUES (30, '201624131230', '汤婷飘', b'0', 1, '15600071170', 'b7ize69u@ask.com', '511616198602183563');
INSERT INTO `student` VALUES (31, '201624131231', '司青', b'1', 2, '13505004427', '7nmmxq@yahoo.com', '630222198205135030');
INSERT INTO `student` VALUES (32, '201624131232', '雍安轮', b'0', 3, '13405345571', 'mqze0@163.com', '151409197502127793');
INSERT INTO `student` VALUES (33, '201624131233', '谷航壮', b'1', 4, '13503115948', '7zwg5fz@googlemail.com', '440315198701123047');
INSERT INTO `student` VALUES (34, '201624131234', '温巧纨', b'1', 5, '15908589088', '9uph83chs7@msn.com', '810324198301114402');
INSERT INTO `student` VALUES (35, '201624131235', '卫馨', b'0', 6, '13908887540', '40x579e@sina.com', '110802199104115139');
INSERT INTO `student` VALUES (36, '201624131236', '居若', b'0', 7, '13002568617', 's461lp@sohu.com', '650619198304104735');
INSERT INTO `student` VALUES (37, '201624131237', '焦菲婕', b'0', 8, '15303843581', 'vcpnd01@163.com', '520521198705149471');
INSERT INTO `student` VALUES (38, '201624131238', '范顺', b'0', 9, '15608513305', 'f0eq3botz0@yahoo.com.cn', '211522199511221432');
INSERT INTO `student` VALUES (39, '201624131239', '弘宁乐', b'0', 10, '13601033028', 'rymodtnicb@126.com', '440116198610037204');
INSERT INTO `student` VALUES (40, '201624131240', '甫辰清', b'1', 11, '13403500070', 'llrrsr@yeah.net', '210404197404191272');
INSERT INTO `student` VALUES (41, '201624131241', '东平士', b'0', 12, '15500170443', '03mt2uhi6@ask.com', '641322197302123543');
INSERT INTO `student` VALUES (42, '201624131242', '胥菲', b'0', 13, '15102518460', 'n34hs@ask.com', '621328198904123015');
INSERT INTO `student` VALUES (43, '201624131243', '佟宜珍', b'1', 1, '13606958295', 'mt23zoeo@126.com', '610123197212066055');
INSERT INTO `student` VALUES (44, '201624131244', '元荔娅', b'0', 2, '15204122381', 'fp6bt@live.com', '110607197004259542');
INSERT INTO `student` VALUES (45, '201624131245', '花先安', b'0', 3, '13308760684', 'fz09fp4o@yeah.net', '350318198308211708');
INSERT INTO `student` VALUES (46, '201624131246', '曾冰凝', b'1', 4, '15704641813', 'culyhkqy@gmail.com', '810710199811116945');
INSERT INTO `student` VALUES (47, '201624131247', '濮玲媛', b'0', 5, '13605123229', '1xdod@msn.com', '530816199912271519');
INSERT INTO `student` VALUES (48, '201624131248', '方保彬', b'1', 6, '13404612621', '44jw4e@yahoo.com', '361208199805189207');
INSERT INTO `student` VALUES (49, '201624131249', '臧刚', b'1', 7, '13802388312', 'z56ad8r4b7@163.net', '410823198611238777');
INSERT INTO `student` VALUES (50, '201624131250', '亓秋秋', b'0', 8, '13404730017', 'ms7a3v88@sina.com', '510924198004144536');
INSERT INTO `student` VALUES (51, '201624131251', '田世', b'0', 9, '13502805767', 'r7y0ry8@sohu.com', '460722197310274613');
INSERT INTO `student` VALUES (52, '201624131252', '年洁', b'0', 10, '15207934210', 'ob7cu8mfat@sina.com', '150106198807231094');
INSERT INTO `student` VALUES (53, '201624131253', '房馥', b'1', 11, '13804683509', 'r44p9ayy@aol.com', '520205197709148496');
INSERT INTO `student` VALUES (54, '201624131254', '邱怡', b'1', 12, '13400988194', 'qih7s@gmail.com', '231609197107234488');
INSERT INTO `student` VALUES (55, '201624131255', '江学晨', b'0', 13, '13606356198', 'x4iejg0jn@163.net', '630219197105191768');
INSERT INTO `student` VALUES (56, '201624131256', '闵舒', b'1', 1, '15906592531', 'ptf7ivq9@sina.com', '221224197907226936');
INSERT INTO `student` VALUES (57, '201624131257', '续婉玲', b'0', 2, '13506136893', 'bho0r1a@yeah.net', '710617199309225817');
INSERT INTO `student` VALUES (58, '201624131258', '屠杰进', b'1', 3, '15505054415', '0455p84koh@qq.com', '370704197208047752');
INSERT INTO `student` VALUES (59, '201624131259', '尚玲莉', b'0', 4, '15107413534', '05wjn7zu@qq.com', '521809197011258852');
INSERT INTO `student` VALUES (60, '201624131260', '加岚娥', b'0', 5, '13604203429', 'oiny3fuvj@googlemail.com', '321810198008084351');
INSERT INTO `student` VALUES (61, '201624131261', '孙馨', b'1', 6, '15804312690', 'tinvr6x0@263.net', '321706198001067063');
INSERT INTO `student` VALUES (62, '201624131262', '庄博致', b'0', 7, '15000901504', 'btsm5ff@sina.com', '521321197601313139');
INSERT INTO `student` VALUES (63, '201624131263', '华菲', b'1', 8, '13804485662', '72pye9d@3721.net', '151617199704243897');
INSERT INTO `student` VALUES (64, '201624131264', '花健', b'0', 9, '15202521743', '39xla@ask.com', '350111199603215243');
INSERT INTO `student` VALUES (65, '201624131265', '秦霭宜', b'1', 10, '15600643331', '9hmqlx9c@msn.com', '431015199405131719');
INSERT INTO `student` VALUES (66, '201624131266', '壤怡舒', b'0', 11, '15801008814', '04swmx1j@263.net', '130503200001039935');
INSERT INTO `student` VALUES (67, '201624131267', '支振', b'0', 12, '15101924747', '6b0noxh8iz@sohu.com', '510723199210309627');
INSERT INTO `student` VALUES (68, '201624131268', '邓融', b'0', 13, '15107598585', 'bo26f8k@msn.com', '640314197312226238');
INSERT INTO `student` VALUES (69, '201624131269', '伍君昭', b'0', 1, '13403080237', 'v7pk5g@126.com', '211527197210218209');
INSERT INTO `student` VALUES (70, '201624131270', '平若壮', b'1', 2, '13600344340', 'vhhom@live.com', '621522199101025381');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `visitTime` datetime NULL DEFAULT NULL,
  `executionTime` int NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syslog
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `t_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `t_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教工号',
  `t_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `t_gender` bit(1) NOT NULL DEFAULT b'1' COMMENT '性别',
  `t_identity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份',
  `t_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `t_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `t_IDcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `t_no`(`t_no`) USING BTREE,
  CONSTRAINT `fk_tno_uid` FOREIGN KEY (`t_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '10100011', '郑美', b'0', '讲师', '13302614725', 'h8q2wo@yahoo.com', '540921199206293486');
INSERT INTO `teacher` VALUES (2, '10100012', '潘雁', b'1', '讲师', '15006885772', 'sr0t9f3j@3721.net', '810506199504029444');
INSERT INTO `teacher` VALUES (3, '10100013', '权泰', b'0', '讲师', '15901612222', 'b7a0lf7wl@sohu.com', '531501199004108027');
INSERT INTO `teacher` VALUES (4, '10100014', '乌希', b'0', '讲师', '13708496761', 'ccur1ou8h@3721.net', '510201198404098468');
INSERT INTO `teacher` VALUES (5, '10100015', '屠滢洁', b'0', '讲师', '15603007632', '1qbfd01@3721.net', '531306198803123766');
INSERT INTO `teacher` VALUES (6, '10100016', '厍策', b'1', '讲师', '15006772889', 'hcow4aqq@yeah.net', '331201197812205830');
INSERT INTO `teacher` VALUES (7, '10100017', '方静', b'1', '讲师', '13608822660', 'iday4x@live.com', '500202198103315324');
INSERT INTO `teacher` VALUES (8, '10100018', '南敬鸣', b'1', '讲师', '15602628536', 'tixoepiv@live.com', '711023198405091664');
INSERT INTO `teacher` VALUES (9, '10100019', '钦柔秀', b'0', '讲师', '13103451564', 'dp9zy@msn.com', '361409199106068518');
INSERT INTO `teacher` VALUES (10, '10100020', '钦宁', b'1', '讲师', '15701150387', 'fmzqs8ccsu@sina.com', '121516197711291713');
INSERT INTO `teacher` VALUES (11, '10100021', '凌霞娥', b'0', '讲师', '15005260070', '8jjumb66jx@hotmail.com', '441428199306189773');
INSERT INTO `teacher` VALUES (12, '10100022', '竺希', b'0', '讲师', '15706705215', '4uccqxc92@yahoo.com.cn', '360517197602218852');
INSERT INTO `teacher` VALUES (13, '10100023', '易影咏', b'0', '讲师', '13308767937', '96ut3s@aol.com', '341711198108259516');
INSERT INTO `teacher` VALUES (14, '10100024', '公钧彪', b'0', '讲师', '15902814596', '6ta5k0qt@live.com', '621324199811022397');
INSERT INTO `teacher` VALUES (15, '10100025', '孔影巧', b'0', '讲师', '15001388583', '6x4phkt9@msn.com', '370101199710192860');
INSERT INTO `teacher` VALUES (16, '10100026', '席翔言', b'0', '讲师', '13301923510', '3c6e5e53@msn.com', '811721198507085010');
INSERT INTO `teacher` VALUES (17, '10100027', '车芝', b'0', '讲师', '15803844847', 'uuq0rr0@msn.com', '411605197302134889');
INSERT INTO `teacher` VALUES (18, '10100028', '强炎', b'0', '讲师', '15901104022', 'sapp8@0355.net', '341128198008192908');
INSERT INTO `teacher` VALUES (19, '10100029', '俟嘉霭', b'0', '讲师', '13202520810', '7yi9oq0@126.com', '150426198406279145');
INSERT INTO `teacher` VALUES (20, '10100030', '山菊莉', b'1', '讲师', '15502778697', 'kizjltnee8@3721.net', '141420199109276569');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `u_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `u_status` bit(1) NOT NULL COMMENT '用户状态',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10100011', '1', b'1');
INSERT INTO `user` VALUES ('10100012', '1', b'1');
INSERT INTO `user` VALUES ('10100013', '1', b'1');
INSERT INTO `user` VALUES ('10100014', '1', b'1');
INSERT INTO `user` VALUES ('10100015', '1', b'1');
INSERT INTO `user` VALUES ('10100016', '1', b'1');
INSERT INTO `user` VALUES ('10100017', '1', b'1');
INSERT INTO `user` VALUES ('10100018', '1', b'1');
INSERT INTO `user` VALUES ('10100019', '1', b'1');
INSERT INTO `user` VALUES ('10100020', '1', b'1');
INSERT INTO `user` VALUES ('10100021', '1', b'1');
INSERT INTO `user` VALUES ('10100022', '1', b'1');
INSERT INTO `user` VALUES ('10100023', '1', b'1');
INSERT INTO `user` VALUES ('10100024', '1', b'1');
INSERT INTO `user` VALUES ('10100025', '1', b'1');
INSERT INTO `user` VALUES ('10100026', '1', b'1');
INSERT INTO `user` VALUES ('10100027', '1', b'1');
INSERT INTO `user` VALUES ('10100028', '1', b'1');
INSERT INTO `user` VALUES ('10100029', '1', b'1');
INSERT INTO `user` VALUES ('10100030', '1', b'1');
INSERT INTO `user` VALUES ('123456', '1', b'1');
INSERT INTO `user` VALUES ('201624131198', '1', b'1');
INSERT INTO `user` VALUES ('201624131199', '1', b'1');
INSERT INTO `user` VALUES ('201624131202', '1', b'1');
INSERT INTO `user` VALUES ('201624131203', '1', b'0');
INSERT INTO `user` VALUES ('201624131204', '1', b'1');
INSERT INTO `user` VALUES ('201624131207', '1', b'0');
INSERT INTO `user` VALUES ('201624131208', '1', b'1');
INSERT INTO `user` VALUES ('201624131209', '1', b'0');
INSERT INTO `user` VALUES ('201624131210', '1', b'1');
INSERT INTO `user` VALUES ('201624131211', '1', b'0');
INSERT INTO `user` VALUES ('201624131212', '1', b'1');
INSERT INTO `user` VALUES ('201624131213', '1', b'1');
INSERT INTO `user` VALUES ('201624131214', '1', b'1');
INSERT INTO `user` VALUES ('201624131215', '1', b'1');
INSERT INTO `user` VALUES ('201624131216', '1', b'0');
INSERT INTO `user` VALUES ('201624131217', '1', b'1');
INSERT INTO `user` VALUES ('201624131218', '1', b'1');
INSERT INTO `user` VALUES ('201624131219', '1', b'1');
INSERT INTO `user` VALUES ('201624131220', '1', b'1');
INSERT INTO `user` VALUES ('201624131221', '1', b'1');
INSERT INTO `user` VALUES ('201624131222', '1', b'1');
INSERT INTO `user` VALUES ('201624131223', '1', b'1');
INSERT INTO `user` VALUES ('201624131224', '1', b'1');
INSERT INTO `user` VALUES ('201624131225', '1', b'1');
INSERT INTO `user` VALUES ('201624131226', '1', b'1');
INSERT INTO `user` VALUES ('201624131227', '1', b'1');
INSERT INTO `user` VALUES ('201624131228', '1', b'1');
INSERT INTO `user` VALUES ('201624131229', '1', b'1');
INSERT INTO `user` VALUES ('201624131230', '1', b'1');
INSERT INTO `user` VALUES ('201624131231', '1', b'1');
INSERT INTO `user` VALUES ('201624131232', '1', b'1');
INSERT INTO `user` VALUES ('201624131233', '1', b'1');
INSERT INTO `user` VALUES ('201624131234', '1', b'1');
INSERT INTO `user` VALUES ('201624131235', '1', b'1');
INSERT INTO `user` VALUES ('201624131236', '1', b'1');
INSERT INTO `user` VALUES ('201624131237', '1', b'1');
INSERT INTO `user` VALUES ('201624131238', '1', b'1');
INSERT INTO `user` VALUES ('201624131239', '1', b'1');
INSERT INTO `user` VALUES ('201624131240', '1', b'1');
INSERT INTO `user` VALUES ('201624131241', '1', b'1');
INSERT INTO `user` VALUES ('201624131242', '1', b'1');
INSERT INTO `user` VALUES ('201624131243', '1', b'1');
INSERT INTO `user` VALUES ('201624131244', '1', b'1');
INSERT INTO `user` VALUES ('201624131245', '1', b'1');
INSERT INTO `user` VALUES ('201624131246', '1', b'1');
INSERT INTO `user` VALUES ('201624131247', '1', b'1');
INSERT INTO `user` VALUES ('201624131248', '1', b'1');
INSERT INTO `user` VALUES ('201624131249', '1', b'1');
INSERT INTO `user` VALUES ('201624131250', '1', b'1');
INSERT INTO `user` VALUES ('201624131251', '1', b'1');
INSERT INTO `user` VALUES ('201624131252', '1', b'1');
INSERT INTO `user` VALUES ('201624131253', '1', b'1');
INSERT INTO `user` VALUES ('201624131254', '1', b'1');
INSERT INTO `user` VALUES ('201624131255', '1', b'1');
INSERT INTO `user` VALUES ('201624131256', '1', b'1');
INSERT INTO `user` VALUES ('201624131257', '1', b'1');
INSERT INTO `user` VALUES ('201624131258', '1', b'1');
INSERT INTO `user` VALUES ('201624131259', '1', b'1');
INSERT INTO `user` VALUES ('201624131260', '1', b'1');
INSERT INTO `user` VALUES ('201624131261', '1', b'1');
INSERT INTO `user` VALUES ('201624131262', '1', b'1');
INSERT INTO `user` VALUES ('201624131263', '1', b'1');
INSERT INTO `user` VALUES ('201624131264', '1', b'1');
INSERT INTO `user` VALUES ('201624131265', '1', b'1');
INSERT INTO `user` VALUES ('201624131266', '1', b'1');
INSERT INTO `user` VALUES ('201624131267', '1', b'1');
INSERT INTO `user` VALUES ('201624131268', '1', b'1');
INSERT INTO `user` VALUES ('201624131269', '1', b'1');
INSERT INTO `user` VALUES ('201624131270', '1', b'1');
INSERT INTO `user` VALUES ('202013040507', '1', b'1');
INSERT INTO `user` VALUES ('202013040508', '1', b'1');
INSERT INTO `user` VALUES ('admin', 'admin', b'1');
INSERT INTO `user` VALUES ('J1001', '1', b'1');
INSERT INTO `user` VALUES ('J1002', '1', b'1');
INSERT INTO `user` VALUES ('J1003', '1', b'1');
INSERT INTO `user` VALUES ('J1004', '1', b'1');
INSERT INTO `user` VALUES ('J1005', '1', b'1');
INSERT INTO `user` VALUES ('J1006', '1', b'1');
INSERT INTO `user` VALUES ('J1007', '1', b'1');
INSERT INTO `user` VALUES ('J1008', '1', b'1');
INSERT INTO `user` VALUES ('J1009', '1', b'1');
INSERT INTO `user` VALUES ('J1010', '1', b'1');
INSERT INTO `user` VALUES ('J1011', '1', b'1');
INSERT INTO `user` VALUES ('J1012', '1', b'1');
INSERT INTO `user` VALUES ('J1013', '1', b'1');
INSERT INTO `user` VALUES ('J1014', '1', b'1');
INSERT INTO `user` VALUES ('J1015', '1', b'1');
INSERT INTO `user` VALUES ('J1016', '1', b'1');
INSERT INTO `user` VALUES ('J1017', '1', b'1');
INSERT INTO `user` VALUES ('J1018', '1', b'1');
INSERT INTO `user` VALUES ('J1019', '1', b'1');
INSERT INTO `user` VALUES ('J1020', '1', b'1');
INSERT INTO `user` VALUES ('J1021', '1', b'1');
INSERT INTO `user` VALUES ('J1022', '1', b'1');
INSERT INTO `user` VALUES ('J1023', '1', b'1');
INSERT INTO `user` VALUES ('J1024', '1', b'1');
INSERT INTO `user` VALUES ('J1025', '1', b'1');
INSERT INTO `user` VALUES ('J1026', '1', b'1');
INSERT INTO `user` VALUES ('J1027', '1', b'1');
INSERT INTO `user` VALUES ('J1028', '1', b'1');
INSERT INTO `user` VALUES ('J1029', '1', b'1');
INSERT INTO `user` VALUES ('stu', '1', b'1');
INSERT INTO `user` VALUES ('Test', '1', b'1');
INSERT INTO `user` VALUES ('V1001', '1', b'1');
INSERT INTO `user` VALUES ('V1002', '1', b'1');
INSERT INTO `user` VALUES ('V1003', '1', b'1');
INSERT INTO `user` VALUES ('V1004', '1', b'1');
INSERT INTO `user` VALUES ('V1005', '1', b'1');
INSERT INTO `user` VALUES ('V1006', '1', b'1');
INSERT INTO `user` VALUES ('V1007', '1', b'1');
INSERT INTO `user` VALUES ('V1008', '1', b'1');
INSERT INTO `user` VALUES ('V1009', '1', b'1');
INSERT INTO `user` VALUES ('V1010', '1', b'1');
INSERT INTO `user` VALUES ('V1011', '1', b'1');
INSERT INTO `user` VALUES ('V1012', '1', b'1');
INSERT INTO `user` VALUES ('V1013', '1', b'1');
INSERT INTO `user` VALUES ('V1014', '1', b'1');
INSERT INTO `user` VALUES ('V1015', '1', b'1');
INSERT INTO `user` VALUES ('V1016', '1', b'1');
INSERT INTO `user` VALUES ('V1017', '1', b'1');
INSERT INTO `user` VALUES ('V1018', '1', b'1');
INSERT INTO `user` VALUES ('V1019', '1', b'1');
INSERT INTO `user` VALUES ('V1020', '1', b'1');
INSERT INTO `user` VALUES ('V1021', '1', b'1');
INSERT INTO `user` VALUES ('V1022', '1', b'1');
INSERT INTO `user` VALUES ('V1023', '1', b'1');
INSERT INTO `user` VALUES ('V1024', '1', b'1');
INSERT INTO `user` VALUES ('V1025', '1', b'1');
INSERT INTO `user` VALUES ('V1026', '1', b'1');
INSERT INTO `user` VALUES ('V1027', '1', b'1');
INSERT INTO `user` VALUES ('V1028', '1', b'1');
INSERT INTO `user` VALUES ('V1029', '1', b'1');
INSERT INTO `user` VALUES ('V1030', '1', b'1');

-- ----------------------------
-- Table structure for volunteer
-- ----------------------------
DROP TABLE IF EXISTS `volunteer`;
CREATE TABLE `volunteer`  (
  `v_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `v_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '志愿者号',
  `v_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `v_gender` bit(1) NOT NULL DEFAULT b'1' COMMENT '性别',
  `v_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `v_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `v_IDcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`v_id`) USING BTREE,
  INDEX `v_no`(`v_no`) USING BTREE,
  CONSTRAINT `fk_vno_uid` FOREIGN KEY (`v_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of volunteer
-- ----------------------------
INSERT INTO `volunteer` VALUES (1, 'V1001', '李娜', b'0', '13007747666', '11110000@qq.com', '630505199901202036');
INSERT INTO `volunteer` VALUES (2, 'V1002', '李军', b'1', '13007747666', 'aa@qq.com', '630505199901202037');
INSERT INTO `volunteer` VALUES (3, 'V1003', '李明', b'1', '13007747666', 'bb@qq.com', '630505199901202038');
INSERT INTO `volunteer` VALUES (4, 'V1004', '李华', b'1', '13007747666', 'cc@qq.com', '630505199901202039');
INSERT INTO `volunteer` VALUES (5, 'V1005', '匡艳纨', b'0', '15300896589', '35mvcp@163.com', '540210199904272121');
INSERT INTO `volunteer` VALUES (6, 'V1006', '鱼泰顺', b'1', '13806082344', '1ihhc271s6@sina.com', '611415199101101089');
INSERT INTO `volunteer` VALUES (7, 'V1007', '许克才', b'1', '15005204327', 'c746zv2@163.com', '461411198202206869');
INSERT INTO `volunteer` VALUES (8, 'V1008', '迟宁才', b'1', '15306798974', '3qirn8@sohu.com', '540228199211012398');
INSERT INTO `volunteer` VALUES (9, 'V1009', '单顺诚', b'0', '13106413841', '1345r@sina.com', '450603199102012723');
INSERT INTO `volunteer` VALUES (10, 'V1010', '任秋', b'1', '13304381644', 'jt1i02a61@googlemail.com', '521113199008158344');
INSERT INTO `volunteer` VALUES (11, 'V1011', '董馥娣', b'0', '15000432444', 'rq96h@msn.com', '430228197805142868');
INSERT INTO `volunteer` VALUES (12, 'V1012', '冉君馨', b'0', '15805842495', 'mt6e7wknw@yahoo.com', '620226199207145279');
INSERT INTO `volunteer` VALUES (13, 'V1013', '刁园雪', b'1', '15902461514', 'obet43jiqm@163.com', '461203197806073354');
INSERT INTO `volunteer` VALUES (14, 'V1014', '应清', b'0', '13507203381', 'nbtxp71sd@sina.com', '501008197510075657');
INSERT INTO `volunteer` VALUES (15, 'V1015', '阳雁', b'0', '13406205792', '2chjs@ask.com', '321721198604021383');
INSERT INTO `volunteer` VALUES (16, 'V1016', '农辉', b'1', '13600064716', 'cf67se12@live.com', '520116199406275772');
INSERT INTO `volunteer` VALUES (17, 'V1017', '山朗', b'0', '15700485010', 'fvlzwmvws@yahoo.com.cn', '110409198609067606');
INSERT INTO `volunteer` VALUES (18, 'V1018', '谭学', b'1', '15906684519', '8neo6@yahoo.com', '461519198504309684');
INSERT INTO `volunteer` VALUES (19, 'V1019', '法璧', b'0', '15700447158', 'a12d6d09@yahoo.com', '321113199908283027');
INSERT INTO `volunteer` VALUES (20, 'V1020', '农义厚', b'0', '15000474466', 's4f8l5w@sina.com', '421311199412285728');
INSERT INTO `volunteer` VALUES (21, 'V1021', '井欢', b'1', '13606890675', 'q5dz6@hotmail.com', '430605197310064449');
INSERT INTO `volunteer` VALUES (22, 'V1022', '谷琛清', b'0', '15804821239', 'zdvf8@msn.com', '411106199308039438');
INSERT INTO `volunteer` VALUES (23, 'V1023', '吉璧竹', b'0', '13905625729', '4r8fn@gmail.com', '611224198809136827');
INSERT INTO `volunteer` VALUES (24, 'V1024', '司力', b'1', '13701631342', 'l0968z58iq@126.com', '610409198306076926');
INSERT INTO `volunteer` VALUES (25, 'V1025', '宗荣 ', b'0', '13103932332', 'jdt87sjx@gmail.com', '130426197106269536');
INSERT INTO `volunteer` VALUES (26, 'V1026', '毛翰全', b'0', '13307446276', '5j9331yx@ask.com', '540728198209163940');
INSERT INTO `volunteer` VALUES (27, 'V1027', '庚心杰', b'1', '13605212430', 'aj0ysd9mf@yahoo.com.cn', '220124199201071588');
INSERT INTO `volunteer` VALUES (28, 'V1028', '包环聪', b'0', '15902678132', 'bhw1fjx@263.net', '211801198502101314');
INSERT INTO `volunteer` VALUES (29, 'V1029', '里政宁', b'0', '13202208220', 'z8228u421v@hotmail.com', '141410198409197310');
INSERT INTO `volunteer` VALUES (30, 'V1030', '邵会鹏', b'0', '15507126879', '80vqld@sohu.com', '120302197711227101');

SET FOREIGN_KEY_CHECKS = 1;
