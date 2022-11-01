FROM alpine:edge

LABEL MAINTAINER="weilev"

WORKDIR /opt/gin/

VOLUME "/opt/gin"

COPY main /opt/gin/main

COPY /config/config.yml /opt/gin/config/config.yml

RUN chmod 777 /opt/gin/main

EXPOSE 8088

RUN ls -l

CMD [ "./main" ]
