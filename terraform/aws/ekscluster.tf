resource "aws_eks_cluster" "obligatorio-eks" {
  name     = "obligatorio-eks"
  role_arn = data.aws_iam_role.LabRole.arn
  vpc_config {
    subnet_ids = [aws_subnet.obligatorio-private-subnet1.id, aws_subnet.obligatorio-private-subnet2.id]
  }
  depends_on = [
    aws_vpc.vpc-obligatorio,
  ]
}

resource "aws_eks_node_group" "worker-node-group" {
  cluster_name    = aws_eks_cluster.obligatorio-eks.name
  node_group_name = "onlineboutique-workernodes"
  node_role_arn = data.aws_iam_role.LabRole.arn
  subnet_ids      = [aws_subnet.obligatorio-private-subnet1.id, aws_subnet.obligatorio-private-subnet2.id]
  instance_types  = ["t2.medium"]

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }

}