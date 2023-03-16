variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.32.0.0/16"
}

variable "subnet1_cidr" {
  default = "10.32.1.0/24"
}

variable "subnet2_cidr" {
  default = "10.32.2.0/24"
}

variable "subnet_1_az" {
  default = "ap-south-1a"
}

variable "subnet_2_az" {
  default = "ap-south-1b"
}

variable "key" {
  default = "prav"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "os_name" {
  default = "ami-09ba48996007c8b50"
}