---
title: "Kubernetes HPA và VPA: Hướng dẫn thực chiến"
date: 2026-04-20
categories: [DevOps, Backend]
tags: [kubernetes, k8s, autoscaling, devops]
featured: true
header:
  overlay_image: /assets/images/default-banner.jpg
  overlay_filter: 0.3
  teaser: /assets/images/default-banner.jpg
excerpt: "Tìm hiểu cách cấu hình Horizontal Pod Autoscaler và Vertical Pod Autoscaler để tự động scale ứng dụng Kubernetes theo tải thực tế."
read_time: true
---

## Horizontal Pod Autoscaler (HPA)

HPA tự động điều chỉnh số lượng pod dựa trên CPU/memory usage.

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: my-app-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: my-app
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
```

## Vertical Pod Autoscaler (VPA)

VPA điều chỉnh resource requests/limits của từng container.

## Khi nào dùng HPA vs VPA?

- **HPA**: Stateless applications, workloads có thể scale out
- **VPA**: Stateful workloads, cần tối ưu resource utilization
