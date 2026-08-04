##############################################
# Disaster Recovery Variables
##############################################

variable "backup_bucket_name" {
  description = "S3 bucket name for disaster recovery backups"
  type        = string
}