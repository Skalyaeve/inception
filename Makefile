SRCS= src
COMPOSER= docker-compose.yml

all:
	mkdir -p ~/data/WordPress
	mkdir -p ~/data/DB
	docker-compose -f $(SRCS)/$(COMPOSER) build
	docker-compose -f $(SRCS)/$(COMPOSER) up

stop:
	docker-compose -f $(SRCS)/$(COMPOSER) down

clean:
	docker system prune

fclean:
	docker system prune -fa
	docker volume rm src_WP
	docker volume rm src_DB
	echo "Done, you also might want to remove ~/data"

re: fclean all

.PHONY: all stop clean fclean re
