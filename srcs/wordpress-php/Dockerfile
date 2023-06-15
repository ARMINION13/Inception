# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgirondo <rgirondo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/11 12:59:34 by rgirondo          #+#    #+#              #
#    Updated: 2023/06/15 18:18:00 by rgirondo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster

RUN			apt-get -y					update
RUN			apt-get -y					upgrade
RUN			apt -y install				php-mysql php-fpm curl wget

WORKDIR		/var/www/html
RUN			wget						https://wordpress.org/wordpress-6.0.tar.gz
RUN			tar							-xvzf wordpress-6.0.tar.gz && rm -rf wordpress-6.0.tar.gz

EXPOSE		9000	

CMD [ "bash" ]