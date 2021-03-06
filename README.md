# kafka [![Build Status](https://travis-ci.org/daggerok/kafka.svg?branch=master)](https://travis-ci.org/daggerok/kafka)
[Docker automated build](https://hub.docker.com/r/daggerok/kafka/) running [`daggerok/embedded-kafka`](https://github.com/daggerok/kafka) app

- based on `openjdk:8u171-jre-alpine3.8` image

using: kafka 2

**Available tags**:

*confluent*

- [`daggerok/kafka:confluent-5.0.0` based on `openjdk:8u171-jre-alpine3.8` image and `confluent-5.0.0`](https://github.com/daggerok/kafka/blob/confluent-5.0.0/Dockerfile)
- [`daggerok/kafka:confluent-4.1.2` based on `openjdk:7u181-jre-alpine3.8` image and `confluent-4.1.2`](https://github.com/daggerok/kafka/blob/confluent-4.1.2/Dockerfile)
- [`daggerok/kafka:confluent-4.1.1` based on `openjdk:7u181-jre-alpine3.8` image and `confluent-4.1.1`](https://github.com/daggerok/kafka/blob/confluent-4.1.1/Dockerfile)
- [`daggerok/kafka:confluent-4.1.0` based on `openjdk:7u181-jre-alpine3.8` image and `confluent-4.1.0`](https://github.com/daggerok/kafka/blob/confluent-4.1.0/Dockerfile)
- [`daggerok/kafka:confluent-4.0.2` based on `openjdk:7u181-jre-alpine3.8` image and `confluent-4.0.2`](https://github.com/daggerok/kafka/blob/confluent-4.0.2/Dockerfile)
- [`daggerok/kafka:confluent-4.0.1` based on `openjdk:7u181-jre-alpine3.8` image and `confluent-4.0.1`](https://github.com/daggerok/kafka/blob/confluent-4.0.1/Dockerfile)
- [`daggerok/kafka:confluent-4.0.0` based on `openjdk:7u181-jre-alpine3.8` image and `confluent-4.0.0`](https://github.com/daggerok/kafka/blob/confluent-4.0.0/Dockerfile)
- [`daggerok/kafka:confluent-3.3.2` based on `openjdk:7u181-jre-alpine3.8` image and `confluent-3.3.2`](https://github.com/daggerok/kafka/blob/confluent-3.3.1/Dockerfile)
- [`daggerok/kafka:confluent-3.3.1` based on `openjdk:7u181-jre-alpine3.8` image and `confluent-3.3.1`](https://github.com/daggerok/kafka/blob/confluent-3.3.1/Dockerfile)
- [`daggerok/kafka:confluent-3.3.0` based on `openjdk:7u181-jre-alpine3.8` image and `confluent-3.3.0`](https://github.com/daggerok/kafka/blob/confluent-3.3.0/Dockerfile)

*spring cloud kafka*

- [`daggerok/kafka:spring-cloud-cli-v19` based on `openjdk:8u181-jdk-slim-stretch` image and `spring-cloud-cli`](https://github.com/daggerok/kafka/blob/spring-cloud-cli-v19/Dockerfile)
- [`daggerok/kafka:spring-cloud-cli-v17` based on `openjdk:10.0.2-jdk-oraclelinux7` image and `spring-cloud-cli`](https://github.com/daggerok/kafka/blob/spring-cloud-cli-v17/Dockerfile)
- [`daggerok/kafka:spring-cloud-cli-v16` based on `openjdk:10.0.2-jdk-sid` image and `spring-cloud-cli`](https://github.com/daggerok/kafka/blob/spring-cloud-cli-v16/Dockerfile)
- [`daggerok/kafka:spring-cloud-cli-v15` based on `openjdk:10.0.2-jdk-slim-sid` image and `spring-cloud-cli`](https://github.com/daggerok/kafka/blob/spring-cloud-cli-v15/Dockerfile)
- [`daggerok/kafka:spring-cloud-cli-v12` based on `openjdk:8u181-jdk-stretch` image and `spring-cloud-cli`](https://github.com/daggerok/kafka/blob/spring-cloud-cli-v12/Dockerfile)
- [`daggerok/kafka:spring-cloud-cli-openjdk8-ubuntu` based on `ubuntu` with `openjdk8` and `spring-cloud-cli`](https://github.com/daggerok/kafka/blob/spring-cloud-cli-openjdk8-ubuntu/Dockerfile)
- [`daggerok/kafka:spring-cloud-cli-oraclejdk8-ubuntu` based on `ubuntu` with `oraclejdk8` and `spring-cloud-cli`](https://github.com/daggerok/kafka/blob/spring-cloud-cli-oraclejdk8-ubuntu/Dockerfile)

*daggerok/embedded-kafka*

- [TODO: `daggerok/kafka:latest` based on `openjdk:12-ea-14-jdk-oraclelinux7` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/master/Dockerfile)
- [`daggerok/kafka:v24` based on `openjdk:12-ea-12-jdk-alpine3.8` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v24/Dockerfile)
- [`daggerok/kafka:v23` based on `openjdk:11-jdk-sid` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v23/Dockerfile)
- [`daggerok/kafka:v22` based on `openjdk:11-jdk-sid` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v22/Dockerfile)
- [`daggerok/kafka:v21` based on `openjdk:11-jdk-slim-sid` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v21/Dockerfile)
- [`daggerok/kafka:v20` based on `openjdk:11-jre-sid` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v20/Dockerfile)
- [`daggerok/kafka:v19` based on `openjdk:8u181-jdk-slim-stretch` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v19/Dockerfile)
- [`daggerok/kafka:v18` based on `openjdk:11-jre-slim-sid` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v17/Dockerfile)
- [`daggerok/kafka:v17` based on `openjdk:10.0.2-jdk-oraclelinux7` and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v17/Dockerfile)
- [`daggerok/kafka:v16` based on `openjdk:10.0.2-jdk-sid` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v16/Dockerfile)
- [`daggerok/kafka:v15` based on `openjdk:10.0.2-jdk-slim-sid` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v15/Dockerfile)
- [`daggerok/kafka:v14` based on `openjdk:10.0.2-jre-sid` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v14/Dockerfile)
- [`daggerok/kafka:v13` based on `openjdk:10.0.2-jre-slim-sid` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v13/Dockerfile)
- [`daggerok/kafka:v12` based on `openjdk:8u181-jdk-stretch` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v12/Dockerfile)
- [`daggerok/kafka:v11` based on `openjdk:8u181-jre-slim-stretch` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v11/Dockerfile)
- [`daggerok/kafka:v10` based on `openjdk:8u171-jdk-alpine3.8` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v10/Dockerfile)
- [`daggerok/kafka:v9` based on `openjdk:8u151-jre-alpine3.7` image and `daggerok/enbedded-kafka`](https://github.com/daggerok/kafka/blob/v9/Dockerfile)

**Exposed ports**:

- 2128 - zookeeper
- 9092 - kafka broker
- 9091 - health endpoint

### Usage:

#### rapid development with docker

*confluent*

```bash

docker run --rm \
  -it --name kafka \
  -p 9092:9092 -p 2181:2181 \
  -e KAFKA_TOPICS=orders,invoices \
  daggerok/kafka:confluent-5.0.0

```

*other images*

```bash

docker run -it --rm --name run-my-kafka -p 2181:2181 -p 9092:9092 daggerok/kafka:v24
#docker run --rm --name run-my-kafka -p 2181:2181 -p 9092:9092 daggerok/kafka:v24
docker exec -it run-my-kafka /bin/bash

```

#### Dockerfile

*confluent*

```dockerfile

FROM daggerok/kafka:confluent-5.0.0
ENV KAFKA_TOPICS='orderds,invoices'

```

*other images*

```dockerfile

FROM daggerok/kafka:v24
ENV ZOOKEEPER_PORT=2181 \
    ZOOKEEPER_DIR=/home/appuser \
    KAFKA_PORT=9092 \
    KAFKA_TOPICS='orderds,invoices' \
    HTTP_PORT=8080 \
    HTTP_CONTEXT=/

```

```bash

docker build --no-cache -t my-kafka .
docker run -it --rm --name=run-my-kafka -p 2181:2181 -p 9092:9092 -p 9091:9091 my-kafka

```

#### docker-compose.yml

*confluent*

```yaml

version: '2.1'
services:
  kafka:
    image: daggerok/kafka:confluent-5.0.0
    environment:
      KAFKA_TOPICS: orders,invoices
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

*other images*

```yaml

version: '2.1'
services:
  kafka:
    #image: daggerok/kafka:v9
    #image: daggerok/kafka:v10
    image: daggerok/kafka:v24
    environment:
      HTTP_PORT: 8080
      HTP_CONTEXT: /
      ZOOKEEPER_PORT: 2181
      ZOOKEEPER_DIR: /home/appuser
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
docker build --no-cache -f Dockerfile -t my-kafka .
docker run -it --rm --name=run-my-kafka -p 2181:2181 -p 9092:9092 my-kafka

```

#### different kafka images

**debian, rhel**

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
    #image: daggerok/kafka:v19
    #image: daggerok/kafka:v20
    #image: daggerok/kafka:v21
    #image: daggerok/kafka:v22
    image: daggerok/kafka:v23
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

*spring cloud kafka*

```yaml

version: '2.1'
services:
  kafka:
    #image: daggerok/kafka:spring-cloud-cli-oraclejdk8-ubuntu
    #image: daggerok/kafka:spring-cloud-cli-openjdk8-ubuntu
    #image: daggerok/kafka:spring-cloud-cli-v19
    #image: daggerok/kafka:spring-cloud-cli-v17
    #image: daggerok/kafka:spring-cloud-cli-v16
    #image: daggerok/kafka:spring-cloud-cli-v15
    image: daggerok/kafka:spring-cloud-cli-v12
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

read more:

- [sdkman](https://sdkman.io/)
- [spring-cloud-cli reference](http://cloud.spring.io/spring-cloud-static/spring-cloud-cli/1.4.0.RELEASE/single/spring-cloud-cli.html)
- [spring-cloud-cli project](https://cloud.spring.io/spring-cloud-cli/)
- [installing spring-boot-cli](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started-installing-spring-boot.html)
- [using spring-boot-cli](https://docs.spring.io/spring-boot/docs/current/reference/html/cli-using-the-cli.html)
- [GitHub: spring-cloud-cli](https://github.com/spring-cloud/spring-cloud-cli/tree/master/docs/src/main/asciidoc)
- [GitHub: daggerok/embedded-kafka](https://github.com/daggerok/kafka)
