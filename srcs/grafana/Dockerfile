FROM alpine:3.12

#install services
RUN apk update && apk upgrade
RUN apk add openrc supervisor

#grafana
RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/
ADD https://dl.grafana.com/oss/release/grafana-7.5.4.linux-amd64.tar.gz .
COPY ./grafana.db /usr/share/grafana/data/

#telegraf
RUN apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf
COPY ./telegraf.conf /etc/

#copy
COPY ./supervisord.conf /etc/
COPY ./start_grafana.sh /
RUN chmod +x start_grafana.sh

#to start
EXPOSE 3000
ENTRYPOINT sh start_grafana.sh
