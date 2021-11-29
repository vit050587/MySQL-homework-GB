/* 1 ����� ����� ��������� ������������. �� ���� ������������� ���. ���� ������� ��������, 
������� ������ ���� ������� � ��������� ������������� (������� ��� ���������).*/


USE vk;


SELECT users.lastname AS best_friend, COUNT(incoming.from_user_id) + COUNT(incoming.to_user_id) AS letters 
	FROM users
    LEFT JOIN messages AS incoming 
		ON users.id = incoming.from_user_id
	    AND incoming.to_user_id = 10 -- ������� ���� ������������� �� ������� ������� ������ 10-�� ������������
    LEFT JOIN messages AS outgoing
	    ON users.id = outgoing.to_user_id
	    AND outgoing.from_user_id = 10 -- ������� ���� �������������, ���� ����� 10-�� ������������
 GROUP BY best_friend -- ���������� �� ���� �������� �������������
 ORDER BY letters DESC -- �������� ����������
 LIMIT 1; -- ����������� � ���� ������ (������) �������������� �������
 

/*2 ���������� ����� ���������� ������, ������� �������� ������������ ������ 10 ���.*/

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

/*3 ���������� ��� ������ �������� ������ (�����): ������� ��� �������.*/

SELECT gender 
FROM (
	SELECT gender, COUNT((
		SELECT COUNT(*) 
		FROM likes as L 
		WHERE L.user_id = P.user_id
		)) as likes_count 
	FROM profiles as P
WHERE gender = 'm' -- ����� ���������� ��� �����
GROUP BY gender
UNION ALL
SELECT gender, COUNT((
	SELECT COUNT(*) 
	FROM likes as L 
	WHERE L.user_id = P.user_id)) 
FROM profiles as P
WHERE gender = 'f' -- ����� ������������ ���� �����
GROUP BY gender -- ����������� �� ����
) AS S
GROUP BY gender -- ����������� �� ����
ORDER BY MAX(likes_count) DESC -- ���������� �� ������������� �������� ������
LIMIT 1;