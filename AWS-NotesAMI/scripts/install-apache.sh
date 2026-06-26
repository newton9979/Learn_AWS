```bash
#!/bin/bash

##############################################################################
# AWS Golden AMI Setup Script
# Author: Newton
# Purpose: Prepare Amazon Linux for Golden AMI Creation
##############################################################################

echo "================================================="
echo " AWS Golden AMI Setup Started"
[2;2R[3;1R[>77;30801;0c]10;rgb:bfbf/bfbf/bfbf]11;rgb:0000/0000/0000echo "================================================="

# Verify Root User
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or use sudo."
  exit 1
fi

# Update OS
echo "Updating Operating System..."

dnf update -y || yum update -y

# Install Required Packages
echo "Installing Packages..."

dnf install -y httpd tree zip unzip curl || \
yum install -y httpd tree zip unzip curl

# Get Public IP
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

if [ -z "$PUBLIC_IP" ]; then
    PUBLIC_IP=$(hostname -I | awk '{print $1}')
fi

ACCESS_URL="http://${PUBLIC_IP}"

# Enable Apache
echo "Configuring Apache..."

systemctl enable httpd
systemctl start httpd

# Create Sample Website
echo "Creating Demo Website..."

cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
<title>AWS Golden AMI Demo</title>
<style>
body {
    font-family: Arial, sans-serif;
    text-align: center;
    margin-top: 100px;
}
h1 {
    color: green;
}
.card {
    border: 1px solid #ddd;
    padding: 20px;
    width: 60%;
    margin: auto;
    border-radius: 10px;
}
</style>
</head>
<body>

<div class="card">

<h1>🚀 AWS Golden AMI Demo</h1>

<h2>Apache Web Server is Running</h2>

<p>This server was configured automatically using a Golden AMI setup script.</p>

<p><b>Server URL:</b> <a href="${ACCESS_URL}">${ACCESS_URL}</a></p>

<p><b>Hostname:</b> <span id="host"></span></p>

<p><b>Date:</b> <span id="date"></span></p>

</div>

<script>
document.getElementById("host").innerText = window.location.hostname;
document.getElementById("date").innerText = new Date();
</script>

</body>
</html>
EOF

chmod 644 /var/www/html/index.html

# Create Users
echo "Creating Linux Users..."

id devopsuser1 &>/dev/null || useradd devopsuser1
id devopsuser2 &>/dev/null || useradd devopsuser2

# Add sudo access
usermod -aG wheel devopsuser1

# Enable SSH Password Authentication
echo "Configuring SSH..."

cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

grep -q "^PasswordAuthentication yes" /etc/ssh/sshd_config || \
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

grep -q "^PermitRootLogin no" /etc/ssh/sshd_config || \
echo "PermitRootLogin no" >> /etc/ssh/sshd_config

systemctl restart sshd

# Verification
echo ""
echo "================================================="
echo " Verification"
echo "================================================="

echo "Apache Status:"
systemctl is-active httpd

echo ""
echo "Installed Packages:"
rpm -q httpd tree zip unzip curl

echo ""
echo "Users Created:"
id devopsuser1
id devopsuser2

