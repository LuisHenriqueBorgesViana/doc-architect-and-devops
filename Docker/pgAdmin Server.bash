sudo docker pull ravermeister/pgadmin4

sudo docker run -p 9002:8080 \
  -e SMTP_HOST="localhost" \
  -e SMTP_PORT=25 \
  -e SMTP_MAIL_SENDER="no-reply@localhost" \
  ravermeister/pgadmin4

http://localhost:9090

info@rimkus.it
changeme