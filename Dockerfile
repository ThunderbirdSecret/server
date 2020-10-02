FROM debian:buster

EXPOSE  80 443

RUN     apt-get update && apt-get upgrade -y &&\
		apt-get install -y vim \
		nginx mariadb-server php7.3-fpm \
		php7.3-mysql \
		openssl &&\
		mkdir var/www/server

COPY    srcs var/www/server/

RUN     mv /var/www/server/my_nginx /etc/nginx/sites-available &&\
		ln -s /etc/nginx/sites-available/my_nginx etc/nginx/sites-enabled/my_nginx &&\
		rm etc/nginx/sites-enabled/default etc/nginx/sites-available/default &&\
		service mysql start && mysql < /var/www/server/mariadb_script &&\
		chown -R www-data:www-data var/www/server

RUN openssl req -newkey rsa:2048 -nodes\
		-keyout /etc/ssl/certs/localhost.key\
		-out /etc/ssl/certs/localhost.crt\
		-x509 -days 365\
		-subj "/C=RU/ST=RT/L=Kazan/O=21school/OU=students/CN=localhost"

CMD     service nginx start &&\
		service php7.3-fpm start &&\
		service mysql start && sleep infinity