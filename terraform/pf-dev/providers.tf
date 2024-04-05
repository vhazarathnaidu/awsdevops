terraform {

  /* 
  backend "s3" {
    bucket = "oportun-tfstate"
    key    = "pf/dev/terraform.tfstate"
    region = "us-east-1"
  }
  */

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

  