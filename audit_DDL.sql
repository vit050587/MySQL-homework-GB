DROP DATABASE IF EXISTS audit;
CREATE DATABASE audit;
USE audit;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(120) UNIQUE,
	phone BIGINT UNSIGNED UNIQUE, 
	
    INDEX users_firstname_lastname_idx(firstname, lastname)
) COMMENT 'пользователи';

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
    gender CHAR(1),
    birthday DATE,
    created_at DATETIME DEFAULT NOW(),
    hometown VARCHAR(100),
	
    FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'Профили пользователей';

DROP TABLE IF EXISTS computers_type;
CREATE TABLE computers_type(
	id SERIAL,
    name VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
)COMMENT 'Тип компьютерной техники';

DROP TABLE IF EXISTS computers;
CREATE TABLE computers (
	id SERIAL,
    owner_user_id BIGINT UNSIGNED NOT NULL,
    computer_type_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(), 
    serial_number VARCHAR(100),
    computer_name VARCHAR(100),

    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (computer_type_id) REFERENCES computers_type(id)
)COMMENT 'Компьютеры';
    
DROP TABLE IF EXISTS users_hardware;
CREATE TABLE users_hardware (
	-- id SERIAL, -- изменил на составной ключ (user_id, computer_id)
	user_id BIGINT UNSIGNED NOT NULL,
    computer_id BIGINT UNSIGNED NOT NULL,
    `status` ENUM ('working_use', 'personal_use') DEFAULT 'working_use',
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP, -- можно будет даже не упоминать это поле при обновлении
	
    PRIMARY KEY (user_id, computer_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (computer_id) REFERENCES computers(id)
)COMMENT 'Оборудование пользователей';

DROP TABLE IF EXISTS software_type;
CREATE TABLE software_type(
	id SERIAL,
    name VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
)COMMENT 'Тип программного обеспечения';

DROP TABLE IF EXISTS software;
CREATE TABLE software(
	id SERIAL,
	software_type_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(150),
	user_id BIGINT UNSIGNED NOT NULL,
	
	INDEX software_name_idx(name), -- индексу можно давать свое имя (software_name_idx)
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (software_type_id) REFERENCES software_type(id)
)COMMENT 'Программное обеспечение';

DROP TABLE IF EXISTS users_software;
CREATE TABLE users_software(
	user_id BIGINT UNSIGNED NOT NULL,
	software_id BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (user_id, software_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (software_id) REFERENCES software(id)
)COMMENT 'Программное обеспечение пользователей';


