# Create EKS cluster
resource "aws_eks_cluster" "this" {
  count    = local.eks_count
  name     = var.cluster_name
  role_arn = aws_iam_role.eks-master-role[count.index].arn
  version  = var.k8s_version
  # checkov:skip=CKV_AWS_37 Can be passed via Variables
  enabled_cluster_log_types = var.enabled_cluster_log_types
  # checkov:skip=CKV_AWS_39 Can be passed via Variables
  # checkov:skip=CKV_AWS_58 This need to be added
  vpc_config {
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    public_access_cidrs     = var.public_access_cidrs
    security_group_ids      = length(var.cluster_security_group_ids) > 0 ? var.cluster_security_group_ids : aws_security_group.cluster.*.id
    subnet_ids              = var.subnet_ids
  }

  depends_on = [
    aws_iam_role.eks-master-role,
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSServicePolicy,
    aws_cloudwatch_log_group.this
  ]
  
  tags = var.tags

}
