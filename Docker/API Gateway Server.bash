sudo docker network create gateway-api-network

sudo docker run -d --name kong-database \
   --network=gateway-api-network \
   -e "POSTGRES_USER=kong" -e "POSTGRES_DB=kong" -e "POSTGRES_PASSWORD=kong" \
   -p 5432:5432 postgres:9.6
 
sudo docker run --rm \
  --network=gateway-api-network \
  -e "KONG_DATABASE=postgres" -e "KONG_PG_HOST=kong-database" \
  -e "KONG_PG_PASSWORD=kong" kong:3.1.1 kong migrations bootstrap

sudo docker run -d --name kong \
   --network=gateway-api-network \
   -e "KONG_DATABASE=postgres" -e "KONG_PG_HOST=kong-database" \
   -e "KONG_PG_PASSWORD=kong" -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
   -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
   -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" -e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" \
   -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 kong:3.1.1

curl -s http://127.0.0.1:8000/

curl -s http://127.0.0.1:8001/

sudo docker run --rm \
   --network=gateway-api-network  \
   pantsel/konga -c prepare -a postgres -u postgresql://kong:kong@kong-database:5432/konga_db

sudo docker run -p 9001:1337 \
   --network=gateway-api-network \
   -e "DB_ADAPTER=postgres" \
   -e "DB_HOST=kong-database" \
   -e "DB_USER=kong" \
   -e "DB_PASSWORD=kong" \
   -e "DB_DATABASE=konga_db" \
   -e "KONGA_HOOK_TIMEOUT=120000" \
   -e "NODE_ENV=production" \
   --name konga \
   pantsel/konga

curl -s http://127.0.0.1:9001/

sudo sysctl -w vm.max_map_count=262144;

sudo docker run -d --name elastic \
  --network=gateway-api-network  \
  -p 9200:9200 -p 9300:9300 \
  --restart=always \
  -e "http.host=0.0.0.0" \
  -e "discovery.type=single-node" \
  docker.elastic.co/elasticsearch/elasticsearch:7.13.1

curl -s http://127.0.0.1:9300/

# Set the Server Local IP on the Internal IPv4 Network in "ELASTICSEARCH_HOSTS"
sudo docker run -d --name kibana \
  --network=gateway-api-network  \
  -p 5601:5601 \
  --restart=always \
  -e "ELASTICSEARCH_HOSTS=http://10.128.0.14:9200" \
  -e XPACK_GRAPH_ENABLED=true \
  -e XPACK_WATCHER_ENABLED=true \
  -e XPACK_ML_ENABLED=true \
  -e XPACK_MONITORING_ENABLED=true \
  -e XPACK_MONITORING_UI_CONTAINER_ELASTICSEARCH_ENABLED \
   docker.elastic.co/kibana/kibana:7.13.1

curl -s http://127.0.0.1:5601/

# Set the Server Local IP on the Internal IPv4 Network in "ELASTICSEARCH_HOSTS"
sudo docker run -d --name logstash \
  --network=gateway-api-network  \
  --restart=always \
  -e "XPACK.MONITORING.ELASTICSEARCH.HOSTS=http://10.128.0.14:9200" \
  docker.elastic.co/logstash/logstash:7.13.1

# Access via Public IP linked to IPv4 on the Local and External Network
Konga Gateway "http://127.0.0.1:1337/"
Elastic Search "http://127.0.0.1:5601/app/discover#/?"
Kong Gateway API "http://127.0.0.1:8000/"
Kong Gateway Manager "http://127.0.0.1:8001/"

# Open doors: 8443, 8444, 9200, 1337, 9300, 5601, 5432, 8000, 9001 and 8001.
sudo watch netstat -tulpn

# Configure Kong through the Conga interface and ELK through Elastic, both of which talk via plugin.
browser http configure