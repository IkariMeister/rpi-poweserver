FROM cmosh/alpine-arm:3.3
MAINTAINER jcgseco@gmail.com

RUN [ "cross-build-start" ]
ENV USER nginx
#RUN apk update && apk add openssl && apk add useradd
RUN adduser -D -u 1000 $USER \
 && echo "$USER ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers
RUN apk update \
 && apk upgrade \
# && apk install build-essential && apk install -y wget \
 && apk add --update nginx && rm -rf /var/cache/apk/*
# && apk clean \
# && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/www/html && chmod 777 /var/www/html
COPY ./index.html /var/www/html/
COPY ./nginx.conf /etc/nginx/

#RUN service nginx start && service nginx status


RUN [ "cross-build-end" ]

CMD ["nginx", "-g", "daemon off;"]