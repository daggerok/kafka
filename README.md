# kafka [![Build Status](https://travis-ci.org/daggerok/kafka.svg?branch=spring-cloud-cli-openjdk8)](https://travis-ci.org/daggerok/kafka)
[Docker image](https://hub.docker.com/r/daggerok/kafka/) running `spring cloud kafka`

- ubuntu 18.04 (boinic)
- java: openjdk8 (jdk 8u181) + jce policy
- spring-boot 2.0.5.RELEASE
- spring-cloud CLI 2.0.0.RELEASE
- kafka version: 1.0.2

**Available tags**:

- [`daggerok/kafka:spring-cloud-cli-openjdk8-jre`](https://github.com/daggerok/kafka/blob/spring-cloud-cli-openjdk8-jre/Dockerfile)
- [`daggerok/kafka:spring-cloud-cli-openjdk8`](https://github.com/daggerok/kafka/blob/spring-cloud-cli-openjdk8/Dockerfile)
- [`daggerok/kafka:spring-cloud-cli (latest)`](https://github.com/daggerok/kafka/blob/master/Dockerfile)
- [`v11`](https://github.com/daggerok/kafka/blob/v11/Dockerfile)
- [`v10`](https://github.com/daggerok/kafka/blob/v10/Dockerfile)
- [`v9`](https://github.com/daggerok/kafka/blob/v9/Dockerfile)

**Exposed ports**:

- 2128 - zookeeper
- 9092 - kafka broker
- 9091 - http actuator endpoints

### Usage:

#### docker

```bash

docker run -p 2181:2181 -p 9092:9092 daggerok/kafka:spring-cloud-cli-openjdk8

```

#### Dockerfile

```dockerfile

FROM daggerok/kafka:spring-cloud-cli-openjdk8
ENV ZOOKEEPER_PORT=2181 \
    KAFKA_PORT=9092

```

```bash

docker build --no-cache -t my-kafka .
docker run --rm --name=run-my-kafka -p 2181:2181 -p 9092:9092 -p 9091:9091 my-kafka

```

#### docker-compose.yml

```yaml

version: '2.1'
services:
  kafka:
    #image: daggerok/kafka:spring-cloud-cli-openjdk8-jre
    image: daggerok/kafka:spring-cloud-cli-openjdk8
    #image: daggerok/kafka:spring-cloud-cli
    environment:
      ZOOKEEPER_PORT: 2181
      KAFKA_PORT: 9092
    ports:
    - '2181:2181'
    - '9092:9092'
    networks: [backing-services]
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

docker run -p 2181:2181 -p 9092:9092 daggerok/kafka:spring-cloud-cli-openjdk8-jre

```

or:

```bash

git clone https://github.com/daggerok/kafka
cd kafka/
docker build --no-cache -f Dockerfile.openjdk8 -t my-kafka .
docker run --rm --name=run-my-kafka -p 2181:2181 -p 9092:9092 my-kafka

```

#### different tiny kafka v11: based on openjdk:8u181-jre-slim-stretch image

```yaml

version: '2.1'
services:
  kafka:
    image: daggerok/kafka:v11
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

read more:

- [spring-cloud-cli reference](http://cloud.spring.io/spring-cloud-static/spring-cloud-cli/1.4.0.RELEASE/single/spring-cloud-cli.html)
- [spring-cloud-cli project](https://cloud.spring.io/spring-cloud-cli/)
- [spring-cloud-cli github](https://github.com/spring-cloud/spring-cloud-cli/tree/master/docs/src/main/asciidoc)
- [using spring-boot-cli](https://docs.spring.io/spring-boot/docs/current/reference/html/cli-using-the-cli.html)
- [installing spring-boot-cli](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started-installing-spring-boot.html)
