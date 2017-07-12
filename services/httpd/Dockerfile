FROM httpd:alpine

RUN mkdir /webroot && mkdir /log
VOLUME /webroot
VOLUME /log

COPY ./config/httpd.conf /usr/local/apache2/conf/httpd.conf