#Creating EC2

resource "aws_instance" "myec2" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  tags = {
    Name = "Dev"
  }
  lifecycle {
    prevent_destroy = true
  }
}