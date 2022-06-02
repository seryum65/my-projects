
sed -i "s/ec2-private_ip/$(grep -i "PrivateIpAddress" info.json | head -n1 | cut -d'"' -f4)/g" terraform.tf

