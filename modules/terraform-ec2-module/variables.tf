variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs"
  type        = list(string)
}

variable "key_name" {
  description = "Key pair name"
  type        = string
  default     = ""
}

variable "user_data" {
  description = "Cloud-init script"
  type        = string
  default     = ""
}

variable "root_volume_size" {
  description = "Root volume size GB"
  type        = number
  default     = 80
}

variable "data_volume_size" {
  description = "Data volume size GB"
  type        = number
  default     = 200
}

variable "availability_zone" {
  description = "AZ for data volume"
  type        = string
}

variable "iam_role_name" {
  description = "IAM role name"
  type        = string
}

variable "extra_policy_arns" {
  description = "Additional IAM policy ARNs to attach"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default     = {}
}
