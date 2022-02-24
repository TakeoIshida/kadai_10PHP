-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2022 年 2 月 24 日 16:49
-- サーバのバージョン： 5.7.34
-- PHP のバージョン: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gs_db4`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `gs_an_table`
--

CREATE TABLE `gs_an_table` (
  `id` int(12) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `naiyou` text COLLATE utf8_unicode_ci,
  `indate` datetime NOT NULL,
  `age` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `gs_an_table`
--

INSERT INTO `gs_an_table` (`id`, `name`, `email`, `naiyou`, `indate`, `age`) VALUES
(8, '服部半蔵', 'test8@test.jp', '服部くん', '2020-09-22 17:59:31', 10),
(9, 'テスト９', 'test9@test.jp', '自分', '2020-09-22 18:13:28', 20),
(10, 'TEST10', 'test10@test.jp', 'ウイスキー', '2020-09-29 05:19:42', 20),
(11, 'TEST11', 'test11@test.jp', 'テスト', '2020-09-29 05:20:05', 20),
(12, 'テスト', 'test99@test.jp', '', '2022-02-14 00:19:46', 0),
(13, 'テスト', 'test99@test.jp', '', '2022-02-22 17:02:50', 0),
(14, '', '', '', '2022-02-22 17:06:14', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `gs_shop_table`
--

CREATE TABLE `gs_shop_table` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `hyouka` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `kutikomi` text COLLATE utf8_unicode_ci NOT NULL,
  `indate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `gs_shop_table`
--

INSERT INTO `gs_shop_table` (`id`, `name`, `address`, `hyouka`, `kutikomi`, `indate`) VALUES
(2, '', '', '選択', '', '2022-01-31'),
(3, 'ラーメン佳', '日本、〒062-0021 北海道札幌市豊平区月寒西１条７丁目８−１９', '⭐️⭐️⭐️', 'めっちゃ美味い', '2022-02-01'),
(4, '鶴は', '日本、〒060-0908 北海道札幌市東区北８条東４丁目１−２０', '', '悪い', '2022-02-09'),
(5, '徳寿', '日本、〒060-0908 北海道札幌市東区北８条東５丁目１９−１', '⭐️', '接客いい', '2022-02-05'),
(6, 'サツドラ', '日本、〒060-0908 北海道札幌市東区北８条東４丁目１−２０', '⭐️⭐️⭐️', 'めっちゃいい', '2022-02-05'),
(7, '', '', '', '', '2022-02-06'),
(8, '', '', '', '', '2022-02-08'),
(9, 'くろべこや', '日本、〒060-0003 北海道札幌市中央区北３条西７丁目１−１ 緑苑ビル B１F', '⭐️⭐️⭐️', 'めっちゃいい', '2022-02-08');

-- --------------------------------------------------------

--
-- テーブルの構造 `gs_user_table`
--

CREATE TABLE `gs_user_table` (
  `id` int(12) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lid` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `lpw` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `kanri_flg` int(1) NOT NULL,
  `life_flg` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `gs_user_table`
--

INSERT INTO `gs_user_table` (`id`, `name`, `lid`, `lpw`, `kanri_flg`, `life_flg`) VALUES
(1, 'テスト１管理者', 'test1', 'test1', 1, 0),
(2, 'テスト2一般', 'test2', 'test2', 0, 0),
(3, 'テスト３', 'test3', 'test3', 0, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `sd_shutoku`
--

CREATE TABLE `sd_shutoku` (
  `id` int(11) NOT NULL,
  `no` int(11) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `kityouhinn` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hokann` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `indate` datetime NOT NULL,
  `bikou` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `kigenn` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `sd_shutoku`
--

INSERT INTO `sd_shutoku` (`id`, `no`, `name`, `kityouhinn`, `hokann`, `indate`, `bikou`, `kigenn`) VALUES
(2, 1, 'テスト', '貴重品', '倉庫', '2022-02-24 09:11:58', 'nasi', '2月'),
(3, 2, 'くろべこや', '貴重品以外', '売り場', '2022-02-24 10:10:49', '', ''),
(4, 3, 'テスト', '貴重品', '倉庫', '2022-02-24 10:11:18', '', '2/24');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `gs_an_table`
--
ALTER TABLE `gs_an_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `gs_shop_table`
--
ALTER TABLE `gs_shop_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `gs_user_table`
--
ALTER TABLE `gs_user_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `sd_shutoku`
--
ALTER TABLE `sd_shutoku`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `gs_an_table`
--
ALTER TABLE `gs_an_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- テーブルの AUTO_INCREMENT `gs_shop_table`
--
ALTER TABLE `gs_shop_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- テーブルの AUTO_INCREMENT `gs_user_table`
--
ALTER TABLE `gs_user_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `sd_shutoku`
--
ALTER TABLE `sd_shutoku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
