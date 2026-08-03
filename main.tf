module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "10.0.0.0/16"

  public_subnet_1_cidr = "10.0.1.0/24"
  public_subnet_2_cidr = "10.0.2.0/24"

  private_subnet_1_cidr = "10.0.3.0/24"
  private_subnet_2_cidr = "10.0.4.0/24"

  public_subnet_1_az = "ap-south-1a"
  public_subnet_2_az = "ap-south-1b"

  private_subnet_1_az = "ap-south-1a"
  private_subnet_2_az = "ap-south-1b"
}

module "security_group" {

  source = "./modules/security-group"


  vpc_id = module.vpc.vpc_id


  environment = var.environment

}

module "iam" {
  source = "./modules/iam"

  environment = var.environment
}

module "ec2" {
  source = "./modules/ec2"

  ami_id        = "ami-00d2dbb426772b03a"
  instance_type = "t3.micro"
  key_name      = "terraform-key"

  ec2_security_group_id = module.security_group.ec2_security_group_id
  instance_profile_name = module.iam.instance_profile_name

  private_subnet_ids = [
    module.vpc.private_subnet_1_id,
    module.vpc.private_subnet_2_id
  ]
  target_group_arn = module.alb.target_group_arn
}

module "alb" {

  source = "./modules/alb"

  environment = var.environment

  vpc_id = module.vpc.vpc_id

  public_subnet_ids = [
    module.vpc.public_subnet_1_id,
    module.vpc.public_subnet_2_id
  ]

  alb_security_group_id = module.security_group.alb_security_group_id

}