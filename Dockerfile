FROM wordpress:php7.1-apache

COPY . /var/www/html

RUN cd
CMD docker build -t 'wp-image' .

CMD docker run --name mysql-cont -e MYSQL_ROOT_PASSWORD=qwerty -d mysql:5.7
CMD docker run --name wp-cont --link mysql-cont:mysql -p 8000:80 -d wp-image
