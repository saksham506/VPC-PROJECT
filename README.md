# AWS VPC WITH NAT GATEWAY (TERRAFORM)

## 📌 Overview

This project uses Terraform to build a complete AWS VPC architecture with **public and private subnets**. A **NAT Gateway** is configured to allow secure internet access for resources inside private subnets without exposing them directly to the internet.

---

## 🏗️ Architecture

```text
Internet
   │
IGW (Internet Gateway)
   │
Public Subnet
   │
NAT Gateway
   │
Private Subnets
   │
EC2 Instances
```

---

## 🛠 Technologies Used

- AWS VPC
- Subnets (Public & Private)
- Internet Gateway
- NAT Gateway
- EC2
- Security Groups
- Terraform
- Git & GitHub

---

## 🚀 Features

- Custom VPC creation using Terraform
- Public and private subnet architecture
- NAT Gateway for private subnet internet access
- Secure network segmentation
- EC2 deployment in private subnet
- Fully automated infrastructure setup

---

## 🌐 Key Concept

Private subnet instances access the internet through:

```text
EC2 (Private Subnet) → NAT Gateway → Internet Gateway → Internet
```

---

## 📚 Learning Outcomes

- AWS VPC networking fundamentals
- NAT Gateway usage
- Public vs private subnet design
- Terraform infrastructure automation
- Secure cloud architecture principles

---

## 👨‍💻 Author

**Saksham Garcha**  
DevOps Engineer | Cloud Engineer | AWS | Terraform
