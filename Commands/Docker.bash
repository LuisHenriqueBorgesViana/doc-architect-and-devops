----------------------------------------------------------------------------------------------------------------------
# Check All Run, Start, Stop, Kill, Delete all Containers at once:

sudo docker ps -a
sudo docker container start $(docker ps -a -q)
sudo docker container stop $(docker ps -aq)
sudo docker container kill $(docker ps -q)
sudo docker rm $(docker ps -aq)

----------------------------------------------------------------------------------------------------------------------
# Unistall Service:

sudo apt-get purge -y docker.io

----------------------------------------------------------------------------------------------------------------------
# Start, Stop, Delete Container:

sudo docker start 
sudo docker stop -f container_id
sudo docker rm -f container_id

----------------------------------------------------------------------------------------------------------------------
# Clear all Docker of Images or Containers not utilized:

sudo docker system prune --all --force --volumes

----------------------------------------------------------------------------------------------------------------------
