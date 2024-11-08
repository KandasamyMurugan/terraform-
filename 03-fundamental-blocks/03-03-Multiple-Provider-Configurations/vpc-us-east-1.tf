resource "aws_vpc" "vpc-us-east1" {
  cidr_block = "10.0.0.0/16"
  provider = "aws.east1"
  tags = {
    Name = "US-EAST1"
     }
}

resource "aws_vpc" "vpc-us-west1" {
  cidr_block = "20.0.0.0/16"
  provider = "aws.west-1"
  tags = {
    Name = "US-WEST1"
  }
}