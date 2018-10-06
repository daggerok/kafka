# docker run -it --rm --name run-my-kafka -p 2181:2181 -p 9092:9092 daggerok/kafka:v25

FROM openjdk:12-ea-14-jdk-oraclelinux7
LABEL MAINTAINER='Maksim Kostromin https://github.com/daggerok'
ARG EMBEDDED_KAFKA_FAT_JAR_APP_URL_ARG='https://raw.githubusercontent.com/daggerok/embedded-kafka/mvn-repo/embedded-kafka-0.0.3-all.jar'
ARG ZOOKEEPER_DIR_ARG=/root
ARG ZOOKEEPER_PORT_ARG='2181'
ARG KAFKA_PORT_ARG='9092'
ARG KAFKA_TOPICS_ARG='\
topic1,topic2,topic3'
ARG HTTP_PORT_ARG='8080'
ARG HTTP_CONTEXT_ARG='/'
ARG JAVA_OPTS_ARG='\
-Djava.net.preferIPv4Stack=true \
-XX:+UnlockExperimentalVMOptions \
-XshowSettings:vm '
ENV EMBEDDED_KAFKA_FAT_JAR_APP_URL="${EMBEDDED_KAFKA_FAT_JAR_APP_URL_ARG}" \
    JAVA_OPTS="${JAVA_OPTS} ${JAVA_OPTS_ARG}" \
    ZOOKEEPER_PORT="${ZOOKEEPER_PORT_ARG}" \
    ZOOKEEPER_DIR="${ZOOKEEPER_DIR_ARG}" \
    KAFKA_PORT="${KAFKA_PORT_ARG}" \
    KAFKA_TOPICS="${KAFKA_TOPICS_ARG}" \
    HTTP_PORT="${HTTP_PORT_ARG}" \
    HTTP_CONTEXT="${HTTP_CONTEXT_ARG}"
RUN yum update -y \
 && yum install -y wget lsof bash psmisc curl \
 && wget -O ~/kafka.jar ${EMBEDDED_KAFKA_FAT_JAR_APP_URL} \
 && yum autoremove -y \
 && yum clean all -y \
 && rm -rf /tmp/*
WORKDIR /root
VOLUME /root
CMD /bin/bash
ENTRYPOINT java ${JAVA_OPTS} -jar ~/kafka.jar \
                                      --zookeeperPort="${ZOOKEEPER_PORT}" \
                                      --zookeeperDir="${ZOOKEEPER_DIR}" \
                                      --kafkaPort="${KAFKA_PORT}" \
                                      --kafkaTopics="${KAFKA_TOPICS}" \
                                      --httpPort="${HTTP_PORT}" \
                                      --httpContext="${HTTP_CONTEXT}"
EXPOSE ${ZOOKEEPER_PORT} ${KAFKA_PORT} ${HTTP_PORT}
HEALTHCHECK \
  --timeout=2s \
  --retries=33 \
  CMD curl -f "http://127.0.0.1:${HTTP_PORT}${HTTP_CONTEXT}" \
   && test `lsof -i:${KAFKA_PORT}|awk '{print $2}'|wc -l` -ge 1 \
   && test `lsof -i:${ZOOKEEPER_PORT}|awk '{print $2}'|wc -l` -ge 1 \
   && test `lsof -i:${HTTP_PORT}|awk '{print $2}'|wc -l` -ge 1

### you can use next docker-compose ###
#
# version: '2.1'
# services:
#   kafka:
#     image: daggerok/kafka:v25
#     environment:
#       ZOOKEEPER_PORT: 2181
#       ZOOKEEPER_DIR: ./zk
#       KAFKA_PORT: 9092
#       KAFKA_TOPICS: orders,invoices
#       HTTP_PORT: 8080
#       HTTP_CONTEXT: /
#     volumes: ['kafka-data:/root']
#     ports:
#     - '2181:2181'
#     - '9092:9092'
#     - '8080:8080'
#     networks: [backing-services]
# volumes:
#   kafka-data: {}
# networks:
#   backing-services:
#     driver: bridge
#
#######################################
