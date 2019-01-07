FROM alpine:3.8

RUN set -ex; \
    apk add --no-cache postfix s6; \
    sed -i -e 's/#mynetworks_style = subnet/mynetworks_style = subnet/' /etc/postfix/main.cf; \
    newaliases

COPY sv /etc/sv

EXPOSE 25

CMD [ "s6-svscan", "/etc/sv" ]
