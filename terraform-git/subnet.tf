resource "aws_subnet" "git-subnet" {
  vpc_id     = aws_vpc.git-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "git-subnet"
  }
}