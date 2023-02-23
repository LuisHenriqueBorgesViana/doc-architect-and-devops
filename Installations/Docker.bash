sudo apt-get remove docker docker-engine docker.io

sudo apt-get update

sudo apt install docker.io

sudo snap install docker

sudo apt install apt-transport-https ca-certificates curl software-properties-common

sudo docker --version

sudo docker ps -a

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo docker-compose --version

sudo systemctl status docker