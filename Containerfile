FROM registry.access.redhat.com/ubi9:9.0.0-1640.1666621574

RUN dnf update -y
RUN dnf install httpd -y
RUN dnf install php php-fpm -y
RUN mkdir /run/php-fpm
COPY ./conf/httpd.conf /etc/httpd/conf/httpd.conf
COPY ./conf/mime.types /etc/httpd/conf/mime.types
COPY ./conf/sites-enabled /etc/httpd/sites-enabled
COPY ./httpd-php.sh /httpd-php.sh
#RUN /usr/bin/ls -lR /etc/httpd
EXPOSE 80
# USER apache
ENTRYPOINT ["/httpd-php.sh"]
#CMD ["/usr/bin/sleep", " infinity"]
