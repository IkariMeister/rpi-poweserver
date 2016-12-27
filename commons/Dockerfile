FROM resin/rpi-raspbian
#FROM debian:jessie
MAINTAINER jcgseco@gmail.com

ENV USER nginx

RUN adduser $USER && adduser $USER sudo

RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential && apt-get install -y wget \
 && apt-get install -y nginx \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
#RUN cd $HOME && wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz && tar -zxvf noip-duc-linux.tar.gz && cd noip-2.1.9-1/ && make && make install 
#RUN cd .. && rm -rf noip-2.1.9-1/ && rm -rf noip-duc-linux.tar.gz
#USER $USER
#WORKDIR /home/$USER

#COPY ./noip2 /etc/init.d/noip2

#RUN sudo chmod +x /etc/init.d/noip2 && sudo update-rc.d noip2 defaults && sudo /usr/local/bin/noip2

RUN update-rc.d nginx enable && service nginx start && service nginx status

EXPOSE 80

#CMD [/bin/bash]
