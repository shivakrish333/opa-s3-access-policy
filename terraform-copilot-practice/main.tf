# Create an S3 bucket with encryption and versioning enabled

provider "aws" {
  region = "us-west-2"
}   
resource "aws_s3_bucket" "example" {
  bucket = "my-unique-bucket-name-12345"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# Block all public access to the bucket

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}