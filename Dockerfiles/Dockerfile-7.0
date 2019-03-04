FROM php:7.0-apache

# enable xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# install composer
COPY --from=composer:1.7 /usr/bin/composer /usr/bin/composer

ENV BUILD_PACKAGES \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libicu-dev \
        libxslt-dev \
        libxml2-dev \
        libcurl3-dev \
        libmcrypt-dev

# install dependencies
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        ${BUILD_PACKAGES} \
        unzip \
        ssmtp \
        git

# configure php
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd pdo pdo_mysql mysqli zip opcache intl mcrypt xsl soap bcmath curl exif gd sockets
    
#remove build packages
RUN apt-get remove --purge -y ${BUILD_PACKAGES}  && rm -rf /var/lib/apt/lists/*

# add ssmtp mailcatcher config
RUN echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf && \
    echo "mailhub=mailcatcher:1025" >>  /etc/ssmtp/ssmtp.conf

# copy php config files
COPY config/php/*.ini $PHP_INI_DIR/conf.d/

# create webroot folder
RUN mkdir /webroot
VOLUME /webroot
WORKDIR /webroot

RUN rm -rf /var/www/html && \
    ln -s /webroot /var/www/html && \
    chown -R www-data /var/www

RUN a2enmod rewrite