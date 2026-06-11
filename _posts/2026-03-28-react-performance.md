---
title: "React Performance Optimization"
date: 2026-03-28
categories: [Frontend]
tags: [react, performance, javascript]
featured: false
excerpt: "Tối ưu hiệu năng React app với useMemo, useCallback, React.memo, và code splitting."
---

## React.memo

```jsx
const ExpensiveComponent = React.memo(({ data }) => {
  return <div>{/* render */}</div>;
});
```

## useMemo và useCallback

```jsx
const memoizedValue = useMemo(() => computeExpensiveValue(a, b), [a, b]);
const memoizedCallback = useCallback(() => doSomething(a, b), [a, b]);
```
