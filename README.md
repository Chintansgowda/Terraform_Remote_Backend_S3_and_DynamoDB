# Terraform Remote Backend using S3 and DynamoDB

## 1. Overview

This project demonstrates how to configure a secure Terraform remote backend using S3 for state storage and DynamoDB for state locking.

## 2. Project Directory Structure

STATEFILE-RMT-BEND/
│── backend.tf
│── dynamoDB.tf
│── s3.tf
│── provider.tf
│── variable.tf
│── main.tf

markdown
Copy code

## 3. Purpose of This Project

### 3.1 Problems with Local Statefile

- Sensitive data stored in `terraform.tfstate`
- Anyone with access to the repo can read the statefile
- No state locking, causing possible corruption

### 3.2 Objectives

- Store state securely in S3  
- Use DynamoDB for state locking  
- Provide team-safe Terraform operations  

## 4. Technologies Used

- Terraform v1.x  
- AWS S3  
- AWS DynamoDB  
- AWS IAM  

## 5. Steps to Use the Project

### 5.1 Initialize Terraform
terraform init

shell
Copy code

### 5.2 Validate
terraform validate

shell
Copy code

### 5.3 Plan
terraform plan

shell
Copy code

### 5.4 Apply
terraform apply

shell
Copy code

## 6. Backend Example

terraform {
backend "s3" {
bucket = "<your-s3-bucket>"
key = "state/terraform.tfstate"
region = "us-east-1"
dynamodb_table = "<your-dynamodb-table>"
encrypt = true
}
}

pgsql
Copy code

## 7. Summary

This project provides a production-ready remote backend with secure state storage and locking.
