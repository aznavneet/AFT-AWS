# AWS Account Factory for Terraform (AFT)

## Overview

AWS Account Factory for Terraform (AFT) automates AWS account provisioning and customization in an AWS Control Tower environment using Terraform and GitLab CI/CD.

---

# Architecture

```text
AWS Control Tower
        │
        ▼
AFT Management Account
        │
        ▼
AWS Account Factory for Terraform (AFT)
        │
        ├──────────────► Global Customization Repository
        │
        └──────────────► Account Customization Repository
```

---

# Repository Structure

## 1. AFT Deployment Repository

Deploys and manages the AFT infrastructure.

**Responsibilities**

* Deploy AFT
* Configure Terraform backend
* Create required AWS resources
* Manage AFT lifecycle

---

## 2. Global Customization Repository

Terraform code applied to **every AFT-managed account**.

**Examples**

* AWS Config
* CloudTrail
* GuardDuty
* Organization IAM baseline
* Security controls

---

## 3. Account Customization Repository

Terraform code applied only to **specific AWS accounts**.

**Examples**

* VPC
* IAM Roles
* Security Groups
* S3 Buckets
* Project infrastructure

---

# IAM Roles & Authentication

## GitLab Deployment Identity

Used by the GitLab pipeline to deploy AFT.

**Location**

* AFT Management Account

**Recommended Authentication**

* GitLab OIDC + IAM Role

**Alternative**

* Dedicated IAM User with AssumeRole permissions

---

## AFT Deployment Role

**Location**

* AFT Management Account

**Purpose**

* Assumed by the GitLab pipeline
* Deploys and updates AFT infrastructure using Terraform

---

## AFT Execution Roles

Created automatically by AFT.

**Purpose**

* Execute Terraform customizations
* Apply Global Customizations
* Apply Account Customizations

---

# GitLab Pipeline

The GitLab CI/CD pipeline automates the complete deployment process.

**Pipeline Stages**

1. Validate Terraform
2. Terraform Plan
3. Terraform Apply
4. Authenticate to AWS
5. Deploy or update AFT
6. Trigger AFT customizations

---

# Deployment Flow

```text
Developer
      │
      ▼
GitLab Repository
      │
      ▼
GitLab CI/CD Pipeline
      │
      ▼
Terraform Validate
      │
      ▼
Terraform Plan
      │
      ▼
Terraform Apply
      │
      ▼
Assume AFT Deployment Role
      │
      ▼
AFT Management Account
      │
      ▼
Deploy AWS Account Factory for Terraform
      │
      ├────────────────────────────┐
      │                            │
      ▼                            ▼
Global Customization Repo   Account Customization Repo
      │                            │
      ▼                            ▼
Applied to all accounts    Applied to target accounts
```

---

# Responsibilities

| Component                         | Responsibility                                     |
| --------------------------------- | -------------------------------------------------- |
| GitLab Repository                 | Stores Terraform code                              |
| GitLab CI/CD                      | Validates and deploys Terraform                    |
| Terraform                         | Provisions and manages AFT                         |
| AWS Control Tower                 | Provides governance and account factory foundation |
| AFT Management Account            | Hosts AFT infrastructure                           |
| AWS Account Factory for Terraform | Automates account provisioning and customization   |
| Global Customization Repository   | Baseline configuration for all managed accounts    |
| Account Customization Repository  | Resources for specific AWS accounts                |

---

# High-Level Workflow

1. Developer pushes Terraform code to GitLab.
2. GitLab CI/CD pipeline starts automatically.
3. Pipeline authenticates to AWS using OIDC or an IAM User.
4. Pipeline assumes the AFT Deployment Role.
5. Terraform deploys or updates AFT in the AFT Management Account.
6. AFT processes Global and Account Customization repositories.
7. Global customizations are applied to all managed accounts.
8. Account customizations are applied only to the specified accounts.

---

# Notes

* AFT is deployed in the **AFT Management Account**.
* The AFT Management Account must be enrolled in AWS Control Tower.
* GitLab should authenticate using **OIDC + IAM Role** for production deployments.
* Keep Global and Account Customization code in separate repositories for better governance and maintainability.
