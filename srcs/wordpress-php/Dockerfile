# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgirondo <rgirondo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/11 12:59:34 by rgirondo          #+#    #+#              #
#    Updated: 2023/07/09 11:17:17 by rgirondo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster

RUN			apt-get -y					update
RUN			apt-get -y					upgrade
RUN			apt -y install				php-mysql php-fpm curl wget vim

COPY        ./wordpress-php/conf/www.conf   /etc/php/7.3/fpm/pool.d/

WORKDIR		/var/www/html

RUN			wget						https://wordpress.org/wordpress-6.0.tar.gz
RUN			tar							-xvzf wordpress-6.0.tar.gz && rm -rf wordpress-6.0.tar.gz
RUN         chmod                       -R 755 wordpress
RUN         chown                       -R www-data:www-data wordpress
RUN         mv                          wordpress/* .

COPY        ./wordpress-php/util.sh                   .

RUN         mkdir                       /run/php
RUN         chmod                       -R 755 /run/php
RUN         service                     php7.3-fpm stop

EXPOSE		9000	

ENTRYPOINT [ "./util.sh" ]