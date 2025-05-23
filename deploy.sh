#!/bin/bash

# Simple deployment script for EC2 (Amazon Linux 2)
# This will install dependencies, configure nginx, and serve your portfolio

# Update system packages
sudo yum update -y

# Install nginx
sudo amazon-linux-extras install nginx1 -y
sudo systemctl start nginx
sudo systemctl enable nginx

# Copy portfolio files to nginx directory
sudo rm -rf /usr/share/nginx/html/*
sudo cp -r ./* /usr/share/nginx/html/

# Set proper permissions
sudo chown -R nginx:nginx /usr/share/nginx/html
sudo chmod -R 755 /usr/share/nginx/html

# Restart nginx to apply changes
sudo systemctl restart nginx

echo "Deployment complete! Your portfolio should be accessible at http://YOUR_EC2_PUBLIC_IP"
