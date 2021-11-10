
SELECT DISTINCT firstname FROM users; -- выводит список уникальных имен


ALTER TABLE profiles ADD is_active BIT DEFAULT false NULL; -- добавляет в таблицу profiles колонку статуса is_active со значением по умолчанию FALSE


UPDATE profiles SET is_active = 1 WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5)) < 18; -- проставили значение TRUE всем несовершеннолетним пользователям


UPDATE messages SET created_at='2222-11-24 04:06:29' WHERE id = 2; -- присвоили будущую дату второму сообщению


DELETE FROM messages WHERE created_at > now(); -- удалим будущее второе сообщение

