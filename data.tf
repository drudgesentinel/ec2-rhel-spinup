# tested ami owner in us-west-2 to verify correct ownership account
# aws ec2 describe-images --image-ids ami-0f7197c592205b389 | rg -i owner
#            "OwnerId": "309956199498",
#            "ImageOwnerAlias": "amazon",

data "aws_ami" "redhat-linux-7" {
  most_recent = true
  owners      = ["309956199498"]
  filter {
    name   = "name"
    values = ["RHEL-7.*"]
  }
}

data "aws_ami" "redhat-linux-8" {
  most_recent = true
  owners      = ["309956199498"]
  filter {
    name   = "name"
    values = ["RHEL-8.*"]
  }
}

data "aws_ami" "redhat-linux-9" {
  most_recent = true
  owners      = ["309956199498"]
  filter {
    name   = "name"
    values = ["RHEL-9.*"]
  }
}
