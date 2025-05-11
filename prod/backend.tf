terraform {
  backend "s3" {
    bucket         = "prod.kandasamy.in"
    key            = "multi-env/prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "prod.tfstate"
    encrypt        = true
  }
}