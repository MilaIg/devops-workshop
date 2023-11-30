provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "demo" {
  cidr_block = "172.31.0.0/16"
  # You can add other VPC configurations here if needed
}

resource "aws_subnet" "demo" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "172.31.0.0/24" # This subnet's CIDR block within the VPC range

  # You can include other subnet configurations here if needed
}

resource "aws_instance" "demo-server" {
  ami           = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
  key_name      = "dpp"
  subnet_id     = aws_subnet.demo.id # Associates the instance with the created subnet

  associate_public_ip_address = true # Assigns a public IP to the instance

  # Other instance configurations...
}
