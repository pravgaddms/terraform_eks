module "sg" {
  source = "./sg_eks"
  vpc_id = aws_vpc.eks_vpc.id
}

module "eks" {
  source     = "./eks"
  sg_ids     = module.sg.security_group_public
  vpc_id     = aws_vpc.eks_vpc.id
  subnet_ids = [aws_subnet.eks_subnet_1.id, aws_subnet.eks_subnet_2.id]
  }
