/*
 Navicat Premium Data Transfer

 Source Server         : aaa
 Source Server Type    : MySQL
 Source Server Version : 50130
 Source Host           : localhost:3306
 Source Schema         : jskh

 Target Server Type    : MySQL
 Target Server Version : 50130
 File Encoding         : 65001

 Date: 14/04/2019 19:52:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '超级管理员主键',
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名，规定为用户的工号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码，默认密码，用户工号后6位',
  `trueName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户真实姓名',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位',
  `dep` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '所在部门',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '个人标 准照',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES (1, 'yang', '123', '杨智勇', '信息工程学院院长', '1', '超级管理员', '');
INSERT INTO `tb_admin` VALUES (2, 'tang', '123', '唐林', '信息工程学院教务科科长', '1', '超级管理员', '');

-- ----------------------------
-- Table structure for tb_dep
-- ----------------------------
DROP TABLE IF EXISTS `tb_dep`;
CREATE TABLE `tb_dep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `depName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `depLeader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门领导',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_dep
-- ----------------------------
INSERT INTO `tb_dep` VALUES (1, '信息工程学院', '杨智勇');
INSERT INTO `tb_dep` VALUES (2, '财经与贸易学院', 'X院长');
INSERT INTO `tb_dep` VALUES (3, '机械工程学院', 'Y院长');
INSERT INTO `tb_dep` VALUES (4, '基础部', 'XXXX');
INSERT INTO `tb_dep` VALUES (5, '地测学院', 'XXXX');
INSERT INTO `tb_dep` VALUES (6, '电气工程学院', 'XXXX');
INSERT INTO `tb_dep` VALUES (7, '继续教育学院', 'XXXX');
INSERT INTO `tb_dep` VALUES (8, '矿业与环境学院', 'XXXX');
INSERT INTO `tb_dep` VALUES (9, '艺术与设计学院', NULL);

-- ----------------------------
-- Table structure for tb_jiaoshixiang
-- ----------------------------
DROP TABLE IF EXISTS `tb_jiaoshixiang`;
CREATE TABLE `tb_jiaoshixiang`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考核项ID',
  `khNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '考核项汉字编号',
  `khName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考核项名称',
  `khValue` int(11) NOT NULL DEFAULT 0 COMMENT '考核项对应的最高分值',
  `khStandard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核标准',
  `khGetScorerStandard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '给分项',
  `khAddScoreStandard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '加分依据',
  `khSubScoreStandard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '扣分依据',
  `khNote` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_jiaoshixiang
-- ----------------------------
INSERT INTO `tb_jiaoshixiang` VALUES (1, '一', '教学工作量完成情况', 15, '完成规定的教学工作量、遵循教学任务安排', '完成规定的基本教学工作量为9分(60%)，系数前课时超出规定课时10%，得10.5分(70%)；系数前课时超出规定课时20%，得12分（80%）...以此类推，满分为15分；一学年授课门数（不含实习实训）大于等于3门且不超过4门，加2分', '', '未完成规定的教学工作量，每少1学时扣1分，扣完为止。不接受团队教学任务及其他任务安排，扣5分。', '备注：1、本表适用于专任教师人员。\r\n      2、总分=基础分+加分。按学期进行考核，年度评优、评先以此考核为依据。');
INSERT INTO `tb_jiaoshixiang` VALUES (2, '二', '教学组织', 5, '教学规范、认真考勤、教学设备提前准备好', '', ' ', '如有学生投诉或者相关人员教学检查发现存在教学问题，经核实属实的每次扣1分。', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (3, '三', '理论课教学质量', 5, '熟练运用云平台现代化教学工具、因材施教、课堂气氛活跃', '', ' ', '不使用云平台教学工具，扣2分', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (4, '四', '实践课教学质量', 5, '有实训任务书、有作业布置、回收和批改记录、认真巡视指导管理学生，保持机房环境整洁', '', ' ', '学生上网、打游戏、看手机、睡觉，一项扣2分', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (5, '五', '校内实训', 5, '周实习按时上传实习计划、课表、总结；有实训任务书、有作业布置和回收、认真巡视指导管理学生，借还钥匙及时、保持机房环境；认真组织学生答辩和报告批改。', '', ' ', '缺一项扣2分', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (6, '六', '校外实习实训', 10, '校外实习按时提交资料，按时上交学生实习联系情况；按规定次数到企业看望指导学生；与企业签订校外实训基地协议。', '', ' ', '不按时提交资料和学生联系资料扣1分，如不提交或缺1项扣2分；综合实习和毕业实习指导教师到企业看望学生小于3次的，每少一次扣1分。', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (7, '七', '教师参加集体活动', 10, '教师参加学院和学校组织的集体活动', '', ' ', '无故缺1次扣1分；一学期请假超过两次，没增加1次扣1分，累计扣分。', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (8, '八', '教学效果', 5, '教学效果好，得到师生一致好评', '', '学校考核为优秀（90分）以上，加5分', '被督导、教学检查人员、授课学生投诉，发生1起扣5分，累计扣分', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (9, '九', '教学事故', 10, '', '', ' ', '发生警告及以上教学事故1起扣5分，发生三级教学事故扣10分，发生二级教学事故扣15分，发生一级教学事故扣20分，累计扣分。', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (10, '十', '调停课', 10, '不调停课，尽量按规定请人代课', '', ' ', '因公且经过批准调停代课不扣分，因私且经过批准同意请老师代课每一小节课扣1分；因私且经过批准同意听课每一小节扣2分；如未经允许擅自调停代扣10分/次。', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (11, '十一', '教学检查完成情况', 5, '按时按量完成教学检查需要上交给教研室的相关资料', '', '教研室检查评价中排名前三，加2分', '缺一项扣2分', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (12, '十二', '学生评教', 5, '学生评教满意度', '', '评教得分90分以上，加2分', '评教得分60分以下，扣2分', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (13, '十三', '教师获奖', 0, '教师获得校级及以上奖励', '', '获得校级奖励一等奖加3分，获得二等奖加2，获得三等奖加1分；获得校级优秀共产党员、优秀教师等无等次区分的加2分。获得市级奖励一等奖加10分，获得二等奖加7，获得三等奖加5分；获得市级优秀共产党员、教学名师等无等次区分的加8分；获得行业协会（学会）奖励的按低一级对待。', ' ', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (14, '十四', '教学与科研成果奖', 0, '教师获得教学成果奖（含课程）、科技奖励', '', '获得校级教学和科研成果一等奖、二等奖、三等奖分别加20分、15分、10分，如由多人完成，按照学校教学科研制度比例进行分配；获得省部级教学和科研成果奖励一等奖、二等奖、三等奖分别加100、70、50分，如由多人完成，按照学校教学科研制度比例进行分配；获国家级教学和科研成果一等奖、二等奖、三等奖分别加500分、300分、100分，如由多人完成，按照学校教学科研制度比例进行分配；获得行业协会（学会）奖励的按低一级对待。', ' ', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (15, '十五', '教师论文发表', 0, '教师发表教改、科研论文', '', ' ', '教师发表教育教学改革中文核心论文加10分；发表自然科学、社会科学中文核心论文加9分；教师发表SCI一区论文加50分，SCI二区加40分，SCI 三区加30分，SCI 四去加20分，SCI国际会议加10分；教师发表EI期刊论文加 18分，EI国际会议加8分。所有期刊只奖励第1作者。', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (16, '十六', '指导学生参加技能大赛、创新创业大赛', 0, '老师积极指导学生参加技能大赛和创新创业大赛。', '', ' ', '指导学生获得省部级一等奖、二等奖、三等奖分别加50分、40分、30分，如由多人指导，按照学校教学科研制度比例进行分配，获得优秀指导教师的另加5分；指导学生获得国家级一等奖、二等奖、三等奖分别加250分、200分、150分，如由多人指导，按照学校教学科研制度比例进行分配，获得优秀指导教师的另加10分；获得行业协会（学会）奖励的按低一级对待。', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (17, '十七', '教师社会服务', 0, '教师积极开展社会服务。', '', ' ', '教师开展社会服务项目资金到学校财务指定账户且结题，每5万加10分。', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (18, '十八', '教改与科研项目', 0, '', '', ' ', '教师申报并获批国家级教改和科研项目，重大加1000分，重点500分，一般200分；教师申报并获批省部级教改和科研课题，重大项目500分，重点300分，一般100分；教师申报并获批校级教改和科研课题重点20分，一般5分；项目如由多人完成，按照学校教学科研制度比例进行分配；所有项目在立项当年兑现20%分值，项目结题兑现剩余部分。', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (19, '十九', '科研考核', 10, '完成学校规定科研考核情况', '', '学校考核结果为优秀者，加5分。', '考核结果不合格者，扣5分。', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (20, '二十', '参与重大项目建设', 5, '积极参与学校、学院重大项目建设', '', ' ', ' ', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (21, '二十一', '支教半年', 5, '教师积极参加支教活动', '', ' ', ' ', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (22, '二十二', '课程主讲教师', 0, '担任课程主讲教师', '', '担任课程主讲教师且任务完成好评价为优秀的每门课程加5分，评价为良好的每门课程加3分，评价为合格的每门课程加1分。', ' ', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (23, '二十三', '校企合作', 0, '教师积极推荐企业与学校合作（校外实训基地除外）', '', '教师每推荐一家企业与学校合作成功加5分。', ' ', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (24, '二十四', '专项工作', 0, '教师承担学院、学校专项工作', '', '教师承担学院、学校安排的专项工作每项（次）加3分，总分不超过12分。', ' ', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (25, '二十五', '专利', 0, '教师申请发明专利并授权', '', '每项发明专利加50分。', ' ', ' ');
INSERT INTO `tb_jiaoshixiang` VALUES (26, '二十六', '公开出版教材', 0, '教师公开出版教材且被学院采用', '', '每本教材加50分，如由多人完成，按照学校教学科研制度比例进行分配。', ' ', ' ');

-- ----------------------------
-- Table structure for tb_level
-- ----------------------------
DROP TABLE IF EXISTS `tb_level`;
CREATE TABLE `tb_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 职称名称ID',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '职称名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_level
-- ----------------------------
INSERT INTO `tb_level` VALUES (1, '正高职称');
INSERT INTO `tb_level` VALUES (2, '副高职称');
INSERT INTO `tb_level` VALUES (3, '中级职称');
INSERT INTO `tb_level` VALUES (4, '初级职称');
INSERT INTO `tb_level` VALUES (5, '研究生初期');
INSERT INTO `tb_level` VALUES (6, '见习期');
INSERT INTO `tb_level` VALUES (7, '其它');

-- ----------------------------
-- Table structure for tb_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名，规定为用户的工号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码，默认密码，用户工号后6位',
  `trueName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户真实姓名',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职称',
  `team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '所在团队',
  `dep` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '所在部门',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  `open` tinyint(4) DEFAULT 0 COMMENT '0：表示可以登录，1：表示禁止登录',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户个人照片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_teacher
-- ----------------------------
INSERT INTO `tb_teacher` VALUES (21, '2018800396', '0188', '兰伟', '正高职称', '软件与控制', '信息工程学院', '工作认真负责！', 0, '2018800396_兰伟\\2018800396_兰伟.jpg');
INSERT INTO `tb_teacher` VALUES (22, '2014081036', '2013081035', '段萍', '中级职称', '软件与控制', '信息工程学院', '测试', 0, '2014081036_段萍\\2014081036_段萍.JPG');
INSERT INTO `tb_teacher` VALUES (23, '1998081004', '123456', '李崇', NULL, '软件与控制', NULL, NULL, 0, NULL);
INSERT INTO `tb_teacher` VALUES (24, '2003081014', '123456', '任亮', NULL, '软件与控制', NULL, NULL, 0, NULL);
INSERT INTO `tb_teacher` VALUES (25, '2004081023', '123456', '万青', NULL, '软件与控制', NULL, NULL, 0, NULL);
INSERT INTO `tb_teacher` VALUES (26, '1999081005', '123456', '郑小蓉', NULL, '软件与控制', NULL, NULL, 0, NULL);
INSERT INTO `tb_teacher` VALUES (27, '2000081010', '123456', '谢先伟', NULL, '软件与控制', NULL, NULL, 0, NULL);
INSERT INTO `tb_teacher` VALUES (28, '2007081026', '123456', '张坤', NULL, '软件与控制', NULL, NULL, 0, NULL);
INSERT INTO `tb_teacher` VALUES (29, '2009081028', '123456', '李新', NULL, '软件与控制', NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for tb_team
-- ----------------------------
DROP TABLE IF EXISTS `tb_team`;
CREATE TABLE `tb_team`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '团队ID',
  `teamName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团队名称',
  `teamLeader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '团队负责人',
  `dep` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团队所在部门',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队类型，分为教学团队和行政团队',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_team
-- ----------------------------
INSERT INTO `tb_team` VALUES (1, '软件与控制', '谢先伟', '信息工程学院', '教学');
INSERT INTO `tb_team` VALUES (2, '网络安全', '周桐', '信息工程学院', '教学');
INSERT INTO `tb_team` VALUES (3, '应用', '邵亮', '信息工程学院', '教学');
INSERT INTO `tb_team` VALUES (4, '移动通信', '刘宇', '信息工程学院', '教学');
INSERT INTO `tb_team` VALUES (5, '学院办公室', '杨智勇', '信息工程学院', '行政');
INSERT INTO `tb_team` VALUES (6, '教务科', '唐林', '信息工程学院', '行政');
INSERT INTO `tb_team` VALUES (7, '学生科', '孙小恒', '信息工程学院', '行政');
INSERT INTO `tb_team` VALUES (8, '实训科', '罗元成', '信息工程学院', '行政');

-- ----------------------------
-- Table structure for tb_teamleader
-- ----------------------------
DROP TABLE IF EXISTS `tb_teamleader`;
CREATE TABLE `tb_teamleader`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '团队负责人主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团队负责人用户名，规定为团队负责人的工号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码，默认密码，用户工号后6位',
  `trueName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团队负责人真实姓名',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '职位',
  `managerTeam` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '管理的团队',
  `teamType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队类型，分教学和行政',
  `dep` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '所在部门',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  `open` tinyint(4) DEFAULT 0 COMMENT '0:可以登录 1:不许登录',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_teamleader
-- ----------------------------
INSERT INTO `tb_teamleader` VALUES (1, 'test', '123', '兰伟', '软件编写者', '', '教学', '信息工程学院', '二级管理员', 0, NULL);
INSERT INTO `tb_teamleader` VALUES (2, '2004012011', '123456', '杨志勇', '院长', '院办', '行政', '信息工程学院', '院长，正高，博士', 0, '');
INSERT INTO `tb_teamleader` VALUES (3, '2000081010', '123456', '谢先伟', '软件与控制团队负责人', '软件与控制', '教学', '信息工程学院', '软件团队负责人，正高级教授', 0, '');
INSERT INTO `tb_teamleader` VALUES (4, '2014202072', '123456', '周桐', '网络安全团队负责人、软件党支部书记', '网络安全', '教学', '信息工程学院', '网络安全团队负责人、软件党支部书记', 0, '');
INSERT INTO `tb_teamleader` VALUES (5, '2005081027', '123456', '邵亮', '应用团队负责人', '应用', '教学', '信息工程学院', '应用团队负责人', 0, '');
INSERT INTO `tb_teamleader` VALUES (6, '2003081022', '123456', '刘宇', '通信团队负责人', '移动通信', '教学', '信息工程学院', '通信团队负责人', 0, '');
INSERT INTO `tb_teamleader` VALUES (7, '2005082007', '123456', '唐林', '教务科长、办公室主任、应用支部书记', '教务科', '行政', '信息工程学院', '教务科长、办公室主任、应用支部书记', 0, '');
INSERT INTO `tb_teamleader` VALUES (8, '2006082010', '123456', '孙小恒', '团总支书记、学生科长、网络党支部书记', '学生科', '行政', '信息工程学院', '团总支书记、学生科长、网络党支部书记', 0, '');
INSERT INTO `tb_teamleader` VALUES (9, '2003082004', '123456', '罗元成', '实训中心主任', '实训科', '行政', '信息工程学院', '实训中心主任', 0, '');

-- ----------------------------
-- Table structure for tb_tkh
-- ----------------------------
DROP TABLE IF EXISTS `tb_tkh`;
CREATE TABLE `tb_tkh`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师考核表ID',
  `tid` int(11) DEFAULT NULL COMMENT '教师ID',
  `teacherName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '教师姓名',
  `no1_add` int(11) DEFAULT 0 COMMENT '第一项，加分（教学工作量完成情况）',
  `no1_sub` int(11) DEFAULT 0 COMMENT '第一项，减分',
  `no1_myself` int(11) DEFAULT 0 COMMENT '第一项，自评得分',
  `no1_leader` int(11) DEFAULT 0 COMMENT '第一项，团队负责人给分',
  `no1_result` int(11) DEFAULT 0 COMMENT '该项最后得分',
  `no2_add` int(11) DEFAULT 0 COMMENT '第二项，加分（教学组织）',
  `no2_sub` int(11) DEFAULT 0 COMMENT '第二项，减分',
  `no2_myself` int(11) DEFAULT 0 COMMENT '第二项，自评得分',
  `no2_leader` int(11) DEFAULT 0,
  `no2_result` int(11) DEFAULT 0 COMMENT '第二项，考核得分',
  `no3_add` int(11) DEFAULT 0 COMMENT '第三项，加分（理论课教学质量）',
  `no3_sub` int(11) DEFAULT 0 COMMENT '第三项，减分',
  `no3_myself` int(11) DEFAULT 0 COMMENT '第三项，自评得分',
  `no3_leader` int(11) DEFAULT 0,
  `no3_result` int(11) DEFAULT 0 COMMENT '第三项，考核得分',
  `no4_add` int(11) DEFAULT 0 COMMENT '第四项，加分（实践课教学质量）',
  `no4_sub` int(11) DEFAULT 0 COMMENT '第四项，减分',
  `no4_myself` int(11) DEFAULT 0 COMMENT '第四项，自评得分',
  `no4_leader` int(11) DEFAULT 0,
  `no4_result` int(11) DEFAULT 0 COMMENT '第四项，考核得分',
  `no5_add` int(11) DEFAULT 0 COMMENT '第五项，加分（校内实训）',
  `no5_sub` int(11) DEFAULT 0 COMMENT '第五项，减分',
  `no5_myself` int(11) DEFAULT 0 COMMENT '第五项，自评得分',
  `no5_leader` int(11) DEFAULT 0,
  `no5_result` int(11) DEFAULT 0 COMMENT '第五项，考核得分',
  `no6_add` int(11) DEFAULT 0 COMMENT '第六项，加分（校外实习实训）',
  `no6_sub` int(11) DEFAULT 0 COMMENT '第六项，减分',
  `no6_myself` int(11) DEFAULT 0 COMMENT '第六项，自评得分',
  `no6_leader` int(11) DEFAULT 0,
  `no6_result` int(11) DEFAULT 0 COMMENT '第六项，考核得分',
  `no7_add` int(11) DEFAULT 0 COMMENT '第七项，加分（教师参加集体活动）',
  `no7_sub` int(11) DEFAULT 0 COMMENT '第七项，减分',
  `no7_myself` int(11) DEFAULT 0 COMMENT '第七项，自评得分',
  `no7_leader` int(11) DEFAULT 0,
  `no7_result` int(11) DEFAULT 0 COMMENT '第七项，考核得分',
  `no8_add` int(11) DEFAULT 0 COMMENT '第八项，加分（教学效果）',
  `no8_sub` int(11) DEFAULT 0 COMMENT '第八项，减分',
  `no8_myself` int(11) DEFAULT 0 COMMENT '第八项，自评得分',
  `no8_leader` int(11) DEFAULT 0,
  `no8_result` int(11) DEFAULT 0 COMMENT '第八项，考核得分',
  `no9_add` int(11) DEFAULT 0 COMMENT '第九项，加分（教学事故）',
  `no9_sub` int(11) DEFAULT 0 COMMENT '第九项，减分',
  `no9_myself` int(11) DEFAULT 0 COMMENT '第九项，自评得分',
  `no9_leader` int(11) DEFAULT 0,
  `no9_result` int(11) DEFAULT 0 COMMENT '第九项，考核得分',
  `no10_add` int(11) DEFAULT 0 COMMENT '第十项，加分（调停课）',
  `no10_sub` int(11) DEFAULT 0 COMMENT '第十项，减分',
  `no10_myself` int(11) DEFAULT 0 COMMENT '第十项，自评得分',
  `no10_leader` int(11) DEFAULT 0,
  `no10_result` int(11) DEFAULT 0 COMMENT '第十项，考核得分',
  `no11_add` int(11) DEFAULT 0 COMMENT '第十一项，加分（教学检查完成情况）',
  `no11_sub` int(11) DEFAULT 0 COMMENT '第十一项，减分',
  `no11_myself` int(11) DEFAULT 0 COMMENT '第十一项，自评得分',
  `no11_leader` int(11) DEFAULT 0,
  `no11_result` int(11) DEFAULT 0 COMMENT '第十一项，考核得分',
  `no12_add` int(11) DEFAULT 0 COMMENT '第十二项，加分（学生评教）',
  `no12_sub` int(11) DEFAULT 0 COMMENT '第十二项，减分',
  `no12_myself` int(11) DEFAULT 0 COMMENT '第十二项，自评得分',
  `no12_leader` int(11) DEFAULT 0,
  `no12_result` int(11) DEFAULT 0 COMMENT '第十二项，考核得分',
  `no13_add` int(11) DEFAULT 0 COMMENT '第十三 项，加分（教师获奖）',
  `no13_sub` int(11) DEFAULT 0 COMMENT '第十三项，减分',
  `no13_myself` int(11) DEFAULT 0 COMMENT '第十三项，自评得分',
  `no13_leader` int(11) DEFAULT 0,
  `no13_result` int(11) DEFAULT 0 COMMENT '第十三项，考核得分',
  `no14_add` int(11) DEFAULT 0 COMMENT '第十四项，加分（教学与科研成果奖）',
  `no14_sub` int(11) DEFAULT 0 COMMENT '第十四项，减分',
  `no14_myself` int(11) DEFAULT 0 COMMENT '第十四项，自评得分',
  `no14_leader` int(11) DEFAULT 0 COMMENT '第十四项，团队负责人给分',
  `no14_result` int(11) DEFAULT 0 COMMENT '第十四项，考核得分',
  `no15_add` int(11) DEFAULT 0 COMMENT '第十五项，加分（教师论文发表）',
  `no15_sub` int(11) DEFAULT 0 COMMENT '第十五项，减分',
  `no15_myself` int(11) DEFAULT 0 COMMENT '第十五项，教师论文发表 自评得分',
  `no15_leader` int(11) DEFAULT 0 COMMENT '第十五项，教师论文发表 团队负责人给分',
  `no15_result` int(11) DEFAULT 0 COMMENT '第十五项，教师论文发表 考核得分',
  `no16_add` int(11) DEFAULT 0 COMMENT '第十六项，加分（指导学生参加技能大赛、创新创业大赛）',
  `no16_sub` int(11) DEFAULT 0 COMMENT '第十六项，减分',
  `no16_myself` int(11) DEFAULT 0 COMMENT '第十六项，自评得分',
  `no16_leader` int(11) DEFAULT 0,
  `no16_result` int(11) DEFAULT 0 COMMENT '第十六项，考核得分',
  `no17_add` int(11) DEFAULT 0 COMMENT '第十七项，加分（教师社会服务）',
  `no17_sub` int(11) DEFAULT 0 COMMENT '第十七项，减分',
  `no17_myself` int(11) DEFAULT 0 COMMENT '第十七项，自评得分',
  `no17_leader` int(11) DEFAULT 0,
  `no17_result` int(11) DEFAULT 0 COMMENT '第十七项，考核得分',
  `no18_add` int(11) DEFAULT 0 COMMENT '第十八项，加分（教改与科研项目）',
  `no18_sub` int(11) DEFAULT 0 COMMENT '第十八项，减分',
  `no18_myself` int(11) DEFAULT 0 COMMENT '第十八项，自评得分',
  `no18_leader` int(11) NOT NULL DEFAULT 0,
  `no18_result` int(11) DEFAULT 0 COMMENT '第十八项，考核得分',
  `no19_add` int(11) DEFAULT 0 COMMENT '第十九项，加分（科研考核）',
  `no19_sub` int(11) DEFAULT 0 COMMENT '第十九项，减分',
  `no19_myself` int(11) DEFAULT 0 COMMENT '第十九项，自评得分',
  `no19_leader` int(11) DEFAULT 0,
  `no19_result` int(11) DEFAULT 0 COMMENT '第十九项，考核得分',
  `no20_add` int(11) DEFAULT 0 COMMENT '第二十项，加分（参与重大项目建设）',
  `no20_sub` int(11) DEFAULT 0 COMMENT '第二十项，减分',
  `no20_myself` int(11) DEFAULT 0 COMMENT '第二十项，自评得分',
  `no20_leader` int(11) DEFAULT 0,
  `no20_result` int(11) DEFAULT 0 COMMENT '第二十项，考核得分',
  `no21_add` int(11) DEFAULT 0 COMMENT '第二十一项，加分（支教半年）',
  `no21_sub` int(11) DEFAULT 0 COMMENT '第二十一项，减分',
  `no21_myself` int(11) DEFAULT 0 COMMENT '第二十一项，自评得分',
  `no21_leader` int(11) DEFAULT 0,
  `no21_result` int(11) DEFAULT 0 COMMENT '第二十一项，考核得分',
  `no22_add` int(11) DEFAULT 0 COMMENT '第二十二项，加分（课程主讲教师）',
  `no22_sub` int(11) DEFAULT 0 COMMENT '第二十二项，减分',
  `no22_myself` int(11) DEFAULT 0 COMMENT '第二十二项，自评得分',
  `no22_leader` int(11) DEFAULT 0,
  `no22_result` int(11) DEFAULT 0 COMMENT '第二十二项，考核得分',
  `no23_add` int(11) DEFAULT 0 COMMENT '第二十三项，加分（校企合作）',
  `no23_sub` int(11) DEFAULT 0 COMMENT '第二十三项，减分',
  `no23_myself` int(11) DEFAULT 0 COMMENT '第二十三项，自评得分',
  `no23_leader` int(11) DEFAULT NULL,
  `no23_result` int(11) DEFAULT 0 COMMENT '第二十四项，考核得分',
  `no24_add` int(11) DEFAULT 0 COMMENT '第二十四项，加分（专项工作）',
  `no24_sub` int(11) DEFAULT 0 COMMENT '第二十四项，减分',
  `no24_myself` int(11) DEFAULT 0 COMMENT '第二十四项，自评得分',
  `no24_leader` int(11) DEFAULT 0,
  `no24_result` int(11) DEFAULT 0 COMMENT '第二十四，考核得分',
  `no25_add` int(11) DEFAULT 0 COMMENT '第二十五项，加分（专利）',
  `no25_sub` int(11) DEFAULT 0 COMMENT '第二十五项，减分',
  `no25_myself` int(11) DEFAULT 0 COMMENT '第二十五项，自评得分',
  `no25_leader` int(11) DEFAULT 0,
  `no25_result` int(11) DEFAULT 0 COMMENT '第二十五项，考核得分',
  `no26_add` int(11) DEFAULT 0 COMMENT '第二十六项，加分（公开出版教材）',
  `no26_sub` int(11) DEFAULT 0 COMMENT '第二十六项，减分',
  `no26_myself` int(11) DEFAULT 0 COMMENT '第二十六项，自评得分',
  `no26_leader` int(11) DEFAULT 0,
  `no26_result` int(11) DEFAULT 0 COMMENT '第二十六项，考核得分',
  `total_myself` int(11) DEFAULT 0 COMMENT '教师自评总得分',
  `total_leader` int(11) DEFAULT 0 COMMENT '团队负责人给教师最终得分',
  `total_result` int(11) DEFAULT 0 COMMENT '领导确认后教师最终得分',
  `khTime_myself` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '教师自评时间',
  `khTime_leader` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '团队负责人给教师打分时间',
  `khTime_result` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '领导确认时间',
  `no1_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no1_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no1_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no2_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项2教师自评备注',
  `no2_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项2团队负责人给的备注',
  `no2_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项2院级领导给的备注',
  `no3_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项3教师自评备注',
  `no3_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项3团队负责人给的备注',
  `no3_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项3院级领导给的备注',
  `no4_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项4教师自评备注',
  `no4_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项4团队负责人给的备注',
  `no4_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项4院级领导给的备注',
  `no5_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项5教师自评备注',
  `no5_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项5团队负责人给的备注',
  `no5_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项5院级领导给的备注',
  `no6_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no6_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no6_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no7_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no7_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no7_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no8_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no8_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no8_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no9_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no9_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no9_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no10_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no10_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no10_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no11_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no11_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no11_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no12_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no12_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no12_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no13_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no13_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no13_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no14_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no14_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no14_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no15_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no15_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no15_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no16_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no16_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no16_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no17_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no17_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no17_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no18_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no18_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no18_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no19_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no19_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no19_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no20_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no20_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no20_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no21_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no21_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no21_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no22_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no22_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no22_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no23_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no23_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no23_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no24_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no24_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no24_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no25_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no25_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no25_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no26_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no26_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no26_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项26院级领导给的备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_tkh
-- ----------------------------
INSERT INTO `tb_tkh` VALUES (1, 1, '兰伟', 0, 0, 150, 50, 0, 0, 0, 52, 0, 0, 0, 0, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 321, 0, 0, 0, 0, 0, 150, 0, 0, 0, 500, 333, 0, 1490, 638, 0, '2019-02-20 23:20:18', '2019-02-20 23:23:10', NULL, ' 未完成规定的教学工作量          ', ' 不接受团队教学任务及其他任务安排，扣5分。               ', '', ' 相关人员教学检查发现存在教学问题          ', '                ', '', ' 不使用云平台教学工具，扣2分          ', '                ', '', '           ', '                ', '', '           ', '                ', '', '   实习指导教师到企业看望学生小于3次的，每少一次扣1分。        ', '                ', '', '           ', '                ', '', '           ', '                ', '', '           ', '                ', '', '           ', '                ', '', '           ', ' 缺一项扣2分               ', '', '           ', '                ', '', '           ', '                ', '', '           ', '                ', '', '       师发表教育教学改革中文核心论文加10分；发表自然科学、社会科学中文核心论文加9分；教师发表SCI一区论文加50分，SCI二    ', '                ', '', '           ', '                ', '', '           ', '                ', '', '           ', '                ', '', '           ', '                ', '', '           ', '                ', '', '           ', '                ', '', '           ', '                ', '', '           ', '                ', '', '    教师承担学院、学校安排的专项工作每项（次       ', '                ', '', '   每项发明专利加50分。         ', '                ', '', ' 每本教材加50分，          ', ' 每本教材加50分，如由多人完成，按照学校教               ', '');
INSERT INTO `tb_tkh` VALUES (3, 2, '张三', 0, 0, 15, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 33, 0, 0, 0, 0, 5000, 0, 35, 5058, 0, '2019-01-30 11:57:46', '2019-02-21 12:35:56', NULL, '完成规定的教学工作量，每少1学时扣1', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '教师承担学院、', '   ', '', '', '   ', '', '', '   ', '');
INSERT INTO `tb_tkh` VALUES (4, 3, '段萍', 0, 0, 50, 20, 0, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 120, 0, 0, 0, 540, 1005, 0, 679, 1145, 0, '2019-02-20 12:29:44', '2019-02-20 23:25:58', NULL, ' ', ' 工作量     ', '', '学检查发现存在教学问题，经 ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', '4444 ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', ' ', '      ', '', '如由多人完成，按照学校教学科研制度比例进行分配。  ', '      ', '');
INSERT INTO `tb_tkh` VALUES (5, 20, '郑小蓉', 0, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 700, 0, 0, '2019-02-21 19:11:12', NULL, NULL, ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' 教师每推荐一家企业与学校合作成功加5分。', '', '', ' ', '', '', ' ', '', '', ' ', '', '');
INSERT INTO `tb_tkh` VALUES (6, 17, '2佾', 0, 0, 0, 8, 0, 0, 0, 0, 8, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 44, 0, 0, 380, 0, NULL, '2019-02-21 23:09:40', NULL, '', '  ', '', '', '  ', '', '', '  ', '', '', '  ', '', '', '  ', '', '', '  ', '', '', '  ', '', '', '  ', '', '', '  ', '', '', '  ', '', '', '  ', '', '', '  ', '', '', '  ', '', '', '  ', '', '', 'SCI国际会议加10分；教师发表EI期刊论文加 18分，EI国际会议加8分。所有期刊只奖励第1作者。  ', '', '', 'SCI国际会议加10分；教师发表EI期刊论文加 18分，EI国际会议加8分。所有期刊只奖励第1作者。  ', '', '', 'SCI国际会议加10分；教师发表EI期刊论文加 18分，EI国际会议加8分。所有期刊只奖励第1作者。  ', '', '', 'SCI国际会议加10分；教师发表EI期刊论文加 18分，EI国际会议加8分。所有期刊只奖励第1作者。  ', '', '', 'SCI国际会议加10分；教师发表EI期刊论文加 18分，EI国际会议加8分。所有期刊只奖励第1作者。  ', '', '', 'SCI国际会议加10分；教师发表EI期刊论文加 18分，EI国际会议加8分。所有期刊只奖励第1作者。  ', '', '', 'SCI国际会议加10分；教师发表EI期刊论文加 18分，EI国际会议加8分。所有期刊只奖励第1作者。  ', '', '', '担任课程主讲教师且任务完成好评价为优秀的每门课程加5分，评价为良好的每门课程加3分，评价为合格的每门课程加1分。  ', '', '', '担任课程主讲教师且任务完成好评价为优秀的每门课程加5分，评价为良好的每门课程加3分，评价为合格的每门课程加1分。  ', '', '', '担任课程主讲教师且任务完成好评价为优秀的每门课程加5分，评价为良好的每门课程加3分，评价为合格的每门课程加1分。  ', '', '', '担任课程主讲教师且任务完成好评价为优秀的每门课程加5分，评价为良好的每门课程加3分，评价为合格的每门课程加1分。  ', '', '', '  ', '');
INSERT INTO `tb_tkh` VALUES (7, 15, 'sss', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 200, 0, NULL, '2019-02-21 23:36:25', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0、70、50分，如由多人完成，按照学校教学科研制度比例进行分配；获国家级教学和科研成果一等奖、', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `tb_tkh` VALUES (8, 21, '兰伟', 0, 0, 50, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 200, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 200, 0, 0, 590, 0, 0, '2019-02-22 20:59:39', NULL, NULL, '扣1分，扣完为止。不接受团队教学 ', '', '', '如有学生投诉或者相关人员教学检查发现存在教学问题，经核实属实的每次扣1分。 ', '', '', ' ', '', '', '学生上网、打游戏、看手机、睡觉，一项扣2分 ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', '三等奖分别加250分、200分、150 ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' ', '', '', ' 教师申请发明专利并授权  ', '', '', '每本教材加50分，如由多人完成，按照学校教学科研制度比例进行分配。 ', '', '');
INSERT INTO `tb_tkh` VALUES (9, 22, '段萍', 0, 0, 20, 18, 0, 0, 0, 5, 5, 0, 0, 0, 5, 5, 0, 0, 0, 5, 5, 0, 0, 0, 5, 0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 45, 47, 0, '2019-02-23 09:01:05', '2019-02-23 09:09:05', NULL, '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '按时提交', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', '   ', '', '', ' 测试  ', '');
INSERT INTO `tb_tkh` VALUES (10, 23, '李崇', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2019-02-23 09:09:21', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `tb_tkh` VALUES (11, 27, '谢先伟', 0, 0, 0, 20, 0, 0, 0, 0, 5, 0, 0, 0, 0, 5, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35, 0, NULL, '2019-02-23 09:10:08', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for tb_tprizeupload
-- ----------------------------
DROP TABLE IF EXISTS `tb_tprizeupload`;
CREATE TABLE `tb_tprizeupload`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tId` int(11) DEFAULT NULL COMMENT '教师Id',
  `tPrizePic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '获奖照片名称',
  `tPrizeType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '获奖类型',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_tprizeupload
-- ----------------------------
INSERT INTO `tb_tprizeupload` VALUES (19, 1, 'lw_兰伟\\01 EI论文.pdf', '14', NULL);
INSERT INTO `tb_tprizeupload` VALUES (21, 1, 'lw_兰伟\\01 申报人身份证复印件.pdf', '22', NULL);
INSERT INTO `tb_tprizeupload` VALUES (22, 1, 'lw_兰伟\\16-17 指导青年教师情况.pdf', '17', NULL);
INSERT INTO `tb_tprizeupload` VALUES (23, 1, 'lw_兰伟\\12 《电子商务基础》.pdf', '16', NULL);
INSERT INTO `tb_tprizeupload` VALUES (24, 1, 'lw_兰伟\\24  学校体育道德风尚奖复印件.pdf', '18', NULL);
INSERT INTO `tb_tprizeupload` VALUES (25, 1, 'lw_兰伟\\27  评建工作先进个人三等奖证书复印件.pdf', '19', NULL);
INSERT INTO `tb_tprizeupload` VALUES (26, 1, 'lw_兰伟\\一种新型高防护通信光纤配电箱（实用新型专利）.pdf', '20', NULL);
INSERT INTO `tb_tprizeupload` VALUES (29, 1, 'lw_兰伟\\03 《改进shearlet变换耦合频率特征的多聚焦图像融合算法》.pdf', '24', NULL);
INSERT INTO `tb_tprizeupload` VALUES (32, 1, 'lw_兰伟\\11 《JSP网站建设项目实战》.pdf', '26', NULL);
INSERT INTO `tb_tprizeupload` VALUES (35, 1, 'lw_兰伟\\16-17 教学效果.pdf', '19', NULL);
INSERT INTO `tb_tprizeupload` VALUES (38, 1, 'lw_兰伟\\03 《借鉴德国双元制职教模式探索具有重庆特色的双元制职业教育》.pdf', '23', NULL);
INSERT INTO `tb_tprizeupload` VALUES (40, 1, 'lw_兰伟\\《新型装饰材料生产线控制系统的设计》.pdf', '13', NULL);
INSERT INTO `tb_tprizeupload` VALUES (41, 20, '1999081005_郑小蓉\\01 EI论文.pdf', '13', NULL);
INSERT INTO `tb_tprizeupload` VALUES (42, 20, '1999081005_郑小蓉\\01《高职院校创新创业教育实施路径研究》.pdf', '13', NULL);
INSERT INTO `tb_tprizeupload` VALUES (44, 20, '1999081005_郑小蓉\\12 2017年专业技术人员继续教育公需科目成绩合格单复印件.pdf', '15', NULL);
INSERT INTO `tb_tprizeupload` VALUES (46, 20, '1999081005_郑小蓉\\《新型装饰材料生产线控制系统的设计》.pdf', '16', NULL);
INSERT INTO `tb_tprizeupload` VALUES (47, 20, '1999081005_郑小蓉\\“第三届教师说课大赛”二等奖.pdf', '23', NULL);
INSERT INTO `tb_tprizeupload` VALUES (48, 20, '1999081005_郑小蓉\\02 《引入ETC软件人才培训模式到高职计算机专业教学研究》.pdf', '24', NULL);
INSERT INTO `tb_tprizeupload` VALUES (49, 20, '1999081005_郑小蓉\\03 《改进shearlet变换耦合频率特征的多聚焦图像融合算法》.pdf', '26', NULL);
INSERT INTO `tb_tprizeupload` VALUES (52, 21, '2018800396_兰伟\\1.2.2-1  信息工程系专业指导委员会专家信息表.pdf', '19', NULL);
INSERT INTO `tb_tprizeupload` VALUES (54, 21, '2018800396_兰伟\\ajax基础教程.pdf', '14', NULL);
INSERT INTO `tb_tprizeupload` VALUES (55, 21, '2018800396_兰伟\\javascript_dom综合案例教学.ppt', '16', NULL);
INSERT INTO `tb_tprizeupload` VALUES (56, 21, '2018800396_兰伟\\Jquery特效.pdf', '21', NULL);
INSERT INTO `tb_tprizeupload` VALUES (57, 21, '2018800396_兰伟\\15天学会jquery(完整版).pdf', '25', NULL);
INSERT INTO `tb_tprizeupload` VALUES (58, 21, '2018800396_兰伟\\huoban_03_r1_c8.gif', '13', NULL);
INSERT INTO `tb_tprizeupload` VALUES (60, 22, '2014081036_段萍\\软件工程与团队开发课程标准.pdf', '13', NULL);

-- ----------------------------
-- Table structure for tb_xingzheng
-- ----------------------------
DROP TABLE IF EXISTS `tb_xingzheng`;
CREATE TABLE `tb_xingzheng`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名，规定为用户的工号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码，默认密码，用户工号后6位',
  `trueName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户真实姓名',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '职称',
  `team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '所在团队',
  `dep` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '所在部门',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '个人标准照',
  `open` int(1) DEFAULT 0 COMMENT '根限开放，0开放，1关闭',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_xingzheng
-- ----------------------------
INSERT INTO `tb_xingzheng` VALUES (12, '2009082017', '123456', '李青野', '中级职称', '教务科', '信息工程学院', 'null', '2009082017_李青野\\2009082017_李青野.jpg', 0);

-- ----------------------------
-- Table structure for tb_xingzhengxiang
-- ----------------------------
DROP TABLE IF EXISTS `tb_xingzhengxiang`;
CREATE TABLE `tb_xingzhengxiang`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '行政人员ID',
  `khNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考核项汉字编号',
  `khName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '考核项',
  `khValue` int(11) DEFAULT 0 COMMENT '基础分值',
  `khStandard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '考核说明',
  `khSubScore1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '减分项1',
  `khSubScore2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '减分项2',
  `khSubScore3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '减分项3',
  `khSubScore4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '减分项4',
  `khSubScore5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '减分项5',
  `khAddScore1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项1',
  `khAddScore2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项2',
  `khAddScore3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项3',
  `khAddScore4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项4',
  `khAddScore5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项5',
  `khAddScore6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项6',
  `khAddScore7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项7',
  `khAddScore8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项8',
  `khAddScore9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项9',
  `khAddScore10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项10',
  `khAddScore11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项11',
  `khAddScore12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项12',
  `khAddScore13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项13',
  `khAddScore14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项14',
  `khAddScore15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项15',
  `khAddScore16` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项16',
  `khAddScore17` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项17',
  `khAddScore18` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项18',
  `khAddScore19` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项19',
  `khAddScore20` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加分项20',
  `khNote` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_xingzhengxiang
-- ----------------------------
INSERT INTO `tb_xingzhengxiang` VALUES (1, '一', '履行\r\n岗位\r\n职责\r\n情况', 30, '说明：能按领导要求的时间节点完成工作任务，职责履行到位，工作质量高，效率高，没有发生任何差错或事故。出现下列情况作扣分处理：', '接受工作任务，但未按时完成，一再拖延或推诿。一次扣5分。', '不服从领导指令，严重影响工作进度或工作发生重大差错重大事故，一次扣10分。', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `tb_xingzhengxiang` VALUES (2, '二', '考勤\r\n情况', 20, '说明：本学期全勤为满分，请假手续以有分管领导签字的纸质请假条为准。出现下列情况作扣分处理：', '因私向领导口头请假但未完成纸质请假手续一次扣2分。', '完成手续的情况下，因私请假三天及以上（请假天数参照学校年度考核要求）扣5分。', '无故迟到早退一次扣5分。', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_xingzhengxiang` VALUES (3, '三', '职业\r\n道德', 30, '说明：对自已要求严格，能自觉地遵守国家法规和学校的规章制度，工作态度好。出现下列情况作扣分处理：', '工作懈怠，不能严格要求自己，上班时间玩网游、看电影、网购一次扣5分。', '被服务对象投诉的；自由散漫，打架、吵架，情节严重，造成严重后果者一次扣5分。', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_xingzhengxiang` VALUES (4, '四', '组织\r\n参加\r\n活动', 20, '说明：积极组织并参加学校及学院活动、会议、值班，无缺席。出现下列情况作扣分处理：', '活动中，不认真和不按要求完成任务现象，迟到、早退一次扣5分。', '活动中，不能认真完成任务，并造成严重影响一次扣10分。', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_xingzhengxiang` VALUES (5, '五', '教学任务', 5, NULL, '每学期完成系数前40学时教学任务得5分，不足40学时扣5分。', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_xingzhengxiang` VALUES (6, '六', '加分\r\n项目', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '认真完成本职工作的基础上，接受领导安排的其他工作任务，每完成一项加5分。', '有创新的工作思路和方法经应用后有明显成效加5分。', '获得校级教学和科研成果一等奖、二等奖、三等奖分别加20分、15分、10分，如由多人完成，按照学校教学科研制度比例进行分配；获得省部级教学和科研成果奖励一等奖、二等奖、三等奖分别加100、70、50分，如由多人完成，按照学校教学科研制度比例进行分配；获国家级教学和科研成果一等奖、二等奖、三等奖分别加500分、300分、100分，如由多人完成，按照学校教学科研制度比例进行分配；获得行业协会（学会）奖励的按低一级对待。', '学校科研考核为优秀（90分）以上，加5分', '获得校级奖励一等奖加3分，获得二等奖加2，获得三等奖加1分；获得校级优秀共产党员、优秀教师等无等次区分的加2分。获得市级奖励一等奖加10分，获得二等奖加7，获得三等奖加5分；获得市级优秀共产党员、教学名师等无等次区分的加8分；获得行业协会（学会）奖励的按低一级对待。', '参与并认真完成学校重大事项抽调工作加5分。', '教师开展社会服务项目资金到学校财务指定账户且结题，每5万加10分。', '申报并获批国家级教改和科研项目，重大加100分，重点70分，一般60分；教师申报并获批省部级教改和科研课题，重大项目55分，重点40分，一般30分；教师申报并获批校级教改和科研课题重点10分，一般5分；项目如由多人完成，按照学校教学科研制度比例进行分配；所有项目在立项当年兑现20%分值，项目结题兑现剩余部分。', '指导学生获得省部级一等奖、二等奖、三等奖分别加30分、20分、10分，如由多人指导，按照学校教学科研制度比例进行分配，获得优秀指导教师的另加5分；指导学生获得国家级一等奖、二等奖、三等奖分别加80分、70分、40分，如由多人指导，按照学校教学科研制度比例进行分配，获得优秀指导教师的另加10分；获得行业协会（学会）奖励的按低一级对待。', '担任课程主讲教师且完成各项任务，评价为优秀的每门课程加5分，评价为良好的每门课程加3分，评价为合格的每门课程加1分。', '公开出版教材每本加50分，如由多人完成，按照学校教学科研制度比例进行分配。', '发表教育教学改革中文核心论文加10分；发表自然科学、社会科学中文核心论文加9分；教师发表SCI一区论文加50分，SCI二区加40分，SCI 三区加30分，SCI 四去加20分，SCI国际会议加10分；教师发表EI期刊论文加 18分，EI国际会议加8分。所有期刊只奖励第1作者。', '教师每推荐一家企业与学校合作成功（签订合作协议）加5分。', '以第一作者申请发明专利并授权加50分。', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_xkh
-- ----------------------------
DROP TABLE IF EXISTS `tb_xkh`;
CREATE TABLE `tb_xkh`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '行政考核ID',
  `xid` int(11) DEFAULT NULL COMMENT '行政人员id',
  `xingzhengName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '行政人员姓名',
  `kh1_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh1_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh1_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh2_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh2_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh2_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh3_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh3_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh3_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh4_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh4_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh4_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh5_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh5_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh5_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh6_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh6_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh6_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh7_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh7_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh7_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh8_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh8_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh8_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh9_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh9_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh9_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh10_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh10_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh10_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh11_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh11_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh11_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh12_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh12_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh12_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh13_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh13_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh13_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh14_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh14_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh14_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh15_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh15_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh15_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh16_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh16_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh16_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh17_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh17_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh17_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh18_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh18_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh18_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh19_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh19_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh19_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh20_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh20_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh20_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh21_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh21_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh21_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh22_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh22_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh22_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh23_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh23_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh23_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `kh24_myself` int(11) DEFAULT 0 COMMENT '考核子项n自评得分',
  `kh24_team` int(11) DEFAULT 0 COMMENT '考核子项n团队负责人打分',
  `kh24_admin` int(11) DEFAULT 0 COMMENT '考核子项n 院级领导打分',
  `total_myself` int(11) DEFAULT 0 COMMENT '最终自评得分',
  `total_team` int(11) DEFAULT 0 COMMENT '最终团队负责人打分',
  `total_admin` int(11) DEFAULT 0 COMMENT '最终院级领导打分',
  `kh1Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh1Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh1Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh2Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh2Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh2Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh3Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh3Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh3Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh4Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh4Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh4Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh5Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh5Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh5Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh6Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh6Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh6Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh7Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh7Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh7Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh8Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh8Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh8Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh9Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh9Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh9Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh10Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh10Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh10Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh11Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh11Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh11Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh12Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh12Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh12Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh13Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh13Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh13Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh14Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh14Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh14Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh15Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh15Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh15Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh16Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh16Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh16Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh17Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh17Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh17Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh18Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh18Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh18Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh19Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh19Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh19Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh20Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh20Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh20Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh21Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh21Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh21Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh22Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh22Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh22Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh23Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh23Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh23Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  `kh24Note_myself` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考核项自评备注',
  `kh24Note_team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人打分备注',
  `kh24Note_admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二级学院院领导打分备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_xkh
-- ----------------------------
INSERT INTO `tb_xkh` VALUES (2, 9, '李青野', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 44, 0, 0, 33, 0, 0, 77, 0, 0, '一再拖延或推诿。一次扣5分。', '', '', '一再拖延或推诿。一次扣5分。', '', '', '一再拖延或推诿。一次扣5分。', '', '', '一再拖延或推诿。一次扣5分。', '', '', '一再拖延或推诿。一次扣5分。', '', '', '', '', '', '', '', '', '一再拖延或推诿。一次扣5分。', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '一再拖延或推诿。一次扣5分。', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '一再拖延或推诿。一次扣5分。', '', '', '', '', '', '', '', '', '一再拖延或推诿。一次扣5分。', '', '', '', '', '', '一再拖延或推诿。一次扣5分。', '', '', '一再拖延或推诿。一次扣5分。', '', '');
INSERT INTO `tb_xkh` VALUES (3, 1, '李青野', 0, -7, 0, 0, 0, 0, 0, -88, 0, 0, -7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 50, 0, 0, 622, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 707, 0, '', '	接受工作任务，但未按时完成，一再拖延或推诿。一次扣5分', '', '', '', '', '', '但未完成纸质请假手续一次扣2分', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '获国家级教学和科研成果一等奖、二等奖、 三等奖分别加500分、300分、100分，如由多人完成，按照学校教学科研制度比例进行分配； 获得行业协会（学会）奖励的按低一级对待。', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `tb_xkh` VALUES (4, 2, '秦穆公', 0, -9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '申报并获批国家级教改和科研项目，重大加100分，重点70分，一般60分；教师申报并获批省部级教改和科研课题，重大项目55分， 重点40分，一般30分； 教师申报并获批校级教改和科研课题重点10分，一般5分；项目如由多人完成，按照学校教学科研制度比例进行分配； 所有项目在立项当年兑现20%分值，项目结题兑现剩余部分。', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `tb_xkh` VALUES (5, 8, 'sdfasd', 0, -9, 0, 0, -5, 0, 0, -6, 0, 0, -3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 577, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '校重大事项抽调工作加5分', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `tb_xkh` VALUES (6, 12, '李青野', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 140, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '校教学科研制度比例进行分配； 所有项目在立项当年兑现20%分值，项目结题兑现剩余部分。', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for tb_xprizeupload
-- ----------------------------
DROP TABLE IF EXISTS `tb_xprizeupload`;
CREATE TABLE `tb_xprizeupload`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xId` int(11) DEFAULT NULL COMMENT '行政人员Id',
  `xPrizePic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '行政人员获奖照片名称',
  `xPrizeType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '行政人员获奖类型',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '行政人员备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_xprizeupload
-- ----------------------------
INSERT INTO `tb_xprizeupload` VALUES (44, 1, 'li_李青野\\《新型装饰材料生产线控制系统的设计》.pdf', '13', NULL);
INSERT INTO `tb_xprizeupload` VALUES (45, 1, 'li_李青野\\02 重庆市教育信息化专家证明材料复印件.pdf', '14', NULL);
INSERT INTO `tb_xprizeupload` VALUES (46, 1, 'li_李青野\\16-17 教学效果.pdf', '23', NULL);
INSERT INTO `tb_xprizeupload` VALUES (47, 1, 'li_李青野\\02 《基于图像定位与轮廓检测的喷墨宽度测量算法》.pdf', '15', NULL);
INSERT INTO `tb_xprizeupload` VALUES (48, 1, 'li_李青野\\第十八届全国教育教学信息化大奖赛高等教育组精品开放课程二等奖（精品资源共享课）.pdf', '21', NULL);
INSERT INTO `tb_xprizeupload` VALUES (49, 1, 'li_李青野\\03 《改进shearlet变换耦合频率特征的多聚焦图像融合算法》.pdf', '24', NULL);
INSERT INTO `tb_xprizeupload` VALUES (50, 9, '2009082017_李青野\\01 EI论文.pdf', '13', NULL);
INSERT INTO `tb_xprizeupload` VALUES (54, 9, '2009082017_李青野\\03 《借鉴德国双元制职教模式探索具有重庆特色的双元制职业教育》.pdf', '15', NULL);
INSERT INTO `tb_xprizeupload` VALUES (55, 12, '2009082017_李青野\\huoban_03_r1_c7.gif', '13', NULL);

SET FOREIGN_KEY_CHECKS = 1;

//院级领导人表
CREATE TABLE `tb_collegeleader`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '院级负责人主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '院级负责人用户名，规定为院级负责人的工号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码，默认密码，用户工号后6位',
  `trueName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '院级负责人真实姓名',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '职位',
  `teamType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '学院类型，分教学和行政',
  `dep` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '所在部门',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  `open` tinyint(4) DEFAULT 0 COMMENT '0:可以登录 1:不许登录',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '团队负责人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

INSERT INTO `tb_collegeleader` VALUES (2, '2004012011', '123456', '杨志勇', '院长', '行政', '信息工程学院', '院长，正高，博士', 0, '');

//团队负责人考核表
CREATE TABLE `tb_teamleaderkh`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '团队负责人考核表ID',
  `teamleaderid` int(11) DEFAULT NULL COMMENT '团队负责人ID',
  `teamleaderName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '团队负责人姓名',
  `no1_add` int(11) DEFAULT 0 COMMENT '第一项，加分（教学工作量完成情况）',
  `no1_sub` int(11) DEFAULT 0 COMMENT '第一项，减分',
  `no1_myself` int(11) DEFAULT 0 COMMENT '第一项，自评得分',
  `no1_leader` int(11) DEFAULT 0 COMMENT '第一项，团队负责人给分',
  `no1_result` int(11) DEFAULT 0 COMMENT '该项最后得分',
  `no2_add` int(11) DEFAULT 0 COMMENT '第二项，加分（教学组织）',
  `no2_sub` int(11) DEFAULT 0 COMMENT '第二项，减分',
  `no2_myself` int(11) DEFAULT 0 COMMENT '第二项，自评得分',
  `no2_leader` int(11) DEFAULT 0,
  `no2_result` int(11) DEFAULT 0 COMMENT '第二项，考核得分',
  `no3_add` int(11) DEFAULT 0 COMMENT '第三项，加分（理论课教学质量）',
  `no3_sub` int(11) DEFAULT 0 COMMENT '第三项，减分',
  `no3_myself` int(11) DEFAULT 0 COMMENT '第三项，自评得分',
  `no3_leader` int(11) DEFAULT 0,
  `no3_result` int(11) DEFAULT 0 COMMENT '第三项，考核得分',
  `no4_add` int(11) DEFAULT 0 COMMENT '第四项，加分（实践课教学质量）',
  `no4_sub` int(11) DEFAULT 0 COMMENT '第四项，减分',
  `no4_myself` int(11) DEFAULT 0 COMMENT '第四项，自评得分',
  `no4_leader` int(11) DEFAULT 0,
  `no4_result` int(11) DEFAULT 0 COMMENT '第四项，考核得分',
  `no5_add` int(11) DEFAULT 0 COMMENT '第五项，加分（校内实训）',
  `no5_sub` int(11) DEFAULT 0 COMMENT '第五项，减分',
  `no5_myself` int(11) DEFAULT 0 COMMENT '第五项，自评得分',
  `no5_leader` int(11) DEFAULT 0,
  `no5_result` int(11) DEFAULT 0 COMMENT '第五项，考核得分',
  `no6_add` int(11) DEFAULT 0 COMMENT '第六项，加分（校外实习实训）',
  `no6_sub` int(11) DEFAULT 0 COMMENT '第六项，减分',
  `no6_myself` int(11) DEFAULT 0 COMMENT '第六项，自评得分',
  `no6_leader` int(11) DEFAULT 0,
  `no6_result` int(11) DEFAULT 0 COMMENT '第六项，考核得分',
  `no7_add` int(11) DEFAULT 0 COMMENT '第七项，加分（教师参加集体活动）',
  `no7_sub` int(11) DEFAULT 0 COMMENT '第七项，减分',
  `no7_myself` int(11) DEFAULT 0 COMMENT '第七项，自评得分',
  `no7_leader` int(11) DEFAULT 0,
  `no7_result` int(11) DEFAULT 0 COMMENT '第七项，考核得分',
  `no8_add` int(11) DEFAULT 0 COMMENT '第八项，加分（教学效果）',
  `no8_sub` int(11) DEFAULT 0 COMMENT '第八项，减分',
  `no8_myself` int(11) DEFAULT 0 COMMENT '第八项，自评得分',
  `no8_leader` int(11) DEFAULT 0,
  `no8_result` int(11) DEFAULT 0 COMMENT '第八项，考核得分',
  `no9_add` int(11) DEFAULT 0 COMMENT '第九项，加分（教学事故）',
  `no9_sub` int(11) DEFAULT 0 COMMENT '第九项，减分',
  `no9_myself` int(11) DEFAULT 0 COMMENT '第九项，自评得分',
  `no9_leader` int(11) DEFAULT 0,
  `no9_result` int(11) DEFAULT 0 COMMENT '第九项，考核得分',
  `no10_add` int(11) DEFAULT 0 COMMENT '第十项，加分（调停课）',
  `no10_sub` int(11) DEFAULT 0 COMMENT '第十项，减分',
  `no10_myself` int(11) DEFAULT 0 COMMENT '第十项，自评得分',
  `no10_leader` int(11) DEFAULT 0,
  `no10_result` int(11) DEFAULT 0 COMMENT '第十项，考核得分',
  `no11_add` int(11) DEFAULT 0 COMMENT '第十一项，加分（教学检查完成情况）',
  `no11_sub` int(11) DEFAULT 0 COMMENT '第十一项，减分',
  `no11_myself` int(11) DEFAULT 0 COMMENT '第十一项，自评得分',
  `no11_leader` int(11) DEFAULT 0,
  `no11_result` int(11) DEFAULT 0 COMMENT '第十一项，考核得分',
  `no12_add` int(11) DEFAULT 0 COMMENT '第十二项，加分（学生评教）',
  `no12_sub` int(11) DEFAULT 0 COMMENT '第十二项，减分',
  `no12_myself` int(11) DEFAULT 0 COMMENT '第十二项，自评得分',
  `no12_leader` int(11) DEFAULT 0,
  `no12_result` int(11) DEFAULT 0 COMMENT '第十二项，考核得分',
  `no13_add` int(11) DEFAULT 0 COMMENT '第十三 项，加分（教师获奖）',
  `no13_sub` int(11) DEFAULT 0 COMMENT '第十三项，减分',
  `no13_myself` int(11) DEFAULT 0 COMMENT '第十三项，自评得分',
  `no13_leader` int(11) DEFAULT 0,
  `no13_result` int(11) DEFAULT 0 COMMENT '第十三项，考核得分',
  `no14_add` int(11) DEFAULT 0 COMMENT '第十四项，加分（教学与科研成果奖）',
  `no14_sub` int(11) DEFAULT 0 COMMENT '第十四项，减分',
  `no14_myself` int(11) DEFAULT 0 COMMENT '第十四项，自评得分',
  `no14_leader` int(11) DEFAULT 0 COMMENT '第十四项，团队负责人给分',
  `no14_result` int(11) DEFAULT 0 COMMENT '第十四项，考核得分',
  `no15_add` int(11) DEFAULT 0 COMMENT '第十五项，加分（教师论文发表）',
  `no15_sub` int(11) DEFAULT 0 COMMENT '第十五项，减分',
  `no15_myself` int(11) DEFAULT 0 COMMENT '第十五项，教师论文发表 自评得分',
  `no15_leader` int(11) DEFAULT 0 COMMENT '第十五项，教师论文发表 团队负责人给分',
  `no15_result` int(11) DEFAULT 0 COMMENT '第十五项，教师论文发表 考核得分',
  `no16_add` int(11) DEFAULT 0 COMMENT '第十六项，加分（指导学生参加技能大赛、创新创业大赛）',
  `no16_sub` int(11) DEFAULT 0 COMMENT '第十六项，减分',
  `no16_myself` int(11) DEFAULT 0 COMMENT '第十六项，自评得分',
  `no16_leader` int(11) DEFAULT 0,
  `no16_result` int(11) DEFAULT 0 COMMENT '第十六项，考核得分',
  `no17_add` int(11) DEFAULT 0 COMMENT '第十七项，加分（教师社会服务）',
  `no17_sub` int(11) DEFAULT 0 COMMENT '第十七项，减分',
  `no17_myself` int(11) DEFAULT 0 COMMENT '第十七项，自评得分',
  `no17_leader` int(11) DEFAULT 0,
  `no17_result` int(11) DEFAULT 0 COMMENT '第十七项，考核得分',
  `no18_add` int(11) DEFAULT 0 COMMENT '第十八项，加分（教改与科研项目）',
  `no18_sub` int(11) DEFAULT 0 COMMENT '第十八项，减分',
  `no18_myself` int(11) DEFAULT 0 COMMENT '第十八项，自评得分',
  `no18_leader` int(11) NOT NULL DEFAULT 0,
  `no18_result` int(11) DEFAULT 0 COMMENT '第十八项，考核得分',
  `no19_add` int(11) DEFAULT 0 COMMENT '第十九项，加分（科研考核）',
  `no19_sub` int(11) DEFAULT 0 COMMENT '第十九项，减分',
  `no19_myself` int(11) DEFAULT 0 COMMENT '第十九项，自评得分',
  `no19_leader` int(11) DEFAULT 0,
  `no19_result` int(11) DEFAULT 0 COMMENT '第十九项，考核得分',
  `no20_add` int(11) DEFAULT 0 COMMENT '第二十项，加分（参与重大项目建设）',
  `no20_sub` int(11) DEFAULT 0 COMMENT '第二十项，减分',
  `no20_myself` int(11) DEFAULT 0 COMMENT '第二十项，自评得分',
  `no20_leader` int(11) DEFAULT 0,
  `no20_result` int(11) DEFAULT 0 COMMENT '第二十项，考核得分',
  `no21_add` int(11) DEFAULT 0 COMMENT '第二十一项，加分（支教半年）',
  `no21_sub` int(11) DEFAULT 0 COMMENT '第二十一项，减分',
  `no21_myself` int(11) DEFAULT 0 COMMENT '第二十一项，自评得分',
  `no21_leader` int(11) DEFAULT 0,
  `no21_result` int(11) DEFAULT 0 COMMENT '第二十一项，考核得分',
  `no22_add` int(11) DEFAULT 0 COMMENT '第二十二项，加分（课程主讲教师）',
  `no22_sub` int(11) DEFAULT 0 COMMENT '第二十二项，减分',
  `no22_myself` int(11) DEFAULT 0 COMMENT '第二十二项，自评得分',
  `no22_leader` int(11) DEFAULT 0,
  `no22_result` int(11) DEFAULT 0 COMMENT '第二十二项，考核得分',
  `no23_add` int(11) DEFAULT 0 COMMENT '第二十三项，加分（校企合作）',
  `no23_sub` int(11) DEFAULT 0 COMMENT '第二十三项，减分',
  `no23_myself` int(11) DEFAULT 0 COMMENT '第二十三项，自评得分',
  `no23_leader` int(11) DEFAULT NULL,
  `no23_result` int(11) DEFAULT 0 COMMENT '第二十四项，考核得分',
  `no24_add` int(11) DEFAULT 0 COMMENT '第二十四项，加分（专项工作）',
  `no24_sub` int(11) DEFAULT 0 COMMENT '第二十四项，减分',
  `no24_myself` int(11) DEFAULT 0 COMMENT '第二十四项，自评得分',
  `no24_leader` int(11) DEFAULT 0,
  `no24_result` int(11) DEFAULT 0 COMMENT '第二十四，考核得分',
  `no25_add` int(11) DEFAULT 0 COMMENT '第二十五项，加分（专利）',
  `no25_sub` int(11) DEFAULT 0 COMMENT '第二十五项，减分',
  `no25_myself` int(11) DEFAULT 0 COMMENT '第二十五项，自评得分',
  `no25_leader` int(11) DEFAULT 0,
  `no25_result` int(11) DEFAULT 0 COMMENT '第二十五项，考核得分',
  `no26_add` int(11) DEFAULT 0 COMMENT '第二十六项，加分（公开出版教材）',
  `no26_sub` int(11) DEFAULT 0 COMMENT '第二十六项，减分',
  `no26_myself` int(11) DEFAULT 0 COMMENT '第二十六项，自评得分',
  `no26_leader` int(11) DEFAULT 0,
  `no26_result` int(11) DEFAULT 0 COMMENT '第二十六项，考核得分',
  `total_myself` int(11) DEFAULT 0 COMMENT '教师自评总得分',
  `total_leader` int(11) DEFAULT 0 COMMENT '团队负责人给教师最终得分',
  `total_result` int(11) DEFAULT 0 COMMENT '领导确认后教师最终得分',
  `khTime_myself` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '教师自评时间',
  `khTime_leader` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '团队负责人给教师打分时间',
  `khTime_result` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '领导确认时间',
  `no1_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no1_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no1_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no2_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项2教师自评备注',
  `no2_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项2团队负责人给的备注',
  `no2_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项2院级领导给的备注',
  `no3_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项3教师自评备注',
  `no3_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项3团队负责人给的备注',
  `no3_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项3院级领导给的备注',
  `no4_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项4教师自评备注',
  `no4_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项4团队负责人给的备注',
  `no4_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项4院级领导给的备注',
  `no5_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项5教师自评备注',
  `no5_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项5团队负责人给的备注',
  `no5_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项5院级领导给的备注',
  `no6_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no6_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no6_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no7_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no7_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no7_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no8_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no8_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no8_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no9_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no9_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no9_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no10_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no10_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no10_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no11_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no11_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no11_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no12_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no12_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no12_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no13_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no13_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no13_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no14_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no14_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no14_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no15_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no15_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no15_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no16_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no16_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no16_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no17_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no17_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no17_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no18_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no18_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no18_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no19_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no19_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no19_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no20_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no20_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no20_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no21_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no21_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no21_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no22_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no22_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no22_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no23_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no23_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no23_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no24_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no24_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no24_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no25_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no25_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no25_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一院级领导给的备注',
  `no26_myself_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一教师自评备注',
  `no26_leader_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项一团队负责人给的备注',
  `no26_result_note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '考项26院级领导给的备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;