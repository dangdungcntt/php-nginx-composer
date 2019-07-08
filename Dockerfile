FROM phpearth/php:7.3-nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY vhost.conf /etc/nginx/conf.d/default.conf

COPY www.conf /etc/php/7.3/php-fpm.d/www.conf

RUN apk add --no-cache \
    php7.3-mongodb \
    php7.3-pdo \
    php7.3-pdo_mysql \
    php7.3-gd \
    composer

ONBUILD WORKDIR /home/public_html/app

ONBUILD COPY composer.json composer.json

ONBUILD COPY composer.lock composer.lock

ONBUILD RUN composer install --prefer-dist --no-progress --no-scripts --no-autoloader && rm -rf /root/.composer
