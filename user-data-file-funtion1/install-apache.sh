#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
sudo chmod 777 /var/www/html
echo "<h1> Welcome to Devops year 2025</h1>" | sudo tee /var/www/html/index.html