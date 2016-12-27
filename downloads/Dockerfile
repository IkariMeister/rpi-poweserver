FROM resin/rpi-raspbian
#FROM debian:jessie
MAINTAINER jcgseco@gmail.com

ENV USER downloads

RUN adduser $USER && adduser $USER sudo

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y amule-daemon

COPY 