FROM alpine:3.12

#install services
RUN apk update && apk upgrade
RUN apk add openssl vsftpd supervisor

#create user
RUN mkdir -p /etc/ftps/odomenic
RUN adduser --home=/etc/ftps/odomenic -D odomenic
RUN echo "odomenic:odomenic21" | chpasswd
#add user to list
RUN echo "odomenic" >> /etc/vsftpd/vsftpd.userlist

#setting ssl certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl_odomenic.key -out /etc/ssl/certs/ssl_odomenic.crt -subj "/C=RU/L=Moscow/O=school21/OU=school21/CN=localhost/"

#telegraf
RUN apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf
COPY ./telegraf.conf /etc/

#copy
#RUN mkdir -p /var/ftp
COPY ./vsftpd.conf /etc/vsftpd/
COPY ./supervisord.conf /etc/
COPY ./start_ftps.sh /
RUN chmod +x start_ftps.sh

#to start
EXPOSE 21 21000
CMD ./start_ftps.sh
