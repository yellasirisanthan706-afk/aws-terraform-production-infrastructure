variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
}

variable "ec2_security_group_id" {
  description = "EC2 Security Group ID"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM Instance Profile Name"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of Private Subnet IDs"
  type        = list(string)
}