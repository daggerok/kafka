# kafka [![Build Status](https://travis-ci.org/daggerok/kafka.svg?branch=master)](https://travis-ci.org/daggerok/kafka)
[Docker image](https://hub.docker.com/r/daggerok/kafka/) running `spring cloud kafka`

**Exposed ports**:

- 2128 - zookeeper
- 9092 - kafka broker
- 9091 - http health endpoint (optional)

### Usage:

#### Dockerfile

```dockerfile

FROM daggerok/kafka:spring-cloud-cli
ENV ZOOKEEPER_PORT=2181 \
    KAFKA_PORT=9092 \
    HTTP_PORT=8080

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
      HTTP_PORT: 9091
    ports:
    - '2181:2181'
    - '9092:9092'
    - '9091:9091'
    volumes:
    - 'kafka-data:/root'
    networks: [backing-services]
volumes:
  kafka-data: {}
networks:
  backing-services:
    driver: bridge

```
