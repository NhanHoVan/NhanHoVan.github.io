---
title: "PostgreSQL Query Optimization Techniques"
date: 2026-05-25
categories: [Backend, Database]
tags: [postgresql, database, performance]
featured: false
excerpt: "Các kỹ thuật tối ưu query PostgreSQL: EXPLAIN ANALYZE, index strategies, và query planning."
---

## EXPLAIN ANALYZE

```sql
EXPLAIN ANALYZE SELECT * FROM orders WHERE user_id = 123;
```

## Index Strategies

- B-tree index cho equality và range queries
- GIN index cho array và JSONB columns
- Partial index cho filtered queries
