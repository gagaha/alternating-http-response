FROM ubuntu:18.04

RUN apt update && apt install -y nginx php7.2-fpm cron 

COPY index.php /var/www/html/index.php
COPY entrypoint.sh /entrypoint.sh
COPY cron.txt /cron.txt
COPY change-http-response.sh /usr/local/bin/change-http-response.sh
COPY www.conf /etc/php/7.2/fpm/pool.d/www.conf
COPY nginx.conf /etc/nginx/sites-enabled/default

RUN chmod +x /entrypoint.sh /usr/local/bin/change-http-response.sh
RUN chown -R www-data:www-data /var/www/html/ /cron.txt
RUN rm /var/www/html/*.html

ENTRYPOINT ["/entrypoint.sh"]
CMD ["tail", "-f", "/var/log/nginx/access.log", "/var/log/nginx/error.log"]
