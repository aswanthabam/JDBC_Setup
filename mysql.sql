CREATE user 'gct'@'localhost' IDENTIFIED BY 'password';
grant All PRIVILEGES ON *.* TO 'gct'@'localhost';
flush PRIVILEGES;