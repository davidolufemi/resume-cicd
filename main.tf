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

#create S3 bucket
resource "aws_s3_bucket" "resumebucket" {
  bucket = "resume-bucket-davida"
}


resource "aws_s3_bucket_versioning" "resumebucketversioning" {
  bucket = aws_s3_bucket.resumebucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable static website hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.resumebucket.id

  index_document {
    suffix = "index.html"
  }
}



