SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
                          `b_id` int NOT NULL AUTO_INCREMENT COMMENT '借出id',
                          `b_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借用人id',
                          `b_eid` int NOT NULL COMMENT '借出器材id',
                          `b_num` int NOT NULL COMMENT '借出数量',
                          `b_startTime` datetime NOT NULL COMMENT '借出时间',
                          `b_endTime` datetime DEFAULT NULL COMMENT '归还时间',
                          `b_state` bit(1) NOT NULL COMMENT '归还状态',
                          `b_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '借用理由',
                          PRIMARY KEY (`b_id`) USING BTREE,
                          KEY `fk_bno_uid` (`b_no`) USING BTREE,
                          KEY `fk_beid_eid` (`b_eid`) USING BTREE,
                          CONSTRAINT `fk_beid_eid` FOREIGN KEY (`b_eid`) REFERENCES `equipment` (`e_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                          CONSTRAINT `fk_bno_uid` FOREIGN KEY (`b_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `borrow` VALUES ('1', 'stu', '2', '2', '2019-06-01 00:00:00', '2019-06-02 00:00:00', b'1', '借用理由');
INSERT INTO `borrow` VALUES ('2', 'stu', '3', '2', '2019-06-01 00:00:00', '2019-06-02 00:00:00', b'1', '借用理由');
INSERT INTO `borrow` VALUES ('3', 'stu', '4', '2', '2019-06-01 00:00:00', '2019-06-02 00:00:00', b'1', '借用理由');
INSERT INTO `borrow` VALUES ('4', 'stu', '5', '2', '2019-06-01 00:00:00', '2019-06-02 00:00:00', b'1', '借用理由');

-- ----------------------------
-- Table structure for broadcast
-- ----------------------------
DROP TABLE IF EXISTS `broadcast`;
CREATE TABLE `broadcast` (
                             `b_id` int NOT NULL AUTO_INCREMENT COMMENT '广播id',
                             `b_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广播主题',
                             `b_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广播内容',
                             `b_time` datetime NOT NULL COMMENT '播出时间',
                             `b_sportmeetingid` int NOT NULL COMMENT ' 运动会id',
                             PRIMARY KEY (`b_id`) USING BTREE,
                             KEY `fk_bsportmeetingid_sid` (`b_sportmeetingid`) USING BTREE,
                             CONSTRAINT `fk_bsportmeetingid_sid` FOREIGN KEY (`b_sportmeetingid`) REFERENCES `sportmeeting` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

BEGIN;
INSERT INTO `broadcast` VALUES (2, '包括许多比赛项目的运动比赛', '只是范围不同。最早的运动会就是古希腊的古代', '2021-03-20 11:59:00', 2021);
INSERT INTO `broadcast` VALUES (3, '包括许多比赛项目的运动比赛', '运动会，只是范', '2021-03-20 11:59:00', 2021);
INSERT INTO `broadcast` VALUES (14, '自己的光彩，迎接胜利的喝彩。', '自己的光彩，迎接胜利的喝彩。', '2022-03-22 17:37:19', 2022);
INSERT INTO `broadcast` VALUES (15, '自己的光彩，迎接胜利的喝彩。', '自己的光彩，迎接胜利的喝彩。', '2022-04-12 18:18:39', 2022);
INSERT INTO `broadcast` VALUES (16, '包括许多比赛项目的运动比赛', '自己的光彩，迎接胜利的喝彩。', '2022-03-20 11:08:52', 2022);
INSERT INTO `broadcast` VALUES (17, '包括许多比赛项目的运动比赛', '自己的光彩，迎接胜利的喝彩。', '2022-03-20 10:52:38', 2022);
COMMIT;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
                           `c_id` int NOT NULL AUTO_INCREMENT COMMENT '班级id',
                           `c_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
                           `c_headmasterid` int DEFAULT NULL COMMENT '班主任id',
                           `c_major` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业',
                           `c_deptid` int NOT NULL COMMENT '学院id',
                           PRIMARY KEY (`c_id`) USING BTREE,
                           KEY `fk_cdeptid_did` (`c_deptid`) USING BTREE,
                           KEY `fk_cheadmasterid_tid` (`c_headmasterid`) USING BTREE,
                           CONSTRAINT `fk_cdeptid_did` FOREIGN KEY (`c_deptid`) REFERENCES `department` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                           CONSTRAINT `fk_cheadmasterid_tid` FOREIGN KEY (`c_headmasterid`) REFERENCES `teacher` (`t_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

BEGIN;
INSERT INTO `classes` VALUES (1, '软件2001', 1, '软件工程', 1);
INSERT INTO `classes` VALUES (2, '软件2002', 2, '软件工程', 1);
INSERT INTO `classes` VALUES (3, '软件2003', 4, '软件工程', 1);
INSERT INTO `classes` VALUES (4, '软件2004', 3, '软件工程', 1);
INSERT INTO `classes` VALUES (5, '计科2001', 10, '计算机科学与技术', 2);
INSERT INTO `classes` VALUES (6, '计科2002', 5, '计算机科学与技术', 2);
INSERT INTO `classes` VALUES (7, '计科2003', 7, '计算机科学与技术', 2);
INSERT INTO `classes` VALUES (8, '电信2001', 8, '电子信息工程', 2);
INSERT INTO `classes` VALUES (9, '大数据2001', 6, '数据科学与大数据技术', 1);
INSERT INTO `classes` VALUES (11, '食工2001', 17, '食品科学与工程', 3);
INSERT INTO `classes` VALUES (12, '环工2005', 19, '环境工程', 4);
INSERT INTO `classes` VALUES (13, '环工2006', 15, '环境工程', 4);
COMMIT;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
                              `d_id` int NOT NULL AUTO_INCREMENT COMMENT '学院id',
                              `d_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院名称',
                              `d_deanid` int DEFAULT NULL COMMENT '院长id',
                              PRIMARY KEY (`d_id`) USING BTREE,
                              KEY `fk_ddeanid_tid` (`d_deanid`) USING BTREE,
                              CONSTRAINT `fk_ddeanid_tid` FOREIGN KEY (`d_deanid`) REFERENCES `teacher` (`t_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

BEGIN;
INSERT INTO `department` VALUES (1, '人工智能与大数据学院', 1);
INSERT INTO `department` VALUES (2, '信息科学与工程学院', 2);
INSERT INTO `department` VALUES (3, '粮油食品学院', 3);
INSERT INTO `department` VALUES (4, '环境工程学院', 10);
INSERT INTO `department` VALUES (5, '机电工程学院', 12);
INSERT INTO `department` VALUES (6, '国际教育学院', 19);
COMMIT;

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
                             `e_id` int NOT NULL AUTO_INCREMENT COMMENT '器材id',
                             `e_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '器材名称',
                             `e_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '器材型号',
                             `e_place` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '器材放置地点',
                             `e_sum` int NOT NULL COMMENT '器材总数',
                             `e_buyTime` datetime DEFAULT NULL COMMENT '器材采购时间',
                             PRIMARY KEY (`e_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

BEGIN;
INSERT INTO `equipment` VALUES (1, '足球2', 'brniy', '体育馆一楼101', 322, '2020-04-02 16:49:10');
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
COMMIT;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
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
                         KEY `fk_esportmeetingid_sid` (`e_sportmeetingid`) USING BTREE,
                         KEY `fk_ejudgementid_uid` (`e_judgementid`) USING BTREE,
                         CONSTRAINT `fk_ejudgementid_uid` FOREIGN KEY (`e_judgementid`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                         CONSTRAINT `fk_esportmeetingid_sid` FOREIGN KEY (`e_sportmeetingid`) REFERENCES `sportmeeting` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

BEGIN;
INSERT INTO `event` VALUES (1, '男子100米', '体育馆一楼', b'1', '2022-01-11 22:44:57', '2022-01-11 22:44:57', '2022-01-11 22:44:57', 2022, '男子100米', 'J1001', '秒');
INSERT INTO `event` VALUES (2, '女子100米', '体育馆一楼', b'1', '2022-01-11 22:44:57', '2022-01-11 22:44:57', '2022-01-11 22:44:57', 2022, '女子100米', 'J1002', '秒');
INSERT INTO `event` VALUES (3, '男子200米', '体育馆一楼', b'1', '2022-01-11 22:44:57', '2022-01-11 22:44:57', '2022-01-11 22:44:57', 2022, '男子200米', 'J1003', '秒');
INSERT INTO `event` VALUES (4, '女子200米', '体育馆一楼', b'1', '2022-01-11 22:44:57', '2022-01-11 22:44:57', '2022-01-11 22:44:57', 2022, '女子200米', 'J1004', '秒');
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
COMMIT;

-- ----------------------------
-- Table structure for matches
-- ----------------------------
DROP TABLE IF EXISTS `matches`;
CREATE TABLE `matches` (
                           `m_id` int NOT NULL AUTO_INCREMENT COMMENT '赛事id',
                           `m_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参赛人id',
                           `m_eid` int NOT NULL COMMENT '参赛项目',
                           `m_sort` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '将参赛人分组分道',
                           `m_score` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '赛事成绩',
                           `m_rank` int DEFAULT NULL COMMENT '成绩排名',
                           PRIMARY KEY (`m_id`) USING BTREE,
                           KEY `fk_mno_uid` (`m_no`) USING BTREE,
                           KEY `fk_meid_eid` (`m_eid`) USING BTREE,
                           CONSTRAINT `fk_meid_eid` FOREIGN KEY (`m_eid`) REFERENCES `event` (`e_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                           CONSTRAINT `fk_mno_uid` FOREIGN KEY (`m_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `matches` VALUES (1, 'stu', 1, 'A组', '12.5', 1);

-- ----------------------------
-- Table structure for other
-- ----------------------------
DROP TABLE IF EXISTS `other`;
CREATE TABLE `other` (
                         `o_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
                         `o_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '其他用户标识号',
                         `o_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '其他用户名',
                         PRIMARY KEY (`o_id`) USING BTREE,
                         KEY `fk_ono_uid` (`o_no`) USING BTREE,
                         CONSTRAINT `fk_ono_uid` FOREIGN KEY (`o_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
                        `r_id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
                        `r_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
                        `r_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色描述',
                        PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
                             `r_id` int NOT NULL,
                             `u_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                             PRIMARY KEY (`r_id`,`u_id`) USING BTREE,
                             KEY `fk_uid` (`u_id`) USING BTREE,
                             CONSTRAINT `fk_rid2` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                             CONSTRAINT `fk_uid` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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

INSERT INTO `role_user` VALUES (4, 'V1001');
INSERT INTO `role_user` VALUES (4, 'V1002');
INSERT INTO `role_user` VALUES (4, 'V1003');
INSERT INTO `role_user` VALUES (4, 'V1004');

-- ----------------------------
-- Table structure for sportmeeting
-- ----------------------------
DROP TABLE IF EXISTS `sportmeeting`;
CREATE TABLE `sportmeeting` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

BEGIN;
INSERT INTO `sportmeeting` VALUES (2019, '第八届运动会', '运动运动', '第一田径场', '2019-01-24 12:15:00', '2019-01-24 12:15:00', '2019-01-24 12:15:00', '运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。', b'0');
INSERT INTO `sportmeeting` VALUES (2020, '第九届运动会', '赛出成绩，赛出精彩', '第二田径场', '2020-01-11 00:09:00', '2020-01-11 00:09:00', '2020-01-15 00:09:00', '运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。', b'0');
INSERT INTO `sportmeeting` VALUES (2021, '第十届运动会', '放飞自我，飞得更高', '第一田径场', '2021-01-11 00:09:00', '2021-01-11 00:09:00', '2021-01-15 00:09:00', '无运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。', b'0');
INSERT INTO `sportmeeting` VALUES (2022, '第十一届运动会', '运动快乐', '体育馆', '2022-04-12 17:31:26', '2022-04-12 17:31:31', '2022-04-12 17:31:32', '运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。', b'1');
COMMIT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
                           `s_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
                           `s_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
                           `s_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
                           `s_gender` bit(1) NOT NULL default 1 COMMENT '性别',
                           `s_classid` int NOT NULL default 0 COMMENT '班级号',
                           `s_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '电话号码',
                           `s_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
                           `s_IDcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '身份证号',
                           PRIMARY KEY (`s_id`) USING BTREE,
                           KEY `s_no` (`s_no`) USING BTREE,
                           KEY `fk_sclassid_cid` (`s_classid`) USING BTREE,
                           CONSTRAINT `fk_sno_uid` FOREIGN KEY (`s_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



-- ----------------------------
-- Table structure for sysLog
-- ----------------------------
DROP TABLE IF EXISTS `sysLog`;
CREATE TABLE `sysLog` (
                          `id` int NOT NULL AUTO_INCREMENT,
                          `username` varchar(255) DEFAULT NULL,
                          `ip` varchar(255) DEFAULT NULL,
                          `url` varchar(255) DEFAULT NULL,
                          `visitTime` datetime DEFAULT NULL,
                          `executionTime` int DEFAULT NULL,
                          `method` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3472 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

    -- ----------------------------
    -- Table structure for teacher
    -- ----------------------------
alter table teacher drop foreign key fk_tno_uid;
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
                           `t_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
                           `t_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教工号',
                           `t_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
                           `t_gender` bit(1) NOT NULL default 1 COMMENT '性别',
                           `t_identity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '身份',
                           `t_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '手机号码',
                           `t_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
                           `t_IDcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '身份证号',
                           PRIMARY KEY (`t_id`) USING BTREE,
                           KEY `t_no` (`t_no`) USING BTREE,
                           CONSTRAINT `fk_tno_uid` FOREIGN KEY (`t_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
BEGIN;
INSERT INTO `teacher` VALUES (1, '10100011', '郑美', b'0', '讲师', '13302614724', 'h8q2wo@yahoo.com', '540921199206293486');
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
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `u_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
                        `u_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
                        `u_status` bit(1) NOT NULL COMMENT '用户状态',
                        PRIMARY KEY (`u_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

# 裁判USER
INSERT INTO `user` VALUES ('J1001','123456',b'1');
INSERT INTO `user` VALUES ('J1002','1',b'1');
INSERT INTO `user` VALUES ('J1003','1',b'1');
INSERT INTO `user` VALUES ('J1004','1',b'1');
INSERT INTO `user` VALUES ('J1005','1',b'1');
INSERT INTO `user` VALUES ('J1006','1',b'1');
INSERT INTO `user` VALUES ('J1007','1',b'1');
INSERT INTO `user` VALUES ('J1008','1',b'1');
INSERT INTO `user` VALUES ('J1009','1',b'1');
INSERT INTO `user` VALUES ('J1010','1',b'1');
INSERT INTO `user` VALUES ('J1011','1',b'1');
INSERT INTO `user` VALUES ('J1012','1',b'1');
INSERT INTO `user` VALUES ('J1013','1',b'1');
INSERT INTO `user` VALUES ('J1014','1',b'1');
INSERT INTO `user` VALUES ('J1015','1',b'1');
INSERT INTO `user` VALUES ('J1016','1',b'1');
INSERT INTO `user` VALUES ('J1017','1',b'1');
INSERT INTO `user` VALUES ('J1018','1',b'1');
INSERT INTO `user` VALUES ('J1019','1',b'1');
INSERT INTO `user` VALUES ('J1020','1',b'1');
INSERT INTO `user` VALUES ('J1021','1',b'1');
INSERT INTO `user` VALUES ('J1022','1',b'1');
INSERT INTO `user` VALUES ('J1023','1',b'1');
INSERT INTO `user` VALUES ('J1024','1',b'1');
INSERT INTO `user` VALUES ('J1025','1',b'1');
INSERT INTO `user` VALUES ('J1026','1',b'1');
INSERT INTO `user` VALUES ('J1027','1',b'1');
INSERT INTO `user` VALUES ('J1028','1',b'1');
INSERT INTO `user` VALUES ('J1029','1',b'1');
INSERT INTO `user` VALUES ('10100011','1',b'1');
INSERT INTO `user` VALUES ('10100012','1',b'1');
INSERT INTO `user` VALUES ('10100013','1',b'1');
INSERT INTO `user` VALUES ('10100014','1',b'1');
INSERT INTO `user` VALUES ('10100015','1',b'1');
INSERT INTO `user` VALUES ('10100016','1',b'1');
INSERT INTO `user` VALUES ('10100017','1',b'1');
INSERT INTO `user` VALUES ('10100018','1',b'1');
INSERT INTO `user` VALUES ('10100019','1',b'1');
INSERT INTO `user` VALUES ('10100020','1',b'1');
INSERT INTO `user` VALUES ('10100021','1',b'1');
INSERT INTO `user` VALUES ('10100022','1',b'1');
INSERT INTO `user` VALUES ('10100023','1',b'1');
INSERT INTO `user` VALUES ('10100024','1',b'1');
INSERT INTO `user` VALUES ('10100025','1',b'1');
INSERT INTO `user` VALUES ('10100026','1',b'1');
INSERT INTO `user` VALUES ('10100027','1',b'1');
INSERT INTO `user` VALUES ('10100028','1',b'1');
INSERT INTO `user` VALUES ('10100029','1',b'1');
INSERT INTO `user` VALUES ('10100030','1',b'1');

INSERT INTO `user` VALUES ('V1001','1',b'1');
INSERT INTO `user` VALUES ('V1002','1',b'1');
INSERT INTO `user` VALUES ('V1003','1',b'1');
INSERT INTO `user` VALUES ('V1004','1',b'1');

-- ----------------------------
-- Table structure for judge
-- ----------------------------
DROP TABLE IF EXISTS `judge`;
CREATE TABLE `judge` (
                         `j_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
                         `j_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '裁判号',
                         `j_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
                         `j_gender` bit(1) NOT NULL default 1 COMMENT '性别',
                         `j_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '手机号码',
                         `j_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
                         `j_IDcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '身份证号',
                         PRIMARY KEY (`j_id`) USING BTREE,
                         KEY `j_no` (`j_no`) USING BTREE,
                         CONSTRAINT `fk_jno_uid` FOREIGN KEY (`j_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

# 裁判
INSERT INTO `judge` VALUES (1, 'J1001', '荣瑶翠', b'1', '13404428674', '3yczovnmq@ask.com', '620615198310099195');
INSERT INTO `judge` VALUES (2, 'J1002', '司楠', b'1', '13306986310', 'fl73q6@gmail.com', '610403198107056882');
INSERT INTO `judge` VALUES (3, 'J1003', '后元先', b'0','13804720259', '2bh7l8@sina.com', '451325199205313721');
INSERT INTO `judge` VALUES (4, 'J1004', '丘振峰', b'1','15904144313', '6nduvw9ee3@gmail.com', '140814198012079519');
INSERT INTO `judge` VALUES (5, 'J1005', '胥香婉', b'0', '13105904900', 'yjigg@ask.com', '340123197811023957');
INSERT INTO `judge` VALUES (6, 'J1006', '公鸣利', b'0', '13308701067', 'qdcix@126.com', '650718197105228438');
INSERT INTO `judge` VALUES (7, 'J1007', '公泰', b'0', '13101555053', 'lm7mvu9q@163.net', '410727198608061536');
INSERT INTO `judge` VALUES (8, 'J1008', '古榕', b'0', '15200736021', 'hl7ikv@yahoo.com', '810102199601216458');
INSERT INTO `judge` VALUES (9, 'J1009', '能彬永', b'0', '15102906965', '6in4ggkd16@msn.com', '331405199801213132');
INSERT INTO `judge` VALUES (10, 'J1010', '岳彩娥', b'1','15107393110', 'zexrqq@163.com', '370310199904023652');
INSERT INTO `judge` VALUES (11, 'J1011', '钱翠', b'0', '15307729033', 'bx8297e@live.com', '311426197609175971');
INSERT INTO `judge` VALUES (12, 'J1012', '荣海', b'0', '13103219082', '8pcpt@yahoo.com', '420604198312038857');
INSERT INTO `judge` VALUES (13, 'J1013', '管梅香', b'1', '13007747666', 'n0pvh@3721.net', '630505199901202036');
INSERT INTO `judge` VALUES (14, 'J1014', '严豪', b'1', '13706623695', 'wp4f3@0355.net', '211415199001056037');
INSERT INTO `judge` VALUES (15, 'J1015', '马婕娴', b'0', '13904794478', '1btnaef4c@126.com', '610913199312295777');
INSERT INTO `judge` VALUES (16, 'J1016', '邬哲勇', b'1','13605434568', 'nm7ity7kdt@yahoo.com.cn', '640901197103122151');
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
-- Table structure for volunteer
-- ----------------------------
DROP TABLE IF EXISTS `volunteer`;
CREATE TABLE `volunteer` (
                             `v_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
                             `v_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '志愿者号',
                             `v_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
                             `v_gender` bit(1) NOT NULL default 1 COMMENT '性别',
                             `v_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '手机号码',
                             `v_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
                             `v_IDcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '身份证号',
                             PRIMARY KEY (`v_id`) USING BTREE,
                             KEY `v_no` (`v_no`) USING BTREE,
                             CONSTRAINT `fk_vno_uid` FOREIGN KEY (`v_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `volunteer` VALUES (1, 'V1001', '李娜', b'0', '13007747666', '11110000@qq.com', '630505199901202036');
INSERT INTO `volunteer` VALUES (2, 'V1002', '李军', b'1', '13007747666', 'aa@qq.com', '630505199901202037');
INSERT INTO `volunteer` VALUES (3, 'V1003', '李明', b'1', '13007747666', 'bb@qq.com', '630505199901202038');
INSERT INTO `volunteer` VALUES (4, 'V1004', '李华', b'1', '13007747666', 'cc@qq.com', '630505199901202039');


DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
                          `m_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
                          `m_sno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生ID',
                          `m_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
                          `m_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
                          `m_time` datetime NOT NULL COMMENT '发布时间',
                          `m_sender` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送者',
                          `status` int NOT NULL COMMENT '消息状态',
                          PRIMARY KEY (`m_id`) USING BTREE,
                          KEY `m_sender` (`m_sender`) USING BTREE,
                          CONSTRAINT `fk_m_sender` FOREIGN KEY (`m_sender`) REFERENCES `volunteer` (`v_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `message` VALUES (1, 'stu', '标题1', '内容1', '2019-01-01', 'V1001', 0);

# 找出软件2002班所有学生的message
SELECT * FROM message WHERE m_sno IN (SELECT s_no FROM student WHERE s_classid = 2);

SET FOREIGN_KEY_CHECKS = 1;