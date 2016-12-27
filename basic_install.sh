apt-get update && apt-get upgrade -y
apt-get install -y build-essential
apt-get install -y openssh-server
service ssh start
cd /usr/local/src
wget http://curl.haxx.se/download/curl-7.36.0.tar.gz
tar -xvzf curl-7.36.0.tar.gz
rm *.gz
cd curl-7.36.0
./configure --with-ssl
make
make install
apt-get install -y curl libcurl3
curl -sSL https://get.docker.com/ | sh
groupadd docker
gpasswd -a ${USER} docker
service docker start
apt-get install -y git
git config --global user.name Ikari
git config --global user.email jcgseco@gmail.com
cd $HOME
git clone https://github.com/IkariMeister/rpi-poweserver.git
cd rpi-poweserver
git remote add rpi-powerserver https://github.com/IkariMeister/rpi-poweserver.git
git fetch rpi-powerserver
git checkout rpi-powerserver/develop
cp ./interfaces /etc/network/interfaces
docker build -t commons-nginx ./commons/nginx/Dockerfile
docker run --name nginx -it -p 80:80 -p 443:443 commons-nginx &





