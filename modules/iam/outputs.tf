##############################################
# IAM Role Outputs
##############################################

output "iam_role_name" {
  description = "Name of the EC2 IAM Role"
  value       = aws_iam_role.ec2_role.name
}

output "iam_role_arn" {
  description = "ARN of the EC2 IAM Role"
  value       = aws_iam_role.ec2_role.arn
}

##############################################
# Instance Profile Outputs
##############################################

output "instance_profile_name" {
  description = "Name of the EC2 Instance Profile"
  value       = aws_iam_instance_profile.ec2_profile.name
}

output "instance_profile_arn" {
  description = "ARN of the EC2 Instance Profile"
  value       = aws_iam_instance_profile.ec2_profile.arn
}

##############################################
# Custom S3 Policy Output
##############################################

output "custom_s3_policy_arn" {
  description = "ARN of the Custom S3 Read Policy"
  value       = aws_iam_policy.s3_read_policy.arn
}