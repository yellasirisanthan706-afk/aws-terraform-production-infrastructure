##############################################
# IAM Role for EC2
##############################################

resource "aws_iam_role" "ec2_role" {

  name = "prod-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "prod-ec2-role"
  }

}

##############################################
# Custom S3 Read Policy
##############################################

resource "aws_iam_policy" "s3_read_policy" {

  name        = "prod-s3-read-policy"
  description = "Allow EC2 instances to read objects from S3"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "AllowReadFromS3"
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]

        Resource = "*"
      }
    ]
  })

}

##############################################
# Attach Custom S3 Policy
##############################################

resource "aws_iam_role_policy_attachment" "custom_s3_read" {

  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_read_policy.arn

}

##############################################
# Attach CloudWatch Policy
##############################################

resource "aws_iam_role_policy_attachment" "cloudwatch" {

  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"

}

##############################################
# Attach Systems Manager (SSM) Policy
##############################################

resource "aws_iam_role_policy_attachment" "ssm" {

  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

}

##############################################
# IAM Instance Profile
##############################################

resource "aws_iam_instance_profile" "ec2_profile" {

  name = "prod-ec2-profile"
  role = aws_iam_role.ec2_role.name

}