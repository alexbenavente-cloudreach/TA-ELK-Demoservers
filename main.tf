# DATA SOURCE FOR AMI
data "aws_ami" "ubuntu" {
  owners      = [var.aws_owner_id]
  most_recent = true
  filter {
    name   = "name"
    values = [var.aws_ami_name]
    # we are using the * to be able to always get the most recent image form AMI 
  }
}


# DATA SOURCE FOR VPC
data "aws_vpc" "main_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}


# DATA SOURCE FOR DEMO SERVER SUBNET
data "aws_subnet" "private" {
  filter {
    name   = "tag:Name"
    values = [var.log_subnet_name]
  }
}

# DATA SOURCE FOR DEMO SERVERS SECURITY GROUP
# data "aws_security_group" "demo_servers_sg" {
#   filter {
#     name   = "tag:Name"
#     values = [var.demo_servers_sg]
#   }
# }