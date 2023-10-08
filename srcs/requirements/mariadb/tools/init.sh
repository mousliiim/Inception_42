#!/bin/sh

mysqld_safe &

until mysqladmin ping >/dev/null 2>&1; do
    sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DB_NAME}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${MARIADB_ADMIN_USERNAME}\`@'localhost' IDENTIFIED BY '${MARIADB_ADMIN_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DB_NAME}\`.* TO \`${MARIADB_ADMIN_USERNAME}\`@'%' IDENTIFIED BY '${MARIADB_ADMIN_PASSWORD}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"

mysql -e "DROP DATABASE IF EXISTS test;"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

exec mysqld_safe;
