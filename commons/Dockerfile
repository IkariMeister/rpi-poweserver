FROM resin/rpi-raspbian
#FROM debian:jessie
MANTEINER jcgseco@gmail.com

ENV USER pi

RUN cd $HOME && wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz && tar -zxvf noip-duc-linux.tar.gz && cd noip-2.1.9-1/ && make && sudo make install && cd .. && rm -rf noip-2.1.9-1/ && rm -rf noip-duc-linux.tar.gz
USER $USER
WORKDIR /home/$USER

COPY ./noip2 /etc/init.d/noip2

RUN sudo chmod +x /etc/init.d/noip2 && sudo update-rc.d noip2 defaults && sudo /usr/local/bin/noip2

RUN sudo apt-get install nginx

EXPOSE 80

CMD ["start"]
