terraform {

  backend "s3" {
    bucket = "oportun-tfstate"
    key    = "pf/dev/terraform.tfstate"
    region = "us-east-1"
  }
}