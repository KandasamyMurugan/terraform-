resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.git-vpc.id

  tags = {
    Name = "main"
  }
}