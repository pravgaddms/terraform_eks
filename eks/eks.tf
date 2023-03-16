resource "aws_eks_cluster" "eks" {
  name     = "dev"
  role_arn = aws_iam_role.eks_master.arn
  version  = "1.25"

  vpc_config {
    subnet_ids = [var.subnet_ids[0], var.subnet_ids[1]]
  }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
  ]
}
