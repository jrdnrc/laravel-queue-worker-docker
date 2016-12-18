FROM php:7.1-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev libxml2-dev mysql-client htop \
    && docker-php-ext-install mcrypt pdo_mysql soap

COPY run.sh /usr/local/bin/init-queue-worker

WORKDIR /var/www

CMD ["init-queue-worker"]