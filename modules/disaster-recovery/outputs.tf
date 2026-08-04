##############################################
# Disaster Recovery Outputs
##############################################

output "backup_bucket_name" {
  description = "DR backup bucket name"
  value       = aws_s3_bucket.dr_backup.bucket
}

output "backup_bucket_arn" {
  description = "DR backup bucket ARN"
  value       = aws_s3_bucket.dr_backup.arn
}