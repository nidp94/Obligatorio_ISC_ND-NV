provider "aws" {
  region     = var.region
  access_key = var.access
  secret_key = var.secret
  token      = var.token
}

provider "kubectl" {
  host = data.aws_eks_cluster.obligatorio-eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.obligatorio-eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.obligatorio-eks.token
  load_config_file       = false
}