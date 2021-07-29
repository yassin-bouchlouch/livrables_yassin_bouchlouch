-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2021 at 11:59 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `podcaster`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `artist` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `artworkPath` varchar(500) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `title`, `artist`, `genre`, `artworkPath`) VALUES
(1, 'Bacon and Eggs', 2, 4, 'clearday.jpg'),
(2, 'Pizza head', 5, 10, 'energy.jpg'),
(3, 'Summer Hits', 3, 1, 'goinghigher.jpg'),
(4, 'The movie soundtrack', 2, 9, 'funkyelement.jpg'),
(5, 'Best of the Worst', 1, 3, 'lise.jpg'),
(6, 'Hello World', 3, 6, 'ukulele.jpg'),
(7, 'Best beats', 4, 7, 'sweet.jpg'),
(8, 'Rumi', 6, 6, 'rumi.jpg'),
(39, 'spring', 12, 6, 'dope.jpg'),
(40, 'summer', 13, 1, 'summer.jpg'),
(42, 'Building the Marcus brand: Goldman?s 2021 vision for its consumer banking product', 15, 13, 'avatars-000303494746-0g25uu-t500x500.jpg'),
(44, 'Podcast Lahtha | بودكاست لحظة', 16, 6, 'Lahtha_aljazeera_podcasts.jpg'),
(48, 'theory of color', 13, 15, '1627245963_8086453741266_1626727687_1331691420138_abc3229b9d2c1e057ad464d7b64.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `profilePic` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `name`, `Email`, `profilePic`) VALUES
(1, 'Mickey Mouse', 'Mickey@disney.com', 'assets/images/profile-pics/head_emerald.png'),
(2, 'Goofy', 'Goofy@gmail.com', 'assets/images/profile-pics/head_emerald.png'),
(3, 'Bart Simpson', '', 'assets/images/profile-pics/head_emerald.png'),
(4, 'Homer', '', 'assets/images/profile-pics/head_emerald.png'),
(5, 'Bruce Lee', '', 'assets/images/profile-pics/head_emerald.png'),
(6, 'rowaah', 'rowaah@gmail.com', 'assets/images/profile-pics/head_emerald.png'),
(12, 'sivalion', 'boc.yassin@gmail.com', 'assets/images/profile-pics/head_emerald.png'),
(13, 'yassin', 'bouchlouch.yassin.dev@gmail.com', 'assets/images/profile-pics/yassin.jpg'),
(14, 'asmae', 'Asmae@gmail.com', 'assets/images/profile-pics/head_emerald.png'),
(15, 'tearsheet', 'tearsheet@gmail.com', 'assets/images/profile-pics/head_emerald.png'),
(16, 'AlJazeera', 'Podcasts@AlJazeera.com ', 'assets/images/profile-pics/aljazeeraPodcast.jpg'),
(22, 'Omar', 'Ajbar@gmail.com', 'assets/images/profile-pics/head_emerald.png');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'News'),
(2, 'Sport'),
(3, 'Books'),
(4, 'Science'),
(5, 'Comedy'),
(6, 'History'),
(7, 'Crime'),
(8, 'Storytelling'),
(9, 'Science Fi'),
(10, 'Religion'),
(11, 'Technology'),
(12, 'Health'),
(13, 'Business'),
(14, 'Pop Culture'),
(15, 'art');

-- --------------------------------------------------------

--
-- Table structure for table `playlistpodcasts`
--

