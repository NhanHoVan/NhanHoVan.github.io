---
title: "Xây dựng Microservices với Spring Boot và Kafka"
date: 2026-03-10
categories: [Backend]
tags: [java, spring-boot, microservices, kafka]
featured: true
header:
  overlay_image: /assets/images/default-banner.jpg
  overlay_filter: 0.3
excerpt: "Hướng dẫn xây dựng kiến trúc microservices với Spring Boot, event-driven communication qua Apache Kafka, và service discovery với Eureka."
read_time: true
---

## Kiến trúc Tổng quan

Hệ thống microservices gồm các thành phần chính:
- **API Gateway** — điểm vào duy nhất
- **Service Registry** — Eureka Server
- **Message Broker** — Apache Kafka
- **Individual Services** — Order, Payment, Notification

## Cấu hình Kafka Producer

```java
@Service
public class OrderService {
    @Autowired
    private KafkaTemplate<String, OrderEvent> kafkaTemplate;
    
    public void createOrder(Order order) {
        // Business logic
        kafkaTemplate.send("order-events", new OrderEvent(order));
    }
}
```

## Service Discovery với Eureka

```yaml
eureka:
  client:
    serviceUrl:
      defaultZone: http://eureka-server:8761/eureka/
```
