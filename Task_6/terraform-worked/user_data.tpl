#!/bin/bash

# install LAMP Server
yum update -y
#install apache server and mysql client
yum install -y httpd
yum install -y mysql


# first enable php7.xx from  amazon-linux-extra and install it

amazon-linux-extras enable php7.4
yum clean metadata
yum install -y php php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip,imap,devel}

systemctl start  httpd
systemctl start mysqld

# Download Novinano
cd /var/www/html
wget https://github.com/mplesha/NoviNano/releases/download/v1.0/20180706_novinano_ts_976c110733e7eff58704180706072907_archive.zip
wget https://github.com/mplesha/NoviNano/releases/download/v1.0/20180706_novinano_ts_976c110733e7eff58704180706072907_installer.php
mv *_installer.php installer.php

# Change permission of /var/www/html/
chown -R ec2-user:apache /var/www/html
chmod -R 774 /var/www/html

# Make apache and mysql to autostart and restart apache
systemctl enable  httpd.service
systemctl restart httpd.service
