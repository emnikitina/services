FROM alpine:3.12

#install service
RUN apk update && apk upgrade
RUN apk add mysql mysql-client openrc supervisor 

#copy
COPY ./my.cnf /etc/
COPY ./start_mysql.sh /
RUN chmod +x start_mysql.sh
COPY ./create_bd.sql /
COPY ./services_database.sql /
COPY ./supervisord.conf /etc/

#telegraf
RUN apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf
COPY ./telegraf.conf /etc/

#to start
VOLUME ["/var/lib/mysql"]
EXPOSE 3306
ENTRYPOINT sh start_mysql.sh
