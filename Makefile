NAME = inception
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

all : $(NAME)

$(NAME): build startd

build:
	docker-compose -f $(DOCKER_COMPOSE_FILE) build

start:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up

startd:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

clean:
	-@docker rmi			mariadb wordpress nginx 2>/dev/null || true
	docker system prune -f

softclean:
	sudo docker-compose down --rmi all

retry: softclean startd

volume_fclean:
	-@docker volume rm	db_data wp_html 2>/dev/null || true

fclean: down clean volume_fclean
	docker image prune -af

re: fclean all

prune_all:
	docker system prune --volumes -fa

clean_local:
	sudo rm -rf /home/afaraji/data/db_data/*
	sudo rm -rf /home/afaraji/data/wp_data/*
	sudo rm -rf /home/afaraji/data/wp_data/.htaccess

fre: fclean clean_local all

purge:
	docker stop $$(docker ps -qa) || true
	docker rm $$(docker ps -qa) || true
	docker rmi -f $$(docker images -qa) || true
	docker volume rm $$(docker volume ls -q) || true
	docker network rm $$(docker network ls -q) 2>/dev/null || true

# stop all containers:
# 	docker-compose down

# delete all containers:
# 	docker rm -f $(docker ps -a -q)

# delete all volumes:
# 	docker volume rm $(docker volume ls -q)

# remove all unused images:
# 	docker image prune -af

# remove all except volumes:
# 	docker system prune

# remove everything unused:
# 	docker system prune --volumes -fa


# docker run -it -p 80:80 --name container_name alpine:3.15 /bin/sh
