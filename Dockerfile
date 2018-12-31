FROM wordpress:php7.1-apache

COPY . /var/www/html

RUN cd my_repo
RUN docker build -t 'wp-image' .

RUN docker run --name mysql-cont -e MYSQL_ROOT_PASSWORD=qwerty -d mysql:5.7
RUN docker run --name wp-cont --link mysql-cont:mysql -p 8000:80 -d wp-image
