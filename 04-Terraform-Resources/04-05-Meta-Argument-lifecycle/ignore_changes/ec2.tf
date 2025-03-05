resource "aws_instance" "myec2" {
  ami               = "ami-0453ec754f44f9a4a"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1b"
  tags = {
    Name = "preprod"
  }
 lifecycle {
   ignore_changes = [
   tags,
   ]
 }
}