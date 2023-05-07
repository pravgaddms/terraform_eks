variable "sg_ids" {
  type = string
}
variable "subnet_ids" {
  type = list(any)
}
variable "vpc_id" {
  type = string
}
variable "instance_type" {
  default = "t2.medium"
}
variable "key_name" {
  default = "prav"
}
variable "capacity_type" {
  default = "SPOT"
}
variable "group_name" {
  default = "dev"
}