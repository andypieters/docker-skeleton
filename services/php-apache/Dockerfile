FROM php:apache

# install dependencies
RUN apt-get update \
    && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libicu-dev \
        wget \
        git \
        ssmtp

# configure php
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd pdo pdo_mysql mysqli zip opcache

# enable xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# configure mailcatcher
RUN echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf && \
    echo "mailhub=mailcatcher:1025" >>  /etc/ssmtp/ssmtp.conf && \
    echo 'sendmail_path = "/usr/sbin/ssmtp -t "' > $PHP_INI_DIR/conf.d/mail.ini

# install composer
COPY ./scripts/install-composer.sh /tmp/install-composer.sh

RUN mkdir /var/www/.composer && \
    chmod 777 /var/www/.composer && \
    chmod +x /tmp/install-composer.sh && \
    /tmp/install-composer.sh && \
    rm /tmp/install-composer.sh

# copy config files
COPY ./config/* $PHP_INI_DIR/conf.d/

# create webroot folder
RUN mkdir /webroot
VOLUME /webroot
WORKDIR /webroot

# link webroot folder to /var/www/html
RUN rm /var/www/html -r && \
    ln -s /webroot/public /var/www/html

ARG USER_ID
RUN usermod -u $USER_ID www-data
RUN a2enmod rewrite