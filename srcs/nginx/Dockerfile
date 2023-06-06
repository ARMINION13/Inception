# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgirondo <rgirondo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/06 16:29:52 by rgirondo          #+#    #+#              #
#    Updated: 2023/06/06 18:58:44 by rgirondo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster

RUN			apt-get -y										update
RUN			apt-get -y										upgrade
RUN			apt -y install									nginx openssh-server openssl

COPY		./conf/default				/etc/nginx/sites-available/default
COPY		./conf/nginx.conf			/etc/nginx/nginx.conf

RUN			mkdir											/etc/nginx/ssl
RUN			chmod 700										/etc/nginx/ssl

CMD			["nginx", "-g", "daemon off;"]