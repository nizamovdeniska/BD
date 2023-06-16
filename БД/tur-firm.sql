-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 15 2023 г., 18:45
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tur-firm`
--

-- --------------------------------------------------------

--
-- Структура таблицы `documentpackages`
--

CREATE TABLE `documentpackages` (
  `package_id` int(11) NOT NULL,
  `tourist_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `documentpackages`
--

INSERT INTO `documentpackages` (`package_id`, `tourist_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `excursionbookings`
--

CREATE TABLE `excursionbookings` (
  `booking_id` int(11) NOT NULL,
  `tourist_id` int(11) DEFAULT NULL,
  `excursion_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `excursionbookings`
--

INSERT INTO `excursionbookings` (`booking_id`, `tourist_id`, `excursion_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `excursions`
--

CREATE TABLE `excursions` (
  `excursion_id` int(11) NOT NULL,
  `excursion_name` varchar(255) DEFAULT NULL,
  `excursion_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `excursions`
--

INSERT INTO `excursions` (`excursion_id`, `excursion_name`, `excursion_date`) VALUES
(1, 'City Tour', '2023-06-16 10:00:00'),
(2, 'Nature Walk', '2023-06-17 14:00:00'),
(3, 'Museum Visit', '2023-06-18 11:30:00');

-- --------------------------------------------------------

--
-- Структура таблицы `hotelbookings`
--

CREATE TABLE `hotelbookings` (
  `booking_id` int(11) NOT NULL,
  `tourist_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `hotelbookings`
--

INSERT INTO `hotelbookings` (`booking_id`, `tourist_id`, `hotel_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `hotels`
--

CREATE TABLE `hotels` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `hotels`
--

INSERT INTO `hotels` (`hotel_id`, `hotel_name`, `address`) VALUES
(1, 'Hotel A', 'Address A'),
(2, 'Hotel B', 'Address B'),
(3, 'Hotel C', 'Address C');

-- --------------------------------------------------------

--
-- Структура таблицы `tourists`
--

CREATE TABLE `tourists` (
  `tourist_id` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `passport_data` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `has_children` tinyint(1) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `tourists`
--

INSERT INTO `tourists` (`tourist_id`, `full_name`, `passport_data`, `gender`, `age`, `has_children`, `hotel_id`) VALUES
(1, 'John Doe', 'AB123456', 'Male', 35, 0, 1),
(2, 'Jane Smith', 'CD987654', 'Female', 28, 1, 2),
(3, 'Mike Johnson', 'EF456789', 'Male', 42, 0, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `visas`
--

CREATE TABLE `visas` (
  `visa_id` int(11) NOT NULL,
  `tourist_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `visas`
--

INSERT INTO `visas` (`visa_id`, `tourist_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `documentpackages`
--
ALTER TABLE `documentpackages`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `tourist_id` (`tourist_id`);

--
-- Индексы таблицы `excursionbookings`
--
ALTER TABLE `excursionbookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `tourist_id` (`tourist_id`),
  ADD KEY `excursion_id` (`excursion_id`);

--
-- Индексы таблицы `excursions`
--
ALTER TABLE `excursions`
  ADD PRIMARY KEY (`excursion_id`);

--
-- Индексы таблицы `hotelbookings`
--
ALTER TABLE `hotelbookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `tourist_id` (`tourist_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Индексы таблицы `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Индексы таблицы `tourists`
--
ALTER TABLE `tourists`
  ADD PRIMARY KEY (`tourist_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Индексы таблицы `visas`
--
ALTER TABLE `visas`
  ADD PRIMARY KEY (`visa_id`),
  ADD KEY `tourist_id` (`tourist_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `documentpackages`
--
ALTER TABLE `documentpackages`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `excursionbookings`
--
ALTER TABLE `excursionbookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `excursions`
--
ALTER TABLE `excursions`
  MODIFY `excursion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `hotelbookings`
--
ALTER TABLE `hotelbookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `tourists`
--
ALTER TABLE `tourists`
  MODIFY `tourist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `visas`
--
ALTER TABLE `visas`
  MODIFY `visa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `documentpackages`
--
ALTER TABLE `documentpackages`
  ADD CONSTRAINT `documentpackages_ibfk_1` FOREIGN KEY (`tourist_id`) REFERENCES `tourists` (`tourist_id`);

--
-- Ограничения внешнего ключа таблицы `excursionbookings`
--
ALTER TABLE `excursionbookings`
  ADD CONSTRAINT `excursionbookings_ibfk_1` FOREIGN KEY (`tourist_id`) REFERENCES `tourists` (`tourist_id`),
  ADD CONSTRAINT `excursionbookings_ibfk_2` FOREIGN KEY (`excursion_id`) REFERENCES `excursions` (`excursion_id`);

--
-- Ограничения внешнего ключа таблицы `hotelbookings`
--
ALTER TABLE `hotelbookings`
  ADD CONSTRAINT `hotelbookings_ibfk_1` FOREIGN KEY (`tourist_id`) REFERENCES `tourists` (`tourist_id`),
  ADD CONSTRAINT `hotelbookings_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`);

--
-- Ограничения внешнего ключа таблицы `tourists`
--
ALTER TABLE `tourists`
  ADD CONSTRAINT `tourists_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`);

--
-- Ограничения внешнего ключа таблицы `visas`
--
ALTER TABLE `visas`
  ADD CONSTRAINT `visas_ibfk_1` FOREIGN KEY (`tourist_id`) REFERENCES `tourists` (`tourist_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
