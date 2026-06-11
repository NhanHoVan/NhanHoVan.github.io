---
title: "Building RESTful APIs with Node.js and Express"
date: 2025-12-10
categories: [Backend]
tags: [nodejs, express, rest-api, javascript, english]
featured: false
lang: en
header:
  overlay_image: /assets/images/default-banner.jpg
  overlay_filter: 0.3
excerpt: "A comprehensive guide to building production-ready RESTful APIs with Node.js, Express, and best practices for authentication, validation, and error handling."
read_time: true
---

## Introduction

Building a REST API is one of the most common tasks in backend development. In this guide, we'll build a production-ready API using Node.js and Express.

### Why Node.js for APIs?

Node.js excels at I/O-bound tasks due to its event-driven, non-blocking architecture. It's particularly well-suited for:

- Real-time applications
- API servers handling many concurrent connections
- Microservices

## Setting Up the Project

### Prerequisites

- Node.js 18+
- npm or yarn

### Initialize the project

```bash
mkdir my-api && cd my-api
npm init -y
npm install express joi helmet morgan
npm install --save-dev nodemon typescript @types/express
```

## Project Structure

```
src/
├── controllers/
│   └── userController.ts
├── middleware/
│   ├── auth.ts
│   └── validate.ts
├── routes/
│   └── users.ts
├── models/
│   └── User.ts
└── app.ts
```

## Building the API

### Setting up Express

```typescript
import express, { Application } from 'express';
import helmet from 'helmet';
import morgan from 'morgan';

const app: Application = express();

// Security middleware
app.use(helmet());
app.use(morgan('combined'));
app.use(express.json());

export default app;
```

### Input Validation with Joi

```javascript
const Joi = require('joi');

const userSchema = Joi.object({
  name: Joi.string().min(2).max(50).required(),
  email: Joi.string().email().required(),
  password: Joi.string().min(8).required()
});

function validateUser(req, res, next) {
  const { error } = userSchema.validate(req.body);
  if (error) return res.status(400).json({ error: error.details[0].message });
  next();
}
```

#### Error Handling Middleware

```javascript
function errorHandler(err, req, res, next) {
  console.error(err.stack);
  res.status(err.status || 500).json({
    error: err.message || 'Internal Server Error'
  });
}
```

## Authentication with JWT

```yaml
# Environment variables
JWT_SECRET: your-super-secret-key
JWT_EXPIRY: 7d
```

> **Security Note:** Never hardcode secrets in your source code. Always use environment variables or a secrets manager like AWS Secrets Manager or HashiCorp Vault.

## Testing the API

```bash
# Test with curl
curl -X POST http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -d '{"name": "John Doe", "email": "john@example.com", "password": "secure123"}'
```

## Conclusion

We've built a production-ready REST API with:

- Input validation
- Error handling
- Security headers
- Authentication middleware

The patterns shown here form a solid foundation for building scalable Node.js APIs.
