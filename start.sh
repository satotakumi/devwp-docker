#/bin/sh
docker-compose up -d
docker exec -it $(docker-compose ps -q wordpress) ln -s /usr/src/devtheme /var/www/html/wp-content/themes/devtheme