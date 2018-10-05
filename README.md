# kafka [![Build Status](https://travis-ci.org/daggerok/kafka.svg?branch=v11)](https://travis-ci.org/daggerok/kafka)
[Docker image](https://hub.docker.com/r/daggerok/kafka/) of simple java app with embedded kafka

- based on [8u181-jre-slim-stretch](https://github.com/docker-library/openjdk/blob/86918ee28d383e7af63f535a2558040dce141099/8/jre/slim/Dockerfile) image
- linux ubuntu, java openjdk8 (jre 8u181), jce policy
- kafka version: 1.0.0

**Available tags**:

- [`daggerok/kafka:spring-cloud-cli (latest)`](https://github.com/daggerok/kafka/blob/master/Dockerfile)
- [`daggerok/kafka:spring-cloud-cli-openjdk8`](https://github.com/daggerok/kafka/blob/spring-cloud-cli-openjdk8/Dockerfile)
- [`v11`](https://github.com/daggerok/kafka/blob/v11/Dockerfile)
- [`v10`](https://github.com/daggerok/kafka/blob/v10/Dockerfile)
- `...`

**Exposed ports**:

- 2128 - zookeeper
- 9092 - kafka broker
- 9091 - http actuator endpoints

### Usage:

#### docker

```bash

docker run -p 2181:2181 -p 9092:9092 daggerok/kafka:v11

```

#### Dockerfile

```dockerfile

FROM daggerok/kafka:v11
ENV ZOOKEEPER_PORT=2181 \
    ZOOKEEPER_DIR=/root/.zk \
    KAFKA_PORT=9092 \
    KAFKA_TOPICS="topic1,topic2,topic3" \
    HTTP_PORT=8080 \
    HTTP_CONTEXT=/

```

#### docker-compose.yml

```yaml

version: '2.1'
services:
  kafka:
    image: daggerok/kafka:v10
    environment:
      HTTP_PORT: 8080
      HTP_CONTEXT: /
      ZOOKEEPER_PORT: 2181
      ZOOKEEPER_DIR: ./zk
      KAFKA_PORT: 9092
      KAFKA_TOPICS: orders,invoices
    ports:
    - '8080:8080'
    - '2181:2181'
    - '9092:9092'
    volumes:
    - 'kafka-data:/root'
    networks:
      backing-services:
        aliases:
        - k
        - z
        - zoo
        - kafka
        - broker
        - zookeeper
        - kafka-broker
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

#### previous tiny version v10: based on openjdk:8u171-jdk-alpine3.8 image

```yaml

version: '2.1'
services:
  kafka:
    image: daggerok/kafka:v10
    environment:
      ZOOKEEPER_PORT: 2181
      ZOOKEEPER_DIR: ./zk
      KAFKA_PORT: 9092
      KAFKA_TOPICS: topicA,topicB
      HTTP_PORT: 8080
      HTTP_CONTEXT: /
    ports: ['8080:8080']
    networks:
      backing-services:
        aliases:
        - k
        - kafka
        - broker
        - kafka-broker
networks:
  backing-services:
    driver: bridge

```

read more:

- [spring-cloud-cli reference](http://cloud.spring.io/spring-cloud-static/spring-cloud-cli/1.4.0.RELEASE/single/spring-cloud-cli.html)
- [spring-cloud-cli project](https://cloud.spring.io/spring-cloud-cli/)
- [spring-cloud-cli github](https://github.com/spring-cloud/spring-cloud-cli/tree/master/docs/src/main/asciidoc)
- [using spring-boot-cli](https://docs.spring.io/spring-boot/docs/current/reference/html/cli-using-the-cli.html)
- [installing spring-boot-cli](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started-installing-spring-boot.html)
