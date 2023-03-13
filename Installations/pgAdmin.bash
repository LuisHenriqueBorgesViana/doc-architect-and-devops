curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

sudo apt install pgadmin4

sudo /usr/pgadmin4/bin/setup-web.sh

http://127.0.0.1/pgadmin4

sudo systemctl restart apache2

sudo systemctl status apache2

sudo curl --verbose http://127.0.0.1/pgadmin4
