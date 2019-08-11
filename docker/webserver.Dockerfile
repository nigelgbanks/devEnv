FROM php:7.1.31-apache-buster 

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN docker-php-ext-install mysqli pdo pdo_mysql

ADD ./config/xdebug.ini "${PHP_INI_DIR}/conf.d/xdebug.ini" 