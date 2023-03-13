wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

sudo apt update

sudo apt install postgresql postgresql-contrib

sudo service postgresql status

sudo -u postgres psql
ALTER USER postgres PASSWORD 'postgres';

sudo nano /etc/postgresql/15/main/postgresql.conf
listen_addresses = '*'

sudo nano /etc/postgresql/15/main/pg_hba.conf
host all all 127.0.0.1/32 trust
host all all 0.0.0.0/0 trust

sudo systemctl restart postgresql

ss -nlt | grep 5432

sudo mkdir /root/database

sudo chmod 777 /root/database

sudo chown postgres:postgres /root/database

sudo systemctl status postgresql