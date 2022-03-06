/*
 Navicat Premium Data Transfer

 Source Server         : MySQL_local
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : library_db

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 04/03/2022 21:13:33
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_book
-- ----------------------------
DROP TABLE IF EXISTS `sys_book`;
CREATE TABLE `sys_book`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书名称',
  `no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0001' COMMENT '图书编号',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `publish` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '人民文学出版社' COMMENT '出版社',
  `bookshelf` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'A区' COMMENT '图书存放区域',
  `price` int NULL DEFAULT 50 COMMENT '图书价格',
  `number` int NULL DEFAULT 10 COMMENT '库存数量',
  `status` int NULL DEFAULT 1 COMMENT '系统状态：0-不可借阅，1-可借阅',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_book
-- ----------------------------
INSERT INTO `sys_book` VALUES (1, '穆斯林的葬礼', '0001', '霍达', '人民文学出版社', 'A区', 400, 20, 0, '2021-04-06 16:37:09', '2021-06-16 22:36:09');
INSERT INTO `sys_book` VALUES (2, '钢铁是怎样练成的', '0002', '奥斯特洛夫基', '人民文学出版社', 'B区', 10, 12, 0, '2021-04-12 20:45:37', '2021-04-20 14:49:53');
INSERT INTO `sys_book` VALUES (3, '三国演义', '0003', '罗贯中', '人民文学出版社', 'A区', 50, 10, 1, '2021-04-21 17:29:38', '2021-04-21 17:33:47');
INSERT INTO `sys_book` VALUES (4, '水浒传', '0004', '施耐庵', '人民文学出版社', 'A区', 99, 10, 1, '2021-04-21 17:32:31', '2021-04-21 17:34:47');
INSERT INTO `sys_book` VALUES (5, '西游记', '0005', '吴承恩', '人民文学出版社', 'C区', 5000, 70, 1, '2021-04-21 17:34:12', '2021-05-07 17:38:52');
INSERT INTO `sys_book` VALUES (6, '红楼梦', '0006', '曹雪芹', '人民文学出版社', 'D区', 50, 10, 1, '2021-04-21 17:34:33', '2021-04-21 17:34:43');
INSERT INTO `sys_book` VALUES (7, 'Windows核心编程', '0008', 'Jeffrey Richter', '机械工业出版社', 'A区', 88, 90, 1, '2021-04-27 11:04:53', '2021-05-06 14:31:52');
INSERT INTO `sys_book` VALUES (9, 'Java编程', '0009', 'Clifford Stein', '机械工业出版社', 'B区', 86, 10, 1, '2021-04-27 11:15:26', '2021-04-27 11:18:06');
INSERT INTO `sys_book` VALUES (10, 'C程序设计语言', '0010', '[美] Brian W. Kernighan ', '机械工业出版社', 'A区', 30, 105, 1, '2021-04-27 11:15:26', '2021-04-28 15:31:53');
INSERT INTO `sys_book` VALUES (11, '计算机程序构造', '0011', '[美] Harold Abelson', '机械工业出版社', 'B区', 45, 101, 1, '2021-04-27 11:15:26', '2021-04-28 15:43:34');
INSERT INTO `sys_book` VALUES (12, '代码大全（第2版）', '0012', '[美] 史蒂夫·迈克康奈尔', '电子工业出版社', 'A区', 128, 10, 1, '2021-04-27 11:15:26', '2021-04-27 11:17:13');
INSERT INTO `sys_book` VALUES (13, '算法导论', '0013', '[美] Thomas H.Cormen ', '机械工业出版社', 'F区', 85, 10, 1, '2021-04-27 11:15:26', '2021-04-27 11:17:49');
INSERT INTO `sys_book` VALUES (14, '编程之美', '0014', '[美] Curry ', '电子工业出版社', 'A区', 40, 10, 1, '2021-04-27 11:15:26', '2021-04-28 15:31:15');
INSERT INTO `sys_book` VALUES (15, 'Python核心编程', '0015', '[美] Wesley J. Chun', '人民邮电出版社', 'E区', 89, 140, 1, '2021-04-27 11:15:26', '2021-04-28 15:43:50');
INSERT INTO `sys_book` VALUES (16, '大学物理学', '0016', '张三慧', '清华大学出版社', 'A区', 38, 10, 1, '2021-04-27 11:15:26', '2021-04-27 11:17:26');
INSERT INTO `sys_book` VALUES (17, 'Android应用开发揭秘', '0017', '杨丰盛', '机械工业出版社', 'D区', 69, 10, 1, '2021-04-27 11:15:26', '2021-04-27 11:17:55');
INSERT INTO `sys_book` VALUES (18, '与孩子一起学编程', '0018', '[美] Warren Sande', '人民邮电出版社', 'A区', 72, 16, 1, '2021-04-27 11:15:26', '2021-04-28 15:44:30');
INSERT INTO `sys_book` VALUES (19, 'JavaEE程序应用开发', '0019', '郭克华', '清华大学', 'A区', 32, 10, 1, '2021-04-27 11:15:26', '2021-04-28 15:43:58');
INSERT INTO `sys_book` VALUES (20, '高等数学', '0020', '霍达', '人民文学出版社', 'C区', 80, 619, 1, '2021-05-06 16:22:58', '2021-05-06 20:59:10');

-- ----------------------------
-- Table structure for sys_book_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_book_log`;
CREATE TABLE `sys_book_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型（出库入库）',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出入库地点',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出入库图书名称',
  `number` int NULL DEFAULT NULL COMMENT '出入库数量',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '出入库时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入库记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_book_log
-- ----------------------------
INSERT INTO `sys_book_log` VALUES (1, '入库', '杨尚霖', '新华书店', '九阴真经', 100, '2021-04-28 16:41:55');
INSERT INTO `sys_book_log` VALUES (2, '出库', '蓉儿', '清华大学', '学霸怎样成功的', 200, '2021-04-28 17:22:21');
INSERT INTO `sys_book_log` VALUES (3, '入库', '杨尚霖', '新华书店', 'HelloWorld', 200, '2021-04-29 14:30:13');
INSERT INTO `sys_book_log` VALUES (4, '入库', '杨尚霖', '新华书店', '高等数学', 100, '2021-05-06 16:22:58');
INSERT INTO `sys_book_log` VALUES (5, '入库', '杨尚霖', '新华书店', '高等数学', 20, '2021-05-06 16:26:15');
INSERT INTO `sys_book_log` VALUES (6, '入库', '杨尚霖', '新华书店', '高等数学', 999, '2021-05-06 20:47:43');
INSERT INTO `sys_book_log` VALUES (7, '出库', '杨尚霖', '北京大学', '高等数学', 500, '2021-05-06 20:59:10');
INSERT INTO `sys_book_log` VALUES (8, '出库', '杨尚霖', '商洛学院', '穆斯林的葬礼', 100, '2021-06-16 22:36:09');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int NULL DEFAULT NULL COMMENT '上级菜单',
  `text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单文本',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单链接地址',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, NULL, '系统管理', NULL, 'fa fa-cog', '2021-04-06 15:38:58', '2021-04-07 15:45:20');
INSERT INTO `sys_menu` VALUES (2, NULL, '图书管理', NULL, 'fa fa-gears', '2021-04-06 15:39:29', '2021-04-07 15:45:24');
INSERT INTO `sys_menu` VALUES (3, NULL, '读者模块', NULL, 'fa fa-bookmark-o', '2021-04-06 15:40:11', '2021-04-07 15:45:29');
INSERT INTO `sys_menu` VALUES (4, 1, '角色信息', 'role/index', 'fa fa-user-circle', '2021-04-06 15:41:57', '2021-04-07 15:45:13');
INSERT INTO `sys_menu` VALUES (5, 1, '图书权限', 'book/power', 'fa fa-book', '2021-04-06 15:42:10', '2021-04-08 12:21:15');
INSERT INTO `sys_menu` VALUES (6, 2, '图书信息', 'book/list', 'fa fa-book', '2021-04-06 15:43:17', '2021-04-08 12:20:32');
INSERT INTO `sys_menu` VALUES (7, 2, '图书出库记录', 'bookLog/out', 'fa fa-window-minimize', '2021-04-06 15:43:27', '2021-05-06 16:27:32');
INSERT INTO `sys_menu` VALUES (8, 2, '图书入库记录', 'bookLog/in', 'fa fa-plus', '2021-04-06 15:45:00', '2021-05-06 16:27:27');
INSERT INTO `sys_menu` VALUES (9, 14, '用户信息', 'user/list', 'fa fa-address-book', '2021-04-06 15:45:04', '2021-04-08 12:25:24');
INSERT INTO `sys_menu` VALUES (10, 14, '用户黑名单', 'user/blacklist', 'fa fa-user', '2021-04-06 16:07:57', '2021-04-08 12:26:05');
INSERT INTO `sys_menu` VALUES (11, 3, '借阅图书', 'book/borrow', 'fa fa-long-arrow-right', '2021-04-06 16:10:52', '2021-04-21 17:01:06');
INSERT INTO `sys_menu` VALUES (12, 3, '归还图书', 'book/back', 'fa fa-mail-reply', '2021-04-06 16:10:58', '2021-04-21 17:01:00');
INSERT INTO `sys_menu` VALUES (13, 3, '充值金额', 'user/recharge', 'fa fa-rmb', '2021-04-06 16:11:06', '2021-04-08 12:23:09');
INSERT INTO `sys_menu` VALUES (14, NULL, '用户管理', NULL, 'fa fa-users', '2021-04-07 09:16:20', '2021-04-07 15:45:53');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', '2021-04-06 15:50:08', '2021-04-06 15:50:08');
INSERT INTO `sys_role` VALUES (2, '图书管理员', '2021-04-06 15:50:27', '2021-04-06 15:50:27');
INSERT INTO `sys_role` VALUES (3, '读者', '2021-04-06 15:52:07', '2021-04-06 15:52:07');
INSERT INTO `sys_role` VALUES (4, '测试管理员', '2021-04-07 16:40:31', '2021-04-28 17:30:09');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int NOT NULL COMMENT '角色主键',
  `menu_id` int NOT NULL COMMENT '菜单主键'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单中间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (3, 11);
INSERT INTO `sys_role_menu` VALUES (3, 12);
INSERT INTO `sys_role_menu` VALUES (3, 13);
INSERT INTO `sys_role_menu` VALUES (4, 14);
INSERT INTO `sys_role_menu` VALUES (4, 9);
INSERT INTO `sys_role_menu` VALUES (4, 10);
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (2, 14);
INSERT INTO `sys_role_menu` VALUES (2, 9);
INSERT INTO `sys_role_menu` VALUES (2, 10);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `cellphone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码：MD5加密',
  `role_id` int NULL DEFAULT 3 COMMENT '用户对应角色',
  `id_card` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `status` int NULL DEFAULT 1 COMMENT '系统状态：0-禁用，1-启用，2-未审核，3-已注销',
  `number` int NULL DEFAULT 0 COMMENT '借阅数量',
  `money` int NULL DEFAULT 0 COMMENT '账户余额',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cellphone`(`cellphone`) USING BTREE COMMENT '手机号码唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '杨尚霖', '18161762726', 'E10ADC3949BA59ABBE56E057F20F883E', 1, '612322199901140000', 1, 5, 856, '2021-04-06 16:15:45', '2021-06-09 09:50:35');
INSERT INTO `sys_user` VALUES (2, '蓉儿', '18992672058', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '612322199901140001', 1, 5, 9800, '2021-04-06 16:23:00', '2021-05-10 11:29:44');
INSERT INTO `sys_user` VALUES (3, '李文力', '12347585930', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199706054861', 1, 0, 10, '2021-04-12 20:35:37', '2021-06-09 09:50:22');
INSERT INTO `sys_user` VALUES (4, '晓玲', '18091679725', 'E10ADC3949BA59ABBE56E057F20F883E', 2, '320922199808024568', 1, 0, 100, '2021-04-13 16:58:09', '2021-04-28 15:49:58');
INSERT INTO `sys_user` VALUES (5, '柴方远', '13209107937', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808027415', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:54:12');
INSERT INTO `sys_user` VALUES (6, '杨佳帅', '15292909960', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808028956', 0, 2, 5, '2021-04-27 11:33:17', '2021-06-08 20:46:21');
INSERT INTO `sys_user` VALUES (7, '金甫', '18220990641', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808024812', 0, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:54:27');
INSERT INTO `sys_user` VALUES (8, '张朋勃', '15259061051', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808026547', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:45:59');
INSERT INTO `sys_user` VALUES (9, '何嘉诚', '17749103938', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808026254', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:45:59');
INSERT INTO `sys_user` VALUES (10, '刘鹏', '17391651960', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808021680', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:45:59');
INSERT INTO `sys_user` VALUES (11, '吴辙', '19831024546', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808021463', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:45:59');
INSERT INTO `sys_user` VALUES (12, '吕浩博', '13679272639', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808024926', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:00');
INSERT INTO `sys_user` VALUES (13, '杨钊', '18161762720', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808024815', 1, 0, 100, '2021-04-27 11:33:17', '2021-05-10 11:16:13');
INSERT INTO `sys_user` VALUES (14, '刘树', '18329787512	', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808024561', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:00');
INSERT INTO `sys_user` VALUES (15, '王雄舟', '18393337887', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808044712', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:00');
INSERT INTO `sys_user` VALUES (16, '贺磊', '17361568329 ', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '612322199901140000', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:00');
INSERT INTO `sys_user` VALUES (17, '史嘉豪', '15664800890', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '612322199901140001', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:00');
INSERT INTO `sys_user` VALUES (18, '王智斌', '15332362737', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199706054861', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:00');
INSERT INTO `sys_user` VALUES (19, '白富红', '17361568330', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808024568', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:00');
INSERT INTO `sys_user` VALUES (20, '陈俊杰', '15771888225', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808027415', 0, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:54:37');
INSERT INTO `sys_user` VALUES (21, '徐达', '13772338123', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808028956', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:01');
INSERT INTO `sys_user` VALUES (22, '李忠勇', '18392054552', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808024812', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:01');
INSERT INTO `sys_user` VALUES (23, '张培凤', '15249098426', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808026547', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:01');
INSERT INTO `sys_user` VALUES (24, '范嘉晨', '15129223609', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '612322199901140234', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:01');
INSERT INTO `sys_user` VALUES (25, '程强', '18892051310', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '612322199901140543', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:01');
INSERT INTO `sys_user` VALUES (26, '刘博', '13021931985', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199706054861', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:01');
INSERT INTO `sys_user` VALUES (27, '余雄伟', '15091141814', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808024568', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:01');
INSERT INTO `sys_user` VALUES (28, '王龙涛', '18629031217	', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808027415', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:01');
INSERT INTO `sys_user` VALUES (29, '高轩', '18392117156', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808028956', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:01');
INSERT INTO `sys_user` VALUES (30, '李广博', '13389264766', 'E10ADC3949BA59ABBE56E057F20F883E', 3, '320922199808024812', 1, 0, 100, '2021-04-27 11:33:17', '2021-04-28 15:46:01');

-- ----------------------------
-- Table structure for sys_user_book
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_book`;
CREATE TABLE `sys_user_book`  (
  `user_id` int NOT NULL COMMENT '用户主键',
  `book_id` int NOT NULL COMMENT '借阅图书主键'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户借阅图书记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_book
-- ----------------------------
INSERT INTO `sys_user_book` VALUES (2, 2);
INSERT INTO `sys_user_book` VALUES (1, 7);
INSERT INTO `sys_user_book` VALUES (1, 14);
INSERT INTO `sys_user_book` VALUES (2, 3);
INSERT INTO `sys_user_book` VALUES (2, 9);
INSERT INTO `sys_user_book` VALUES (2, 6);
INSERT INTO `sys_user_book` VALUES (2, 1);
INSERT INTO `sys_user_book` VALUES (1, 1);
INSERT INTO `sys_user_book` VALUES (1, 3);
INSERT INTO `sys_user_book` VALUES (6, 3);
INSERT INTO `sys_user_book` VALUES (6, 11);
INSERT INTO `sys_user_book` VALUES (1, 12);

SET FOREIGN_KEY_CHECKS = 1;
