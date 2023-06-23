# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgirondo <rgirondo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/06 16:29:52 by rgirondo          #+#    #+#              #
#    Updated: 2023/06/23 19:31:02 by rgirondo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster


RUN			apt-get -y					update
RUN			apt-get -y					upgrade
RUN         apt-get -y                  install mariadb-server mariadb-client

COPY        ./mariadb/50-server.cnf             /etc/mysql/mariadb.conf.d/
COPY        ./mariadb/util.sh                   .

EXPOSE		3306

CMD [ "bash", "util.sh" ]