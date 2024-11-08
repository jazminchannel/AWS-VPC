# VPC module configuration
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"  # Ensure you use a stable version of the module

  name                 = "my-vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = ["us-east-1a", "us-east-1b"]  # Availability zones
  enable_nat_gateway   = true

  # Subnet configurations
  public_subnets       = ["10.0.1.0/24", "10.0.2.0/24"]               # Public subnet
  private_subnets      = ["10.0.3.0/24", "10.0.4.0/24"]  # Private subnets

  # NAT Gateway configuration
  single_nat_gateway = true  # Single NAT gateway for cost efficiency

  tags = {
    "Environment" = "dev"
    "Name"        = "my-vpc"
  }
}