FROM debian:stretch

LABEL maintainer "Vincent Heins & Eisengrind"
LABEL type "public"
LABEL versioning "simple"

ENV RAGEMP_SERVER_SRC_FILE ragemp-srv-037.tar.gz
ENV RAGEMP_SERVER_SRC https://cdn.rage.mp/lin/${RAGEMP_SERVER_SRC_FILE}

COPY ./entrypoint.sh /opt/ragemp/

RUN apt-get update && \
    apt-get install -y libunwind8 icu-devtools curl libssl-dev wget && \
    mkdir -p /opt/ragemp && \
    cd /opt/ragemp && \
    wget ${RAGEMP_SERVER_SRC} && \
    tar -xzf ${RAGEMP_SERVER_SRC_FILE} && \
    rm ${RAGEMP_SERVER_SRC_FILE} && \
    mv ragemp-srv/* ./ && \
    rm -R ragemp-srv/ && \
    rm -f conf.json && \
    chmod -R 770 ./ && \
    chmod +x ./entrypoint.sh

WORKDIR /opt/ragemp/

ENTRYPOINT [ "./entrypoint.sh" ]

EXPOSE 22005/udp
EXPOSE 22006/tcp
