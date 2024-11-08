terraform {
  required_version = ">= 1.4.1"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
  alias = "east1"
}

provider "aws" {
  region = "us-west-1"
  profile = "default"
  alias = "west-1"
}