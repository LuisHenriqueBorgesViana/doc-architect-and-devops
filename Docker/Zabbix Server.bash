sudo docker run --name mysql-server -t -e MYSQL_DATABASE="zabbix" -e MYSQL_USER="zabbix" -e MYSQL_PASSWORD="zabbix" -e MYSQL_ROOT_PASSWORD="root" -d mysql:8 --character-set-server=utf8 --collation-server=utf8_bin --default-authentication-plugin=mysql_native_password

sudo docker run --name zabbix-java-gateway -t --restart unless-stopped -d zabbix/zabbix-java-gateway:ubuntu-6.2-latest

sudo docker run --name zabbix-server-mysql -t -e DB_SERVER_HOST="mysql-server" -e MYSQL_DATABASE="zabbix" -e MYSQL_USER="zabbix" -e MYSQL_PASSWORD="zabbix" -e MYSQL_ROOT_PASSWORD="root" -e ZBX_JAVAGATEWAY="zabbix-java-gateway" --link mysql-server:mysql --link zabbix-java-gateway:zabbix-java-gateway -p 10051:10051 --restart unless-stopped -d zabbix/zabbix-server-mysql:ubuntu-6.2-latest

sudo docker run --name zabbix-web-nginx-mysql -t -e DB_SERVER_HOST="mysql-server" -e MYSQL_DATABASE="zabbix" -e MYSQL_USER="zabbix" -e MYSQL_PASSWORD="zabbix" -e MYSQL_ROOT_PASSWORD="root" --link mysql-server:mysql --link zabbix-server-mysql:zabbix-server -p 8080:8080 --restart unless-stopped -d zabbix/zabbix-web-nginx-mysql:ubuntu-6.2-latest

curl http://127.0.0.1:8080

sudo docker run --name zabbix-agent --link mysql-server:mysql --link zabbix-server-mysql:zabbix-server -e ZBX_HOSTNAME="Zabbix server" -e ZBX_SERVER_HOST="zabbix-server" -d zabbix/zabbix-agent:ubuntu-6.2-latest

docker ps -a
sudo apt install net-tools
ifconfig [note eth0 address and browse it]
docker inspect zabbix-agent | grep "IPAddress\":"