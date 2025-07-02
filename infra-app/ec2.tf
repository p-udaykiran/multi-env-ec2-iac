# Create a key pair
resource "aws_key_pair" "infra_key" {
  key_name   = "${var.env}-infra-app-key"
  public_key = file("/home/uday/terraform/terraform_ec2/terrakey_ec2.pub")


  lifecycle {
    ignore_changes = [key_name]
  }
  tags = {
    Environment = var.env
  }
}

# Use default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Create a security group allowing SSH, HTTP, HTTPS
resource "aws_security_group" "infra_sg" {
  name        = "${var.env}-infra-app-sg"
  description = "Allow SSH, HTTP, and HTTPS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH traffic"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS traffic"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.env}-infra-sg"
  }
}

# Create EC2 instance(s)
resource "aws_instance" "infra_instance" {
  count = var.instance_count

  ami                    = var.ec2_ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.infra_key.key_name
  vpc_security_group_ids = [aws_security_group.infra_sg.id]

  depends_on = [
    aws_key_pair.infra_key,
    aws_security_group.infra_sg
  ]

  user_data = file("/home/uday/terraform/terraform_app-module/infra-app/nginx.sh")

  root_block_device {
    volume_size = var.env == "prod" ? 20 : 10
    volume_type = "gp2"
  }

  tags = {
    Name        = "${var.env}-infra-instance"
    Environment = var.env
  }
}
