provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "stage"
      Project     = "multi-env-infrastructure"
      ManagedBy   = "terraform"
    }
  }
}

module "networking" {
  source = "C:/Users/kanmur/OneDrive - ASSA ABLOY Group/My Documents/new profile/Documents/modules-multil-env/networking"

  environment          = "stage"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  enable_nat_gateway   = false // Save costs in dev by not using NAT


  common_tags = {
    Environment = "stage"
    Project     = "multi-env-infrastructure"
  }
}

module "web_server" {
  source = "C:/Users/kanmur/OneDrive - ASSA ABLOY Group/My Documents/new profile/Documents/modules-multil-env/web_server"

  environment           = var.environment
  vpc_id                = module.networking.vpc_id
  subnet_ids            = module.networking.public_subnet_ids // In dev, we put web servers in public subnets
  ami_id                = var.web_ami_id
  instance_type         = "t2.micro" // Smaller instances for dev
  asg_desired_capacity  = 1
  asg_min_size          = 1
  asg_max_size          = 2
  create_https_listener = false // No HTTPS in dev to save on certificate costs

  ssh_private_key = var.key_name

  common_tags = {
    Environment = "stage"
    Project     = "multi-env-infrastructure"
  }
}

module "database" {
  source = "C:/Users/kanmur/OneDrive - ASSA ABLOY Group/My Documents/new profile/Documents/modules-multil-env/database"

  environment                = "stage"
  vpc_id                     = module.networking.vpc_id
  subnet_ids                 = module.networking.private_subnet_ids
  allowed_security_group_ids = [module.web_server.web_sg_id]
  db_instance_class          = "db.t3.small" // Smaller DB for dev
  allocated_storage          = 20
  max_allocated_storage      = 30
  db_password                = var.db_password
  backup_retention_period    = 1 // Minimal backup retention for dev

  common_tags = {
    Environment = "stage"
    Project     = "multi-env-infrastructure"
  }
}