provider "aws" {
  region = var.aws_region
}

provider "aws" {
  alias  = "dr"
  region = "ap-southeast-1"
}