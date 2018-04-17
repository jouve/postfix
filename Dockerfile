FROM alpine:3.7

RUN apk add --no-cache runit postfix syslog-ng

COPY syslog-ng.conf /etc/syslog-ng/

COPY sv /etc/sv

CMD [ "runsvdir", "/etc/sv" ]
