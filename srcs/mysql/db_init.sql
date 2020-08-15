DROP DATABASE test;
CREATE DATABASE wordpress;
CREATE USER 'sseo'@'%' IDENTIFIED BY 'test';
GRANT ALL PRIVILEGES ON *.* TO 'sseo'@'%' WITH GRANT OPTION;
UPDATE mysql.user SET password='c3VwZXItc2VjcmV0LXBhc3N3b3jk' WHERE user='root';
UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='root';
FLUSH PRIVILEGES;
