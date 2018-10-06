# docker run -it --rm --name run-my-kafka -p 2181:2181 -p 9092:9092 daggerok/kafka:v9

FROM openjdk:8u151-jre-alpine3.7
LABEL MAINTAINER='Maksim Kostromin https://github.com/daggerok'
ARG EMBEDDED_KAFKA_FAT_JAR_APP_URL_ARG='https://raw.githubusercontent.com/daggerok/embedded-kafka/mvn-repo/embedded-kafka-0.0.3-all.jar'
ARG ZOOKEEPER_DIR_ARG=/home/appuser
ARG ZOOKEEPER_PORT_ARG='2181'
ARG KAFKA_PORT_ARG='9092'
ARG KAFKA_TOPICS_ARG='\
topic1,topic2,topic3'
ARG HTTP_PORT_ARG='8080'
ARG HTTP_CONTEXT_ARG='/'
ARG JAVA_OPTS_ARG='\
-Djava.net.preferIPv4Stack=true \
-XX:+UnlockExperimentalVMOptions \
-XX:+UseCGroupMemoryLimitForHeap \
-XshowSettings:vm '
ENV EMBEDDED_KAFKA_FAT_JAR_APP_URL="${EMBEDDED_KAFKA_FAT_JAR_APP_URL_ARG}" \
    JAVA_OPTS="${JAVA_OPTS} ${JAVA_OPTS_ARG}" \
    ZOOKEEPER_PORT="${ZOOKEEPER_PORT_ARG}" \
    ZOOKEEPER_DIR="${ZOOKEEPER_DIR_ARG}" \
    KAFKA_PORT="${KAFKA_PORT_ARG}" \
    KAFKA_TOPICS="${KAFKA_TOPICS_ARG}" \
    HTTP_PORT="${HTTP_PORT_ARG}" \
    HTTP_CONTEXT="${HTTP_CONTEXT_ARG}"
RUN apk add --no-cache --update busybox-suid bash curl unzip sudo openssh-client shadow wget \
 && adduser -h /home/appuser -s /bin/bash -D -u 1025 appuser wheel \
 && echo 'appuser ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
 && sed -i 's/.*requiretty$/Defaults !requiretty/' /etc/sudoers \
 && wget --no-cookies \
         --no-check-certificate \
         --header 'Cookie: oraclelicense=accept-securebackup-cookie' \
                  'http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip' \
         -O /tmp/jce_policy-8.zip \
 && unzip -o /tmp/jce_policy-8.zip -d /tmp \
 && mv -f ${JAVA_HOME}/lib/security ${JAVA_HOME}/lib/backup-security || echo 'nothing to backup' \
 && mv -f /tmp/UnlimitedJCEPolicyJDK8 ${JAVA_HOME}/lib/security || echo 'nothing to move...' \
 && wget -O /home/appuser/kafka.jar ${EMBEDDED_KAFKA_FAT_JAR_APP_URL} \
 && chown -R appuser:wheel /home/appuser/kafka.jar \
 && apk del busybox-suid unzip openssh-client shadow wget \
 && rm -rf /var/cache/apk/* /tmp/*
USER appuser
WORKDIR /home/appuser
VOLUME /home/appuser
CMD /bin/bash
ENTRYPOINT java -Djava.net.preferIPv4Stack=true \
                -XX:+UnlockExperimentalVMOptions \
                -XX:+UseCGroupMemoryLimitForHeap \
                -XshowSettings:vm \
                -jar ~/kafka.jar \
                        --zookeeperPort="${ZOOKEEPER_PORT}" \
                        --zookeeperDir="${ZOOKEEPER_DIR}" \
                        --kafkaPort="${KAFKA_PORT}" \
                        --kafkaTopics="${KAFKA_TOPICS}" \
                        --httpPort="${HTTP_PORT}" \
                        --httpContext="${HTTP_CONTEXT}"
EXPOSE ${ZOOKEEPER_PORT} ${KAFKA_PORT} ${HTTP_PORT}
HEALTHCHECK --timeout=2s \
            --retries=33 \
            CMD curl -f "http://127.0.0.1:${HTTP_PORT}${HTTP_CONTEXT}" || exit 1

### you can use next docker-compose ###
#
# version: '2.1'
# services:
#   kafka:
#     image: daggerok/kafka:v9
#     environment:
#       ZOOKEEPER_PORT: 2181
#       ZOOKEEPER_DIR: ./zk
#       KAFKA_PORT: 9092
#       KAFKA_TOPICS: orders,invoices
#       HTTP_PORT: 8080
#       HTTP_CONTEXT: /
#     volumes: ['kafka-data:/home']
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
