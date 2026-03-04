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

 Date: 04/03/2026 08:36:31
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
-- Table structure for artists_missions_completed
-- ----------------------------
DROP TABLE IF EXISTS `artists_missions_completed`;
CREATE TABLE `artists_missions_completed`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `track_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `track_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `completed_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_user_id_missions`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK_user_id_missions` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of artists_missions_completed
-- ----------------------------

-- ----------------------------
-- Table structure for leaderboard
-- ----------------------------
DROP TABLE IF EXISTS `leaderboard`;
CREATE TABLE `leaderboard`  (
  `id` int NOT NULL,
  `user_id` int NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  `mission_completed` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_artist_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK_artist_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leaderboard
-- ----------------------------

-- ----------------------------
-- Table structure for tracks
-- ----------------------------
DROP TABLE IF EXISTS `tracks`;
CREATE TABLE `tracks`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `artist_name` int NULL DEFAULT NULL,
  `artist_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `track_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `genre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
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
INSERT INTO `tracks` VALUES (40, 20, 'https://www.billboard.com/wp-content/uploads/2024/07/karol-g-accor-arena-paris-2024-billboard-1548.jpg', 'Provenza', 'Reggaeton', 'Popular track by Karol G.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (39, 20, 'https://www.billboard.com/wp-content/uploads/2024/07/karol-g-accor-arena-paris-2024-billboard-1548.jpg', 'Tusa', 'Reggaeton', 'Hit single by Karol G.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (38, 19, 'https://assets.teenvogue.com/photos/6432c8069eb6eb688ea4b474/16:9/w_2560%2Cc_limit/1344570056', 'Paint The Town Red', 'Hip Hop', 'Popular track by Doja Cat.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (37, 19, 'https://assets.teenvogue.com/photos/6432c8069eb6eb688ea4b474/16:9/w_2560%2Cc_limit/1344570056', 'Say So', 'Disco-Pop', 'Hit single by Doja Cat.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (36, 18, 'https://i.scdn.co/image/ab67616100005174c7688aad1bf03986934d7e26', 'That\'s What I Like', 'R&B', 'Popular track by Bruno Mars.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (35, 18, 'https://i.scdn.co/image/ab67616100005174c7688aad1bf03986934d7e26', 'Uptown Funk', 'Funk-Pop', 'Hit single associated with Bruno Mars.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (34, 17, 'https://m.media-amazon.com/images/I/61v6lSOpccL._UF1000,1000_QL80_.jpg', 'Watermelon Sugar', 'Pop Rock', 'Popular track by Harry Styles.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (33, 17, 'https://m.media-amazon.com/images/I/61v6lSOpccL._UF1000,1000_QL80_.jpg', 'As It Was', 'Pop', 'Hit single by Harry Styles.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (32, 16, 'https://stanforddaily.com/wp-content/uploads/2021/05/Sour-scaled.jpg', 'good 4 u', 'Pop Rock', 'Popular track by Olivia Rodrigo.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (31, 16, 'https://stanforddaily.com/wp-content/uploads/2021/05/Sour-scaled.jpg', 'Drivers license', 'Pop', 'Hit single by Olivia Rodrigo.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (30, 15, 'https://cdn-images.dzcdn.net/images/cover/a87ee7c212c7b0f9ae687c378f260324/0x1900-000000-80-0-0.jpg', 'Rolling in the Deep', 'Soul-Pop', 'Popular track by Adele.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (29, 15, 'https://cdn-images.dzcdn.net/images/cover/a87ee7c212c7b0f9ae687c378f260324/0x1900-000000-80-0-0.jpg', 'Hello', 'Soul-Pop', 'Hit single by Adele.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (28, 14, 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Post_Malone_July_2021.jpg', 'Sunflower', 'Hip Hop', 'Popular track by Post Malone.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (27, 14, 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Post_Malone_July_2021.jpg', 'Circles', 'Pop Rock', 'Hit single by Post Malone.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (26, 13, 'https://cdn-p.smehost.net/sites/005297e5d91d4996984e966fac4389ea/wp-content/uploads/2025/06/lana-artwork-800x800.png', 'Good Days', 'Neo-Soul', 'Popular track by SZA.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (25, 13, 'https://cdn-p.smehost.net/sites/005297e5d91d4996984e966fac4389ea/wp-content/uploads/2025/06/lana-artwork-800x800.png', 'Kill Bill', 'R&B', 'Hit single by SZA.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (24, 12, 'https://www.sentireascoltare.com/wp-content/uploads/2024/11/Kendrick-Lamar-foto-PGLang.webp', 'DNA.', 'Hip Hop', 'Popular track by Kendrick Lamar.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (23, 12, 'https://www.sentireascoltare.com/wp-content/uploads/2024/11/Kendrick-Lamar-foto-PGLang.webp', 'HUMBLE.', 'Hip Hop', 'Hit single by Kendrick Lamar.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (22, 11, 'https://indiehoy.com/wp-content/uploads/2024/12/musico-critico-disco-beyonce.jpg', 'Crazy in Love', 'R&B', 'Popular track by Beyoncé.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (21, 11, 'https://indiehoy.com/wp-content/uploads/2024/12/musico-critico-disco-beyonce.jpg', 'Halo', 'Pop', 'Hit single by Beyoncé.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (20, 10, 'https://m.media-amazon.com/images/I/71zGOU7Bj4L._UF1000,1000_QL80_.jpg', 'Diamonds', 'Pop', 'Popular track by Rihanna.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (19, 10, 'https://m.media-amazon.com/images/I/71zGOU7Bj4L._UF1000,1000_QL80_.jpg', 'Umbrella', 'R&B', 'Hit single by Rihanna.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (18, 9, 'https://billboard.it/wp-content/uploads/2025/06/ed-sheeran-concerto-roma-scaled.jpg', 'Perfect', 'Pop', 'Popular track by Ed Sheeran.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (17, 9, 'https://billboard.it/wp-content/uploads/2025/06/ed-sheeran-concerto-roma-scaled.jpg', 'Shape of You', 'Pop', 'Hit single by Ed Sheeran.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (16, 8, 'https://radiolina.it/wp-content/uploads/2024/01/Dua-Lipa.jpg', 'Don\'t Start Now', 'Disco-Pop', 'Popular track by Dua Lipa.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (15, 8, 'https://radiolina.it/wp-content/uploads/2024/01/Dua-Lipa.jpg', 'Levitating', 'Nu-Disco', 'Hit single by Dua Lipa.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (14, 7, 'https://cdn-images.dzcdn.net/images/artist/5fcde7fde7cde95fc36d4576afcfb49f/1900x1900-000000-80-0-0.jpg', 'thank u, next', 'Pop', 'Popular track by Ariana Grande.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (13, 7, 'https://cdn-images.dzcdn.net/images/artist/5fcde7fde7cde95fc36d4576afcfb49f/1900x1900-000000-80-0-0.jpg', '7 rings', 'Trap-Pop', 'Hit single by Ariana Grande.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (12, 6, 'https://cdn.assets.prezly.com/ed97f32c-ee3d-4247-a501-0cf237a50033/HEADER.jpg', 'goosebumps', 'Hip Hop', 'Popular track by Travis Scott.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (11, 6, 'https://cdn.assets.prezly.com/ed97f32c-ee3d-4247-a501-0cf237a50033/HEADER.jpg', 'SICKO MODE', 'Hip Hop', 'Hit single by Travis Scott.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (10, 5, 'https://cdn-images.dzcdn.net/images/cover/6630083f454d48eadb6a9b53f035d734/0x1900-000000-80-0-0.jpg', 'everything i wanted', 'Hip Hop', 'Popular track by Billie Eilish.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (9, 5, 'https://cdn-images.dzcdn.net/images/cover/6630083f454d48eadb6a9b53f035d734/0x1900-000000-80-0-0.jpg', 'bad guy', 'Electropop', 'Hit single by Billie Eilish.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (8, 4, 'https://pochettes.pulsradio.com/the%20weeknd%20-%20sacrifice.jpg', 'Starboy', 'Hip Hop', 'Popular track by The Weeknd.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (7, 4, 'https://pochettes.pulsradio.com/the%20weeknd%20-%20sacrifice.jpg', 'Blinding Lights', 'Hip Hop', 'Hit single by The Weeknd.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (6, 3, 'https://hips.hearstapps.com/hmg-prod/images/bad-bunny-super-bowl-critiche-donald-trump-messaggio-politico-1-6989a0c9576e9.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=640:*', 'Moscow Mule', 'Hip Hop', 'Popular track by Bad Bunny.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (5, 3, 'https://hips.hearstapps.com/hmg-prod/images/bad-bunny-super-bowl-critiche-donald-trump-messaggio-politico-1-6989a0c9576e9.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=640:*', 'Tití Me Preguntó', 'Hip Hop', 'Hit single by Bad Bunny.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (4, 2, 'https://www.grazia.it/content/uploads/2024/07/cover-taylor-swift-the-eras-tour-look-concerto-mobile.jpg', 'Shake It Off', 'Hip Hop', 'Popular track by Taylor Swift.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (3, 2, 'https://www.grazia.it/content/uploads/2024/07/cover-taylor-swift-the-eras-tour-look-concerto-mobile.jpg', 'Blank Space', 'Hip Hop', 'Hit single by Taylor Swift.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (2, 1, 'https://shop.universalmusic.it/cdn/shop/files/Drake.jpg?format=webp&quality=80&v=1693910197&width=2000', 'One Dance', 'Hip Hop', 'Popular track by Drake.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);
INSERT INTO `tracks` VALUES (1, 1, 'https://shop.universalmusic.it/cdn/shop/files/Drake.jpg?format=webp&quality=80&v=1693910197&width=2000', 'God\'s Plan', 'Hip Hop', 'Hit single by Drake.', '2026-03-03 02:59:01', '2026-03-03 02:59:01', NULL);

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
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `nickname`(`nickname` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `users` VALUES (51, 'Giuseppe', 1, '2026-03-03 19:33:23', NULL, NULL);
INSERT INTO `users` VALUES (52, 'Giuseppe22', 1, '2026-03-03 19:39:14', NULL, NULL);
INSERT INTO `users` VALUES (53, 'Eleonora', 1, '2026-03-03 19:50:28', NULL, NULL);
INSERT INTO `users` VALUES (54, 'Giuseppe022', 1, '2026-03-03 23:46:20', NULL, NULL);
INSERT INTO `users` VALUES (55, 'gffjgsj', 1, '2026-03-04 00:17:45', NULL, NULL);
INSERT INTO `users` VALUES (56, 'Giuseppe3222', 1, '2026-03-04 01:38:16', NULL, NULL);
INSERT INTO `users` VALUES (57, 'fdfdsa', 1, '2026-03-04 01:41:05', NULL, NULL);
INSERT INTO `users` VALUES (58, 'dfgfds', 1, '2026-03-04 01:42:33', NULL, NULL);
INSERT INTO `users` VALUES (59, 'fdsafds', 1, '2026-03-04 01:43:04', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
