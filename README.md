# kafka [![Build Status](https://travis-ci.org/daggerok/kafka.svg?branch=spring-cloud-cli-oraclejdk8-ubuntu)](https://travis-ci.org/daggerok/kafka)
[Docker automated build](https://hub.docker.com/r/daggerok/kafka/) running [`spring cloud kafka`](https://docs.spring.io/spring-boot/docs/current/reference/html/cli-using-the-cli.html) command installed using [sdkman](https://sdkman.io/)

- based on `ubuntu:18.04` image (boinic)

using:

- java oraclejdk8 (8u181)
- jce policy
- spring-boot 2.0.5.RELEASE
- spring-cloud CLI 2.0.0.RELEASE
- kafka 1.0.2

**Available tags**:

*daggerok/embedded-kafka*

- [TODO: `daggerok/kafka:latest` based on `openjdk:12-ea-14-jdk-oraclelinux7` and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/master/Dockerfile)
- [`daggerok/kafka:v19` based on `openjdk:8u181-jdk-slim-stretch` and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v19/Dockerfile)
- [`daggerok/kafka:v18` based on `openjdk:11-jre-slim-sid` and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v17/Dockerfile)
- [`daggerok/kafka:v17` based on `openjdk:10.0.2-jdk-oraclelinux7` and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v17/Dockerfile)
- [`daggerok/kafka:v16` based on `openjdk:10.0.2-jdk-sid` and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v16/Dockerfile)
- [`daggerok/kafka:v15` based on `openjdk:10.0.2-jdk-slim-sid` and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v15/Dockerfile)
- [`daggerok/kafka:v14` based on `openjdk:10.0.2-jre-sid` and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v14/Dockerfile)
- [`daggerok/kafka:v13` based on `openjdk:10.0.2-jre-slim-sid` and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v13/Dockerfile)
- [`daggerok/kafka:v12` based on `openjdk:8u181-jdk-stretch` and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v12/Dockerfile)
- [`daggerok/kafka:v11` based on `openjdk:8u181-jre-slim-stretch` and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v11/Dockerfile)
- [`daggerok/kafka:v10` based on `openjdk:8u171-jdk-alpine3.8` and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v10/Dockerfile)
- [`daggerok/kafka:v9` based on `openjdk:8u151-jre-alpine3.7` and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v9/Dockerfile)

*spring cloud kafka*

- [`daggerok/kafka:spring-cloud-cli-v19` based on `openjdk:8u181-jdk-slim-stretch` and `spring-cloud-cli`](https://github.com/daggerok/kafka/blob/spring-cloud-cli-v19/Dockerfile)
- [`daggerok/kafka:spring-cloud-cli-openjdk8-ubuntu` based on `ubuntu`, `openjdk8` and `spring-cloud-cli`](https://github.com/daggerok/kafka/blob/spring-cloud-cli-openjdk8-ubuntu/Dockerfile)
- [`daggerok/kafka:spring-cloud-cli-oraclejdk8-ubuntu` based on `ubuntu`, `oraclejdk8` and `spring-cloud-cli`](https://github.com/daggerok/kafka/blob/spring-cloud-cli-oraclejdk8-ubuntu/Dockerfile)

**Exposed ports**:

- 2128 - zookeeper
- 9092 - kafka broker
- 9091 - health endpoint

### Usage:

#### rapid development with docker

```bash

docker run -it --rm --name run-my-kafka -p 2181:2181 -p 9092:9092 daggerok/kafka:spring-cloud-cli-oraclejdk8-ubuntu
#docker run --rm --name run-my-kafka -p 2181:2181 -p 9092:9092 daggerok/kafka:spring-cloud-cli-oraclejdk8-ubuntu
docker exec -it run-my-kafka /bin/bash

```

#### Dockerfile

```dockerfile

FROM daggerok/kafka:spring-cloud-cli-oraclejdk8-ubuntu
ENV ZOOKEEPER_PORT=2181 \
    KAFKA_PORT=9092

```

```bash

docker build --no-cache -t my-kafka .
docker run -it --rm --name=run-my-kafka -p 2181:2181 -p 9092:9092 -p 9091:9091 my-kafka

```

#### docker-compose.yml

```yaml

version: '2.1'
services:
  kafka:
    image: daggerok/kafka:spring-cloud-cli-oraclejdk8-ubuntu
    #image: daggerok/kafka:spring-cloud-cli-openjdk8-ubuntu
    #image: daggerok/kafka:spring-cloud-cli-v19
    environment:
      ZOOKEEPER_PORT: 2181
      KAFKA_PORT: 9092
    ports:
    - '2181:2181'
    - '9092:9092'
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

docker run -p 2181:2181 -p 9092:9092 daggerok/kafka:spring-cloud-cli-openjdk8-ubuntu

```

or use sources:

```bash

git clone https://github.com/daggerok/kafka
cd kafka/
docker build --no-cache -f Dockerfile.openjdk8 -t my-kafka .
docker run -it --rm --name=run-my-kafka -p 2181:2181 -p 9092:9092 my-kafka

```

#### different kafka images

**daggerok/embedded-kafka**

```yaml

version: '2.1'
services:
  kafka:
    #image: daggerok/kafka:v11
    #image: daggerok/kafka:v12
    #image: daggerok/kafka:v13
    #image: daggerok/kafka:v14
    #image: daggerok/kafka:v15
    #image: daggerok/kafka:v16
    #image: daggerok/kafka:v17
    #image: daggerok/kafka:v18
    image: daggerok/kafka:v19
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

**alpine**

```yaml

version: '2.1'
services:
  kafka:
    image: daggerok/kafka:v10
    #image: daggerok/kafka:v9
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
    - 'kafka-data:/home'
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

- [sdkman](https://sdkman.io/)
- [spring-cloud-cli reference](http://cloud.spring.io/spring-cloud-static/spring-cloud-cli/1.4.0.RELEASE/single/spring-cloud-cli.html)
- [spring-cloud-cli project](https://cloud.spring.io/spring-cloud-cli/)
- [installing spring-boot-cli](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started-installing-spring-boot.html)
- [using spring-boot-cli](https://docs.spring.io/spring-boot/docs/current/reference/html/cli-using-the-cli.html)
- [GitHub: spring-cloud-cli](https://github.com/spring-cloud/spring-cloud-cli/tree/master/docs/src/main/asciidoc)
- [GitHub: daggerok/embedded-kafka](https://github.com/daggerok/kafka)
