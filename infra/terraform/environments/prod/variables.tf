variable "project_name" {
  type    = string
  default = "capstone-phoenix"
}

variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "my_ip_cidr" {
  type        = string
  description = "Your public IP in CIDR form, e.g. 82.14.9.5/32"
}

variable "key_name" {
  type        = string
  description = "Name of an existing AWS EC2 key pair"
}
