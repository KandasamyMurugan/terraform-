  #!/bin/bash
  sudo apt update -y
  sudo apt install nginx -y
  sudo apt install git -y
  sudo rm -rf /var/www/html/index.nginx-debian.html
  echo "<h1>Hello from ${environment} environment</h1>" > /var/www/html/index.html
  sudo systemctl start nginx
  sudo systemctl enable nginx
  echo "Setup completed for ${environment} environment"



