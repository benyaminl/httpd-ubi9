FROM registry.access.redhat.com/ubi9:9.0.0-1640.1666621574

RUN dnf update -y
RUN dnf install httpd -y
RUN dnf install php php-fpm -y
CMD mkdir /run/php-fpm
#RUN php-fpm -D

EXPOSE 80
# USER apache
ENTRYPOINT ["/usr/sbin/httpd", "-D FOREGROUND"]
#CMD ["/usr/bin/sleep", " infinity"]
