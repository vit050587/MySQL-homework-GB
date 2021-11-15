
-- ************************** ОПЕРАТОРЫ, ФИЛЬТРАЦИЯ, СОРТИРОВКА И ОГРАНИЧЕНИЕ****************************

/* 1 Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
 Заполните их текущими датой и временем. */


UPDATE users SET created_at = NOW(), updated_at = NOW() WHERE created_at is NULL or updated_at is NULL;
UPDATE users SET created_at = IF(created_at is NULL, NOW(), created_at), updated_at = IF(updated_at is NULL, NOW(), updated_at);
UPDATE users SET created_at = NOW() WHERE created_at = NULL; UPDATE users SET updated_at = NOW() WHERE updated_at = NULL;
UPDATE users SET created_at = NOW(), updated_at = NOW();





/* 2 Таблица users была неудачно спроектирована. 
 Записи created_at и updated_at были заданы типом VARCHAR 
 и в них долгое время помещались значения в формате "20.10.2017 8:10". 
 Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения. */

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    birthday_at VARCHAR(255),
    created_at VARCHAR(255),
    updated_at VARCHAR(255)
 ); -- проектировоние таблицы USERS


ALTER TABLE example.users CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
    ('Геннадий', '20 may 1987', '20.10.2017 8:10', '20.10.2017 8:10'),
    ('Наталья', '06 august 1990', '20.10.2017 8:10', '20.10.2017 8:10'),
    ('Александр', '15 february 1991', '20.10.2017 8:10', '20.10.2017 8:10'),
    ('Сергей', '20 may 1989', '20.10.2017 8:10', '20.10.2017 8:10'),
    ('Иван', '06 august 1990', '20.10.2017 8:10', '20.10.2017 8:10'),
    ('Мария', '15 february 1991', '20.10.2017 8:10', '20.10.2017 8:10'); -- Наполнение таблицы


UPDATE users SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'); 
UPDATE users SET updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');

ALTER TABLE users MODIFY created_at DATETIME DEFAULT CURRENT_TIMESTAMP; 
ALTER TABLE users MODIFY updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;


/* 3 В таблице складских запасов storehouses_products в поле value 
 могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
 Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
 Однако, нулевые запасы должны выводиться в конце, после всех записей.  */

INSERT INTO storehouses_products (value) VALUES -- наполнение существующей в базе таблицы
    (0),
    (2500),
    (0),
    (30),
    (500),
    (1);

SELECT * FROM storehouses_products ORDER BY CASE WHEN value = 0 THEN TRUE ELSE FALSE END, value; -- сортируем по количеству


/* 4 (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
 Месяцы заданы в виде списка английских названий ('may', 'august') */


SELECT id, name, birthday_at FROM users WHERE (birthday_at LIKE '%may%' OR birthday_at LIKE '%august%');



/* 5 (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN. */


SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIND_IN_SET(id,'5,1,2');



-- ***************************************** АГРЕГАЦИЯ ДАННЫХ ********************************************


-- 1 Подсчитайте средний возраст пользователей в таблице users

ALTER TABLE users ADD age INT NOT NULL; -- создаем колонку возраст.

UPDATE users SET age = TIMESTAMPDIFF(YEAR, birthday_at, NOW());

SELECT AVG(age) FROM users;




/* 2 Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
 Следует учесть, что необходимы дни недели текущего года, а не года рождения. */



SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS `day`, COUNT(*) AS `number` FROM users GROUP BY day ORDER BY `number` DESC;



-- 3 (по желанию) Подсчитайте произведение чисел в столбце таблицы


DROP TABLE IF EXISTS tbl;
CREATE TABLE tbl (
	id SERIAL PRIMARY KEY, 
	value INT NOT NULL
); -- создание таблицы из ДЗ 

INSERT INTO tbl (value) VALUES  -- наполнение данной таблицы
	(1), 
	(2), 
	(3), 
	(4), 
	(5);


SELECT exp(SUM(ln(value))) summ FROM tbl; -- получение результата произведений значений.



