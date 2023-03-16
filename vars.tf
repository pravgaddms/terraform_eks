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

variable "subent_az" {
    default =  "ap-south-1a"  
}