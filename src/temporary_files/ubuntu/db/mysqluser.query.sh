CREATE USER 'username'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON dbname.* TO 'username'@'%';
FLUSH PRIVILEGES;