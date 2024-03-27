provider "aws" {
  region = "<AWS Region>"
}

resource "aws_vpc" "eks_vpc" {
  cidr_block = "<VPC CIDR Block>"
  tags = {
    Name = "<VPC Name>"
  }
}

resource "aws_subnet" "eks_subnet" {
  count = 3
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = ["<Subnet 1 CIDR Block>", "<Subnet 2 CIDR Block>", "<Subnet 3 CIDR Block>"][count.index]
  availability_zone = ["<Availability Zone 1>", "<Availability Zone 2>", "<Availability Zone 3>"][count.index]
  tags = {
    Name = "eks-subnet-${count.index + 1}"
  }
}

resource "aws_security_group" "eks_worker_sg" {
  name_prefix = "worker_security_group"
  vpc_id = aws_vpc.eks_vpc.id
}

resource "aws_eks_cluster" "eks_cluster" {
  name = "<EKS Cluster Name>"
  role_arn = "<IAM role ARN>"
  vpc_config {
    subnet_ids = [aws_subnet.eks_subnet.*.id]
  }
  depends_on = [aws_security_group_rule.eks_workers_in]
}

resource "aws_security_group_rule" "eks_workers_in" {
  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.eks_worker_sg.id
}

resource "aws_iam_role" "eks_worker_role" {
  name = "eks-worker-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_worker_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role = aws_iam_role.eks_worker_role.name
}

resource "aws_iam_instance_profile" "eks_worker_profile" {
  name = "eks-worker-profile"
  role = aws_iam_role.eks_worker_role.name
}

locals {
  eks_kubeconfig_filename = "kubeconfig-eks"
}

data "aws_eks_cluster_auth" "aws_eks_cluster" {
  name = aws_eks_cluster.eks_cluster.name
}

output "eks_kubeconfig" {
  value = data.aws_eks_cluster_auth.aws_eks_cluster.kubeconfig
  sensitive = true
  filename = local.eks_kubeconfig_filename
}