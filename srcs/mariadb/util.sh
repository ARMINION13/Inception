#!/bin/bash

/etc/init.d/mysql start

echo Creating database.

mysql -e "CREATE DATABASE IF NOT EXISTS $DATABASE;"

echo Creating new user.

mysql -e "CREATE USER IF NOT EXISTS '${DATABASE_USER}' IDENTIFIED BY '${DATABASE_PASSWORD}';"

echo Granting privileges to the new user.

mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DATABASE_USER}' IDENTIFIED BY '${DATABASE_PASSWORD}';"

mysql -e "FLUSH PRIVILEGES;"

echo Changing root password.

mysql -e "update mysql.user set plugin = 'mysql_native_password' where User = 'root';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DATABASE_ROOT_PASSWORD';" >> /dev/null

echo Stopping mysql service.

mysql -u root -p$DATABASE_ROOT_PASSWORD -e "SHUTDOWN;"

echo Starting mysqld_safe

mysqld