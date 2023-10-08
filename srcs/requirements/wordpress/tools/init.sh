#!/bin/sh

if [ ! -f wp-config.php ]; then
wp config create --dbname=${MARIADB_DB_NAME} \
                 --dbuser=${MARIADB_ADMIN_USERNAME} \
                 --dbpass=${MARIADB_ADMIN_PASSWORD} \
                 --dbhost=mariadb:3306;

wp core install --url=${WORDPRESS_HTTPS_URL} \
                --title=${WORDPRESS_TITLE_WEBSITE} \
                --admin_user=${WORDPRESS_ADMIN} \
                --admin_password=${WORDPRESS_PASS} \
                --admin_email=${WORDPRESS_MAIL};

wp user create ${WORDPRESS_AUTHOR_USERNAME} ${WORDPRESS_AUTHOR_MAIL} \
	--user_pass=${WORDPRESS_AUTHOR_PASS} \
	--role=author;
fi

exec php-fpm81 -F;
