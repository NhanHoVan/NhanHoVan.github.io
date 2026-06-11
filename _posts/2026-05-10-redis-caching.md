---
title: "Redis Caching Patterns trong Node.js"
date: 2026-05-10
categories: [Backend]
tags: [redis, caching, nodejs]
featured: false
excerpt: "Implement các caching patterns với Redis: Cache-Aside, Write-Through, và Cache Invalidation strategies."
---

## Cache-Aside Pattern

```javascript
async function getUser(userId) {
  const cached = await redis.get(`user:${userId}`);
  if (cached) return JSON.parse(cached);
  
  const user = await db.query('SELECT * FROM users WHERE id = $1', [userId]);
  await redis.setex(`user:${userId}`, 3600, JSON.stringify(user));
  return user;
}
```
