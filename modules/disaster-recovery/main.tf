##############################################
# Disaster Recovery S3 Bucket
##############################################

resource "aws_s3_bucket" "dr_backup" {

  bucket = var.backup_bucket_name

  tags = {
    Name        = "dr-backup-bucket"
    Environment = "dr"
  }

}