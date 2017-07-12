FROM php:fpm-alpine

RUN mkdir /webroot 
VOLUME /webroot

RUN apk add --no-cache \
        libjpeg-turbo-dev \
        libpng-dev \
        freetype-dev \
        libmcrypt-dev \
        libxml2-dev \
        openssl-dev \
        autoconf \
        alpine-sdk \
        ssmtp bash


RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&&  docker-php-ext-install iconv mcrypt  gd zip soap pdo pdo_mysql mysqli ftp

RUN apk add --no-cache 

#xdebug installeren
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf && \
    echo "mailhub=mailcatcher:1025" >>  /etc/ssmtp/ssmtp.conf && \
    echo 'sendmail_path = "/usr/sbin/ssmtp -t "' > /usr/local/etc/php/conf.d/mail.ini

#php config files kopieren
COPY ./config/* $PHP_INI_DIR/conf.d/
