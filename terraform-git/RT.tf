resource "aws_route_table" "git-RT" {
  vpc_id = aws_vpc.git-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "git-RT"
  }
}