# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgirondo <rgirondo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/06 16:29:52 by rgirondo          #+#    #+#              #
#    Updated: 2023/07/19 20:59:55 by rgirondo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster


RUN			apt-get -y					update
RUN			apt-get -y					upgrade
RUN         apt-get -y                  install mariadb-server systemd-sysv vim

COPY        ./requirements/mariadb/conf/50-server.cnf             /etc/mysql/mariadb.conf.d/
COPY        ./requirements/mariadb/tools/util.sh                   .

RUN         chmod 755                   /util.sh

EXPOSE		3306

ENTRYPOINT [ "./util.sh" ]

#CMD [ "tail", "-f" ]