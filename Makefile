# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jguerin <jguerin@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/23 12:15:08 by tunsinge          #+#    #+#              #
#    Updated: 2025/04/11 13:02:55 by jguerin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

start:
	@mkdir -p /home/jguerin/data/mariadb
	@mkdir -p /home/jguerin/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build

stop:
	@docker compose -f ./srcs/docker-compose.yml down

clean: stop
	@rm -rf /home/jguerin/data/mariadb
	@rm -rf /home/jguerin/data/wordpress
	@docker system prune -f
	@docker image prune -af
	@docker volume rm srcs_wordpress
	@docker volume rm srcs_mariadb
