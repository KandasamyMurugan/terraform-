resource "aws_route_table_association" "git-RTA" {
  subnet_id      = aws_subnet.git-subnet.id
  route_table_id = aws_route_table.git-RT.id
}