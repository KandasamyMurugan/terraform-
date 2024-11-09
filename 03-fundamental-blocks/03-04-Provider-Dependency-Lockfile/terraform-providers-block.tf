terraform {
  required_version = ">= 1.4.1"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 2.0.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
}