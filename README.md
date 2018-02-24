# kafka [![Build Status](https://travis-ci.org/daggerok/kafka.svg?branch=master)](https://travis-ci.org/daggerok/kafka)
[Docker image](https://hub.docker.com/r/daggerok/kafka/) of simple java app with embedded kafka

**Exposed ports**:

- 2128 - zookeeper
- 9092 - kafka broker
- 8080 - http health endpoint

### Usage:

#### Dockerfile

```dockerfile

FROM daggerok/kafka:v8
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
    image: daggerok/kafka:v8
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

