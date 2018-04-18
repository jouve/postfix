FROM alpine:3.7

RUN apk add --no-cache runit postfix syslog-ng

RUN sed -i -e 's/#mynetworks_style = subnet/mynetworks_style = subnet/' main.cf && \
    newaliases

COPY syslog-ng.conf /etc/syslog-ng/

COPY sv /etc/sv

CMD [ "runsvdir", "/etc/sv" ]

