USE shop;

/* 1 —оставьте список пользователей users, которые осуществили хот€ бы один заказ orders в интернет магазине.*/

SELECT 
	name 
FROM 
	users 
WHERE id IN (
	SELECT user_id FROM orders
	);


SELECT DISTINCT name 
  FROM users 
  INNER JOIN orders  
    ON users.id = orders.user_id;




/* 2 ¬ыведите список товаров products и разделов catalogs, который соответствует товару.*/

-- ****************************вариант GB********************************
SELECT 
	p.id, 
	p.name, 
	p.price,
	c.id AS cat_id,
	c.name AS `catalog`
FROM
	products AS p
JOIN
	catalogs AS c
WHERE
	p.catalog_id = c.id; 


-- ***************************2-ой вариант********************************

SELECT 
	products.name AS product_name, 
	catalogs.name AS product_type 
FROM 
	products 
LEFT JOIN 
	catalogs 
ON 
	products.catalog_id = catalogs.id;

/* 3 (по желанию) ѕусть имеетс€ таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
ѕол€ from, to и label содержат английские названи€ городов, поле name Ч русское. 
¬ыведите список рейсов flights с русскими названи€ми городов.*/



-- создание базы avia

CREATE DATABASE avia;
USE avia;
   
CREATE TABLE IF NOT EXISTS flights(
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(50) NOT NULL COMMENT 'от куда на английском', 
	`to` VARCHAR(50) NOT NULL COMMENT 'куда на английском'
);

CREATE TABLE  IF NOT EXISTS cities(
	label VARCHAR(50) PRIMARY KEY COMMENT 'обозначение на англиском', 
	name VARCHAR(50) COMMENT 'имена городов на русском'
);

ALTER TABLE 
	avia.flights
ADD CONSTRAINT fk_from_label
	FOREIGN KEY(`from`)
	REFERENCES avia.cities(label);

ALTER TABLE 
	avia.flights
ADD CONSTRAINT fk_to_label
	FOREIGN KEY(`to`)
	REFERENCES avia.cities(label);

INSERT INTO 
	avia.cities 
VALUES
	('Moscow', 'ћосква'),
	('Saint Petersburg', '—анкт-ѕетербург'),
	('Omsk', 'ќмск'),
	('Tomsk', '“омск'),
	('Ufa', '”фа');

INSERT INTO 
	avia.flights 
VALUES
	(NULL, 'Moscow', 'Saint Petersburg'),
	(NULL, 'Saint Petersburg', 'Omsk'),
	(NULL, 'Omsk', 'Tomsk'),
	(NULL, 'Tomsk', 'Ufa'),
	(NULL, 'Ufa', 'Moscow');   
   
-- вывод таблицы с заменой на русский €зык √ородов.

SELECT
	id AS `номер`,
	(SELECT name FROM cities WHERE label = `from`) AS `откуда`,
	(SELECT name FROM cities WHERE label = `to`) AS `куда`
FROM
	avia.flights
ORDER BY
	`номер`;






