variable "region" {
  default     = "us-east-1" 
}

variable "access_key" {
  type        = string
  default     = "AKIAXJPPPJTJMJFMDCFF"
}

variable "secret_key" {
  type        = string
  default     = "UC2Go/aSTNDIiS2xz7wg5yH/wJwpmh40wv8ZzD+y"
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

