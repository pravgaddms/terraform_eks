resource "aws_eks_node_group" "backend" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = var.group_name
  version         = aws_eks_cluster.eks.version
  node_role_arn   = aws_iam_role.eks_worker.arn
  subnet_ids      = [var.subnet_ids[0], var.subnet_ids[1]]
  capacity_type   = var.capacity_type
  disk_size       = "20"
  instance_types  = [var.instance_type]
  remote_access {
    ec2_ssh_key               = var.key_name
    source_security_group_ids = [var.sg_ids]
  }

  labels = tomap({ env = var.group_name })

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
  tags = {
    Name = "eks-instance"
  }
}