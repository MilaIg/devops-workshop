provider "aws" {
  region = "us-east-1"
}

resource "aws_subnet" "demo" {
  cidr_block = "172.31.1.0/24" # Adjust the CIDR block as necessary within your VPC range
  vpc_id     = "vpc-d7fd8caa"  # Replace with your VPC ID
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH access"

  # Security group configurations...
}

resource "aws_instance" "demo-server" {
  ami             = "ami-0230bd60aa48260c6"
  instance_type   = "t2.micro"
  key_name        = "dpp"
  security_groups = [aws_security_group.demo-sg.id]
  subnet_id       = aws_subnet.demo.id
  # Other instance configurations...
}