CREATE TABLE `playlistpodcasts` (
  `id` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `playlistId` int(11) NOT NULL,
  `playlistOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `name`, `owner`, `dateCreated`) VALUES
(2, 'first Playlist', 'yassin', '2021-07-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `podcasts`
--

CREATE TABLE `podcasts` (
  `id` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `artist` int(11) NOT NULL,
  `album` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `duration` varchar(8) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  `albumOrder` int(11) NOT NULL,
  `plays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `podcasts`
--

INSERT INTO `podcasts` (`id`, `title`, `artist`, `album`, `genre`, `duration`, `path`, `albumOrder`, `plays`) VALUES
(1, 'Acoustic Breeze', 1, 5, 8, '2:37', 'assets/music/bensound-acousticbreeze.mp3', 1, 11),
(2, 'A new beginning', 1, 5, 1, '2:35', 'assets/music/bensound-anewbeginning.mp3', 2, 5),
(3, 'Better Days', 1, 5, 2, '2:33', 'assets/music/bensound-betterdays.mp3', 3, 12),
(4, 'Buddy', 1, 5, 3, '2:02', 'assets/music/bensound-buddy.mp3', 4, 13),
(5, 'Clear Day', 1, 5, 4, '1:29', 'assets/music/bensound-clearday.mp3', 5, 11),
(6, 'Going Higher', 2, 1, 1, '4:04', 'assets/music/bensound-goinghigher.mp3', 1, 31),
(7, 'Funny Song', 2, 4, 2, '3:07', 'assets/music/bensound-funnysong.mp3', 2, 14),
(8, 'Funky Element', 2, 1, 3, '3:08', 'assets/music/bensound-funkyelement.mp3', 2, 27),
(9, 'Extreme Action', 2, 1, 4, '8:03', 'assets/music/bensound-extremeaction.mp3', 3, 28),
(10, 'Epic', 2, 4, 5, '2:58', 'assets/music/bensound-epic.mp3', 3, 19),
(11, 'Energy', 2, 1, 6, '2:59', 'assets/music/bensound-energy.mp3', 4, 21),
(12, 'Dubstep', 2, 1, 7, '2:03', 'assets/music/bensound-dubstep.mp3', 5, 22),
(13, 'Happiness', 3, 6, 8, '4:21', 'assets/music/bensound-happiness.mp3', 5, 3),
(14, 'Happy Rock', 3, 6, 9, '1:45', 'assets/music/bensound-happyrock.mp3', 4, 9),
(15, 'Jazzy Frenchy', 3, 6, 10, '1:44', 'assets/music/bensound-jazzyfrenchy.mp3', 3, 9),
(16, 'Little Idea', 3, 6, 1, '2:49', 'assets/music/bensound-littleidea.mp3', 2, 11),
(17, 'Memories', 3, 6, 2, '3:50', 'assets/music/bensound-memories.mp3', 1, 11),
(18, 'Moose', 4, 7, 1, '2:43', 'assets/music/bensound-moose.mp3', 5, 3),
(19, 'November', 4, 7, 2, '3:32', 'assets/music/bensound-november.mp3', 4, 9),
(20, 'Of Elias Dream', 4, 7, 3, '4:58', 'assets/music/bensound-ofeliasdream.mp3', 3, 6),
(21, 'Pop Dance', 4, 7, 2, '2:42', 'assets/music/bensound-popdance.mp3', 2, 11),
(22, 'Retro Soul', 4, 7, 5, '3:36', 'assets/music/bensound-retrosoul.mp3', 1, 10),
(23, 'Sad Day', 5, 2, 1, '2:28', 'assets/music/bensound-sadday.mp3', 1, 12),
(24, 'Sci-fi', 5, 2, 2, '4:44', 'assets/music/bensound-scifi.mp3', 2, 2),
(25, 'Slow Motion', 5, 2, 3, '3:26', 'assets/music/bensound-slowmotion.mp3', 3, 4),
(26, 'Sunny', 5, 2, 4, '2:20', 'assets/music/bensound-sunny.mp3', 4, 19),
(27, 'Sweet', 5, 2, 5, '5:07', 'assets/music/bensound-sweet.mp3', 5, 14),
(28, 'Tenderness ', 3, 3, 7, '2:03', 'assets/music/bensound-tenderness.mp3', 4, 15),
(29, 'The Lounge', 3, 3, 8, '4:16', 'assets/music/bensound-thelounge.mp3 ', 3, 8),
(30, 'Ukulele', 3, 3, 9, '2:26', 'assets/music/bensound-ukulele.mp3 ', 2, 18),
(31, 'Tomorrow', 3, 3, 1, '4:54', 'assets/music/bensound-tomorrow.mp3 ', 1, 9),
(32, 'الرومي| الحلقة الأولى: وداعُ الذهب', 6, 8, 6, '', 'assets/music/الرومي_ الحلقة الأولى_ وداعُ الذهب.mp3', 5, 14),
(87, 'بيت الحكمة.. صرح العلم المفقود', 16, 44, 15, NULL, 'assets/music/1626907996_2453358786581_بيت الحكمة.. صرح العلم المفقود.mp3', 0, 6),
(88, 'نكبة لؤلؤ الخليج', 13, 40, 1, NULL, 'assets/music/1627057328_29977507645575_نكبة لؤلؤ الخليج.mp3', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `song_id` int(11) NOT NULL,
  `song_mp3` text DEFAULT NULL,
  `song_photo` text DEFAULT NULL,
  `song_date` text DEFAULT NULL,
  `aritst_id` varchar(35) DEFAULT NULL,
  `song_name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`song_id`, `song_mp3`, `song_photo`, `song_date`, `aritst_id`, `song_name`) VALUES
(1, '1626272277_5781069658789_bensound-moose.mp3', '1626272277_41979217218584_solicode-prototype.jpg', NULL, NULL, 'hope'),
(2, '1626462325_14925027287506_bensound-moose.mp3', '1626462325_41760663615116_vinland-saga-138095.jpg', NULL, NULL, 'spong'),
(3, NULL, '1626517672_83735973485343_typography_heyeksa.jpg', NULL, NULL, 'hola'),
(7, '1626738609_51266124885460_bensound-moose.mp3', NULL, NULL, NULL, 'yassin'),
(8, '1626741185_8227478969500_bensound-moose.mp3', NULL, NULL, NULL, 'yassin'),
(9, '1626741309_42614356068839_bensound-moose.mp3', NULL, NULL, NULL, 'yassin'),
(10, '1626745936_79179871977572_bensound-moose.mp3', NULL, NULL, NULL, 'yassin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(32) NOT NULL,
  `signUpDate` datetime NOT NULL,
  `profilePic` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `password`, `signUpDate`, `profilePic`) VALUES
(1, 'reece-kenney', 'Reece', 'Kenney', 'Reece@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2017-06-28 00:00:00', 'assets/images/profile-pics/head_emerald.png'),
(2, 'donkey-kong', 'Donkey', 'Kong', 'Dk@yahoo.com', '7c6a180b36896a0a8c02787eeafb0e4c', '2017-06-28 00:00:00', 'assets/images/profile-pics/head_emerald.png'),
(3, 'yassin', 'Yassin', 'Bouchlouch', 'Bouchlouch.yassin.dev@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2021-07-10 00:00:00', 'assets/images/profile-pics/yassin.jpg'),
(10, 'sivalion', 'Azzeddin', 'Bouchlouch', 'Boc.yassin@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2021-07-15 00:00:00', 'assets/images/profile-pics/head_emerald.png'),
(11, 'asmae', 'Asmae', 'Hamidouche', 'Asmae@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2021-07-18 00:00:00', 'assets/images/profile-pics/head_emerald.png'),
(17, 'Omar', 'Omar', 'Ajbar', 'Ajbar@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2021-07-22 00:00:00', 'assets/images/profile-pics/head_emerald.png');

-- --------------------------------------------------------

--
-- Table structure for table `yourpodcasts`
--

CREATE TABLE `yourpodcasts` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `yourpodcasts`
--

INSERT INTO `yourpodcasts` (`id`, `name`, `owner`, `dateCreated`) VALUES
(1, 'myfirst album', 'yassin', '2021-07-15 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlistpodcasts`
--
ALTER TABLE `playlistpodcasts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `podcasts`
--
ALTER TABLE `podcasts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`song_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yourpodcasts`
--
ALTER TABLE `yourpodcasts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `playlistpodcasts`
--
ALTER TABLE `playlistpodcasts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `podcasts`
--
ALTER TABLE `podcasts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `song_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `yourpodcasts`
--
ALTER TABLE `yourpodcasts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
