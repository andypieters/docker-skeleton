FROM webdevops/php-apache:7.2
ENV WEB_DOCUMENT_ROOT=/project/web/
ENV WEB_DOCUMENT_INDEX index.php
ENV WEB_ALIAS_DOMAIN = 


COPY php.ini $PHP_INI_DIR/conf.d/zz-php.ini

RUN apt-get update; \
	apt-get install openssl libssl-dev libcurl4-openssl-dev -y; \
	pecl install mongodb; \
	echo "extension=mongodb.so" > /usr/local/etc/php/php.ini;

# Enable apache mods.
RUN a2enmod rewrite
RUN a2enmod ssl
RUN service apache2 restart

ARG USER_ID
RUN usermod -u $USER_ID www-data

