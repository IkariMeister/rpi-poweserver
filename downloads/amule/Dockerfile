FROM resin/rpi-raspbian:jessie-20161228
MAINTAINER jcgseco@gmail.com
ENV USER amule

RUN adduser --disabled-password $USER \
 && passwd -d $USER \
 && echo "$USER ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers

RUN apt-get update \
 && apt-get upgrade -y

RUN apt-get install -y amule-daemon

RUN mkdir /media/temp && mkdir /media/incoming && chmod 777 /media/temp && chmod 777 /media/incoming

USER $USER

RUN amuled

#RUN cd && mkdir .aMule

COPY ./amule.conf /home/$USER/.aMule/amule.conf
COPY ./amule-daemon /etc/default/amule-daemon

COPY entrypoint.sh /
RUN sudo chmod 777 /entrypoint.sh && sudo chmod 777 /home/$USER/.aMule/amule.conf

EXPOSE 4662 4672 50001 1080 4712 4711

ENTRYPOINT ["/entrypoint.sh"]

