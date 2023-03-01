sudo docker pull ravermeister/pgadmin4

sudo docker run -p 8080:8080 \
  -e SMTP_HOST="localhost" \
  -e SMTP_PORT=25 \
  -e SMTP_MAIL_SENDER="no-reply@localhost" \
  ravermeister/pgadmin4

http://localhost:8080

info@rimkus.it
changeme

azu@*2023*@toma*tize@