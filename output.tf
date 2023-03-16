output "public_ip_eks_connect" {
  value = aws_instance.eks_connect.public_ip
}

output "private_ip_eks_connect" {
  value = aws_instance.eks_connect.private_ip
}