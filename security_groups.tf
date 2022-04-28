resource "aws_security_group" "demo_servers_sg" {
  vpc_id = data.aws_vpc.main_vpc.id

  #INBOUND CONNECTIONS 
  ingress {
    description     = "Allows SSH connection from the Bastion Host"
    #security_groups = ["sg-037583cd48f4cd97d"]
    cidr_blocks = ["192.168.0.0/16"]
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
  }
 
  #OUTBOUND CONNECTIONS 
  egress {
    description = "Allows connection to Logstash" #send info to Logstash
    cidr_blocks = ["192.168.0.0/16"]
    from_port   = 5044
    protocol    = "tcp"
    to_port     = 5044
  }
  tags = {
    Name = "demo_servers_sg"
  }
}
