
SELECT DISTINCT firstname FROM users; -- ������� ������ ���������� ����


ALTER TABLE profiles ADD is_active BIT DEFAULT false NULL; -- ��������� � ������� profiles ������� ������� is_active �� ��������� �� ��������� FALSE


UPDATE profiles SET is_active = 1 WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5)) < 18; -- ���������� �������� TRUE ���� ������������������ �������������


UPDATE messages SET created_at='2222-11-24 04:06:29' WHERE id = 2; -- ��������� ������� ���� ������� ���������


DELETE FROM messages WHERE created_at > now(); -- ������ ������� ������ ���������

