# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgirondo <rgirondo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/11 12:59:34 by rgirondo          #+#    #+#              #
#    Updated: 2023/07/25 06:01:25 by rgirondo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster

RUN			apt-get -y					update
RUN			apt-get -y					upgrade
RUN			apt -y install				php-mysql php-fpm curl wget vim

COPY        ./requirements/wordpress-php/conf/www.conf   /etc/php/7.3/fpm/pool.d/

WORKDIR		/var/www/html

RUN			wget						https://wordpress.org/wordpress-6.0.tar.gz
RUN			tar							-xvzf wordpress-6.0.tar.gz && rm -rf wordpress-6.0.tar.gz

RUN         cp wordpress/wp-config-sample.php wordpress/wp-config.php
#COPY        ./wordpress-php/conf/wp-config.php     wordpress

RUN         chmod                       -R 755 wordpress
RUN         chown                       -R www-data:www-data wordpress
RUN         mv                          wordpress/* .

COPY        ./requirements/wordpress-php/tools/util.sh                   .

RUN         mkdir                       /run/php
RUN         chmod                       -R 755 /run/php

RUN         wget                        https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN         chmod +x                    wp-cli.phar
RUN         mv                          wp-cli.phar                     /usr/local/bin/wp

EXPOSE		9000	

ENTRYPOINT [ "./util.sh" ]