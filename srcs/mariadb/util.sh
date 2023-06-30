#!/bin/bash

su root service mysql start

mysql -p${DATABASE_ROOT_PASSWORD} -e "SET PASSWORD FOR 'root'@'localhost'='';"

mysql -e "CREATE DATABASE IF NOT EXISTS $DATABASE;"

mysql -e "CREATE USER IF NOT EXISTS 'root' IDENTIFIED BY '${DATABASE_ROOT_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root' IDENTIFIED BY '${DATABASE_ROOT_PASSWORD}';"

mysql -e "CREATE USER IF NOT EXISTS '${DATABASE_USER}' IDENTIFIED BY '${DATABASE_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DATABASE_USER}' IDENTIFIED BY '${DATABASE_PASSWORD}';"

mysql -e "FLUSH PRIVILEGES;"

#mysql --user=root --password=${MYSQL_ROOT_PASSWORD} -e "UPDATE mysql.user SET Password=PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User='root';"

mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DATABASE_ROOT_PASSWORD}');"

mysql -p${DATABASE_ROOT_PASSWORD} -e "shutdown;"

mysqld