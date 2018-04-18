FROM alpine:3.7

RUN apk add --no-cache postfix runit socklog && \
    rm -rf /etc/sv/socklog-unix /var/log/socklog

RUN sed -i -e 's/#mynetworks_style = subnet/mynetworks_style = subnet/' /etc/postfix/main.cf && \
    newaliases

COPY sv /etc/sv

EXPOSE 25

CMD [ "runsvdir", "/etc/sv" ]

