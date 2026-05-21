output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.this.private_ip
}

output "iam_role_arn" {
  description = "ARN of the IAM role"
  value       = aws_iam_role.this.arn
}

output "iam_role_name" {
  description = "Name of the IAM role"
  value       = aws_iam_role.this.name
}

output "data_volume_id" {
  description = "ID of the attached EBS data volume"
  value       = aws_ebs_volume.data.id
}
