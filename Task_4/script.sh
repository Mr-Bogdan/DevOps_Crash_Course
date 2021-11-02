#!/bin/bash
apt -y update
apt -y install httpd

cat <<EOF > /var/www/html/index.html
<html>
<body bgcolor="black">
<h2><font color="gold">Build by Power of Terraform <font color="red"> v0.12</font></h2><br><p>
<b>by Bohdan Marti</b>
</body>
</html>
EOF

sudo service httpd start
chkconfig httpd on
