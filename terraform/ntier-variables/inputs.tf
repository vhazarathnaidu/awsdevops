variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.100.0.0/16"
}

variable "subnets_cidrs" {
  type    = list(string)
  default = ["10.100.0.0/24", "10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]

}

variable "test" {
  
}