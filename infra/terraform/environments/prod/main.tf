terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

module "network" {
  source       = "../../modules/network"
  project_name = var.project_name
}

module "security_group" {
  source       = "../../modules/security_group"
  project_name = var.project_name
  vpc_id       = module.network.vpc_id
  my_ip_cidr   = var.my_ip_cidr
}

module "compute" {
  source             = "../../modules/compute"
  project_name       = var.project_name
  subnet_id          = module.network.subnet_id
  security_group_id  = module.security_group.security_group_id
  ami_id             = data.aws_ami.ubuntu.id
  key_name           = var.key_name
}
