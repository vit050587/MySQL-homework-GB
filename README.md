# Основы реляционных баз данных. MySQL
![MarkDown](https://github.com/vit050587/MySQL-homework-GB/blob/master/MySQL.jpg)

Познакомитесь с языком запросов SQL. Научитесь писать запросы, делать расчёты и работать с таблицами. Узнаете основные ограничения SQL. Поработаете с MySQL и познакомитесь с альтернативными базами данных: MongoDB, Redis, ElasticSearch и ClickHouse.
##### Чему Вы научитесь
* SQL: простые запросы
* Знание основ теории баз данных (связь таблиц, витрины)
# Урок 1. 
## Вебинар. Установка окружения. DDL-команды
Дорогие студенты!
К этому уроку очень простое, но важное для построения дальнейших уроков дополнительное задание.
Напишите ответы на вопросы в комментарий при сдаче практического задания:
* 1 Какие у вас ожидания от курса? Есть ли конкретные вопросы по теме Базы данных?
* 2 В какой сфере работаете сейчас?
* 3 Если в IT, то какой у вас опыт (инструменты, технологии, языки программирования)?
Решения практических заданий в данном курсе присылайте, пожалуйста, в виде текстовых файлов со скриптами (исполненными командами). Для таких скриптов, как правило, используется расширение файла "*.sql" (например, "homework_1.sql")*
# Урок 2.
## Практическое задание по теме “Управление БД”
* 1 Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
* 2 Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
* 3 Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
(по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
# Урок 3. 
## Вебинар. Введение в проектирование БД
Практическое задание по теме “Введение в проектирование БД”
* 1 Написать крипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
