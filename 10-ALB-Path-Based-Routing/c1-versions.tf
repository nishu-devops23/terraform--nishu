terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version =  "~> 5.60"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "aws" {
  alias = "route53"  # Assign an alias for the Route 53 provider
  region = "ap-south-1"

  assume_role {
    role_arn = "arn:aws:iam::619773824020:role/cross-account-route53-role"
  }
}

  
  