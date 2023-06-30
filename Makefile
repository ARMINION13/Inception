# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgirondo <rgirondo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/23 19:12:53 by rgirondo          #+#    #+#              #
#    Updated: 2023/06/30 22:19:14 by rgirondo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception

all: $(NAME)

$(NAME) :
		#echo "127.0.0.1 rgirondo.42.fr" >> /etc/hosts
		mkdir -p ~/42madrid
		mkdir -p ~/42madrid/mariadb
		mkdir -p ~/42madrid/wordpress
		cd srcs && docker-compose up --build

fclean:
	docker container rm -f $$(docker container ls -aq);
	docker image rm -f $$(docker image ls -aq);
	docker volume rm -f $$(docker volume ls -q);
	#docker network rm $$(docker network ls -q);

re: fclean all