#Creating VPC/SecurityGroup/ EC2 / EIP

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_security_group" "mysg" {
  name        = "allow-access"
  description = "Allow SSH inbound and outbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "mysg"
  }
}

resource "aws_instance" "myec2" {
  ami                    = "ami-0453ec754f44f9a4a"
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
}
resource "aws_eip" "eip" {
  instance = aws_instance.myec2.id
}

/*resource "local_file" "description" {
  filename = "vpc-securitygroup-ec2-eip-localfile.txt"
  content = "Creating VPC,SG,EC2,EIP and localfile"
}
*/
