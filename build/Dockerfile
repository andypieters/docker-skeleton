FROM andypieters/php-apache:7.2


COPY php.ini $PHP_INI_DIR/conf.d/zz-php.ini

ARG USER_ID
RUN usermod -u $USER_ID www-data