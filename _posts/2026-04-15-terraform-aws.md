---
title: "Infrastructure as Code với Terraform trên AWS"
date: 2026-04-15
categories: [DevOps, Cloud]
tags: [terraform, aws, iac, infrastructure]
featured: false
excerpt: "Hướng dẫn quản lý infrastructure AWS bằng Terraform: VPC, EC2, RDS, và S3."
---

## Cấu trúc Project Terraform

```
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    ├── vpc/
    └── ec2/
```

## VPC Module

```hcl
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.project_name}-vpc"
  }
}
```
