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
cp docker.list /etc/apt/sources.list.d/docker.list
sudo apt-get update -y
sudo apt-cache policy docker-engine
sudo apt-get update
sudo apt-get install -y docker-engine
sudo gpasswd -a ${USER} docker
sudo service docker start
docker build -t commons-nginx ./commons/nginx/
docker run --name nginx -it -p 80:80 -p 443:443 my_nginx &