---
title: "CI/CD Pipeline với GitHub Actions"
date: 2026-01-20
categories: [DevOps]
tags: [github-actions, cicd, automation]
featured: false
excerpt: "Xây dựng CI/CD pipeline hoàn chỉnh với GitHub Actions: automated testing, Docker build, và deployment."
---

## Workflow cơ bản

```yaml
name: CI/CD Pipeline
on:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: npm test
```

## Matrix Testing

```yaml
strategy:
  matrix:
    node-version: [18, 20, 22]
```
