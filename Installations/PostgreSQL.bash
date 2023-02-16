wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

sudo apt update

apt install postgresql postgresql-contrib

service postgresql status

sudo -u postgres psql
ALTER USER postgres PASSWORD 'postgres';

nano /etc/postgresql/15/main/postgresql.conf
listen_addresses = '*'

nano /etc/postgresql/15/main/pg_hba.conf
host all all 127.0.0.1/32 trust
host all all 0.0.0.0/0 trust

systemctl restart postgresql

ss -nlt | grep 5432

mkdir /database/name_tablespace

chmod 777 /database/

chown postgres:postgres /database/

systemctl status postgresql