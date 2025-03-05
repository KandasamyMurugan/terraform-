#Resources Block
# Resource1: Creating VPC
resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-dev"
  }
}

# Resource2: Creating Subnets
resource "aws_subnet" "vpc-dev-public-subnet" {
  vpc_id                  = aws_vpc.vpc-dev.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

# Resource3 : Creating Internet Gateway
resource "aws_internet_gateway" "vpc-dev-igw" {
  vpc_id = aws_vpc.vpc-dev.id
}

#Resource 4 : Creating Public Route-table

resource "aws_route_table" "aws-dev-public-route-table" {
  vpc_id = aws_vpc.vpc-dev.id
}

# Resource 5 : Create Route in Routetable for Internet Access

resource "aws_route" "vpc-dev-public-route" {
  route_table_id         = aws_route_table.aws-dev-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-dev-igw.id
}

# Resource 6: Associate the route table with the subnet

resource "aws_route_table_association" "vpc-dev-public-route-table-associate" {
  route_table_id = aws_route_table.aws-dev-public-route-table.id
  subnet_id      = aws_subnet.vpc-dev-public-subnet.id
}

# Resource 7 : Creating Security Group and enabling following ports 22, 80

resource "aws_security_group" "dev-vpc-sg" {
  name        = "dev-vpc-default-sg"
  description = "Dev VPC Security group"
  vpc_id      = aws_vpc.vpc-dev.id

  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all IP and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }
}