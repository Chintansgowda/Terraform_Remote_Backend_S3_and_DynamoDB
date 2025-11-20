# Terraform Remote Backend using S3 and DynamoDB

This project demonstrates how to securely store Terraform state using an S3 bucket and manage state locking using DynamoDB.

---

## 1. Overview

The goal of this project is to move Terraform state away from the local machine and into a secure, centralized backend.

Key points:
- Local statefile contains sensitive data  
- Local statefile becomes visible to anyone who can access the repo  
- No locking → results in state corruption if multiple users run Terraform  
- S3 bucket stores the state in a secure, versioned backend  
- DynamoDB provides state locking to prevent concurrent writes  

---

## 2. Project Directory Structure

    STATEFILE-RMT-BEND/
    │── backend.tf
    │── dynamoDB.tf
    │── s3.tf
    │── provider.tf
    │── variable.tf
    │── main.tf

---

## 3. Purpose of This Project

### 3.1 Problems with Local Statefile

- Sensitive information stored in terraform.tfstate  
- Anyone with project/repo access can read the statefile  
- No concurrency control; parallel runs may corrupt the state  

### 3.2 Objectives

- Store Terraform state securely in S3  
- Use DynamoDB for state locking  
- Ensure safe collaboration for teams  
- Prevent accidental state corruption  

---

## 4. Technologies Used

- Terraform v1.x  
- AWS S3  
- AWS DynamoDB  
- AWS IAM  

---

## 5. Steps to Use the Project

### 5.1 Initialize Terraform
    terraform init

### 5.2 Validate configuration
    terraform validate

### 5.3 Preview execution plan
    terraform plan

### 5.4 Apply configuration
    terraform apply

---

## 6. Backend Example

    terraform {
      backend "s3" {
        bucket         = "<your-s3-bucket>"
        key            = "state/terraform.tfstate"
        region         = "us-east-1"
        dynamodb_table = "<your-dynamodb-table>"
        encrypt        = true
      }
    }

---

## 7. Summary

A production-ready remote backend with:
- Centralized state management  
- State locking  
- Secure storage  
- Team-safe Terraform workflow  
