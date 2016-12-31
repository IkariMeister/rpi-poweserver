FROM resin/rpi-raspbian:jessie-20161228
#FROM debian:jessie
MAINTAINER jcgseco@gmail.com

ENV USER nginx
RUN apt-get update \
 && apt-get upgrade -y \
# && apt-get install -y build-essential && apt-get install -y wget \
 && apt-get install -y nginx \
 && apt-get install -y sudo \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN adduser --disabled-password $USER \
 && passwd -d $USER \
 && echo "$USER ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers

RUN mkdir -p /var/www/html && chmod 777 /var/www/html
COPY ./index.html /var/www/html/
COPY ./nginx.conf /etc/nginx/
#USER www-data

#RUN sudo service nginx start

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]