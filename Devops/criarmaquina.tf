terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# Create a subnet
resource "aws_subnet" "example" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
}

# Create an internet gateway
resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
}

# Create a route table
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }
}

# Associate the route table with the subnet
resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.example.id
  route_table_id = aws_route_table.example.id
}

# Create a security group
resource "aws_security_group" "example" {
  vpc_id = aws_vpc.example.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Altere isso para permitir apenas IPs específicos, se necessário
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe01e" # Substitua pela AMI apropriada para o seu caso
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example.id
  security_groups = [aws_security_group.example.name]

  # User data to install Docker and run your containerized app
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              docker run -d -p 80:80 your_docker_image # Substitua pelo seu nome de imagem
              EOF
}

# Create a MySQL database on RDS
resource "aws_db_instance" "example" {
  identifier         = "mydb"
  engine             = "mysql"
  engine_version     = "8.0" # Use a versão desejada do MySQL
  instance_class     = "db.t2.micro"
  allocated_storage   = 20
  username           = "admin"
  password           = "yourpassword" # Altere isso
  db_name            = "mydatabase" # Nome do seu banco de dados
  vpc_security_group_ids = [aws_security_group.example.id]
  skip_final_snapshot = true
}

# Output the public IP of the EC2 instance
output "instance_ip" {
  value = aws_instance.example.public_ip
}

# Output the endpoint of the MySQL RDS instance
output "db_endpoint" {
  value = aws_db_instance.example.endpoint
}
