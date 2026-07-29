variable "vpc_cidr" {

  description = "VPC CIDR Block"

  type = string

}

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

variable "public_subnet_1_az" {
  type = string
}

variable "public_subnet_2_az" {
  type = string
}

variable "private_subnet_1_cidr" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}

variable "private_subnet_1_az" {
  type = string
}

variable "private_subnet_2_az" {
  type = string
}