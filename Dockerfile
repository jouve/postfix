FROM alpine:3.8

RUN apk add --no-cache postfix runit

RUN sed -i -e 's/#mynetworks_style = subnet/mynetworks_style = subnet/' /etc/postfix/main.cf && \
    newaliases

COPY sv /etc/sv

EXPOSE 25

CMD [ "runsvdir", "/etc/sv" ]
