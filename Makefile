# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmourdal <mmourdal@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/10 03:16:15 by mmourdal          #+#    #+#              #
#    Updated: 2023/10/09 00:53:20 by mmourdal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
#                                  ASCII ART                                   #
################################################################################

DOCKER_BLUE_BOLD = \033[1;96m
END		= \033[0m     

ART_NAME_1 =                        \#\#         .\n
ART_NAME_2 =                 \#\# \#\# \#\#        ==\n
ART_NAME_3 =               \#\# \#\# \#\# \#\#       ===\n
ART_NAME_4 =           /\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\___/ ===\n
ART_NAME_5 =	  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~\n
ART_NAME_6 =           \______ X           __/\n
ART_NAME_7 =             \    \         __/\n
ART_NAME_8 =              \____\_______/\n\n
ART_NAME_9 =      ____                      __  _           \n
ART_NAME_10 =    /  _/___  ________  ____  / /_(_)___  ____ \n
ART_NAME_11 =    / // __ \/ ___/ _ \/ __ \/ __/ / __ \/ __ \ \n
ART_NAME_12 =  _/ // / / / /__/  __/ /_/ / /_/ / /_/ / / / /\n
ART_NAME_13 = /___/_/ /_/\___/\___/ .___/\__/_/\____/_/ /_/ \n
ART_NAME_14 =                    /_/                        \n
WHALE = printf "\n$(DOCKER_BLUE_BOLD) %27s $(ART_NAME_1) %21s $(ART_NAME_2) %18s $(ART_NAME_3) %13s $(ART_NAME_4) %8s $(ART_NAME_5) %13s $(ART_NAME_6) %14s $(ART_NAME_7) %15s $(ART_NAME_8) $(BLINK) %5s $(ART_NAME_9) %5s $(ART_NAME_10) %5s $(ART_NAME_11) %3s $(ART_NAME_12) %2s $(ART_NAME_13) %21s $(ART_NAME_14) \n $(END)\b\r"

################################################################################
#                                  MAKEFILE                                    #
################################################################################


all :
			@if [ ! -f srcs/.env ]; then \
				echo "[❌] The .env file does not exist in srcs/"; \
				echo "Example .env content needed for it to work correctly :"; \
				echo ""; \
				echo "# MARIADB"; \
				echo "MARIADB_ADMIN_USERNAME=admin"; \
				echo "MARIADB_ADMIN_PASSWORD=adminpassword"; \
				echo "MARIADB_ROOT_PASSWORD=rootpassword"; \
				echo "MARIADB_DB_NAME=wordpress"; \
				echo ""; \
				echo "# WORDPRESS ADMIN"; \
				echo "WORDPRESS_HTTPS_URL=https://example.com"; \
				echo "WORDPRESS_ADMIN=adminuser"; \
				echo "WORDPRESS_PASS=adminpass"; \
				echo "WORDPRESS_MAIL=admin@example.com"; \
				echo "WORDPRESS_TITLE_WEBSITE=My Website"; \
				echo ""; \
				echo "# WORDPRESS AUTHOR USER"; \
				echo "WORDPRESS_AUTHOR_USERNAME=authoruser"; \
				echo "WORDPRESS_AUTHOR_PASS=authorpass"; \
				echo "WORDPRESS_AUTHOR_MAIL=author@example.com"; \
				echo ""; \
				echo "# REDIS"; \
				echo "REDIS_PASSWORD=redispassword"; \
				echo ""; \
				exit 1; \
			fi
			@$(WHALE)
			@if [ -d /home/${USER}/data/mariadb ]; then \
        		echo "[✅] The directory mariadb in data already exists"; \
    		else \
        		mkdir -p /home/${USER}/data/mariadb; \
				echo "[✅] The directory mariadb in data just been created"; \
    		fi
			@if [ -d /home/${USER}/data/wordpress ]; then \
        		echo "[✅] The directory wordpress in data already exists"; \
    		else \
        		mkdir -p /home/${USER}/data/wordpress; \
				echo "[✅] The directory wordpress in data has just been created"; \
    		fi
			@if [ -d /home/${USER}/data/adminer ]; then \
        		echo "[✅] The directory adminer in data already exists"; \
    		else \
        		mkdir -p /home/${USER}/data/adminer; \
				echo "[✅] The directory adminer in data just been created"; \
    		fi
			bash -c "cd srcs; docker compose up -d"

clean:
			bash -c "cd srcs; docker compose down"

networks:
			@bash -c "docker network ls"

volumes:
			@bash -c "docker volume ls"

fclean: 	clean
			bash -c "docker system prune --all --force" \
			bash -c "docker image prune --force; docker rmi wordpress:inception nginx:inception mariadb:inception adminer:inception vue-js:inception" \

rmvolumes:
			bash -c "docker volume rm www-data data www-adminer" \
			bash -c "rm -rf /home/${USER}/data"

images:
			@bash -c "docker images"

logs:
			@bash -c "docker compose logs"

re: 		fclean all

.PHONY: all clean fclean re networks volumes rmvolumes images logs
