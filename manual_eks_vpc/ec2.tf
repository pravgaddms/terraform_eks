resource "aws_instance" "eks_connect" {
  ami                         = var.os_name
  key_name                    = var.key
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.eks_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "eks_connect"
  }
}