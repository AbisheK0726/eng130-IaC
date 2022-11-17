# Download Dependencies from AWS

provider "aws"{
  region = "eu-west-1"
}

# Create a VPC
resource "aws_vpc" "eng130_aneese_my_vpc_terraform" {
  cidr_block = "10.0.0.0/16" 
  instance_tenancy = "default"

  tags = {
    Name = "eng130_aneese_my_vpc_terraform"
  }
}

# Create a Subnet
resource "aws_subnet" "eng130_aneese_terraform_subnet"{
  vpc_id = aws_vpc.eng130_aneese_my_vpc_terraform.id # This is the ID of the VPC
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = "true" # This is to allow the subnet to be public
  
  tags = {
    Name = "eng130_aneese_subnet"
  }
  
}

# Create a Security Group

resource "aws_security_group" "eng130_aneese_terraform_sg"{
  name = "eng130_aneese_sg"
  description = "eng130_aneese_sg"
  vpc_id = aws_vpc.eng130_aneese_my_vpc_terraform.id

# Inbound Rules
  # SSH from anywhere
  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # HTTP from anywhere
  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP from anywhere in port 3000
  ingress{
    description = "Custom Port"
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rules
  # Allow all outbound traffic
  egress{
    description = "All Outbound Traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eng130_aneese_terraform_app_sg"
  }
}

# Create Internet Gateway

resource "aws_internet_gateway" "eng130_aneese_terraform_igw"{
  vpc_id = aws_vpc.eng130_aneese_my_vpc_terraform.id

  tags = {
    Name = "eng130_aneese_terraform_igw"
  }
}

# Create Route Table

resource "aws_route_table" "eng130_aneese_terraform_rt"{
  vpc_id = aws_vpc.eng130_aneese_my_vpc_terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eng130_aneese_terraform_igw.id
  }

  tags = {
    Name = "eng130_aneese_route_table"
  }
}

# Create Route Table Association

resource "aws_route_table_association" "eng130_aneese_terraform_rt_association"{
  subnet_id = aws_subnet.eng130_aneese_terraform_subnet.id
  route_table_id = aws_route_table.eng130_aneese_terraform_rt.id
}

# Create an EC2 Instance

resource "aws_instance" "app_instance" {
  
  ami = var.webapp_ami_id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.eng130_aneese_terraform_subnet.id
  vpc_security_group_ids = [aws_security_group.eng130_aneese_terraform_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "eng130-aneese-terraform-app"
  }
  key_name = var.aws_key_name
}