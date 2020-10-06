#!/bin/bash

crontab -u www-data /cron.txt
/etc/init.d/cron start

/etc/init.d/php7.2-fpm start
/etc/init.d/nginx start

exec "$@"
