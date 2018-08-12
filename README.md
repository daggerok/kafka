# kafka [![Build Status](https://travis-ci.org/daggerok/kafka.svg?branch=master)](https://travis-ci.org/daggerok/kafka)
[Docker image](https://hub.docker.com/r/daggerok/kafka/) running `spring cloud kafka`

- ubuntu 18.04 (boinic)
- java version: oraclejdk8 + jce policy
- spring-boot / CLI verstion: 2.0.4.RELEASE
- kafka version: 1.0.2

**Exposed ports**:

- 2128 - zookeeper
- 9092 - kafka broker
- 9091 - http actuator endpoints

### Usage:

#### Dockerfile

```bash
docker run -p 2181:2181 -p 9092:9092 daggerok/kafka:spring-cloud-cli
```

#### Dockerfile

```dockerfile

FROM daggerok/kafka:spring-cloud-cli
ENV ZOOKEEPER_PORT=2181 \
    KAFKA_PORT=9092

```

#### docker-compose.yml

```yaml

version: '2.1'
services:
  kafka:
    image: daggerok/kafka:spring-cloud-cli
    environment:
      ZOOKEEPER_PORT: 2181
      KAFKA_PORT: 9092
    ports:
    - '2181:2181'
    - '9092:9092'
    volumes:
    - 'kafka-data:/root'
    networks: [backing-services]
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
