FROM php:7.4-fpm

RUN apt-get update

RUN apt-get install -y \
    git \
    zip \
    curl \
    sudo \
    unzip 

RUN docker-php-ext-install \
    pdo_mysql 
