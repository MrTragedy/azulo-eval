ALTER USER 'user'@'%' IDENTIFIED WITH mysql_native_password BY 'user_password';
GRANT ALL PRIVILEGES ON airportart_db.* TO 'user'@'%';
FLUSH PRIVILEGES;
