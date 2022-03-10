FROM alpine:3.12

#install services
RUN apk update && apk upgrade
RUN apk add nginx openssl openrc supervisor php7-mbstring php7-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

#setting SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl_odomenic.key -out /etc/ssl/certs/ssl_odomenic.crt -subj "/C=RU/L=Moscow/O=school21/OU=school21/CN=localhost/"

#setting phpMyAdmin
RUN mkdir -p /var/www/phpmyadmin && mkdir -p /var/www/phpmyadmin/tmp && chmod -R 777 /var/www/phpmyadmin/tmp
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz && \
	tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
	rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv ./phpMyAdmin-5.0.2-all-languages/* /var/www/phpmyadmin/
COPY ./config.inc.php /var/www/phpmyadmin/

#telegraf
RUN apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf
COPY ./telegraf.conf /etc/

#copy
COPY ./supervisord.conf /etc/
RUN mkdir -p /run/nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./start_pma.sh /
RUN chmod +x start_pma.sh

#to start
EXPOSE 5000
ENTRYPOINT sh start_pma.sh
