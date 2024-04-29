terraform {
  required_providers {
    aws = {
      source  = "opentofu/aws"
      version = "~> 5"
    }
  }

  required_version = "~> 1.6"
}

variable "availability_zone" {
  type    = string
  default = "us-east-2"
}

variable "os" {
  type    = string
  default = "rhel7"
}

provider "aws" {
  region = var.availability_zone
}