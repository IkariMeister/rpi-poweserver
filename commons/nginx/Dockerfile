FROM nginx:1.10
MAINTAINER jcgseco@gmail.com

RUN mkdir -p /var/www/html && chmod 777 /var/www/html
COPY ./index.html /var/www/html/
COPY ./nginx.conf /etc/nginx/