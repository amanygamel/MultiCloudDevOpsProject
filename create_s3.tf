provider "aws" {
  region = "your-preferred-region"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "your-unique-bucket-name"
  acl    = "private"

  versioning {
    enabled = true
  }
}

