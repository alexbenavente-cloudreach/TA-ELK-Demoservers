resource "aws_security_group" "demo_servers_sg" {
  vpc_id = data.aws_vpc.main_vpc.id

  #INBOUND CONNECTIONS 
  ingress {
    description = "Allows SSH connection from the Bastion Host"
    #security_groups = ["sg-037583cd48f4cd97d"]
    cidr_blocks = ["192.168.0.0/16"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  #OUTBOUND CONNECTIONS 
  egress {
    description = "Allows outbound connection"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  tags = {
    Name = "demo_servers_sg"
  }
}
