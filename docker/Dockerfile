FROM ubuntu:24.04

ADD ./docker/config /root/initial-config

RUN chmod +x /root/initial-config/install-script.sh
RUN /root/initial-config/install-script.sh

WORKDIR /var/www/html

COPY . .

RUN chmod +x /root/initial-config/initial-script.sh
RUN /root/initial-config/initial-script.sh

EXPOSE 80
EXPOSE 443