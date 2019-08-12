#!/bin/bash
yum install httpd -y
echo "Subet for firewall: ${firewall_subnets}" >> /var/www/html/index.html
service httpd start
chkconfig httpd on