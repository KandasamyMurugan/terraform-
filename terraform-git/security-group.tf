resource "aws_security_group" "git-sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.git-vpc.id

  ingress {
    from_port         = 0
    to_port           = 0
    protocol       = "-1"
    cidr_blocks = ["0.0.0.0/0"]
     }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "git-sg"
  }
}