USE shop;

/* 1 ��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������.*/

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




/* 2 �������� ������ ������� products � �������� catalogs, ������� ������������� ������.*/

-- ****************************������� GB********************************
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


-- ***************************2-�� �������********************************

SELECT 
	products.name AS product_name, 
	catalogs.name AS product_type 
FROM 
	products 
LEFT JOIN 
	catalogs 
ON 
	products.catalog_id = catalogs.id;

/* 3 (�� �������) ����� ������� ������� ������ flights (id, from, to) � ������� ������� cities (label, name). 
���� from, to � label �������� ���������� �������� �������, ���� name � �������. 
�������� ������ ������ flights � �������� ���������� �������.*/



-- �������� ���� avia

CREATE DATABASE avia;
USE avia;
   
CREATE TABLE IF NOT EXISTS flights(
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(50) NOT NULL COMMENT '�� ���� �� ����������', 
	`to` VARCHAR(50) NOT NULL COMMENT '���� �� ����������'
);

CREATE TABLE  IF NOT EXISTS cities(
	label VARCHAR(50) PRIMARY KEY COMMENT '����������� �� ���������', 
	name VARCHAR(50) COMMENT '����� ������� �� �������'
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
	('Moscow', '������'),
	('Saint Petersburg', '�����-���������'),
	('Omsk', '����'),
	('Tomsk', '�����'),
	('Ufa', '���');

INSERT INTO 
	avia.flights 
VALUES
	(NULL, 'Moscow', 'Saint Petersburg'),
	(NULL, 'Saint Petersburg', 'Omsk'),
	(NULL, 'Omsk', 'Tomsk'),
	(NULL, 'Tomsk', 'Ufa'),
	(NULL, 'Ufa', 'Moscow');   
   
-- ����� ������� � ������� �� ������� ���� �������.

SELECT
	id AS `�����`,
	(SELECT name FROM cities WHERE label = `from`) AS `������`,
	(SELECT name FROM cities WHERE label = `to`) AS `����`
FROM
	avia.flights
ORDER BY
	`�����`;






