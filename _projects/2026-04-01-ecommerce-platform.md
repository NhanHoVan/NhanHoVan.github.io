---
title: "E-Commerce Platform"
date: 2026-04-01
featured: true
description: "Nền tảng thương mại điện tử B2C với microservices architecture, xử lý 10,000 đơn hàng/ngày"
tech_stack: [Java, Spring Boot, React, PostgreSQL, Redis, Kafka, Kubernetes]
header:
  overlay_image: /assets/images/default-banner.jpg
  overlay_filter: 0.3
repo_url: "https://github.com/username/ecommerce-platform"
attachments:
  - label: "Architecture Diagram"
    url: "https://drive.google.com/file/d/example"
  - label: "Tài liệu kỹ thuật"
    url: "/assets/documents/2026-04-01-ecommerce-architecture.pdf"
---

## Business Overview

Nền tảng thương mại điện tử B2C phục vụ thị trường Việt Nam với các tính năng: quản lý sản phẩm, giỏ hàng, thanh toán, và tracking đơn hàng.

## Tech Stack

| Layer | Công nghệ |
|---|---|
| Frontend | React, TypeScript, Redux |
| Backend | Java, Spring Boot, Spring Cloud |
| Database | PostgreSQL, Redis |
| Message Broker | Apache Kafka |
| Infrastructure | Kubernetes, Docker, AWS |

## Responsibilities

- Thiết kế và implement Order Service và Payment Service
- Tích hợp cổng thanh toán VNPay và MoMo
- Xây dựng event-driven architecture với Kafka
- Deploy và maintain Kubernetes cluster trên AWS EKS

## Challenges & Solutions

**Thách thức:** Race condition khi nhiều user cùng mua sản phẩm cuối cùng trong kho.
**Giải pháp:** Implement optimistic locking với version field trong PostgreSQL, kết hợp Redis distributed lock.

## Lessons Learned

- Event sourcing pattern giúp audit trail và debugging dễ dàng hơn
- Cần cẩn thận với distributed transactions trong microservices
