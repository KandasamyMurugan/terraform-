#!/bin/bash

# Log execution for debugging
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
echo "Starting user data script execution at $(date)"

# Install required packages
echo "Installing packages..."
sudo apt update -y
sudo apt install nginx git curl -y

# Clone the repository
echo "Cloning repository..."
sudo git clone https://github.com/KandasamyMurugan/sample-page.git /tmp/SecOps-game

# Examine the original file content for debugging
echo "Original index.html content:"
cat /tmp/SecOps-game/index.html

# Remove default nginx page
sudo rm -rf /var/www/html/index.nginx-debian.html

# Copy the game's index.html
sudo cp /tmp/SecOps-game/index.html /var/www/html/index.html

# First, let's check if the file has the expected content
HEADER_EXISTS=$(grep -c "Welcome to Mastering DevSecOps" /var/www/html/index.html)
echo "Header exists check: $HEADER_EXISTS"

# Try different approaches to modify the header
if [ $HEADER_EXISTS -gt 0 ]; then
    echo "Found header, attempting to modify it..."
    # Method 1: Use sed with exact match
    sudo sed -i 's|<h1>Welcome to Mastering DevSecOps</h1>|<h1>Welcome to Mastering DevSecOps from ${environment} environment</h1>|g' /var/www/html/index.html

    # Method 2: Use sed with more flexible matching (in case there are spaces or other elements)
    sudo sed -i 's|Welcome to Mastering DevSecOps|Welcome to Mastering DevSecOps from ${environment} environment|g' /var/www/html/index.html
else
    echo "Header not found with exact match, attempting direct append..."
    # Method 3: Direct append our custom message after the body tag
    sudo sed -i '/<body>/a <h1>Welcome to Mastering DevSecOps from ${environment} environment</h1>' /var/www/html/index.html
fi

# Create a completely new index for testing if all else fails
echo "Creating a backup solution - custom index.html"
cat > /tmp/custom-index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <title>DevSecOps Game</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; line-height: 1.6; }
        h1 { color: #333; }
    </style>
</head>
<body>
    <h1>Welcome to Mastering DevSecOps from ${environment} environment</h1>
    <p>This is the customized version of the SecOps game.</p>
</body>
</html>
EOF

# If we still don't have our custom header, use the backup solution
if [ $(grep -c "Welcome to Mastering DevSecOps from ${environment} environment" /var/www/html/index.html) -eq 0 ]; then
    echo "Custom header not found in modified file, using backup solution"
    sudo cp /tmp/custom-index.html /var/www/html/index.html
fi

# Check the final content
echo "Final index.html content:"
cat /var/www/html/index.html

# Start and enable nginx
echo "Starting and enabling nginx..."
sudo systemctl start nginx
sudo systemctl enable nginx

echo "User data script completed at $(date)"