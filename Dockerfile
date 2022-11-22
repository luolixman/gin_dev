FROM alpine:edge

LABEL MAINTAINER="weilev"

WORKDIR /opt/gin_first/

RUN ls

RUN cd /opt/gin_first/

RUN wget http://dev.923333.xyz/config/main

RUN mkdir config && cd config

RUN wget http://dev.923333.xyz/config/config.yml

COPY /opt/gin_first/config.yml /opt/gin_first/config

RUN chmod 777 /opt/gin_first/main

EXPOSE 8088

RUN ls

CMD [ "./main" ]