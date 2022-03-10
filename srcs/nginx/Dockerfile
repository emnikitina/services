FROM alpine:3.12

#install service
RUN apk update && apk upgrade
RUN apk add nginx openssl supervisor

#setting ssl certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl_odomenic.key -out /etc/ssl/certs/ssl_odomenic.crt -subj "/C=RU/L=Moscow/O=school21/OU=school21/CN=localhost/"

#telegraf
RUN apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf
COPY ./telegraf.conf /etc/

#copy
COPY ./default /etc/nginx/conf.d/default.conf
COPY ./start_nginx.sh /
COPY ./supervisord.conf /etc/
RUN chmod +x start_nginx.sh
RUN mkdir -p /run/nginx

#to start
EXPOSE 80 443
ENTRYPOINT sh start_nginx.sh
