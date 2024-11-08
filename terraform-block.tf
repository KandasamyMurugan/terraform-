#Terraform Block
terraform {
  required_version = "~> 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
}

# Provider Block
provider "aws" {
  region = "us-east-1"
  profile = "default" # defining it is optional for default profile
}

# Terraform Block
/*terraform {
  required_version = ">= 1.4.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

/*
Play with Terraform Version
  required_version = "~> 0.14.3"
  required_version = "= 0.14.4"
  required_version = ">= 0.13"
  required_version = "= 0.13"
  required_version = "~> 0.13"


Play with Provider Version
      version = "~> 3.0"
      version = ">= 3.0.0, < 3.1.0"
      version = ">= 3.0.0, <= 3.1.0"
      version = "~> 2.0"
      version = "~> 3.0"
*/

