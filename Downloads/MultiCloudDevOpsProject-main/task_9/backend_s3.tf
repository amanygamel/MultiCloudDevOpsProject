provider "aws" {
  region = "your-preferred-region"
}

terraform {
  backend "s3" {
    bucket         = "your-unique-bucket-name"
    key            = "terraform.tfstate"
    region         = "your-preferred-region"
    encrypt        = true
    dynamodb_table = "terraform_locks"
  }
}

# Add other resources as needed

