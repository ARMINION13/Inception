# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgirondo <rgirondo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/23 19:12:53 by rgirondo          #+#    #+#              #
#    Updated: 2023/06/23 19:34:47 by rgirondo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception

all: $(NAME)

$(NAME) :
		echo "127.0.0.1 rgirondo.42.fr" >> /etc/hosts
		cd srcs && docker-compose up --build

fclean:
		@echo "\033[0;36mCleaning ...\033[0m";
		@docker container rm -f $$(docker container ls -aq) > /dev/null 2>&1; docker image rm -f $$(docker image ls -aq) > /dev/null 2>&1; docker volume rm -f $$(docker volume ls -q) > /dev/null 2>&1; docker network rm $$(docker network ls -q) > /dev/null 2>&1; echo "\n\033[0;32mAll cleaned :)\033[0m";

re: fclean all