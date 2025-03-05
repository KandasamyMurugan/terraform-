resource "aws_key_pair" "mysamplekey" {
  key_name   = "sample-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC787T5erxiHyq4XvF/Rd25PXfiK/8K8vd36QgOjfY/mfbii6sVkqBvSHCI4re+o4m79JCnnqifHiYvOpLpotLnx8FWBgS4jo5rJ6grgMCmOsgcTVrbfh3XdH2OhAAQCl2OBPRpMmdrUYCRU3LG1O/pJCSpnfBrUPlIcOQReAvfBVcC0immEpwvkNIXV0gE9miLYAtoSww8bHQVgvqa7Pzf1QsT688T9KhciudcufXr65WLIZGW07XZKLlB6Lii2L7hlCk7G5JTXNmsUmT8hc/tDbx9LeSg4phSo/SfDIntqRZyiGFXEq0QG54WPYTD9pDXbmSxMeZH6lyJO94GuLBO5Ceq3giZFIVfSU7agK7IKOJvtySmdw5kIHcORPp+h7UalK3f1KNCreSmrZt+5bMS2PkNt5j5UmVDORk3I76kteVvAdNjlapeVJjqe6O4rEuKW1sqnWULM5bobshmuPbGo1SENFVrHssg++r4u72kv00aK5rDUZVYVPUIq/9mKXk= AD+kanmur@INCHEL-HVSK924"
}

resource "aws_instance" "my-ec2" {
  ami           = "ami-047a51fa27710816e"
  instance_type = "t2.micro"
  key_name      = "sample-key"
  #availability_zone = "us-east-1a"
  availability_zone = "us-east-1b"
  tags = {
    "Name"    = "web"
    "Project" = "Dev"
  }
}

resource "aws_instance" "my-ec2-1" {
  ami           = "ami-047a51fa27710816e"
  instance_type = "t2.micro"
  key_name      = "sample-key"
  #availability_zone = "us-east-1a"
  availability_zone = "us-east-1b"
  tags = {
    "Name"    = "web"
    "Project" = "Dev"
  }
}

resource "local_file" "test" {
  filename = "test.txt"
  content  = "Welcome to Test"
}