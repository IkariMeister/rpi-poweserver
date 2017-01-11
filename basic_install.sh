sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-get install -y git
git config --global user.name Ikari
git config --global user.email jcgseco@gmail.com
cd $HOME
git clone https://github.com/IkariMeister/rpi-poweserver.git
cd rpi-poweserver
git remote add rpi-powerserver https://github.com/IkariMeister/rpi-poweserver.git
git fetch rpi-powerserver
git checkout rpi-powerserver/develop
sudo cp rpi-powerserver/docker.list /etc/apt/sources.list.d/docker.list
sudo apt-get update -y
sudo apt-cache policy docker-engine
sudo apt-get update
sudo apt-get install -y docker-engine
groupadd docker 
gpasswd -a ${USER} docker
sudo service docker start
cd rpi-powerserver/commons/nginx
docker build -t commons-nginx .
docker run --name nginx -it -p 80:80 -p 443:443 my_nginx &
sudo mkdir /data/mysql
sudo chmod 777 /data/mysql
cd ../../dbm/mysql
#docker pull hypriot/rpi-mysql
docker build -t my_mysql .
docker run --name mysql -e MYSQL_ROOT_PASSWORD=ik2233 -p 3306:3306 -v /data/mysql:/var/lib/mysql -d my_mysql
cd ../../downloads/transmission
sudo mkdir /media/downloads && sudo mkdir /media/temp
sudo chmod 777 /media/downloads && sudo chmod 777 /media/temp
docker build -t transmission .
docker run --name transmission --rm -v /media/downloads:/media/downloads -v /media/temp:/media/temp -p 9091:9091 -it transmission &
cd ../amule
docker build -t amule .
docker run --name amule -it amule &
cd ../pyload
docker build -t pyload .
docker run --name pyload -it pyload &
cd ../../docs-manager/owncloud
docker build -t myowncloud .
docker run --name owncloud -it myowncloud &
