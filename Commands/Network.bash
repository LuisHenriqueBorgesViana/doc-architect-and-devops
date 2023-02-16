----------------------------------------------------------------------------------------------------------------------
# Check all TCP/UDP Ports that are open in real time:

sudo apt install net-tools
sudo watch netstat -tulpn

----------------------------------------------------------------------------------------------------------------------
# Check all IP's configured on the Server:

sudo apt install net-tools
ifconfig

----------------------------------------------------------------------------------------------------------------------
# Closed the Open Port:

sudo kill $(sudo lsof -t -i:3000)

----------------------------------------------------------------------------------------------------------------------
# Disable IPv6:

nano /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1"
GRUB_CMDLINE_LINUX="ipv6.disable=1"
update-grub

sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.conf.lo.disable_ipv6=1

nano /etc/sysctl.conf 
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6 = 1

cat /proc/sys/net/ipv6/conf/all/disable_ipv6

reboot

----------------------------------------------------------------------------------------------------------------------
# Ping a specific port with the tool or ping ICMP:

sudo apt-get install nmap
sudo nping --tcp -p 80 10.0.0.1
sudo nping --tcp -p 10.0.0.1

----------------------------------------------------------------------------------------------------------------------
# Monitor Network Traffic In Detail:

sudo apt-get install nethogs
sudo nethogs

----------------------------------------------------------------------------------------------------------------------