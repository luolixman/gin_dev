FROM alpine:edge

LABEL MAINTAINER="weilev"

WORKDIR /opt/gin_first/

RUN ls

RUN cd /opt/gin_first/

RUN pwd

RUN wget http://dev.923333.xyz/config/main

RUN mkdir config && cd config

RUN pwd

RUN ls

RUN wget http://dev.923333.xyz/config/config.yml

COPY config.yml config

RUN pwd

RUN chmod 777 /opt/gin_first/main

EXPOSE 8088

RUN ls

CMD [ "./main" ]