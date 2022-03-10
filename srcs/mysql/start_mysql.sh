#!/bin/sh
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root mysql < create_bd.sql
mysql -u root wordpress < services_database.sql
rc-service mariadb stop
/usr/bin/supervisord -c /etc/supervisord.conf
