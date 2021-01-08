resource "aws_cloudwatch_log_group" "this" {
  
  count             = length(var.enabled_cluster_log_types) > 0 && var.create_eks ? 1 : 0
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = var.cluster_log_retention_in_days
  tags = var.tags

}
