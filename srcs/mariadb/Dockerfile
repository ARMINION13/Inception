# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgirondo <rgirondo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/06 16:29:52 by rgirondo          #+#    #+#              #
#    Updated: 2023/07/07 00:43:22 by rgirondo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster


RUN			apt-get -y					update
RUN			apt-get -y					upgrade
RUN         apt-get -y                  install mariadb-server

COPY        ./mariadb/50-server.cnf             /etc/mysql/mariadb.conf.d/
COPY        ./mariadb/util.sh                   .

EXPOSE		3306

ENTRYPOINT [ "./util.sh" ]