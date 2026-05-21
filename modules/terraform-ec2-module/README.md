# terraform-ec2-module

Reusable Terraform module for provisioning an AWS EC2 instance with an IAM role, instance profile, attached EBS data volume, and managed policy attachments for SSM, ECR, and CloudWatch.

## Usage

```hcl
module "ec2" {
  source = "github.com/grsuresh4u/terraform-ec2-module?ref=v1.0.0"

  ami_id             = "ami-0abcdef1234567890"
  instance_type      = "m6i.xlarge"
  subnet_id          = "subnet-0abc123"
  security_group_ids = ["sg-0abc123"]
  availability_zone  = "us-east-1a"
  iam_role_name      = "my-instance-role"
  root_volume_size   = 80
  data_volume_size   = 200

  tags = {
    Name        = "my-instance"
    Environment = "dev"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `ami_id` | AMI ID | `string` | - | yes |
| `instance_type` | EC2 instance type | `string` | - | yes |
| `subnet_id` | Subnet ID | `string` | - | yes |
| `security_group_ids` | Security group IDs | `list(string)` | - | yes |
| `availability_zone` | AZ for data volume | `string` | - | yes |
| `iam_role_name` | IAM role name | `string` | - | yes |
| `key_name` | Key pair name | `string` | `""` | no |
| `user_data` | Cloud-init script | `string` | `""` | no |
| `root_volume_size` | Root volume size in GB | `number` | `80` | no |
| `data_volume_size` | Data volume size in GB | `number` | `200` | no |
| `extra_policy_arns` | Additional IAM policy ARNs to attach | `list(string)` | `[]` | no |
| `tags` | Map of tags to apply | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| `instance_id` | ID of the EC2 instance |
| `instance_private_ip` | Private IP address of the EC2 instance |
| `iam_role_arn` | ARN of the IAM role |
| `iam_role_name` | Name of the IAM role |
| `data_volume_id` | ID of the attached EBS data volume |

## Managed Policies Attached

- `AmazonEC2ContainerRegistryReadOnly` — pull images from ECR
- `AmazonSSMManagedInstanceCore` — SSM Session Manager access
- `CloudWatchLogsFullAccess` — write logs to CloudWatch
- Any additional policies passed via `extra_policy_arns`
