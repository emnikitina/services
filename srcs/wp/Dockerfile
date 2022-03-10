FROM alpine:3.12

#instal services
RUN apk update && apk upgrade
RUN apk add nginx openrc supervisor php7-fpm php7-mbstring php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-pdo php7-pdo_mysql

#setting wordpress
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -C /var/www/ -xzvf latest.tar.gz
RUN rm latest.tar.gz
COPY ./wp-config.php /var/www/wordpress/
RUN chown -R nginx:nginx /var/www/wordpress 
RUN chmod -R 777 /var/www/wordpress
RUN chown -R nginx:nginx /var/www
RUN chmod -R 777 /var/www

#telegraf
RUN apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf
COPY ./telegraf.conf /etc/

#to copy
COPY ./supervisord.conf /etc/
COPY ./nginx.conf /etc/nginx/conf.d/
RUN mkdir -p /run/nginx
COPY ./start_wp.sh /
RUN chmod +x start_wp.sh

#to start
EXPOSE 5050
ENTRYPOINT sh start_wp.sh
