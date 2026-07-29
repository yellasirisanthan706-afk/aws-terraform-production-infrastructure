variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "ec2_security_group_id" {
  type = string
}

variable "instance_profile_name" {
  type = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the Auto Scaling Group"
  type        = list(string)
}