FROM alpine:3.12

#instll service
RUN apk update && apk upgrade
RUN apk add openrc influxdb supervisor

#telegraf
RUN apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf
COPY ./telegraf.conf /etc/

#copy
COPY ./supervisord.conf /etc/
COPY ./start_influxdb.sh /
RUN chmod +x start_influxdb.sh

#to start
EXPOSE 8086
ENTRYPOINT sh start_influxdb.sh
