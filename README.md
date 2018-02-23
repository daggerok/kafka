# kafka [![Build Status](https://travis-ci.org/daggerok/kafka.svg?branch=master)](https://travis-ci.org/daggerok/kafka)
[Docker image](https://hub.docker.com/r/daggerok/kafka/) of simple java app with embedded kafka

**Exposed ports**:

- 9092 - kafka broker
- 8080 - spring webflux health endpoint

### Usage:

#### Dockerfile

```dockerfile

FROM daggerok/kafka:v6
ENV KAFKA_TOPICS="firstTopc,secondTopic"

```

#### docker-compose.yml

```yaml

version: "2.1"
services:
  kafka:
    image: daggerok/kafka:v6
    environment:
      KAFKA_TOPICS: 'firstTopic,secondTopic'
    ports:
    - "2181:2181"
    - "9092:9092"
    volumes:
    - "kafka-data:/var"
    - "kafka-data:/tmp"
    networks: [backing-services]
volumes:
  kafka-data: {}
networks:
  backing-services:
    driver: bridge

```

