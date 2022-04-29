# Defining the variables 
variable "aws_owner_id" {
  description = "the account has the owner id of the AMI for Amazon linux"
  type        = string
}

variable "aws_ami_name" {
  description = "name of the ami wanted for the project"
  type        = string
}

variable "vpc_name" {
  description = "name of the vpc wanted for the project"
  type        = string
}

variable "log_subnet_name" {
  description = "name of the ELK subnet"
  type        = string
}


variable "my_keypair" {
  default = "elk_keypair"
}

variable "demo_servers_sg" {
  description = "name of the security group id for the Demo Servers"
  type        = string
}

variable "number_of_instances" {
  description = "Amount of instances for my subnets"
}