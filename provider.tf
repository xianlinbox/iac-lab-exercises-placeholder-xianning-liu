terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.region
  default_tags {
    tags = {
      ManagedBy   = "Terraform"
      Environment = "Dev"
      Project     = var.prefix
    }
  }
}
