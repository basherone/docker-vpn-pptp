FROM ubuntu:latest
MAINTAINER Przemek Szalko <przemek@mobtitude.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pptpd iptables rsyslog

COPY ./etc/pptpd.conf /etc/pptpd.conf
COPY ./etc/ppp/pptpd-options /etc/ppp/pptpd-options
COPY ./etc/ppp/chap-secrets /etc/ppp/chap-secrets

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0777 /entrypoint.sh

ENTRYPOINT ["sudo /entrypoint.sh"]
CMD ["pptpd", "--fg"]
