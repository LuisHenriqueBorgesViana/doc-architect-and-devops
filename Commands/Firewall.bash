----------------------------------------------------------------------------------------------------------------------
# Check and Alter Status on Firewall:

sudo ufw status verbose
sudo ufw status numbered
sudo ufw status
sudo ufw enable
sudo ufw disable

----------------------------------------------------------------------------------------------------------------------
# Open Port on Firewall:

sudo ufw allow 22/tcp
sudo ufw allow from 168.197.159.173
sudo ufw allow proto tcp from 168.197.159.173 to any port 5432
sudo ufw allow proto tcp from 168.197.159.173 to 177.106.78.129 port 22

----------------------------------------------------------------------------------------------------------------------
# Delete Rule the Firewall:

sudo ufw status numbered
sudo ufw delete 1

----------------------------------------------------------------------------------------------------------------------