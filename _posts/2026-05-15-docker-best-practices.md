---
title: "Docker Best Practices cho Production"
date: 2026-05-15
categories: [DevOps]
tags: [docker, container, devops]
featured: true
header:
  overlay_image: /assets/images/default-banner.jpg
  overlay_filter: 0.3
excerpt: "Các best practices khi triển khai Docker container trên môi trường production, bao gồm security hardening, image optimization và monitoring."
read_time: true
attachments:
  - label: "Slide trình bày"
    url: "https://docs.google.com/presentation/d/example"
  - label: "Tải PDF"
    url: "/assets/documents/2026-05-15-docker-best-practices.pdf"
---

## Giới thiệu

Docker đã trở thành công cụ không thể thiếu trong quy trình phát triển và triển khai ứng dụng hiện đại.

## 1. Sử dụng Multi-stage Build

Multi-stage build giúp giảm kích thước image đáng kể:

```dockerfile
# Stage 1: Build
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

# Stage 2: Runtime
FROM node:18-alpine AS runtime
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY . .
CMD ["node", "server.js"]
```

## 2. Không chạy container với quyền root

```dockerfile
# Tạo user non-root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
```

## 3. Scan image thường xuyên

```bash
# Dùng trivy để scan vulnerabilities
trivy image myapp:latest
```

## Kết luận

Áp dụng các best practices trên giúp container của bạn an toàn và hiệu quả hơn trong môi trường production.
