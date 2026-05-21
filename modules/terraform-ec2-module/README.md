# module: terraform-ec2-module

Reusable AWS EC2 module with IAM role, SSM, ECR, CloudWatch, and attached EBS data volume

## Usage

```hcl
module "terraform-ec2-module" {
  source = "git::https://github.com/grsuresh4u/terraform-ec2-module.git//modules/terraform-ec2-module?ref=main"
}
```
