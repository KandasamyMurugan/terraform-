terraform {
  backend "s3" {
    bucket         = "kandasamy.in"
    key            = "multi-env/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev.tfstate"
    encrypt        = true
  }
}