provider "aws" {
  region = var.region
}

resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "eks_vpc"
  }
}
resource "aws_subnet" "eks_subnet_1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.subnet1_cidr
  availability_zone       = var.subnet_1_az
  map_public_ip_on_launch = true

  tags = {
    Name = "eks_subnet_1"
  }
}

resource "aws_subnet" "eks_subnet_2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.subnet2_cidr
  availability_zone       = var.subnet_2_az
  map_public_ip_on_launch = true

  tags = {
    Name = "eks_subnet_2"
  }
}

resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks_gw"
  }
}

resource "aws_route_table" "eks_rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }
  tags = {
    Name = "eks_rt"
  }
}

resource "aws_route_table_association" "subnet_1_route" {
  subnet_id      = aws_subnet.eks_subnet_1.id
  route_table_id = aws_route_table.eks_rt.id
}

resource "aws_route_table_association" "subnet_2_route" {
  subnet_id      = aws_subnet.eks_subnet_2.id
  route_table_id = aws_route_table.eks_rt.id
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.eks_vpc.id

  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "Allow-all"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}