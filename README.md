# Основы реляционных баз данных. MySQL
![MarkDown](https://github.com/vit050587/MySQL-homework-GB/blob/master/MySQL.jpg)

Познакомитесь с языком запросов SQL. Научитесь писать запросы, делать расчёты и работать с таблицами. Узнаете основные ограничения SQL. Поработаете с MySQL и познакомитесь с альтернативными базами данных: MongoDB, Redis, ElasticSearch и ClickHouse.
##### Чему Вы научитесь
* SQL: простые запросы
* Знание основ теории баз данных (связь таблиц, витрины)
# Урок 1. 
## Вебинар. Установка окружения. DDL-команды
Дорогие студенты!
К этому уроку очень простое, но важное для построения дальнейших уроков дополнительное задание.
Напишите ответы на вопросы в комментарий при сдаче практического задания:
* 1 Какие у вас ожидания от курса? Есть ли конкретные вопросы по теме Базы данных?
* 2 В какой сфере работаете сейчас?
* 3 Если в IT, то какой у вас опыт (инструменты, технологии, языки программирования)?
Решения практических заданий в данном курсе присылайте, пожалуйста, в виде текстовых файлов со скриптами (исполненными командами). Для таких скриптов, как правило, используется расширение файла "*.sql" (например, "homework_1.sql")*
# Урок 2.
## Практическое задание по теме “Управление БД”
* 1 Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
* 2 Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
* 3 Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
(по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
# Урок 3. 
## Вебинар. Введение в проектирование БД
Практическое задание по теме “Введение в проектирование БД”
* 1 Написать скрипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
# Урок 4. 
## Вебинар. CRUD-операции
Практическое задание по теме “CRUD – операции”:
* 1 Заполнить все таблицы БД vk данными (по 10-20 записей в каждой таблице)
* 2 Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
* 3 Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
* 4 Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
* 5 Написать название темы курсового проекта (в комментарии)
# Урок 5
## Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”
* 1	Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
* 2	Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
* 3	В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
 ![MarkDown](https://github.com/vit050587/MySQL-homework-GB/blob/master/storehouses_products.png)
* 4	(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')
* 5	(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
## Практическое задание теме “Агрегация данных”
* 1	Подсчитайте средний возраст пользователей в таблице users
* 2	Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.
* 3	(по желанию) Подсчитайте произведение чисел в столбце таблицы
 ![MarkDown](https://github.com/vit050587/MySQL-homework-GB/blob/master/users.png)
# Урок 6. 
## Вебинар. Операторы, фильтрация, сортировка и ограничение. Агрегация данных
*Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”. Работаем с БД vk и данными, которые вы сгенерировали ранее:*
* 1 Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
* 2 Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
* 3 Определить кто больше поставил лайков (всего): мужчины или женщины.
# Урок 7
## Тема “Сложные запросы”
* 1	Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
* 2	Выведите список товаров products и разделов catalogs, который соответствует товару.
* 3	(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
![MarkDown](https://github.com/vit050587/MySQL-homework-GB/blob/master/tbl.png)
# Урок 8. 
## Вебинар. Сложные запросы
*Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”. Работаем с БД vk и данными, которые вы сгенерировали ранее:*
* 1 Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
* 2 Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
* 3 Определить кто больше поставил лайков (всего): мужчины или женщины.
*Задачи необходимо решить с использованием объединения таблиц (JOIN)*
