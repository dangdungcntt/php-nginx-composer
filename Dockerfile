FROM phpearth/php:7.3-nginx

WORKDIR /var/www

RUN apk add --no-cache php7.3-pdo_mysql composer 