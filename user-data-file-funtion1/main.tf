resource "aws_instance" "userdata" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  key_name      = "terraform-key"
  user_data     = file("install-apache.sh")
  tags = {
    Name = "Apache-Server"
  }
}