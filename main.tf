terraform {
  backend "s3" {
  }
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
  count         = var.os == "rhel" ? var.number_of_instances : 0
  ami           = data.aws_ami.redhat-linux.id
  instance_type = var.instance_type
  key_name      = var.keypair_name
  user_data = templatefile("rhel_rpm_bootstrap.sh", {
    rhel_version = var.rhel_version
  })
  tags = {
    created_by = data.aws_caller_identity.current.arn
    ticket_num = var.ticket_num
    Name       = "rhel-repro-${count.index + 1}"
  }
  # rare mitchell L: https://github.com/hashicorp/packer/issues/1551#issuecomment-59131451
  connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file(var.keypair_path)
      host = aws_instance.rhel_instance[0].public_ip
    }

  provisioner "file" {
    source = var.gremlin_config_path
    destination = "/home/ec2-user/config.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chown root /home/ec2-user/config.yaml",
      "sudo mkdir /etc/gremlin",
      "sudo cp /home/ec2-user/config.yaml /etc/gremlin"
    ]
  }
}

resource "aws_instance" "suse_instance" {
  count         = var.os == "suse" ? var.number_of_instances : 0
  ami           = data.aws_ami.suse-linux.id
  instance_type = var.instance_type
  key_name      = var.keypair_name
  user_data = templatefile("suse_rpm_bootstrap.sh", {
    suse_version = var.suse_version
  })
  tags = {
    created_by = data.aws_caller_identity.current.arn
    ticket_num = var.ticket_num
    Name       = "suse-repro-${count.index + 1}"
  }
}