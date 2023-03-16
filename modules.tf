module "sg" {
  source = "./sg_eks"
  vpc_id = aws_vpc.eks_vpc.id
}

module "eks" {
  source = "./eks"
}