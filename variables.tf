variable "ticket_num" {
  type        = string
  description = "Optional Freshdesk ticket # associated with these resources"
}

variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "os" {
  type = string
  default = "rhel"
}

variable "rhel_version" {
  type        = string
  description = "The RHEL major version (7-9) to install."

  validation {
    condition     = var.rhel_version > 6 && var.rhel_version < 10
    error_message = "The RHEL versions should be between 7 and 9"
  }
}

variable "instance_type" {
  type    = string
  default = "t3a.medium"
}

variable "keypair_name" {
  type        = string
  description = "This is the name of the region-specific ec2 keypair for accessing your instance"
}