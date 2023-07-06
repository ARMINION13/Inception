#!/bin/bash

/etc/init.d/mysql start

mysql -u root -e ""

echo Creating database.

mysql -e "CREATE DATABASE IF NOT EXISTS $DATABASE;"

echo Creating new user.

mysql -e "CREATE USER IF NOT EXISTS '${DATABASE_USER}' IDENTIFIED BY '${DATABASE_PASSWORD}';"

echo Granting privileges to the new user.

mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DATABASE_USER}' IDENTIFIED BY '${DATABASE_PASSWORD}';"

echo Changing root password.

mysql -e "FLUSH PRIVILEGES;"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DATABASE_ROOT_PASSWORD';"

echo Stopping mysql service.

mysql -u root --password=$DATABASE_ROOT_PASSWORD -e "SHUTDOWN;" > /dev/null 2> /dev/null

sleep 2

echo Starting mysqld_safe

mysqld_safe