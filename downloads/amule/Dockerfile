FROM resin/rpi-raspbian:jessie-20161228
MAINTAINER jcgseco@gmail.com
ENV USER amule

RUN adduser --disabled-password $USER \
 && passwd -d $USER \
 && echo "$USER ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers

RUN apt-get update \
 && apt-get upgrade -y

RUN apt-get install -y amule-daemon

USER $USER

RUN cd && mkdir .aMule

COPY ./amule.conf /home/$USER/.Amule/amule.conf
COPY ./amule-daemon /etc/default/amule-daemon

COPY entrypoint.sh /
RUN sudo chmod 777 /entrypoint.sh

EXPOSE 4662 4672 50001 1080 4712 4711

ENTRYPOINT ["/entrypoint.sh"]

