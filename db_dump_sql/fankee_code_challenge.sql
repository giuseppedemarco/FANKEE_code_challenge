/*
 Navicat Premium Dump SQL

 Source Server         : FANKEE_code_challenge
 Source Server Type    : MySQL
 Source Server Version : 80044 (8.0.44)
 Source Host           : localhost:3306
 Source Schema         : fankee_code_challenge

 Target Server Type    : MySQL
 Target Server Version : 80044 (8.0.44)
 File Encoding         : 65001

 Date: 03/03/2026 02:59:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for artists
-- ----------------------------
DROP TABLE IF EXISTS `artists`;
CREATE TABLE `artists`  (
  `artist_id` int NULL DEFAULT NULL,
  `active` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `FK_user_id`(`artist_id` ASC) USING BTREE,
  CONSTRAINT `FK_user_id` FOREIGN KEY (`artist_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of artists
-- ----------------------------
INSERT INTO `artists` VALUES (1, '1', '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `artists` VALUES (2, '1', '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `artists` VALUES (3, '1', '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `artists` VALUES (4, '1', '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `artists` VALUES (5, '1', '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `artists` VALUES (6, '1', '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `artists` VALUES (7, '1', '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `artists` VALUES (8, '1', '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `artists` VALUES (9, '1', '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `artists` VALUES (10, '1', '2026-03-03 01:47:11', NULL, NULL);

-- ----------------------------
-- Table structure for tracks
-- ----------------------------
DROP TABLE IF EXISTS `tracks`;
CREATE TABLE `tracks`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `artist_name` int NULL DEFAULT NULL,
  `track_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `track_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id` DESC) USING BTREE,
  INDEX `FK_artist_name`(`artist_name` ASC) USING BTREE,
  CONSTRAINT `FK_artist_name` FOREIGN KEY (`artist_name`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tracks
-- ----------------------------
INSERT INTO `tracks` VALUES (40, 20, 'Provenza', 'Popular track by Karol G.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (39, 20, 'Tusa', 'Hit single by Karol G.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (38, 19, 'Paint The Town Red', 'Popular track by Doja Cat.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (37, 19, 'Say So', 'Hit single by Doja Cat.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (36, 18, 'That\'s What I Like', 'Popular track by Bruno Mars.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (35, 18, 'Uptown Funk', 'Hit single associated with Bruno Mars.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (34, 17, 'Watermelon Sugar', 'Popular track by Harry Styles.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (33, 17, 'As It Was', 'Hit single by Harry Styles.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (32, 16, 'good 4 u', 'Popular track by Olivia Rodrigo.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (31, 16, 'drivers license', 'Hit single by Olivia Rodrigo.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (30, 15, 'Rolling in the Deep', 'Popular track by Adele.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (29, 15, 'Hello', 'Hit single by Adele.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (28, 14, 'Sunflower', 'Popular track by Post Malone.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (27, 14, 'Circles', 'Hit single by Post Malone.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (26, 13, 'Good Days', 'Popular track by SZA.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (25, 13, 'Kill Bill', 'Hit single by SZA.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (24, 12, 'DNA.', 'Popular track by Kendrick Lamar.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (23, 12, 'HUMBLE.', 'Hit single by Kendrick Lamar.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (22, 11, 'Crazy in Love', 'Popular track by Beyoncé.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (21, 11, 'Halo', 'Hit single by Beyoncé.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (20, 10, 'Diamonds', 'Popular track by Rihanna.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (19, 10, 'Umbrella', 'Hit single by Rihanna.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (18, 9, 'Perfect', 'Popular track by Ed Sheeran.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (17, 9, 'Shape of You', 'Hit single by Ed Sheeran.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (16, 8, 'Don\'t Start Now', 'Popular track by Dua Lipa.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (15, 8, 'Levitating', 'Hit single by Dua Lipa.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (14, 7, 'thank u, next', 'Popular track by Ariana Grande.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (13, 7, '7 rings', 'Hit single by Ariana Grande.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (12, 6, 'goosebumps', 'Popular track by Travis Scott.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (11, 6, 'SICKO MODE', 'Hit single by Travis Scott.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (10, 5, 'everything i wanted', 'Popular track by Billie Eilish.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (9, 5, 'bad guy', 'Hit single by Billie Eilish.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (8, 4, 'Starboy', 'Popular track by The Weeknd.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (7, 4, 'Blinding Lights', 'Hit single by The Weeknd.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (6, 3, 'Moscow Mule', 'Popular track by Bad Bunny.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (5, 3, 'Tití Me Preguntó', 'Hit single by Bad Bunny.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (4, 2, 'Shake It Off', 'Popular track by Taylor Swift.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (3, 2, 'Blank Space', 'Hit single by Taylor Swift.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (2, 1, 'One Dance', 'Popular track by Drake.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (1, 1, 'God\'s Plan', 'Hit single by Drake.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `active` tinyint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `nickname`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'drake', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (2, 'taylorswift', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (3, 'badbunny', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (4, 'theweeknd', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (5, 'billieeilish', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (6, 'travisscott', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (7, 'arianagrande', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (8, 'dualipa', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (9, 'edsheeran', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (10, 'rihanna', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (11, 'beyonce', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (12, 'kendricklamar', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (13, 'sza', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (14, 'postmalone', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (15, 'adele', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (16, 'oliviarodrigo', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (17, 'harrystyles', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (18, 'brunomars', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (19, 'dojacat', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (20, 'karolg', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (21, 'largebass123', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (22, 'silentwolf482', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (23, 'rapidfox731', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (24, 'blueotter159', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (25, 'darkpanda864', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (26, 'tinyhawk297', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (27, 'goldentiger541', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (28, 'wildfalcon683', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (29, 'redbadger214', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (30, 'quickshark908', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (31, 'frostlion336', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (32, 'neonrabbit772', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (33, 'deepcobra145', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (34, 'coolviper619', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (35, 'stormeagle453', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (36, 'brightsalmon287', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (37, 'shadowbear961', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (38, 'swiftpanther524', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (39, 'ironcrab138', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (40, 'loudgecko846', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (41, 'silverowl392', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (42, 'greenrhino715', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (43, 'fastmarten204', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (44, 'icybuffalo667', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (45, 'softkoala581', 1, '2026-03-03 01:47:11', NULL, NULL);
INSERT INTO `users` VALUES (46, 'madlynx129', 0, '2026-03-03 01:47:11', NULL, '2026-03-03 01:47:11');
INSERT INTO `users` VALUES (47, 'supermoose438', 0, '2026-03-03 01:47:11', NULL, '2026-03-03 01:47:11');
INSERT INTO `users` VALUES (48, 'nightwhale790', 0, '2026-03-03 01:47:11', NULL, '2026-03-03 01:47:11');
INSERT INTO `users` VALUES (49, 'heavypeacock316', 0, '2026-03-03 01:47:11', NULL, '2026-03-03 01:47:11');
INSERT INTO `users` VALUES (50, 'smartlemur852', 0, '2026-03-03 01:47:11', NULL, '2026-03-03 01:47:11');

SET FOREIGN_KEY_CHECKS = 1;
