FROM php:fpm

RUN mkdir /webroot 
VOLUME /webroot

RUN apt-get update \
    && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxml2-dev \
        libssl-dev \
        libxslt-dev \
        libicu-dev \
        ssmtp \
        git \
	    wget

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) iconv mcrypt  gd zip soap pdo pdo_mysql mysqli ftp xsl intl

#xdebug installeren
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf && \
    echo "mailhub=mailcatcher:1025" >>  /etc/ssmtp/ssmtp.conf && \
    echo 'sendmail_path = "/usr/sbin/ssmtp -t "' > /usr/local/etc/php/conf.d/mail.ini

#php config files kopieren
COPY ./config/* $PHP_INI_DIR/conf.d/

RUN mkdir /var/www/.composer && \
    chmod 777 /var/www/.composer

# install composer
COPY ./install-composer.sh /install-composer.sh
RUN /install-composer.sh && rm /install-composer.sh

RUN usermod -u 1000 www-data && \
    usermod -G staff www-data
