FROM php:7-apache

RUN a2enmod rewrite

#Zorgen dat apache rechten heeft in de volumes
RUN usermod -u 1000 www-data
RUN usermod -G staff www-data


RUN apt-get update \
    && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxml2-dev \
        libssl-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&&  docker-php-ext-install -j$(nproc) iconv mcrypt  gd zip soap pdo pdo_mysql mysqli ftp

#xdebug installeren
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN apt-get update && \
apt-get install -y ssmtp && \
apt-get clean && \
echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf && \
echo "mailhub=mailcatcher:1025" >>  /etc/ssmtp/ssmtp.conf && \
echo 'sendmail_path = "/usr/sbin/ssmtp -t "' > /usr/local/etc/php/conf.d/mail.ini

#php config files kopieren
COPY ./config/php/* $PHP_INI_DIR/conf.d/

VOLUME /var/www/html
