#!/bin/bash

sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

if [ $? -eq 0 ]; then
    echo "Nginx has been installed and started successfully."
else
    echo "Failed to install or start Nginx. Please check the logs for more details."
    exit 1
fi



rm -r /var/www/html/index.nginx-debian.html 

git clone https://github.com/devopsinsiders/di-groq-chat-ui.git

if [ $? -eq 0 ]; then
    echo "Repository has been cloned successfully."
else
    echo "Failed to clone the repository. Please check the logs for more details."
    exit 1
fi


cd /di-groq-chat-ui

cp -r * /var/www/html

if [ $? -eq 0 ]; then
    echo "Files have been copied to the Nginx root directory successfully."
else
    echo "Failed to copy files to the Nginx root directory. Please check the logs for more details."
    exit 1
fi

if [ -f /var/www/html/index.html ]; then
    echo "The website has been deployed successfully. You can access it at http://localhost"
else
    echo "Failed to deploy the website. Please check the logs for more details."
    exit 1
fi

