#!/bin/bash
sleep 4

sed -i "s/username_here/$DATABASE_USER/g" wp-config.php
sed -i "s/password_here/$DATABASE_PASSWORD/g" wp-config.php
sed -i "s/localhost/$DATABASE_HOST/g" wp-config.php
sed -i "s/database_name_here/$DATABASE/g" wp-config.php

/usr/local/bin/wp core install --allow-root --path=$WP_DIR --url=$WP_URL --title=$WP_NAME --admin_user=$WP_USERNAME --admin_password=$WP_USERPASS --admin_email=$WP_EMAIL

php-fpm7.3 -F