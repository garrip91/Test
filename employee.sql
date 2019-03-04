-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 04 2019 г., 16:10
-- Версия сервера: 8.0.12
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `workers`
--

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `id` int(10) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` int(10) NOT NULL,
  `department_id` int(10) NOT NULL,
  `birthday` date NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `employee` (СОЗДАЁМ ПРИМЕР С УСЛОВНЫМИ РАБОТНИКАМИ (ДАЛЕЕ - РАБОТНИКИ) ):
--

INSERT INTO `employee` (`id`, `name`, `salary`, `department_id`, `birthday`, `city`, `gender`) VALUES
(1, 'Иванов', 10000, 1, '2019-03-07', 'Армавир', 1),
(2, 'Петров', 20000, 2, '2017-09-05', 'Саратов', 1),
(3, 'Сидорова', 32000, 3, '2017-07-20', 'Москва', 2),
(4, 'Тарасова', 10000, 2, '2018-10-09', 'Чита', 2),
(5, 'Ромов', 12000, 3, '2019-03-01', 'Астрахань', 1),
(6, 'Праздничный', 13300, 1, '2019-03-04', 'Самара', 1);
COMMIT;

--
-- 1.1. ДЕЛАЕМ ВЫБОРКУ ВСЕХ СОТРУДНИКОВ, УПОРЯДОЧЕННЫХ ПО ПОЛЮ `name` по алфавиту (ПРИ ЭТОМ В ДАННОМ СЛУЧАЕ НЕОБЯЗАТЕЛЬНО ИСПОЛЬЗОВАТЬ "...ASC" ПОСЛЕ "ORDER BY") И ПРОЖИВАЮЩИХ В ГОРОДАХ, НАЧИНАЮЩИХСЯ С БУКВЫ "А" (В ДАННОМ ПРИМЕРЕ ТАКИХ РАБОТНИКОВ - 2):
--

SELECT * FROM `employee` WHERE `city` LIKE 'А%' ORDER BY `name`;

--
-- 1.2. ДЕЛАЕМ ВЫБОРКУ ВСЕХ СОТРУДНИКОВ, У КОТОРЫХ ДНИ РОЖДЕНИЯ ВЫПАДАЮТ НА ДЕНЬ ВЫПОЛНЕНИЯ ЗАПРОСА (В ДАННОМ ПРИМЕРЕ ТАКОЙ РАБОТНИК - 1):
--

SELECT * FROM `employee` WHERE `birthday` LIKE CURRENT_DATE;

--
-- 1.3. ДЕЛАЕМ ВЫБОРКУ ВСЕХ СОТРУДНИКОВ С МАКСИМАЛЬНОЙ ЗАРАБОТНОЙ ПЛАТОЙ (В ДАННОМ ПРИМЕРЕ ТАКОЙ РАБОТНИК - 1):
--

SELECT * FROM `employee` WHERE `salary` = (SELECT MAX(salary) FROM `employee`);

--
-- 1.4.1. ДЕЛАЕМ ВЫБОРКУ ВСЕХ СОТРУДНИКОВ С МИНИМАЛЬНОЙ ЗАРАБОТНОЙ ПЛАТОЙ (В ДАННОМ ПРИМЕРЕ ТАКИХ РАБОТНИКОВ - 2): 
--

SELECT * FROM `employee` WHERE `salary` = (SELECT MIN(salary) FROM `employee`);

--
-- 1.4.2. ДЕЛАЕМ ВЫБОРКУ МАКСИМАЛЬНОЙ ЗАРАБОТНОЙ ПЛАТЫ В КАЖДОМ ОТДЕЛЕ (В ДАННОМ ПРИМЕРЕ ТАКИХ РАБОТНИКОВ - 2):
--

SELECT DISTINCT(`department_id`) as `dept`, (SELECT MAX(salary) FROM `employee` WHERE `department_id` = `dept`) FROM `employee`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;