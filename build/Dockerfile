ARG PHP_VERSION=7.2
FROM andypieters/php-apache:${PHP_VERSION}


COPY php.ini $PHP_INI_DIR/conf.d/zz-php.ini

ARG USER_ID
RUN usermod -u $USER_ID www-data

WORKDIR /webroot
ARG WEBROOT=/webroot
RUN rm -rf /var/www/html && ln -s ${WEBROOT} /var/www/html
VOLUME /var/www/.composer