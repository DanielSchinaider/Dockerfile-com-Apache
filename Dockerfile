
FROM ubuntu:20.04

LABEL version="1.0" description="ubuntu/apache"

ENV webroot=/var/www/html/

RUN apt-get -q update && \ 
    DEBIAN_FRONTEND="noninteractive" TZ="America/Sao_Paulo" apt-get install -y -q apache2 tzdata && \ 
    ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata

COPY intranet/ $webroot

EXPOSE 80

CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]


