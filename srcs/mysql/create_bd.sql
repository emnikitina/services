CREATE DATABASE wordpress;
CREATE USER 'odomenic'@'%' IDENTIFIED BY 'odomenic21';
GRANT ALL PRIVILEGES ON wordpress.* TO 'odomenic'@'%';
FLUSH PRIVILEGES;
