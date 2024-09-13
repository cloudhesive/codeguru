provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "secure_ec2" {
  ami                         = "ami-0c55b159cbfafe1f0"
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  key_name                    = "key-pair"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  root_block_device {
    volume_size = 20
    volume_type = "sc1"
  }

  ebs_block_device {
    device_name = "/dev/sdf"
    volume_size = 50
    volume_type = "sc1"
  }

  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = 100
    volume_type = "sc1"
  }

  tags = {
    Name = "Web production server"
  }
}

resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}