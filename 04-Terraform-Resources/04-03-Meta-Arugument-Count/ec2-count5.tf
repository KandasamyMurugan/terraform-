#Create EC2 Instance

resource "aws_instance" "my-web" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  count         = 5 # WE are specified only count = 5 then based on tag it will create 5 Instances ex: instance name in the name of web
  tags = {
    Name = "web-${count.index}"

  }
}