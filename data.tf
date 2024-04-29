# tested ami owner in us-west-2 to verify correct ownership account
# aws ec2 describe-images --image-ids ami-0f7197c592205b389 | rg -i owner
#            "OwnerId": "309956199498",
#            "ImageOwnerAlias": "amazon",

data "aws_ami" "redhat-linux" {
  most_recent = true
  owners      = ["309956199498"]
  filter {
    name   = "name"
    values = ["RHEL-${var.rhel_version}.*"]
  }
}

# this is probably an apply time data source, which is not ideal
data "aws_caller_identity" "current" {}