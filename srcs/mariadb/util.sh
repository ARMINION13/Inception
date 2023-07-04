#!/bin/bash

su root service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS $DATABASE;"

mysql -e "CREATE USER IF NOT EXISTS '${DATABASE_USER}' IDENTIFIED BY '${DATABASE_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DATABASE_USER}' IDENTIFIED BY '${DATABASE_PASSWORD}';"

mysql -e "FLUSH PRIVILEGES;"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DATABASE_ROOT_PASSWORD';"

mysqladmin --user=root --password=$DATABASE_ROOT_PASSWORD shutdown

mysqld_safe