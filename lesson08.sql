/* 1 ѕусть задан некоторый пользователь. »з всех пользователей соц. сети найдите человека, 
который больше всех общалс€ с выбранным пользователем (написал ему сообщений).*/


USE vk;


SELECT users.lastname AS best_friend, COUNT(incoming.from_user_id) + COUNT(incoming.to_user_id) AS letters 
	FROM users
    LEFT JOIN messages AS incoming 
		ON users.id = incoming.from_user_id
	    AND incoming.to_user_id = 10 -- выборка всех пользователей от которых получил письма 10-ый пользователь
    LEFT JOIN messages AS outgoing
	    ON users.id = outgoing.to_user_id
	    AND outgoing.from_user_id = 10 -- выборка всех пользователей, кому писал 10-ый пользователь
 GROUP BY best_friend -- групировка по всем попавшим пользовател€м
 ORDER BY letters DESC -- обратна€ сортировка
 LIMIT 1; -- ограничение в одну строку (первую) результирующей таблицы
 

/*2 ѕодсчитать общее количество лайков, которые получили пользователи младше 10 лет.*/

SELECT users.firstname, users.lastname, media.filename, count(*) as likes_count
FROM users
JOIN media 
	ON users.id = media.user_id
JOIN likes 
	ON media.id = likes.media_id
JOIN profiles (	
	SELECT user_id, COUNT(*)
	FROM profiles
	WHERE (YEAR(NOW())-YEAR(birthday)) < 10
	) AS p
		ON users.id = p.user_id 	
GROUP BY users.id
ORDER BY likes_count DESC;

/*3 ќпределить кто больше поставил лайков (всего): мужчины или женщины.*/

SELECT gender 
FROM (
	SELECT gender, COUNT((
		SELECT COUNT(*) 
		FROM likes as L 
		WHERE L.user_id = P.user_id
		)) as likes_count 
	FROM profiles as P
WHERE gender = 'm' -- лайки поставлены муж полом
GROUP BY gender
UNION ALL
SELECT gender, COUNT((
	SELECT COUNT(*) 
	FROM likes as L 
	WHERE L.user_id = P.user_id)) 
FROM profiles as P
WHERE gender = 'f' -- лайки поставленные женс полом
GROUP BY gender -- группировка по полу
) AS S
GROUP BY gender -- группировка по полу
ORDER BY MAX(likes_count) DESC -- сортировка по максимальному значению лайков
LIMIT 1;