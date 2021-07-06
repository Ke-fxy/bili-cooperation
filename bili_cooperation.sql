/*
 Navicat Premium Data Transfer

 Source Server         : JavaWeb
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : localhost:3306
 Source Schema         : bili_cooperation

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 06/07/2021 14:46:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vid` int(100) NOT NULL,
  `uid` int(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vid1`(`vid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 'hahahahahah', 12, 2, '2021-07-04 16:54:25', 'cjm');
INSERT INTO `comments` VALUES (2, 'hahahahah', 12, 2, '2021-07-04 16:54:27', 'cjm');
INSERT INTO `comments` VALUES (3, 'fafafafafa', 12, 2, '2021-07-04 16:54:29', 'cjm');
INSERT INTO `comments` VALUES (4, 'hahahahahahhaha', 12, 2, '2021-07-04 16:54:32', 'cjm');
INSERT INTO `comments` VALUES (5, 'hahadhahdhadhad', 12, 2, '2021-07-04 16:54:33', 'cjm');
INSERT INTO `comments` VALUES (6, 'hahah', 12, 2, '2021-07-04 17:06:42', 'cjm');
INSERT INTO `comments` VALUES (7, 'hahahahah', 12, 2, '2021-07-04 17:14:14', 'cjm');
INSERT INTO `comments` VALUES (8, 'hhhhh', 12, 2, '2021-07-04 18:43:42', 'cjm');
INSERT INTO `comments` VALUES (9, '牛蛙', 12, 3, '2021-07-04 20:02:37', 'yys');
INSERT INTO `comments` VALUES (10, '测试1', 18, 3, '2021-07-04 20:03:30', 'yys');
INSERT INTO `comments` VALUES (11, '牛蛙', 18, 3, '2021-07-04 20:03:35', 'yys');
INSERT INTO `comments` VALUES (12, '哈哈哈哈', 21, 2, '2021-07-04 23:29:53', 'cjm');
INSERT INTO `comments` VALUES (13, '哈哈哈哈', 21, 2, '2021-07-04 23:31:04', 'cjm');
INSERT INTO `comments` VALUES (14, '哈哈哈哈', 21, 2, '2021-07-04 23:31:10', 'cjm');
INSERT INTO `comments` VALUES (15, '牛蛙', 21, 2, '2021-07-04 23:32:30', 'cjm');
INSERT INTO `comments` VALUES (16, '芜湖', 19, 2, '2021-07-04 23:40:40', 'cjm');
INSERT INTO `comments` VALUES (17, '牛蛙牛蛙', 11, 2, '2021-07-04 23:43:52', 'cjm');
INSERT INTO `comments` VALUES (18, '牛蛙233', 11, 2, '2021-07-04 23:43:57', 'cjm');
INSERT INTO `comments` VALUES (19, '带耳机', 15, 2, '2021-07-04 23:44:19', 'cjm');
INSERT INTO `comments` VALUES (20, '芜湖', 16, 2, '2021-07-04 23:44:35', 'cjm');
INSERT INTO `comments` VALUES (21, '芜湖', 16, 2, '2021-07-04 23:44:38', 'cjm');
INSERT INTO `comments` VALUES (22, '牛蛙', 17, 2, '2021-07-04 23:44:48', 'cjm');
INSERT INTO `comments` VALUES (23, '牛蛙', 17, 2, '2021-07-04 23:44:51', 'cjm');
INSERT INTO `comments` VALUES (24, 'dhuahdua', 11, 2, '2021-07-05 01:09:57', 'cjm');
INSERT INTO `comments` VALUES (25, 'hahah', 11, 2, '2021-07-05 01:10:29', 'cjm');
INSERT INTO `comments` VALUES (26, 'ok', 24, 2, '2021-07-05 09:52:15', 'cjm');
INSERT INTO `comments` VALUES (27, '大大', 33, 2, '2021-07-05 10:19:05', 'cjm');
INSERT INTO `comments` VALUES (28, 'djhaudhauh', 12, 7, '2021-07-05 11:20:26', 'ddd');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notice` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '12345', NULL, '1234531', NULL);
INSERT INTO `user` VALUES (2, 'cjm', '21232f297a57a5a743894a0e4a801fc3', '12345', NULL, 'dahdauh', NULL);
INSERT INTO `user` VALUES (3, 'yys', '21232f297a57a5a743894a0e4a801fc3', '12345', NULL, 'dwww', NULL);
INSERT INTO `user` VALUES (4, 'zsb', '21232f297a57a5a743894a0e4a801fc3', 'admin@163.com', NULL, 'www', NULL);
INSERT INTO `user` VALUES (5, 'zzz', '12345', 'admin@163.com', NULL, '123123', NULL);
INSERT INTO `user` VALUES (6, 'hhh', '21232f297a57a5a743894a0e4a801fc3', '12345@qq.com', NULL, NULL, NULL);
INSERT INTO `user` VALUES (7, 'ddd', '21232f297a57a5a743894a0e4a801fc3', '1464088896@kindle.cn', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `vName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vPath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vAuthor` int(100) NULL DEFAULT NULL,
  `vImg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vAuthor`(`vAuthor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (12, 'csgo', 'upload/video/csgo.mp4', 2, 'upload/pic/csgo.jpeg', 'game', '23333');
INSERT INTO `video` VALUES (13, '海绵宝宝', 'upload/video/海绵宝宝《sweet_victory》.mp4', 5, 'upload/pic/-海绵宝宝-《sweet_victory》.jpeg', '2', '童年回忆');
INSERT INTO `video` VALUES (16, '派大星', 'upload/video/派大星.mp4', 2, 'upload/pic/派大星.jpeg', 'dance', 'hhhhhhhhhhhhhhhhh');
INSERT INTO `video` VALUES (17, '拳王奥尔加', 'upload/video/拳_王_奥_尔_加.mp4', 2, 'upload/pic/拳_王_奥_尔_加.jpeg', 'sc', '屑');
INSERT INTO `video` VALUES (18, '全 程 不 着 调', 'upload/video/全_程_不_着_调.mp4', 2, 'upload/pic/全_程_不_着_调.jpeg', 'life', 'RICK');
INSERT INTO `video` VALUES (19, '牧濑红莉栖', 'upload/video/牧濑红莉栖.mp4', 1, 'upload/pic/牧濑红莉栖.jpeg', '2', '哦豁');
INSERT INTO `video` VALUES (20, '《Re-awake》', 'upload/video/《Re-awake》.mp4', 1, 'upload/pic/《Re-awake》.jpeg', '2', '12345');
INSERT INTO `video` VALUES (21, '小心', 'upload/video/小心咕噜灵波(物理.mp4', 2, 'upload/pic/小心咕噜灵波(物理.jpeg', '2', '哈哈哈');
INSERT INTO `video` VALUES (24, '卖 鱼 人', 'upload/video/卖_鱼_人.mp4', 2, 'upload/pic/卖_鱼_人.jpeg', 'dance', 'aaa');
INSERT INTO `video` VALUES (26, '接好！你的滴块！', 'upload/video/接好！你的滴块!.mp4', 2, 'upload/pic/接好！你的滴块！.jpeg', 'game', 'dasda');
INSERT INTO `video` VALUES (27, '优雅永不过时', 'upload/video/优雅永不过时！.mp4', 2, 'upload/pic/优雅永不过时！.jpeg', 'dance', 'dadasd');
INSERT INTO `video` VALUES (28, '六_一_儿_童_杰', 'upload/video/六_一_儿_童_杰.mp4', 2, 'upload/pic/六_一_儿_童_杰.jpeg', 'game', 'dada');
INSERT INTO `video` VALUES (29, '奥尔加', 'upload/video/不给团员带麦当劳的铁屑奥尔加.mp4', 2, 'upload/pic/不给团员带麦当劳的铁屑奥尔加.jpeg', 'game', '阿达');
INSERT INTO `video` VALUES (30, '为你加油的Apex英雄们', 'upload/video/为你加油的Apex英雄们.mp4', 2, 'upload/pic/为你加油的Apex英雄们.jpeg', 'game', '大大');
INSERT INTO `video` VALUES (31, '派大星', 'upload/video/【发现好生活】桌面.mp4', 7, 'upload/pic/发现好生活】桌面.jpeg', '2', 'hahaha');

SET FOREIGN_KEY_CHECKS = 1;
