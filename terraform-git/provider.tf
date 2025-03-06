terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "state-locking-git-kandasamy"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
}