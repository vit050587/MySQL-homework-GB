
-- ************************** ���������, ����������, ���������� � �����������****************************

/* 1 ����� � ������� users ���� created_at � updated_at ��������� ��������������. 
 ��������� �� �������� ����� � ��������. */


UPDATE users SET created_at = NOW(), updated_at = NOW() WHERE created_at is NULL or updated_at is NULL;
UPDATE users SET created_at = IF(created_at is NULL, NOW(), created_at), updated_at = IF(updated_at is NULL, NOW(), updated_at);
UPDATE users SET created_at = NOW() WHERE created_at = NULL; UPDATE users SET updated_at = NOW() WHERE updated_at = NULL;
UPDATE users SET created_at = NOW(), updated_at = NOW();





/* 2 ������� users ���� �������� ��������������. 
 ������ created_at � updated_at ���� ������ ����� VARCHAR 
 � � ��� ������ ����� ���������� �������� � ������� "20.10.2017 8:10". 
 ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������. */

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    birthday_at VARCHAR(255),
    created_at VARCHAR(255),
    updated_at VARCHAR(255)
 ); -- �������������� ������� USERS


ALTER TABLE example.users CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
    ('��������', '20 may 1987', '20.10.2017 8:10', '20.10.2017 8:10'),
    ('�������', '06 august 1990', '20.10.2017 8:10', '20.10.2017 8:10'),
    ('���������', '15 february 1991', '20.10.2017 8:10', '20.10.2017 8:10'),
    ('������', '20 may 1989', '20.10.2017 8:10', '20.10.2017 8:10'),
    ('����', '06 august 1990', '20.10.2017 8:10', '20.10.2017 8:10'),
    ('�����', '15 february 1991', '20.10.2017 8:10', '20.10.2017 8:10'); -- ���������� �������


UPDATE users SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'); 
UPDATE users SET updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');

ALTER TABLE users MODIFY created_at DATETIME DEFAULT CURRENT_TIMESTAMP; 
ALTER TABLE users MODIFY updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;


/* 3 � ������� ��������� ������� storehouses_products � ���� value 
 ����� ����������� ����� ������ �����: 0, ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. 
 ���������� ������������� ������ ����� �������, ����� ��� ���������� � ������� ���������� �������� value. 
 ������, ������� ������ ������ ���������� � �����, ����� ���� �������.  */

INSERT INTO storehouses_products (value) VALUES -- ���������� ������������ � ���� �������
    (0),
    (2500),
    (0),
    (30),
    (500),
    (1);

SELECT * FROM storehouses_products ORDER BY CASE WHEN value = 0 THEN TRUE ELSE FALSE END, value; -- ��������� �� ����������


/* 4 (�� �������) �� ������� users ���������� ������� �������������, ���������� � ������� � ���. 
 ������ ������ � ���� ������ ���������� �������� ('may', 'august') */


SELECT id, name, birthday_at FROM users WHERE (birthday_at LIKE '%may%' OR birthday_at LIKE '%august%');



/* 5 (�� �������) �� ������� catalogs ����������� ������ ��� ������ �������. 
SELECT * FROM catalogs WHERE id IN (5, 1, 2); ������������ ������ � �������, �������� � ������ IN. */


SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIND_IN_SET(id,'5,1,2');



-- ***************************************** ��������� ������ ********************************************


-- 1 ����������� ������� ������� ������������� � ������� users

ALTER TABLE users ADD age INT NOT NULL; -- ������� ������� �������.

UPDATE users SET age = TIMESTAMPDIFF(YEAR, birthday_at, NOW());

SELECT AVG(age) FROM users;




/* 2 ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. 
 ������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������. */



SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS `day`, COUNT(*) AS `number` FROM users GROUP BY day ORDER BY `number` DESC;



-- 3 (�� �������) ����������� ������������ ����� � ������� �������


DROP TABLE IF EXISTS tbl;
CREATE TABLE tbl (
	id SERIAL PRIMARY KEY, 
	value INT NOT NULL
); -- �������� ������� �� �� 

INSERT INTO tbl (value) VALUES  -- ���������� ������ �������
	(1), 
	(2), 
	(3), 
	(4), 
	(5);


SELECT exp(SUM(ln(value))) summ FROM tbl; -- ��������� ���������� ������������ ��������.



