apt-get update && apt-get upgrade
apt-get install build-essential
apt-get install -y openssh-server
service ssh start
cd /usr/local/src
wget http://curl.haxx.se/download/curl-7.36.0.tar.gz
tar -xvzf curl-7.36.0.tar.gz
rm *.gz
cd curl-7.36.0
./configure
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
git checkout develop
git pull



