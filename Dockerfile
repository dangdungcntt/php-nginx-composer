FROM npulidom/alpine-phalcon

RUN apk add --no-cache \
    php7-mongodb \
    php7-pdo \
    php7-pdo_mysql \
    php7-gd \
    composer

COPY nginx.conf /etc/nginx/nginx.conf

COPY vhost.conf /etc/nginx/conf.d/default.conf

COPY www.conf /etc/php7/php-fpm.d/www.conf

ONBUILD WORKDIR /home/public_html/app

ONBUILD COPY composer.json composer.json

ONBUILD COPY composer.lock composer.lock

ONBUILD RUN composer install --prefer-dist --no-progress --no-scripts --no-autoloader && rm -rf /root/.composer
