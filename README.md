# Deploy to S3

This GitHub Actions workflow automatically deploys your code to an S3 bucket whenever changes are pushed to the `main` branch or a pull request is made targeting the `main` branch. This is ideal for static sites or files that you want to host on AWS S3.

## Workflow Overview

- **Trigger**: The workflow is triggered on `push` and `pull_request` events to the `main` branch.
- **Actions**: The workflow performs the following steps:
  1. **Checkout code**: Retrieves the latest code from the repository.
  2. **Set up AWS credentials**: Configures AWS credentials to authenticate with AWS services.
  3. **Sync files to S3**: Uploads the files (e.g., `index.html`) to the specified S3 bucket.

# Terraform Configuration for AWS S3 Bucket and Static Website Hosting

This Terraform configuration file will:

1. Create an S3 bucket named `my-resume-bucket-davida`
2. Enable versioning on the bucket
3. Configure the bucket for static website hosting

## Terraform Configuration

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1" 
}

# Create S3 Bucket
resource "aws_s3_bucket" "myresumebucketdavida" {
  bucket = "my-resume-bucket-davida"
}

# Enable Versioning on the S3 Bucket
resource "aws_s3_bucket_versioning" "resumebucketversioning" {
  bucket = aws_s3_bucket.myresumebucketdavida.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable Static Website Hosting on the S3 Bucket
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.myresumebucketdavida.id

  index_document {
    suffix = "index.html"
  }
}
