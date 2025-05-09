variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "30.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["30.0.1.0/24", "30.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
  default     = ["30.0.3.0/24", "30.0.4.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "web_ami_id" {
  description = "AMI ID to use for the web servers"
  type        = string
  default     = "ami-084568db4383264d4"
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "environment" {}