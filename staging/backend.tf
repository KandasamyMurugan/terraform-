terraform {
  backend "s3" {
    bucket         = "staging1.kandasamy.in"
    key            = "multi-env/stage/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "stage.tfstate"
    encrypt        = true
  }
}