-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 12, 2024 lúc 05:48 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `music_be`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `album`
--

CREATE TABLE `album` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `album`
--

INSERT INTO `album` (`id`, `description`, `duration`, `title`, `user_id`) VALUES
(1, 'public playlist', 86400, 'Daily Mix 1', 1),
(2, NULL, 0, NULL, 2),
(3, NULL, 0, NULL, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `song_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feadback`
--

CREATE TABLE `feadback` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `folower`
--

CREATE TABLE `folower` (
  `id` bigint(20) NOT NULL,
  `foloweduserid` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `playhistory`
--

CREATE TABLE `playhistory` (
  `id` bigint(20) NOT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `song_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `playlist`
--

CREATE TABLE `playlist` (
  `id` bigint(20) NOT NULL,
  `duration` int(11) NOT NULL,
  `numbersong` int(11) DEFAULT NULL,
  `timestamp` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `playlist_song`
--

CREATE TABLE `playlist_song` (
  `id` bigint(20) NOT NULL,
  `playlist_id` bigint(20) DEFAULT NULL,
  `song_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `song`
--

CREATE TABLE `song` (
  `id` bigint(20) NOT NULL,
  `coverart` varchar(255) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `genre` enum('COUNTRY','ELECTRONIC','OTHER','POP','RAP','ROCK','SOUL') DEFAULT NULL,
  `lyrics` varchar(255) DEFAULT NULL,
  `playcount` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `album_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `song`
--

INSERT INTO `song` (`id`, `coverart`, `duration`, `file_path`, `genre`, `lyrics`, `playcount`, `title`, `year`, `album_id`) VALUES
(1, 'https://firebasestorage.googleapis.com/v0/b/cuong-music-32444.appspot.com/o/cover-images%2Fanh-chua-thuong-em-den-vay-dau-piano-sheet.png?alt=media&token=3026b62d-7b52-4a62-a717-49ffa3bf9016', 262, 'https://firebasestorage.googleapis.com/v0/b/cuong-music-32444.appspot.com/o/Anh-Chua-Thuong-Em-Den-Vay-Dau-Lady-May.mp3?alt=media&token=686456b0-944f-4f99-9ee4-3e76caa928ed', 'POP', '', 0, 'Anh chưa yêu em đến vậy đâu', 2024, 1),
(2, NULL, 180, NULL, 'POP', '', 0, 'Anh chưa yêu em đến vậy đâu 2', 2024, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `termandconditions`
--

CREATE TABLE `termandconditions` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `gender` enum('NAM','NU') DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `profilepicture` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `address`, `birthday`, `email`, `fullname`, `gender`, `password`, `phonenumber`, `profilepicture`, `username`) VALUES
(1, NULL, NULL, 'demoemail@gmail.com', NULL, NULL, '$2a$10$kxTz2vD428uW45pQxq7fy.uzVNVoWtdam3oLhJGoY5VFpPfv4qThO', NULL, NULL, 'demouer'),
(2, NULL, NULL, 'lehoang@gmail.com', NULL, NULL, '$2a$10$g09nLZmBqIrKzydnKT.7o.JSz5Wk.Uf5bvHPymPEsrFB4BAYNadty', NULL, NULL, 'minhhoang'),
(3, NULL, NULL, 'cuongcuch1811@gmail.com', NULL, NULL, '$2a$10$0ut/Bqnoq75m/neGhjY2qupY5VW/oZyBtGyDuJD932o8EnJD1JJD6', NULL, NULL, 'cuongcuch');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_pvitqwftj752cqhs8k4525p3y` (`user_id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbkwibkxkhbevo3yg3aoxh3vmy` (`song_id`),
  ADD KEY `FK8kcum44fvpupyw6f5baccx25c` (`user_id`);

--
-- Chỉ mục cho bảng `feadback`
--
ALTER TABLE `feadback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfn3img3vw1hxudfqn6mky8rl8` (`user_id`);

--
-- Chỉ mục cho bảng `folower`
--
ALTER TABLE `folower`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKar7d0ixyrnse1tf9c9lssxdsl` (`user_id`);

--
-- Chỉ mục cho bảng `playhistory`
--
ALTER TABLE `playhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqbe2pcm6h62cb5wac1o1037xn` (`song_id`),
  ADD KEY `FKbhywe037wu7fnqy7l3xuvh508` (`user_id`);

--
-- Chỉ mục cho bảng `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlbi6wsq41356go2ki0yirfixo` (`user_id`);

--
-- Chỉ mục cho bảng `playlist_song`
--
ALTER TABLE `playlist_song`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKji5gt6i2hcwyt9x1fcfndclva` (`playlist_id`),
  ADD KEY `FK8l4jevlmxwsdm3ppymxm56gh2` (`song_id`);

--
-- Chỉ mục cho bảng `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrcjmk41yqj3pl3iyii40niab0` (`album_id`);

--
-- Chỉ mục cho bảng `termandconditions`
--
ALTER TABLE `termandconditions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `album`
--
ALTER TABLE `album`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `feadback`
--
ALTER TABLE `feadback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `folower`
--
ALTER TABLE `folower`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `playhistory`
--
ALTER TABLE `playhistory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `playlist_song`
--
ALTER TABLE `playlist_song`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `song`
--
ALTER TABLE `song`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `termandconditions`
--
ALTER TABLE `termandconditions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `FKmi5m81x9aswan1ci0wnw04dq1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK8kcum44fvpupyw6f5baccx25c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKbkwibkxkhbevo3yg3aoxh3vmy` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`);

--
-- Các ràng buộc cho bảng `feadback`
--
ALTER TABLE `feadback`
  ADD CONSTRAINT `FKfn3img3vw1hxudfqn6mky8rl8` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `folower`
--
ALTER TABLE `folower`
  ADD CONSTRAINT `FKar7d0ixyrnse1tf9c9lssxdsl` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `playhistory`
--
ALTER TABLE `playhistory`
  ADD CONSTRAINT `FKbhywe037wu7fnqy7l3xuvh508` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKqbe2pcm6h62cb5wac1o1037xn` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`);

--
-- Các ràng buộc cho bảng `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `FKlbi6wsq41356go2ki0yirfixo` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `playlist_song`
--
ALTER TABLE `playlist_song`
  ADD CONSTRAINT `FK8l4jevlmxwsdm3ppymxm56gh2` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`),
  ADD CONSTRAINT `FKji5gt6i2hcwyt9x1fcfndclva` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`);

--
-- Các ràng buộc cho bảng `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `FKrcjmk41yqj3pl3iyii40niab0` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
