# Terraform module for creating EKS Cluster

## Prerequisites

- Terraform 0.12.x
- aws cli

## Available features

- IAM Roles and permissions
- Security Groups for Control plane and Worker Nodes
- Cloud-watch Log Group for EKS logs

## Usage

```hcl
module "eks" {
  source                     = "git::https://github.com/foss-cafe/terraform-aws-eks-module.git"
  create_eks                 = true
  cluster_name               = "Example"
  k8s_version                = 1.16
  enabled_cluster_log_types  = ["api"]
  endpoint_private_access    = true
  endpoint_public_access     = true
  public_access_cidrs        = ["192.168.1.1/24"]
  vpc_id                     = "vpc-xxxx"
  cluster_security_group_ids = ["sg-xxxx", "sg-yyyy"]
  worker_security_group_ids  = ["sg-xxxx"]
  subnet_ids                 = ["subnet-xxxx", "subnet-yyyy", "subnet-zzzz"]
  additional_tags = {
    Environment = "dev"
  }
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tags | n/a | `map(string)` | <pre>{<br>  "createdby": "devops"<br>}</pre> | no |
| cluster\_log\_retention\_in\_days | Specifies the number of days you want to retain log events in the specified log group | `number` | `90` | no |
| cluster\_name | Name of the cluster | `string` | `"example-dev"` | no |
| cluster\_security\_group\_ids | List of security group IDs for the cross-account elastic network interfaces that Amazon EKS creates to use to allow communication between your worker nodes and the Kubernetes control plane. | `list` | `[]` | no |
| create\_eks | Do you want to create EKS | `bool` | `true` | no |
| enabled\_cluster\_log\_types | A list of the desired control plane logging to enable | `list` | <pre>[<br>  "api",<br>  "audit"<br>]</pre> | no |
| endpoint\_private\_access | Indicates whether or not the Amazon EKS private API server endpoint is enabled. Default is false. | `bool` | `false` | no |
| endpoint\_public\_access | Indicates whether or not the Amazon EKS public API server endpoint is enabled. Default is true. | `bool` | `true` | no |
| k8s\_version | Desired Kubernetes master version. | `string` | `"1.14"` | no |
| public\_access\_cidrs | List of CIDR blocks. Indicates which CIDR blocks can access the Amazon EKS public API server endpoint when enabled | `list` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| subnet\_ids | List of subnet IDs. Must be in at least two different availability zones. Amazon EKS creates cross-account elastic network interfaces in these subnets to allow communication between your worker nodes and the Kubernetes control plane. | `list` | `[]` | no |
| vpc\_id | The VPC associated with your cluster. | `string` | `null` | no |
| worker\_security\_group\_ids | Security Group ID for Allowing pods to communicate with the EKS cluster API. only needed if you are not passing 'security\_group\_ids' | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| eks\_arn | The Amazon Resource Name (ARN) of the cluster. |
| eks\_certificate\_authority | The base64 encoded certificate data required to communicate with your cluster. |
| eks\_clg\_arn | The Amazon Resource Name (ARN) specifying the log group |
| eks\_endpoint | The endpoint for your Kubernetes API server. |
| eks\_id | The name of the cluster |
| eks\_platform\_version | The platform version for the cluster |
| eks\_status | The status of the EKS cluster. One of CREATING, ACTIVE, DELETING, FAILED |
| eks\_version | The Kubernetes server version for the cluster. |
| eks\_vpc\_config | The cluster security group that was created by Amazon EKS for the cluster. |
| master\_role\_arn | The Amazon Resource Name (ARN) specifying the role |
| master\_role\_create\_date | The creation date of the IAM role |
| master\_role\_id | The name of the role |
| master\_role\_name | The name of the role |
| master\_role\_unique\_id | The stable and unique string identifying the role |
| master\_sg\_arn | The ARN of the security group |
| master\_sg\_egress\_rules | The egress rules |
| master\_sg\_id | The ID of the security group |
| master\_sg\_ingress\_rules | The ingress rules |
| nodes\_role\_arn | The Amazon Resource Name (ARN) specifying the role |
| nodes\_role\_create\_date | The creation date of the IAM role |
| nodes\_role\_id | The name of the role |
| nodes\_role\_name | The name of the role |
| nodes\_role\_unique\_id | The stable and unique string identifying the role |
| worker\_nodes\_sg\_arn | The ARN of the security group |
| worker\_nodes\_sg\_egress\_rules | The egress rules |
| worker\_nodes\_sg\_id | The ID of the security group |
| worker\_nodes\_sg\_ingress\_rules | The ingress rules |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


### To-DO
- [ ] Enable encryption_config