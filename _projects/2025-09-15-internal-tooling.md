---
title: "Internal DevOps Tooling"
date: 2025-09-15
featured: false
description: "Bộ công cụ nội bộ tự động hóa quy trình deployment và monitoring cho engineering team"
tech_stack: [Python, FastAPI, React, PostgreSQL, Docker]
header:
  overlay_image: /assets/images/default-banner.jpg
  overlay_filter: 0.3
repo_url: "https://github.com/username/devops-tooling"
---

## Business Overview

Dashboard nội bộ giúp engineering team theo dõi deployment status, quản lý environment variables, và tự động hóa các tác vụ DevOps lặp lại.

## Tech Stack

| Layer | Công nghệ |
|---|---|
| Frontend | React, Ant Design |
| Backend | Python, FastAPI |
| Database | PostgreSQL |
| Infrastructure | Docker Compose |

## Responsibilities

- Thiết kế và phát triển toàn bộ hệ thống từ đầu
- Implement REST API với FastAPI
- Xây dựng dashboard real-time với WebSocket

## Challenges & Solutions

**Thách thức:** Đồng bộ trạng thái deployment real-time cho nhiều môi trường.
**Giải pháp:** WebSocket kết hợp với polling fallback.

## Lessons Learned

- FastAPI rất phù hợp cho internal tooling nhờ tự động generate OpenAPI docs
- React Query giúp quản lý server state hiệu quả
