#!/bin/bash
sudo yum install update
sudo yum install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
echo "<h1> Welcome to Devops year 2025</h1>" | sudo tee /var/www/html/index.html