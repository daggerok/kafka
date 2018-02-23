# kafka [![Build Status](https://travis-ci.org/daggerok/kafka.svg?branch=master)](https://travis-ci.org/daggerok/kafka)
Docker image of simple java app with embedded kafka

**Exposed ports**:

- 2181 - zookeeper
- 9092 - broker

### Usage:

#### Dockerfile

```dockerfile

FROM daggerok/kafka:v4
ENV KAFKA_TOPICS="firstTopc,secondTopic"

```

#### docker-compose.yml

```yaml

version: "2.1"

services:

  kafka:
    image: daggerok/kafka
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
