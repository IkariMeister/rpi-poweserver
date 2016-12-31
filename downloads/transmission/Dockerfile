#FROM resin/rpi-raspbian
FROM debian:jessie
MAINTAINER jcgseco@gmail.com
ENV USER transmission

RUN adduser --disabled-password $USER \
 && passwd -d $USER \
 && echo "$USER ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers
RUN apt-get update \
 && apt-get upgrade -y

RUN apt-get install -y transmission-daemon
#USER $USER
RUN service transmission-daemon stop
COPY ./settings.json /etc/transmission-daemon/settings.json
EXPOSE 9091 51413
RUN service transmission-daemon start