data "aws_eks_cluster" "obligatorio-eks"  {
  name = "obligatorio-eks"
}
data "aws_eks_cluster_auth" "obligatorio-eks"  {
  name = "obligatorio-eks"
}
data "aws_eks_node_group" "worker-node-group"  {
  cluster_name = "obligatorio-eks"
  node_group_name = "onlineboutique-workernodes"
}