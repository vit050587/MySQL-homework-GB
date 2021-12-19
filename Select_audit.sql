USE audit;

-- **************������� ������ ���� ������  ��������� � ������������� � �������� �������*****************

SELECT u.lastname, u.firstname, c.computer_name, ct.name
FROM  users u	
JOIN computers c 
	ON u.id = c.owner_user_id 
JOIN computers_type ct 
	-- ON ct.id = 1
	ON  ct.name = 'laptop'
WHERE u.lastname = '�������'
ORDER BY c.computer_name;

/*****************************������������� ���������� � ���� ������ *************************************
                             ������������ �� �� ���������  � ���������� 
                                      ��������� �� ���������*/

CREATE or replace VIEW l_lap_f_tab
AS 

SELECT s.name, count(*) AS lap_tab
FROM computers c 
/*FROM (
	SELECT * 
	FROM computers
	WHERE computer_type_id = 1 -- �������� �������������� �������
) AS c*/
JOIN users u
	ON u.id = c.owner_user_id 
JOIN software s 
    ON  u.id = s.user_id 
JOIN software_type st
	ON st.id = 1          -- ������������ ��
WHERE c.computer_type_id = 1 -- ������ ��������
GROUP BY s.name

	UNION
	
SELECT s.name, count(*) AS lap_tab
-- FROM computers c
FROM (
	SELECT *
	FROM computers
	WHERE computer_type_id = 2 -- ��������
) AS c
JOIN users u
	ON u.id = c.owner_user_id 
JOIN software s 
    ON  u.id = s.user_id 
JOIN software_type st
	ON st.id = 2	        -- ���������� ����������
GROUP BY s.name
;

-- ������� ������ ��������� ��  �����  ������������

SELECT *
FROM computers
WHERE computer_type_id = 1

-- ������� ������ ��������� ��  �����  ������������

SELECT *
FROM computers
WHERE computer_type_id = 2 

-- ***************��������� ���������� ���������� � ��������� � ������������*******************

-- ������ � ���������� �� ������� � �� 

DROP PROCEDURE IF EXISTS sp_add_computer;

DELIMITER //

CREATE PROCEDURE sp_add_computer(owner_user_id bigint unsigned, computer_type_id bigint unsigned, serial_number varchar(100), computer_name varchar(100), firstname varchar(50), email varchar(120), OUT tran_result varchar(200))
BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
   	DECLARE code varchar(100);
   	DECLARE error_string varchar(100);
    DECLARE last_computer_id int;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN 
    	SET `_rollback` = 1;
	GET stacked DIAGNOSTICS CONDITION 1
    	code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
    	SET tran_result := concat('Error occured. Code: ', code, '. Text: ', error_string);
	END;
		        
	START TRANSACTION;
		INSERT INTO computers (owner_user_id, computer_type_id, serial_number, computer_name)
		VALUES (owner_user_id, computer_type_id, serial_number, computer_name);
	
		SET @last_user_id = last_insert_id();
	
		INSERT INTO users (id, firstname, email)
		VALUES (last_insert_id(), firstname, email); 
	
		IF `_rollback` THEN
		ROLLBACK;
		ELSE
		SET tran_result := 'ok';
		COMMIT;
	END IF;
END// 

DELIMITER ;

CALL  sp_add_computer(25, 2, 'RU100013', 'Name13', '�����', 'piter.parker@svg.com', @tran_result);

SELECT  @tran_result;







