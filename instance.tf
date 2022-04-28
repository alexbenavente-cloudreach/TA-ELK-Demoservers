resource "aws_instance" "demo_servers" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  subnet_id              = data.aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.demo_servers_sg.id]
  key_name               = var.my_keypair
  #count                  = var.number_of_instances
  tags = {
    Name = "Demo_servers" #_${count.index + 1}"
  }
}


resource "aws_volume_attachment" "ebs_attch" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_demo_servers.id
  instance_id = aws_instance.demo_servers.id
}

resource "aws_ebs_volume" "ebs_demo_servers" {
  #  most_recent = true
  availability_zone = "us-east-1a"
  size              = 50

  tags = {
    Name = "DEMOSERVERS"
  }
}

