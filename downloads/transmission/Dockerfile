FROM resin/rpi-raspbian:jessie-20161228
MAINTAINER jcgseco@gmail.com
ENV USER transmission

RUN adduser --disabled-password $USER \
 && passwd -d $USER \
 && echo "$USER ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers
RUN apt-get update \
 && apt-get upgrade -y

RUN apt-get install -y transmission-daemon

RUN service transmission-daemon stop
COPY ./settings.json /etc/transmission-daemon/settings.json
COPY entrypoint.sh /
RUN chmod 777 /entrypoint.sh
EXPOSE 9091 51413
USER $USER

ENTRYPOINT ["/entrypoint.sh"]