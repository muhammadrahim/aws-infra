provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-of-mind"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }
}

terraform {
  backend "s3" {
    bucket  = "terraform-state-of-mind"
    key     = "global/s3/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

