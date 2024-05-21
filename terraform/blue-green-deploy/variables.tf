variable "vpc_cidr" {
  type    = string
  default = "10.100.0.0/16"
}

variable "subnets_cidrs" {
  type    = list(string)
  default = ["10.100.0.0/24", "10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]

}

variable "enable_blue_env" {
  description = "Enable blue environment"
  type        = bool
  default     = true
}

variable "blue_instance_count" {
  description = "Number of instances in blue environment"
  type        = number
  default     = 2
}

variable "enable_green_env" {
  description = "Enable green environment"
  type        = bool
  default     = false
}

variable "green_instance_count" {
  description = "Number of instances in green environment"
  type        = number
  default     = 2
}

variable "traffic_distribution" {
  description = "Levels of traffic distribution"
  type        = string
}