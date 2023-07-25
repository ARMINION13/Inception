# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgirondo <rgirondo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/23 19:12:53 by rgirondo          #+#    #+#              #
#    Updated: 2023/07/19 18:18:31 by rgirondo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception

all: $(NAME)

$(NAME) :
		echo "127.0.0.1 rgirondo.42.fr" >> /etc/hosts
		mkdir -p /home/rgirondo/data
		mkdir -p /home/rgirondo/data/mariadb
		mkdir -p /home/rgirondo/data/wordpress
		cd srcs && docker-compose up --build

fclean:
	-docker stop $$(docker ps -aq);
	-docker container rm -f $$(docker container ls -aq);
	-docker image rm -f $$(docker image ls -aq);
	-docker volume rm -f $$(docker volume ls -q);
	-docker network rm srcs_network_1;
	rm -rf /home/rgirondo/data

re: fclean all