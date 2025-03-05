#Creating EC2 and assigning the IAM Role with has complete S3 access.
resource "aws_iam_role" "s3access" {
  name = "test_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "s3-terraform-fullaccess"
  }
}

resource "aws_iam_role_policy_attachment" "demo-attach" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.s3access.name
}

resource "aws_iam_instance_profile" "s3_profile" {
  name = "s3_profile"
  role = aws_iam_role.s3access.name
}



resource "aws_instance" "iamec2" {
  ami           = "ami-047a51fa27710816e"
  instance_type = "t2.micro"
  key_name = "terraform-key"
  iam_instance_profile = aws_iam_instance_profile.s3_profile.name

    tags = {
    Name = "IAM-EC2"
  }
}



#!/bin/bash
# Update the package lists and install Nginx
apt update
apt install -y nginx
# Replace the default <h1> tag content with "Welcome to Homepage"
sudo sed -i 's/<h1>Welcome to nginx!<\/h1>/<h1>Welcome to Homepage<\/h1>/' /var/www/html/index.nginx-debian.html
# Add additional lines to the HTML file
echo '<br>' | sudo tee -a /var/www/html/index.nginx-debian.html
echo '<a href="https://www.kandasamy.in/movies/">Visit For Movies</a>' | sudo tee -a /var/www/html/index.nginx-debian.html
echo '<br>' | sudo tee -a /var/www/html/index.nginx-debian.html
echo '<a href="https://www.kandasamy.in/shows/">Visit For Shows</a>' | sudo tee -a /var/www/html/index.nginx-debian.html
# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx


# Home-Page
# For 1A and 2A Home page

#!/bin/bash
apt update
apt install -y httpd

# Replace the default <h1> tag content with "Welcome to Homepage"
sudo sed -i 's/<h1>Welcome to Movies !< \/h1>/<h1>Welcome to Homepage<\/h1>/' /var/www/html/index.html

sudo systemctl start nginx
sudo systemctl enable nginx

mkdir -p /var/www/html/movies/index.html
mkdir -p /var/www/html/shows/index.html