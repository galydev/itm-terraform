resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance_web" {
  count         = var.ec2_instance_web_quantity
  ami           = var.ec2_instance_web_ami
  instance_type = var.ec2_instance_web_type
  subnet_id     = var.ec2_instance_web_subnet_id
  key_name      = var.ec2_keypair
  user_data     = var.ec2_instance_web_user_data
  tags = {
    Name = "${var.ec2_intance_web_name}-${count.index + 1}"
  }
  vpc_security_group_ids = [aws_security_group.web_sg.id]
}

