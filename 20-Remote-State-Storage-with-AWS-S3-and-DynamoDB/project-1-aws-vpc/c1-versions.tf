terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version =  "~> 5.60"
    }
  }
  backend "s3" {
    bucket = "terrafrom-backend-state-storage"
    key = "dev/project1-vpc/terraform.tfstate"
    region = "ap-south-1"

    dynamodb_table = "dev-project1-vpc"
    
  }
}
provider "aws" {
  region = var.aws_region
}