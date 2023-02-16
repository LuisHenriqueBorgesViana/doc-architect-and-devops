sudo apt update

sudo apt install wget curl gnupg2 software-properties-common apt-transport-https ca-certificates lsb-release

wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $( lsb_release -cs)/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

sudo apt update

sudo apt install mongodb-org

sudo systemctl start mongod

sudo systemctl enable mongod

nano /etc/mongod.conf

security:
  authorization: enabled

net:
  port: 27017
  bindIp: 0.0.0.0

sudo systemctl restart mongod

mongosh

db.createUser(
  {
    user: 'admin',
    pwd: 'mongodb',
    roles: ["userAdminAnyDatabase", "dbAdminAnyDatabase", "readWriteAnyDatabase"]
  }
);

exit;

mongo -u admin -p mongodb  localhost:27017/admin