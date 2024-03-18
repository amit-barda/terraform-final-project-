variable "region" {
  default     = "us-east-1" 
}

variable "access_key" {
  type        = string
  default     = "your_key"
}

variable "secret_key" {
  type        = string
  default     = "your_key"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}
variable "private_subnet_cidr_blocks" {
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr_blocks" {
  default = "10.0.2.0/24"
}

variable "availability_zone_a" {
  default     = "us-east-1a" 
}
variable "availability_zone_b" {
  default     = "us-east-1b" 
}
variable "s3name" {
  type        = string
  default     = "fromterraformforwebsiteprojcet2024"
}
