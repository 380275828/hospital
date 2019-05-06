/*
 Navicat Premium Data Transfer

 Source Server         : 毕业设计
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : graduation_project

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 06/05/2019 21:46:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for h_admin
-- ----------------------------
DROP TABLE IF EXISTS `h_admin`;
CREATE TABLE `h_admin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `passWord` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `descirbe` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '人员相关描述',
  `role` int(11) DEFAULT NULL COMMENT '用户角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of h_admin
-- ----------------------------
INSERT INTO `h_admin` VALUES (4, '赵敏', '123456', '13777777777', 1, '内蒙古某某某医院--院长', 1);
INSERT INTO `h_admin` VALUES (7, '管理员', '123456', '13888888888', 0, '超级管理员', 0);
INSERT INTO `h_admin` VALUES (8, '浩日瓦', '123456', '18847138310', 1, '内蒙古某某某医院--外科主任', 1);
INSERT INTO `h_admin` VALUES (9, '张鹏宇', '123456', '18847138311', 1, '内蒙古某某某医院--儿科主任', 1);
INSERT INTO `h_admin` VALUES (11, '赵磊', '123456', '18847138312', 1, '内蒙古某某某医院--妇产科主任', 1);
INSERT INTO `h_admin` VALUES (12, '孟宇春', '123456', '18847138313', 1, '内蒙古某某某医院--耳鼻喉科主任', 1);
INSERT INTO `h_admin` VALUES (13, '折振', '123456', '18847138314', 1, '内蒙古某某某医院--内分泌科主任', 1);

-- ----------------------------
-- Table structure for h_question
-- ----------------------------
DROP TABLE IF EXISTS `h_question`;
CREATE TABLE `h_question`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `q_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '问题',
  `q_answer` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '答案',
  `q_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of h_question
-- ----------------------------
INSERT INTO `h_question` VALUES (6, '您手脚发凉吗？', '[1,2,3,4,5]', 3);
INSERT INTO `h_question` VALUES (7, '您胃脘部、背部或腰膝部怕怜吗？', '[1,2,3,4,5]', 3);
INSERT INTO `h_question` VALUES (8, '您感到怕冷、衣服比别人穿得多吗？', '[1,2,3,4,5]', 3);
INSERT INTO `h_question` VALUES (9, '您比一般人耐受不了寒冷(冬天的寒冷,夏天的冷空调、电扇等)吗？', '[1,2,3,4,5]', 3);
INSERT INTO `h_question` VALUES (10, '您比别人容易患感冒吗？', '[1,2,3,4,5]', 3);
INSERT INTO `h_question` VALUES (11, '您吃(喝)凉的东西会感到不舒服或者怕吃(喝)凉东西吗？', '[1,2,3,4,5]', 3);
INSERT INTO `h_question` VALUES (12, '您受凉或吃(喝)凉的东西后,容易腹泻(拉肚子)吗？ ', '[1,2,3,4,5]', 3);
INSERT INTO `h_question` VALUES (13, '您感到手脚心发热吗？', '[1,2,3,4,5]', 4);
INSERT INTO `h_question` VALUES (14, '您感觉身体、脸上发热吗？ ', '[1,2,3,4,5]', 4);
INSERT INTO `h_question` VALUES (15, '您皮肤或口唇干吗？ ', '[1,2,3,4,5]', 4);
INSERT INTO `h_question` VALUES (16, '您口唇的颜色比一般人红吗？', '[1,2,3,4,5]', 4);
INSERT INTO `h_question` VALUES (17, '您容易便秘或大便干燥吗？', '[1,2,3,4,5]', 4);
INSERT INTO `h_question` VALUES (18, '您面部两颧潮红或偏红吗？', '[1,2,3,4,5]', 4);
INSERT INTO `h_question` VALUES (19, '您感到眼睛干涩吗？  ', '[1,2,3,4,5]', 4);
INSERT INTO `h_question` VALUES (20, '您感到口干咽燥、总想喝水吗？  ', '[1,2,3,4,5]', 4);
INSERT INTO `h_question` VALUES (21, '您容易疲乏吗？', '[1,2,3,4,5]', 2);
INSERT INTO `h_question` VALUES (22, '您容易气短(呼吸短促,接不上气)吗？', '[1,2,3,4,5]', 2);
INSERT INTO `h_question` VALUES (23, '您容易心慌吗？ ', '[1,2,3,4,5]', 2);
INSERT INTO `h_question` VALUES (24, '您容易头晕或站起时晕眩吗？ ', '[1,2,3,4,5]', 2);
INSERT INTO `h_question` VALUES (25, '您比别人容易患感冒吗？ ', '[1,2,3,4,5]', 2);
INSERT INTO `h_question` VALUES (26, '您喜欢安静、懒得说话吗？ ', '[1,2,3,4,5]', 2);
INSERT INTO `h_question` VALUES (27, '您说话声音低弱无力吗？ ', '[1,2,3,4,5]', 2);
INSERT INTO `h_question` VALUES (28, '您活动量稍大就容易出虚汗吗？', '[1,2,3,4,5]', 2);
INSERT INTO `h_question` VALUES (29, '您感到胸闷或腹部胀满吗？', '[1,2,3,4,5]', 5);
INSERT INTO `h_question` VALUES (30, '您感到身体沉重不轻松或不爽快吗？', '[1,2,3,4,5]', 5);
INSERT INTO `h_question` VALUES (31, '您腹部肥满松软吗？', '[1,2,3,4,5]', 5);
INSERT INTO `h_question` VALUES (32, '您有额部油脂分泌多的现象吗？', '[1,2,3,4,5]', 5);
INSERT INTO `h_question` VALUES (33, '您上眼睑比别人肿(上眼睑有轻微隆起的现象)吗？', '[1,2,3,4,5]', 5);
INSERT INTO `h_question` VALUES (34, '您嘴里有黏黏的感觉吗？', '[1,2,3,4,5]', 5);
INSERT INTO `h_question` VALUES (35, '您平时痰多,特别是咽喉部总感到有痰堵着吗？', '[1,2,3,4,5]', 5);
INSERT INTO `h_question` VALUES (36, '您舌苔厚腻或有舌苔厚厚的感觉吗？', '[1,2,3,4,5]', 5);
INSERT INTO `h_question` VALUES (37, '您面部或鼻部有油腻感或者油亮发光吗？', '[1,2,3,4,5]', 6);
INSERT INTO `h_question` VALUES (38, '您容易生痤疮或疮疖吗？', '[1,2,3,4,5]', 6);
INSERT INTO `h_question` VALUES (39, '您感到口苦或嘴里有异味吗？', '[1,2,3,4,5]', 6);
INSERT INTO `h_question` VALUES (40, '您大便黏滞不爽、有解不尽的感觉吗？', '[1,2,3,4,5]', 6);
INSERT INTO `h_question` VALUES (41, '您小便时尿道有发热感、尿色浓(深)吗？', '[1,2,3,4,5]', 6);
INSERT INTO `h_question` VALUES (42, '您带下色黄(白带颜色发黄)吗？(限女性回答)*', '[1,2,3,4,5]', 6);
INSERT INTO `h_question` VALUES (43, '您的阴囊部位潮湿吗？(限男性回答)*', '[1,2,3,4,5]', 6);
INSERT INTO `h_question` VALUES (44, '您的皮肤在不知不觉中会出现青紫瘀斑(皮下出血)吗？', '[1,2,3,4,5]', 7);
INSERT INTO `h_question` VALUES (45, '您两颧部有细微红丝吗？', '[1,2,3,4,5]', 7);
INSERT INTO `h_question` VALUES (46, '您身体上有哪里疼痛吗？', '[1,2,3,4,5]', 7);
INSERT INTO `h_question` VALUES (47, '您面色晦黯或容易出现褐斑吗？', '[1,2,3,4,5]', 7);
INSERT INTO `h_question` VALUES (48, '您容易有黑眼圈吗？', '[1,2,3,4,5]', 7);
INSERT INTO `h_question` VALUES (49, '您容易忘事(健忘)吗？ ', '[1,2,3,4,5]', 7);
INSERT INTO `h_question` VALUES (50, '您口唇颜色偏黯吗？', '[1,2,3,4,5]', 7);
INSERT INTO `h_question` VALUES (51, '您没有感冒时也会打喷嚏吗？', '[1,2,3,4,5]', 9);
INSERT INTO `h_question` VALUES (52, '您没有感冒时也会鼻塞、流鼻涕吗？', '[1,2,3,4,5]', 9);
INSERT INTO `h_question` VALUES (53, '您有因季节变化、温度变化或异味等原因而咳喘的现象吗？', '[1,2,3,4,5]', 9);
INSERT INTO `h_question` VALUES (54, '您容易过敏(对药物、食物、气味、花粉或在季节交替、气候变化时)吗？', '[1,2,3,4,5]', 9);
INSERT INTO `h_question` VALUES (55, '您的皮肤容易起荨麻疹(风团、风疹块、风疙瘩)吗？', '[1,2,3,4,5]', 9);
INSERT INTO `h_question` VALUES (56, '您的皮肤因过敏出现过紫癜(紫红色瘀点、瘀斑)吗？', '[1,2,3,4,5]', 9);
INSERT INTO `h_question` VALUES (57, '您的皮肤一抓就红,并出现抓痕吗？', '[1,2,3,4,5]', 9);
INSERT INTO `h_question` VALUES (58, '您感到闷闷不乐、情绪低沉吗？', '[1,2,3,4,5]', 8);
INSERT INTO `h_question` VALUES (59, '您容易精神紧张、焦虑不安吗？', '[1,2,3,4,5]', 8);
INSERT INTO `h_question` VALUES (60, '您多愁善感、感情脆弱吗？', '[1,2,3,4,5]', 8);
INSERT INTO `h_question` VALUES (61, '您容易感到害怕或受到惊吓吗？', '[1,2,3,4,5]', 8);
INSERT INTO `h_question` VALUES (62, '您胁肋部或乳房胀痛吗？', '[1,2,3,4,5]', 8);
INSERT INTO `h_question` VALUES (63, '您无缘无故叹气吗？', '[1,2,3,4,5]', 8);
INSERT INTO `h_question` VALUES (64, '您咽喉部有异物感,且吐之不出、咽之不下吗？', '[1,2,3,4,5]', 8);
INSERT INTO `h_question` VALUES (65, '您精力充沛吗？ ', '[1,2,3,4,5]', 1);
INSERT INTO `h_question` VALUES (67, '您容易疲乏吗？', '[5,4,3,2,1]', 1);
INSERT INTO `h_question` VALUES (68, '您说话声音低弱无力吗？', '[5,4,3,2,1]', 1);
INSERT INTO `h_question` VALUES (69, '您感到闷闷不乐、情绪低沉吗？', '[5,4,3,2,1]', 1);
INSERT INTO `h_question` VALUES (70, '您比一般人耐受不了寒冷(冬天的寒冷,夏天的冷空调、电扇等)吗?？', '[5,4,3,2,1]', 1);
INSERT INTO `h_question` VALUES (71, '您能适应外界自然和社会环境的变化吗？', '[1,2,3,4,5]', 1);
INSERT INTO `h_question` VALUES (72, '您容易失眠吗？', '[5,4,3,2,1]', 1);
INSERT INTO `h_question` VALUES (73, '您容易忘事(健忘)吗？', '[5,4,3,2,1]', 1);

-- ----------------------------
-- Table structure for h_question_type
-- ----------------------------
DROP TABLE IF EXISTS `h_question_type`;
CREATE TABLE `h_question_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of h_question_type
-- ----------------------------
INSERT INTO `h_question_type` VALUES (1, '平和质');
INSERT INTO `h_question_type` VALUES (2, '气虚质');
INSERT INTO `h_question_type` VALUES (3, '阳虚质');
INSERT INTO `h_question_type` VALUES (4, '阴虚质');
INSERT INTO `h_question_type` VALUES (5, '痰湿质');
INSERT INTO `h_question_type` VALUES (6, '湿热质');
INSERT INTO `h_question_type` VALUES (7, '血瘀质');
INSERT INTO `h_question_type` VALUES (8, '气郁质');
INSERT INTO `h_question_type` VALUES (9, '特禀质');

-- ----------------------------
-- Table structure for h_user
-- ----------------------------
DROP TABLE IF EXISTS `h_user`;
CREATE TABLE `h_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int(11) DEFAULT NULL,
  `phoneNum` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `insider` int(1) DEFAULT NULL COMMENT '是否是会员，1为是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of h_user
-- ----------------------------
INSERT INTO `h_user` VALUES (43, '浩日瓦', '1', '123456', 20, '18847138310', 0);
INSERT INTO `h_user` VALUES (44, '赵磊', '1', '123456', 20, '18847138311', 0);
INSERT INTO `h_user` VALUES (45, '张鹏宇', '1', '123456', 20, '18847138312', 0);

-- ----------------------------
-- Table structure for h_user_question
-- ----------------------------
DROP TABLE IF EXISTS `h_user_question`;
CREATE TABLE `h_user_question`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `user_socre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户得分情况',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of h_user_question
-- ----------------------------
INSERT INTO `h_user_question` VALUES (34, 44, '{\"1\":75,\"2\":0,\"3\":0,\"4\":3,\"5\":0,\"6\":0,\"7\":3,\"8\":0,\"9\":0}');

SET FOREIGN_KEY_CHECKS = 1;
