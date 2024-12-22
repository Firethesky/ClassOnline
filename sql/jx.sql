/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : localhost:3306
 Source Schema         : studentlogin

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 22/12/2024 06:12:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `exercise_id` int NOT NULL,
  `student_id` bigint NOT NULL,
  `answer` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  `score` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_answer_exercise_idx`(`exercise_id` ASC) USING BTREE,
  INDEX `fk_answer_student_idx`(`student_id` ASC) USING BTREE,
  CONSTRAINT `fk_answer_exercise` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_answer_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (1, 1, 603, '今天星期日，我很不开心因为还要写作业', 60);
INSERT INTO `answer` VALUES (2, 1, 604, '重要么，我已经出去玩了哈', 30);
INSERT INTO `answer` VALUES (3, 2, 603, '一般般吧，写作业谁会开心', 70);
INSERT INTO `answer` VALUES (4, 3, 603, '饿着', NULL);
INSERT INTO `answer` VALUES (5, 8, 603, '1.让人长寿\r\n2.让人开心\r\n3.强身健体', 100);
INSERT INTO `answer` VALUES (6, 7, 603, '帅哥', 100);
INSERT INTO `answer` VALUES (8, 10, 603, '炸鸡', 100);

-- ----------------------------
-- Table structure for exercise
-- ----------------------------
DROP TABLE IF EXISTS `exercise`;
CREATE TABLE `exercise`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `teacherid` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exercise
-- ----------------------------
INSERT INTO `exercise` VALUES (1, '今天星期几', '上什么课？', 1);
INSERT INTO `exercise` VALUES (2, '今天开心吗', '回答让你开心或者不开心的事情', 1);
INSERT INTO `exercise` VALUES (3, '今天晚饭吃什么', '回答出一种食物让老师有食欲', 1);
INSERT INTO `exercise` VALUES (7, '老师姓什么', '回答一个字', 1);
INSERT INTO `exercise` VALUES (8, '有关项目管理的题目', '学习项目管理的意义是什么？至少回答出三点', 1);
INSERT INTO `exercise` VALUES (10, '测试', '今天老师晚饭吃的什么？', 1);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` bigint NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id_UNIQUE`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (150, '吉星', '123456');
INSERT INTO `student` VALUES (603, '马瑞佳', '123456');
INSERT INTO `student` VALUES (604, '施佳诤', '123456');
INSERT INTO `student` VALUES (607, '谢聪颖', '789456');
INSERT INTO `student` VALUES (609, '马瑞泽', '456789');
INSERT INTO `student` VALUES (610, '施帅哥', '456789');
INSERT INTO `student` VALUES (668, '杨清淇', '666789');
INSERT INTO `student` VALUES (789, '黄薮郁', '1');
INSERT INTO `student` VALUES (888, '帅哥', '123');
INSERT INTO `student` VALUES (998, '马美女', '123456');

-- ----------------------------
-- Table structure for student_tests
-- ----------------------------
DROP TABLE IF EXISTS `student_tests`;
CREATE TABLE `student_tests`  (
  `student_test_id` int NOT NULL AUTO_INCREMENT,
  `test_id` int NOT NULL,
  `student_id` bigint NOT NULL,
  `submitted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `score` int NULL DEFAULT 0,
  PRIMARY KEY (`student_test_id`) USING BTREE,
  INDEX `test_id`(`test_id` ASC) USING BTREE,
  INDEX `student_id`(`student_id` ASC) USING BTREE,
  CONSTRAINT `student_tests_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `student_tests_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_tests
-- ----------------------------
INSERT INTO `student_tests` VALUES (1, 1, 150, '2024-12-22 01:07:35', 85);
INSERT INTO `student_tests` VALUES (2, 1, 603, '2024-12-22 01:07:35', 90);
INSERT INTO `student_tests` VALUES (3, 1, 604, '2024-12-22 01:07:35', 88);
INSERT INTO `student_tests` VALUES (4, 1, 607, '2024-12-22 01:07:35', 78);
INSERT INTO `student_tests` VALUES (5, 1, 609, '2024-12-22 01:07:35', 92);
INSERT INTO `student_tests` VALUES (6, 1, 610, '2024-12-22 01:07:35', 87);
INSERT INTO `student_tests` VALUES (7, 1, 668, '2024-12-22 01:07:35', 83);
INSERT INTO `student_tests` VALUES (8, 1, 789, '2024-12-22 01:07:35', 76);
INSERT INTO `student_tests` VALUES (9, 1, 888, '2024-12-22 01:07:35', 59);
INSERT INTO `student_tests` VALUES (10, 1, 998, '2024-12-22 01:07:35', 79);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` bigint NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id_UNIQUE`(`id` ASC) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '帅哥马', '123456');

-- ----------------------------
-- Table structure for tests
-- ----------------------------
DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests`  (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`test_id`) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tests
-- ----------------------------
INSERT INTO `tests` VALUES (1, '期末测试', 1, '2024-12-22 01:06:34');

SET FOREIGN_KEY_CHECKS = 1;
