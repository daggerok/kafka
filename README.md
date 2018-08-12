# kafka [![Build Status](https://travis-ci.org/daggerok/kafka.svg?branch=master)](https://travis-ci.org/daggerok/kafka)
[Docker image](https://hub.docker.com/r/daggerok/kafka/) of simple java app with embedded kafka

- linux: alpine 3.8
- java version: openjdk8 (8u181) + jce policy
- kafka version: 1.0.0

**Exposed ports**:

- 2128 - zookeeper
- 9092 - kafka broker
- 8080 - http health endpoint

### Usage:

#### docker

```bash

docker run -p 2181:2181 -p 9092:9092 daggerok/kafka:v10

```

#### Dockerfile

```dockerfile

FROM daggerok/kafka:v10
ENV ZOOKEEPER_PORT=2181 \
    ZOOKEEPER_DIR=/home/appuser \
    KAFKA_PORT=9092 \
    KAFKA_TOPICS="topic1,topic2,topic3" \
    HTTP_PORT=8080 \
    HTTP_CONTEXT=/

```

#### docker-compose.yml

```yaml

version: "2.1"
services:
  kafka:
    image: daggerok/kafka:v10
    environment:
      ZOOKEEPER_PORT: 2181
      ZOOKEEPER_DIR: /home/appuser
      KAFKA_PORT: 9092
      KAFKA_TOPICS: topic1,topic2,topic3
      HTTP_PORT: 8080
      HTP_CONTEXT: /
    ports:
    - "2181:2181"
    - "9092:9092"
    - "8080:8080"
    volumes:
    - "kafka-data:/home"
    networks: [backing-services]
volumes:
  kafka-data: {}
networks:
  backing-services:
    driver: bridge

```

```bash

docker-compose up
# ...
docker-compose down -v

```

#### openjdk8 (no jce policy)

```bash

docker run -p 2181:2181 -p 9092:9092 daggerok/kafka:spring-cloud-cli-openjdk8

```

or:

```bash

git clone https://github.com/daggerok/kafka
cd kafka/
docker build --no-cache -f Dockerfile.openjdk8 -t my-kafka .
docker run --rm --name=run-my-kafka -p 2181:2181 -p 9092:9092 my-kafka

```

read more:

- [spring-cloud-cli reference](http://cloud.spring.io/spring-cloud-static/spring-cloud-cli/1.4.0.RELEASE/single/spring-cloud-cli.html)
- [spring-cloud-cli project](https://cloud.spring.io/spring-cloud-cli/)
- [spring-cloud-cli github](https://github.com/spring-cloud/spring-cloud-cli/tree/master/docs/src/main/asciidoc)
- [using spring-boot-cli](https://docs.spring.io/spring-boot/docs/current/reference/html/cli-using-the-cli.html)
- [installing spring-boot-cli](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started-installing-spring-boot.html)
