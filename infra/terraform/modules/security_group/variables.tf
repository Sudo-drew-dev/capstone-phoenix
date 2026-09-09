variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "my_ip_cidr" {
  type        = string
  description = "Your public IP in CIDR form, e.g. 82.14.9.5/32"
}
