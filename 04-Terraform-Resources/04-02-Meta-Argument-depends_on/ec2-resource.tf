# Resource Creating EC2 instance and installing apache webserver

resource "aws_instance" "my-ec2-vm" {
  ami                    = "ami-0453ec754f44f9a4a"
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  subnet_id              = aws_subnet.vpc-dev-public-subnet.id
  vpc_security_group_ids = [aws_security_group.dev-vpc-sg.id]
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to KandaDevops2025!</h1>" > /var/www/html/index.html
EOF
  #user_data              = file("apache-install.sh")
  tags = {
    Name = "myec2vm"
  }
}