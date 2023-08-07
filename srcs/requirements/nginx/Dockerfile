# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgirondo <rgirondo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/06 16:29:52 by rgirondo          #+#    #+#              #
#    Updated: 2023/06/23 19:32:00 by rgirondo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster

RUN			apt-get -y					update
RUN			apt-get -y					upgrade
RUN			apt -y install				nginx openssh-server openssl
COPY		./requirements/nginx/conf/default			/etc/nginx/sites-available/default
COPY		./requirements/nginx/conf/nginx.conf			/etc/nginx/nginx.conf
RUN			mkdir					    /etc/nginx/ssl
RUN			chmod 700				    /etc/nginx/ssl
RUN			openssl						req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=SP/ST=Spain/L=Madrid/O=42Madrid/CN=127.0.0.1" -keyout /etc/nginx/ssl/example.key -out /etc/nginx/ssl/example.crt

CMD			["nginx", "-g", "daemon off;"]