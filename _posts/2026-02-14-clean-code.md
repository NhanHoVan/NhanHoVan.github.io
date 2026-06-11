---
title: "Clean Code Principles mọi Developer cần biết"
date: 2026-02-14
categories: [Programming]
tags: [clean-code, best-practices, programming]
featured: false
excerpt: "Tổng hợp các nguyên tắc Clean Code quan trọng: naming conventions, function design, và SOLID principles."
---

## Meaningful Names

```python
# Bad
def calc(x, y):
    return x * y * 0.1

# Good
def calculate_discount(price, quantity):
    DISCOUNT_RATE = 0.1
    return price * quantity * DISCOUNT_RATE
```

## Single Responsibility Principle

Mỗi function/class chỉ nên có một lý do để thay đổi.
