#!/bin/bash
sudo apt-get update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && EC2AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
echo '<center><h1>This EC2 is in the zone: AZID </h1></center>'  | sudo tee /var/www/html/index.txt
sed "s/AZID/$EC2AZ/" /var/www/html/index.txt  | sudo tee /var/www/html/index.html