# docker run -it --rm --name run-my-kafka -p 2181:2181 -p 9092:9092 daggerok/kafka:spring-cloud-cli-openjdk8-ubuntu

FROM ubuntu:18.04
LABEL MAINTAINER='Maksim Kostromin https://github.com/daggerok'
ARG SPRING_CLOUD_CLI_VERSION_ARG='2.0.0.RELEASE'
ARG SPRING_BOOT_VERSION_ARG='2.0.5.RELEASE'
ARG ZOOKEEPER_PORT_ARG='2181'
ARG KAFKA_PORT_ARG='9092'
ARG JAVA_OPTS_ARG='\
-Djava.net.preferIPv4Stack=true \
-XX:+UnlockExperimentalVMOptions \
-XX:+UseCGroupMemoryLimitForHeap \
-XshowSettings:vm '
ENV SPRING_CLOUD_CLI_VERSION="${SPRING_CLOUD_CLI_VERSION_ARG}" \
    SPRING_BOOT_VERSION="${SPRING_BOOT_VERSION_ARG}" \
    JAVA_OPTS="${JAVA_OPTS} ${JAVA_OPTS_ARG}" \
    ZOOKEEPER_PORT="${ZOOKEEPER_PORT_ARG}" \
    KAFKA_PORT="${KAFKA_PORT_ARG}" \
    HTTP_PORT='9091'
RUN apt-get update -yqq \
 && apt-get clean  -yqq \
 && apt-get install -yqq --fix-missing --no-install-recommends \
                    openjdk-8-jdk lsof bash \
 && apt-get install -yqq --fix-missing --no-install-recommends --autoremove \
                    curl unzip zip psmisc \
 && curl -s 'https://get.sdkman.io' | bash \
 && /bin/bash -c '\
    source ~/.sdkman/bin/sdkman-init.sh                                                   ; \
    sdk selfupdate                                                                        ; \
    source ~/.sdkman/bin/sdkman-init.sh                                                   ; \
    sdk install springboot ${SPRING_BOOT_VERSION}                                         ; \
    sdk use springboot ${SPRING_BOOT_VERSION}                                             ; \
    spring install org.springframework.cloud:spring-cloud-cli:${SPRING_CLOUD_CLI_VERSION} ; \
    (spring cloud kafka &)                                                                ; \
    sleep 2 && echo -ne "Waiting for kafka installation"                                  ; \
    while [[ $(lsof -i:${KAFKA_PORT}|awk "{print $2}"|wc -l || 0) -lt 1 ]]                ; \
      do echo -ne "." && sleep 1                                                          ; \
    done                                                                                  ; \
    echo "Done." && (killall -9 java || true) ;' \
 && rm -rf ~/.sdkman/archives/* /tmp/*
EXPOSE ${ZOOKEEPER_PORT} ${KAFKA_PORT} ${HTTP_PORT}
## I couldn't beleive that there are must be " (double), but not ' (single quote), fuck!
#ENTRYPOINT ["/bin/bash","-c"]
#CMD ["source ~/.sdkman/bin/sdkman-init.sh && (spring cloud kafka || echo oops...)"]
ENTRYPOINT /bin/bash -c '\
           source ~/.sdkman/bin/sdkman-init.sh ; \
           (spring cloud kafka || echo " oops...")'
CMD /bin/bash
HEALTHCHECK \
  --timeout=2s \
  --retries=33 \
  CMD test `lsof -i:${KAFKA_PORT}|awk '{print $2}'|wc -l` -ge 1 \
   && test `lsof -i:${ZOOKEEPER_PORT}|awk '{print $2}'|wc -l` -ge 1 \
   && test `lsof -i:${HTTP_PORT}|awk '{print $2}'|wc -l` -ge 1

### you can use next docker-compose ###
#
# version: '2.1'
# services:
#   kafka:
#     image: daggerok/kafka:spring-cloud-cli-openjdk8-ubuntu
#     environment:
#       ZOOKEEPER_PORT: 2181
#       KAFKA_PORT: 9092
#     ports:
#     - '2181:2181'
#     - '9092:9092'
#     networks: [backing-services]
# networks:
#   backing-services:
#     driver: bridge
#
#######################################
