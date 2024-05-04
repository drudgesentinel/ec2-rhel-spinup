terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }
  }

  required_version = "~> 1.6"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "rhel_instance" {
  ami           = data.aws_ami.redhat-linux.id
  instance_type = var.instance_type
  key_name      = var.keypair_name
  user_data = templatefile("rpm_bootstrap.sh", {
    rhel_version = var.rhel_version
  })
  tags = {
    created_by = data.aws_caller_identity.current.arn
    ticket_num = var.ticket_num
  }
}