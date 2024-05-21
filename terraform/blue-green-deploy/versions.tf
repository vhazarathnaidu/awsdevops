terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 3.20.0"
    }
  }
  required_version = "~> 0.14"

  backend "s3" {
    bucket = "oportun-tfstate"
    key    = "pf/dev/blue-green-deploy/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-2"
}