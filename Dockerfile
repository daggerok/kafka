# docker run -p 2181:2181 -p 9092:9092 daggerok/kafka:spring-cloud-cli

FROM ubuntu:18.04
LABEL MAINTAINER='Maksim Kostromin https://github.com/daggerok'

ARG ZOOKEEPER_PORT_ARG="2181"
ARG KAFKA_PORT_ARG="9092"

ENV ZOOKEEPER_PORT="${ZOOKEEPER_PORT_ARG}" \
    KAFKA_PORT="${KAFKA_PORT_ARG}"

# OracleJDK 8:
RUN apt-get update  -yqq \
 && apt-get install -yqq --fix-missing --no-install-recommends --autoremove \
                    curl unzip zip lsof bash psmisc wget software-properties-common \
 && apt-add-repository -y ppa:webupd8team/java \
 && apt-get update  -yqq \
 && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
 && echo debconf shared/accepted-oracle-license-v1-1   seen true | debconf-set-selections \
 && apt-get install -yqq --fix-missing --no-install-recommends --autoremove \
                    oracle-java8-installer oracle-java8-set-default oracle-java8-unlimited-jce-policy
# OpenJDK 8:
#RUN apt-get update -yqq \
# && apt-get install -yqq --fix-missing --no-install-recommends --autoremove \
#                    openjdk-8-jdk curl unzip zip lsof bash psmisc

RUN curl -s "https://get.sdkman.io" | bash \
 && /bin/bash -c 'source "$HOME/.sdkman/bin/sdkman-init.sh" \
               && sdk install springboot 2.0.4.RELEASE' \
 && /bin/bash -c 'source "$HOME/.sdkman/bin/sdkman-init.sh" \
               && spring install org.springframework.cloud:spring-cloud-cli:2.0.0.RELEASE' \
 && /bin/bash -c 'source "$HOME/.sdkman/bin/sdkman-init.sh" \
               && (spring cloud kafka &)' \
 && /bin/bash -c 'echo "waiting for dependencies resolution on initial kafka bootstrap..." && sleep 150' \
 && /bin/bash -c 'echo "shutdown kafka..." && (killall -9 java || true)'

EXPOSE ${ZOOKEEPER_PORT} ${KAFKA_PORT}

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["source $HOME/.sdkman/bin/sdkman-init.sh && spring cloud kafka"]

HEALTHCHECK \
  --timeout=1s \
  --retries=33 \
  CMD test `lsof -i:${KAFKA_PORT}|awk '{print $2}'|wc -l` -ge 1 && test `lsof -i:${ZOOKEEPER_PORT}|awk '{print $2}'|wc -l` -ge 1

### you can use next docker-compose ###
#
# version: "2.1"
# services:
#   kafka:
#     image: daggerok/kafka:spring-cloud-cli
#     environment:
#       ZOOKEEPER_PORT: 2181
#       KAFKA_PORT: 9092
#     volumes: ["kafka-data:/root"]
#     ports:
#     - "2181:2181"
#     - "9092:9092"
#     networks: [backing-services]
# volumes:
#   kafka-data: {}
# networks:
#   backing-services:
#     driver: bridge
#
#######################################
