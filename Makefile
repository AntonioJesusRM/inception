# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aruiz-mo <aruiz-mo@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/22 09:38:20 by aruiz-mo          #+#    #+#              #
#    Updated: 2023/09/22 12:08:26 by aruiz-mo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

REQUIREMENT= wordpress nginx mariadb

REQU_PATH=   $(addprefix srcs/requirements/, $(REQUIREMENT))

VOLUME = wp db

COLOR = \033[1;32m

VOLUME_PATH =  $(addprefix $(HOME)/aruiz-mo/data/, $(VOLUME))

all:
	@for i in $(VOLUME_PATH); do mkdir -p $$i; done
	@echo "$(COLOR)aruiz-mo directory successfully created"
	docker compose -f ./srcs/docker-compose.yml up -d --build
	
clean:
	@sudo rm -rf ~/aruiz-mo/
	@echo "$(COLOR)aruiz-mo directory successfully deleted"
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm inception_network

re: clean all

.PHONY: all re clean
